//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/06/01 16:32:19 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Iterator;

import org.tair.querytools.HostStrain;
import org.tair.tfc.DBconnection;


/** 
 * HostStrainCollection is a custom collection that stores all host strains
 * associated to a stock.  This collection should almost never contain more
 * than a single host strain for a stock, but since the db structure
 * allows for there to be multiples, the software needs to account for the
 * possibility.
 *
 * <p>
 * Elements are stored as a collection of <code>HostStrain</code> objects.
 */


public class HostStrainCollection {
    private ArrayList hostStrains;


    /**
     * Creates an empty instance of HostStrainCollection
     */
    public HostStrainCollection() {
        hostStrains = new ArrayList();
    }

    
    /**
     * Creates an instance of HostStrainCollection that stores all host strains
     * associated to supplied stock_id.
     *
     * @param conn An active connection to the database
     * @param stock_id ID to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public HostStrainCollection( DBconnection conn, Long stock_id ) 
	throws SQLException {

        hostStrains = new ArrayList();
	populate( conn, stock_id );
    }
  
    /**
     * Retrieve host strain ids associated to stock_id through TairObject_Stock,
     * then create HostStrain objects for each.
     *
     * @param conn An active connection to the database
     * @param stock_id Stock id to retrieve data for
    */
    private void populate( DBconnection conn, Long stock_id ) 
	throws SQLException {

	String query = 
	    "SELECT h.host_strain_id " +
	    "FROM HostStrain h, TairObject_Stock ts " +
	    "WHERE h.tair_object_id = ts.tair_object_id " +
	    "AND h.is_obsolete = 'F' " +
	    "AND ts.stock_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( stock_id );

        ArrayList ids = null;

	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "host_strain_id" ) ) );
	}
	conn.releaseResources();
	
	if ( ids != null && !ids.isEmpty() ) {
	    Iterator iter = ids.iterator();
	    while ( iter.hasNext() ) {
		addElement( new HostStrain( conn, (Long) iter.next() ) );
	    }
        }
    }
  

    /**
     * Determines if collection has host strains in it or not
     *
     * @return <code>true</code> if collection has no host strains in it; 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return hostStrains.isEmpty(); 
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() {
	return hostStrains.size(); 
    }

    /**
     * Retrieves element at supplied index
     *
     * @return HostStrain at supplied index, or <code>null</code> if no 
     * element at supplied index
     */
    public HostStrain elementAt( int index ) { 
	return (HostStrain) hostStrains.get( index );
    }


    /**
     * Adds supplied element to collection
     * 
     * @param hostStrain HostStrain to add to collection
     */
    public void addElement( HostStrain hostStrain ) { 
	hostStrains.add( hostStrain ); 
    }

    /**
     * Removes supplied element from collection. If element is not in 
     * collection request is silently ignored
     *
     * @param hostStrain HostStrain to remove from collection
     */
    public void removeElement( HostStrain hostStrain ) {
	hostStrains.remove( hostStrain );
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection;
     * <code>false</code> if element is not found
     */
    public boolean contains( HostStrain hostStrain ) { 
	return hostStrains.contains( hostStrain ); 
    }

    /**
     * Retrieves elements in collection
     *
     * @return All host strains in collection as an <code>Iterator</code> of 
     * <code>HostStrain</code> objects, or <code>null</code> if no host strains
     * in collection
     */
    public Iterator iterator() { 
	return ( !hostStrains.isEmpty() ) ? hostStrains.iterator() : null; 
    }


 
    /**
     * For unit testing only
     */

    public void test() {
        System.out.println( "****** HostStrainCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            HostStrain hostStrain = null;

            while ( iter.hasNext() ) {
                hostStrain = (HostStrain) iter.next();
                hostStrain.test();
            }
        }
        System.out.println( "**** HostStrainCollection content test end ****" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long stockID = new Long( 1000710306 );
            HostStrainCollection strains = 
		new HostStrainCollection( conn, stockID );
            strains.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
      
    }
}
