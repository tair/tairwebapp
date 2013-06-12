/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import org.jboss.logging.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.tair.tfc.DBconnection;
import org.tair.utilities.WebApp;


/**
 * 
 * @author Robert J. Muller
 */
public class ShortestPathDelegateTest {

  /** log4j logger */
  private static final Logger logger =
    Logger.getLogger(ShortestPathDelegateTest.class);

  /** the standalone JDBC connection to use in each test case */
  DBconnection connection = null;

  /**
   * Open a JDBC connection using the connection pool.
   * 
   * @throws java.lang.Exception when there is a problem of some kind
   */
  @Before
  public void setUp() throws Exception {
    connection =
      new DBconnection(WebApp.getProperty("DRIVER_NAME"),
                       WebApp.getProperty("CONNECTION_URL"),
                       WebApp.getProperty("WRITE_CONNECTION_NAME"),
                       WebApp.getProperty("WRITE_CONNECTION_PASSWORD"));
    connection.autoCommit(false);
  }

  /**
   * Close the open connection.
   * 
   * @throws java.lang.Exception when there is a problem of some kind
   */
  @After
  public void tearDown() throws Exception {
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

  /**
   * Test method for
   * {@link org.tair.search.tree.ShortestPathDelegate#insertShortestPath()}.
   */
  @Test
  public void testInsertShortestPath() {
    try {
      ShortestPathDelegate.insertShortestPath();
      assertTrue("", true);
    } catch (Exception e) {
      // log the exception
      logger.error("Exception while inserting shortest path", e);
      fail("Exception while inserting shortest path: " + e.getMessage());
    }
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.ShortestPathDelegate#computeShortestPath()}.
   */
  @Test
  public void testComputeShortestPath() {
    try {
      Set<DagKeywordEdge> edges = ShortestPathDelegate.computeShortestPath();
      if (edges == null || edges.size() == 0) {
        fail("No edges computed");
      }
    } catch (SQLException e) {
      // Database problem, log and fail the test
      logger.error("SQL exception while querying keyword DAG", e);
      fail("SQL exception while querying keyword DAG: " + e.getMessage());
    }
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.ShortestPathDelegate#insertEdges(org.tair.tfc.DBconnection, java.util.Set)}
   * .
   */
  @Test
  public void testInsertEdges() {
    try {
      ShortestPathDelegate.deleteBuildTable(connection);
      Set<DagKeywordEdge> edges = ShortestPathDelegate.computeShortestPath();
      ShortestPathDelegate.insertEdges(connection, edges);
      connection.commit();
      connection.releaseResources();
      // Query the count of edges.
      connection.setQuery("SELECT COUNT(*) AS count FROM ShortestPath_bld");
      ResultSet rs = connection.getResultSet();
      long count = 0;
      if (rs.next()) {
        count = rs.getLong("count");
      } else {
        fail("Could not get count of shortest-path edges from shortest-path build table");
      }
      if (count == 0) {
        fail("No edges inserted into shortest-path build table");
      }
    } catch (SQLException e) {
      // Database problem, log and fail the test
      logger.error("SQL exception while querying keyword DAG or inserting edges",
                   e);
      fail("SQL exception while querying keyword DAG or inserting edges: "
           + e.getMessage());
    }
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.ShortestPathDelegate#deleteWorkTable(org.tair.tfc.DBconnection)}
   * .
   */
  @Test
  public void testDeleteWorkTable() {
    try {
      ShortestPathDelegate.deleteWorkTable(connection);
      // Query the count of edges in the work table.
      connection.setQuery("SELECT COUNT(*) AS count FROM ShortestPath");
      ResultSet rs = connection.getResultSet();
      long count = -1;
      if (rs.next()) {
        count = rs.getLong("count");
      } else {
        fail("Could not get count of shortest-path edges from shortest-path work table");
      }
      if (count != 0) {
        fail("Shortest-path work table not cleared");
      }
    } catch (SQLException e) {
      // Database problem, log and fail the test
      logger.error("SQL exception while clearing the work table", e);
      fail("SQL exception while clearing the work table: " + e.getMessage());
    }
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.ShortestPathDelegate#deleteBuildTable(org.tair.tfc.DBconnection)}
   * .
   */
  @Test
  public void testDeleteBuildTable() {
    try {
      ShortestPathDelegate.deleteBuildTable(connection);
      // Query the count of edges in the work table.
      connection.setQuery("SELECT COUNT(*) AS count FROM ShortestPath_bld");
      ResultSet rs = connection.getResultSet();
      long count = -1;
      if (rs.next()) {
        count = rs.getLong("count");
      } else {
        fail("Could not get count of shortest-path edges from shortest-path build table");
      }
      if (count != 0) {
        fail("Shortest-path build table not cleared");
      }
    } catch (SQLException e) {
      // Database problem, log and fail the test
      logger.error("SQL exception while clearing the build table", e);
      fail("SQL exception while clearing the build table: " + e.getMessage());
    }
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.ShortestPathDelegate#copyToWorkTable(org.tair.tfc.DBconnection)}
   * .
   */
  @Test
  public void testCopyToWorkTable() {
    try {
      // Clear both build and work tables.
      ShortestPathDelegate.deleteBuildTable(connection);
      ShortestPathDelegate.deleteWorkTable(connection);
      
      // Insert a single row into the build table for test.
      connection.setQuery("INSERT INTO ShortestPath_bld (child_term_id, parent_term_id) VALUES (?, ?)");
      connection.setQueryVariable(1, 1);
      connection.setQueryVariable(2, 2);
      connection.executeUpdate();
      connection.commit();
      connection.releaseResources();
      
      // Copy the build to the work table.
      ShortestPathDelegate.copyToWorkTable(connection);
      connection.commit();
      connection.releaseResources();
      
      // Query the count of edges in the work table.
      try {
        connection.setQuery("SELECT COUNT(*) AS count FROM ShortestPath");
        ResultSet rs = connection.getResultSet();
        long count = -1;
        if (rs.next()) {
          count = rs.getLong("count");
        } else {
          fail("Could not get count of shortest-path edges from shortest-path work table");
        }
        if (count != 1) {
          fail("Shortest-path work table not cleared, count = " + count);
        }
      } catch (Exception e) {
        connection.releaseResources();
      }
      
      // Clear both build and work tables.
      ShortestPathDelegate.deleteBuildTable(connection);
      ShortestPathDelegate.deleteWorkTable(connection);
      
    } catch (SQLException e) {
      // Database problem, log and fail the test
      logger.error("SQL exception while clearing the work table", e);
      fail("SQL exception while clearing the work table: " + e.getMessage());
    }
  }
}
