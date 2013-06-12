//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 19:18:18 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import org.tair.tfc.*;
import java.sql.*;
import java.util.*;

/**
 * LocalAssignmentObjectCollection is a custom collection class that stores 
 * all LocalAssignments for a map element as a collection of
 * <code>LocalAssignment</code> objects.
 */

public class LocalAssignmentObjectCollection {

    private ArrayList localAssignments;

    /**
     * Creates an empty instance of LocalAssignmentObjectCollection
     */
	
    public LocalAssignmentObjectCollection() {
        localAssignments = new ArrayList();
    }

    /**
     * Creates an instance of LocalAssignmentObjectCollection that contains 
     * all <code>LocalAssignment</code>s for the submitted map element id 
     * onto another map element, what is referred to as super assignments.
     * 
     * @param conn
     *     An active connection to the database
     * @param globalAssignmentId
     *     global_assignment_id to retrieve LocalAssignments for
     * @exception SQLException
     *     in the case of an invalid operation or database error
     */
	
    public LocalAssignmentObjectCollection( DBconnection conn,
					    Long globalAssignmentId ) 
        throws SQLException {

        // Instantiate a new ArrayList of LocalAssignments.

        localAssignments = new ArrayList();

        // Call populateLocalAssignments() to populate the class.

        populateLocalAssignments( conn, globalAssignmentId );
    }

    /**
     * Creates an instance of LocalAssignmentObjectCollection that optionally
     * populates collection with <code>LocalAssignment</code>s of the 
     * submitted map element id onto other map elements (i.e. super 
     * assignments), or with <code>LocalAssignment</code>s of map elements 
     * assigned onto the submitted map element id (i.e. sub assignments).
     * 
     * @param conn An active connection to the database
     * @param mapElementId Map element id to retrieve LocalAssignments for
     * @param populateSubAssignments If <code>true</code> object is populated 
     *                               with LocalAssignments of map elements 
     *                               onto mapElementId (referred to as sub 
     *                               assignments); if <code>false</code>, 
     *                               object is populated with LocalAssignments 
     *                               of mapElementId onto other map elements 
     *                               (referred to as super assignments).
     * @exception SQLException Thrown if a database error occurs
     */
	
    public LocalAssignmentObjectCollection( DBconnection conn,
					    Long mapElementId,
					    boolean populateSubAssignments )
        throws SQLException {

        // Instantiate a new ArrayList of LocalAssignments.

        localAssignments = new ArrayList();

        // Populate based on the value of populateSubAssignments.

        if ( populateSubAssignments ) {
            populateSubAssignments( conn, mapElementId );
        } 
        else {
            populateSuperAssignments( conn, mapElementId );
        }
    }

    /**
     * Creates an instance of LocalAssignmentObjectCollection that populates
     * collection with LocalAssignments of map features onto map element id 
     * where map features are only of submitted type. Currently, only 
     * restricting type to "gene" is supported, though other types can be 
     * added as needed
     * 
     * @param conn An active connection to the database
     * @param superMapElementId Map element id to retrieve LocalAssignments for
     * @param mapElementType Map element type ( i.e. gene ) to restrict 
     *                       LocalAssignments to
     * @exception SQLException thrown if a database error occurs
     */
	
    public LocalAssignmentObjectCollection( DBconnection conn,
					    Long superMapElementId, 
					    String mapElementType ) 
        throws SQLException {

        // Instantiate a new ArrayList of LocalAssignments.

        localAssignments = new ArrayList();

        // Call populateSubAssignmentsOfType() to populate the object with all
	// sub assignments of the specified map element type onto the specified
	// super_map_element_id.

        populateSubAssignmentsByType( conn, superMapElementId, 
				      mapElementType );
    }

    /*
     * Populates object by retrieving LocalAssignments of associated with 
     * the provided global_assignment_id and storing internally as 
     * <code>LocalAssignment</code>s
     */
	
    private void populateLocalAssignments( DBconnection conn, 
					   Long globalAssignmentId )
        throws SQLException {

        String query = null;
        ArrayList localAssignmentIDs = null;
        ResultSet results = null;
        Iterator iter = null;

        // Query the database for all LocalAssignment ids where the 
        // sub_map_element_id = the submitted map_element_id.

        query = "SELECT local_assignment_id " + 
            "FROM LocalAssignment " + 
            "WHERE global_assignment_id = ?";

        conn.setQuery( query );
        conn.setQueryVariable( globalAssignmentId );
        results = conn.getResultSet();

        // Load the resulting LocalAssignment ids into an ArrayList.

        while ( results.next() ) {
            if ( localAssignmentIDs == null ) {
                localAssignmentIDs = new ArrayList();
            }

            localAssignmentIDs.
                add( new Long( results.getLong( "local_assignment_id" )) );
        }

        conn.releaseResources();

        // Iterate through the ArrayList of LocalAssignment ids and add the
        // associated LocalAssignment into the localAssignments ArrayList.

        if ( localAssignmentIDs != null && !localAssignmentIDs.isEmpty() ) {
            iter = localAssignmentIDs.iterator();

            while ( iter.hasNext() ) {
                Long localAssignmentId = ( Long ) iter.next();
                add( new LocalAssignment( conn, localAssignmentId ) );
            }
        }
    }

    /*
     * Populates object by retrieving LocalAssignments of map features onto 
     * submitted map element id and storing internally as 
     * <code>LocalAssignment</code>s
     */
	
    private void populateSuperAssignments( DBconnection conn, 
                                           Long subMapElementId )
        throws SQLException {

        String query = null;
        ArrayList localAssignmentIDs = null;
        ResultSet results = null;
        Iterator iter = null;

        // Query the database for all LocalAssignment ids where the 
        // sub_map_element_id = the submitted map_element_id.

        query = "SELECT local_assignment_id " + 
            "FROM LocalAssignment " + 
            "WHERE sub_map_element_id = ?";

        conn.setQuery( query );
        conn.setQueryVariable( subMapElementId );
        results = conn.getResultSet();

        // Load the resulting LocalAssignment ids into an ArrayList.

        while ( results.next() ) {
            if ( localAssignmentIDs == null ) {
                localAssignmentIDs = new ArrayList();
            }

            localAssignmentIDs.
                add( new Long( results.getLong( "local_assignment_id" )) );
        }

        conn.releaseResources();

        // Iterate through the ArrayList of LocalAssignment ids and add the
        // associated LocalAssignment into the localAssignments ArrayList.

        if ( localAssignmentIDs != null && !localAssignmentIDs.isEmpty() ) {
            iter = localAssignmentIDs.iterator();

            while ( iter.hasNext() ) {
                Long localAssignmentId = ( Long ) iter.next();
                add( new LocalAssignment( conn, localAssignmentId ) );
            }
        }
    }

    /*
     * Populates object by retrieving LocalAssignments for submitted map 
     * element id onto other map elements. LocalAssignments are stored 
     * internally as <code>LocalAssignment</code>s. This method also makes
     * corrections of position according to alignment of map and map element
     * LocalAssignments
     */
	
    private void populateSubAssignments( DBconnection conn,
					 Long superMapElementId ) 
        throws SQLException {

        String query = null;
        ResultSet results = null;
        ArrayList ids = null;
        boolean isGeneOnReverseOrientation = false;
        int mapElementLength = 0;

        query = "SELECT a.local_assignment_id " + 
            "FROM LocalAssignment a " + 
            "WHERE a.super_map_element_id = ?";

        conn.setQuery( query );
        conn.setQueryVariable( superMapElementId );
        results = conn.getResultSet();

        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }

            ids.add( new Long( results.getLong( "local_assignment_id" ) ) );
        }

        conn.releaseResources();

        if ( ids != null && !ids.isEmpty() ) {
            Iterator iter = ids.iterator();

            while ( iter.hasNext() ) {
                // Create so that sub map element info in LocalAssignment is
                // populated instead of the super map element info.
                add( new LocalAssignment( conn, ( Long ) iter.next(), true ) );
            }
        }
    }

    /*
     * Populates object by retrieving LocalAssignments of map features onto 
     * submitted map ( element ) id and storing internally as 
     * <code>LocalAssignment</code>s. Only LocalAssignments where feature 
     * type is mapElementType will be retrieved
     */
	
    private void populateSubAssignmentsByType( DBconnection conn, 
					       Long superMapElementId,
					       String mapElementType ) 
        throws SQLException {

        String query = null;
        ArrayList localAssignmentIDs = null;
        ResultSet results = null;
        Iterator iter = null;

        if ( mapElementType.equals( "gene" ) ) {
            query = "SELECT la.local_assignment_id " + 
                "FROM LocalAssignment la, Gene g " + 
                "WHERE la.sub_map_element_id = g.map_element_id " + 
                "AND g.is_obsolete = 'F' " + 
                "AND la.super_map_element_id = ?";

            if ( query != null ) {
                conn.setQuery( query );
                conn.setQueryVariable( superMapElementId );
                results = conn.getResultSet();

                while ( results.next() ) {
                    if ( localAssignmentIDs == null ) {
                        localAssignmentIDs = new ArrayList();
                    }

                    localAssignmentIDs
                        .add( new Long( results.
                                        getLong( "local_assignment_id" ) ) );
                }

                conn.releaseResources();
            }

            if ( localAssignmentIDs != null && 
                 !localAssignmentIDs.isEmpty() ) {
                iter = localAssignmentIDs.iterator();

                while ( iter.hasNext() ) {
                    // create so that map element info in localAssignment is
                    // populated instead of map
                    Long localAssignmentId = ( Long ) iter.next();
                    add( new LocalAssignment( conn, localAssignmentId,
					      true ) );
                }
            }
        }
    }

    /**
     * Determines if collection has elements in it
     * 
     * @return <code>true</code> if collection has no LocalAssignments in it;
     *         <code>false</code> if collection has at least one element in it
     */
	
    public boolean isEmpty() {
        return localAssignments.isEmpty();
    }

    /**
     * Retrieves number of elements in collection
     * 
     * @return Number of elements in collection
     */
	
    public int size() {
        return localAssignments.size();
    }

    /**
     * Retrieves element at supplied index
     * 
     * @return LocalAssignment at supplied index, or <code>null</code>
     *         if no element at supplied index
     */
	
    public LocalAssignment get( int index ) {
        return ( LocalAssignment ) localAssignments.get( index );
    }

    /**
     * Adds supplied element to collection
     * 
     * @param localAssignment
     *            LocalAssignment to add to collection
     */
	
    public void add( LocalAssignment localAssignment ) {
        localAssignments.add( localAssignment );
    }

    /**
     * Removes supplied element from collection. If element is not in 
     * collection request is silently ignored
     * 
     * @param localAssignment
     *            LocalAssignment to remove from collection
     */
	
    public void remove( LocalAssignment localAssignment ) {
        localAssignments.remove( localAssignment );
    }

    /**
     * Determines if supplied element is in collection
     * 
     * @return <code>true</code> if supplied element is in collection;
     *         <code>false</code> if element is not found
     */
	
    public boolean contains( LocalAssignment localAssignment ) {
        return localAssignments.contains( localAssignment );
    }

    /**
     * Retrieves all elements in collection
     * 
     * @return All LocalAssignments in collection as an <code>Iterator</code> 
     *         of <code>LocalAssignment</code> objects, or
     *         <code>null</code> if no LocalAssignments in collection
     */
	
    public Iterator iterator() {
        return ( !localAssignments.isEmpty() ) ? 
            localAssignments.iterator() : null;
    }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     * 
     * @param comparator
     *            Comparator that defines criteria collection should be sorted
     *            by
     */
	
    public void sort( Comparator comparator ) {
        Collections.sort( localAssignments, comparator );
    }

    /**
     * For unit testing only
     */
	
    public void test() {

        System.out.println( "****** LocalAssignmentObjectCollection " +
                            "content test ******" );
        Iterator iter = iterator();

        if ( iter != null ) {
            while ( iter.hasNext() ) {
                LocalAssignment localAssignment = 
                    ( LocalAssignment ) iter.next();
                localAssignment.test();
            }
        }

        System.out.println( "**** LocalAssignmentObjectCollection " +
                            "content test end ****" );
    }

    /**
     * For unit testing only
     */
	
    public static void main( String[] args ) {

        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 1518401 );
            LocalAssignmentObjectCollection localAssignments = 
                new LocalAssignmentObjectCollection( conn, id );
            localAssignments.test();
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}

