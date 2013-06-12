/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;

/**
 * NucleotideSeqCollection is a custom collection that stores all nucleotide 
 * sequences for a map element as a collection of <code>TfcNucleotideSequence</code>
 * objects.  This collection differs from NTSequenceCollection in that it contains 
 * <code>TfcNucleotideSequence</code> objects instead of the more detailed 
 * <code>Sequence</code> objects.  Constructors  offer option of creating sequence
 * objects with full sequence text, or without.  This allows user to only retrieve
 * sequence text when it is desired for display, and avoids the overhead of 
 * unnecessarily retrieving large sequence data.
 *
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */


public class NucleotideSeqCollection implements Serializable {
    private ArrayList sequences;

    /**
     * Creates an empty instance of NucleotideSeqCollection
     */
    public NucleotideSeqCollection( ) {
        sequences = new ArrayList();
    }
  
    /**
     * Creates an instance of NucleotideSeqCollection that contains
     * all nt sequences for supplied map element id. This constructor version retrieves 
     * all data for each associated nucleotide sequence except for the NT sequence 
     * text itself. This version of the constructor should be used when information
     * is needed about the sequence, but the actual sequence is not required.
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public NucleotideSeqCollection( DBconnection conn, Long map_element_id ) throws SQLException {  
        sequences = new ArrayList();

        if ( map_element_id != null ) {
            populate( conn, map_element_id, false );// omit sequence text
        }
    }

    /**
     * Creates an instance of NucleotidSeqCollection that stores all sequences associated to
     * supplied map element id, optionally including the full sequence text of each associated
     * sequence
     *
     * @param conn An active connection to the database
     * @param map_element_id ID to retrieve data for
     * @param getSequence If <code>true</code>, full sequence text will be retrieved for each
     * associated NT sequence; if <code>false</code> sequence will not be retrieved
     * @throws SQLException in the case of an invalid operation or database error
     */
    public NucleotideSeqCollection( DBconnection conn, Long map_element_id, boolean getSequence ) throws SQLException {
        sequences = new ArrayList();
        if ( map_element_id != null ) {
            populate( conn, map_element_id, getSequence );
        }
    }


    /**
     * Retrieve sequence ids associated to submitted map element id - create each 
     * sequence object using getSequence flag from constructor to determine 
     * whether to retrieve sequence text or not
    */
    private void populate( DBconnection conn, Long map_element_id, boolean getSequence ) throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList ids = null;
        Iterator iter = null;
    
        query = 
            "SELECT n.nucleotide_seq_id " +
            "FROM NucleotideSequence_MapElement m, NucleotideSequence n " +
            "WHERE m.nucleotide_seq_id = n.nucleotide_seq_id " +
            "AND m.map_element_id = " + map_element_id.toString();
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
                addElement( new TfcNucleotideSequence( conn, 
                                                       (Long) iter.next(), 
                                                       getSequence ) );
            }
        }               
    }


    /**
     * Determines if collection is empty
     *
     * @return <code>true</code> if collection has no sequences in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { 
        return sequences.isEmpty(); 
    }

    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
        return sequences.size(); 
    }

    
    /**
     * @return element at supplied index, or <code>null</code> if no element at supplied index
     */
    public TfcNucleotideSequence elementAt( int index ) { 
        return (TfcNucleotideSequence) sequences.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param sequence Element to add to collection
     */
    public void addElement( TfcNucleotideSequence sequence ) { 
        sequences.add( sequence ); 
    }

    /**
     * Removes supplied element from collection.
     *
     * @param sequence TfcNucleotideSequence to remove from collection
     */
    public void removeElement( TfcNucleotideSequence sequence ) { 
        sequences.remove( sequence ); 
    }


    /**
     * Determines if collection contains submitted element 
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( TfcNucleotideSequence sequence ) { 
        return sequences.contains( sequence ); 
    }

    /**
     * Retrieves all NT sequences in collection
     *
     * @return All sequences in collection as an <code>Iterator</code> of 
     * <code>TfcNucleotideSequence</code> objects, or <code>null</code> if 
     * no sequences in collection
     */
    public Iterator iterator() { 
        return ( !sequences.isEmpty() ) ? sequences.iterator() : null; 
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** NucleotideSeqCollection content test ******" );
        if ( !isEmpty() ) {
            TfcNucleotideSequence sequence = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                sequence = (TfcNucleotideSequence) iter.next();
                sequence.test();
            }
        }
        System.out.println( "**** NucleotideSeqCollection content test end ****" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long test_id = new Long( 23 );
            NucleotideSeqCollection sequences = new NucleotideSeqCollection( conn, test_id );
            sequences.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }   
    }
}
  








