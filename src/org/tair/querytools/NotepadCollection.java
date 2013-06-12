/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;


/** 
 * NotepadCollection is a custom collection that stores all user notepad
 * entries for a tair object as a collection of <code>Notepad</code> objects
 */

public class NotepadCollection {
  private ArrayList notes;

  /**
   * Creates an empty instance of NotepadCollection
   */
  public NotepadCollection() {
    notes = new ArrayList();
  }

    
  /**
   * Creates an instance of NotepadCollection that stores all notes associated to
   * supplied tair object id
   *
   * @param conn An active connection to the database
   * @param tair_object_id ID to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public NotepadCollection( DBconnection conn, Long tair_object_id ) throws SQLException {
    notes = new ArrayList();
    if ( tair_object_id != null ) {
      populate( conn, tair_object_id );
    }
  }
  
  // retrieve associated notes for tair_object_id & create Notepad objects for each
  private void populate( DBconnection conn, Long tair_object_id ) throws SQLException {
    String query = null;
    ArrayList ids = null;
    ResultSet results = null;
    Notepad note = null;
    Iterator iter = null;
    
    if ( tair_object_id != null ) {
      query = 
	"SELECT notepad_id " +
	"FROM Notepad " +
	"WHERE status = 'active' " +
	"AND tair_object_id = " + tair_object_id.toString() + " " +
	"ORDER BY date_entered DESC";
      
      conn.setQuery( query );
      results = conn.getResultSet();

      while ( results.next() ) {
	if ( ids == null ) {
	  ids = new ArrayList();
	}
	ids.add( new Long( results.getLong( "notepad_id" ) ) );
      }
      
      conn.releaseResources();
	
      if ( ids != null && !ids.isEmpty() ) {
	iter = ids.iterator();
	while ( iter.hasNext() ) {
	  note = new Notepad( conn, (Long) iter.next() );
	  add( note );
	}
      }
    }
  }

  /**
   * Determines if collection has notes in it or not
   *
   * @return <code>true</code> if collection has no notes in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return notes.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return notes.size(); }

  /**
   * Retrieve Notepad object at supplied index
   *
   * @return Notepad at supplied index, or <code>null</code> if no element at supplied index
   */
  public Notepad get( int index ) { return (Notepad) notes.get( index ); }


  /**
   * Adds supplied element to collection
   * 
   * @param note Notepad to add to collection
   */
  public void add( Notepad note ) { notes.add( note ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param note Notepad to remove from collection
   */
  public void remove( Notepad note ) { notes.remove( note ); }

  /**
   * Determines if supplied element is in collection or not
   *
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( Notepad note ) { return notes.contains( note ); }

  /**
   * Retrieve all elements in collection
   *
   * @return All notes in collection as an <code>Iterator</code> of <code>Notepad</code>
   * objects, or <code>null</code> if no notes in collection
   */
  public Iterator iterator() { return ( !notes.isEmpty() ) ? notes.iterator() : null; }


  /**
   * Retrieve all elements in collection, optionally only returning first 5 elements
   * (most recent notes) in collection
   *
   * @param showAll If <code>true</code> all notes in collection will be returned; if
   * <code>false</code> only first 5 elements (most recent) will be returned
   * @return Requested notes in collection as an <code>Iterator</code> of <code>Notepad</code>
   * objects, or <code>null</code> if no notes in collection
   */
  public Iterator iterator( boolean showAll ) { 
    Iterator returnIter = null;
    ArrayList tmp = null;
    Iterator iter = null;

      
    if ( !isEmpty() ) {
      if ( showAll ) { 
	returnIter = iterator();
      } else {
	int maxEntries = 5;
	tmp = new ArrayList();
	iter = iterator();
	while ( maxEntries-- > 0 && iter.hasNext() ) {
	  tmp.add( iter.next() );
	}

	if ( !tmp.isEmpty() ) {
	  returnIter = tmp.iterator();
	}
      }
    }

    return returnIter;
  }



  /**
   * For unit testing only
   */
  public void test() {
    Iterator iter = notes.iterator();
    if ( iter != null ) {
      while ( iter.hasNext() ) {
	Notepad note = (Notepad) iter.next();
	note.test();
      }
    }
  }


  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      Long id = new Long( 138516 );
      NotepadCollection notes = new NotepadCollection( conn, id );
      notes.test();


    } catch ( Exception e ) {
      e.printStackTrace();
    }
      
  }
}
  








