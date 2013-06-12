//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2005/02/10 20:28:05 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;




/**
 * This class maps to the ExpressionSet table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the 
 * table.
 */


public class TfcExpressionSet extends TfcTairObject {   

    private Long expression_set_id;
    private String name;
    private String submission_number;
    private String description;
    private java.util.Date exp_date;
    private Boolean is_published;
    private Boolean is_series;
    private String series_type;
    private Boolean plant_material_is_variable;
    private Boolean probe_type_is_variable;
    private Boolean harvesting_is_variable;
    private Boolean environment_is_variable;
    private String status;
    private java.util.Date date_last_modified;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcExpressionSet
     */
    public TfcExpressionSet() {  
	super();
    }

    /**
     * Creates an instance of TfcExpressionSet that reflects the data 
     * referenced by the submitted tair_object_id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @exception SQLException thrown if a database error occurs or if no row
     * found with submitted tair_object_id
     */
    public TfcExpressionSet( DBconnection conn, Long tair_object_id ) 
	throws SQLException {

	super( conn, tair_object_id );
    }

    /**
     * Implements abstract method in superclass to return "ExpressionSet"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "ExpressionSet";
    }

    /**
     * Implements abstract method in superclass to return "tair_object_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "tair_object_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all ExpressionSet specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of all ExpressionSet specific columns to include
     * in SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "expression_set_id", 
	    "name",
	    "description",
	    "exp_date",
	    "status",
	    "submission_number",
	    "is_published",
	    "date_last_modified",
	    "series_type",
	    "is_series",
	    "plant_material_is_variable",
	    "probe_type_is_variable",
	    "harvesting_is_variable",
	    "environment_is_variable",
	    "date_entered",
	    "original_name",
	    "is_obsolete "
	};	    

	return localClassColumns;
    }

    /**
     * Retrieves ExpressionSet specific data from result set and store
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_expression_set_id( 
	    new Long( results.getLong( "expression_set_id" ) ) );

	set_name( results.getString( "name" ) );
	set_description( results.getString( "description" ) );
	set_exp_date( results.getDate( "exp_date" ) );
	set_status( results.getString( "status" ) );
	set_submission_number( results.getString( "submission_number" ) );

	set_is_published( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_published" ) ) );

	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_series_type( results.getString( "series_type" ) );

	set_is_series( 
	    TextConverter.stringToBoolean( results.getString( "is_series" ) ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );

	set_plant_material_is_variable( 
	    TextConverter.stringToBoolean( 
		results.getString( "plant_material_is_variable" ) ) );

	set_probe_type_is_variable( 
	    TextConverter.stringToBoolean( 
		results.getString( "probe_type_is_variable" ) ) );

	set_harvesting_is_variable( 
	    TextConverter.stringToBoolean( 
		results.getString( "harvesting_is_variable" ) ) );

	set_environment_is_variable( 
	    TextConverter.stringToBoolean( 
		results.getString( "environment_is_variable" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }
   
  
    /**
     * Retrieves tair_object_id for submitted expression set name
     *
     * @param conn An active connection to the database
     * @param name Expression set name to retrieve tair object id for
     * @exception SQLException thrown if a database error occurs
     */
    public static Long nameToTairObjectID( DBconnection conn, String name ) 
	throws SQLException {

	Long id = null;
	ResultSet results = null;
	String query = null;

	if ( name != null ) {
	    query = 
		"SELECT tair_object_id " +
		"FROM ExpressionSet " +
		"WHERE name = " +
		TextConverter.dbQuote( name.toUpperCase() );

	    conn.setQuery( query );

	    results = conn.getResultSet();
	    if ( results.next() ) {
		id = new Long( results.getLong( "tair_object_id" ) );
	    }
	    conn.releaseResources();
	}

	return id;
    }

    /**
     * Utility method to retrieve description for expression set with
     * submitted tair object id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id of expression set to retrieve
     * data for
     * @return Description for tair_object_id, or <code>null</code> if no
     * row found for tair_object_id
     * @throws SQLException if a database error occurs
     */
    public static String retrieveDescription( DBconnection conn, 
					      Long tair_object_id )
        throws SQLException {

        String description = null;

        String query = 
            "SELECT description " +
            "FROM ExpressionSet " +
            "WHERE tair_object_id = ?";
        conn.setQuery( query );
        conn.setQueryVariable( tair_object_id );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            description = results.getString( "description" );
        }
        return description;
    }

     /**
     * To retrieve manufacturer for expression set with
     * submitted tair object id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id of expression set to retrieve
     * data for
     * @return Manufacturer for tair_object_id, or <code>null</code> if no
     * manufacturer found for this ExpressionSet 
     * @throws SQLException if a database error occurs
     */
    public static String retrieveManufacturer( DBconnection conn, 
					      Long tair_object_id )
        throws SQLException {

	// one expressionset has only one manufacturer as indicated by Marga, and since this 
        // infor is important for an expressionSet, I added it here. 

        String manufacturer = null;

        String query = 
            "SELECT manufacturer " +
            "FROM ArrayDesign ad, HybDescription hd, ExpressionSet es  " +
            "WHERE ad.array_design_id = hd.array_design_id " + 
            "AND hd.expression_set_id = es.expression_set_id " + 
            "AND es.tair_object_id =? ";
        conn.setQuery( query );
        conn.setQueryVariable( tair_object_id );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            manufacturer = results.getString( "manufacturer" );
        }
        return manufacturer;
    }



    public void set_expression_set_id( Long id ) { 
	this.expression_set_id = id;  
    }

    public Long get_expression_set_id() {
	return expression_set_id; 
    }

    public void set_name( String name ) { 
	this.name = name; 
    }

    public String get_name() { 
	return name;
    }

    public void set_description( String descr ) { 
	this.description = descr; 
    }

    public String get_description() { 
	return description; 
    }

    public void set_exp_date( java.util.Date exp_date ) { 
	this.exp_date = exp_date; 
    }

    public java.util.Date get_exp_date() { 
	return exp_date; 
    }

    public void set_status( String status ) { 
	this.status = status; 
    }

    public String get_status() { 
	return status; 
    }

    public void set_submission_number( String number ) { 
	this.submission_number = number; 
    }

    public String get_submission_number() { 
	return submission_number; 
    }

    public void set_is_published( Boolean is_published ) { 
	this.is_published = is_published; 
    }

    public Boolean get_is_published() {
	return is_published; 
    }

    public void set_date_last_modified( java.util.Date last_modified ) { 
	this.date_last_modified = last_modified; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_series_type( String type ) { 
	this.series_type = type; 
    }
    
    public String get_series_type() {
	return series_type; 
    }

    public void set_is_series( Boolean is_series ) { 
	this.is_series = is_series; 
    }

    public Boolean get_is_series() {
	return is_series; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
	this.is_obsolete = is_obsolete; 
    }

    public Boolean get_is_obsolete() { 
	return is_obsolete; 
    }

    public void set_plant_material_is_variable( Boolean is_variable ) { 
	this.plant_material_is_variable = is_variable; 
    }

    public Boolean get_plant_material_is_variable() { 
	return plant_material_is_variable; 
    }

    public void set_probe_type_is_variable( Boolean is_variable ) { 
	this.probe_type_is_variable = is_variable; 
    }

    public Boolean get_probe_type_is_variable() { 
	return probe_type_is_variable; 
    }

    public void set_harvesting_is_variable( Boolean is_variable ) { 
	this.harvesting_is_variable = is_variable; 
    }

    public Boolean get_harvesting_is_variable() {
	return harvesting_is_variable; 
    }

    public void set_environment_is_variable( Boolean is_variable ) { 
	this.environment_is_variable = is_variable; 
    }

    public Boolean get_environment_is_variable() { 
	return environment_is_variable; 
    }

    public void set_original_name ( String name ) { 
	this.original_name = name; 
    }

    public String get_original_name() { 
	return original_name; 
    }

    public void set_date_entered ( java.util.Date date ) { 
	this.date_entered = date;
    }

    public java.util.Date get_date_entered() { 
	return date_entered; 
    }

    /**
     * Determines if an expression set exists with submitted
     * submission number. This is helpful for ensuring that new experiments
     * are loaded with a unique number.
     *
     * @param conn An active connection to the database
     * @param number Submission number to look for
     * @return <code>true</code> if an experiment with submission number exists,
     * <code>false</code> if no experiment found with submission number
     * @throws SQLException if a database error occurs
     */
    public static boolean submissionNumberExists( DBconnection conn, 
						  String number )
	throws SQLException {

	boolean exists = false;

	String query = 
	    "SELECT expression_set_id " +
	    "FROM ExpressionSet " +
	    "WHERE submission_number = " +
	    TextConverter.dbQuote( number );

	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	
	if ( results.next() ) {
	    exists = true;
	}
	conn.releaseResources();

	return exists;
    }



    /**
     * Stores contents of expression set to the database as an INSERT or UPDATE 
     * depending on whether expression_set_id primary key is NULL or not.
     * 
     * <p>
     * Since storing TfcExpressionSet data results in storage to the TairObject
     * table through TfcTairObject super class, this method should be called as
     * part of an explicit database transaction to properly handle committing or 
     * rolling back of transaction in case of errors
     *
     * @param conn An active connection to the database
     * @throws RecordNotFoundException if no row found for tair object id when
     * updating.
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if no tair object id has been set for
     * object when trying to UPDATE, or if required data for expression set
     * has not be set before storing
     */
    public void store( DBconnection conn ) 
        throws RecordNotFoundException, SQLException, InvalidActionException {

	// ensure required values have been set
	validate();

	// store TairObject values before ExpressionSet to ensure 
	// a tair_object_id is created for new entries
	super.store( conn );

	// if primary key null, do an insert and save newly 
	// created expression set id in member variable
        if ( get_expression_set_id() == null ) {
	    insert( conn );
	    
	    // else do update
	} else {
	    update( conn );
	}	    
	
    }
   /**
     * Deletes a ExpressionSet entry. Any data associated with this entry, including
     * all accompanying tair object meta data and HybDescription data, must have
     * already been deleted or a database error will occur
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete ( DBconnection conn )  throws  SQLException{
        if ( get_expression_set_id() != null  ){
	    String query = "DELETE ExpressionSet WHERE expression_set_id = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( get_expression_set_id() );
	    conn.executeUpdate();
	    conn.releaseResources();
        }
        super.delete( conn );
    }

    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any data required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {

	// require status and submission number as minimum
	String err = null;
	if ( get_status() == null ) {
	    throw new InvalidActionException( "Cannot store ExpressionSet " +
					      "with NULL status" );
	}

	if ( get_submission_number() == null ) {
	    throw new InvalidActionException( "Cannot store ExpressionSet " +
					      "with NULL submission number" );
	}

    }


    /** 
     * Inserts a new row into ExpressionSet containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	// Get map of ExpressionSet specific column names and values to store
	Map localValues = getLocalValuesMap();

	// use utility method in superclass to create INSERT 
	// statement using columnValues map. INSERT will automatically
	// include tair_object_id as well as a SELECT to get
	// newly created expression_set_id.
	String insertQuery = createChildTableInsert( localValues, "EXPRESSION_SET_ID", "EXPRESSIONSET_SEQ" );
	conn.setInsertQuery( insertQuery, "EXPRESSION_SET_ID" );
	Long id = conn.executeInsert();
	set_expression_set_id( id );
	conn.releaseResources();
	}

    /** 
     * Updates an existing row in ExpressionSet with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn ) 
	throws RecordNotFoundException, SQLException {

	// set now as date last modified for update
	set_date_last_modified( new java.util.Date() );
	
	// Get map of ExpressionSet specific column names and values to store
	Map localValues = getLocalValuesMap();
	
	// use utility method in superclass to create UPDATE
	// statement using columnValues map -- UPDATE will always
	// be done using tair_object_id as primary key column in
	// WHERE clause
	String updateQuery = createChildTableUpdate( localValues );
	conn.setQuery( updateQuery );
	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();
	if ( rowsAffected <= 0 ) { 
	    throw new RecordNotFoundException( "Update on ExpressionSet " + 
					       "failed: No row found " +
					       "for tair object id: " + 
					       get_tair_object_id() );
	}
	
    }

    /**
     * Retrieves values to store for an ExpressionSet as a Map of column names
     * and values to store for each column using current values of member 
     * variables. This Map is used by utility methods defined in superclass
     * that create INSERT and UPDATE SQL statements
     *
     * <p>
     * Column names and values must be stored in Map as String. Values must be 
     * stored with any quotation marks around values included in String so
     * that they can be directly included in SQL created in super class
     * 
     * @return Map of column names for table as String keys referencing
     * values for each column name.  
     */
    private Map getLocalValuesMap() {
	Map localValues = new HashMap();

	localValues.put( "name", TextConverter.dbQuote( get_name() ) );

	localValues.put( "description", 
			 TextConverter.dbQuote( get_description() ) );

	localValues.put( "exp_date", TextConverter.dbQuote( get_exp_date(), "mm/dd/yyyy") );
	localValues.put( "status", TextConverter.dbQuote( get_status() ) ); 

	localValues.put( "submission_number", 
			 TextConverter.dbQuote( get_submission_number() ) );

	localValues.put( "is_published",
			 TextConverter.dbQuote( get_is_published() ) );

	localValues.put( "series_type", 
			 TextConverter.dbQuote( get_series_type() ) );

	localValues.put( "is_series", 
			 TextConverter.dbQuote( get_is_series() ) );

	localValues.put( "plant_material_is_variable", 
			 TextConverter.dbQuote( 
			     get_plant_material_is_variable() ) );
	
	localValues.put( "probe_type_is_variable", 
			 TextConverter.dbQuote( 
			     get_probe_type_is_variable() ) );
	
	localValues.put( "harvesting_is_variable", 
			 TextConverter.dbQuote( 
			     get_harvesting_is_variable() ) );
	
	localValues.put( "environment_is_variable", 
			 TextConverter.dbQuote( 
			     get_environment_is_variable() ) ); 
	
	localValues.put( "date_last_modified",  
			 TextConverter.dbQuote( 
			     get_date_last_modified(), "mm/dd/yyyy" ) );

	localValues.put( "is_obsolete", 
			 TextConverter.dbQuote( get_is_obsolete() ) );
	
	localValues.put( "date_entered",
			 TextConverter.dbQuote( get_date_entered(), "mm/dd/yyyy" ) );
	
	localValues.put( "original_name",
			 TextConverter.dbQuote( get_original_name() ) );

	return localValues;
	
    }



    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** TfcExpressionSet content test ******" );
	System.out.println( "expression_set_id: " + get_expression_set_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "description: " + get_description() );
	System.out.println( "exp_date: " + get_exp_date() );
	System.out.println( "status: " + get_status() );    
	System.out.println( "submission_number: " + get_submission_number() );
	System.out.println( "is_published: " + get_is_published() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "series_type: " + get_series_type() );  
	System.out.println( "is_series: " + get_is_series() );      

	System.out.println( "plant_material_is_variable: " + 
			    get_plant_material_is_variable() );

	System.out.println( "probe_type_is_variable: " + 
			    get_probe_type_is_variable() );

	System.out.println( "harvesting_is_variable: " + 
			    get_harvesting_is_variable() );

	System.out.println( "environment_is_variable: " + 
			    get_environment_is_variable() );

	System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcExpressionSet content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1005823506 );
	    TfcExpressionSet expr = new TfcExpressionSet( conn, id );
	    expr.test();
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }  
}
