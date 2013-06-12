//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/04/26 21:18:50 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * PublicationObjectCollection is a custom collection class that stores 
 * publications associated to a given element as a collection of 
 * <code>PublicationObject</code> objects. 
 */


public class PublicationObjectCollection {

    private ArrayList publications;

    // maximum number of publications to hold in collection when populating
    // collection using "abbreviated" mode; this number is limited since the
    // total number may sometimes be too many to display on a detail page
    private static final int MAX_MEMBERS = 10;
    
    
    // flag to record whether collection only contains abbreviated list of 
    // publications. This will only be true when populating collection using
    // "abbreviated" mode, where data element is associated to more publications
    // than allowed by MAX_MEMBERS constant
    private boolean abbreviatedList = false;
    
    // total number of publications that *would* be in collection if list hadn't
    // been abbreviated by MAX_MEMBERS;
    private int fullCount = 0;


    /**
     * Creates an empty instance of PublicationObjectCollection
     */
    public PublicationObjectCollection()  {
	publications = new ArrayList();
    }

    /**
     * Creates an instance of PublicationObjectCollection that contains
     * all publications associated to id, where type of id (and what table 
     * to search for associations) is determined by type. Valid values
     * for type are "tair_object" and "community"
     *
     * @param conn An active connection to the database
     * @param id Element id to retrieve publications for
     * @param type Object type of id
     * @throws SQLException in the case of an invalid operation or database
     * error
     */
    public PublicationObjectCollection( DBconnection conn, 
					Long id, 
					String type ) 
	throws SQLException {

	publications = new ArrayList();

	// create full collection no matter what
	populate( conn, id, type, false );
    }

    /**
     * Creates an instance of PublicationObjectCollection that contains
     * publications associated to id, where type of id (and what table 
     * to search for associations) is determined by type. Valid values
     * for type are "tair_object" and "community"
     *
     * <p>
     * This constructor offers the option to create the collection in
     * "abbreviated" mode. If this population mode is selected, collection
     * will not contain more publications than the maximum number allowed
     * for display (currently 10).  If collection was abbreviated during
     * population, isAbbreviated will return <code>true</code>; total
     * number of publications associated to element can be determined
     * through the getFullCount method.
     *
     * @param conn An active connection to the database
     * @param id Element id to retrieve publications for
     * @param type Object type of id
     * @param abbreviate If <code>true</code> collection will not contain
     * more publications than allowed by MAX_MEMBERS constant (currently 10);
     * if <code>false</code> collection will contain all publications
     * associated to submitted element.
     * @throws SQLException in the case of an invalid operation or database
     * error
     */
    public PublicationObjectCollection( DBconnection conn, 
					Long id, 
					String type,
					boolean abbreviate ) 
	throws SQLException {

	publications = new ArrayList();

	// populate abbreviated or full collection according to
	// submitted value of abbreviate
	populate( conn, id, type, abbreviate );
    }

        


    /**
     * Populate collection with all publications associated to tair 
     * object or community id, as specified by type parameter. 
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve publications for
     * @param type Object type of id
     * @param abbreviate If <code>true</code> collection will not contain
     * more publications than allowed by MAX_MEMBERS constant (currently 10);
     * if <code>false</code> collection will contain all publications
     * associated to submitted element.
     * @throws SQLException in the case of an invalid operation or database
     * error
     */
    private void populate( DBconnection conn, 
			   Long id, 
			   String type, 
			   boolean abbreviate )
	throws SQLException {

	// Get type specific query to retrieve associated reference ids
	// & create publication objects from list of found ids
	String query = null;
	if ( type.equals( "tair_object" ) ) {
	    query = getTairObjectQuery();

	} else if ( type.equals( "community" ) ) {
	    query = getCommunityQuery();
	}

	conn.setQuery( query );
	conn.setQueryVariable( id );
	
	ArrayList ids = null;
	int counter = 0;
	ResultSet results = conn.getResultSet();

	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }

	    // if abbreviated mode requested and max number of
	    // publications has already been retrieved, set flag
	    // to track that max members has been exceeded & that 
	    // collection only contains partial list
	    if ( abbreviate && counter >= MAX_MEMBERS ) {
		this.abbreviatedList = true;

		// else save id in collection for populating
		// full object instance
	    } else {
		ids.add( new Long( results.getLong( "reference_id" ) ) );
	    }

	    counter++;
	}
	conn.releaseResources();

	// save total number of rows returned by query -- this is
	// useful for display if collection was abbreviated
	this.fullCount = counter;
	
	if ( ids != null && !ids.isEmpty() ) {
	    createRecords( conn, ids );
	}
    }


    /**
     * Retrieves SQL query for getting reference ids associated to a 
     * TairObject. Value of tair object id must be set as a query 
     * parameter value before executing
     *
     * @return SQL SELECT statement for retrieving reference ids
     * associated to a tair object id.
     */
    private String getTairObjectQuery() {
	String query = 
	    "SELECT r.reference_id " +
	    "FROM TairObj_Ref r, Publication p " +
	    "WHERE r.reference_id = p.reference_id " +
	    "AND r.tair_object_id = ? " + 
	    "ORDER BY p.publication_year DESC, p.title";

	return query;
    }

    /**
     * Retrieves SQL query for getting reference ids associated to a 
     * Community record. Value of community id must be set as a query 
     * parameter value before executing
     *
     * @return SQL SELECT statement for retrieving reference ids
     * associated to a community id.
     */
    private String getCommunityQuery() {
	String query = 
	    "SELECT r.reference_id " +
	    "FROM Reference_Community r, Publication p " +
	    "WHERE r.reference_id = p.reference_id " +
	    "AND r.community_id = ? " + 
	    "ORDER BY p.publication_year DESC";

	return query;
    }

 
    /**
     * Utility method to iterate through collection of ids & create 
     * PublicationObject objects to be stored in collection
     *
     * @param conn An active connection to the database
     * @param ids List of reference ids to create PublicationObjects
     * for; ids must be stored as Long objects.
     * @throws SQLException if a database error occurs
     */
    private void createRecords( DBconnection conn, ArrayList ids ) 
	throws SQLException {

	// trust that ids should never be null or empty if we got this far
	Iterator iter = ids.iterator(); 

	PublicationObject publication = null;
	while ( iter.hasNext() ) {
	    publication = new PublicationObject( conn, (Long) iter.next() );
	    add( publication );
	}
    }


    
    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no publications in it; 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return publications.isEmpty(); 
    }

    /**
     * Retrieves number of elements in collection. If isAbbreviated() returns
     * <code>true</code>, this value should not be used to determine how many
     * publications are associated to a data element, since it only records how
     * many elements are actually in the collection. In this case, the number
     * of associated publications can be determined using the getFullCount
     * method.
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return publications.size(); 
    }

    
    /**
     * Determines whether collection contains only a partial list of 
     * publications for a data element.  This will only be true if collection 
     * was populated in "abbreviated" mode, and if data element has more 
     * associated publications than allowed in the collection by MAX_MEMBERS 
     * constant (currently 10). This is done since some elements have so many
     * associated publications that displaying them all is unwieldly on a 
     * detail page; this method can then be used to determine whether a 
     * "show all" link should be provided
     *
     * @return <code>true</code> if collection only contains a partial list
     * of all publications for a given data element, or <code>false</code> if
     * collection is a full list of all publications retrieved by population 
     * methods
     */
  public boolean isAbbreviatedList() {
    return abbreviatedList;
  }

    /**
     * Retrieve total number of publications associated to a data element.  If
     * collection was abbreviated during population, this method can be used to
     * to determine the total number of rows that matched the original query, 
     * even though publication objects were not created for all results.  This 
     * is useful for showing helpful display info. when displaying an 
     * abbreviated list like "showing 10 of 43 publications".
     *
     * <p>
     * NOTE: if isAbbreviatedList() returns <code>false</code> (i.e. collection 
     * is not an abbreviated collection), this method will return the same 
     * number as if size() were called
     *
     * @return Number of publicationss that would be in collection if collection
     * size had not been limited by MAX_MEMBERS constant when collection was 
     * populated
     */
    public int getFullCount() {
	return fullCount;
    }

    /**
     * Retrieves element at supplied index
     *
     * @return PublicationObject at supplied index, or <code>null</code> if
     * no element at supplied index
     */
    public PublicationObject get( int index ) { 
	return (PublicationObject) publications.get( index );
    }


    /**
     * Adds supplied element to collection
     * 
     * @param publication PublicationObject to add to collection
     */
    public void add( PublicationObject publication ) { 
	publications.add( publication ); 
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param publication PublicationObject to remove from collection
     */
    public void remove( PublicationObject publication ) {
	publications.remove( publication );
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( PublicationObject publication ) {
	return publications.contains( publication );
    }


    /**
     * Retrieves all elements in collection
     *
     * @return All publications in collection as an <code>Iterator</code> of 
     * <code>PublicationObject</code> objects, or <code>null</code> if no 
     * publications in collection
     */
    public Iterator iterator() { 
	return ( !publications.isEmpty() ) ? publications.iterator() : null; 
    }


    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be 
     * sorted by
     */
    public void sort( Comparator comparator ) {
	Collections.sort( publications, comparator );
    }



    /**
     * For unit testing only
     */
    public void test() {
              
	System.out.println( "** PublicationObjectCollection content test **" );
	Iterator iter = iterator();
	if ( iter != null ) {
	    while ( iter.hasNext() ) {
		PublicationObject publication = (PublicationObject) iter.next();
		publication.test();
	    }
	}
	System.out.println( "** PublicationObjectCollection content " +
			    "test end **" );
    }


    /**
     * For unit testing only
     */ 
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();

	    System.out.println( "\n******TairObject Mode*****" );
	    Long id = new Long( 1950963 );
	    PublicationObjectCollection publications = 
		new PublicationObjectCollection( conn, id, "tair_object" );
	    publications.test();


	    System.out.println( "\n******Community Mode*****" );
	    id = new Long( 4489 );
	    publications = 
		new PublicationObjectCollection( conn, id, "community" );
	    publications.test();


	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
