//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2005/05/03 19:16:14 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;



/**
 * This class maps to the Protocol table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 */

public class TfcProtocol extends TfcReference {

    private Long protocol_id;
    private Long publication_id;
    private Long communication_id;
    private String title;
    private Integer pubmed_id;
    private String description;
    private String authors;
    private String usage;
    private String methods;
    private String status;
    private java.util.Date date_last_modified;
  
    /**
     * Creates an empty instance of TfcProtocol
     */
    public TfcProtocol() {
	super();
    }

    /**
     * Creates an instance of TfcProtocol that reflects the data referenced
     * by submitted reference_id
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws RecordNotFoundException if no row found for id
     * @throws SQLException if a database error occurs
     */
    public TfcProtocol( DBconnection conn, Long reference_id ) 
	throws SQLException {

	super( conn, reference_id );
    
	boolean found = false;
	String query = 
	    getBaseQuery() + 
	    "WHERE reference_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( reference_id );
	ResultSet results = conn.getResultSet();
	found = processResults( results );
	conn.releaseResources();
	
	if ( !found ) {
	    throw new RecordNotFoundException( "No protocol found with " +
					       "reference id: " + reference_id );
	}
    }

    /**
     * Return basic select statement
     */
    private String getBaseQuery() {
	String query =
	    "SELECT protocol_id, " +
	    "publication_id, " +
	    "communication_id, " +
	    "title, " +
	    "pubmed_id, " +
	    "description, " +
	    "authors, " +
	    "usage, " +
	    "methods, " +
	    "status, " +
	    "date_last_modified " +
	    "FROM Protocol ";
	return query;
    }
  
    /**
     * Store results of query in member variables - return flag to notify caller 
     * whether query produced results or not
     */
    private boolean processResults( ResultSet results ) throws SQLException {
	boolean found = results.next();

	if ( found ) {
	    set_protocol_id( new Long( results.getLong( "protocol_id" ) ) );
     
	    long id = results.getLong( "publication_id" );
	    if ( !results.wasNull() ) {
		set_publication_id( new Long( id ) );
	    }

	    id = results.getLong( "communication_id" );
	    if ( !results.wasNull() ) {
		set_communication_id( new Long( id ) );
	    }

	    set_title( results.getString( "title" ) );
     
	    int pubMedID = results.getInt( "pubmed_id" );
	    if ( !results.wasNull() ) {
		set_pubmed_id( new Integer( pubMedID ) );
	    }

	    set_description( results.getString( "description" ) );
	    set_authors( results.getString( "authors" ) );
	    set_usage( results.getString( "usage" ) );
	    set_methods( results.getString( "methods" ) );
	    set_status( results.getString( "status" ) );
	    set_date_last_modified( results.getDate( "date_last_modified" ) );
	}
    
	return found;
    }


    public void set_protocol_id( Long id ) { 
	this.protocol_id = id;
    }
  
    public Long get_protocol_id() { 
	return protocol_id;
    }

    public void set_publication_id( Long id ) { 
	this.publication_id = id; 
    }

    public Long get_publication_id() {
	return publication_id; 
    }

    public void set_communication_id( Long id ) {
	this.communication_id = id; 
    }

    public Long get_communication_id() {
	return communication_id; 
    }

    public void set_title( String title ) {
	this.title = title;
    }

    public String get_title() {
	return title;
    }

    public void set_pubmed_id( Integer id ) { 
	this.pubmed_id = id;
    }

    public Integer get_pubmed_id() {
	return pubmed_id;
    }

    public void set_description( String description ) {
	this.description = description;
    }

    public String get_description() { 
	return description;
    }

    public void set_authors( String authors ) {
	this.authors = authors;
    }

    public String get_authors() {
	return authors; 
    }

    public void set_usage( String usage ) { 
	this.usage = usage;
    }

    public String get_usage() {
	return usage; 
    }

    public void set_methods( String methods ) {
	this.methods = methods;
    }

    public String get_methods() {
	return methods;
    }

    public void set_status( String status ) {
	this.status = status;
    }

    public String get_status() { 
	return status; 
    }

    public void set_date_last_modified( java.util.Date date ) {
	this.date_last_modified = date;
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified;
    }


    
    /**
     * Retrieves reference id for submitted protocol title
     *
     * @param conn An active connection to the database
     * @param title Protocol title to look up
     * @return Reference id for submitted protocol title or <code>null</code>
     * if no row found for title
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveReferenceID( DBconnection conn,
					    String title )
        throws SQLException {

        Long id = null;

        String query =
            "SELECT reference_id " +
            "FROM Protocol " +
            "WHERE UPPER( title ) = " +
	    TextConverter.dbQuote( title.toUpperCase() );

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "reference_id" ) );
        }
        conn.releaseResources();

        return id;
    }
 
    
    /**
     * Retrieves reference id for submitted protocol title and description
     *
     * @param conn An active connection to the database
     * @param title Protocol title to look up
     * @param description Protocol description to look up
     * @return Reference id for submitted protocol title and description or <code>null</code>
     * if no row found for title and description
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveReferenceID( DBconnection conn,
					    String title,
                                            String description )
        throws SQLException {

        Long id = null;

        String query =
            "SELECT reference_id " +
            "FROM Protocol " +
            "WHERE UPPER( title ) = " +
	    TextConverter.dbQuote( title.toUpperCase() ) + 
            " AND UPPER( description) =  " +  
            TextConverter.dbQuote( description.toUpperCase() ) ;

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "reference_id" ) );
        }
        conn.releaseResources();

        return id;
    }
 
    



    /**
     * Stores protocol data to the database as an UPDATE or INSERT depending
     * on whether protocol id is null or not. Since storing protocol also
     * results in storing Reference through superclass, protocol storing
     * should be done as part of an explicit database transaction to avoid
     * problems should an error occur in the middle of the operation.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set for protocol
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	// ensure required data has been set
	validate();

	// store superclass data before protocol data to ensure
	// creation of new reference id
	super.store( conn );

	// set date last modified to now for either operation
	set_date_last_modified( new java.util.Date() );

	if ( get_protocol_id() == null ) {
	    insert( conn );
	} else {
	    update( conn );
	}

    }

    /** 
     * Inserts a new row into Protocol containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	String query = 
	    "INSERT Protocol (" +
	    "reference_id, " +
	    "publication_id, " +
	    "communication_id, " +
	    "title, " +
	    "pubmed_id, " +
	    "description, " +
	    "authors, " +
	    "usage, " +
	    "methods, " +
	    "status, " +
	    "date_last_modified) " +
	    "VALUES ( " +
	    get_reference_id() + ", " +
	    get_publication_id() + ", " +
	    get_communication_id() + ", " +
	    TextConverter.dbQuote( get_title() ) + ", " +
	    get_pubmed_id() + ", " +
	    TextConverter.dbQuote( get_description() ) + ", " +
	    TextConverter.dbQuote( get_authors() ) + ", " +
	    TextConverter.dbQuote( get_usage() ) + ", " +
	    TextConverter.dbQuote( get_methods() ) + ", " +
	    TextConverter.dbQuote( get_status() ) + ", " +
	    TextConverter.dbQuote( get_date_last_modified(), "mm/dd/yyyy" ) + 
	    ") " +
	    "SELECT @@IDENTITY";

	conn.setQuery( query );

	// insert row and get newly created id
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    Long id = new Long( results.getLong( 1 ) );
	    set_protocol_id( id );
	}
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in Protocol with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    "UPDATE Protocol SET " +
	    "publication_id = " + get_publication_id() + ", " +
	    "communication_id = " + get_communication_id() + ", " +
	    "title = " + TextConverter.dbQuote( get_title() ) + ", " +
	    "pubmed_id = " + get_pubmed_id() + ", " +
	    "description = " + TextConverter.dbQuote( get_description() ) + ", " +
	    "authors = " + TextConverter.dbQuote( get_authors() ) + ", " +
	    "usage = " + TextConverter.dbQuote( get_usage() ) + ", " +
	    "methods = " + TextConverter.dbQuote( get_methods() ) + ", " +
	    "status = " + TextConverter.dbQuote( get_status() ) + ", " +
	    "date_last_modified = " +
	    TextConverter.dbQuote( get_date_last_modified(), "mm/dd/yyyy" ) + " " +
	    "WHERE protocol_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( get_protocol_id() );

	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"Protocol UPDATE failed: no row found for " +
		"protocol id: " + get_protocol_id();
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

	// Set reference type and table_name values for new entry.
	// Do this here to make sure that super class data is set
	// correctly before super.store is called
	if ( get_reference_id() == null ) {
	    super.set_reference_type( "protocol" );
	    super.set_table_name( "Protocol" );
	}


	// bare minimum data for protocol is title
	if ( get_title() == null ) {
	    throw new InvalidActionException( "Cannot store Protocol " +
					      "with title NULL" );
	}
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcProtocol content test ******" );
	super.test();
	System.out.println( "protocol_id: " + get_protocol_id() );
	System.out.println( "publication_id: " + get_publication_id() );
	System.out.println( "communication_id: " + get_communication_id() );
	System.out.println( "title: " + get_title() );
	System.out.println( "pubmed_id: " + get_pubmed_id() );
	System.out.println( "description: " + get_description() );
	System.out.println( "authors: " + get_authors() );
	System.out.println( "usage: " + get_usage() );
	System.out.println( "methods: " + get_methods() );
	System.out.println( "status: " + get_status() );
	System.out.println( "get_date_last_modified: " + get_date_last_modified() );
	System.out.println( "****** TfcProtocol content end ******" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 501683758 );
	    TfcProtocol protocol = new TfcProtocol( conn, id );
	    protocol.test();


	    System.out.println( "\nname to id..." );
	    id = TfcProtocol.retrieveReferenceID( conn,
						  "rna isolation" );
	    System.out.println( "id: " + id );

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
