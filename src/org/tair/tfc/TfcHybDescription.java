//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/07/06 20:24:55 $
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
 * This class maps to the HybDescription table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 */

public class TfcHybDescription {   

    private Long hyb_description_id;
    private Long expression_set_id; 
    private Long array_design_id;
    private Long hyb_protocol_ref_id;
    private Long scanning_software_id;
    private String name;
    private String description;
    private String normalization_desc;
    private Boolean is_multichannel;
    private Boolean is_reverse_dye;
    private String scanner;
    private Long reverse_id;
    private Long controller_id;

    /**
     * Creates an empty instance of TfcHybDescription
     */
    public TfcHybDescription() {  }

    /**
     * Creates an instance of TfcHybDescription that reflects the data referenced
     * by submitted hyb_description_id
     *
     * @param conn An active connection to the database
     * @param hyb_description_id hyb_description_id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public  TfcHybDescription( DBconnection conn, Long hyb_description_id ) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    getBaseQuery() + 
	    "WHERE hyb_description_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( hyb_description_id );

	ResultSet results = conn.getResultSet();
	boolean found = processResults( results );
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No hyb description found " +
					       "for hyb description id: " + 
					       hyb_description_id );
	}
    }
  
    /**
     * Store results of query in member variables - return flag to notify 
     * caller whether query produced results or not
     *
     * @param results ResultSet from population query
     * @throws SQLException if a database error occurs
     */
    private boolean processResults( ResultSet results ) throws SQLException {
	boolean found = results.next();

	if ( found ) {
	    Long hybID = new Long( results.getLong( "hyb_description_id" ) );
	    set_hyb_description_id( hybID );

	    long id = results.getLong( "array_design_id" );
	    if ( !results.wasNull() ) {
		set_array_design_id( new Long( id ) );
	    }

	    set_description( results.getString( "description" ) );
	    set_name( results.getString( "name" ) );
	    set_normalization_desc( results.getString( "normalization_desc" ) );


	    set_scanner( results.getString( "scanner" ) );

	    set_is_multichannel( 
		TextConverter.stringToBoolean( 
		    results.getString( "is_multichannel" ) ) );

	    set_is_reverse_dye( 
		TextConverter.stringToBoolean( 
		    results.getString( "is_reverse_dye" ) ) );


	    id = results.getLong( "scanning_software_id" );
	    if ( !results.wasNull() ) {
		set_scanning_software_id( new Long( id ) );
	    }

	    Long exprID = new Long( results.getLong( "expression_set_id" ) );
	    set_expression_set_id( exprID );

	    id = results.getLong( "controller_id" );
	    if ( !results.wasNull() ) {
		set_controller_id( new Long( id ) );
	    }
	    
	    id = results.getLong( "reverse_id" );
	    if ( !results.wasNull() ) {
		set_reverse_id( new Long( id ) );
	    }
	    
	    id = results.getLong( "hyb_protocol_ref_id" );
	    if ( !results.wasNull() ) {
		set_hyb_protocol_ref_id( new Long( id ) );
	    } 
	}

	return found;
    }

    /**
     * Return basic select statement
     */
    private String getBaseQuery() { 
	StringBuffer query = new StringBuffer();
	query.append( 
		     "SELECT hyb_description_id, " +
		     "array_design_id, " +
		     "description, " + 
		     "name, " +
		     "normalization_desc, " +
		     "is_multichannel, " + 
		     "scanner, " +
		     "is_reverse_dye, " +
		     "scanning_software_id, " +
		     "expression_set_id, " +
		     "controller_id, " +
		     "reverse_id, " +
		     "hyb_protocol_ref_id " +
		     "FROM HybDescription " );
	return query.toString();    
    } 

    public void set_hyb_description_id( Long id ) { 
	this.hyb_description_id = id;  
    }

    public Long get_hyb_description_id() {
	return hyb_description_id;
    }

    public void set_array_design_id( Long id ) {
	this.array_design_id = id; 
    }

    public Long get_array_design_id() {
	return array_design_id; 
    }

    public void set_description( String desc ) { 
	this.description = desc; 
    }

    public String get_description() { 
	return description;
    }

    public void set_name( String name ) {
	this.name = name;
    }

    public String get_name() {
	return name; 
    }

    public void set_normalization_desc( String desc ) { 
	this.normalization_desc = desc;
    }

    public String get_normalization_desc() { 
	return normalization_desc;
    }

    public void set_is_multichannel( Boolean is_multichannel ) { 
	this.is_multichannel = is_multichannel;
    }

    public Boolean get_is_multichannel() {
	return is_multichannel;
    }

    public void set_scanner( String scanner ) { 
	this.scanner = scanner;
    }

    public String get_scanner() {
	return scanner; 
    }

    public void set_is_reverse_dye( Boolean is_reverse ) {
	this.is_reverse_dye = is_reverse;
    }

    public Boolean get_is_reverse_dye() { 
	return is_reverse_dye;
    }

    public void set_scanning_software_id( Long id ) { 
	this.scanning_software_id = id;
    }

    public Long get_scanning_software_id() {
	return scanning_software_id; 
    }

    public void set_expression_set_id( Long id ) {
	this.expression_set_id = id;  
    }

    public Long get_expression_set_id() { 
	return expression_set_id;
    }

    public void set_controller_id( Long id ) { 
	this.controller_id = id; 
    }

    public Long get_controller_id() {
	return controller_id;
    }

    public void set_reverse_id( Long id ) { 
	this.reverse_id = id;
    }

    public Long get_reverse_id() { 
	return reverse_id; 
    }

    public void set_hyb_protocol_ref_id( Long id ) { 
	this.hyb_protocol_ref_id = id;  
    }

    public Long get_hyb_protocol_ref_id() {
	return hyb_protocol_ref_id;
    }


    /**
     * Stores hyb description data to the database as an UPDATE or INSERT 
     * depending on whether hyb description id is null or not.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set 
     * @throws RecordNotFoundException if no row found for hyb description id
     * when updating
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws RecordNotFoundException, SQLException, InvalidActionException {

	// ensure required data has been set
	validate();

	if ( get_hyb_description_id() == null ) {
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
	
	columnValues.put( "expression_set_id", 
			  TextConverter.dbQuote( get_expression_set_id() ) );

	columnValues.put( "array_design_id", 
			  TextConverter.dbQuote( get_array_design_id() ) );

	columnValues.put( "hyb_protocol_ref_id",
			  TextConverter.dbQuote( get_hyb_protocol_ref_id() ) );
	
	columnValues.put( "scanning_software_id", 
			  TextConverter.dbQuote( get_scanning_software_id() ) );
	
	columnValues.put( "name", TextConverter.dbQuote( get_name() ) );
	
	columnValues.put( "description", 
			  TextConverter.dbQuote( get_description() ) );
	
	columnValues.put( "normalization_desc", 
			  TextConverter.dbQuote( get_normalization_desc() ) );
	
	columnValues.put( "is_multichannel", 
			  TextConverter.dbQuote( get_is_multichannel() ) );
	
	columnValues.put( "is_reverse_dye", 
			  TextConverter.dbQuote( get_is_reverse_dye() ) );
	
	columnValues.put( "scanner", TextConverter.dbQuote( get_scanner() ) );
	
	columnValues.put( "reverse_id",
			  TextConverter.dbQuote(  get_reverse_id() ) );
	
	columnValues.put( "controller_id", 
			  TextConverter.dbQuote( get_controller_id() ) );

	return columnValues;

    }

    /** 
     * Inserts a new row into HybDescription containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {
	String query = StoreUtils.createInsertStatement( "HybDescription", 
							 getColumnValuesMap() );
	
	// insert row -- retrieve newly created hyb description id and
	// save in member variable
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    Long hybDescriptionID = new Long( results.getLong( 1 ) );
	    set_hyb_description_id( hybDescriptionID );
	}
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in HybDescription with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    StoreUtils.createUpdateStatement( "HybDescription", 
					      "hyb_description_id",
					      get_hyb_description_id(),
					      getColumnValuesMap() );

	conn.setQuery( query );
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	if ( rowsAffected <= 0 ) {
	    String msg = 
		"HybDescription UPDATE failed: no row found for " +
		"hyb description id: " + get_hyb_description_id();
	    throw new RecordNotFoundException( msg );
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
	// require expression set id, array design id at minimum
	if ( get_expression_set_id() == null ) {
	    throw new InvalidActionException( "Cannot store HybDescription " +
					      "with expression set id NULL" );

	} else if ( get_array_design_id() == null ) {
	    throw new InvalidActionException( "Cannot store HybDescription " +
					      "with array design id NULL" );
	}
    }


    /**
     * Deletes a row of hyb description data. This method assumes all
     * data associated to hyb description has already been deleted, otherwise
     * a database error will occur
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
	String query = "DELETE HybDescription WHERE hyb_description_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( get_hyb_description_id() );
	conn.executeUpdate();
	conn.releaseResources();
    }
	
		
    /**
     * Updates values of controller_id and reverse_id for an existing row
     * of HybDescription. This method is needed when creating new records,
     * since all hyb descriptions for an expression set must first be INSERTed
     * before these two foreign key relationships can be resolved. This method
     * allows us to first store all elements, then go through and update
     * any items that need it.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if no row updated for hyb description id
     * @throws SQLException if a database error occurs
     */
    public void storeControllerReverse( DBconnection conn ) 
	throws SQLException, RecordNotFoundException {
	
	Map updateValues = new HashMap();
	updateValues.put( "controller_id", 
			  TextConverter.dbQuote( get_controller_id() ) );

	updateValues.put( "reverse_id",
			  TextConverter.dbQuote( get_reverse_id() ) );
	
	String query = 
	    StoreUtils.createUpdateStatement( "HybDescription", 
					      "hyb_description_id",
					      get_hyb_description_id(),
					      updateValues );
	conn.setQuery( query );
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	if ( rowsAffected <= 0 ) {
	    String msg = 
		"HybDescription UPDATE failed: no row found for " +
		"hyb description id: " + get_hyb_description_id();
	    throw new RecordNotFoundException( msg );
	}
    }



    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcHybDescription content test ******" );
	System.out.println( "hyb_description_id: " + get_hyb_description_id() );
	System.out.println( "array_design_id: " + get_array_design_id() );
	System.out.println( "description: " + get_description() );
	System.out.println( "name: " + get_name() );
	System.out.println( "normalization_desc: " + get_normalization_desc() );
	System.out.println( "is_multichannel: " + get_is_multichannel() );
	System.out.println( "scanner: " + get_scanner() );
	System.out.println( "is_reverse_dye: " + get_is_reverse_dye() );    
	System.out.println( "scanning_software_id: " + get_scanning_software_id() );
	System.out.println( "expression_set_id: " + get_expression_set_id() );
	System.out.println( "controller_id: " + get_controller_id() );
	System.out.println( "reverse_id: " + get_reverse_id() );
	System.out.println( "hyb_protocol_ref_id: " + get_hyb_protocol_ref_id() );
	System.out.println( "**** TfcHybDescription content test end ****" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 387 );
	    TfcHybDescription hd = new TfcHybDescription( conn, id );
	    hd.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }  
}
