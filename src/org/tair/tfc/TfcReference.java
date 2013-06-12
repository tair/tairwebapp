//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2005/05/03 21:00:00 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Reference table in the tair database. Each instance
 * maps one row of data in Reference table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 */


public class TfcReference implements Serializable {   

    private Long reference_id;
    private String reference_type;
    private String table_name;

    /**
     * Creates an empty instance of TfcReference
     */
    public TfcReference() {  }


    /**
     * Creates an instance of TfcReference that reflects the data referenced by
     * submitted reference_id.
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws RecordNotFoundException if no row found for reference_id
     * @throws SQLException if a database error occurs
     */
    public TfcReference( DBconnection conn, Long reference_id )
	throws RecordNotFoundException, SQLException {

	String query = 
	    "SELECT reference_id, " +
	    "reference_type, " +
	    "table_name " +
	    "FROM Reference " +
	    "WHERE reference_id = ?";
	conn.setQuery( query );
	conn.setQueryVariable( reference_id );

	ResultSet results = conn.getResultSet();
	boolean found = results.next();
	if ( found ) {
	    long id = results.getLong( "reference_id" );
	    if ( !results.wasNull() ) {
		this.reference_id = new Long( id );
	    }
	    this.reference_type = results.getString( "reference_type" );
	    this.table_name = results.getString( "table_name" );
	}
	conn.releaseResources();
	    
	if ( !found ) {
	    throw new RecordNotFoundException( "No Reference found " +
					       "for reference id: " +
					       reference_id );
	}
    }
    
    public void set_reference_id ( Long id ) {
	this.reference_id = id; 
    }

    public Long get_reference_id() {
	return reference_id; 
    }

    public void set_reference_type ( String type ) {
	this.reference_type = type; 
    }

    public String get_reference_type() {
	return reference_type; 
    }

    public void set_table_name( String name ) { 
	this.table_name = name; 
    }

    public String get_table_name() {
	return table_name; 
    }

    /**
     * Stores reference data to the database as an INSERT or UPDATE 
     * depending on whether reference id is null. 
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has
     * not been set
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {
	
	// ensure required data has been set
	validate();

	if ( get_reference_id() == null ) {
	    insert( conn );
	} else {
	    update( conn );
	}
    }

    /** 
     * Inserts a new row into Reference containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {
	String query = 
	    "INSERT Reference (" +
	    "reference_type, " +
	    "table_name ) " +
	    "VALUES ( ?, ?) " +
	    "SELECT @@IDENTITY";

	conn.setQuery( query );

	conn.setQueryVariable( 1, get_reference_type() );
	conn.setQueryVariable( 2, get_table_name() );

	// insert row and get newly created id
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    Long id = new Long( results.getLong( 1 ) );
	    set_reference_id( id );
	}
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in Reference with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    "UPDATE Reference SET " +
	    "ireference_type = ?, " +

	    "table_name = ? " +
	    "WHERE reference_id = ?";

	conn.setQuery( query );

	conn.setQueryVariable( 1, get_reference_type() );
	conn.setQueryVariable( 2, get_table_name() );
	conn.setQueryVariable( 3, get_reference_id() );

	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"Reference UPDATE failed: no row found for " +
		"reference id: " + get_reference_id();
	    throw new RecordNotFoundException( msg );
	}
	    
    }


    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any ids required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {
	if ( get_reference_type() == null ||
	     get_table_name() == null ) {

	    String errMsg = 
		"Cannot store Reference with " +
		"reference type: " + get_reference_type() +
		" table name: " + get_table_name();

	    throw new InvalidActionException( errMsg );
	}
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcReference content test ******" );
	System.out.println( "reference_id: " + get_reference_id() );
	System.out.println( "type: " + get_reference_type() );
	System.out.println( "table name: " + get_table_name() );
	System.out.println( "**** TfcReference content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1832 );
	    TfcReference reference = new TfcReference( conn, id );
	    reference.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
