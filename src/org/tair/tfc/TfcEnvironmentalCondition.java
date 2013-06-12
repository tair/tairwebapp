//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/11/18 01:16:34 $
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
 * This class maps to the EnvironmentalCondition table. Each instance 
 * represents one row of data; each member variable maps to a column of a row
 * in the table.
 */


public class TfcEnvironmentalCondition {   

    private Long environmental_condition_id;
    private String condition_name;
    private String condition_type;
    private String condition_description;
    private String condition_value;
    private String condition_duration;
    private String duration_units;
    private String application_frequency;

    /**
     * Creates an empty instance of TfcEnvironmentalCondition
     */
    public TfcEnvironmentalCondition() {  }

    /**
     * Creates an instance of TfcEnvironmentalCondition that reflects the
     * data referenced by submitted environmental_condition_id
     *
     * @param conn An active connection to the database
     * @param environmental_condition_id Environmental condition id to retrieve
     * data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcEnvironmentalCondition( DBconnection conn, 
				      Long environmental_condition_id ) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    getBaseQuery() + 
	    "WHERE environmental_condition_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( environmental_condition_id );

	ResultSet results = conn.getResultSet();
	boolean found = processResults( results );
	conn.releaseResources();
	

	if ( !found ) {
	    throw new RecordNotFoundException( "No environmental condition " +
					       "found for environmental " +
					       "condition id: " + 
					       environmental_condition_id );
	}
    }
  
  
    /**
     * Store results of query in member variables - return flag to notify 
     * caller whether query produced results or not
     *
     * @param results Result set from population query
     * @return <code>true</code> if result set contained one row of results,
     * <code>false</code> if no rows in result set
     * @throws SQLException if a database error occurs
     */
    private boolean processResults( ResultSet results ) throws SQLException {

	boolean found = results.next();

	if ( found ) {
	    set_environmental_condition_id( 
		new Long( results.getLong( "environmental_condition_id" ) ) );

	    set_condition_name( results.getString( "condition_name" ) );
	    set_condition_type( results.getString( "condition_type" ) );

	    set_condition_description( 
		results.getString( "condition_description" ) );

	    set_condition_value( results.getString( "condition_value" ) );
	    set_condition_duration( results.getString( "condition_duration" ) );
	    set_duration_units( results.getString( "duration_units" ) );

	    set_application_frequency( 
		results.getString( "application_frequency" ) );
	}

	return found;
    }     

    /**
     * Return basic select statement for populating environmental condition
     */
    private String getBaseQuery() {
	String query = 
	    "SELECT environmental_condition_id, " +
	    "condition_name, " +
	    "condition_type, " +
	    "condition_description, " +
	    "condition_value, " +
	    "condition_duration, " +
	    "duration_units, " +
	    "application_frequency " +
	    "FROM EnvironmentalCondition ";
	return query;
    }      

    //
    // Get 'em and set 'em
    //

    public void set_environmental_condition_id( Long id ) { 
	this.environmental_condition_id = id; 
    }

    public Long get_environmental_condition_id() { 
	return environmental_condition_id;
    }

    public void set_condition_name( String name ) { 
	this.condition_name = name; 
    }

    public String get_condition_name() { 
	return condition_name; 
    }

    public void set_condition_type( String type ) { 
	this.condition_type = type;
    }

    public String get_condition_type() {
	return condition_type;
    }

    public void set_condition_description( String description ) {
	this.condition_description = description;
    }

    public String get_condition_description() {
	return condition_description; 
    }

    public void set_condition_value( String condition_value ) { 
	this.condition_value = condition_value; 
    }

    public String get_condition_value() { 
	return condition_value; 
    }

    public void set_condition_duration( String condition_duration ) {
	this.condition_duration = condition_duration;
    }

    public String get_condition_duration() {
	return condition_duration; 
    }

    public void set_duration_units( String duration_units ) { 
	this.duration_units = duration_units; 
    }

    public String get_duration_units() { 
	return duration_units; 
    }
  
    public void set_application_frequency( String application_frequency ) {
	this.application_frequency = application_frequency;
    }

    public String get_application_frequency() { 
	return application_frequency;
    }
 
    /**
     * Checks database to see if condition record exists in the database
     * that matches the condition data in submitted object and returns found
     * condition id. This is useful for determining whether a new condition 
     * record should be inserted during data loading, or whether an existing
     * condition record can be used.
     *
     * <p>
     * All condition data except for description is considered identifying
     * data, meaning that a record in the database must match all values
     * in submitted record to be considered the same condition record.
     *
     * @param conn An active connection to the database
     * @param envCond Condition record to check the database for
     * @return Environmental condition id of record in the database that matches
     * data in submitted object, or <code>null</code> if no matching record
     * found.
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveID( DBconnection conn, 
				   TfcEnvironmentalCondition envCond )
	throws SQLException {

	Long id = null;

	// name and type should never be null
	String name = envCond.get_condition_name().toUpperCase();
	String type = envCond.get_condition_type().toUpperCase();

	// transform optional values to upper case or NULL using
	// safeUpper helper method
	String value = safeUpper( envCond.get_condition_value() );
	String duration = safeUpper( envCond.get_condition_duration() );
	String units = safeUpper( envCond.get_duration_units() );
	String freq = safeUpper( envCond.get_application_frequency() );
	
	String query = 
	    "SELECT environmental_condition_id " +
	    "FROM EnvironmentalCondition " +
	    "WHERE UPPER(condition_name) = " + 
	    TextConverter.dbQuote( name ) + " " +
	    "AND UPPER(condition_type) = " +
	    TextConverter.dbQuote( type ) + " " +
	    "AND UPPER(condition_value) = " + 
	    TextConverter.dbQuote( value ) + " " +
	    "AND UPPER(condition_duration) = " +
	    TextConverter.dbQuote( duration ) + " " +
	    "AND UPPER(duration_units) = " +
	    TextConverter.dbQuote( units ) + " " +
	    "AND UPPER(application_frequency) = " +
	    TextConverter.dbQuote( freq );
	
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();

	if ( results.next() ) {
	    id = new Long( results.getLong( "environmental_condition_id" ) );
	}
	conn.releaseResources();

	return id;
    }


    /**
     * Helper method to transform submitted value into uppercase version.  If
     * submitted value is NULL, NULL is returned. This method is used for easily
     * ucasing values without having to mess up code above with constant checks
     * for null before calling toUpperCase on submitted value
     *
     * @param value Value to uppercase
     * @return Uppercase of submitted value, or <code>null</code> if submitted
     * value is null
     */
    private static String safeUpper( String value ) {
	String uCase = null;

	if ( value != null ) {
	    uCase = value.toUpperCase();
	}

	return uCase;
    }


    /**
     * Stores environmental condition data to the database as an UPDATE or 
     * INSERT depending on whether environmental condition id is null or not
     * as well as if no existing record with matching condition values can
     * be found.
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

	
        if ( get_environmental_condition_id() == null  ) {
	    // check to see if another record already exists with these 
	    // condition values - use local static utility method
	    Long id = retrieveID( conn, this );
	    
	    // if id found, set it and skip insert, else add new record
	    if ( id != null ) {
		set_environmental_condition_id( id );
	    } else {
		insert( conn );
	    }

        } else {
            update( conn );
        }

    }



    /** 
     * Inserts a new row into EnvironmentalCondition containing contents of
     * object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	String query = 
	    StoreUtils.createInsertStatement( "EnvironmentalCondition", 
					      getColumnValuesMap() );
	
	// insert row and get newly created id
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    Long id = new Long( results.getLong( 1 ) );
	    set_environmental_condition_id( id );
	}
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in EnvironmentalCondition with contents 
     * of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    StoreUtils.createUpdateStatement( "EnvironmentalCondition", 
					      "environmental_condition_id",
					      get_environmental_condition_id(),
					      getColumnValuesMap() );
	
	conn.setQuery( query );	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"EnvironmentalCondition UPDATE failed: no row found for " +
		"environmental condition id: " + 
		get_environmental_condition_id();
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
	if ( get_condition_name() == null ||
	     get_condition_type() == null ) {
	    
	    String errMsg =
		"Cannot store EnvironmentalCondition with " +
		"condition name: " + get_condition_name() +
		" condition type: " + get_condition_type();

	    throw new InvalidActionException( errMsg );
	}
    }

    /**
     * Deletes environmental condition record.  This method assumes that 
     * environmental condition record does not have any other associations
     * to bio samples, since deleting env. condition record will cause a 
     * database error if any join rows still exist.
     *
     * @param conn Database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn )throws SQLException {
	String query = 
	    "DELETE EnvironmentalCondition " +
	    "WHERE environmental_condition_id = ?";
	conn.setQuery( query );
	conn.setQueryVariable( get_environmental_condition_id() );
	conn.executeUpdate();
	conn.releaseResources();
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

	columnValues.put( "condition_name", 
			  TextConverter.dbQuote( get_condition_name() ) );
	
	columnValues.put( "condition_type", 
			  TextConverter.dbQuote( get_condition_type() ) );
	
	columnValues.put( "condition_description", 
			  TextConverter.dbQuote( 
			      get_condition_description() ) );
	
	columnValues.put( "condition_value", 
			  TextConverter.dbQuote( get_condition_value() ) );
	
	columnValues.put( "condition_duration", 
			  TextConverter.dbQuote( get_condition_duration() ) );
	
	columnValues.put( "duration_units", 
			  TextConverter.dbQuote( get_duration_units() ) );
	
	columnValues.put( "application_frequency", 
			  TextConverter.dbQuote( 
			      get_application_frequency() ) );
	
	return columnValues;

    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "** TfcEnvironmentalCondition content test **" );
	System.out.println( "environmental_condition_id: " + 
			    get_environmental_condition_id() );
	
	System.out.println( "condition_name: " + get_condition_name() );
	System.out.println( "condition_type: " + get_condition_type() );

	System.out.println( "condition_description: " + 
			    get_condition_description() );

	System.out.println( "condition_value: " + get_condition_value() );
	System.out.println( "condition_duration: " + get_condition_duration() );
	System.out.println( "duration_units: " + get_duration_units() );

	System.out.println( "application_frequency: " + 
			    get_application_frequency() );

	System.out.println( "** TfcEnvironmentalCondition content test end **" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 4 );
	    TfcEnvironmentalCondition ec = new TfcEnvironmentalCondition( conn, id );
	    ec.test();
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }  
}
