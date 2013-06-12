//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 19:18:18 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * LocalAssignmentCollection is a custom collection that stores 
 * LocalAssignments for a GlobalAssignment as a collection of
 * <code>TfcLocalAssignment</code> objects.
 */

public class LocalAssignmentCollection {

    private ArrayList localAssignments;

    // GlobalAssignment's orientation -- used to correct LocalAssignment 
    // positions

    private Character globalAssignmentOrientation;

    // total length of GlobalAssignment -- used to correct LocalAssignment 
    // if globalOrientation is reversed

    private Float globalAssignmentLength;

    /**
     * Creates an empty instance of LocalAssignmentCollection
     */

    public LocalAssignmentCollection() {
        localAssignments = new ArrayList();
    }

    /**
     * Creates an instance of LocalAssignmentCollection that represents a
     * collection of LocalAssignments for submitted GlobalAssignment id. 
     * This version of constructor will query the database to determine 
     * GlobalAssigment's orientation and length; this data is used to adjust 
     * positions of LocalAssignments if GlobalAssignment orientation 
     * is reverse
     * 
     * @param conn An active connection to the database
     * @param globalAssignmentId GlobalAssignment id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database 
     *         error
     */

    public LocalAssignmentCollection( DBconnection conn, 
				      Long globalAssignmentId )
        throws SQLException {

        localAssignments = new ArrayList();

        getGlobalAssignmentInfo( conn, globalAssignmentId );
        populate( conn, globalAssignmentId );
    }

    /**
     * Creates an instance of LocalAssignmentCollection that represents a
     * collection of LocalAssignments for submitted GlobalAssignment id. This
     * version of constructor will adjust positions of LocalAssignments 
     * using the submitted values for the GlobalAssignment's orientation and 
     * length instead of querying the database for them.
     * 
     * @param conn An active connection to the database
     * @param globalAssignmentId Assignment id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database 
     *         error
     */

    public LocalAssignmentCollection( DBconnection conn, 
				      Long globalAssignmentId,
				      Character globalAssignmentOrientation, 
				      Float length ) 
        throws SQLException {

        localAssignments = new ArrayList();

        this.globalAssignmentOrientation = globalAssignmentOrientation;
        this.globalAssignmentLength = length;
        populate( conn, globalAssignmentId );
    }

    /*
     * Retrieves GlobalAssignment orientation and length. This data is used 
     * to adjust positions of LocalAssignments if orientation of 
     * GlobalAssignment is reversed
     */
	
    private void getGlobalAssignmentInfo( DBconnection conn, 
                                          Long globalAssignmentId )
        throws SQLException {

        ResultSet results = null;
        String query = null;

        query = "SELECT orientation, length " + 
                "FROM GlobalAssignment " + 
                "WHERE global_assignment_id = " + 
                globalAssignmentId.toString();

        conn.setQuery( query );
        results = conn.getResultSet();

        if ( results.next() ) {
            String s = results.getString( "orientation" );

            if ( s != null ) {
                this.globalAssignmentOrientation = 
                    new Character( s.charAt( 0 ) );
            }

            // Calculate length if necessary

            float length = results.getFloat( "length" );

            if ( results.wasNull() ) {
                double start = results.getDouble( "start_position" );
                double end = results.getDouble( "end_position" );
                this.globalAssignmentLength = new Float( end - start + 1 );
            } 
            else {
                this.globalAssignmentLength = new Float( length );
            }
        }

        conn.releaseResources();
    }

    /*
     * Retrieves LocalAssignments for GlobalAssignment id
     */
		
    private void populate( DBconnection conn, Long globalAssignmentId )
        throws SQLException {

        String query = null;
        ResultSet results = null;
        ArrayList localAssignmentIDs = null;
        Iterator iter = null;
        TfcLocalAssignment localAssignment = null;

	// Query the database for all LocalAssignment IDs for the specified
	// GlobalAssignment ID.

        query = "SELECT local_assignment_id " + 
                "FROM LocalAssignment " + 
                "WHERE global_assignment_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( globalAssignmentId );
        results = conn.getResultSet();

        while ( results.next() ) {
            if ( localAssignmentIDs == null ) {
                localAssignmentIDs = new ArrayList();
            }

            localAssignmentIDs.
                add( new Long( results.getLong( "local_assignment_id" ) ) );
        }

        conn.releaseResources();

	// Loop through each LocalAssignment ID found in the above query.

        if ( localAssignmentIDs != null && 
             !localAssignmentIDs.isEmpty() ) {

	    // Get the iterator of the collection of LocalAssignment IDs.

            iter = localAssignmentIDs.iterator();

	    // Iterate through each LocalAssignment ID and instantiate the
	    // associated TfcLocalAssignment.  Then add it to the collection
	    // of TfcLocalAssignment objects.

            while ( iter.hasNext() ) {
                localAssignment = 
		    new TfcLocalAssignment( conn, ( Long ) iter.next() );
                localAssignments.add( localAssignment );
            }

	    // If the orientation of the GlobalAssignment is reverse, call
	    // adjustLocalPositions() to adjust the positions.

            if ( getGlobalAssignmentOrientation() != null && 
                 getGlobalAssignmentOrientation().equals( new 
                                                          Character( 'R' )) ) {
                adjustLocalPositions();
            }

	    // Sort the collection of LocalAssignments based on start position.

            Collections.sort( localAssignments,
                              new LocalAssignmentComparator() );
        }
    }

    /*
     * If GlobalAssignment has reverse globalAssignmentOrientation, this 
     * method adjusts sub positions so that they are forward on the chromosome
     */
	
    private void adjustLocalPositions() {
        if ( !isEmpty() ) {
            Iterator iter = iterator();

            // Cast to primitive once to save effort in loop

            float length = getGlobalAssignmentLength().floatValue(); 

            while ( iter.hasNext() ) {
                TfcLocalAssignment sub = 
                    ( TfcLocalAssignment ) iter.next();
                float newStart = length - 
                    sub.getEndPosition().floatValue() + 1;
                float newEnd = length - 
                    sub.getStartPosition().floatValue() + 1;
                sub.setStartPosition( new Double( newStart ) );
                sub.setEndPosition( new Double( newEnd ) );
            }
        }
    }

    /**
     * Retrieves globalAssignmentOrientation of GlobalAssignment for 
     * LocalAssignments. If GlobalAssignment is reversed, LocalAssignment 
     * positions will be altered so that they point forward on the chromosome
     * 
     * @return 'R' if GlobalAssignment is reversed, or 'F' if 
     *         GlobalAssignment is forward
     */
	
    public Character getGlobalAssignmentOrientation() {
        return globalAssignmentOrientation;
    }

    /**
     * Retrieves GlobalAssignment length. This value is used to adjust sub
     * assignment positions to point forward on chromosome if GlobalAssignment
     * orientation is reversed
     * 
     * @return Length of GlobalAssignment.
     */
	
    public Float getGlobalAssignmentLength() {
        return globalAssignmentLength;
    }

    /**
     * Determines if collection has elements in it
     * 
     * @return <code>true</code> if collection has no elements in it, or
     *         <code>false</code> if collection has at least one element in it
     */
	
    public boolean isEmpty() {
        return ( localAssignments != null && localAssignments.isEmpty() );
    }

    /**
     * Determines number of elements in collection
     * 
     * @return Number of elements in collection
     */
	
    public int size() {
        return ( localAssignments != null ) ? localAssignments.size() : 0;
    }

    /**
     * Retrieve all elements in collection
     * 
     * @return Elements in collection as an <code>Iterator</code> of
     *         <code>TfcLocalAssignment</code> objects, or <code>null</code>
     *         if no elements in collection
     */
	
    public Iterator iterator() {
        return !isEmpty() ? localAssignments.iterator() : null;
    }

    /**
     * Retrieves elements at submitted index
     * 
     * @param index
     *            Index of item to retrieve
     * @return Element at submitted index, or <code>null</code> if no element
     *         at requested index
     */
	
    public TfcLocalAssignment elementAt( int index ) {
        return ( TfcLocalAssignment ) localAssignments.get( index );
    }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     * 
     * @param comparator Comparator that defines criteria collection should 
     *                   be sorted by
     */
	
    public void sort( Comparator comparator ) {
        Collections.sort( localAssignments, comparator );
    }

    /**
     * For unit testing only
     */
	
    public void test() {
        System.out.println( "****** LocalAssignmentCollection " +
                            "content test ******" );

        if ( !isEmpty() ) {
            Iterator iter = iterator();

            while ( iter.hasNext() ) {
                TfcLocalAssignment localAssignment = 
                    ( TfcLocalAssignment ) iter.next();
                localAssignment.test();
            }
        }

        System.out.println( "**** LocalAssignmentCollection " +
                            "content test end ****" );
    }

    /**
     * For unit testing only
     */
	
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long globalAssignmentId = new Long( 2 );
            LocalAssignmentCollection subs = 
                new LocalAssignmentCollection( conn, globalAssignmentId );
            subs.test();
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
