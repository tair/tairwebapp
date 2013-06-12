//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/04/05 22:43:44 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.sql.*;
import java.util.*;


/** 
 * GeneticMarkerCollection is a custom collection that stores
 * all genetic markers for a Map Element or Locus as a collection 
 * of <code>GeneticMarker</code> objects.
 */

public class GeneticMarkerCollection {
    private ArrayList markers;

    /**
     * Creates an empty instance of GeneticMarkerCollection
     */
    public GeneticMarkerCollection() { 
	markers = new ArrayList();
    }
  
    /**
     * Creates an instance of GeneticMarkerCollection that contains genetic
     * markers made from the submitted map element id 
     *
     * @param db An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public GeneticMarkerCollection( DBconnection db, Long map_element_id ) 
	throws SQLException {

	markers = new ArrayList();
	populate( db, map_element_id, "map_element" );
    }
  
  
    /**
     * Creates an instance of GeneticMarkerCollection that contains genetic
     * markers made from the submitted id where object type of id i
     * and how markes are retrieved are determined by type. Possible values of 
     * type are:
     *
     * <ul>
     * <li>map_element - id should be map_element_id
     * <li>locus - id should be locus id
     * <li>ref_polymorphism - id should be reference polymorphism id
     * </ul>
     *
     * GeneticMarkers are stored as <code>GeneticMarker</code> objects
     *
     * @param db An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type to retrieve clones for
     * @throws SQLException if a database error occurs
     */
    public GeneticMarkerCollection( DBconnection db, Long id, String type ) 
	throws SQLException {

	markers = new ArrayList();

	populate( db, id, type );
    }
  
  
    /**
     * Retrieve genetic marker ids according to logic specified by type,
     * create GeneticMarker objects and store.
     */
    private void populate( DBconnection db, Long id, String type ) 
	throws SQLException {

	ArrayList ids = null;
	String query = null;
        
	if ( type.equalsIgnoreCase( "map_element" ) ) {
	    query = 
		"SELECT genetic_marker_id "+
		"FROM GeneticMarker "+
		"WHERE is_obsolete = 'F' " +
		"AND made_from_id = " + id.toString();
	} else if ( type.equalsIgnoreCase( "locus" ) ) {
	    query = 
		"SELECT g.genetic_marker_id "+
		"FROM GeneticMarker g, MapElement_Locus m " +
		"WHERE g.map_element_id = m.map_element_id " +
		"AND g.is_obsolete = 'F' " +
		"AND m.locus_id = " + id.toString();
	} else if ( type.equalsIgnoreCase( "ref_polymorphism" ) ) {
	    query = 
		"SELECT distinct p.genetic_marker_id "+
		"FROM Polymorphism p " +
		"WHERE p.genetic_marker_id IS NOT NULL " +
		"AND p.ref_polymorphism_id = " + id.toString();
	}
	
	if ( query != null ) {
	    db.setQuery( query );
	    ResultSet results = db.getResultSet();
	    while ( results.next() ) {
		if ( ids == null ) {
		    ids = new ArrayList();
		}
		ids.add( new Long( results.getLong( "genetic_marker_id" ) ) );
	    }
	    db.releaseResources();
        

	    if ( ids != null ) {
		Iterator iter = ids.iterator();
		while ( iter.hasNext() ) {
		    addElement( new GeneticMarker( db, (Long) iter.next() ) );
		}
	    }
	}
    }

    /**
     * @return <code>true</code> if collection has no genetic markers in it; 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() {
	return markers.isEmpty(); 
    }

    /**
     * @return Number of elements in collection
     */
    public int size() { 
	return markers.size(); 
    }


    /**
     * @return Genetic marker at supplied index, or <code>null</code> 
     * if no element at supplied index
     */
    public GeneticMarker elementAt( int index ) { 
	return (GeneticMarker) markers.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param marker Genetic marker to add to collection
     */
    public void addElement( GeneticMarker marker ) { 
	markers.add( marker ); 
    }

    /**
     * Removes supplied element from collection.
     *
     * @param marker Genetic marker to remove from collection
     */
    public void removeElement( GeneticMarker marker ) { 
	markers.remove( marker ); 
    }

    /**
     * @return <code>true</code> if supplied element is in collection;
     * <code>false</code> if element is not found
     */
    public boolean contains( GeneticMarker marker ) { 
	return markers.contains( marker ); 
    }

    /**
     * @return All genetic markers in collection as an <code>Iterator</code>
     * of <code>GeneticMarker</code> objects, or <code>null</code> if no 
     * genetic markers in collection
     */
    public Iterator iterator() { 
	return ( !markers.isEmpty() ) ? markers.iterator() : null; 
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** GeneticMarkerCollection content test ******" );
	if ( !isEmpty() ) {
	    GeneticMarker object = null;
	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		object = (GeneticMarker) iter.next();
		object.test();
	    }
	}
	System.out.println( "**** GeneticMarkerCollection content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection connection = new DBconnection();

	    Long test_id = new Long( 1011948 );
	    GeneticMarkerCollection genetic_marker = 
		new GeneticMarkerCollection( connection,test_id );
	    genetic_marker.test();

	    System.out.println( "** ref_polymorphism_id = 3709 ** " );
	    Long ref_poly_test_id = new Long( 3709 );
	    genetic_marker = new GeneticMarkerCollection( connection, 
							  ref_poly_test_id, 
							  "ref_polymorphism" );
	    genetic_marker.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}

    }

}
  








