//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2004/07/06 16:33:03 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;


/**
 * This class maps to the ReferenceURL table in the tair database. Each instance
 * maps one row of data in ReferenceURL table. Each data object maps to one 
 * field of a row in the table. Each field has one set method and one get method
 * for accessing from outside of class.
 */

public class TfcReferenceURL {   

    private Long reference_id;
    private BigInteger url_id;


    /**
     * Creates an empty instance of TfcReferenceURL
     */
    public TfcReferenceURL()
    {
    }

    /**
    * Creates an instance of TfcReferenceURL that reflects the data referenced
    * by submitted combination of reference and URL ids
    *
    * @param conn An active connection to the database
    * @param reference_id Reference id to retrieve data for
    * @param url_id URL id to retrieve data for
    * @throws RecordNotFoundException if no row found for combination of ids
    * @throws SQLException if a database error occurs
    */
    public TfcReferenceURL( DBconnection conn, Long reference_id, BigInteger url_id )
	throws SQLException {

	boolean found = false;
	String query = 
	    "SELECT reference_id, "+
	    "url_id "+
	    "FROM Reference_URL "+
	    "WHERE reference_id = ? " +
	    "AND url_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, reference_id );
	conn.setQueryVariable( 2, url_id );

	ResultSet results = conn.getResultSet();              
	found = results.next();
	// if found, just assign input to member vars and close since
	// table contains no other data
	if ( found ) {
	    set_url_id( url_id );
	    set_reference_id( reference_id );
	}
	conn.releaseResources();
	
	if ( !found ) {
	    throw new RecordNotFoundException( "No row found for url id: " +
					       url_id +
					       " , reference_id: " +
					       reference_id );
	}
    }

    //
    // Get 'em and set 'em
    //

    public void set_reference_id ( Long id ) {
	this.reference_id = id;
    }

    public Long get_reference_id() {
	return reference_id;
    }

    public void set_url_id ( BigInteger id ) {
	this.url_id = id;
    }

    public BigInteger get_url_id() {
	return url_id;
    }

 
    /**
     * Determines if submitted url id is currently associated to any reference
     * ids. This is helpful for determining whether a url can be deleted or not
     * after its association to a reference or community id have been removed.
     * Any URLs that have no remaining associations should be deleted in this 
     * case to avoid orphans.
     *
     * @param conn An active connection to the database
     * @return <code>true</code> if URL is associated to any reference ids; 
     * <code>false</code> if no associations found
     * @throws SQLException if a database error occurs
     */
    public static boolean hasReferences( DBconnection conn, BigInteger url_id )
	throws SQLException {

	boolean hasMultiple = false;

	String query =
	    "SELECT COUNT( reference_id ) AS count " +
	    "FROM Reference_URL " +
	    "WHERE url_id = ? ";
	
	conn.setQuery( query );
	conn.setQueryVariable( 1, url_id );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    if ( results.getInt( "count" ) > 0 ) {
		hasMultiple = true;
	    }
	}
	conn.releaseResources();

	return hasMultiple;
    }



    /**
     * Determines if a row already exists in Reference_URL table
     * with this combination of ids.  If so, no further action is
     * needed to store association to the database.
     *
     * @param conn An active connection to the database
     * @return <code>true</code> if a row exists with this combination
     * of ids, <code>false</code> if no rows exists with this combination
     * of ids
     * @throws SQLException if a database error occurs
     */
    private boolean exists( DBconnection conn ) throws SQLException {
	boolean exists = false;

	String query =
	    "SELECT reference_id " +
	    "FROM Reference_URL " +
	    "WHERE reference_id = ? " +
	    "AND url_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( 1, get_reference_id() );
	conn.setQueryVariable( 2, get_url_id() );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) { // don't need any more info than this
	    exists = true;
	}
	conn.releaseResources();
	
	return exists;
    }
	

    /**
     * Stores a row into Reference_URL with current member variable values.
     * This operation is done an INSERT if no row already exists with 
     * reference id and url id.
     *
     * @param conn A connection with INSERT privileges 
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if store is called when any one of member
     * variables are NULL
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {
	
	String missingColumn = null;
	if ( get_reference_id() == null ) {
	    missingColumn = "reference id ";

	} else if ( get_url_id() == null ) {
	    missingColumn += "url id ";

	}

	if ( missingColumn != null ) {
	    throw new InvalidActionException( "Cannot store " +
					      "TfcReferenceURL with " +
					      missingColumn + " NULL" );
	}

	// only insert if no row already exists
	if ( !exists( conn ) ) {
	    
	    String query =
		"INSERT Reference_URL (" +
		"reference_id, " +
		"url_id ) " +
		"VALUES ( ?, ?)";
	    
	    conn.setQuery( query );
	    conn.setQueryVariable( 1, get_reference_id() );
	    conn.setQueryVariable( 2, get_url_id() );
	    conn.executeUpdate();
	    conn.releaseResources();
	}
    }

    /**
     * Deletes association between reference and URL 
     *
     * @param conn A database connection with DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
	String query =
	    "DELETE Reference_URL " +
	    "WHERE reference_id = ? " +
	    "AND url_id = ? ";

	conn.setQuery( query );
	conn.setQueryVariable( 1, get_reference_id() );
	conn.setQueryVariable( 2, get_url_id() );
	conn.executeUpdate();
	conn.releaseResources();
    }
}
