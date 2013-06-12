/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.tree;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.jboss.logging.Logger;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;


/**
 ** inserts and deletes rows from temp table ( see TreeTableInfo.java ) that
 * holds the node data to build a tree from uses classes: DBconnection;
 * DBWriteManager; MasterTableInfo; TreeTypes;
 **/

public class MultiParentDataModel implements TreeDataModel {
  private static final Logger logger =
    Logger.getLogger(MultiParentDataModel.class);

  private String tree_type;
  private final String type = "tree";
  private String query_identifier;
  private MultiParentNode node;
  private String hide_children;
  private ArrayList<Long> node_id_list;

  /**
   * Create a MultiParentDataModel object.
   */
  public MultiParentDataModel() {
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    return DBWriteManager.getInstance().getSearchConnection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    DBWriteManager.return_connection(conn);
  }

  // sets this tree type
  public void setTreeType(String tree_type) {
    this.tree_type = tree_type;
  }

  // returns this tree type
  private String getTreeType() {
    return tree_type;
  }

  public void setQueryIdentifier(String query_identifier) {
    this.query_identifier = query_identifier;
  }

  private String getQueryIdentifier() {
    return query_identifier;
  }

  // returns this search type, "tree"
  private String getType() {
    return type;
  }

  // returns the temp table name
  private String getTempTableName() {
    return " RESULT_TREE ";
  }

  // instantiates an empty type-specific Node
  private void instantiateNode() {
    if (TreeTypes.getNodeClassname(getTreeType()) != null) {
      try {
        Class<?> c = Class.forName(TreeTypes.getNodeClassname(getTreeType()));
        setNode((MultiParentNode)c.newInstance());
      } catch (ClassNotFoundException cnfe) {
        cnfe.printStackTrace();
      } catch (InstantiationException ise) {
        ise.printStackTrace();
      } catch (IllegalAccessException iae) {
        iae.printStackTrace();
      }
    }
  }

  private void setNode(MultiParentNode node) {
    this.node = node;
  }

  private MultiParentNode getNode() {
    return node;
  }

  // sets a list of node ids for the current rows in the temp table -
  // node_id_list for the tree
  // don't include the root node
  // since the node options will apply based on entity id or node id - this can
  // be the same for multi and single parent trees
  private void setNodeIDList() throws SQLException {
    node_id_list = new ArrayList<Long>();
    DBconnection conn = null;
    String query =
      "select node_id from "
          + getTempTableName()
          + " where query_identifier = "
          + TextConverter.dbQuote(getQueryIdentifier())
          + " and parent_id > 0 ";
    try {
      conn = getConnection();
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();
      Long id = null;
      // only add unique node_ids
      while (results.next()) {
        id = new Long(results.getLong("node_id"));
        if (!node_id_list.contains(id))
          node_id_list.add(id);
      }
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  // returns the list of ids for the rows in temp table - id_list for the tree
  // doesn't include the root node
  private ArrayList<Long> getNodeIDList() {
    return node_id_list;
  }

  // sets hide_children
  private void setHideChildren(String hide_children) {
    this.hide_children = hide_children;
  }

  // returns hide_children
  private String getHideChildren() {
    return hide_children;
  }

  private void clearResultTable(String query_identifier) throws SQLException {
    DBconnection conn = null;
    String query =
      "DELETE FROM Result_Tree WHERE QUERY_IDENTIFIER = '"
          + query_identifier
          + "' ";
    try {
      conn = getConnection();
      logger.debug("query : " + query);
      conn.setQuery(query);
      conn.executeUpdate();
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  private String getTableColumns() {
    return "node_id, parent_id, sib_order, tot_sibs, tot_children, "
           + " children_loaded, depth, hide_children, node_icon, display_data_1, display_data_2, "
           + " parent_row_id, query_identifier, date_last_queried, row_id";
  }

  // insert the node as a row into the temp table
  private void insertNode() throws SQLException {
    DBconnection conn = null;
    String query =
      "insert into "
          + getTempTableName()
          + " ( "
          + getTableColumns()
          + ") "
          + " values ( "
          + getNode().getNodeID().toString()
          + " , "
          + getNode().getParentID().toString()
          + " , "
          + (new Integer(getNode().getSibOrder())).toString()
          + " , "
          + (new Integer(getNode().getTotSibs())).toString()
          + " , "
          + (new Integer(getNode().getTotChildren())).toString()
          + " , "
          + TextConverter.dbQuote("N")
          + " , "
          + (new Integer(getNode().getDepth())).toString()
          + " , "
          + TextConverter.dbQuote(getHideChildren())
          + " , "
          + TextConverter.dbQuote(getNode().getNodeIcon())
          + " , "
          + TextConverter.dbQuote("X")
          + " , "
          + TextConverter.dbQuote(getNode().getDisplayData2())
          + " , "
          + getNode().getParentRowID().toString()
          + ", "
          + TextConverter.dbQuote(query_identifier)
          + ", "
          + "CURRENT_DATE, "
          + TextConverter.dbQuote(getNextCurrentRowID())
          + " ) ";
    logger.debug("insert node : " + query);
    try {
      conn = getConnection();
      conn.setQuery(query);
      conn.executeUpdate();
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  /**
   ** required methods per implementation of interface TreeDataModel
   **/
  public void addTopNode(Long node_id) throws SQLException {
    instantiateNode();
    /* CLEAR RESULT TABLE FOR THE NODE_ID */
    clearResultTable(query_identifier);
    logger.debug("getType : " + getType() + " and top node is " + node_id);

    // deal with case where top node has multiple parents need to insert nodes
    // for each of the multiple parents
    getNode().setParentList(node_id);
    if (getNode().hasMultipleParents()) {
      // insert the appropriate nodes for this multi parent node into the temp
      // table
      ArrayList<Long> parent_list = new ArrayList<Long>();
      parent_list = getNode().getParentList();
      logger.debug("Adding multiple parents to tree results: "
                   + parent_list.size()
                   + " parents");
      /*
       * for the first parent of this node, build a branch- inserting into the
       * temp table, save the distance from the root for subsequent parents of
       * this node, create the nodes and keep in an array list, then pull them
       * out of the array list updating the depth attribute and also determining
       * whether or not it should be inserted into the temp table by checking
       * whether or not the node has a common parent - stop inserting when a
       * common parent is found.
       */
      // Set the attributs of the node using the first parent id.
      getNode().setTopNodeData(node_id, parent_list.get(0));
      setHideChildren("N");
      // builds one of the branches - stores the nodes in the tt
      while (getNode().getParentID().longValue() > 0) {
        insertNode();
        getNode().setTopNodeData(getNode().getParentID());
      }
      insertNode();
      // save the distance from the root
      int distance = Math.abs(getNode().getDepth());
      // create the nodes for the next branch and put them into an arraylist
      // temporarily
      ArrayList<MultiParentNode> tmp_branch = new ArrayList<MultiParentNode>();
      MultiParentNode tmp_node = null;
      Long tmp_parent_id = null;
      int alt_distance = 0;
      int alt_depth = 0;
      // do the following for all parents of the starting node
      for (int j = 1; j < parent_list.size(); j++) {
        tmp_branch.clear();
        instantiateNode();
        // Set the attributes of the node using the next parent id.
        getNode().setTopNodeData(node_id, (Long)parent_list.get(j));
        // builds one of the branches - stores the nodes in the tt
        while (getNode().getParentID().longValue() > 0) {
          tmp_branch.add(getNode());
          tmp_parent_id = getNode().getParentID();
          instantiateNode();
          getNode().setTopNodeData(tmp_parent_id);
        }
        tmp_branch.add(getNode());
        // figure out the distance from the root in order to calculate the depth
        // for the nodes in the tmp_branch
        alt_distance = tmp_branch.size() - 1;
        alt_depth = alt_distance - distance;
        // for each node in the tmp_branch update the depth attribute
        for (int i = 0; i < tmp_branch.size(); i++) {
          tmp_node = tmp_branch.get(i);
          tmp_node.setDepth(alt_depth);
          alt_depth--;
          if (!commonNodeExists(tmp_node.getNodeID(), tmp_node.getParentID())) {
            setNode(tmp_node);
            insertNode();
          } else {
            // get out of Dodge
            i = tmp_branch.size();
          }
        }
      }
    } else { // business as usual
      getNode().setTopNodeData(node_id); // populates the node based on type
                                         // specific logic, top nodes have the
                                         // parent id = 0
      setHideChildren("N");
      while (getNode().getParentID().longValue() > 0) {
        insertNode();
        getNode().setTopNodeData(getNode().getParentID());
      }
      insertNode();
    } // end of hasMultipleParents clause

    // do this next part after all the top nodes have been inserted

    // multiple parent tree structure uses parent_row_id and row_id for building
    // the tree so -- update parent_row_id from the row_id
    DBconnection conn = null;
    String query =
      "update  "
          + getTempTableName()
          + " A "
          + "set A.parent_row_id = "
          + "NVL(( SELECT B.row_id FROM "
          + getTempTableName()
          + " B "
          + " where B.node_id = A.parent_id "
          + " AND B.query_identifier = "
          + TextConverter.dbQuote(getQueryIdentifier())
          + "), 0) "
          + "WHERE A.query_identifier = "
          + TextConverter.dbQuote(getQueryIdentifier())
          + "AND A.parent_id > 0 ";
    logger.debug("update parent: " + query);
    try {
      conn = getConnection();
      conn.setQuery(query);
      conn.executeUpdate();
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }

  }

  private Long getNextCurrentRowID() throws SQLException {
    DBconnection conn = null;
    Long current_row_id = new Long(1);
    String count_query =
      "select max(row_id) as max_row from "
          + getTempTableName()
          + " where query_identifier = "
          + TextConverter.dbQuote(getQueryIdentifier());
    try {
      conn = getConnection();
      conn.setQuery(count_query);
      logger.debug("count_query : " + count_query);
      ResultSet results = conn.getResultSet();
      while (results.next()) {
        current_row_id = results.getLong("max_row") + 1;
      }
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
    return current_row_id;
  }

  // see if common node exists in the temp table already
  private boolean commonNodeExists(Long node_id, Long parent_id)
      throws SQLException {
    DBconnection conn = null;
    String query =
      "select node_id from "
          + getTempTableName()
          + " where node_id = "
          + node_id.toString()
          + " AND parent_id = "
          + parent_id.toString();
    logger.debug("query node exists: " + query);
    boolean found = false;
    try {
      conn = getConnection();
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();
      if (results.next())
        found = true;
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
    return found;
  }

  /**
   ** required methods per implementation of interface TreeDataModel
   **/
  public void addChildren(String query_identifier, Long id, String node_option)
      throws SQLException {
    logger.debug("adding children with queryID "
                 + query_identifier
                 + " and id "
                 + id
                 + " and node_option "
                 + node_option);
    // create a set of child nodes for this id, insert into the temp table
    instantiateNode();
    setQueryIdentifier(query_identifier);
    // populates the parent node from values in temp table
    getNode().setParentNodeData(getQueryIdentifier(), id);
    if (getNode().getTotChildren() > 0
        && getNode().getChildrenLoaded().equalsIgnoreCase("N")) {
      Long[] children = getNode().getChildren();
      // iterate thru the children, setting the node data, then getting the
      // specific pieces of node data to
      // insert into the temp table
      if (node_option != null)
        getNode().setNodeOption(node_option);
      for (int i = 0; i < children.length; i++) {
        // populates the ode based on type-specific logic
        getNode().setNodeData(getQueryIdentifier(), children[i], id);
        setHideChildren("Y");
        updateOrInsertNode();
      }
    }
    // update parent rows, children_loaded field, put the sql right here --
    // divergence in the models
    DBconnection conn = null;
    String query =
      "update "
          + getTempTableName()
          + " set children_loaded = "
          + TextConverter.dbQuote("Y")
          + ", hide_children = "
          + TextConverter.dbQuote("N")
          + ", display_data_1 = "
          + TextConverter.dbQuote("-")
          + " where row_id = "
          + id.toString()
          + " and query_identifier = "
          + TextConverter.dbQuote(getQueryIdentifier());
    logger.debug("adding children function : " + query);
    try {
      conn = getConnection();
      conn.setQuery(query);
      conn.executeUpdate();
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  /**
   ** required methods per implementation of interface TreeDataModel
   **/
  public void removeChildren(String query_identifier, Long id)
      throws SQLException {
    DBconnection conn = null;
    // another divergence in the models between single and multi parents
    String query =
      "update "
          + getTempTableName()
          + " set hide_children = "
          + TextConverter.dbQuote("Y")
          + " where query_identifier = "
          + TextConverter.dbQuote(getQueryIdentifier())
          + " and row_id = "
          + id.toString();
    logger.debug("hide children : " + query);
    try {
      conn = getConnection();
      conn.setQuery(query);
      conn.executeUpdate();
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  /**
   ** required methods per implementation of interface TreeDataModel
   **/
  public void updateTree(String node_option) throws SQLException {
    String query = null;
    setNodeIDList();
    instantiateNode();
    getNode().setNodeOption(node_option);
    DBconnection conn = null;
    // update the display_data_2 column in temp table for each node in the tree
    // since the node options will apply based on entity id or node id - this
    // can be the same for multi and single parent trees
    try {
      conn = getConnection();
      for (int i = 0; i < getNodeIDList().size(); i++) {
        getNode().setDisplayData2((Long)getNodeIDList().get(i));
        query =
          "update "
              + getTempTableName()
              + " set display_data_2 = "
              + TextConverter.dbQuote(getNode().getDisplayData2())
              + " where node_id = "
              + ((Long)getNodeIDList().get(i)).toString()
              + " and query_identifier = "
              + TextConverter.dbQuote(getQueryIdentifier());
        logger.debug("display data 2 : " + query);
        conn.setQuery(query);
        conn.executeUpdate();
      }
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  // check the node and either insert or update it
  // another divergence in the models between single and multi parents
  private void updateOrInsertNode() throws SQLException {
    DBconnection conn = null;
    String query =
      "select row_id from "
          + getTempTableName()
          + " where query_identifier = "
          + TextConverter.dbQuote(getQueryIdentifier())
          + " and node_id = "
          + getNode().getNodeID().toString()
          + " AND parent_id = "
          + getNode().getParentID().toString()
          + " AND depth = "
          + new Integer(getNode().getDepth()).toString()
          + " AND parent_row_id = "
          + getNode().getParentRowID().toString();
    logger.debug("update or insert : " + query);
    Long row_id = null;
    try {
      conn = getConnection();
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();
      if (results.next())
        row_id = new Long(results.getLong("row_id"));
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
    if (row_id != null) {
      query =
        "update "
            + getTempTableName()
            + " set sib_order = "
            + (new Integer(getNode().getSibOrder())).toString()
            + ", tot_sibs = "
            + (new Integer(getNode().getTotSibs())).toString()
            + ", display_data_2 = "
            + TextConverter.dbQuote(getNode().getDisplayData2())
            + " where query_identifier = "
            + TextConverter.dbQuote(getQueryIdentifier())
            + " AND row_id = "
            + row_id.toString();
      logger.debug("update : " + query);
      try {
        conn = getConnection();
        conn.setQuery(query);
        conn.executeUpdate();
        conn.releaseResources();
      } finally {
        if (conn != null)
          returnConnection(conn);
      }
    } else {
      insertNode();
    }
  }

}
