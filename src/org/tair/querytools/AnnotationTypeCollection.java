/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;


/** 
 * AnnotationTypeCollection is a custom collection that stores all active annotation types stored in the
 * database int the AnnotationType table with is_active = 'T'  as a collection of
 * <code>TfcAnnotationType</code> objects. 
 */


public class AnnotationTypeCollection {
  private ArrayList tfc_annotation_types;


  /**
   * Creates an empty instance of AnnotationTypeCollection
   */
  public AnnotationTypeCollection() {
    tfc_annotation_types = new ArrayList();
  }

    
  /**
   * Creates an instance of AnnotationTypeCollection that stores all active annotation types
   *
   * @param conn An active connection to the database
   * @throws SQLException in the case of an invalid operation or database error
   */
  public AnnotationTypeCollection( DBconnection conn ) throws SQLException {
    tfc_annotation_types = new ArrayList();
    populate( conn );
  }

  /*
    Retrieve active annotation types 
  */
  private void populate( DBconnection conn) throws SQLException {
    String query = null;
    ArrayList ids = null;
    ResultSet results = null;
    query = 
	"SELECT child_table_name " +
	"FROM AnnotationType " +
	"WHERE is_active = 'T'";
    conn.setQuery( query );
    results = conn.getResultSet();
    while ( results.next() ) {
      if ( ids == null ) {
	ids = new ArrayList();
      }
      ids.add( results.getString( "child_table_name" ) );
    }
    conn.releaseResources();	
    for ( int i = 0; i < ids.size(); i ++ ) {
      tfc_annotation_types.add( new TfcAnnotationType( conn, ( String )ids.get( i ) ) ); 
    }
  }
  

  /**
   * Determines if collection has annotation types in it or not
   *
   * @return <code>true</code> if collection has no annotation types in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return tfc_annotation_types.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return tfc_annotation_types.size(); }

  /**
   * Retrieves element at supplied index
   *
   * @return TfcAnnotationType at supplied index, or <code>null</code> if no element at supplied index
   */
  public TfcAnnotationType elementAt( int index ) { return ( TfcAnnotationType ) tfc_annotation_types.get( index ); }


  /**
   * Adds supplied element to collection
   * 
   * @param tfc_annotation_type TfcAnnotationType to add to collection
   */
  public void addElement( TfcAnnotationType tfc_annotation_type ) { tfc_annotation_types.add( tfc_annotation_type ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param tfc_annotation_type TfcAnnotationType to remove from collection
   */
  public void removeElement( TfcAnnotationType tfc_annotation_type ) { tfc_annotation_types.remove( tfc_annotation_type ); }

  /**
   * Determines if supplied element is in collection
   *
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( TfcAnnotationType tfc_annotation_type ) { return tfc_annotation_types.contains( tfc_annotation_type ); }

  /**
   * Retrieves elements in collection
   *
   * @return All annotation types in collection as an <code>Iterator</code> of <code>TfcAnnotationType</code>
   * objects, or <code>null</code> if no annotation types in collection
   */
  public Iterator iterator() { return ( !tfc_annotation_types.isEmpty() ) ? tfc_annotation_types.iterator() : null; }


 
  /**
   * For unit testing only
   */

  public void test() {
    System.out.println( "****** AnnotationTypeCollection content test ******" );
    if ( !isEmpty() ) {
      Iterator iter = iterator();
      TfcAnnotationType tat = null;
      while ( iter.hasNext() ) {
	tat = ( TfcAnnotationType ) iter.next();
	tat.test();
      }
    }
    System.out.println( "**** AnnotationTypeCollection content test end ****" );
  }



  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      AnnotationTypeCollection atc = new AnnotationTypeCollection( conn );
      atc.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
      
  }
}
  








