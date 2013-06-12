//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.17 $
// $Date: 2005/02/10 20:28:06 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the HybData table. Each instance represents
 * one row of data; each member variable maps to a column of a row 
 * in the table.
 */
public class TfcHybData extends TfcTairObject {   


    private Long hyb_data_id;
    private Long hyb_description_id;
    private Long expression_set_id;
    private String name;
    private String GEO_accession;
    private Float normalization_factor;
    private String normal_function;
    private Float scaling_factor;
    private String scan_parameters;
    private Boolean is_tech_replicate;
    private Boolean is_bio_replicate;
    private String experiment_id;
    private BigInteger experimenter_id;
    private String slide_description;
    private Float anova_sector_user;
    private Float anova_plate_user;
    private Float anova_sector_tair;
    private Float anova_plate_tair; 
    private String cel_name;
    private String dat_name;
    private String txt_file_name;
    private String original_name;
    private java.util.Date date_entered;
    private java.util.Date date_last_modified;

    /**
     * Creates an empty instance of TfcHybData
     */
    public TfcHybData() { 
        super();
    }

    /**
     * Creates an instance of TfcHybData that contains all data
     * for the hyb data with the submitted tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @throws SQLException thrown if a database error occurs, or
     * if no row found for submitted tair_object_id
     */
    public TfcHybData( DBconnection conn, Long tair_object_id ) 
	throws SQLException {

        super( conn, tair_object_id );   
    }

    /**
     * Implements abstract method in superclass to return "HybData"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "HybData";
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
     * all HybData specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all HybData specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "hyb_data_id",
	    "hyb_description_id",
	    "expression_set_id",
	    "name",
	    "is_tech_replicate",
	    "is_bio_replicate",
	    "GEO_accession",
	    "normalization_factor",
	    "normal_function",
	    "scan_parameters",
	    "scaling_factor",
	    "experiment_id",
	    "experimenter_id",
	    "slide_description",
	    "anova_sector_user",
	    "anova_plate_user",
	    "anova_sector_tair",
	    "cel_name",
	    "dat_name",
	    "txt_file_name",
	    "date_entered",
	    "date_last_modified",
	    "original_name",
	    "anova_plate_tair"
	};	    
	
	return localClassColumns;
    }

    /**
     * Retrieves HybData specific data from result set and stores
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_hyb_description_id(
	    new Long( results.getLong( "hyb_description_id" ) ) );


	set_hyb_data_id( new Long( results.getLong( "hyb_data_id" ) ) );

	set_expression_set_id( 
	    new Long( results.getLong( "expression_set_id" ) ) );

	set_name( results.getString( "name" ) );

	set_is_tech_replicate( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_tech_replicate" ) ) );

	set_is_bio_replicate( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_bio_replicate" ) ) );

	set_GEO_accession( results.getString( "GEO_accession" ) );

	float f = results.getFloat( "normalization_factor" );
	if ( !results.wasNull() ) {
	    set_normalization_factor( new Float( f ) );
	}
	
	set_normal_function( results.getString( "normal_function" ) );
	set_scan_parameters( results.getString( "scan_parameters" ) );
	
	f = results.getFloat( "scaling_factor" );
	if ( !results.wasNull() ) {
	    set_scaling_factor( new Float( f ) );
	}
	
	f = results.getFloat( "anova_sector_user" );
	if ( !results.wasNull() ) {
	    set_anova_sector_user( new Float( f ) );
	}
	
	f = results.getFloat( "anova_plate_user" );
	if ( !results.wasNull() ) {
	    set_anova_plate_user( new Float( f ) );
	}
	
	f = results.getFloat( "anova_sector_tair" );
	if ( !results.wasNull() ) {
	    set_anova_sector_tair( new Float( f ) );
	}
	
	f = results.getFloat( "anova_plate_tair" );
	if ( !results.wasNull() ) {
	    set_anova_plate_user( new Float( f ) );
	}
	
	set_experiment_id( results.getString( "experiment_id" ) );

	BigDecimal id = results.getBigDecimal( "experimenter_id" );
	if ( !results.wasNull() ) {
	    set_experimenter_id(id.toBigInteger());
	}
	
	set_slide_description( results.getString( "slide_description" ) );
	set_cel_name( results.getString( "cel_name" ) );
	set_dat_name( results.getString( "dat_name" ) );
	set_txt_file_name( results.getString( "txt_file_name" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
	set_date_last_modified( results.getDate( "date_last_modified" ) );
    }

    public void set_hyb_description_id( Long value ) { 
        hyb_description_id = value; 
    }

    public Long get_hyb_description_id() { 
        return hyb_description_id; 
    }
  
    public void set_hyb_data_id( Long value ) { 
        hyb_data_id = value; 
    }

    public Long get_hyb_data_id() { 
        return hyb_data_id; 
    }
  
    public void set_expression_set_id( Long id ) {
	this.expression_set_id = id;
    }

    public Long get_expression_set_id() {
	return expression_set_id;
    }
  
    public void set_name( String value ) { 
        name = value; 
    }

    public String get_name() { 
        return name; 
    }

    public void set_is_tech_replicate( Boolean value ) { 
        is_tech_replicate = value; 
    }

    public Boolean get_is_tech_replicate() { 
        return is_tech_replicate; 
    }

    public void set_is_bio_replicate( Boolean value ) { 
        is_bio_replicate = value; 
    }

    public Boolean get_is_bio_replicate() { 
        return is_bio_replicate; 
    }

    public void set_GEO_accession( String value ) { 
        GEO_accession = value; 
    }

    public String get_GEO_accession() { 
        return GEO_accession; 
    }

    public void set_normalization_factor( Float value ) { 
        normalization_factor = value; 
    }

    public Float get_normalization_factor() { 
        return normalization_factor; 
    }

    public void set_normal_function( String value ) { 
        normal_function = value; 
    }

    public String get_normal_function() { 
        return normal_function; 
    }
 
    public void set_scan_parameters( String value ) { 
        scan_parameters = value; 
    }

    public String get_scan_parameters() { 
        return scan_parameters; 
    }

    public void set_scaling_factor( Float value ) { 
        scaling_factor = value; 
    }

    public Float get_scaling_factor() { 
        return scaling_factor;
    }

    public void set_experiment_id( String id ) {
        this.experiment_id = id;
    }

    public String get_experiment_id() {
        return experiment_id;
    }

    public void set_experimenter_id( BigInteger id ) {
        this.experimenter_id = id;
    }

    public BigInteger get_experimenter_id() {
        return experimenter_id;
    }

    public void set_slide_description( String slide_description ) {
        this.slide_description = slide_description;
    }

    public String get_slide_description() {
        return slide_description;
    }
  
    public void  set_anova_sector_user( Float f ) {
	this.anova_sector_user = f;
    }
     
    public Float get_anova_sector_user() {
	return anova_sector_user;
    }

    public void  set_anova_plate_user( Float f ) {
	this.anova_plate_user = f;
    }
     
    public Float get_anova_plate_user() {
	return anova_plate_user;
    }        

    public void  set_anova_sector_tair( Float f ) {
	this.anova_sector_tair = f;
    }
     
    public Float get_anova_sector_tair() {
	return anova_sector_tair;
    }

    public void  set_anova_plate_tair( Float f ) {
	this.anova_plate_tair= f;
    }
     
    public Float get_anova_plate_tair() {
	return anova_plate_tair;
    } 

    public void set_txt_file_name( String name ) {
	this.txt_file_name = name;
    }
	
    public String get_txt_file_name() {
	return txt_file_name;
    }

    public void set_cel_name( String cel_name ) {
	this.cel_name = cel_name;
    }
	
    public String get_cel_name() {
	return cel_name;
    }

    public void set_dat_name( String dat_name ) {
	this.dat_name = dat_name;
    }

    public String get_dat_name() {
	return dat_name;
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
       
    public void set_date_last_modified( java.util.Date date ) { 
	this.date_last_modified = date;
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }



    /**
     * Stores contents of hyb data object to the database as an INSERT or UPDATE 
     * depending on whether hyb_data_id primary key is NULL or not.
     * 
     * <p>
     * Since storing TfcHybData data results in storage to the TairObject
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
	validate( conn );

	// store TairObject values before HybData to ensure 
	// a tair_object_id is created for new entries
	super.store( conn );

	// if primary key null, do an insert and save newly 
	// created hyb data id in member variable
	if ( get_hyb_data_id() == null ) {
	    insert( conn );
	    
	    // else do update
	} else {
	    update( conn );
	}	    
        
    }
    
    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set and the hybdata.name doesn't exist  
     *
     * @throws InvalidActionException if any data required for storing to db
     * have not been set
     */
    private void validate( DBconnection conn ) throws InvalidActionException, SQLException  {

	// require hyb description, expression set and name at minimum
	if ( get_hyb_description_id() == null ) {
	    throw new InvalidActionException( "Cannot store HybData with " +
					      "NULL hyb description id" );
	} else if ( get_name() == null ) {
	    throw new InvalidActionException( "Cannot store HybData with " +
					      "NULL name" );
	} else if ( get_expression_set_id() == null ) {
	    throw new InvalidActionException( "Cannot store HybData with " +
					      "NULL expression set id" );
	}
	    
	// ensure name/expression set id combo. does not conflict with
	// existing row
	Long id = getHybDataIdFromName ( conn );
	if ( id != null && id.longValue() >= 1 ) {
	    throw new InvalidActionException( "Cannot store HybData with " +
					      "same name " + get_name() + 
					      " as Hybdata id: " + id );
        }
    }
    
    /** 
     * Inserts a new row into HybData containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
private void insert( DBconnection conn ) throws SQLException {

	// Get map of HybData specific column names and values to store
	Map columnValues = getColumnValuesMap();

	// use utility method in superclass to create INSERT 
	// statement using columnValues map. INSERT will automatically
	// include tair_object_id as well as a SELECT to get
	// newly created hyb_data_id.
	String insertQuery = createChildTableInsert( columnValues, "HYB_DATA_ID", "HYBDATA_SEQ" );
	conn.setInsertQuery( insertQuery, "HYB_DATA_ID" );
	Long id = conn.executeInsert();
	set_hyb_data_id( id );
	conn.releaseResources();
	}
    
    /** 
     * Updates an existing row in HybData with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn ) 
	throws RecordNotFoundException, SQLException {

	// set now as date last modified for update
	set_date_last_modified( new java.util.Date() );
	
	// Get map of HybData specific column names and values to store
	Map columnValues = getColumnValuesMap();
	
	// use utility method in superclass to create UPDATE
	// statement using columnValues map -- UPDATE will always
	// be done using tair_object_id as primary key column in
	// WHERE clause
	String updateQuery = createChildTableUpdate( columnValues );
	conn.setQuery( updateQuery );
	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	if ( rowsAffected <= 0 ) { 
	    throw new RecordNotFoundException( "Update on HybData " + 
					       "failed: No row found " +
					       "for tair object id: " + 
					       get_tair_object_id() );
	}
    }


    /**
     * Retrieves values to store for a HybData as a Map of column names
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
    private Map getColumnValuesMap() {
	Map columnValues = new HashMap();

	columnValues.put( "hyb_description_id", 
			  TextConverter.dbQuote( get_hyb_description_id() ) );

	columnValues.put( "expression_set_id",
			  TextConverter.dbQuote( get_expression_set_id() ) );
	
	columnValues.put( "name", TextConverter.dbQuote( get_name() ) );
	columnValues.put( "GEO_accession", 
			  TextConverter.dbQuote( get_GEO_accession() ) );
	
	columnValues.put( "normalization_factor", 
			  TextConverter.dbQuote( get_normalization_factor() ) );
	
	columnValues.put( "normal_function", 
			  TextConverter.dbQuote( get_normal_function() ) );
	
	
	columnValues.put( "scaling_factor", 
			  TextConverter.dbQuote( get_scaling_factor() ) );
	
	columnValues.put( "scan_parameters", 
			  TextConverter.dbQuote( get_scan_parameters() ) );
	
	columnValues.put( "is_tech_replicate", 
			  TextConverter.dbQuote( get_is_tech_replicate() ) );
	
	columnValues.put( "is_bio_replicate", 
			  TextConverter.dbQuote( get_is_bio_replicate() ) );
	
	columnValues.put( "experiment_id", 
			  TextConverter.dbQuote( get_experiment_id() ) );
	
	columnValues.put( "experimenter_id", 
			  TextConverter.dbQuote( get_experimenter_id() ) );
	
	columnValues.put( "slide_description", 
			  TextConverter.dbQuote( get_slide_description() ) );

	columnValues.put( "anova_sector_user", 
			  TextConverter.dbQuote( get_anova_sector_user() ) );
	
	columnValues.put( "anova_plate_user", 
			  TextConverter.dbQuote( get_anova_plate_user() ) );
	
	columnValues.put( "anova_sector_tair", 
			  TextConverter.dbQuote( get_anova_sector_tair() ) );
	
	columnValues.put( "anova_plate_tair", 
			  TextConverter.dbQuote( get_anova_plate_tair() ) );
	
	columnValues.put( "cel_name", 
			  TextConverter.dbQuote( get_cel_name() ) );
	
	columnValues.put( "dat_name", 
			  TextConverter.dbQuote( get_dat_name() ) );

	columnValues.put( "txt_file_name", 
			  TextConverter.dbQuote( get_txt_file_name() ) );
	
	columnValues.put( "original_name", 
			  TextConverter.dbQuote( get_original_name() ) );

	columnValues.put( "date_entered", 
			  TextConverter.dbQuote( get_date_entered(), "mm/dd/yyyy" ) );

	columnValues.put( "date_last_modified",  
			  TextConverter.dbQuote( 
			      get_date_last_modified(), "mm/dd/yyyy" ) );

	columnValues.put( "date_entered",
			  TextConverter.dbQuote( get_date_entered(), "mm/dd/yyyy") );
	
	columnValues.put( "original_name",
			  TextConverter.dbQuote( get_original_name() ) );

	return columnValues;
	
    }


    /**
     * Deletes a HybData entry. Any data associated with this entry, including
     * all accompanying tair object meta data and AffyMetrics data, must have
     * already been deleted or a database error will occur
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException{
        if ( get_hyb_data_id() != null ){
	    String query = "DELETE HybData WHERE hyb_data_id = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( get_hyb_data_id() );
	    conn.executeUpdate();
	    conn.releaseResources();
	}
	super.delete( conn );
    }

    // get HybData id from name/expression set id combination
    private Long getHybDataIdFromName( DBconnection conn ) 
	throws SQLException {

        Long id = null;

	String query =
	    "SELECT hyb_data_id " +
	    "FROM HybData " +
	    "WHERE name =  " + TextConverter.dbQuote( get_name() ) + " " +
	    " AND expression_set_id = " + get_expression_set_id();

	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    id = new Long( results.getLong( "hyb_data_id" ) );
	}
	conn.releaseResources();

	return id;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();

        System.out.println( "****** TfcHybData content test ******" );
        System.out.println( "hyb_data_id: " + get_hyb_data_id() );
        System.out.println( "hyb_description_id: " + get_hyb_description_id() );
	System.out.println( "expression set id: " + get_expression_set_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "is_tech_replicate: " + get_is_tech_replicate() );
        System.out.println( "is_bio_replicate: " + get_is_bio_replicate() );
        System.out.println( "GEO_accession: " + get_GEO_accession() );
        System.out.println( "normalization_factor: " + get_normalization_factor() );
        System.out.println( "normal_function: " + get_normal_function() );
        System.out.println( "scan_parameters: " + get_scan_parameters() );  
        System.out.println( "scaling_factor: " + get_scaling_factor() );    
        System.out.println( "experiment id: " + get_experiment_id() );
        System.out.println( "experimenter_id: " + get_experimenter_id() );
        System.out.println( "slide description: " + get_slide_description() );
	System.out.println( "anova_sector_user: " + get_anova_sector_user() );
	System.out.println( "anova_plate_user: " + get_anova_plate_user() );
	System.out.println( "anova_sector_tair: " + get_anova_sector_tair() );
	System.out.println( "anova_plate_tair: " + get_anova_plate_user() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "**** TfcHybData content test end ****" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 1005823610 );
            TfcHybData hd = new TfcHybData( conn, id );
            hd.test();

        } catch (Exception e ) {
            e.printStackTrace();
        }

    }  

}
