/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import java.math.BigDecimal;
import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.utilities.WebApp;


/**
 * <p>
 * A Business Delegate proxy for managing the persistent ShortestPath data,
 * which represents the TAIR ontologies DAG (keywords and term-relationships) in
 * expanded form as a set of edges from each node to all of its parents up the
 * DAG branch. This data lets SQL joins access semantically related keywords in
 * the tree by querying all the keywords "under" a single parent, for example;
 * there is no need to walk the tree through multiple queries or in memory. The
 * process assumes the insert is into a build table, which then gets copied into
 * a cleared work table. This strategy reduces the amount of time the work table
 * is unavailable to the time required by the internal insert into the work
 * table.
 * </p>
 * <p>
 * This class extracts all the methods for dealing with the edges out of the
 * work table builder (ShorttestPathBuilder) to make them testable through
 * JUnit.
 * </p>
 * <p>
 * The business delegate does not encapsulate transactions in this case;
 * instead, most of the methods require a connection as an argument. The client
 * (usually ShortestPathBuilder) can thus the transaction. This strategy permits
 * testing of the individual process steps through JUnit. For consistency,
 * however, the delegate makes available a method, insertShortestPath, that
 * manages a complete transaction and does the complete build-and-insert
 * process.
 * </p>
 * 
 * @author Robert J. Muller
 * 
 * @see ShortestPathBuilder
 */
public class ShortestPathDelegate {
  /** log4j logger */
  private static final Logger logger =
    Logger.getLogger(ShortestPathDelegate.class);

  /** the number of inserts in a batch insert */
  private static final int BATCH_SIZE = 5000;

  /** insert an edge into the table */
  private static final String INSERT_SQL =
    "INSERT INTO ShortestPath_bld (child_term_id, parent_term_id) VALUES (?, ?)";

  /** clear all rows from the build table */
  private static final String DELETE_BLD_SQL = "DELETE FROM ShortestPath_bld";

  /** clear all rows from the work table */
  private static final String DELETE_WRK_SQL = "DELETE FROM ShortestPath";

  /** copy edges from build to work table */
  private static final String COPY_SQL =
    "INSERT INTO ShortestPath(child_term_id, parent_term_id) SELECT child_term_id, parent_term_id FROM ShortestPath_bld";

  /**
   * Insert the shortest path edges into the target database.
   */
  public static void insertShortestPath() {
    DBconnection connection = null;
    try {
      Set<DagKeywordEdge> edges = computeShortestPath();
      // Open pooled write JDBC connection
      connection =
        new DBconnection(WebApp.getProperty("DRIVER_NAME"),
                         WebApp.getProperty("CONNECTION_URL"),
                         WebApp.getProperty("WRITE_CONNECTION_NAME"),
                         WebApp.getProperty("WRITE_CONNECTION_PASSWORD"));
      connection.autoCommit(false);
      logger.debug("Building ShortestPath work table using "
                   + WebApp.getProperty("WRITE_CONNECTION_NAME")
                   + " through JDBC at " + WebApp.getProperty("CONNECTION_URL"));
      deleteBuildTable(connection);
      insertEdges(connection, edges);
      deleteWorkTable(connection);
      copyToWorkTable(connection);
      connection.commit();
    } catch (SQLException e) {
      logger.error("SQL Error building ShortestPath: " + e.getMessage(), e);
      if (connection != null) {
        try {
          connection.rollback();
        } catch (SQLException e1) {
          logger.error("SQL Error rolling back shortest path inserts: "
                       + e.getMessage(), e);
        }
      }
      throw new RuntimeException("SQL Exception on inserting shortest path: "
                                 + e.getMessage());
    } finally {
      if (connection != null) {
        connection.releaseResources();
        Connection c = connection.getJdbcConnection();
        if (c != null) {
          try {
            // Close the connection to return it to the pool.
            c.close();
          } catch (SQLException e) {
            // Log and ignore
            logger.error("Error closing connection", e);
          }
        }
      }
    }
  }

  /**
   * Compute the set of edges that constitutes all possible paths between nodes.
   * 
   * @return a unique set of edges
   * @throws SQLException when there is a problem getting the DAG
   */
  public static Set<DagKeywordEdge> computeShortestPath() throws SQLException {
    Set<DagKeywordEdge> edges = new HashSet<DagKeywordEdge>();
    Set<DagKeywordComposite> parents = new HashSet<DagKeywordComposite>();

    logger.info("Computing shortest path");

    // Drive the DAG creation by iterating over the leaves of the DAG.
    for (DagKeywordLeaf leaf : KeywordDag.getLeaves()) {
      // For each leaf, compute the full sets of "shortest-path" edges.
      edges.addAll(leaf.getEdges(leaf, parents));
    }

    logger.info("Done.");

    return edges;
  }

  /**
   * Insert all the unique DAG edges into the ShortestPath_bld table. Use JDBC
   * batching for higher performance.
   * 
   * @param connection the JDBC/TAIR connection wrapper
   * @param edges the set of edges
   * @throws SQLException when there is an insert or batching error
   */
  public static void insertEdges(DBconnection connection,
                                 Set<DagKeywordEdge> edges) throws SQLException {
    PreparedStatement stmt = null;
    int[] codes = null;

    logger.info("Inserting path rows...");

    try {
      Connection c = connection.getJdbcConnection();
      stmt = c.prepareStatement(INSERT_SQL);
      int batchCounter = 0;
      int insertedCounter = 0;
      boolean allInserted = false;

      for (DagKeywordEdge edge : edges) {
        allInserted = false;
        BigDecimal childTermId = new BigDecimal(edge.getChild().keywordId);
        BigDecimal parentTermId = new BigDecimal(edge.getParent().keywordId);
        stmt.setBigDecimal(1, childTermId);
        stmt.setBigDecimal(2, parentTermId);
        stmt.addBatch();
        batchCounter++;
        insertedCounter++;
        if (batchCounter == BATCH_SIZE) {
          codes = stmt.executeBatch();
          // clear codes for next batch; exception happens if there's an error
          codes = null;
          batchCounter = 0;
          allInserted = true;
          logger.info("Inserted " + insertedCounter + " rows");
        }
      }

      // Check and insert final batch if there is one.
      if (!allInserted) {
        stmt.executeBatch();
        logger.info("Inserted total of " + insertedCounter + " rows");
      }
    } catch (BatchUpdateException e) {
      if (codes != null) {
        logger.info("Codes:");
        for (int i = 0; i < codes.length; i++) {
          if (codes[i] == -3) {
            // -3 is JDBC code for "batched row failed"
            logger.info("Code " + i + " in batch failed with code " + codes[i]);
          }
        }
      }
    } finally {
      if (stmt != null) {
        stmt.close();
      }
    }
  }

  /**
   * Delete the ShortestPath table's rows.
   * 
   * @param connection the JDBC/TAIR connection wrapper
   * @throws SQLException when there is a delete error in the database
   */
  public static void deleteWorkTable(DBconnection connection)
      throws SQLException {
    logger.info("Clearing work table...");
    connection.setQuery(DELETE_WRK_SQL);
    connection.executeUpdate();
    connection.releaseResources();
    logger.info("Cleared.");
  }

  /**
   * Delete the ShortestPath_bld table's rows.
   * 
   * @param connection the JDBC/TAIR connection wrapper
   * @throws SQLException when there is a delete error in the database
   */
  public static void deleteBuildTable(DBconnection connection)
      throws SQLException {
    logger.info("Clearing build table...");
    connection.setQuery(DELETE_BLD_SQL);
    connection.executeUpdate();
    connection.releaseResources();
    logger.info("Cleared.");
  }

  /**
   * Copy the contents of the ShortestPath_bld table to ShortestPath.
   * 
   * @param connection the JDBC/TAIR connection wrapper
   * @throws SQLException when there is an error inserting into the work table
   */
  public static void copyToWorkTable(DBconnection connection)
      throws SQLException {
    logger.info("Copying build table to work table...");
    connection.setQuery(COPY_SQL);
    connection.executeUpdate();
    connection.releaseResources();
    logger.info("Copied.");
  }
}
