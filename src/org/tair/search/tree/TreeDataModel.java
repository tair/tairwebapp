/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.sql.*;
import java.util.*;

/**
   **/
public interface TreeDataModel {

  /**
   */  
  public void setTreeType( String tree_type );

  /**
   */  
  public void setQueryIdentifier( String query_identifier );

  /**
   */  
  public void addTopNode( Long node_id ) throws SQLException;

  /**
   */
  public void addChildren( String query_identifier, Long id, String node_option ) throws SQLException;

  /**
   */
  public void removeChildren( String query_identifier, Long id ) throws SQLException;

  /**
   */
  public void updateTree( String node_option ) throws SQLException;

}
