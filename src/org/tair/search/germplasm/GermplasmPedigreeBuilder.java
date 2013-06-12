/**
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.germplasm;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.jboss.logging.Logger;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;


/**
 * <p>
 * Builds the Germplasm_Pedigree_wrk table, a working table that represents
 * germplasms based on a hierarchical pedigree along with their species variant
 * id and names.
 * </p>
 * <p>
 * The working table contains these columns:
 * <ul>
 * <li>germplasm id</li>
 * <li>taxon id</li>
 * <li>species variant id</li>
 * <li>base name</li>
 * <li>abbrev name</li>
 * </ul>
 * </p>
 * <p>
 * The process goes through these steps:
 * <ol>
 * <li>Truncate the build table Germplasm_Pedigree_build.</li>
 * <li>Query the root germplasms (germplasms linked to a species variant).</li>
 * <li>Query the species variant information for lookup.</li>
 * <li>For each root,
 * <ol>
 * <li>Fetch the germplasm id, taxon id, and species variant id into a DTO.</li>
 * <li>Set the species variant base and abbrev names from the lookup.</li>
 * <li>Insert the root and its children (recursively).</li>
 * </ol>
 * <li>Commit the changes to the build table.</li>
 * <li>Delete the rows in the work table.</li>
 * <li>Insert the DISTINCT rows from the build table into the work table.</li>
 * <li>Commit the work table.</li>
 * <li>Update the table statistics for the work table.</li>
 * </ol>
 * </p>
 * 
 * @author Robert J. Muller
 */
public class GermplasmPedigreeBuilder {
  /** Log4j logger for this class */
  private static final Logger logger =
    Logger.getLogger(GermplasmPedigreeBuilder.class);

  /** The parent-child pedigree for all active germplasms */
  private static final Map<BigInteger, List<BigInteger>> pedigree =
    new HashMap<BigInteger, List<BigInteger>>();

  /**
   * Delete all the rows from the build table.
   */
  private static final String CLEAN_BUILD_SQL =
    "DELETE FROM Germplasm_Pedigree_build";

  /**
   * Delete all the rows from the work table.
   */
  private static final String CLEAN_WORK_SQL =
    "DELETE FROM Germplasm_Pedigree_wrk";

  /**
   * <p>
   * Delete the "duplicate" rows that have the same germplasm_id and taxon_id
   * but nulls for species variant data. These rows are child rows generated for
   * obsolete species variant parents or something like that. The rows that have
   * a species variant should take precedence. There are valid rows with the
   * same germplasm id that have a null species variant id but that have a
   * different taxon id.
   * </p>
   * <p>
   * The SQL statement deletes rows from Germplasm_Pedigree_build that have a
   * null species variant id and that have a germplasm and taxon id that is also
   * present in another row with a non-null species variant id. The nested
   * select must appear twice, once each for germplasm id and taxon id, because
   * the IN clause in Sybase and ANSI SQL can only contain one column, but the
   * two ids are necessary to identify a unique entry. Each nested select
   * queries the appropriate id from the build table where the species variant
   * id is null and there is another rows with a non-null species variant id but
   * the same germplasm and taxon id. The result of this query is then grouped
   * on germplasm_id and taxon id to ensure that there is a unique row for each
   * combination across both the subqueries.
   * </p>
   */
  private static final String CLEAN_WORK_NULLS_SQL =
    "DELETE Germplasm_Pedigree_build "
        + "WHERE species_variant_id IS NULL AND "
        + "      germplasm_id IN (SELECT w1.germplasm_id "
        + "                         FROM Germplasm_Pedigree_build w1 "
        + "                        WHERE species_variant_id IS NULL AND "
        + "                              EXISTS (SELECT germplasm_id "
        + "                                        FROM Germplasm_Pedigree_build w2 "
        + "                                       WHERE species_variant_id IS NOT NULL AND "
        + "                                             germplasm_id = w1.germplasm_id AND "
        + "                                             taxon_id = w1.taxon_id) "
        + "                        GROUP BY w1.germplasm_id, w1.taxon_id) AND "
        + "      taxon_id IN (SELECT w3.taxon_id "
        + "                     FROM Germplasm_Pedigree_build w3 "
        + "                    WHERE species_variant_id IS NULL AND "
        + "                          EXISTS (SELECT germplasm_id "
        + "                                    FROM Germplasm_Pedigree_build w4 "
        + "                                   WHERE species_variant_id IS NOT NULL AND "
        + "                                         germplasm_id = w3.germplasm_id AND "
        + "                                         taxon_id = w3.taxon_id) "
        + "                    GROUP BY w3.germplasm_id, w3.taxon_id)";

  /**
   * Query all active germplasms that have a species variant id OR a taxon id.
   * The query join excludes species variants that are obsolete, and the outer
   * join ensures that active germplasms that link to obsolete species variants
   * appear in the result if they have a taxon id; those germplasms will have a
   * null species variant id in the result.
   */
  private static final String ROOTS_SQL =
    "SELECT g.germplasm_id, s.species_variant_id, g.taxon_id FROM Germplasm g LEFT JOIN (SELECT species_variant_id FROM SpeciesVariant WHERE is_obsolete = 'F') s ON g.species_variant_id = s.species_variant_id WHERE (g.species_variant_id IS NOT NULL OR g.taxon_id IS NOT NULL) AND g.is_obsolete = 'F'";

  /**
   * Query all child germplasms of a specified parent as represented in the
   * Pedigree tree table. The child germplasm must be active but need not have a
   * species variant id or taxon id, as these are set from the root parent
   * germplasm.
   */
  private static final String CHILD_SQL =
    "SELECT p.parent_germplasm_id, p.child_germplasm_id FROM Germplasm g JOIN Pedigree p ON g.germplasm_id = p.child_germplasm_id WHERE g.is_obsolete = 'F' ORDER BY 1, 2";

  /**
   * Query all active species variants with non-null base and abbrev names.
   */
  private static final String SV_SQL =
    "SELECT DISTINCT s.species_variant_id, s.base_name, s.abbrev_name FROM Germplasm g JOIN SpeciesVariant s ON g.species_variant_id = s.species_variant_id WHERE s.is_obsolete = 'F' AND s.base_name IS NOT NULL AND s.abbrev_name IS NOT NULL";

  /**
   * Insert a Germplasm_Pedigree row into the build table.
   */
  private static final String INSERT_BUILD_SQL =
    "INSERT /*+ APPEND */ INTO Germplasm_Pedigree_build (germplasm_id, taxon_id, species_variant_id, base_name, abbrev_name) VALUES (?, ?, ?, ?, ?)";

  /**
   * Insert all Germplasm_Pedigree rows from the build table into the work
   * table.
   */
  private static final String INSERT_WORK_SQL =
    "INSERT /*+ APPEND */ INTO Germplasm_Pedigree_wrk (germplasm_id, taxon_id, species_variant_id, base_name, abbrev_name) SELECT DISTINCT germplasm_id, taxon_id, species_variant_id, base_name, abbrev_name FROM Germplasm_Pedigree_build";

  /** Number of inserts to do in a single batch */
  private static final int BATCH_SIZE = 20000;

  /**
   * The current count of inserts in the statement, reset to zero after each
   * batch execution
   */
  private static int batchCount = 0;

  private static int totalCount = 0;

  /**
   * Build the table.
   * 
   * @throws SQLException when there is a problem querying or updating the
   *           database
   */
  public static void build() {
    DBconnection dbConnection = null;
    Connection connection = null;
    try {
      dbConnection = DBWriteManager.getInstance().get_connection();
      connection = dbConnection.getJdbcConnection();
      connection.setAutoCommit(false);
      long time = System.currentTimeMillis();
      logger.info("Building Germplasm_Pedigree_wrk table");
      // Make sure the build table is empty. This is a complete transaction.
      cleanBuildTable(connection);
      // Build the in-memory pedigree.
      buildPedigree(connection);
      // Process the germplasm-pedigree rows into the build table. This is a
      // complete set of transactions, one per batch insert.
      processRoots(connection);
      // Clean the duplicate null-species-variant rows out. This is a
      // transaction.
      cleanNulls(connection);
      // Copy the build rows into the work table, replacing what's there. This
      // is a complete transaction.
      copyBuildtoWork(connection);
      time = ((System.currentTimeMillis() - time) / 1000) / 60;
      logger.info("Built Germplasm_Pedigree_wrk table in " + time + " minutes.");
      // Clean out the build table to optimize space.
      cleanBuildTable(connection);
      logger.info("Germplasm_Pedigree_wrk table ready for use");
    } catch (SQLException e) {
      throw new RuntimeException("Error getting connection", e);
    } finally {
      if (dbConnection != null) {
        dbConnection.releaseResources();
        try {
          connection.close();
        } catch (SQLException e) {
          // Log and ignore
          logger.error("Could not close connection", e);
        }
      }
    }
  }

  /**
   * Build the pedigree, which is a complete set of children for each active
   * germplasm that has children. This in-memory map allows the lookup of all
   * children recursively for a given root germplasm. It is in memory because
   * the prior implementation that issued a SQL statement for each child was far
   * too slow. The method throws a runtime exception if there is a SQL problem
   * or if there is an array initialization problem.
   * 
   * @param connection the JDBC connection
   */
  private static void buildPedigree(Connection connection) {
    try {
      PreparedStatement stmt = connection.prepareStatement(CHILD_SQL);
      stmt.setFetchSize(10000);
      ResultSet rs = stmt.executeQuery();
      BigInteger lastParent = null;
      List<BigInteger> children = null;
      while (rs.next()) {
        BigInteger parent =
          rs.getBigDecimal("parent_germplasm_id").toBigInteger();
        BigInteger child =
          rs.getBigDecimal("child_germplasm_id").toBigInteger();
        if (lastParent == null || !lastParent.equals(parent)) {
          // First one or change, set last parent
          lastParent = parent;
          // Add the parent and a new child array to the map
          children = new ArrayList<BigInteger>();
          children.add(child);
          pedigree.put(lastParent, children);
        } else {
          // Same parent, just add new child to map
          if (children != null) {
            children.add(child);
          } else {
            // Should never happen
            logger.error("Pedigree children array not set but parent already processed");
            throw new RuntimeException("Error processing child for pedigree, no children array");
          }
        }
      }
    } catch (SQLException e) {
      logger.error("Error building pedigree in memory: " + e.getMessage(), e);
      throw new RuntimeException("Could not build pedigree in memory, stopping");
    }

  }

  /**
   * In a single transaction, clean out the current work table and replace the
   * rows with the rows in the build table, then commit the transaction.
   * 
   * @param connection the SQL connection
   * @throws SQLException when there is a problem with cleaning the work table
   *           or copying the rows from the build table.
   */
  private static void copyBuildtoWork(Connection connection)
      throws SQLException {
    try {
      cleanWorkTable(connection);
      copyBuildRows(connection);
    } finally {
      if (connection != null) {
        connection.commit();
      }
    }
  }

  /**
   * Clean out the rows in the work table. If this fails, the method rolls back
   * the transaction and throws a runtime exception.
   * 
   * @param connection the SQL connection
   * @throws SQLException when there is a problem closing the statement
   */
  private static void cleanWorkTable(Connection connection) throws SQLException {
    Statement delete = null;
    try {
      delete = connection.createStatement();
      logger.debug("Cleaning work table");
      delete.execute(CLEAN_WORK_SQL);
      logger.debug("Work table cleaned");
    } catch (Exception e) {
      // Log error and throw a runtime exception to fail the program.
      logger.fatal("Could not clean work table Germplasm_Pedigree_wrk", e);
      if (connection != null) {
        connection.rollback();
      }
      throw new RuntimeException("Could not clean work table");
    } finally {
      if (delete != null) {
        delete.close();
      }
    }
  }

  /**
   * Copy the rows from the build table to the work table. If this fails, the
   * method rols back the transaction and throws a runtime exception.
   * 
   * @param connection the SQL connection
   * @throws SQLException when there is a problem closing the statement
   */
  private static void copyBuildRows(Connection connection) throws SQLException {
    Statement insert = null;
    try {
      insert = connection.createStatement();
      logger.debug("Copying build to work");
      insert.execute(INSERT_WORK_SQL);
      logger.debug("Build copied to work");
    } catch (Exception e) {
      // Log error and throw a runtime exception to fail the program.
      logger.fatal("Could not copy build rows to work table Germplasm_Pedigree_wrk",
                   e);
      if (connection != null) {
        connection.rollback();
      }
      throw new RuntimeException("Could not copy build table rows to work table");
    } finally {
      if (insert != null) {
        insert.close();
      }
    }
  }

  /**
   * After creating distinct rows in the build table, many of the rows are
   * duplicate germplasms that have null species variants for one row while
   * there is one or more valid species variants for one or more other rows
   * (including rows with a different taxon id but the a null species variant).
   * This method runs a SQL statement that deletes all such rows from the build
   * table.
   * 
   * @param connection the SQL connection
   * @throws SQLException when there is a problem closing the statement
   */
  private static void cleanNulls(Connection connection) throws SQLException {
    Statement delete = null;
    try {
      delete = connection.createStatement();
      logger.debug("Cleaning out null duplicates");
      delete.execute(CLEAN_WORK_NULLS_SQL);
      logger.debug("Duplicates cleaned");
    } catch (Exception e) {
      // Log error and throw a runtime exception to fail the program.
      logger.fatal("Could not clean null species variants from the work table Germplasm_Pedigree_wrk",
                   e);
      if (connection != null) {
        connection.rollback();
      }
      throw new RuntimeException("Could not clean nulls from work table");
    } finally {
      // Commit the transaction.
      if (connection != null) {
        connection.commit();
      }
      if (delete != null) {
        delete.close();
      }
    }
  }

  /**
   * Clean the build table by deleting all the rows and committing the
   * transaction. If the delete fails, the method rolls back the transaction and
   * throws a runtime exception.
   * 
   * @param connection the SQL connection
   * @throws SQLException when the commit or close fails
   */
  private static void cleanBuildTable(Connection connection)
      throws SQLException {
    PreparedStatement statement = null;
    try {
      statement = connection.prepareStatement(CLEAN_BUILD_SQL);
      logger.debug("Cleaning out build table");
      statement.execute();
      logger.debug("Build table cleaned");
    } catch (SQLException e) {
      // log and throw RuntimeException to fail program
      logger.fatal("Failed to clean out build table", e);
      if (connection != null) {
        connection.rollback();
      }
      throw new RuntimeException("Failure while cleaning build table");
    } finally {
      if (connection != null) {
        connection.commit();
      }
      if (statement != null) {
        statement.close();
      }
    }
  }

  /**
   * Process the root germplasms.
   * 
   * @param connection the SQL connection
   * @throws SQLException when there is a database error
   */
  private static void processRoots(Connection connection) throws SQLException {
    Map<BigInteger, SpeciesVariantNames> svMap = getSpeciesVariants(connection);
    PreparedStatement statement = null;
    PreparedStatement insert = null;
    try {
      statement = connection.prepareStatement(ROOTS_SQL);
      statement.setFetchSize(5000);
      logger.debug("Querying roots");
      ResultSet set = statement.executeQuery();
      insert = connection.prepareStatement(INSERT_BUILD_SQL);
      int i = 0;
      while (set.next()) {
        BigInteger germplasmId =
          set.getBigDecimal("germplasm_id").toBigInteger();
        BigDecimal decTaxonId = set.getBigDecimal("taxon_id");
        BigInteger taxonId = null;
        if (!set.wasNull() && decTaxonId != null) {
          taxonId = decTaxonId.toBigInteger();
        }
        BigDecimal decSVId = set.getBigDecimal("species_variant_id");
        BigInteger speciesVariantId = null;
        if (!set.wasNull() && decSVId != null) {
          speciesVariantId = decSVId.toBigInteger();
        }
        GermplasmPedigree gp = null;
        if (speciesVariantId != null) {
          SpeciesVariantNames names = svMap.get(speciesVariantId);
          // Should have names if there is a species variant for the id.
          if (names == null) {
            // Log the fact and go to the next root.
            logger.info("Root germplasm "
                        + germplasmId
                        + " with species variant id "
                        + speciesVariantId
                        + " has no corresponding species variant");
            continue;
          }
          gp =
            new GermplasmPedigree(germplasmId,
                                  taxonId,
                                  speciesVariantId,
                                  names.getBase(),
                                  names.getAbbrev());
        } else {
          gp = new GermplasmPedigree(germplasmId, taxonId, null, null, null);
        }
        insertNodeAndChildren(gp, connection, insert);
        i++;
      }
      logger.info("Queried " + i + " root germplasms");
    } catch (SQLException e) {
      // Log the exception and throw a RuntimeException to fail the program.
      logger.error("Error processing root germplasm", e);
      connection.rollback();
      throw new RuntimeException("Failed to process root germplasms");
    } finally {
      // Insert any remaining statements in the batch.
      if (batchCount > 0 && insert != null) {
        logger.debug("Executing final batch");
        insert.executeBatch();
        resetBatchCount();
        connection.commit();
        logger.info("Created " + totalCount + " rows in build table");
        insert.close();
      }
      if (statement != null) {
        statement.close();
      }
    }
  }

  /**
   * Insert a germplasm-pedigree node and its child nodes into the database. The
   * method first inserts the incoming germplasm-pedigree, then processes the
   * children of the germplasm. The method uses an input INSERT statement
   * already prepared in the root processing; this allows the statement to
   * accumulate a batch of statements rather than processing them one at a time.
   * Batching dramatically improves the insert performance.
   * 
   * @param gp the germplasm-pedigree to insert
   * @param connection the SQL connection
   * @param statement the INSERT statement being batched
   */
  private static void insertNodeAndChildren(GermplasmPedigree gp,
                                            Connection connection,
                                            PreparedStatement statement) {
    // Insert the incoming germplasm.
    try {
      BigDecimal germplasmId = new BigDecimal(gp.getGermplasmId());
      BigDecimal taxonId =
        gp.getTaxonId() != null ? new BigDecimal(gp.getTaxonId()) : null;
      BigDecimal speciesVariantId =
        gp.getSpeciesVariantId() != null ? new BigDecimal(gp.getSpeciesVariantId())
            : null;
      String base = gp.getBaseName();
      String abbrev = gp.getAbbrevName();
      statement.setBigDecimal(1, germplasmId);
      if (taxonId != null) {
        statement.setBigDecimal(2, taxonId);
      } else {
        statement.setNull(2, java.sql.Types.NUMERIC);
      }
      if (speciesVariantId != null) {
        statement.setBigDecimal(3, speciesVariantId);
      } else {
        statement.setNull(3, java.sql.Types.NUMERIC);
      }
      statement.setString(4, base);
      statement.setString(5, abbrev);
      statement.addBatch();
      batchCount++;
      if (batchCount == BATCH_SIZE) {
        // Reached batch size, execute the batch.
        try {
          logger.debug("Executing batch insert");
          statement.executeBatch();
          logger.debug("Completed batch insert, total "
                       + (totalCount + batchCount));
          // Reset the counter for the next batch.
          resetBatchCount();
        } catch (BatchUpdateException e) {
          // TODO batch error processing if needed
          // For now, log and continue with the next batch.
          logger.error("Batch insert into Germplasm_Pedigree_build failed", e);
        } finally {
          // Commit the batch.
          if (connection != null) {
            connection.commit();
          }
        }
      }
      processChildren(gp, connection, statement);
    } catch (SQLException e) {
      // Log the error and continue
      logger.warn("Exception while inserting a germplasm-pedigree node", e);
    }
  }

  /**
   * Reset the batch count to zero. This also incorporates the current batch
   * count into the total count.
   */
  private static void resetBatchCount() {
    totalCount += batchCount;
    batchCount = 0;
  }

  /**
   * Process the children of a specified germplasm, inserting them by calling
   * the insertNodeAndChildren method. The child has a new germplasm id but the
   * same taxon id, species variant id, base name, and abbrev name as the parent
   * germplasm. Because this method calls insertNodeAndChildren, which calls
   * this method, the method recurses depth first down the tree of germplasms.
   * 
   * @param parentGermplasm the parent germplasm for which to process children
   * @param connection the JDBC connection
   * @param statement the INSERT statement being batched
   */
  private static void processChildren(GermplasmPedigree parentGermplasm,
                                      Connection connection,
                                      PreparedStatement statement) {
    // Get the children of the specified germplasm from the pedigree.
    List<BigInteger> children = pedigree.get(parentGermplasm.getGermplasmId());
    if (children != null) {
      for (BigInteger childId : children) {
        GermplasmPedigree childGp =
          new GermplasmPedigree(childId,
                                parentGermplasm.getTaxonId(),
                                parentGermplasm.getSpeciesVariantId(),
                                parentGermplasm.getBaseName(),
                                parentGermplasm.getAbbrevName());
        insertNodeAndChildren(childGp, connection, statement);
      }
    }
  }

  /**
   * Get all the species variants that link to a germplasm and put them into a
   * map that acts as a lookup table for the species variant names.
   * 
   * @param connection the SQL connection
   * @return a <code>Map</code> of <code>SpeciesVariantNames</code> objects
   *         keyed on <code>BigInteger</code> species variant id
   */
  private static Map<BigInteger, SpeciesVariantNames> getSpeciesVariants(Connection connection) {
    Map<BigInteger, SpeciesVariantNames> map =
      new TreeMap<BigInteger, SpeciesVariantNames>();
    PreparedStatement statement = null;
    try {
      statement = connection.prepareStatement(SV_SQL);
      statement.setFetchSize(100);
      logger.debug("Querying species variants");
      ResultSet rs = statement.executeQuery();
      while (rs.next()) {
        SpeciesVariantNames names =
          new SpeciesVariantNames(rs.getString("base_name"),
                                  rs.getString("abbrev_name"));
        map.put(rs.getBigDecimal("species_variant_id").toBigInteger(), names);
      }
      logger.debug("Queried " + map.size() + " species variants");
    } catch (SQLException e) {
      // Log the error and throw a runtime exception to fail the build.
      logger.error("Error querying the species variants", e);
      throw new RuntimeException("Failed while querying species variants");
    } finally {
      if (statement != null) {
        try {
          statement.close();
        } catch (SQLException e) {
          // Log the error and return a runtime exception to fail the build.
          logger.error("Error closing the species variant SQL statement", e);
          throw new RuntimeException("Failed while querying species variants");
        }
      }
    }
    return map;
  }

  /**
   * The main program that runs the builder.
   * 
   * @param args not used
   */
  public static void main(String[] args) {
    try {
      build();
    } catch (Exception e) {
      // Log any runtime errors here.
      logger.error("Runtime error building Germplasm_Pedigree_wrk table", e);
    }
  }
}
