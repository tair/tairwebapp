/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.sql.*;

public interface TreeNodeDisplayModel {

  /**
   * @param info_type The node info type to be checked for validity
   * @return boolean representation of check for info_type
   */
  public boolean isValidInfoType( String info_type );

  /**
   * sets a type specific tfc object instantiated and initialized to the supplied id
   **/    
  public void setSelectedNodeData( Long selected_node_id ) throws SQLException;

  /**
   * returns a tfc object for use in the jsp to display type specific info about the selected node
   **/    
  public Object getSelectedNodeData();

  /**
   * @param tree The table of node data representing the tree
   **/    
  public void setTreeNodes( String[][] tree ) throws SQLException;

  /**
   * @param row The integer representing the row of the table of data 
   * @param info_type The String representing the info type of the table of data
   * @return String representation of the information for the requested node ( table row )
   */
  public String getNodeInfo( int row, String info_type );

}
