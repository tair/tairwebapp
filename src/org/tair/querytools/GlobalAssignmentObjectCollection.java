//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 19:18:17 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import org.tair.tfc.*;
import java.sql.*;
import java.util.*;

/**
 * <code>GlobalAssignmentObjectCollection</code> is a custom collection class 
 * that stores all GlobalAssignments for a map element as a collection of 
 * <code>GlobalAssignment</code> objects.
 */

public class GlobalAssignmentObjectCollection {

    private ArrayList globalAssignments;

    /**
     * Creates an empty instance of GlobalAssignmentObjectCollection
     */
	
    public GlobalAssignmentObjectCollection() {
        globalAssignments = new ArrayList();
    }

    /**
     * Creates an instance of GlobalAssignmentObjectCollection that contains 
     * all GlobalAssignments for the submitted map element id onto any Map.
     * 
     * @param conn
     *     An active connection to the database
     * @param mapElementId
     *     map_element_id to retrieve GlobalAssignments for
     * @exception SQLException
     *     in the case of an invalid operation or database error
     */
	
    public GlobalAssignmentObjectCollection( DBconnection conn,
                                             Long mapElementId ) 
        throws SQLException {

        // Instantiate a new ArrayList of GlobalAssignments.

        globalAssignments = new ArrayList();

        // Call populateByMapElementId() to populate the class.

        populate( conn, mapElementId, null );
    }

    /**
     * Creates an instance of GlobalAssignmentObjectCollection that contains 
     * all GlobalAssignments for the submitted map element id onto any Map.
     * 
     * @param conn
     *     An active connection to the database
     * @param mapElementId
     *     map_element_id to retrieve GlobalAssignments for
     * @param elementType Map element type to restrict sub assignments to
     * @exception SQLException
     *     in the case of an invalid operation or database error
     */
	
    public GlobalAssignmentObjectCollection( DBconnection conn,
                                             Long mapElementId,
                                             String elementType ) 
        throws SQLException {

        // Instantiate a new ArrayList of GlobalAssignments.

        globalAssignments = new ArrayList();

        // Call populateByMapElementId() to populate the class.

        populate( conn, mapElementId, elementType );
    }

    /*
     * Populates object by retrieving GlobalAssignments for submitted map 
     * element id onto any Map. Global assignments are stored internally as 
     * <code>GlobalAssignment</code> objects.
     */
	
    private void populate( DBconnection conn, Long mapElementId, 
                           String elementType ) 
        throws SQLException {

        String query = null;
        ResultSet results = null;
        ArrayList ids = null;
        boolean isGeneOnReverseOrientation = false;
        int mapElementLength = 0;

	// Query the database for all GlobalAssignment entries that are not 
	// obsolete and where map_element_id is the one provided, returning
        // the global assignment ids.

        query = "SELECT a.global_assignment_id " + 
            "FROM GlobalAssignment a " + 
            "WHERE a.is_obsolete = 'F' " + 
            "AND a.map_element_id = ?";

        conn.setQuery( query );
        conn.setQueryVariable( mapElementId );
        results = conn.getResultSet();

	// Save the list of global_assignment_id values in an ArrayList.

        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }

            ids.add( new Long( results.getLong( "global_assignment_id" ) ) );
        }

        conn.releaseResources();

	// Iterate through the list of global_assignment_id values, instantiate
	// the GlobalAssignment object for that id, and store the object in the
	// globalAssignments ArrayList.

        if ( ids != null && !ids.isEmpty() ) {
            Iterator iter = ids.iterator();

            while ( iter.hasNext() ) {
                Long globalAssignmentId = ( Long ) iter.next();

                if ( elementType == null ) {
                    globalAssignments.
                        add( new GlobalAssignment( conn, 
                                                   globalAssignmentId ) );
                }
                else {
                    globalAssignments.
                        add( new GlobalAssignment( conn, 
                                                   globalAssignmentId,
                                                   elementType ) );
                }
            }
        }
    }

    /**
     * Determines if collection has elements in it
     * 
     * @return <code>true</code> if collection has no GlobalAssignments in it;
     *         <code>false</code> if collection has at least one element in it
     */
	
    public boolean isEmpty() {
        return globalAssignments.isEmpty();
    }

    /**
     * Retrieves number of elements in collection
     * 
     * @return Number of elements in collection
     */
	
    public int size() {
        return globalAssignments.size();
    }

    /**
     * Retrieves element at supplied index
     * 
     * @return GlobalAssignment at supplied index, or <code>null</code>
     *         if no element at supplied index
     */
	
    public GlobalAssignment get( int index ) {
        return ( GlobalAssignment ) globalAssignments.get( index );
    }

    /**
     * Adds supplied element to collection
     * 
     * @param globalAssignment
     *            GlobalAssignment to add to collection
     */
	
    public void add( GlobalAssignment globalAssignment ) {
        globalAssignments.add( globalAssignment );
    }

    /**
     * Removes supplied element from collection. If element is not in 
     * collection request is silently ignored
     * 
     * @param globalAssignment
     *            GlobalAssignment to remove from collection
     */
	
    public void remove( GlobalAssignment globalAssignment ) {
        globalAssignments.remove( globalAssignment );
    }

    /**
     * Determines if supplied element is in collection
     * 
     * @return <code>true</code> if supplied element is in collection;
     *         <code>false</code> if element is not found
     */
	
    public boolean contains( GlobalAssignment globalAssignment ) {
        return globalAssignments.contains( globalAssignment );
    }

    /**
     * Retrieves all elements in collection
     * 
     * @return All GlobalAssignments in collection as an <code>Iterator</code> 
     *         of <code>GlobalAssignment</code> objects, or
     *         <code>null</code> if no GlobalAssignments in collection
     */
	
    public Iterator iterator() {
        return ( !globalAssignments.isEmpty() ) ? 
            globalAssignments.iterator() : null;
    }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     * 
     * @param comparator
     *            Comparator that defines criteria collection should be sorted
     *            by
     */
	
    public void sort( Comparator comparator ) {
        Collections.sort( globalAssignments, comparator );
    }

    /**
     * For unit testing only
     */
	
    public void test() {

        System.out.println( "****** GlobalAssignmentObjectCollection " +
                            "content test ******" );
        Iterator iter = iterator();

        if ( iter != null ) {
            while ( iter.hasNext() ) {
                GlobalAssignment globalAssignment = 
                    ( GlobalAssignment ) iter.next();
                globalAssignment.test();
            }
        }

        System.out.println( "**** GlobalAssignmentObjectCollection " +
                            "content test end ****" );
    }

    /**
     * For unit testing only
     */
	
    public static void main( String[] args ) {

        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 1518401 );
            GlobalAssignmentObjectCollection globalAssignments = 
                new GlobalAssignmentObjectCollection( conn, id );
            globalAssignments.test();
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}

