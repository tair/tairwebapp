//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2004/07/06 16:32:59 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the AnalysisSoftware table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the 
 * table.
 */


public class TfcAnalysisSoftware {   

    private Long analysis_software_id;
    private Long url_id;
    private String program_name;
    private String description;
    private String source;
    private String author;
    private String sw_function;
    private String version;
    private java.util.Date date_released;

    /**
     * Creates an empty instance of TfcAnalysisSoftware
     */
    public TfcAnalysisSoftware() {  }
  
    /**
     * Creates an instance of TfcAnalysisSoftware to reflect the data referenced
     * by submitted analysis_software_id
     *
     * @param conn An active connection to the database
     * @param analysis_software_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for analysis software id
     * @throws SQLException if a database error occurs
     */
    public TfcAnalysisSoftware( DBconnection conn, Long analysis_software_id )
	throws SQLException {
	
        boolean found = false;
	String query = 
	    getBaseQuery() + 
	    "WHERE analysis_software_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( analysis_software_id );

	ResultSet results = conn.getResultSet();
	found = processResults( results );

	conn.releaseResources();
	
        if ( !found ) {
            throw new RecordNotFoundException( "No analysis software record " +
					       "found for analysis software " +
					       "id: " + analysis_software_id );
        }
    }
  
  
    /**
     * Return basic select statement
     */
    private String getBaseQuery() {
        String query = 
            "SELECT analysis_software_id, "+
            "url_id, "+
            "program_name, "+
            "description, "+
            "source, "+
            "author, "+
            "sw_function, "+
            "version, "+
            "date_released "+
            "FROM AnalysisSoftware ";
        return query;
    }
  
    /**
     * Store results of query in member variables - return flag to notify
     * caller whether query produced results or not
     */
    private boolean processResults( ResultSet results ) throws SQLException {
        boolean found = false;
	
        found = results.next();
        if ( found ) {
            long id = results.getLong( "analysis_software_id" );
            if ( !results.wasNull() ) {
                set_analysis_software_id( new Long( id ) );
            }
      
            id = results.getLong( "url_id" );
            if ( !results.wasNull() ) {
                set_url_id( new Long( id ) );
            }
      
            set_program_name( results.getString( "program_name" ) );
            set_description( results.getString( "description" ) );
            set_source( results.getString( "source" ) );
            set_author( results.getString( "author" ) );
            set_sw_function( results.getString( "sw_function" ) );
            set_version( results.getString( "version" ) );
            set_date_released( results.getDate( "date_released" ) );
        }
    
        return found;
    }


    //
    // Get 'em and set 'em
    //

    public void set_analysis_software_id ( Long id ) { 
	this.analysis_software_id = id;
    }

    public Long get_analysis_software_id() {
	return analysis_software_id;
    }

    public void set_url_id ( Long id ) {
	this.url_id = id; 
    }

    public Long get_url_id() {
	return url_id; 
    }

    public void set_program_name ( String name ) {
	this.program_name = name; 
    }

    public String get_program_name() {
	return program_name; 
    }

    public void set_description ( String descr ) {
	this.description = descr;
    }

    public String get_description() {
	return description;
    }

    public void set_source ( String source ) {
	this.source = source;
    }

    public String get_source() {
	return source;
    }

    public void set_author ( String author ) {
	this.author = author;
    }

    public String get_author() { 
	return author;
    }

    public void set_sw_function ( String function ) {
	this.sw_function = function; 
    }

    public String get_sw_function() { 
	return sw_function;
    }

    public void set_version ( String version ) {
	this.version = version; 
    }

    public String get_version() { 
	return version;
    }

    public void set_date_released ( java.util.Date date ) {
	this.date_released = date;
    }

    public java.util.Date get_date_released() { 
	return date_released;
    }


    /**
     * Retrieves analysis software id for analysis software program with 
     * submitted program name and version
     *
     * @param conn An active connection to the database
     * @param programName Program name to look up
     * @param version Program version to look up
     * @return Analysis software id for program name and version, or 
     * <code>null</code> if no row found for submitted combination of values
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveAnalysisSoftwareID( DBconnection conn,
						   String programName,
						   String version ) 
        throws SQLException {

	Long id = null;

	// version may be null -- use uppercase value if possible
	String versionUC = ( version != null ) ? version.toUpperCase() : null;

	String query =
	    "SELECT analysis_software_id " +
	    "FROM AnalysisSoftware " +
	    "WHERE UPPER( program_name ) =  " + 
	    TextConverter.dbQuote( programName.toUpperCase() ) + " " +
	    "AND UPPER( version ) = " + 
	    TextConverter.dbQuote( versionUC );
	
	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    id = new Long( results.getLong( "analysis_software_id" ) );
	}
	conn.releaseResources();

	return id;
    }


    /**
     * Stores analysis software data to the database as an UPDATE or INSERT 
     * depending on whether analysis software id is null or not.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set 
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	// ensure required data has been set
	validate();

	if ( get_analysis_software_id() == null ) {
	    insert( conn );
	} else {
	    update( conn );
	}

    }

    /**
     * Retrieves values to store for this class as a Map of column names
     * and values to store for each column using current values of member 
     * variables. This Map can be used by utility methods defined in StoreUtils
     * to create INSERT and UPDATE SQL statements.
     *
     * <p>
     * Column names and values must be stored in Map as String. Values must be 
     * stored with any quotation marks around values included in String so
     * that they can be directly included in SQL created in utility class.
     *
     * @return Map of column names for table as String keys referencing
     * values for each column name.  
     */
    private Map getColumnValuesMap() {
	Map columnValues = new HashMap();

	columnValues.put( "url_id", get_url_id() );
	columnValues.put( "program_name", 
			  TextConverter.dbQuote( get_program_name() ) );

	columnValues.put( "description", 
			  TextConverter.dbQuote( get_description() ) );
	columnValues.put( "source", TextConverter.dbQuote( get_source() ) );
	columnValues.put( "author", TextConverter.dbQuote( get_author() ) );

	columnValues.put( "sw_function", 
			  TextConverter.dbQuote( get_sw_function() ) );
	columnValues.put( "version", TextConverter.dbQuote( get_version() ) );

	columnValues.put( "date_released", 
			  TextConverter.dbQuote( get_date_released(), "mm/dd/yyyy" ) );
	
	return columnValues;

    }

    /** 
     * Inserts a new row into AnalysisSoftware containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {


	String query = StoreUtils.createInsertStatement( "AnalysisSoftware", 
							 getColumnValuesMap() );
	
	// insert row and get newly created id
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    Long id = new Long( results.getLong( 1 ) );
	    set_analysis_software_id( id );
	}
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in AnalysisSoftware with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    StoreUtils.createUpdateStatement( "AnalysisSoftware", 
					      "analysis_software_id",
					      get_analysis_software_id(),
					      getColumnValuesMap() );

	conn.setQuery( query );	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"AnalysisSoftware UPDATE failed: no row found for " +
		"analysis software id: " + get_analysis_software_id();
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
	if ( get_program_name() == null ||
	     get_sw_function() == null ) {

	    String errMsg = 
		"Cannot store AnalysisSoftware with " +
		"program name: " + get_program_name() +
		" sw function: " + get_sw_function();

	    throw new InvalidActionException( errMsg );
	}

    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** AnlaysisSoftware content test ******" );
        System.out.println( "analysis_software_id: " + get_analysis_software_id() );
        System.out.println( "url: " + get_url_id() );
        System.out.println( "program_name: " + get_program_name() );
        System.out.println( "description: " + get_description() );
        System.out.println( "source: " + get_source() );
        System.out.println( "author: " + get_author() );
        System.out.println( "sw function: " + get_sw_function() );
        System.out.println( "version: " + get_version() );
        System.out.println( "date_released: " + get_date_released() );
        System.out.println( "**** AnlaysisSoftware content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long test_id = new Long( 1 );
            TfcAnalysisSoftware analysis_software = new TfcAnalysisSoftware( conn, test_id );
            analysis_software.test();

	    Long id = TfcAnalysisSoftware.retrieveAnalysisSoftwareID( conn,
								      "Microarray Suite",
								      null );

	    System.out.println( "\nfound id: " + id );

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
