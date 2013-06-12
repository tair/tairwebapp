/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;

/**
 * NTSequenceCollection is a custom collection that stores all nucleotide
 * sequences for an object as a collection of <code>Sequence</code> objects. 
 * This collection differs from <code>NucleotideSeqCollection</code> in that it 
 * contains <code>Sequence</code> objects instead of <code>TfcNucleotideSequence</code>
 * objects.  Constructors  offer option of creating <code>Sequence</code> objects 
 * with full sequence text, or without.  This allows user to only retrieve sequence
 * text when it is desired for display, and avoids the overhead of unnecessarily 
 * retrieving large sequence data.
 *
 * <p>
 * NT sequences are most often retrieved for map elements, but one version of
 * constructor allows for alternate population modes (vector, for example) through
 * a String type param
 */

public class NTSequenceCollection {
  private ArrayList sequences;
	
  /**
   * Creates an empty instance of NTSequenceCollection.
   */
  public NTSequenceCollection() {
    sequences = new ArrayList();
  }
  

  /**
   * Creates an instance of NTSequenceCollection that contains all sequences
   * associated with supplied map element id. This constructor version retrieves 
   * all data for each associated nucleotide sequence except for the NT sequence 
   * text itself. This version of the constructor should be used when information
   * is needed about the sequence, but the actual sequence is not required.
   *
   * @param conn An active connection to the database
   * @param map_element_id Map element id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error
   */
  public NTSequenceCollection( DBconnection conn, Long map_element_id ) throws SQLException {	
    sequences = new ArrayList();
    if ( map_element_id != null ) {
      populate( conn, map_element_id, "map_element", false );
    }
  }

  /**
   * Creates an instance of NTSequenceCollection that stores all sequences associated to
   * supplied map element id, optionally including the full sequence text of each associated
   * sequence
   *
   * @param conn An active connection to the database
   * @param map_element_id ID to retrieve data for
   * @param getSequence If <code>true</code>, full sequence text will be retrieved for each
   * associated NT sequence; if <code>false</code> sequence will not be retrieved
   * @exception SQLException in the case of an invalid operation or database error
   */
  public NTSequenceCollection( DBconnection conn, Long map_element_id, boolean getSequence ) throws SQLException {
    sequences = new ArrayList();
    if ( map_element_id != null ) {
      populate( conn, map_element_id, "map_element", getSequence );
    }
  }

  /**
   * Creates an instance NTSequenceCollection, optionally including the full sequence text of 
   * each sequence in the collection. This version of the constructor allows different modes
   * of population through the type param. Current values for type include:
   *
   * <ul>
   * <li>map_element - retrieves all sequences for a given map element id. This is the default
   * population mode, and is equivalent of calling any of the other forms of constructor. 
   * Submitted id should be a map_element_id</li>
   *
   * <li>vector - retrieves all sequences for a vector. Submitted id should be a vector_id</li>
   * </ul>
   *
   * @param con An active connection to the database
   * @param id ID to retrieve NT sequences for
   * @param type Population mode to use when retrieving sequences
   * @param getSequence If <code>true</code>, full sequence text will be retrieved for
   * each associated NT sequence; if <code>false</code>, all sequence data except for
   * sequence will be retrieved
   * @exception SQLException thrown if a database error occurs
   */
  public NTSequenceCollection( DBconnection conn, Long id, String type, boolean getSequence ) throws SQLException {
    sequences = new ArrayList();
    
    if ( id != null ) {
      populate( conn, id, type, getSequence );
    }
  }


  /*
    Retrieve sequence ids associated to submitted id. ID & population method determined by
    type param. Create each sequence object using getSequence flag from constructor to determine 
    whether to retrieve sequence text or not
  */
  private void populate( DBconnection conn, Long id, String type, boolean getSequence ) throws SQLException {
    String query = null;
    ResultSet results = null;
    Sequence sequence = null;
    ArrayList ids = null;
    Iterator iter = null;
    
    if ( id != null ) {
      if ( type == null || type.equals( "map_element" ) ) {
	query = 
	  "SELECT n.nucleotide_seq_id " +
	  "FROM NucleotideSequence_MapElement m, NucleotideSequence n " +
	  "WHERE m.nucleotide_seq_id = n.nucleotide_seq_id " +
	  "AND n.is_obsolete = 'F' " + 
	  "AND m.map_element_id = " + id.toString();

      } else if ( type.equals( "vector" ) ) {
	query = 
	  "SELECT n.nucleotide_seq_id " +
	  "FROM Vector_NucleotideSequence v, NucleotideSequence n " +
	  "WHERE v.nucleotide_seq_id = n.nucleotide_seq_id " +
	  "AND n.is_obsolete = 'F' " +
	  "AND v.vector_id = " + id.toString();
      }
      
      if ( query != null ) {
	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
	  if ( ids == null ) {
	    ids = new ArrayList();
	  }
	  ids.add( new Long( results.getLong( "nucleotide_seq_id" ) ) );
	}
	conn.releaseResources();
	
	if ( ids != null && !ids.isEmpty() ) {
	  iter = ids.iterator();
	  while ( iter.hasNext() ) {
	    sequence = new Sequence( conn, (Long) iter.next(), getSequence );
	    addElement( sequence );
	  }
	}
      }
    }
  }
  
  /**
   * Determines if collection has sequences in it
   *
   * @return <code>true</code> if collection has no sequences in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return sequences.isEmpty(); }

  /**
   * Determines number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return sequences.size(); }

  /**
   * Retrieves Sequence at supplied index
   *
   * @return Sequence at supplied index, or <code>null</code> if no element at supplied index
   */
  public Sequence elementAt( int index ) { return (Sequence) sequences.get( index ); }


  /**
   * Adds supplied element to collection
   * 
   * @param sequence Sequence to add to collection
   */
  public void addElement( Sequence sequence ) { sequences.add( sequence ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param sequence Sequence to remove from collection
   */
  public void removeElement( Sequence sequence ) { sequences.remove( sequence ); }

  /**
   * Determines if collection contains submitted element
   *
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( Sequence sequence ) { return sequences.contains( sequence ); }

  /**
   * Retrieves all elements in collection 
   *
   * @return All sequences in collection as an <code>Iterator</code> of <code>Sequence</code>
   * objects, or <code>null</code> if no sequences in collection
   */
  public Iterator iterator() { return ( !sequences.isEmpty() ) ? sequences.iterator() : null; }



  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** NTSequenceCollection content test ******" );
    if ( !isEmpty() ) { 
      Sequence sequence = null;
      Iterator iter = iterator();
      while ( iter.hasNext() ) {
	sequence = (Sequence) iter.next();
        sequence.test();
      }
    }
    System.out.println( "**** NTSequenceCollection content test end ****" );
  }
  
  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      Long id = new Long( 121 );
      NTSequenceCollection sequences = new NTSequenceCollection( conn, id );
      sequences.test();

      System.out.println( "Explicit map element mode...." );
      sequences = new NTSequenceCollection( conn, id, "map_element", false );
      sequences.test();
      
      System.out.println( "Vector mode..." );
      id = new Long( 300012 );
      sequences = new NTSequenceCollection( conn, id, "vector", false );
      sequences.test();


    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
    
}
  








