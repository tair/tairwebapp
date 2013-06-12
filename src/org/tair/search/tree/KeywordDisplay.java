/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.sql.*;
import java.util.*;

import org.tair.search.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

public class KeywordDisplay implements TreeNodeDisplayModel {

    // use for things like customizing the look for the tree -- icons, links, colors (maybe) and 
    // specialized data retrieval and formatting for display purposes

  private String tree_type = "keyword";  
  private String temp_table_name;  
  private String[][] tree_table;
  private int nodes_in_tree;
  private String[] display_data;  
  private DBReadManager connectionPool;
  private String[] node_names;// name of node [node_num] -- get keyword name - probably truncate it using id 
  private String[] node_states;// e - expanded, c - collapsed, l - leaf [node_num] 
  private TfcKeyword tfc_keyword;  

  public KeywordDisplay() { } 
 
    // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBReadManager.getInstance();
    return ( connectionPool.get_connection() );    
  }

    // releases a connection back to the database pool
  private void returnConnection( DBconnection conn ) throws SQLException {
    connectionPool.return_connection( conn );
  }

  private String[] getInfoTypes() { return TreeTypes.getInfoTypes( this.getType() ); }

    // need to provide for the following method -- will require change to TreeTypes

    // for convenience to reference the tree_table info by column name rather than index
    /* private int getIndex( String tree_table_column ) {
    int index = 0;
    for ( int i = 0; i < TreeTypes.getTreeTableColumns().length; i ++ ) {
       if ( TreeTypes.getTreeTableColumns()[i].equals( tree_table_column ) ) index = i;
    }
    return index;     
    }*/

    // returns this tree type 
  private String getType() { return tree_type; }

    // required per interface definition
  public void setTreeNodes( String[][] tree_table ) throws SQLException {
    this.tree_table = tree_table;
    nodes_in_tree = tree_table.length;
    setStates();
    DBconnection conn = null;
    try {
      conn = getConnection();  
      setNames( conn );
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
  }

  private void setNames( DBconnection conn ) throws SQLException {
    // get keyword names from Keyword
    //if ( tree_table[i][getIndex( "node_id" )] !=null ) {
    // check to see if this is a valid row for getting data for
    node_names = new String[nodes_in_tree];
    ResultSet results = null;
    String query =  "select keyword from Keyword where keyword_id = ? ";
    Debugger.println( Debugger.logMsg( this, "name query = " + query ) );    
    conn.setQuery( query );
    for ( int i = 0; i < nodes_in_tree; i ++ ) {
      if ( tree_table[i][0] != null ) {
	conn.setQueryVariable( new Long( tree_table[i][0] ) );
        results = conn.getResultSet();
	if ( results.next() ) {
	  if ( results.getString( "keyword" ) == null ) {
	    node_names[i] = " ";
	  } else {
	    if ( results.getString( "keyword" ).length() > 80 ) {
	      // truncate if its longer than 80 characters
	      node_names[i] = results.getString( "keyword" ).substring( 0,80 );
	    } else {
	      node_names[i] = results.getString( "keyword" );
	    }
	  }
	}           
      }
    } 	  
  }

  private String getName( int row )  { return node_names[row]; } 

  private void setStates() throws SQLException {
      // there is stuff in here that handles the parentage dispay -- decide if it should move or just document it
    node_states = new String[nodes_in_tree];
    int i_tot = 0;
    String hide_children = null;
    String display_data_1 = null;
    int depth = 0;       
    for ( int i = 0; i < nodes_in_tree; i ++ ) {
       //if ( tree_table[i][getIndex( "tot_children" )] !=null ) {
       // check to see if this is a valid row for getting data for
      if ( tree_table[i][6] != null ) depth = ( new Integer( tree_table[i][6] ) ).intValue();
      if ( tree_table[i][4] != null ) {
	//i_tot = ( new Integer( tree_table[i][getIndex( "tot_children" )] ) ).intValue();
	i_tot = ( new Integer( tree_table[i][4] ) ).intValue();
	hide_children = tree_table[i][7];
	display_data_1 = tree_table[i][9];
	if ( i_tot == 0 ) {
	  node_states[i] = "L";
	} else {
	  if ( hide_children.equalsIgnoreCase( "N" ) ) {
	      //	    if ( depth < 1 && display_data_1.equalsIgnoreCase( "X" ) ) {
	    if ( display_data_1.equalsIgnoreCase( "X" ) ) {
	      node_states[i] = "C";
	    } else {
	      node_states[i] = "E";
	    }   
	  } else {
	    node_states[i] = "C";
	  }
        }		    
      }
    }   
  }

  private String getState( int row )  { return node_states[row]; } 

  /**
   * sets a TfcKeyword, instantiated and initialized to the supplied id
   **/    
  public void setSelectedNodeData( Long top_node_id ) throws SQLException { 
    // instantiate tfc_keyword, initialize to top_node_id 
    DBconnection conn = null;  
    try { 
      conn = getConnection();
      tfc_keyword = new TfcKeyword( conn, top_node_id );
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
  }

  /**
   * returns a tfc object for use in the jsp to display type specific info about the top node
   **/    
  public Object getSelectedNodeData() { return tfc_keyword; }

  /**
   * @param info_type The info_type of the node to be checked 
   * @return boolean representation of check for display info type
   */
  public boolean isValidInfoType( String info_type ) {
    boolean is_info_type = false;
      for ( int i = 0; i < getInfoTypes().length; i ++ ) {
        if ( info_type.equals( getInfoTypes()[i] ) ) is_info_type = true;
      }
    return is_info_type;
  }

  /**
   * @param row The integer representing the row of the table of data 
   * @param column_name The String representing the column name of the table of data
   * @return String representation of the  data for the requested node
   */ 
  public String getNodeInfo( int row, String info_type ) {
      // could check to see if row is not out of range for the tree size
    String node_info = new String();
    if ( info_type.equals( "name" ) ) {
    	node_info = getName(row);
    }
    if ( info_type.equals( "state" ) ) {
	node_info = getState(row);
    }
    return ( node_info );
  }

}
