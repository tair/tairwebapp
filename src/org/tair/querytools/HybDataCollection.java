//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/12/15 18:53:08 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * HybDataCollection is a custom collection that stores hyb data slides for
 * a hyb description object as a collection of <code>HybData/code> objects. 
 */


public class HybDataCollection  {   
    private ArrayList hybDatas;

    // accession of ExpressionSet that ultimately contains
    // this collection - this data is needed by each HybData
    // object in collection for creating FTP URLs for downloading
    // raw hyb data files -- this property must be explicitly
    // populated using the populateExpressionData() method
    private String expressionSubmissionNumber;

    // hyb description id for all elements in collection
    private Long hybDescriptionID;

    // list of items that have been removed from collection
    // and should be deleted from the database next time store
    // is called
    private List removed;


    /**
     * Creates an empty instance of HybDataCollection
     */
    public HybDataCollection() { 
	hybDatas = new ArrayList();
    }

    /**
     * Creates an instance of HybDataCollection that represents a collection of 
     * HybData objects for submitted hyb_description_id
     *
     * @param conn An active connection to the database
     * @param hyb_description_id Hyb description id to retrieve data for
     * @exception SQLException if a database error occurs
     */
    public HybDataCollection( DBconnection conn, Long hyb_description_id ) 
	throws SQLException {

	hybDatas = new ArrayList();

	this.hybDescriptionID = hyb_description_id;
	populate( conn );
    }

    /**
     * Retrieve hyb data ids associated to hyb description id & create HybData
     * objects for each
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {

	ArrayList ids = null;
	
	String query = 
	    "SELECT tair_object_id "+
	    "FROM HybData "+
	    "WHERE hyb_description_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( hybDescriptionID );

	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "tair_object_id" ) ) );
	}
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {
	    Iterator iter = ids.iterator();
	    while ( iter.hasNext() ) {
		add( new HybData( conn, (Long) iter.next() ) );
	    }
	}
    }


    /**
     * Retrieves expression set data (accession) needed for creating FTP 
     * hyperlinks to download raw hyb data file for each HybData object in
     * collection. This is redundant data since it's held in the 
     * ExpressionSet object that ultimately contains this collection, however
     * since it's a number of object layers away, making sure that data gets
     * here is awkward, so just easier to get it again here and populate each
     * object in collection with it. May need to change this if performance
     * becomes  an issue...
     *
     * @param conn An active connection to the database
     * @param hyb_description_id Hyb description id used to populate
     * collection of HybDatas that can then be used to retrieve accession value
     * for associated expression set
     * @throws SQLException thrown if a database error occurs
     */
    public void populateExpressionSetData( DBconnection conn, 
					   Long hyb_description_id ) 
	throws SQLException {

	String query =
	    "SELECT e.submission_number " +
	    "FROM ExpressionSet e, HybDescription h " +
	    "WHERE h.expression_set_id = e.expression_set_id " +
	    "AND h.hyb_description_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( hyb_description_id );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    this.expressionSubmissionNumber = 
		results.getString( "submission_number" );
	}
	conn.releaseResources();

	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    HybData hybData = null;
	    while ( iter.hasNext() ) {
		hybData = (HybData) iter.next();
		hybData.setExpressionSubmissionNumber( 
		    expressionSubmissionNumber );
	    }
	}
    }

    /**
     * Retrieves accession of expression set that ultimately contains this 
     * collection of hyb data.  This value is used by each HybData object to 
     * construct an FTP URL that can be used to download the raw hyb data file 
     * represented by each object
     */
    public String getExpressionSubmissionNumber() {
	return expressionSubmissionNumber;
    }


    /**
     * Determines if collection contains elements or not
     *
     * @return <code>true</code> if collection has no elements in it, or 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return hybDatas.isEmpty();
    }


    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return hybDatas.size(); 
    }

    
    /**
     * Retrieves all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of 
     * <code>HybData</code> objects, or <code>null</code> if no elements
     * in collection
     */
    public Iterator iterator() {
	return !isEmpty() ? hybDatas.iterator() : null;
    }
  
    /**
     * Retrieves element at submitted index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public HybData get( int index ) { 
	return (HybData) hybDatas.get( index );
    }

    /**
     * Retrieves hyb data slide with submitted name
     *
     * @param name Name of hyb data slide to retrieve
     */
    public HybData get( String name ) {
	HybData hybData = null;

	if ( !isEmpty() ) {
	    HybData tmpHybData = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		tmpHybData = (HybData) iter.next();
		if ( name.equalsIgnoreCase( tmpHybData.get_name() ) ) {
		    hybData = tmpHybData;
		    break;
		}
	    }
	}

	return hybData;
    }
  
    /**
     * Determines index of submitted object in collection
     *
     * @param hybData HybData object to retrieve index of
     * @return index of HybData within collection
     */
    public int indexOf( HybData hybData ) {
	return hybDatas.indexOf( hybData );
    }

    /**
     * Adds supplied element to collection
     * 
     * @param hybData HybData to add to collection
     */
    public void add( HybData hybData ) { 
	hybDatas.add( hybData ); 
    }

    /**
     * Removes slide with supplied name from collection.  Hyb data slide
     * will be deleted from the database the next time store is called on
     * the collection.
     */
    public void remove( String name ) {
	HybData hybData = get( name );

	remove( hybData );
    }

    /**
     * Removes supplied element from collection.   Hyb data slide
     * will be deleted from the database the next time store is called on
     * the collection.
     *
     * @param hybData HybData to remove from collection
     */
    public void remove( HybData hybData ) { 
	hybDatas.remove( hybData );

	// if element has a hyb data id, add to removed list for 
	// deletion; if no id, then no further action necessary
	if ( hybData.get_hyb_data_id() != null ) {
	    if ( removed == null ) {
		removed = new ArrayList();
	    }
	    removed.add( hybData );
	}
    }


    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( HybData hybData ) { 
	return hybDatas.contains( hybData );
    }

    /**
     * Sets hyb description id for submitted collection
     *
     * @param hybDescriptionID Hyb description id to set
     */
    public void setHybDescriptionID( Long id ) {
	this.hybDescriptionID = id;
	
	if ( !isEmpty() ) {
	    HybData hybData = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		hybData = (HybData) iter.next();
		hybData.set_hyb_description_id( id );
	    }
	}
    }
								

    /**
     * Sets expression set id for all elements in collection
     *
     * @param expressionSetID Expression set id to set
     */
    public void setExpressionSetID( Long id ) {
	if ( !isEmpty() ) {
	    HybData hybData = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		hybData = (HybData) iter.next();
		hybData.set_expression_set_id( id );
	    }
	}
    }


    /**
     * Stores contents of collection to the database. Any elements removed
     * from collection since it was created will now be deleted from the
     * database.
     * 
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any data element
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// delete any items removed from collection
	delete( conn );

	// store items in collection
	if ( !isEmpty() ) {
	    HybData hybData = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		hybData = (HybData) iter.next();
		hybData.store( conn );
	    }
	}
    }


    /**
     * Deletes items removed from the collection since it was created
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void delete( DBconnection conn ) 
       throws  SQLException {
	if ( removed != null ) {
	    HybData hybData = null;
	    for ( Iterator iter = removed.iterator(); iter.hasNext(); ) {
		hybData = (HybData) iter.next();
		hybData.delete( conn );
	    }
	}
    }
     



    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** HybDataCollection content test ******" );
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		HybData hybData = (HybData) iter.next();
		hybData.test();
	    }
	}
	System.out.println( "**** HybDataCollection content test end ****" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 644 );
	    HybDataCollection hdc = new HybDataCollection( conn, id );
	    hdc.populateExpressionSetData( conn, id );
	    hdc.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
