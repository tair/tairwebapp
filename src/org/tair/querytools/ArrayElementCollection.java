/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;


/**
 * ArrayElementCollection is a custom collection that stores microarray elements
 * associated to a gene or locus as a collection of <code>ArrayElement</code> 
 * objects. 
 */


public class ArrayElementCollection {

    private ArrayList arrayElements;

    /**
     * Creates an instance of ArrayElementCollection that
     * represents a collection of ArrayElement objects for 
     * submitted id
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type the two types currently are single and dual
     * 		which pertain to the two types of microarray results we store
     * 		@see SingleChannelHybDataSearcher and DualChannelHybDataSearcher
     * @throws SQLException in the case of an invalid operation or database error
     */
    public ArrayElementCollection( DBconnection conn, Long id, String type )
    	throws SQLException {
        arrayElements = new ArrayList();
        getElements( conn, id, type );
    }
    
    /**
     * Creates an instance of ArrayElementCollection that
     * represents a collection of ArrayElement objects for 
     * submitted id
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public ArrayElementCollection( DBconnection conn, Long id ) throws SQLException {
        arrayElements = new ArrayList();
        getElements( conn, id );
    }


    /**
     * Retrieves array element ids in ArrayElement table associated to locus 
     * through MapElement_Locus and creates ArrayElement objects for each.  ArrayElement
     * is a "virtual" type, where concrete data is actually in Clone, DnaFragment or
     * Unknown table, but ArrayElement should have enough data to display element
     * in most cases.
     * 
     * @param conn An active connection to the database
     * @param locus_id Locus id to retrieve array elements for
     * @throws SQLException if a database error occurs
     */
    private void getElements( DBconnection conn, Long locus_id ) 
    	throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList ids = null;
        Iterator iter = null;

        query = 
            "SELECT a.array_element_id " +
            "FROM ArrayElement a, MapElement_Locus ml " +
            "WHERE a.map_element_id = ml.map_element_id " +
            "AND ml.locus_id = " + locus_id.toString();

        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "array_element_id" ) ) );
        }
        conn.releaseResources();
        
        if ( ids != null && !ids.isEmpty() ) {
            iter = ids.iterator();
            while ( iter.hasNext() ) {
                add( new ArrayElement( conn, (Long) iter.next() ) );
            }
        }
    }
    
    /**
     * Retrieves array element ids in ArrayElement table associated to locus 
     * through MapElement_Locus and creates ArrayElement objects for each.  ArrayElement
     * is a "virtual" type, where concrete data is actually in Clone, DnaFragment or
     * Unknown table, but ArrayElement should have enough data to display element
     * in most cases.
     * 
     * @param conn An active connection to the database
     * @param locus_id Locus id to retrieve array elements for
     * @param type single or dual depending on experimant platform
     * 			
     * @throws SQLException if a database error occurs
     */
    private void getElements( DBconnection conn, Long locus_id, String type ) 
    	throws SQLException {
        StringBuffer query = null;
        ResultSet results = null;
        ArrayList ids = null;
        Iterator iter = null;
        query = new StringBuffer(  
                "SELECT a.array_element_id " +
                "FROM ArrayElement a, MapElement_Locus ml " +
                "WHERE a.map_element_id = ml.map_element_id " +
                "AND ml.locus_id = " );
        
        if ( locus_id != null ) {
        	query.append(locus_id);
    	    if ( type != null ) {
    	    	if ( type.equalsIgnoreCase("single") ) {
    	    		//build sql for single channel array elements
    	    		query.append( " AND a.manufacturer = 'Affymetrix'");
    	    	} else if ( type.equalsIgnoreCase("dual") ) {
    	    		query.append( " AND a.manufacturer = 'AFGC'");
    	    	}
    	    }
        }

        conn.setQuery( query.toString() );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "array_element_id" ) ) );
        }
        conn.releaseResources();
        
        if ( ids != null && !ids.isEmpty() ) {
            iter = ids.iterator();
            while ( iter.hasNext() ) {
                add( new ArrayElement( conn, (Long) iter.next() ) );
            }
        }
    }
  
  
    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no elements in it, or <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return ( arrayElements != null && arrayElements.isEmpty() ); }
    
    /*
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return ( arrayElements != null ) ? arrayElements.size() : 0; }
    
    
    /**
     * Retrieve all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of <code>ArrayElement</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() {
        return !isEmpty() ? arrayElements.iterator() : null;
    }
    
    /**
     * Retrieves elements at submitted index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public ArrayElement elementAt( int index ) {
        return (ArrayElement) arrayElements.get( index );
    }    
    

   /**
     * Adds supplied element to collection
     * 
     * @param arrayElement ArrayElement to add to collection
     */
    public void add( ArrayElement arrayElement ) { arrayElements.add( arrayElement ); }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param arrayElement ArrayElement to remove from collection
     */
    public void remove( ArrayElement arrayElement ) { arrayElements.remove( arrayElement ); }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( ArrayElement arrayElement ) { return arrayElements.contains( arrayElement ); }


    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be sorted by
     */
    public void sort( Comparator comparator ) {
        Collections.sort( arrayElements, comparator );
    }
    
    
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** ArrayElementCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                ArrayElement element = (ArrayElement) iter.next();
                element.test();
            }
        }
        System.out.println( "**** ArrayElementCollection content test end ****" );
    }
    
    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long locusID = new Long( 39138 );
            ArrayElementCollection elements = new ArrayElementCollection( conn, locusID );
            elements.test();
            
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}

