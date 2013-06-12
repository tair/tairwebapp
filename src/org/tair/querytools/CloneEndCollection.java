//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/07/28 20:00:38 $
//-----------------------------------------------------------------------------

/** 
 * CloneEndCollection is a custom collection that stores all clone ends 
 * associated to a given map element as a collection of <code>CloneEnd</code>
 * objects. 
 */

package org.tair.querytools;
import org.tair.tfc.*;
import org.tair.utilities.*;
import java.sql.*;
import java.util.*;

public class CloneEndCollection {

    private Vector cloneEnds;

    /**
     * Creates an empty instance of CloneEndCollection for population 
     * externally
     */

    public CloneEndCollection() {
        cloneEnds = new Vector();
    }

    /**
     * Creates an instance of CloneEndCollection that contains all clone ends 
     * associated to submitted id, where type of object and how clone ends 
     * are retrieved are determined by type. Possible values of type are 
     * "clone" and "locus". If "clone", id should be clone_id, if "locus", 
     * id should be locus_id. Clone ends are stored as <code>CloneEnd</code> 
     * objects
     *
     * @param db An active connection to the database
     * @param id ID to retrieve clone ends for
     * @param type Designates type of element to retrieve clone ends for.
     * @throws SQLException in the case of an invalid operation or database 
     * error
     */

    public CloneEndCollection( DBconnection db, Long id, String type ) 
        throws SQLException {

        cloneEnds = new Vector();

        if ( id != null && type != null ) {
            get_information( db, id, type );
        }
    }
  
    private void get_information( DBconnection db, Long id, String type ) 
        throws SQLException {

        Vector clone_end_id = null;
        String query = null;
        ResultSet results = null;

        if ( id != null && type != null ) {
            if ( type.equalsIgnoreCase( "locus" ) ) {
                query = "SELECT c.clone_end_id "+
                    "FROM CloneEnd c, MapElement_Locus m "+
                    "WHERE c.map_element_id = m.map_element_id " +
                    "AND c.is_obsolete = 'F' " +
                    "AND m.locus_id = " + id.toString();
            } else if ( type.equalsIgnoreCase( "clone" ) ) {
                query = "SELECT clone_end_id "+
                    "FROM CloneEnd "+
                    "WHERE is_obsolete = 'F' " +
                    "AND clone_id = " + id.toString();
            }
      
            db.setQuery( query );
            results = db.getResultSet();

            while ( results.next() ) {
                if ( clone_end_id == null ) {
                    clone_end_id = new Vector();
                }

                clone_end_id.add( new Long( results.
                                            getLong( "clone_end_id" ) ) );
            }

            db.releaseResources();
      
            if ( clone_end_id != null && clone_end_id.size() != 0 ) {
                int length = clone_end_id.size();

                for ( int i = 0; i < length; i++ ) {
                    CloneEnd clone_end = 
                        new CloneEnd( db, (Long) clone_end_id.elementAt( i ) );
                    addElement( clone_end );
                }
            }
        }
    }

    /**
     * Iterates through collection of clone ends and populates assignment 
     * collection for each clone end.  Assignments are not retrieved for 
     * each clone end by default when collection is instantiated, rather 
     * they must be explicitly retrieved through this method.  This is done 
     * so that assignments are only retrieved when they are needed for 
     * display (such as on locus detail page)
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */

    public void populateGlobalAssignments( DBconnection conn ) 
        throws SQLException {

        Iterator iter = null;
        CloneEnd cloneEnd = null;

        if ( cloneEnds != null && !cloneEnds.isEmpty() ) {
            iter = cloneEnds.iterator();

            while ( iter.hasNext() ) {
                cloneEnd = (CloneEnd) iter.next();
                cloneEnd.populateGlobalAssignments( conn );
            }
        }
    }

    /**
     * @return <code>true</code> if collection has no clone ends in it; 
     * <code>false</code> if collection has at least one element in it
     */

    public boolean isEmpty() { return cloneEnds.isEmpty(); }

    /**
     * @return Number of elements in collection
     */

    public int size() { return cloneEnds.size(); }

    /**
     * @return clone end at supplied index, or <code>null</code> if no 
     * element at supplied index
     */

    public CloneEnd elementAt( int index ) { 
        return (CloneEnd) cloneEnds.elementAt( index ); 
    }

    /**
     * Adds supplied element to collection
     * 
     * @param cloneEnd clone end to add to collection
     */

    public void addElement( CloneEnd cloneEnd ) { 
        cloneEnds.addElement( cloneEnd ); 
    }

    /**
     * Removes supplied element from collection. If element is not in 
     * collection request is silently ignored
     *
     * @param cloneEnd clone end to remove from collection
     */

    public void removeElement( CloneEnd cloneEnd ) { 
        cloneEnds.remove( cloneEnd ); 
    }

    /**
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */

    public boolean contains( CloneEnd cloneEnd ) { 
        return cloneEnds.contains( cloneEnd ); 
    }

    /**
     * @return All clone ends in collection as an <code>Iterator</code> of 
     * <code>CloneEnd</code> objects, or <code>null</code> if no clone ends 
     * in collection
     */

    public Iterator iterator() { 
        return ( !cloneEnds.isEmpty() ) ? cloneEnds.iterator() : null; 
    }

    /**
     * test CloneEndCollection content
     */

    public void test() {

        System.out.println( "****** CloneEndCollection content test ******" );

        if ( this.size() != 0 ) {
            int length = this.size();
            CloneEnd object = null;

            for ( int i=0 ; i<length; i++ ) {
                object = (CloneEnd) this.elementAt( i );
                object.test();
            }
        }

        System.out.println( "**** CloneEndCollection content test end ****" );
    }
  
    /*
     * This part is for test basic functions
     */

    public static void main( String[] args ) {

        try {
            DBconnection connection = new DBconnection();

            System.out.println( "Creating from locus id..." );
            Long test_id = new Long( 130311 );
            CloneEndCollection clone_ends = 
                new CloneEndCollection( connection, test_id, "locus" );
            clone_ends.test();

            System.out.println( "Creating from clone id..." );
            test_id = new Long( 2380 );
            clone_ends = new CloneEndCollection( connection, test_id, 
                                                 "clone" );
            clone_ends.test();

            System.out.println( "******************************************" );
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
  
}
  








