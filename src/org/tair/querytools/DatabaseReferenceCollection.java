//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2003/09/05 18:58:59 $
//---------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * DatabaseReferenceCollection is a custom collection class that stores
 * database references associated to a given element as a collection 
 * of <code>TfcDatabaseReference</code> objects. 
 */


public class DatabaseReferenceCollection {
    private ArrayList dbReferences;

    /**
     * Creates an empty instance of DatabaseReferenceCollection
     */
    public DatabaseReferenceCollection()  {
        dbReferences = new ArrayList();
    }

    /**
     * Creates an instance of DatabaseReferenceCollection that contains
     * database references associated to id, where type of id (and what
     * table to search for associations) is determined by type. Valid values
     * for type are:
     * <ul>
     * <li>tair_object - id should be tair_object_id</li>
     * </ul>
     *
     * @param conn An active connection to the database
     * @param id Element id to retrieve database references for
     * @param type Object type of id
     * @exception SQLException in the case of an invalid operation or database error
     */
    public DatabaseReferenceCollection( DBconnection conn, Long id, String type ) throws SQLException {
        dbReferences = new ArrayList();
        if ( id != null && type != null ) {
            if ( type.equals( "tair_object" ) ) {
                populateTairObject( conn, id );
            }
        }
    }


    // Populate collection with all database references associated to tair object id
    private void populateTairObject( DBconnection conn, Long tair_object_id ) throws SQLException {
        ArrayList ids = null;
        ResultSet results = null;
        String query = null;

    
        // retrieve associated reference ids &
        // create reference objects from list of found ids
        if ( tair_object_id != null ) {
            query = 
                "SELECT d.reference_id " +
                "FROM TairObj_Ref t, DatabaseReference d " +
                "WHERE t.reference_id = d.reference_id " +
                "AND t.tair_object_id = " + tair_object_id.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
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
    }

    /**
     * Specialized population method that only retrieves a tair object's
     * SUIDs (Stanford array element id). These are differentiated from
     * other db references by restricting by name, which must equal
     * "Stanford_arrayelement_id".  This population method allows a collection
     * to be created that only contains these ids for an object. This
     * is useful for displaying microarray data where the SUID is needed
     * to link to SMD's spot history function; in this case, only SUID is
     * needed, and all other db references can be ignored
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id of array element to retrieve
     * SUID for
     * @throws SQLException if a database error occurs
     */
    public void populateSUIDs( DBconnection conn, Long tair_object_id ) throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList ids = null;
        
        query =
            "SELECT d.reference_id " +
            "FROM TairObj_Ref t, DatabaseReference d " +
            "WHERE t.reference_id = d.reference_id " +
            "AND d.name = 'Stanford_arrayelement_id' " +
            "AND t.tair_object_id = " + tair_object_id.toString();
        
        conn.setQuery( query );
        results = conn.getResultSet();
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
        
 
    // utility method to iterate through collection of ids & create TfcDatabaseReference 
    // objects to be stored in DatabaseReferenceCollection
    private void createRecords( DBconnection conn, ArrayList ids ) throws SQLException {
        Iterator iter = null;
        TfcDatabaseReference reference = null;
        
        iter = ids.iterator(); // trust that ids should never be null or empty if we got this far
        while ( iter.hasNext() ) {
            reference = new TfcDatabaseReference( conn, (Long) iter.next() );
            add( reference );
        }
    }


    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no database references in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return dbReferences.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return dbReferences.size(); }

    /**
     * Retrieves element at supplied index
     *
     * @return TfcDatabaseReference at supplied index, or <code>null</code> if no element at supplied index
     */
    public TfcDatabaseReference get( int index ) { return (TfcDatabaseReference) dbReferences.get( index ); }


    /**
     * Adds supplied element to collection
     * 
     * @param reference TfcDatabaseReference to add to collection
     */
    public void add( TfcDatabaseReference reference ) { dbReferences.add( reference ); }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param reference TfcDatabaseReference to remove from collection
     */
    public void remove( TfcDatabaseReference reference ) { dbReferences.remove( reference ); }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( TfcDatabaseReference reference ) { return dbReferences.contains( reference ); }


    /**
     * Retrieves all elements in collection
     *
     * @return All database references in collection as an <code>Iterator</code> of <code>TfcDatabaseReference</code>
     * objects, or <code>null</code> if no database references in collection
     */
    public Iterator iterator() { return ( !dbReferences.isEmpty() ) ? dbReferences.iterator() : null; }


    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be sorted by
     */
    public void sort( Comparator comparator ) {
        Collections.sort( dbReferences, comparator );
    }



    /**
     * For unit testing only
     */
    public void test() {
              
        System.out.println( "****** DatabaseReferenceCollection content test ******" );
        Iterator iter = iterator();
        if ( iter != null ) {
            while ( iter.hasNext() ) {
                TfcDatabaseReference reference = (TfcDatabaseReference) iter.next();
                reference.test();
            }
        }
        System.out.println( "**** DatabaseReferenceCollection content test end ****" );
    }

    /**
     * For unit testing only
     */ 
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1005694898 );
            DatabaseReferenceCollection dbReferences = new DatabaseReferenceCollection( conn, id, "tair_object" );
            dbReferences.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}

  








