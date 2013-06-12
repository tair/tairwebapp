/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * ArrayDesignCollection is a custom collection that stores
 * array designs associated to an array element through Spot table
 * as a list of <code>TfcArrayDesign/code> objects. 
 */

public class ArrayDesignCollection  {   
    private ArrayList arrayDesigns;
    private int size =  0 ;
    /**
     * Creates an empty instance of ArrayDesignCollection
     */
    public ArrayDesignCollection() { 
        arrayDesigns = new ArrayList();
    }

    /**
     * Creates an instance of ArrayDesignCollection that represents a collection of 
     * TfcArrayDesign for submitted array_element_id
     *
     * @param conn An active connection to the database
     * @param array_element_id Array element id to retrieve array designs for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public ArrayDesignCollection( DBconnection conn, Long array_element_id ) 
	throws SQLException {

        arrayDesigns = new ArrayList();
	populate( conn, array_element_id , "all");
    }

    /**
     * Creates an instance of ArrayDesigntCollection that represents a 
     * collection of array design objects for submitted array_element_id.
     * Objects will be created according to the population mode parameter.  Possible
     * values of mode are:
     * <ul>
     * <li>all - Creates objects for all associated elements regardless of number</li>
     * <li>count - Skips object creation for all elements and only populates counts
     * of associated elements
     * </ul><br>
     *
     * @param conn An active connection to the database
     * @param array_element_id Expression set id to retrieve data for
     * @param mode Population mode to use when retrieving and creation objects
     * @exception SQLException in the case of an invalid operation or database error
     */
    public ArrayDesignCollection( DBconnection conn, Long  array_element_id, String mode )
        throws SQLException {
        arrayDesigns = new ArrayList();
        if ( array_element_id != null && mode != null ) {
            populate( conn, array_element_id, mode );
        }
    }

   
    // retrieve array design ids associated to map element id through Spot table & 
    // create TfcArrayDesign objects for each  
    // If mode is "all" create objects for all associated elements
    // If mode is "count" skip object creation and just retrieve counts

    private void populate( DBconnection conn, Long array_element_id, String mode)
          throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList ids = null;
        Iterator iter = null;
        if (mode .equals ("all") ){
	    query =
		"SELECT DISTINCT array_design_id " +
		"FROM Spot " +
		"WHERE array_element_id = " + array_element_id.toString();
	    conn.setQuery( query );

	    results = conn.getResultSet();
	    while ( results.next() ) {
		if ( ids == null ) {
		    ids = new ArrayList();
		}
		ids.add( new Long( results.getLong( "array_design_id" ) ) );
	    }
	    conn.releaseResources();
        
	    if ( ids != null && !ids.isEmpty() ) {
                size =  ids.size(); 
		iter = ids.iterator();
		while ( iter.hasNext() ) {
		    add( new TfcArrayDesign( conn, (Long) iter.next() ) );
		}
	    }
	}else {
            query =
		"SELECT count( DISTINCT array_design_id) " +
		"FROM Spot " +
		"WHERE array_element_id = " + array_element_id.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            if ( results.next() ) {
               size = results.getInt( 1 );
             }
        }
    }


    /**
     * Determines if collection contains elements or not
     *
     * @return <code>true</code> if collection has no elements in it, or <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return size == 0 ; }
    
    
    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return size ; }

    
    /**
     * Retrieves all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of <code>TfcArrayDesign</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() {
        return !isEmpty() ? arrayDesigns.iterator() : null;
    }
  
    /**
     * Retrieves element at submitted index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public TfcArrayDesign get( int index ) { return (TfcArrayDesign) arrayDesigns.get( index ); }

  
    /**
     * Determines index of submitted object in collection
     *
     * @param arrayDesign TfcArrayDesign object to retrieve index of
     * @return index of TfcArrayDesign within collection
     */
    public int indexOf( TfcArrayDesign arrayDesign ) {
        return arrayDesigns.indexOf( arrayDesign );
    }

    /**
     * Adds supplied element to collection
     * 
     * @param arrayDesign TfcArrayDesign to add to collection
     */
    public void add( TfcArrayDesign arrayDesign ) { arrayDesigns.add( arrayDesign ); }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param arrayDesign TfcArrayDesign to remove from collection
     */
    public void remove( TfcArrayDesign arrayDesign ) { arrayDesigns.remove( arrayDesign ); }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( TfcArrayDesign arrayDesign ) { return arrayDesigns.contains( arrayDesign ); }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** ArrayDesignCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                TfcArrayDesign arrayDesign = (TfcArrayDesign) iter.next();
                arrayDesign.test();
            }
        }
        System.out.println( "**** ArrayDesignCollection content test end ****" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long mapElementID = new Long( 8945 );
            ArrayDesignCollection arrayDesigns = new ArrayDesignCollection( conn, mapElementID );
            arrayDesigns.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
