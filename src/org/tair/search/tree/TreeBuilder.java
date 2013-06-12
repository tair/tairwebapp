/* 
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.util.*;
import java.sql.*;

import org.tair.utilities.*;

/**
   ** right now it uses DBTreeDataModel which implements TreeDataModel ( so temp table wouldn't have to be used to
   ** hold the data, a different TreeDataModel could be created that implements the methods differently ) 
   ** which must have the following methods defined: 
 */


public class TreeBuilder {

private static TreeDataModel tdm;
  /**
   *     initializes the tree with one or more nodes, id for initialization of tree id an entity id used to build the initial
   *     nodes in the tree -- for keyword tree the id is the keyword_id 
   */
  public static void initializeTree( String query_identifier, String tree_type, Long node_id ) throws SQLException {
    // set the data model for this tree type
    setTreeDataModel( tree_type );
    getTreeDataModel().setTreeType( tree_type );
    getTreeDataModel().setQueryIdentifier( query_identifier );
    getTreeDataModel().addTopNode( node_id );
  }

  /**
   *     removes one or more nodes from the tree, id here is the unique row identifier in the tree temp table
   *     this was changed from an entity id(node_id) or keyword_id, in the case of the keyword tree, to handle multiple parents
   *     if the concept of multiple parents is not being used - then the entity id (node_id) can be used  
   */
  public static void collapse( String query_identifier, String tree_type, Long id ) throws SQLException {
    // set the data model for this tree type
    setTreeDataModel( tree_type );
    getTreeDataModel().setTreeType( tree_type );
    getTreeDataModel().setQueryIdentifier( query_identifier );
    getTreeDataModel().removeChildren( query_identifier, id );
  }

  /**
   *     adds one or more nodes from the tree, id here is the unique row identifier in the tree temp table
   *     this was changed from an entity id(node_id) or keyword_id, in the case of the keyword tree, to handle multiple parents
   *     if the concept of multiple parents is not being used - then the entity id (node_id) can be used  
   */
  public static void expand( String query_identifier, String tree_type, Long id, String node_option ) throws SQLException {
      // set the data model for this tree type
    setTreeDataModel( tree_type );
    getTreeDataModel().setTreeType( tree_type );
    getTreeDataModel().setQueryIdentifier( query_identifier );
    getTreeDataModel().addChildren( query_identifier, id, node_option );      
  }

  /**
   *     updates each node in the tree with user selected option
   */
  public static void updateTree( String query_identifier, String tree_type, String node_option ) throws SQLException {
      // set the data model for this tree type
    setTreeDataModel( tree_type );
    getTreeDataModel().setTreeType( tree_type );
    getTreeDataModel().setQueryIdentifier( query_identifier );
    getTreeDataModel().updateTree( node_option );      
  }

    // instantiates the data model for this tree type  
  private static void setTreeDataModel( String tree_type ) { 
    if ( TreeTypes.getDataModelClassname( tree_type ) != null ) {
      try { 
        Class c = Class.forName( TreeTypes.getDataModelClassname( tree_type ) );
        tdm = ( TreeDataModel )c.newInstance();
      } catch ( ClassNotFoundException cnfe ) {
        cnfe.printStackTrace();        
      } catch ( InstantiationException ise ) {
        ise.printStackTrace();        
      } catch ( IllegalAccessException iae ) { 
        iae.printStackTrace();        
      } 
    } 
  }
  // returns the data model for this tree type  
  private static TreeDataModel getTreeDataModel() { return tdm; } 

  // test independently of jsp
    /**
     * main function is used to for testing only 
    */
  public static void main(String[] args){
  }
}
