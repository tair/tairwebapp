/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.sql.*;
import java.util.*;

/**
**/
public interface Node {

  /**
   */
  public void setNodeData( String query_identifier, Long id, Long parent_id ) throws SQLException;

  /**
   */
  public void setParentNodeData( String query_identifier, Long id ) throws SQLException;

  /**
   */
  public void setTopNodeData( Long node_id ) throws SQLException;

  /** handles user selected options 
   */
  public void setNodeOption( String node_option ) throws SQLException;

  /**sets the user specified options -- reflected in the tt display_data_2 -- for the specified node
   */
  public void setDisplayData2( Long id ) throws SQLException;

  /**
   */
  public Long getNodeID();

  /**
   */
  public Long getParentID();

  /**
   */
  public Long getRowID();

  /**
   */
  public Long getParentRowID();

  /**
   */
  public int getSibOrder();

  /**
   */
  public int getTotSibs();

  /**
   */
  public int getTotChildren();

  /**
   */
  public int getDepth();

  /**
   */
  public Long[] getChildren();

  /**
   */
  public String getChildrenLoaded();

  /**
   */
  public String getNodeIcon();

  /**
   */
  public String getDisplayData2();

  /** indicates whether temp table is used to hold node info
   */
  public boolean usesTempTable();
  

}
