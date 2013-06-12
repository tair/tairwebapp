/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.tree;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.jboss.logging.Logger;
import org.tair.search.table.TreeTableInfo;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;


/**
 * Fetches data from an in-memory representation of a searched keyword tree
 */
public class TreeFetcher {

  private static final Logger logger = Logger.getLogger(TreeFetcher.class);

  private String[][] tree;
  private String type;
  private String query;
  private String query_identifier;
  private TreeNodeDisplayModel tree_display;
  private int tot_rows;
  private boolean display_object_exists = false;
  private int row_count;
  private DBReadManager connectionPool;

  /**
   * Create a TreeFetcher object.
   * @param query_identifier the search id for the tree
   * @param tree_type the kind of tree this is
   * @throws SQLException when there is a problem getting the tree results
   */
  public TreeFetcher(String query_identifier, String tree_type)
      throws SQLException {
    setType(tree_type);
    setQueryIdentifier(query_identifier);
    setDefaultInfo();
  }

  // returns a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBReadManager.getInstance();
    return connectionPool.get_connection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    DBReadManager.return_connection(conn);
  }

  // returns the temp table name
  private String getTempTblName() {
    return "RESULT_TREE";
  }

  private void setQueryIdentifier(String query_identifier) {
    this.query_identifier = query_identifier;
  }

  // sets the tree type supplied through constructor
  private void setType(String tree_type) {
    type = tree_type;
  }

  /**
   * @return String the tree type
   */
  public String getType() {
    return type;
  }

  /**
   * Sets the top node data object using the KeywordDisplay object for
   * instantiation and initialization
   * 
   * @param selected_node_id the id of the top node
   * @throws SQLException when there is a database query problem
   */
  public void setSelectedNodeData(Long selected_node_id) throws SQLException {
    if (hasDisplayObject())
      getTreeDisplay().setSelectedNodeData(selected_node_id);
  }

  /**
   * @return Object which represents the instantiated and initialized tfc data
   *         object for the top node
   */
  public Object getSelectedNodeData() {
    return getTreeDisplay().getSelectedNodeData();
  }

  // sets some default information about the result set, such as total rows,
  // start row-id, column names, download columns
  private void setDefaultInfo() throws SQLException {
    DBconnection conn = null;
    String def_query =
      "select count(*) AS total_rows from "
          + getTempTblName()
          + " where query_identifier = "
          + TextConverter.dbQuote(query_identifier)
          + " and row_id >= 0";
    try {
      conn = getConnection();
      conn.setQuery(def_query);
      logger.debug("def_query : " + def_query);
      ResultSet results = conn.getResultSet();
      while (results.next()) {
        setTreeSize(results.getInt("total_rows"));
      }
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
    if (TreeTypes.getDisplayClassname(getType()) != null) {
      try {
        Class<?> c = Class.forName(TreeTypes.getDisplayClassname(getType()));
        setTreeDisplay((TreeNodeDisplayModel)c.newInstance());
      } catch (ClassNotFoundException cnfe) {
        cnfe.printStackTrace();
      } catch (InstantiationException ise) {
        ise.printStackTrace();
      } catch (IllegalAccessException iae) {
        iae.printStackTrace();
      }
      display_object_exists = true;
    } else {
      display_object_exists = false;
    }
  }

  // checks to see if a display object for this tree has been created
  private boolean hasDisplayObject() {
    return display_object_exists;
  }

  // sets up a handle to the display info for this type (ie, keyword,etc) of
  // tree
  private void setTreeDisplay(TreeNodeDisplayModel tree_display) {
    this.tree_display = tree_display;
  }

  // returns a handle to the display object for this tree type
  private TreeNodeDisplayModel getTreeDisplay() {
    return tree_display;
  }

  /**
   * @param column_name The name of the column in the tree table to validate
   * @return boolean representation of check to see if supplied column name is a
   *         valid column name
   */
  private boolean isValidTreeColumn(String column_name) {
    boolean is_valid = false;
    for (String name : getTreeColumnNames()) {
      if (column_name.equals(name)) {
        is_valid = true;
        break;
      }
    }
    return is_valid;
  }
  
  /**
   * Get an ArrayList of column names.
   * 
   * @return an ArrayList of column names from the tree
   */
  private List<String> getTreeColumnNames() {
    TreeTableInfo table = new TreeTableInfo();
    String[] nameArray = table.getColumnNames();
    List<String> list = new ArrayList<String>(nameArray.length);
    for (int i = 0; i < nameArray.length; i++) {
      list.add(nameArray[i]);
    }
    return list;
  }

  /**
   * @return String array whose elements contain all the column names in the
   *         temp table
   */
  private String[] getTreeColumns() {
    TreeTableInfo tree_table = new TreeTableInfo();
    return tree_table.getColumnNames();
  }

  /**
   * @return integer representation of the number of columns in the temp table
   */
  private int getTreeColumnCount() {
    return getTreeColumns().length;
  }

  // returns the index of the temp table column name
  private int getTreeColumnIndex(String col_name) {
    int col_idx = 0;
    for (int i = 0; i < getTreeColumns().length; i++) {
      if (col_name.equals(getTreeColumns()[i]))
        col_idx = i;
    }
    return col_idx;
  }

  // sets tree size - number of nodes in tree
  private void setTreeSize(int tot_rows) {
    this.tot_rows = tot_rows;
  }

  /**
   * @return integer representation of the total number of rows in the temp
   *         table
   */
  public int getTreeSize() {
    return tot_rows;
  }

  /**
   * @param row_num 
   * @return integer representation of the depth of the node
   */
  public int getNodeDepth(int row_num) {
    int depth = 0;
    String depthString = getNode(row_num, "depth");
    if (depthString != null) {
      try {
        depth = (new Integer(depthString)).intValue();
      } catch (NumberFormatException e) {
        // Not a number, fall back on default 0
      }
    }
    return depth;
  }

  /**
   * @param row_num 
   * @return boolean of whether the node is the last sibling or not
   */
  public boolean isLastSib(int row_num) {
    boolean is_last = false;
    if ((new Integer(getNode(row_num, "sib_order"))).intValue() == (new Integer(getNode(row_num,
                                                                                        "tot_sibs")).intValue() - 1))
      is_last = true;
    return is_last;
  }

  private String getTableColumns() {
    String columns =
      " node_id, "
          + "parent_id, "
          + "sib_order, "
          + "tot_sibs, "
          + "tot_children, "
          + "children_loaded, "
          + "depth, "
          + "hide_children, "
          + "node_icon, "
          + "display_data_1, "
          + "display_data_2, "
          + "parent_row_id, "
          + "query_identifier, "
          + "date_last_queried, "
          + "row_id ";
    return columns;
  }

  /**
   * sets the tree, populates a table with values from the temp table which
   * holds node info
   * @throws SQLException 
   */
  public void setTree() throws SQLException {
    DBconnection conn = null;
    query =
      "select "
          + getTableColumns()
          + " FROM "
          + getTempTblName()
          + " where query_identifier = "
          + TextConverter.dbQuote(query_identifier)
          + " and parent_row_id = ? "
          + "order by sib_order ";
    logger.debug("tree size : "
                 + getTreeSize()
                 + " and tree col count : "
                 + getTreeColumnCount());
    tree = new String[getTreeSize()][getTreeColumnCount()];
    try {
      conn = getConnection();
      row_count = 0;
      // starting point
      setNode(conn, new Long(0));
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
    // retrieve lookup data by sending the the results table for this page to
    // the lookup object, if one exists
    if (getTreeSize() > 0 && hasDisplayObject())
      getTreeDisplay().setTreeNodes(tree);
  }

  // returns the tree table
  private String[][] getTree() {
    return tree;
  }

  private void setNode(DBconnection conn, Long parent_id) throws SQLException {
    conn.setQuery(query);
    conn.setQueryVariable(parent_id);
    logger.debug("parent id : "
                 + parent_id
                 + " and current row_count : "
                 + row_count);
    ResultSet results = conn.getResultSet();
    while (results.next()) {
      for (int i = 1; i <= getTreeColumnCount(); i++) {
        if (results.getString(i) != null) {
          tree[row_count][i - 1] = results.getString(i).trim();
        } else {
          tree[row_count][i - 1] = " ";
        }
      }
      row_count++;
      if (results.getString("hide_children").equalsIgnoreCase("N"))
        setNode(conn, new Long(results.getLong("row_id")));
    }
  }

  /**
   * @param row_num
   * @param col
   * @return
   */
  public String getNode(int row_num, int col) {
    return getTree()[row_num][col];
  }

  /**
   * @param row_num
   * @param col_name
   * @return
   */
  public String getNode(int row_num, String col_name) {
    String info = null;
    if (isValidTreeColumn(col_name) && row_num < getTreeSize()) {
      info = getTree()[row_num][getTreeColumnIndex(col_name)];
    } else {
      if (hasDisplayObject()) {
        if (getTreeDisplay().isValidInfoType(col_name)) {
          info = getTreeDisplay().getNodeInfo(row_num, col_name);
        } else {
          info = "Invalid Column Name";
        }
      } else {
        info = "Invalid Column Name";
      }
    }
    return info;
  }
}