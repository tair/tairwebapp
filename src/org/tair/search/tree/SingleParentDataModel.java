/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.TextConverter;

/**
 **  inserts and deletes rows from temp table ( see TreeTableInfo.java ) that holds the node data to build a tree from
 **  uses classes: DBconnection; DBWriteManager; MasterTableInfo; TreeTypes;  
 **/

public class SingleParentDataModel implements TreeDataModel {

  private String tree_type;
  private final String type = "tree";
  private String query_identifier;
  private DBWriteManager connectionPool;
  private Node node;
  private String hide_children;
  private boolean node_exists; 
  private ArrayList node_id_list; 
  
  public SingleParentDataModel() {}
 
    // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
      connectionPool = DBWriteManager.getInstance();
      return connectionPool.getSearchConnection();  
  }
    // releases a connection back to the database pool
  private void returnConnection( DBconnection conn ) throws SQLException { 
      connectionPool.return_connection( conn );
  }

    // sets this tree type 
  public void setTreeType( String tree_type ) { this.tree_type = tree_type; } 

    // returns this tree type 
  private String getTreeType() { return tree_type; }

  public void setQueryIdentifier( String query_identifier ) { this.query_identifier = query_identifier; }
  private String getQueryIdentifier() { return query_identifier; }
    
  // returns this search type, "tree" 
  private String getType() { return type; }

    // returns the temp table name
  private String getTempTableName() { return "RESULT_TREE"; } 

  // instantiates an empty type-specific Node
  private void instantiateNode() { 
    if ( TreeTypes.getNodeClassname( getTreeType() ) != null ) {
      try {
        Class c = Class.forName( TreeTypes.getNodeClassname( getTreeType() ) );
        node = (Node)c.newInstance();
      } catch ( ClassNotFoundException cnfe ) {
        cnfe.printStackTrace();        
      } catch ( InstantiationException ise ) {
        ise.printStackTrace();        
      } catch ( IllegalAccessException iae ) { 
        iae.printStackTrace();        
      }
      node_exists = true;
    } else {
      node_exists = false;   
    }
  }

  private Node getNode() { return node; }  

  private boolean nodeExists() { return node_exists; } 

    // sets a list of node ids for the current rows in the temp table - node_id_list for the tree
    // don't include the root node
  private void setNodeIDList() throws SQLException { 
    node_id_list = new ArrayList();
    DBconnection conn = null;
    String query = 
      "select node_id from " + getTempTableName() +
      " where parent_id > 0 ";
    Debugger.println( Debugger.logMsg( this, " node id list select = " + query ) );
    try {
      conn = getConnection();      
      conn.setQuery( query );
      ResultSet results = conn.getResultSet();
      while ( results.next() ) node_id_list.add( new Long( results.getLong( "node_id" ) ) );
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
    Debugger.println( Debugger.logMsg( this, " node id list size = " + node_id_list.size() ) );  
  } 

    // returns the list of node ids for the rows in temp table - node_id_list for the tree
    // doesn't include the root node
  private ArrayList getNodeIDList() { return node_id_list; } 

    // sets hide_children
  private void setHideChildren( String hide_children ) { this.hide_children = hide_children; } 

    // returns hide_children 
  private String getHideChildren() { return hide_children; }

  // insert the node as a row into the temp table 
  private void insertNode() throws SQLException {
    DBconnection conn = null;
    String query = 
      "insert into " + getTempTableName() +
      " values ( " +  getNode().getNodeID().toString() + " , " +
        getNode().getParentID().toString() + " , " + 
       ( new Integer( getNode().getSibOrder() ) ).toString() + " , " +
       ( new Integer( getNode().getTotSibs() ) ).toString() + " , " +
       ( new Integer( getNode().getTotChildren() ) ).toString() + " , " +
       TextConverter.dbQuote( "N" ) + " , " +
       ( new Integer( getNode().getDepth() ) ).toString() + " , " +
	//TextConverter.dbQuote( "Y" ) + " , " +
       TextConverter.dbQuote( getHideChildren() ) + " , " +
       TextConverter.dbQuote( getNode().getNodeIcon() ) + " , " +
       TextConverter.dbQuote( "X" ) + " , " +
       TextConverter.dbQuote( getNode().getDisplayData2() ) + " ) ";
    Debugger.println( Debugger.logMsg( this, " node insert = " + query ) );
    try {
      conn = getConnection();
      conn.setQuery( query );
      conn.executeUpdate();
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    } 
  }  

  /**
   **  required methods per implementation of interface TreeDataModel
   **/    
  public void addTopNode( Long node_id ) throws SQLException {
    instantiateNode();
    getNode().setTopNodeData( node_id );  // populates the node based on type specific logic, top nodes have the parent id = 0
    setHideChildren( "N" ); 
    while ( getNode().getParentID().longValue() > 0 ) {	
      insertNode();
      getNode().setTopNodeData( getNode().getParentID() ); 	
    }
    insertNode();
  }

  /**
   **  required methods per implementation of interface TreeDataModel
   **/ 
  public void addChildren( String query_identifier, Long parent_id, String node_option ) throws SQLException {
    // create a set of nodes that have this parent, insert into the temp table
    setQueryIdentifier( query_identifier );

    instantiateNode();
    getNode().setParentNodeData( getQueryIdentifier(), parent_id );  // populates the parent node from values in temp table
    if ( getNode().getTotChildren() > 0 && getNode().getChildrenLoaded().equalsIgnoreCase("N") ) {
      Long[] children = getNode().getChildren();
      // iterate thru the children, setting the node data, then getting the specific pieces of node data to 
      // insert into the temp table
      if ( node_option != null ) getNode().setNodeOption( node_option ); 
      for ( int i = 0; i < children.length; i ++ ) {
        getNode().setNodeData( getQueryIdentifier(), children[i], parent_id ); // populates the node based on type specific logic
        setHideChildren( "Y" );
	// may need to either insert or update the node 
	if ( getNode().getDepth() < 1 ) {
	  updateOrInsertNode();
	} else {
          insertNode();
	}
      }
    }
    // update parent rows, children_loaded field, put the sql right here
    DBconnection conn = null;
    String query = 
      "update " + getTempTableName() +
      " set children_loaded = " + TextConverter.dbQuote( "Y" ) +
      ", hide_children = "  + TextConverter.dbQuote( "N" ) +	
      ", display_data_1 = "  + TextConverter.dbQuote( "-" ) +	
      " where node_id = " + parent_id.toString();
    Debugger.println( Debugger.logMsg( this, " update parent = " + query ) );
    try {
      conn = getConnection();
      conn.setQuery( query );
      conn.executeUpdate();
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    } 
  }

  /**
   **  required methods per implementation of interface TreeDataModel
   **/ 
  public void removeChildren( String query_identifier, Long parent_id ) throws SQLException {
    DBconnection conn = null;
    String query = 
      "update " + getTempTableName() +
      " set hide_children = " + TextConverter.dbQuote( "Y" ) +
      " where node_id = " + parent_id.toString();
    Debugger.println( Debugger.logMsg( this, " hide children = " + query ) );
    try {
      conn = getConnection();	
      conn.setQuery( query );
      conn.executeUpdate();
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    } 
  }

  /**
   **  required methods per implementation of interface TreeDataModel
   **/ 
  public void updateTree( String node_option ) throws SQLException {
    String query = null;
    setNodeIDList();  
    instantiateNode();
      getNode().setNodeOption( node_option ); 
      DBconnection conn = null;
      // update the display_data_2 column in temp table for each node in the tree
      try {
        conn = getConnection();
        for ( int i = 0; i < getNodeIDList().size(); i ++ ) {
	  getNode().setDisplayData2( ( Long )getNodeIDList().get(i) );  
          query = 
            "update " + getTempTableName() +
            " set display_data_2 = " + TextConverter.dbQuote( getNode().getDisplayData2() ) +
            " where node_id = " + ( ( Long )getNodeIDList().get(i) ).toString();
          Debugger.println( Debugger.logMsg( this, " display_data_2 = " + query ) );	
          conn.setQuery( query );
          conn.executeUpdate();
        }
      } finally {
        if ( conn != null ) returnConnection( conn ); 
      }
  }

  // check the node and either insert or update it
  private void updateOrInsertNode() throws SQLException {
    DBconnection conn = null;
    String query = 
      "select node_id from " + getTempTableName() +
      " where node_id = " +  getNode().getNodeID().toString();
    Debugger.println( Debugger.logMsg( this, " node select = " + query ) );
    boolean update_needed = false;
    try {
      conn = getConnection();      
      conn.setQuery( query );
      ResultSet results = conn.getResultSet();
      if ( results.next() ) update_needed = true;
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    } 
    if ( update_needed ) {
      query = 
      "update " + getTempTableName() +
      " set sib_order = " + ( new Integer( getNode().getSibOrder() ) ).toString() +
      ", tot_sibs = "  + ( new Integer( getNode().getTotSibs() ) ).toString() +	
      ", display_data_2 = " + TextConverter.dbQuote( getNode().getDisplayData2() ) +	
      " where node_id = " + getNode().getNodeID().toString();
      Debugger.println( Debugger.logMsg( this, " update sib_order, tot_sibs = " + query ) );
      try {
	conn = getConnection();	
        conn.setQuery( query );
        conn.executeUpdate();
      } finally {
        if ( conn != null ) returnConnection( conn ); 
      } 
    } else {
      insertNode();	
    }
  }  

}
