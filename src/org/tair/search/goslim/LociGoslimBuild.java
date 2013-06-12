/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.goslim;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.utilities.WebApp;


/**
 * <p>
 * Populate the LociGoslim_wrk table.
 * </p>
 * <p>
 * The first step is to create rows in a temporary table with all keywords of
 * type ('proc', 'func'. 'comp') and the slim names associated to it. Slim names
 * are associated to a special set of high level keywords. To get the slim_name
 * for a given keyword it is necessary to first see if the keyword has a
 * slim_name associated to it directly as a non-null value in the slim_name
 * field for the keyword. If the slim_name value is null then the slim name must
 * be derived by traversing the hierarchy for the keyword until the first parent
 * with a non-null value for slim_name is found.
 * </p>
 * <p>
 * The next step is to load the LociGoslim_wrk table. There is a row for each
 * locus, its associated genes, those genes' associated keywords ( of the above
 * types ) that are "annotations" ( in the TairObjKeyEvidence table ) translated
 * into slim names.
 * </p>
 * <p>
 * This class depends on a global temporary table created in the Oracle
 * database:
 * 
 * <pre>
 * CREATE GLOBAL TEMPORARY TABLE KW_SLIM (kw_id NUMBER(12), slim_name VARCHAR2(100)) ON COMMIT DELETE ROWS;
 * </pre>
 * 
 * </p>
 */
public class LociGoslimBuild {

  private static final Logger logger = Logger.getLogger(LociGoslimBuild.class);

  // SQL statements

  private static final String QUERY_KEYWORDS_SQL =
    "SELECT keyword_id,slim_name,keyword_type_id from Keyword "
        + " WHERE keyword_type_id IN ( 'proc', 'func', 'comp' ) ";

  private static final String INSERT_TMP_SQL =
    " INSERT INTO KW_SLIM (kw_id, slim_name) VALUES (?, ?)";
  private static final String DELETE_SQL = "DELETE FROM LociGoslim_wrk";
  private static final String COUNT_TEMP_SQL =
    "SELECT COUNT(*) AS row_count FROM KW_SLIM";
  private static final String COUNT_WORK_SQL =
    "SELECT COUNT(*) AS row_count FROM LociGoslim_wrk";

  private static final String SLIM_QUERY_SQL =
    "SELECT tr.parent_term_id AS id, k.slim_name "
        + " FROM TermRelationship tr JOIN Keyword k ON tr.parent_term_id = k.keyword_id "
        + " WHERE tr.child_term_id = ? AND "
        + " k.keyword_type_id IN ('proc','comp','func')";

  private static final String TEMP_UPDATE_SQL =
    "UPDATE Kw_Slim SET slim_name = ? WHERE kw_id = (SELECT keyword_id FROM Keyword WHERE keyword = ?)";

  private static final String INSERT_LOCUS_SQL =
    " INSERT INTO LociGoslim_wrk"
        + " ( locus_id, locus_name, "
        + " gene_model_name, gene_tair_object_id, keyword_id, keyword, "
        + " keyword_go_id, relationship_type_id, category, slim_name, evidence_description_id, "
        + " evidence_with, reference_id, annotated_by_id, date_last_modified ) "
        + " SELECT l.locus_id AS locus_id "
        + ", l.name AS locus_name "
        + ", l.name AS gene_model_name "
        + ", l.tair_object_id AS gene_tair_object_id "
        + ", k1.keyword_id AS keyword_id "
        + ", k1.keyword AS keyword "
        + ", k1.extdb_id AS keyword_go_id "
        + ", toke.relationship_type_id "
        + ", k1.keyword_type_id AS category "
        + ", tt.slim_name AS slim_name "
        + ", toke.evidence_description_id AS evidence_description_id "
        + ", toke.evidence_with AS evidence_with "
        + ", toke.reference_id AS reference_id "
        + ", toke.annotated_by_id AS annotated_by_id "
        + ", toke.date_last_modified AS date_last_modified "
        + " FROM Kw_Slim tt JOIN "
        + " Keyword k1 ON tt.kw_id = k1.keyword_id JOIN "
        + " TairObjKeyEvidence toke ON tt.kw_id = toke.keyword_id JOIN "
        + " RelationshipType rt ON toke.relationship_type_id = rt.relationship_type_id JOIN "
        + " Locus l ON toke.tair_object_id = l.tair_object_id "
        + " WHERE rt.relationshiptype_type not like '%not%' "
        + " AND k1.extdb_id IS NOT NULL ";

  private static final String INSERT_GENE_SQL =
    "INSERT INTO LociGoslim_wrk "
        + " ( locus_id, locus_name, "
        + " gene_tair_object_id, gene_model_name, keyword_id, keyword, "
        + " keyword_go_id, relationship_type_id, category, slim_name, evidence_description_id, "
        + " evidence_with, reference_id, annotated_by_id, date_last_modified ) "
        + " SELECT l.locus_id AS locus_id "
        + ", l.name AS locus_name "
        + ", g.tair_object_id AS gene_tair_object_id "
        + ", g.name AS gene_model_name "
        + ", k1.keyword_id AS keyword_id "
        + ", k1.keyword AS keyword "
        + ", k1.extdb_id AS keyword_go_id "
        + ", toke.relationship_type_id "
        + ", k1.keyword_type_id AS category "
        + ", tt.slim_name AS slim_name "
        + ", toke.evidence_description_id AS evidence_description_id "
        + ", toke.evidence_with AS evidence_with "
        + ", toke.reference_id AS reference_id "
        + ", toke.annotated_by_id AS annotated_by_id "
        + ", toke.date_last_modified AS date_last_modified "
        + " FROM Kw_Slim tt JOIN "
        + " Keyword k1 ON k1.keyword_id = tt.kw_id JOIN "
        + " TairObjKeyEvidence toke ON toke.keyword_id = tt.kw_id JOIN "
        + " RelationshipType rt ON toke.relationship_type_id = rt.relationship_type_id JOIN "
        + " Gene g ON g.tair_object_id = toke.tair_object_id JOIN "
        + " MapElement_Locus mel ON mel.map_element_id = g.map_element_id JOIN "
        + " Locus l ON l.locus_id = mel.locus_id "
        + " WHERE rt.relationshiptype_type not like '%not%' "
        + " AND k1.extdb_id IS NOT NULL";

  // Error messages

  private static final String ERR_MSG =
    "Could not build Loci Goslim work table";
  private static final String ROLLBACK_MSG =
    "Failed while rolling back transaction";
  private static final String COMMIT_MSG =
    "Failed while committing transaction";

  /**
   * Build the LociGoslim_wrk table. First build the temporary table, then
   * delete the current rows from LociGoSlim_wrk, then insert the new rows.
   * Since this all happens within a single transaction, the changes will not be
   * visible until commit.
   * 
   * @param connection the webwriter connection with which to build the table
   */
  public static void buildTable(DBconnection connection) {
    try {
      connection.remove_auto_commit_mode();
      insertTmpTblRows(connection);
      deleteLociGoslimRows(connection);
      insertLociGoslimRows(connection);
    } catch (SQLException e) {
      try {
        connection.rollback();
      } catch (SQLException e1) {
        // Failed while rolling back
        throw new RuntimeException(ROLLBACK_MSG, e);
      }
      throw new RuntimeException(ERR_MSG, e);
    } finally {
      if (connection != null)
        try {
          connection.commit();
        } catch (SQLException e) {
          // Failed while committing
          throw new RuntimeException(COMMIT_MSG, e);
        }
      connection.releaseResources();
    }
  }

  /**
   * Insert the keyword ids and corresponding slim names into the temporary
   * table.
   * 
   * @param conn the database connection
   * @throws SQLException
   */
  private static void insertTmpTblRows(DBconnection conn) throws SQLException {
    conn.setQuery(QUERY_KEYWORDS_SQL);
    ResultSet results = conn.getResultSet();
    Long keywordID = null;
    String slimName = null;
    Map<Long, Set<String>> allSlimNames = new HashMap<Long, Set<String>>();
    while (results.next()) {
      // term for which we want to find a corresponding slim name
      keywordID = new Long(results.getLong("keyword_id"));
      slimName = results.getString("slim_name");
      findSlimNames(conn, allSlimNames, keywordID, slimName);
    }

    Set<String> slimNames;
    Iterator<Long> kwIter = allSlimNames.keySet().iterator();
    Iterator<String> slimIter;
    while (kwIter.hasNext()) {
      keywordID = kwIter.next();
      slimNames = allSlimNames.get(keywordID);
      // only allow a root term to be in the set if
      // it is the only member of the set
      if (slimNames.size() > 1) {
        slimNames.remove("other cellular components");
        slimNames.remove("other molecular functions");
        slimNames.remove("other biological processes");
      }
      slimIter = slimNames.iterator();
      while (slimIter.hasNext())
        insertRow(conn, keywordID, (String)slimIter.next());
    }

    conn.setQuery(TEMP_UPDATE_SQL);
    conn.setQueryVariable(1, "unknown molecular functions");
    conn.setQueryVariable(2, "molecular_function");
    conn.executeUpdate();
    conn.setQueryVariable(1, "unknown biological processes");
    conn.setQueryVariable(2, "biological_process");
    conn.executeUpdate();
    conn.setQueryVariable(1, "unknown cellular components");
    conn.setQueryVariable(2, "cellular_component");
    conn.executeUpdate();
    printTempRows(conn);
  }

  private static void printTempRows(DBconnection conn) throws SQLException {
    ResultSet results = null;
    try {
      conn.setQuery(COUNT_TEMP_SQL);
      results = conn.getResultSet();
      if (results.next()) {
        logger.debug("Rows in temp table: " + results.getLong("row_count"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      results.close();
    }
  }

  private static void printWorkRows(DBconnection conn) throws SQLException {
    ResultSet results = null;
    try {
      conn.setQuery(COUNT_WORK_SQL);
      results = conn.getResultSet();
      if (results.next()) {
        logger.debug("Rows in work table: " + results.getLong("row_count"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      results.close();
    }
  }

  /**
   * Find the slim names given the keyword id.
   * 
   * @param conn the connection to the database
   * @param allSlimNames the current map of slim names keyed by keyword id
   * @param keywordID the keyword id to find
   * @param slimName the slim name to use; if null, then query parents
   * @return the set of slim names for the keyword
   * @throws SQLException when there is a problem with the query
   */
  private static Set<String> findSlimNames(DBconnection conn,
                                           Map<Long, Set<String>> allSlimNames,
                                           Long keywordID, String slimName)
      throws SQLException {
    Set<String> slimNames = null;

    if (allSlimNames.containsKey(keywordID)) {
      // Already have this keyword in the complete map of sets
      slimNames = allSlimNames.get(keywordID);
    } else {
      // New keyword
      slimNames = new HashSet<String>();
      if (slimName != null) {
        slimNames.add(slimName);
      } else {
        Map<Long, String> slimNameMap = querySlimNames(conn, keywordID);

        for (Long termId : slimNameMap.keySet()) {
          slimNames.addAll(findSlimNames(conn,
                                         allSlimNames,
                                         termId,
                                         slimNameMap.get(termId)));
        }
      }

      allSlimNames.put(keywordID, slimNames);
    }

    return slimNames;
  }

  /**
   * Query the parent keywords for a specified child GO keyword and return the
   * result as a map of SLIM names keyed on the term ids for the parent keywords
   * 
   * @param conn the database connection
   * @param keywordID the unique identifier for the child term id
   * @return a Map of String slim names keyed on Long term ids
   * @throws SQLException when there is a database problem
   */
  private static Map<Long, String> querySlimNames(DBconnection conn,
                                                  Long keywordID)
      throws SQLException {
    conn.setQuery(SLIM_QUERY_SQL);
    conn.setQueryVariable(keywordID);
    ResultSet results = conn.getResultSet();
    Map<Long, String> slimNames = new HashMap<Long, String>();
    while (results.next()) {
      slimNames.put(results.getLong("id"), results.getString("slim_name"));
    }
    // Close everything here to avoid max cursors error
    conn.releaseResources();
    return slimNames;
  }

  /**
   * Insert a row into the temporary table.
   * 
   * @param conn the database connection
   * @param keywordId the keyword identifier for the keyword
   * @param slimName the slim name for the keyword
   * @throws SQLException when there is a problem with the insertion
   */
  private static void insertRow(DBconnection conn, Long keywordId,
                                String slimName) throws SQLException {
    // insert keyword_id, slim_name
    if (conn != null) {
      if (keywordId != null && slimName != null) {
        conn.setQuery(INSERT_TMP_SQL);
        conn.setQueryVariable(1, keywordId);
        conn.setQueryVariable(2, slimName);
        conn.executeUpdate();
        // Close everything here to avoid max cursors error.
        conn.releaseResources();
      }
    }
  }

  /**
   * Insert the gene and locus rows for the work table by selecting from the
   * temporary table.
   * 
   * @param conn the database connection
   * @throws SQLException when there is a database error
   */
  private static void insertLociGoslimRows(DBconnection conn)
      throws SQLException {
    conn.setQuery(INSERT_GENE_SQL);
    conn.executeUpdate();
    printWorkRows(conn);
    conn.setQuery(INSERT_LOCUS_SQL);
    conn.executeUpdate();
    printWorkRows(conn);

  }

  /**
   * Delete the contents of the LociGoslim_wrk table.
   * 
   * @param conn the write database connection
   * @throws SQLException when there is a database error
   */
  private static void deleteLociGoslimRows(DBconnection conn)
      throws SQLException {
    conn.setQuery(DELETE_SQL);
    conn.executeUpdate();
  }

  /**
   * Run the table building program.
   * 
   * @param args ignored parameter
   */
  public static void main(String[] args) {
    DBconnection connection = null;

    try {
      connection =
        new DBconnection(WebApp.getProperty("DRIVER_NAME"),
                         WebApp.getProperty("CONNECTION_URL"),
                         WebApp.getProperty("WRITE_CONNECTION_NAME"),
                         WebApp.getProperty("WRITE_CONNECTION_PASSWORD"));
      logger.debug("Building LociGoslim work table using "
                   + WebApp.getProperty("WRITE_CONNECTION_NAME")
                   + " through JDBC at " + WebApp.getProperty("CONNECTION_URL"));
      long start = System.nanoTime();
      LociGoslimBuild.buildTable(connection);
      logger.debug("Built table in "
                   + ((System.nanoTime() - start) / 1000000000) + " seconds");
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      if (connection != null) {
        Connection c = connection.getJdbcConnection();
        if (c != null) {
          try {
            c.close();
          } catch (SQLException e) {
            // Log and ignore
            logger.error("Could not close connection", e);
          }
        }
      }
    }
  }
}
