/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;

/**
 * KeywordTypeCollection is a custom collection that stores
 * distinct keyword types associated to a given object type as a collection of 
 * <code>KeywordType</code> objects. 
 * <p>
 * The KeywordType objects include relationship types and keywords from the type specific linking table that the 
 * keyword and child table id reside in.  
 * For example, a collection of KeywordType objects created from a tair_object_id would 
 * contain relationship types and keywords 
 * specific to the TairObject_Keyword linking table so this would make sense to be created for use on a Gene detail page
 * where as a Publications detail page would create a KeywordTypeCollection that would contain relationship types and 
 * keywords specific to the Reference_Keyword linking table
 * KeywordType objects differ from KeywordLite objects in that KeywordType objects contain information grouped by 
 * distinct keyword types for given object id (whether its a tair_object or reference object or whatever).  The KeywordLite
 * object contains information grouped by a distinct keyword_id for the given object id   
 */


public class KeywordTypeCollection {
  private ArrayList keyword_type_objects;
  private Long annotation_type_id;
  private String linking_table_name;
  private String column_name;
  private String child_table_name;
  private ArrayList keyword_type_ids;  

  /**
   * Creates an empty instance of KeywordTypeCollection 
   */
  public KeywordTypeCollection() {
    keyword_type_objects = new ArrayList();
  }
  
  /**
   * Creates an instance of KeywordTypeCollection that contains distinct keyword types
   * associated to a given child data element , where child data element are Gene, typically coming from the 'gene' 
   * detail page,
   * or Publication, coming from the 'publication' detail page  
   *
   * @param conn An active connection to the database
   * @param id ID of child data element to get the associated keyword type ids for
   * @param child_table_name, to determine the specific KeywordType objects to generate to populate the collection with  
   * @throws SQLException in the case of an invalid operation or database error
   */
  public KeywordTypeCollection( DBconnection conn, Long id, String child_table_name ) throws SQLException {
    keyword_type_objects = new ArrayList();
    if ( id != null && child_table_name != null ) {
      populate( conn, id, child_table_name );
    }
  }

  /**
   * Creates an instance of KeywordTypeCollection that contains distinct keyword types
   * associated to a given child data element , where child data element are Gene, typically coming from the 'gene' 
   * detail page,
   * or Publication, coming from the 'publication' detail page  
   *
   * @param conn An active connection to the database
   * @param Long[] IDs of child data element to get the associated keyword type ids for
   * @param child_table_name, to determine the specific KeywordType objects to generate to populate the collection with  
   * @throws SQLException in the case of an invalid operation or database error
   */
  public KeywordTypeCollection( DBconnection conn, Long[] ids, String child_table_name ) throws SQLException {
    keyword_type_objects = new ArrayList();
    if ( ids != null && child_table_name != null ) {
      populate( conn, ids, child_table_name );
    }
  }
    // instantiates  TfcAnnotationType and gets the values for linking table name, annotation_type_id, 
    // column name 
    // to generate the objects that the collection will hold 
  private void setAnnotationTypeInfo( DBconnection conn, String child_table_name ) throws SQLException {
    TfcAnnotationType tat = new TfcAnnotationType( conn, child_table_name );
    annotation_type_id = tat.getAnnotationTypeID();
    linking_table_name = tat.getLinkingTableName();
    column_name = tat.getColumnName();
    conn.releaseResources();
  }

  private Long getAnnotationTypeID() { return annotation_type_id; }
  private String getLinkingTableName() { return linking_table_name; } 
  private String getColumnName() { return column_name; }  
  private String getChildTableName() { return child_table_name; }  

  private void populate( DBconnection conn, Long id, String child_table_name ) throws SQLException {	
    if ( id != null && child_table_name != null ) {
      this.child_table_name = child_table_name;	
      setAnnotationTypeInfo( conn, child_table_name );
      setKeywordTypeIDs( conn, id );
      KeywordType kt = null;
      for ( int i = 0; i < getKeywordTypeIDs().size(); i ++ ) {
          kt = new KeywordType();
	  kt.populate( conn, ( String )getKeywordTypeIDs().get( i ), id, getLinkingTableName(), getColumnName() );
	  keyword_type_objects.add( kt ); 
      }
      Collections.sort (keyword_type_objects, new KeywordTypeComparator());
    }
  }

  private void populate( DBconnection conn, Long[] ids, String child_table_name ) throws SQLException {	
    if ( ids != null && child_table_name != null ) {
      this.child_table_name = child_table_name;	
      setAnnotationTypeInfo( conn, child_table_name );
      setKeywordTypeIDs( conn, ids );
      KeywordType kt = null;
      for ( int i = 0; i < getKeywordTypeIDs().size(); i ++ ) {
          kt = new KeywordType();
	  kt.populate( conn, ( String )getKeywordTypeIDs().get( i ), ids, getLinkingTableName(), getColumnName() );
	  keyword_type_objects.add( kt ); 
      }
      Collections.sort( keyword_type_objects, new KeywordTypeComparator() );
    }
  }
    // generate the list of keyword type ids that will be used to create the Keyword objects for the collection 
  private void setKeywordTypeIDs( DBconnection conn, Long[] ids )throws SQLException {
      if ( ids != null ) {
          keyword_type_ids = new ArrayList();
          StringBuffer inList = new StringBuffer(" IN (  ");
          for ( int i = 0; i < ids.length; i ++) {
              if ( i > 0 ) inList.append(" , ");
              inList.append( ids[i].toString() );
          }
	  inList.append(" ) ");
          String query = "SELECT DISTINCT k.keyword_type_id AS keyword_type_id FROM " + 
              getLinkingTableName() + " lt, " +
              " Keyword k WHERE k.keyword_type_id <> 'anat' AND " + 
              " k.keyword_id = lt.keyword_id AND lt." + getColumnName() + inList.toString();
          conn.setQuery( query );
          //          Debugger.println( Debugger.logMsg( this, "keyword type id query = " + query ) );  	  
          ResultSet results = conn.getResultSet();
          while ( results.next() ) {
              keyword_type_ids.add( results.getString( "keyword_type_id" ) ); 	
          }
          conn.releaseResources();
      }
  }
    // generate the list of keyword type ids that will be used to create the Keyword objects for the collection 
  private void setKeywordTypeIDs( DBconnection conn, Long id )throws SQLException {
      if ( id != null ) {
          keyword_type_ids = new ArrayList();  
          String query = "SELECT DISTINCT k.keyword_type_id AS keyword_type_id FROM " + 
              getLinkingTableName() + " lt, " +
              " Keyword k WHERE k.keyword_type_id <> 'anat' AND " + 
              " k.keyword_id = lt.keyword_id AND lt." + getColumnName() + " = " + id.toString();
          conn.setQuery( query );
          //Debugger.println( Debugger.logMsg( this, "keyword type id query = " + query ) );  	  
          ResultSet results = conn.getResultSet();
          while ( results.next() ) {
              keyword_type_ids.add( results.getString( "keyword_type_id" ) ); 	
          }
          conn.releaseResources();
      }
  }

  private ArrayList getKeywordTypeIDs() { return keyword_type_ids; }
  
  public List getKeywordTypeObjects() { return keyword_type_objects; }

  
  /**
   * Determines if collection has keyword types in it
   *
   * @return <code>true</code> if collection has no keyword types in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return keyword_type_objects.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return keyword_type_objects.size(); }

  /**
   * Retrieve element at supplied index
   * 
   * @return KeywordType at supplied index, or <code>null</code> if no element at supplied index
   */
  public KeywordType elementAt( int index ) { return ( KeywordType ) keyword_type_objects.get( index ); }

  /**
   * Determines if supplied element is in collection
   *
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( KeywordType keyword_type_object ) { return keyword_type_objects.contains( keyword_type_object ); }

  /**
   * Retrieve all elements in collection 
   *
   * @return All keyword types in collection as an <code>Iterator</code> of <code>KeywordType</code>
   * objects, or <code>null</code> if no keyword types in collection
   */
  public Iterator iterator() { return ( !keyword_type_objects.isEmpty() ) ? keyword_type_objects.iterator() : null; }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** KeywordTypeCollection content test ******" );
    System.out.println( "child table name = " + getChildTableName() );
    System.out.println( "annotation type id = " + getAnnotationTypeID() );
    System.out.println( "linking table name = " + getLinkingTableName() );
    System.out.println( "column name = " + getColumnName() );
    KeywordType kt = null;
    Iterator iter = iterator();
    if ( iter != null ) {
      while ( iter.hasNext() ) {
        kt = ( KeywordType ) iter.next();
        kt.test();
      }
    } 
    System.out.println( "**** KeywordTypeCollection content test end ****" );
    
  }  

  /**
   * For unit testing only
   */
  public static void main( String[] args ){
    try{
      DBconnection conn = new DBconnection();
      Long id = new Long( 504954323 ); 
      String child_table_name = "Gene"; 
      KeywordTypeCollection kwtc = new KeywordTypeCollection( conn, id, child_table_name );
      kwtc.test();
      id = new Long( 4876 ); 
      child_table_name = "Publication"; 
      kwtc = new KeywordTypeCollection( conn, id, child_table_name );
      kwtc.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }

  }

}
  








