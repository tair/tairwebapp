// Copyright 2011 Carnegie Institution for Science. All rights reserved.
package org.tair.search.table;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;


/**
 * <p>
 * QueryIDFactory is a utility class for managing query IDs in the 
 * Result_QueryID table in the database, which maintains a list of queries
 * that have been recently run. This permits the caching of query results
 * in the various Result_* tables to facilitate results paging, sorting, and
 * other results-oriented features that require persistent data.
 * </p>
 * <p>
 * Note: if an error occurs, the query and its id will still reside in the
 * Result_QueryId table. It may be necessary to find and remove the specific
 * row and the corresponding results rows to correct the error and to let the
 * system requery the results properly.
 * </p>
 */

public class QueryIDFactory {
  private static final Logger logger = Logger.getLogger(QueryIDFactory.class);

  /**
   * Gets a query id for a given query.
   * 
   * @param insert_query the search query for which to get an id
   * @param conn the JDBC database connection wrapper
   * 
   * @return a String query id that uniquely identifies the query
   * @throws SQLException when there is a database problem
   */
  public static String getQueryID(String insert_query, DBconnection conn) throws SQLException {

    Long query_id = null;
    insert_query = formatQuery(insert_query);
    String query =
      "SELECT QUERY_ID FROM RESULT_QUERYID " + "WHERE QUERY = "
          + TextConverter.dbQuote(insert_query);
    try {
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();
      if (results.next()) {
        query_id = new Long(results.getLong(1));
      }
      conn.releaseResources();

      // If there is no query, add it to the Result_QueryId table, getting the
      // id from the next sequence value.
      if (query_id == null) {
        query =
          "INSERT INTO RESULT_QUERYID( QUERY_ID, QUERY ) "
              + " VALUES (RESULT_QUERYID_seq.nextval, "
              + TextConverter.dbQuote(insert_query) + " )";
        logger.debug("Adding query to results table: " + query);

        conn.setInsertQuery(query, "QUERY_ID");
        query_id = conn.executeInsert();
      }
    } finally {
      conn.releaseResources();
    }
    return Long.toString(query_id);
  }

  /**
   * Test whether a specific query exists in the Result_QueryId table.
   * 
   * @param insert_query the query for which to test
   * @param conn
   * @return
   * @throws SQLException
   */
  public static boolean queryIDExists(String insert_query, DBconnection conn)
      throws SQLException {
    Long query_id = null;
    insert_query = formatQuery(insert_query);
    String query =
      "SELECT QUERY_ID FROM RESULT_QUERYID " + "WHERE QUERY = "
          + TextConverter.dbQuote(insert_query);
    logger.debug("Querying whether result already exists: " + query);
    conn.setQuery(query);
    ResultSet results = conn.getResultSet();
    if (results.next()) {
      query_id = new Long(results.getLong(1));
      logger.debug("Found query " + query_id);
    }

    return query_id != null ? true : false;

  }

  /**
   * The Oracle database can only hold up to 5000 character strings, so if it is
   * more than 5000 characters, we need to concatenate it. we should get the
   * last 5000 characters of the string as opposed to the first 5000 because a
   * lot of search queries look the same in the beginning
   * 
   * @param insert_query the query to format
   * @return the formatted query
   */
  private static String formatQuery(String insert_query) {
    String formatted_query = "";
    if (insert_query.length() > 5000) {
      int endsize = insert_query.length();
      int startsize = endsize - 5000;
      formatted_query = insert_query.substring(startsize, endsize);
    } else {
      formatted_query = insert_query;
    }
    return formatted_query;
  }
}
