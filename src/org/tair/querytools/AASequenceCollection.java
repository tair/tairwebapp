// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;


/** 
 * AASequenceCollection is a custom collection that stores all amino acid
 * sequences and associated domain match information that is associated to 
 * a supplied gene id.  AA sequence information is stored as a collection of
 * <code>AASequence</code> objects.  Constructors offer option of creating
 * AASequence objects with full sequence text, or without.  This allows
 * user to only retrieve sequence text when it is desired for display,
 * and avoids the overhead of unnecessarily retrieving large sequence data.
 */


public class AASequenceCollection {
  private ArrayList sequences;


  /**
   * Creates an empty instance of AASequenceCollection
   */
  public AASequenceCollection() {
    sequences = new ArrayList();
  }

    
  /**
   * Creates an instance of AASequenceCollection that stores all sequences associated to
   * supplied gene_id. This constructor version retrieves all data for each associated amino 
   * acid sequence except for the AA sequence text itself. This version of the constructor 
   * should be used when information is needed about the sequence, but the actual sequence
   * is not required.
   *
   * @param conn An active connection to the database
   * @param gene_id ID to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public AASequenceCollection( DBconnection conn, Long gene_id ) throws SQLException {
    sequences = new ArrayList();
    if ( gene_id != null ) {
      populate( conn, gene_id, false );
    }
  }

  /**
   * Creates an instance of AASequenceCollection that stores all sequences associated to
   * supplied gene_id, optionally including the full sequence text of each associated
   * sequence
   *
   * @param conn An active connection to the database
   * @param gene_id ID to retrieve data for
   * @param getSequence If <code>true</code>, full sequence text will be retrieved for each
   * associated aa sequence; if <code>false</code> sequence will not be retrieved
   * @throws SQLException in the case of an invalid operation or database error
   */
  public AASequenceCollection( DBconnection conn, Long gene_id, boolean getSequence ) throws SQLException {
    sequences = new ArrayList();
    if ( gene_id != null ) {
      populate( conn, gene_id, getSequence );
    }
  }
    

  
  /*
    Retrieve aa sequences associated to submitted gene id - create each 
    sequence object using getSequence flag from constructor to determine 
    whether to retrieve sequence text or not
  */
  private void populate( DBconnection conn, Long gene_id, boolean getSequence ) throws SQLException {
    String query = null;
    ArrayList ids = null;
    ResultSet results = null;
    AASequence sequence = null;
    Iterator iter = null;

    if ( gene_id != null ) {
      query = 
	"SELECT a.tair_object_id " +
	"FROM AASequence a, Gene_AASequence g " +
	"WHERE a.aa_sequence_id = g.aa_sequence_id " +
	"AND a.is_obsolete = 'F' " +
	"AND g.gene_id = " + gene_id.toString();

      conn.setQuery( query );
      results = conn.getResultSet();
      while ( results.next() ) {
	if ( ids == null ) {
	  ids = new ArrayList();
	}
	ids.add( new Long( results.getLong( "tair_object_id" ) ) );
      }
      conn.releaseResources();
	
      if ( ids != null && !ids.isEmpty() ) {
	iter = ids.iterator();
	while ( iter.hasNext() ) {
	  sequence = new AASequence( conn, (Long) iter.next(), getSequence );
	  addElement( sequence );
	}
      }
    }
  }
  

  /**
   * Determines if collection has sequences in it or not
   *
   * @return <code>true</code> if collection has no sequences in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return sequences.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return sequences.size(); }

  /**
   * Retrieves element at supplied index
   *
   * @return AASequence at supplied index, or <code>null</code> if no element at supplied index
   */
  public AASequence elementAt( int index ) { return (AASequence) sequences.get( index ); }


  /**
   * Adds supplied element to collection
   * 
   * @param sequence AASequence to add to collection
   */
  public void addElement( AASequence sequence ) { sequences.add( sequence ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param sequence AASequence to remove from collection
   */
  public void removeElement( AASequence sequence ) { sequences.remove( sequence ); }

  /**
   * Determines if supplied element is in collection
   *
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( AASequence sequence ) { return sequences.contains( sequence ); }

  /**
   * Retrieves elements in collection
   *
   * @return All sequences in collection as an <code>Iterator</code> of <code>AASequence</code>
   * objects, or <code>null</code> if no sequences in collection
   */
  public Iterator iterator() { return ( !sequences.isEmpty() ) ? sequences.iterator() : null; }


 
  /**
   * For unit testing only
   */

  public void test() {
    System.out.println( "****** AASequenceCollection content test ******" );
    if ( !isEmpty() ) {
      Iterator iter = iterator();
      AASequence sequence = null;

      while ( iter.hasNext() ) {
	sequence = (AASequence) iter.next();
	sequence.test();
      }
    }
    System.out.println( "**** AASequenceCollection content test end ****" );
  }



  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      Long gene_id = new Long( 138516 );
      AASequenceCollection sequences = new AASequenceCollection( conn, gene_id );
      sequences.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
      
  }
}
  








