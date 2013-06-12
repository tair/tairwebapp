/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/** 
 * LibaryCollection is a custom collection that stores all libraries 
 * associated to a given object as a collection of <code>TfcLibrary</code>
 * objects. 
 */

public class LibraryCollection {
  private ArrayList libraries;

  /**
   * Creates an empty instance of LibraryCollection
   */
  public LibraryCollection() { 
    libraries = new ArrayList();
  }


  /**
   * Creates an instance of LibraryCollection that contains all libraries for
   * supplied id. Type of id and method of joining to id is determined by 
   * submitted type parameter.  Current valid values of type are:
   * <ul>
   * <li>vector - id should be vector_id;</li>
   * <li>stock - id should be stock_id</li>
   * </ul>
   *
   * @param conn An active connection to the database
   * @param id ID to retrieve data for
   * @param type Population method to find associated libraries by
   */
  public LibraryCollection( DBconnection conn, Long id, String type ) throws SQLException {
    libraries = new ArrayList();
    if ( id != null && type != null ) {
      populate( conn, id, type );
    }
  }


  // Populates vector by retrieving libraries associated with submitted 
  // id and storing as <code>TfcLibrary</code> objects
  private void populate( DBconnection conn, Long id, String type ) throws SQLException {
    String query = null;
    ArrayList ids = null;
    ResultSet results = null;
    TfcLibrary library = null;
    Iterator iter = null;
    
    if ( type.equals( "vector" ) ) {
      query = 
	"SELECT library_id " +
	"FROM Library " +
	"WHERE is_obsolete = 'F' " +
	"AND vector_id = " + id.toString();

    } else if ( type.equals( "stock" ) ) {
      query =
	"SELECT l.library_id " +
	"FROM Library l, TairObject_Stock ts " +
	"WHERE l.tair_object_id = ts.tair_object_id " +
	"AND l.is_obsolete = 'F' " +
	"AND ts.stock_id = " + id.toString();
    }

    if ( query != null ) {
      conn.setQuery( query );
      results = conn.getResultSet();
      while ( results.next() ){
	if ( ids == null ) {
	  ids = new ArrayList();
	}
	ids.add( new Long( results.getLong( "library_id" ) ) );
      }
      conn.releaseResources();
      
      if ( ids != null && !ids.isEmpty() ) {
	iter = ids.iterator();
	while ( iter.hasNext() ) {
	  library = new TfcLibrary( conn, (Long) iter.next() );
	  add( library );
	}
      }
    }
  }
  


  /**
   * Determines if collection has elements in it or not
   *
   * @return <code>true</code> if collection has no elements in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return libraries.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return libraries.size(); }

  /**
   * Retrieves element at supplied index as a <code>TfcLibrary</code> object
   *
   * @return Element at supplied index, or <code>null</code> if no element at supplied index
   */
  public TfcLibrary get( int index ) { return (TfcLibrary) libraries.get( index ); }


  /**
   * Adds supplied element to collection
   * 
   * @param germplasm Element to add to collection
   */
  public void add( TfcLibrary library ) { libraries.add( library ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param library Element to remove from collection
   */
  public void remove( TfcLibrary library ) { libraries.remove( library ); }

  /**
   * Determines if supplied element is in collection
   *
   * @param library Element to check
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( TfcLibrary library ) { return libraries.contains( library ); }

  /**
   * Retrieves all elements in collection
   *
   * @return All elements in collection as an <code>Iterator</code> of <code>TfcLibrary</code>
   * objects, or <code>null</code> if no elements in collection
   */
  public Iterator iterator() { return ( !libraries.isEmpty() ) ? libraries.iterator() : null; }


  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** LibraryCollection content test ******" );

    if ( !isEmpty() ) {
      Iterator iter = iterator();
      TfcLibrary library = null;
      while ( iter.hasNext() ) {
	library = (TfcLibrary) iter.next();
	library.test();
      }
    }
    System.out.println( "****** LibraryCollection content test ******" );
  }


  /**
   * For unit testing only
   */
 public static void main( String[] args ) {
	
   try{

     DBconnection conn = new DBconnection();

     System.out.println( "Retrieving libraries for vector..." );
     Long id = new Long( 23 );
     LibraryCollection libraries = new LibraryCollection( conn, id, "vector" );
     libraries.test();

     System.out.println( "\nRetrieving libraries for stock..." );
     id = new Long( 88852 );
     libraries = new LibraryCollection( conn, id, "stock" );
     libraries.test();

   } catch ( Exception e ) {
     e.printStackTrace();
   }
 }

}

  








