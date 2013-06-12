/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.utilities.WebApp;


/**
 * <p>
 * Represents an in-memory version of the TAIR keyword Directed Acyclic Graph
 * (DAG), a network graph of keyword nodes and edges that represents the TAIR
 * keyword ontologies. This is a single-root graph build from the
 * TermRelationship table in TAIR.
 * </p>
 * <p>
 * The ShortestPathBuilder uses this class to build a singleton DAG and uses
 * that DAG to build the ShortestPath work table, which expands the DAG into all
 * possible links between a leaf and its parents.
 * </p>
 * <p>
 * Note: the tree includes only nodes that are present in the Keyword table, as
 * there are foreign key dependencies to that table for most uses of the DAG. If
 * the Keyword table is for some reason out of synch with the TermRelationship
 * table, there may be keywords that do not appear in the tree.
 * </p>
 * 
 * @author Robert J. Muller
 * 
 * @see org.tair.search.tree.ShortestPathBuilder
 */
public class KeywordDag {
  /** log4j logger for this class */
  private static final Logger logger = Logger.getLogger(KeywordDag.class);

  /** a map of the keyword DAG keyed on BigInteger keyword id */
  private static final Map<BigInteger, DagKeywordComponent> keywords =
    new ConcurrentHashMap<BigInteger, DagKeywordComponent>();

  /** the set of leaves of the keyword DAG */
  private static final Set<DagKeywordLeaf> leaves =
    new HashSet<DagKeywordLeaf>();

  /** the hard-coded primary key for the root of the keyword DAG */
  // private static final BigInteger ROOT_ID = new BigInteger("25476");

  /**
   * query the leaf keywords (keywords that are not parents and that are in the
   * Keyword table)
   */
  private static final String LEAF_QUERY =
    "SELECT c.child_term_id AS keyword_id FROM TermRelationship c LEFT JOIN TermRelationship p ON c.child_term_id = p.parent_term_id JOIN Keyword k ON c.child_term_id = k.keyword_id WHERE p.parent_term_id IS NULL";

  /**
   * query the composite keywords (keywords with children including children of
   * the single root node with parent ids in the Keyword table)
   */
  private static final String COMPOSITE_QUERY =
    "SELECT distinct tr.parent_term_id AS keyword_id FROM TermRelationship tr JOIN Keyword k ON tr.parent_term_id = k.keyword_id ORDER BY 1";

  /** query the root keywords (keywords that are a child of the root node) */
  // private static final String ROOT_QUERY =
  // "SELECT r.child_term_id FROM TermRelationship r WHERE r.parent_term_id = 25476";

  /** query the keyword links */
  private static final String LINK_QUERY =
    "SELECT parent_term_id, child_term_id FROM TermRelationship ORDER BY 1";

  /**
   * Build a static DAG of keywords in memory.
   * 
   * @throws SQLException
   */
  private static void buildTree() throws SQLException {
    DBconnection connection = null;

    // Open pooled JDBC connection
    try {
      logger.debug("Building ShortestPath work table using "
                   + WebApp.getProperty("WRITE_CONNECTION_NAME")
                   + " through JDBC at " + WebApp.getProperty("CONNECTION_URL"));
      connection =
        new DBconnection(WebApp.getProperty("DRIVER_NAME"),
                         WebApp.getProperty("CONNECTION_URL"),
                         WebApp.getProperty("WRITE_CONNECTION_NAME"),
                         WebApp.getProperty("WRITE_CONNECTION_PASSWORD"));
      if (connection != null) {
        createLeafNodes(connection);
        createCompositeNodes(connection);
        linkNodes(connection);
      }
    } catch (SQLException e) {
      logger.error("SQL Exception while building shortest path work table", e);
      throw new RuntimeException(e.getMessage());
    } finally {
      // Close the JDBC connection.
      if (connection != null) {
        Connection c = connection.getJdbcConnection();
        if (c != null) {
          c.close();
        }
      }
    }
  }

  /**
   * Create the leaf nodes in the keyword DAG map and leaf list.
   * 
   * @param connection a JDBC connection wrapper
   * @throws SQLException when there is a database problem with the query
   */
  private static void createLeafNodes(DBconnection connection)
      throws SQLException {
    try {
      connection.setQuery(LEAF_QUERY);
      ResultSet rs = connection.getResultSet();
      while (rs.next()) {
        BigDecimal keywordIdDecimal = rs.getBigDecimal("keyword_id");
        if (keywordIdDecimal != null) {
          BigInteger keywordId = keywordIdDecimal.toBigInteger();
          DagKeywordComponent leaf = new DagKeywordLeaf(keywordId);
          // Add to DAG map
          keywords.put(keywordId, leaf);
          // Add to list of leaves
          leaves.add((DagKeywordLeaf)leaf);
        }
      }
    } catch (SQLException e) {
      connection.releaseResources();
      throw e;
    }
  }

  private static void createCompositeNodes(DBconnection connection)
      throws SQLException {
    try {
      connection.setQuery(COMPOSITE_QUERY);
      ResultSet rs = connection.getResultSet();
      while (rs.next()) {
        BigDecimal keywordIdDecimal = rs.getBigDecimal("keyword_id");
        if (keywordIdDecimal != null) {
          BigInteger keywordId = keywordIdDecimal.toBigInteger();
          DagKeywordComponent composite = new DagKeywordComposite(keywordId);
          keywords.put(keywordId, composite);
        }
      }
    } catch (SQLException e) {
      connection.releaseResources();
      throw e;
    }
  }

  /**
   * Link the nodes in the keyword tree by querying all the term-relationships
   * from the database and cross-linking parents to children and vice versa.
   * 
   * @param connection the JDBC connection
   * @throws SQLException when there is a database problem with the query
   */
  private static void linkNodes(DBconnection connection) throws SQLException {
    long links = 0;
    try {
      connection.setQuery(LINK_QUERY);
      ResultSet rs = connection.getResultSet();
      while (rs.next()) {
        BigDecimal parentDecimal = rs.getBigDecimal("parent_term_id");
        BigDecimal childDecimal = rs.getBigDecimal("child_term_id");
        if (parentDecimal != null && childDecimal != null) {
          BigInteger parentId = parentDecimal.toBigInteger();
          BigInteger childId = childDecimal.toBigInteger();
          DagKeywordComposite parent =
            (DagKeywordComposite)keywords.get(parentId);
          DagKeywordComponent child = keywords.get(childId);
          if (parent != null && child != null) {
            parent.addChild(child);
            child.addParent(parent);
            links++;
          } else {
            // Log and ignore node not in tree
            logger.warn("Node not in tree: parent " + parentId + ", child "
                        + childId);
            if (parent == null) {
              logger.warn("Parent " + parentId + " not found in tree");
            }
            if (child == null) {
              logger.warn("Child " + childId + " not found in tree");
            }
          }
        }
      }
    } catch (SQLException e) {
      connection.releaseResources();
      throw e;
    }
    logger.debug("Added " + links + " links to keyword tree.");
  }

  /**
   * Get the keyword DAG Map.
   * 
   * @return a map of <code>DagKeywordComponent</code> objects keyed on
   *         <code>BigInteger</code> keyword id
   * @throws SQLException when there is a database problem getting the keywords
   */
  public static Map<BigInteger, DagKeywordComponent> getKeywords()
      throws SQLException {
    init();
    return keywords;
  }

  /**
   * Initialize the in-memory DAG of keywords.
   * 
   * @throws SQLException when there is a database problem
   */
  private static void init() throws SQLException {
    if (keywords.size() == 0) {
      buildTree();
    }
  }

  /**
   * Get the set of leaves in the DAG.
   * 
   * @return a set
   * @throws SQLException when there is a database problem getting the leaves
   */
  public static Set<DagKeywordLeaf> getLeaves() throws SQLException {
    init();
    return leaves;
  }
}
