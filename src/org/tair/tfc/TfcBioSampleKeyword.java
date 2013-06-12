//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/07/06 16:33:00 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;

/**
 * This class maps to the BioSample_Keyword table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 */

public class TfcBioSampleKeyword {

    private Long keyword_id;
    private Long bio_sample_id;
    private Long relationship_type_id;
    private Long annotation_type_id;

    /**
     * Creates an empty instance of TfcBioSampleKeyword
     */
    public TfcBioSampleKeyword() { }


    /**
     * Creates an instance of TfcBioSampleKeyword that reflects the
     * data referenced by the combination of submitted bio_sample_id
     * keyword_id and relationship_type_id
     *
     * @param conn An active connection to the database
     * @param bio_sample_id Bio sample id to retrieve data for
     * @param keyword_id Keyword id to retrieve data for
     * @param relationship_type_id Relationship type id to retrieve data for
     * @throws SQLException thrown if a database error occurs, or if no row found
     * for combination of submitted ids
     */
    public TfcBioSampleKeyword( DBconnection conn, 
				Long bio_sample_id, 
				Long keyword_id, 
				Long relationship_type_id ) 
	throws SQLException {

	boolean found = false;

	// annotation type id is only field in table not
	// included in primary key, so only need to select it
	// to get all data for row in table
	String query =
	    "SELECT annotation_type_id " +
	    "FROM BioSample_Keyword " +
	    "WHERE bio_sample_id = ? " +
	    "AND keyword_id = ? " +
	    "AND relationship_type_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, bio_sample_id );
	conn.setQueryVariable( 2, keyword_id );
	conn.setQueryVariable( 3, relationship_type_id );

	ResultSet results = conn.getResultSet();
	found = results.next();
	if ( found ) {
	    set_bio_sample_id( bio_sample_id );
	    set_keyword_id( keyword_id );
	    set_relationship_type_id( relationship_type_id );

	    long id = results.getLong( "annotation_type_id" );
	    if ( !results.wasNull() ) {
		set_annotation_type_id( new Long( id ) );
	    }
	}
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No entry found in " +
					       "BioSample_Keyword " +
					       "for bio sample id: " + 
					       bio_sample_id + 
					       " keyword id: " + keyword_id +
					       " relationship_type_id: " + 
					       relationship_type_id );
	}
    }

    //
    // Get 'em and set 'em
    //

    public void set_bio_sample_id( Long id ) {
	this.bio_sample_id = id;
    }

    public Long get_bio_sample_id() {
	return bio_sample_id;
    }

    public void set_keyword_id( Long id ) {
	this.keyword_id = id;
    }

    public Long get_keyword_id() {
	return keyword_id;
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
     * Stores a row into BioSample_Keyword with current member variable values.
     * This operation is always done as an INSERT and is usually called by
     * a collection class that manages all keyword associations for a BioSample.
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
	    "INSERT BioSample_Keyword (" +
	    "bio_sample_id, " +
	    "keyword_id, " +
	    "relationship_type_id, " +
	    "annotation_type_id) " +
	    "VALUES ( ?, ?, ?, ? )";

	conn.setQuery( query );
	conn.setQueryVariable( 1, get_bio_sample_id() );
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

	if ( get_bio_sample_id() == null ||
	     get_keyword_id() == null ||
	     get_relationship_type_id() == null ||
	     get_annotation_type_id() == null ) {
	    
	    String msg = 
		"Cannot store TfcBioSampleKeyword with: " +
		"bio sample id: " + get_bio_sample_id() +
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
	System.out.println( "****** TfcBioSampleKeyword content test ******" );
	System.out.println( "bio_sample_id: " + get_bio_sample_id() );
	System.out.println( "keyword_id: " + get_keyword_id() );
	System.out.println( "relationship_type_id: " + get_relationship_type_id() );
	System.out.println( "annotation_type_id: " + get_annotation_type_id() );
	System.out.println( "**** TfcBioSampleKeyword content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try {
	    DBconnection conn = new DBconnection();
	    Long bioSampleID = new Long( 105 );
	    Long keywordID = new Long( 11617 );
	    Long relationshipTypeID = new Long( 27 );

	    TfcBioSampleKeyword bsk = 
		new TfcBioSampleKeyword( conn, 
					 bioSampleID, 
					 keywordID, 
					 relationshipTypeID );
	    bsk.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
