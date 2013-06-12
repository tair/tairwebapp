//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
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
 * This class maps to the BioSample table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the 
 * table.
 */

public class TfcBioSample {   

    private Long bio_sample_id;
    private Long expression_set_id; 
    private Long taxon_id;
    private Long germplasm_id;
    private Long extraction_protocol_ref_id;
    private String name;
    private String biomaterial_type;
    private String biomaterial_description;
    private Boolean biomaterial_is_exp_variable;
    private String treatment_description;
    private String growth_description;
    private String harvest_description;
    private String probe_type;
    private Boolean is_control;
    private Boolean polyA_test;
    private String measurement;
    private String anatomy_description;
    private String development_description;

    /**
     * Creates an empty instance of TfcBioSample
     */
    public TfcBioSample() {  }

    /**
     * Creates an instance of TfcBioSample that reflects the data referenced
     * by submitted bio_sample_id
     *
     * @param conn An active connection to the database
     * @param bio_sample_id Bio sample id to retrieve data for
     * @throws RecordNotFoundException if no row found for bio_sample_id
     * @throws SQLException if a database error occurs
     */
    public TfcBioSample( DBconnection conn, Long bio_sample_id ) 
	throws RecordNotFoundException, SQLException {

	String query =
	    getBaseQuery() + 
	    "WHERE bio_sample_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( bio_sample_id );
	
	ResultSet results = conn.getResultSet();
	boolean found = processResults( results );
	conn.releaseResources();
    
	if ( !found ) {
	    throw new RecordNotFoundException( "No bio sample found " +
					       "for bio_sample_id: " + 
					       bio_sample_id );
	}

    }

    /**
     * Store results of query in member variables - return flag to notify 
     * caller whether query produced results or not
     */
    private boolean processResults( ResultSet results ) throws SQLException {
	boolean found = results.next();

	if ( found ) {
	    set_bio_sample_id( new Long( results.getLong( "bio_sample_id" ) ) );

	    set_expression_set_id( 
		new Long( results.getLong( "expression_set_id" ) ) );

	    long id = results.getLong( "taxon_id" );
	    if ( !results.wasNull() ) {
		set_taxon_id( new Long( id ) );
	    }

	    id = results.getLong( "germplasm_id" );
	    if ( !results.wasNull() ) {
		set_germplasm_id( new Long( id ) );
	    }

	    id = results.getLong( "extraction_protocol_ref_id" );
	    if ( !results.wasNull() ) {
		set_extraction_protocol_ref_id( new Long( id ) );
	    }

	    set_name( results.getString( "name" ) );
	    set_biomaterial_type( results.getString( "biomaterial_type" ) );

	    set_biomaterial_description( 
		results.getString( "biomaterial_description" ) );


	    set_biomaterial_is_exp_variable( 
		TextConverter.stringToBoolean( 
		    results.getString( "biomaterial_is_exp_variable" ) ) );

	    set_treatment_description( 
		results.getString( "treatment_description" ) );

	    set_growth_description( results.getString( "growth_description" ) );

	    set_harvest_description( 
		results.getString( "harvest_description" ) );

	    set_probe_type( results.getString( "probe_type" ) );

	    set_is_control( TextConverter.stringToBoolean( 
		results.getString( "is_control" ) ) );

	    set_polyA_test( TextConverter.stringToBoolean( 
		results.getString( "polyA_test" ) ) );

	    set_measurement( results.getString( "measurement" ) );

	    set_anatomy_description( 
		results.getString( "anatomy_description" ) );

	    set_development_description(
	        results.getString( "development_description" ) );
	}
    
	return found;
    }
        

    /**
     * Return basic select statement for populating bio samples
     */
    private String getBaseQuery() { 
	StringBuffer query = new StringBuffer();

	query.append( "SELECT bio_sample_id, " +
		      "expression_set_id, " + 
		      "taxon_id, " +
		      "germplasm_id, " +
		      "extraction_protocol_ref_id, " +
		      "name, " +
		      "biomaterial_type, " +
		      "biomaterial_description, " +
		      "biomaterial_is_exp_variable, " +
		      "treatment_description, " +
		      "growth_description, " +
		      "harvest_description, " +
		      "probe_type, " +
		      "is_control, " +
		      "polyA_test, " +
		      "measurement, " +
		      "anatomy_description, " +
		      "development_description " +
		      "FROM BioSample " );
	return query.toString();    
    } 

    //
    // Get 'em and set 'em
    //


    public void set_bio_sample_id( Long value ) {
	bio_sample_id = value; 
    }

    public Long get_bio_sample_id() {
	return bio_sample_id;
    }

    public void set_expression_set_id( Long value ) {
	expression_set_id = value; 
    }

    public Long get_expression_set_id() {
	return expression_set_id;
    }

    public void set_taxon_id( Long id ) {
	this.taxon_id = id;
    }

    public Long get_taxon_id() { 
	return taxon_id;
    }

    public void set_germplasm_id( Long id ) { 
	this.germplasm_id = id;
    }

    public Long get_germplasm_id() {
	return germplasm_id; 
    }

    public void set_extraction_protocol_ref_id( Long value ) {
	extraction_protocol_ref_id = value; 
    }

    public Long get_extraction_protocol_ref_id() { 
	return extraction_protocol_ref_id; 
    }

    public void set_name( String value ) {
	name = value; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_biomaterial_type( String type ) {
	this.biomaterial_type = type; 
    }

    public String get_biomaterial_type() { 
	return biomaterial_type;
    }

    public void set_biomaterial_description( String desc ) { 
	this.biomaterial_description = desc;
    }

    public String get_biomaterial_description() {
	return biomaterial_description; 
    }

    public void set_biomaterial_is_exp_variable( Boolean is_exp_variable ) {
	this.biomaterial_is_exp_variable = is_exp_variable;
    }

    public Boolean get_biomaterial_is_exp_variable() { 
	return biomaterial_is_exp_variable;
    }

    public void set_treatment_description( String value ) {
	treatment_description = value;
    }

    public String get_treatment_description() {
	return treatment_description; 
    }

    public void set_growth_description( String value ) {
	growth_description = value;
    }

    public String get_growth_description() { 
	return growth_description; 
    }

    public void set_is_control( Boolean value ) {
	is_control  = value; 
    }

    public Boolean get_is_control() {
	return is_control; 
    }

    public void set_polyA_test( Boolean value ) { 
	polyA_test  = value;
    }

    public Boolean get_polyA_test() {
	return polyA_test; 
    }

    public void set_measurement( String value ) {
	measurement = value;
    }

    public String get_measurement() { 
	return measurement; 
    }

    public void set_harvest_description( String desc ) { 
	this.harvest_description = desc; 
    }

    public String get_harvest_description() {
	return harvest_description; 
    }

    public void set_probe_type( String type ) {
	this.probe_type = type;
    }

    public String get_probe_type() {
	return probe_type;
    }

    public void set_anatomy_description( String desc ) {
	this.anatomy_description = desc; 
    }

    public String get_anatomy_description() {
	return anatomy_description; 
    }

    public void set_development_description( String desc ) {
	this.development_description = desc;
    }

    public String get_development_description() { 
	return development_description; 
    }



    /**
     * Stores bio sample data to the database as an UPDATE or INSERT depending
     * on whether bio sample id is null or not.
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
	
        if ( get_bio_sample_id() == null ) {
            insert( conn );
        } else {
            update( conn );
        }

    }

    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any data required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {
	// require expression set id, name at a minimum
	
	if ( get_expression_set_id() == null ||
	     get_name() == null ) {

	    String msg =
		"Cannot store bio sample with expression set id: " +
		get_expression_set_id() + 
		", name: " + get_name(); 
	    
	    throw new InvalidActionException( msg );
	}
    }


   /** 
     * Inserts a new row into BioSample containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {


	String query = StoreUtils.createInsertStatement( "BioSample", 
							 getColumnValuesMap() );
	
	// insert row and get newly created id
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    Long id = new Long( results.getLong( 1 ) );
	    set_bio_sample_id( id );
	}
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in BioSample with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    StoreUtils.createUpdateStatement( "BioSample", 
					      "bio_sample_id",
					      get_bio_sample_id(),
					      getColumnValuesMap() );
	
	conn.setQuery( query );	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"BioSample UPDATE failed: no row found for " +
		"bio sample id: " + get_bio_sample_id();
	    throw new RecordNotFoundException( msg );
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
	columnValues.put( "expression_set_id", 
			  TextConverter.dbQuote( get_expression_set_id() ) );
	
	columnValues.put( "taxon_id", 
			  TextConverter.dbQuote( get_taxon_id() ) );

	columnValues.put( "germplasm_id", 
			  TextConverter.dbQuote( get_germplasm_id() ) );

	columnValues.put( "extraction_protocol_ref_id", 
			  TextConverter.dbQuote( 
			      get_extraction_protocol_ref_id() ) );


	columnValues.put( "name", TextConverter.dbQuote( get_name() ) );
	
	columnValues.put( "biomaterial_type", 
			  TextConverter.dbQuote( get_biomaterial_type() ) );


	String bioDesc = 
	    TextConverter.dbQuote( get_biomaterial_description() );
	columnValues.put( "biomaterial_description", bioDesc );

	columnValues.put( "biomaterial_is_exp_variable", 
			  TextConverter.dbQuote( 
			       get_biomaterial_is_exp_variable() ) );

	
	columnValues.put( "treatment_description", 
			  TextConverter.dbQuote( 
			       get_treatment_description() ) );

	columnValues.put( "growth_description", 
			  TextConverter.dbQuote( 
			       get_growth_description() ) );

	columnValues.put( "harvest_description", 
			  TextConverter.dbQuote( get_harvest_description() ) );

	columnValues.put( "probe_type", 
			  TextConverter.dbQuote( get_probe_type() ) );

	columnValues.put( "is_control", 
			  TextConverter.dbQuote( get_is_control() ) );

	columnValues.put( "polyA_test", 
			  TextConverter.dbQuote( get_polyA_test() ) );

	columnValues.put( "measurement", 
			  TextConverter.dbQuote( get_measurement() ) );

	columnValues.put( "anatomy_description", 
			  TextConverter.dbQuote( get_anatomy_description() ) );

	columnValues.put( "development_description", 
			  TextConverter.dbQuote( 
			       get_development_description() ) );

	return columnValues;

    }

    /**
     * Deletes a row from bio sample. This method assumes all data associated
     * to bio sample as already been deleted, otherwise a database error will
     * occur
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
	String query = "DELETE BioSample WHERE bio_sample_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( get_bio_sample_id() );
	conn.executeUpdate();
	conn.releaseResources();
    }


    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcBioSample content test ******" );
	System.out.println( "bio_sample_id: " + get_bio_sample_id() );
	System.out.println( "expression_set_id: " + get_expression_set_id() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "germplasm_id: " + get_germplasm_id() );
	System.out.println( "extraction_protocol_ref_id: " + get_extraction_protocol_ref_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "biomaterial_type: " + get_biomaterial_type() );
	System.out.println( "biomaterial_description: " + get_biomaterial_description() );
	System.out.println( "biomaterial_is_exp_variable: " + get_biomaterial_is_exp_variable() );
	System.out.println( "treatment_description: " + get_treatment_description() );
	System.out.println( "growth_description: " + get_growth_description() );
	System.out.println( "is_control: " + get_is_control() );
	System.out.println( "polyA_test: " + get_polyA_test() );
	System.out.println( "measurement: " + get_measurement() );
	System.out.println( "harvest_description: " + get_harvest_description() );
	System.out.println( "probe_type: " + get_probe_type() );
	System.out.println( "anatomy_description: " + get_anatomy_description() );
	System.out.println( "development_description: " + get_development_description() );
	System.out.println( "****** TfcBioSample content end ******" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 2 );
	    TfcBioSample bs = new TfcBioSample( conn, id );
	    bs.test();
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }  
}
