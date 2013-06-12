/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;
import org.tair.querytools.*;

/**
 **  populates Node attributes from type specific database tables -- in this case keyword tables and the temp table
 **  KeywordNode allows for multiple parents -- maybe a multi parent Node class should be built 
 **/

public class KeywordNode implements MultiParentNode {

  private Long node_id;
  private Long parent_id;
  private Long row_id;
  private Long parent_row_id; // added to handle multiple parents
  private int sib_order;
  private DBReadManager connectionPool;
  private String temp_table_name;
  private int tot_sibs;
  private int tot_children;
  private Long[] children;
  private int depth = 1;
  private String children_loaded; 
  private String node_icon = "/images/cleargif.gif";
  private final String is_a_icon = "/images/tree/is_a.gif";
  private final String part_of_icon = "/images/tree/part_of.gif"; 
  private final String develops_from_icon = "/images/tree/develops_from.gif"; 
  private final String regulates_icon = "/images/tree/regulates.gif";
  private final String neg_regulates_icon = "/images/tree/neg_regulates.gif";
  private final String pos_regulates_icon = "/images/tree/pos_regulates.gif";
  
  private String display_data_2;
  private AnnotationCountPopulator acp;   
  private boolean has_node_option = false;
  private String node_option;
  private boolean is_leaf;  
  private boolean has_shortest_path;
  private ArrayList parent_list;  
  
  public KeywordNode() {
    setAnnotationCountPopulator();  
  } 
    // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBReadManager.getInstance();
    return connectionPool.get_connection();    
  }
    // releases a connection back to the database pool
  private void returnConnection( DBconnection conn ) throws SQLException { connectionPool.return_connection( conn ); }

    // instantiates a AnnotationCountPopulator object
  private void setAnnotationCountPopulator() { acp = new AnnotationCountPopulator(); }

    // returns a handle to an instantiated AnnotationCountPopulator object
  private AnnotationCountPopulator getAnnotationCountPopulator() { return acp; }

    // sets the attributes for this top node, in order to be added to temp table - may need to change setParent  
  public void setTopNodeData( Long node_id ) throws SQLException {
    // given a keyword id, provide values for node_id, parent_id, sib_order, tot_sibs, tot_children, list of children ids
    this.node_id = node_id;
    parent_id = new Long( 0 );
    parent_row_id = new Long( 0 );
    sib_order = 0; // since this is a top node
    tot_sibs = 0; // since this is a top node
    DBconnection conn = null;
    try {
      conn = getConnection(); 
      setChildren( conn, node_id ); // populates children array with child ids from TermRelationship t 	
      tot_children = getChildren().length;
      setParent( conn, node_id );
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
  }

    // this version is needed for builing the parentage nodes when the starting node has multiple parents
  public void setTopNodeData( Long node_id, Long parent_id ) throws SQLException {
    this.node_id = node_id;
    this.parent_id = parent_id;
    // hmmm, not quite sure what to do with this just yet, leave it be for now 
    parent_row_id = new Long( 0 );
    sib_order = 0; // since this is a top node
    tot_sibs = 0; // since this is a top node
    depth -- ;
    DBconnection conn = null;
    try {
      conn = getConnection(); 
      setChildren( conn, node_id ); // populates children array with child ids from TermRelationship t 	
      tot_children = getChildren().length;
      setNodeIcon( conn, node_id, parent_id );
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
  }

  public void setParentNodeData( String query_identifier, Long id ) throws SQLException {
    //  given a row id, provide values for node_id, parent_id, sib_order, tot_sibs, tot_children, list of children ids
    //  get from temp table -- row already exists
    //  if children_loaded = "y" look in temp table otherwise invoke setChildren( node_id ); 	
    //  tot_children = also from temp table should agree with getChildren().length
      //this.node_id = node_id;
    String query = 
      "select * from " + getTempTableName() + 
      " where query_identifier = " + TextConverter.dbQuote(query_identifier ) + 
      " and row_id = " + id.toString();
    //Debugger.println( Debugger.logMsg( this, "setParentNodeData query " + query ) );
    DBconnection conn = null;
    try {
      conn = getConnection(); 	
      conn.setQuery( query );    
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
        node_id = new Long( results.getLong( "node_id" ) );
        parent_id = new Long( results.getLong( "parent_id" ) );
        parent_row_id = new Long( results.getLong( "parent_row_id" ) );
        sib_order = results.getInt( "sib_order" );
        tot_sibs = results.getInt( "tot_sibs" );
        tot_children = results.getInt( "tot_children" );
        depth = results.getInt( "depth" );
        children_loaded = results.getString( "children_loaded" );
        node_icon = results.getString( "node_icon" );
      } else {  // record not found
	  //Debugger.println( Debugger.logMsg( this, "couldn't find the node in temp table for id = " + id ) );
      }
      conn.releaseResources();
      if ( tot_children > 0 ) {
        if ( children_loaded.equalsIgnoreCase( "Y" ) ) {
          // set from temp table query
          children = new Long[ tot_children ];
          String child_query = 
          "select node_id AS child_id from " + getTempTableName() + 
          " where query_identifier = " + TextConverter.dbQuote(query_identifier) + 
          " and parent_row_id = " + id.toString();
          //Debugger.println( Debugger.logMsg( this, " select children from temp table = " + child_query ) );
          conn.setQuery( child_query );    
          results = conn.getResultSet();
          int idx = 0;
          while ( results.next() ) {
            children[ idx ] = new Long( results.getLong( "child_id" ) );
            idx ++;
          }
          conn.releaseResources();
        } else {
	  // set from setChildren ( node_id )
	  setChildren( conn, node_id ); // populates children array with child ids  
        }
      }
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
  }
    // sets the attributes for this new node -- in order to be added to temp table 
  public void setNodeData( String query_identifier, Long node_id, Long id ) throws SQLException {
    // given a keyword id, provide values for node_id, parent_id, sib_order, tot_sibs, tot_children, list of children ids
    // get specific parent info from temp table using row_id
      //this.parent_id = parent_id;
    this.node_id = node_id;
    String query = 
      "select node_id AS parent_id, depth from " + getTempTableName() + 
      " where query_identifier = " + TextConverter.dbQuote(query_identifier) + 
      " and row_id = " + id.toString();
    //Debugger.println( Debugger.logMsg( this, "setNodeData query to get parent_id and depth " + query ) );
    DBconnection conn = null;
    try {
      conn = getConnection(); 	
      conn.setQuery( query );    
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
        parent_id = new Long( results.getLong( "parent_id" ) );
        depth = results.getInt( "depth" ) + 1;
      } else {  // record not found
	  //Debugger.println( Debugger.logMsg( this, "couldn't find the node in temp table for id = " + id ) );
      }
      conn.releaseResources();
      parent_row_id = id;
      //setDepth( conn, parent_id ); 
      setSibs( conn, node_id, parent_id );
      setChildren( conn, node_id ); // populates children array with child ids
      setNodeIcon( conn, node_id, parent_id );
      tot_children = getChildren().length;
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
    setDisplayData2( node_id ); 
  } 

    // sets the user selected node options which indicates the types of associations chosen and turns them into a 
    // set of count sql to be used for generating a display string containing the calculated 
    // association counts for each node  
  public void setNodeOption( String node_option ) throws SQLException {
      //Debugger.println( Debugger.logMsg( this, "node_option = " + node_option ) );
    if ( node_option != null ) {
      has_node_option = true;
      this.node_option = node_option;
    }
  } 

    // returns a boolean indicating whether user selected node options have been set
  private boolean hasNodeOption() { return has_node_option; }

    // returns node option
  private String getNodeOption() { return node_option; }

    // populates children array with child ids from TermRelationship table
    // node_id is used as a parent_term_id 
  private void setChildren( DBconnection conn, Long node_id ) throws SQLException {
    String query = null;
    ArrayList child_list = new ArrayList(); // because we don't know how many children there are
    if ( node_id.longValue() == 0 ) {
      // children are keyowrd with keyword_type_id = "root" in keyword table
      query = "select keyword_id AS child_id from Keyword where keyword_type_id = " + TextConverter.dbQuote( "root" );
      //Debugger.println( Debugger.logMsg( this, " children are roots in Keyword table, query = " + query ) );
      conn.setQuery( query );    
      ResultSet results = conn.getResultSet();
      while ( results.next() ) {
        child_list.add( new Long( results.getLong( "child_id" ) ) );
      }
      conn.releaseResources(); 
    } else {
      // go to TermRelationship table
      query = "select child_term_id AS child_id from TermRelationship where parent_term_id = " + node_id.toString();
      //Debugger.println( Debugger.logMsg( this, "child query = " + query ) );
      conn.setQuery( query );    
      ResultSet results = conn.getResultSet();
      while ( results.next() ) {
        child_list.add( new Long( results.getLong( "child_id" ) ) );
      }
      conn.releaseResources(); 
    }
    children = new Long[ child_list.size() ];
    for ( int i = 0; i < child_list.size(); i ++ ) children[i] = (Long)child_list.get(i);
  } 

     // sets tot_sibs and sib_order
  private void setSibs( DBconnection conn, Long node_id, Long parent_id ) throws SQLException { 
    String query = null;
    ArrayList sib_list = new ArrayList(); // because we don't know how many sibs there are
    // go to TermRelationship table, make a list of all children with the same parent 
    // we need a sib id list to get the sib order for this node_id
    query = "select child_term_id AS child_id from TermRelationship where parent_term_id = " +
	    parent_id.toString() + " order by child_id ";
    //Debugger.println( Debugger.logMsg( this, "sib query =" + query ) );
    conn.setQuery( query );    
    ResultSet results = conn.getResultSet();
    while ( results.next() ) {
      sib_list.add( new Long( results.getLong( "child_id" ) ) );
    }
    conn.releaseResources(); 
    tot_sibs = sib_list.size();
    // find this node id in the sib list
    sib_order = sib_list.indexOf( node_id );
  }

     // sets node icon
  private void setNodeIcon( DBconnection conn, Long node_id, Long parent_id ) throws SQLException { 
    String query = null;
    String rel_type = null;
    query = "select relationship_type AS rel_type from TermRelationship where parent_term_id = " +
	    parent_id.toString() + " AND child_term_id = " + node_id.toString();
    //Debugger.println( Debugger.logMsg( this, "rel type query = " + query ) );
    conn.setQuery( query );    
    ResultSet results = conn.getResultSet();
    if ( results.next() ) {
      rel_type = results.getString( "rel_type" );
    } else {
      rel_type = " ";
      //Debugger.println( Debugger.logMsg( this, "couldn't get a relationship type") );	
    }
    conn.releaseResources(); 
    if ( rel_type.equalsIgnoreCase( "is_a" ) ) {
      node_icon = is_a_icon;
    } else if ( rel_type.equalsIgnoreCase( "part_of" ) ) {
      node_icon = part_of_icon;
    } else if ( rel_type.equalsIgnoreCase( "develops_from" ) ) {
      node_icon = develops_from_icon;
    } else if ( rel_type.equalsIgnoreCase( "regulates" ) ) {
      node_icon = regulates_icon;
    } else if ( rel_type.equalsIgnoreCase( "negatively_regulates" ) ) {
      node_icon = neg_regulates_icon;
    } else if ( rel_type.equalsIgnoreCase( "positively_regulates" ) ) {
      node_icon = pos_regulates_icon;
    }
  }

  private void setDepth( DBconnection conn, Long parent_id, String query_identifier ) throws SQLException {
    //  get depth from parent in temp table -- row already exists
    String query = 
      "select depth from " + getTempTableName() + 
      " where node_id = " + parent_id.toString() + 
      " and query_identifier = " + TextConverter.dbQuote( query_identifier );
    //Debugger.println( Debugger.logMsg( this, "depth query = " + query ) );
    conn.setQuery( query );    
    ResultSet results = conn.getResultSet();
    if ( results.next() ) {
      depth = results.getInt( "depth" ) + 1;
    }
    conn.releaseResources();
  } 

    // this version is needed for building the parentage nodes when the starting node has multiple parents
  public void setDepth( int depth ) { this.depth = depth; } 

  private void setParent( DBconnection conn, Long node_id ) throws SQLException {
    //  get parent_id from TermRelationship table 
    String query = 
      "select parent_term_id, relationship_type from TermRelationship " + 
      " where child_term_id = " + node_id.toString();
    String rel_type = null;
    //Debugger.println( Debugger.logMsg( this, "parent query = " + query ) );
    conn.setQuery( query );    
    ResultSet results = conn.getResultSet();
    if ( results.next() ) {
      parent_id = new Long( results.getLong( "parent_term_id" ) );
      rel_type = results.getString( "relationship_type" );
      depth -- ;
      if ( rel_type.equalsIgnoreCase( "is_a" ) ) {
        node_icon = is_a_icon;
      } else if ( rel_type.equalsIgnoreCase( "part_of" ) ) {
        node_icon = part_of_icon;
      } else if ( rel_type.equalsIgnoreCase( "develops_from" ) ) {
        node_icon = develops_from_icon;
      }
    } else { // node does not have a parent
      depth -- ;
    }
    conn.releaseResources(); 
  }

  public void setParentList( Long node_id ) throws SQLException { 
    // given a keyword id, populate a list of parent ids
    parent_list = new ArrayList();
    String query = 
      "select parent_term_id from TermRelationship " + 
      " where child_term_id = " + node_id.toString();
    DBconnection conn = null;
    try {
      conn = getConnection();
      //Debugger.println( Debugger.logMsg( this, "parent list query = " + query ) );
      conn.setQuery( query );    
      ResultSet results = conn.getResultSet();
      while ( results.next() ) {
        parent_list.add( new Long( results.getLong( "parent_term_id" ) ) );
      }
      conn.releaseResources(); 
    } finally {
      if ( conn != null ) returnConnection( conn ); 
    }
  }

    // indicates whether temp table is used to derive node info 
    // required by interface definition
  public boolean usesTempTable() { return true; }

    // returns temp table name
  private String getTempTableName() { return " RESULT_TREE "; } 

    // returns node id 
  public Long getNodeID() { return node_id; }

    // returns parent id 
  public Long getParentID() { return parent_id; }

    // returns row id 
  public Long getRowID() { return row_id; }

    // returns parent id 
  public Long getParentRowID() { return parent_row_id; }

    // returns sib order 
  public int getSibOrder() { return sib_order; }

    // returns tot sibs 
  public int getTotSibs() { return tot_sibs; }

    // returns tot children 
  public int getTotChildren() { return tot_children; }

    // returns list of children ids
  public Long[] getChildren() { return children; }

    // returns depth - distance from top node 
  public int getDepth() { return depth; }

    // returns node icon 
  public String getNodeIcon() { return node_icon; }

    // sets display data 2 value for specified node 
  public void setDisplayData2( Long node_id ) throws SQLException { 
    StringBuffer count_buffer = new StringBuffer(" ");
    boolean first_time = true;
    AnnotationCount ac = null;
    if ( hasNodeOption() && node_id != null ) {
      DBconnection conn = null;
      try {
        conn = getConnection(); 
	  getAnnotationCountPopulator().setAnnotationCount( conn, node_id, getNodeOption(), "term", true, true );
	  ac = getAnnotationCountPopulator().getAnnotationCount();
	  if ( ac.getCount() > 0 ) {
	    first_time = false;
	    count_buffer.append( " ( " );
	    count_buffer.append( ac.getHyperlink() );
	  }
          getAnnotationCountPopulator().setAnnotationCount( conn, node_id, getNodeOption(), "children", true, false );
	  ac = getAnnotationCountPopulator().getAnnotationCount(); 
	  if ( ac.getCount() > 0 ) {
	    if ( first_time ) {
	      first_time = false;
	      count_buffer.append( " ( " );
	    } else { // not first_time
	      count_buffer.append( " + " );  
	    } // end first_time check
	    count_buffer.append( ac.getHyperlink() );
	  }
      if ( !first_time ) count_buffer.append( " ) " );
      } finally {
        if ( conn != null ) returnConnection( conn ); 
      }
    }
    display_data_2 = new String( count_buffer );
  } 

  // returns display data 2 value 
  public String getDisplayData2() { return ( display_data_2 != null ) ? display_data_2 : new String(" "); } 

    // returns value of children_loaded
  public String getChildrenLoaded() { return children_loaded; } 

    // returns parent list
  public ArrayList getParentList() { return parent_list; } 

    // returns boolean flag indicating whether or not the node has multiple parents
  public boolean hasMultipleParents() { return ( parent_list != null && parent_list.size() > 1 );  } 

}
