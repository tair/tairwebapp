//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/04/26 17:04:45 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

import org.tair.tfc.DBconnection;



/**
 * CommunicationObjectCollection is a custom collection class that stores
 * communication references associated to a given element as a collection of 
 * <code>CommunityObject</code> objects. 
 */


public class CommunicationObjectCollection {
    private ArrayList communications;

    /**
     * Creates an empty instance of CommunicationObjectCollection
     */
    public CommunicationObjectCollection()  {
        communications = new ArrayList();
    }

    /**
     * Creates an instance of CommunicationObjectCollection that contains
     * communication references associated to a tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to retrieve references for
     * @throws SQLException if a database error occurs
     */
    public CommunicationObjectCollection( DBconnection conn, Long id )
	throws SQLException {
	
	communications = new ArrayList();
	populate( conn, id );
    }


    /**
     * Populates collection by retrieving reference ids of communication
     * references associated to tair_object_id and creates CommunicationObjects
     * for each
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to retrieve references for
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn, Long tair_object_id )
	throws SQLException {
	
        // retrieve associated reference ids &
        // create reference objects from list of found ids
	String query = 
	    "SELECT c.reference_id " +
	    "FROM TairObj_Ref t, Communication c " +
	    "WHERE t.reference_id = c.reference_id " +
	    "AND t.tair_object_id = ? ";

	conn.setQuery( query );
	conn.setQueryVariable( tair_object_id );
	
	ArrayList ids = null;

	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "reference_id" ) ) );
	}
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {
	    createRecords( conn, ids );
        }
    }

    
    /**
     * Utility method to iterate through collection of ids & create 
     * CommunicationObject objects to be stored in collection
     *
     * @param conn An active connection to the database
     * @param ids List of reference ids to create objects for; ids must
     * be stored as Long objects.
     * @throws SQLException if a database error occurs
     */
    private void createRecords( DBconnection conn, ArrayList ids ) 
	throws SQLException {

        Iterator iter = ids.iterator();
        while ( iter.hasNext() ) {
            add( new CommunicationObject( conn, (Long) iter.next() ) );
        }
    }


    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no communication references
     * in it; <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return communications.isEmpty();
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return communications.size();
    }

    /**
     * Retrieves element at supplied index
     *
     * @return CommunicationObject at supplied index, or <code>null</code> if 
     * no element at supplied index
     */
    public CommunicationObject get( int index ) {
	return (CommunicationObject) communications.get( index );
    }


    /**
     * Adds supplied element to collection
     * 
     * @param reference CommunicationObject to add to collection
     */
    public void add( CommunicationObject reference ) { 
	communications.add( reference );
    }

    /**
     * Removes supplied element from collection.
     *
     * @param reference CommunicationObject to remove from collection
     */
    public void remove( CommunicationObject reference ) { 
	communications.remove( reference ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( CommunicationObject reference ) { 
	return communications.contains( reference ); 
    }


    /**
     * Retrieves all elements in collection
     *
     * @return All communication references in collection as an
     * <code>Iterator</code> of <code>CommunicationObject</code> objects,
     * or <code>null</code> if no communication references in collection
     */
    public Iterator iterator() {
	return !isEmpty() ? communications.iterator() : null;
    }


    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be
     * sorted by
     */
    public void sort( Comparator comparator ) {
        Collections.sort( communications, comparator );
    }


    /**
     * For unit testing only
     */
    public void test() {
              
        System.out.println( "** CommunicationObjectCollection test **" );
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		CommunicationObject reference = 
		    (CommunicationObject) iter.next();

		reference.test();
            }
        }
        System.out.println( "** CommunicationObjectCollection test end **" );
    }
    
    /**
     * For unit testing only
     */ 
    public static void main( String[] args ) {
        try {
	    
            DBconnection conn = new DBconnection();
            Long id = new Long( 2573063 );
            CommunicationObjectCollection communications = 
		new CommunicationObjectCollection( conn, id );

            communications.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}

  








