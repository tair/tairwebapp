//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/06 16:33:03 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.InvalidActionException;


/** 
 * This class maps to the TairObject_Keyword table in the tair database. Each
 * instance maps one row of data. Each data object maps to one field of a row
 * in the table. Each field has one set method and one get method for accessing
 * from outside of class.  
 */

public class TfcTairObjectKeyword {

    private Long keyword_id;
    private Long tair_object_id;
    private Long relationship_type_id;
    private Long annotation_type_id;


    /**
     * Creates an empty instance of TfcTairObjectKeyword
     */
    public TfcTairObjectKeyword() { }
    

    /**
     * Creates an instance of TfcTairObjectKeyword that reflects the join
     * between submitted keyword id and tair object id with submitted
     * relationship type
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @param keyword_id Keyword id to retrieve data for
     * @param relationship_type_id Relationship type id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted combination
     * of ids
     * @throws SQLException if a database error occurs
     */
    public TfcTairObjectKeyword( DBconnection conn,
				 Long tair_object_id,
				 Long keyword_id,
				 Long relationship_type_id )
	throws SQLException {

	// annotation type id is only field in table not
	// included in primary key, so only need to select it
	// to get all data for row in table
	String query =
	    "SELECT annotation_type_id " +
	    "FROM TairObject_Keyword " +
	    "WHERE tair_object_id = ? " +
	    "AND keyword_id = ? " +
	    "AND relationship_type_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, tair_object_id );
	conn.setQueryVariable( 2, keyword_id );
	conn.setQueryVariable( 3, relationship_type_id );

	boolean found = false;

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    found = true;
	    set_tair_object_id( tair_object_id );
	    set_keyword_id( keyword_id );
	    set_relationship_type_id( relationship_type_id );

	    long id = results.getLong( "annotation_type_id" );
	    if ( !results.wasNull() ) {
		set_annotation_type_id( new Long( id ) );
	    }
	}
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No row found in " +
					       "TairObject_Keyword for " +
					       "tair object id: " + 
					       tair_object_id +
					       " keyword id: " + keyword_id +
					       " relationship type id: " +
					       relationship_type_id );
	}

    }

    //
    // get 'em and set 'em
    //

    public void set_keyword_id( Long id ) {
	this.keyword_id = id;
    }

    public Long get_keyword_id() {
	return keyword_id;
    }

    public void set_tair_object_id( Long id ) {
	this.tair_object_id = id;
    }

    public Long get_tair_object_id() {
	return tair_object_id;
    }

    public void set_relationship_type_id( Long id ) {
	this.relationship_type_id = id;
    }

    public Long get_relationship_type_id() {
	return relationship_type_id;
    }

    public void set_annotation_type_id( Long id ) {
	this.annotation_type_id = id;
    }

    public Long get_annotation_type_id() {
	return annotation_type_id;
    }

    /**
     * Stores a row into TairObject_Keyword with current member variable values.
     * This operation is always done as an INSERT and is usually called by
     * a collection class that manages all keyword associations for a TairObject.
     * When updating, the collection class should usually DELETE all prior rows
     * in this table, then re-INSERT rows to represent only those associations
     * remaining in the collection.
     *
     * @param conn A connection with INSERT privileges 
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if store is called when any one of member
     * variables are NULL
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {
	
	validate();

	String query =
	    "INSERT TairObject_Keyword (" +
	    "tair_object_id, " +
	    "keyword_id, " +
	    "relationship_type_id, " +
	    "annotation_type_id) " +
	    "VALUES ( ?, ?, ?, ? )";

	conn.setQuery( query );
	conn.setQueryVariable( 1, get_tair_object_id() );
	conn.setQueryVariable( 2, get_keyword_id() );
	conn.setQueryVariable( 3, get_relationship_type_id() );
	conn.setQueryVariable( 4, get_annotation_type_id() );

	conn.executeUpdate();
	conn.releaseResources();
    }

    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any ids required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {

	if ( get_tair_object_id() == null ||
	     get_keyword_id() == null ||
	     get_relationship_type_id() == null ||
	     get_annotation_type_id() == null ) {

	    String msg = 
		"Cannot store TfcTairObjectKeyword with: " +
		"tair object id: " + get_tair_object_id() +
		" keyword id: " + get_keyword_id() +
		" relationship type id: " + get_relationship_type_id() +
		" annotation type id: " + get_annotation_type_id();

	    throw new InvalidActionException( msg );
	}
    }


    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "*** TfcTairObjectKeyword content test ***" );
	System.out.println( "keyword_id: " + get_keyword_id() );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "relationship_type_id: " + 
			    get_relationship_type_id() );

	System.out.println( "annotation_type_id: " + get_annotation_type_id() );
	System.out.println( "*** TfcTairObjectKeyword content end ***" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try {

	    DBconnection conn = new DBconnection();
	    Long tairObjID = new Long( 1945450 );
	    Long keywordID = new Long( 907 );
	    Long rtID = new Long( 31 );

	    TfcTairObjectKeyword tairObjKeyword = 
		new TfcTairObjectKeyword( conn,
					  tairObjID,
					  keywordID,
					  rtID );
	    tairObjKeyword.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}



