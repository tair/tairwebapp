//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2004/07/06 20:24:54 $
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
 * This class maps to the Germplasm table in the tair database. Each instance
 * maps one row of data in Germplasm table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 */

public class TfcGermplasm extends TfcTairObject {   

    private Long germplasm_id;
    private Long taxon_id;
    private Long species_variant_id;
    private String name;
    private String germplasm_type;
    private String special_growth_conditions;
    private String description;
    private String ploidy;
    private Boolean is_aneuploid;
    private Integer aneuploid_chromosome;
    private Boolean has_polymorphisms;
    private Boolean has_foreign_dna;
    private Boolean is_mutant;
    private String mutagen;
    private Boolean is_natural_variant;
    private Boolean is_mapping_strain;
    private java.util.Date date_last_modified;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;
  
    /**
     * Creates an empty instance of TfcGermplasm
     */
    public TfcGermplasm() {
	super();
    }

    /**
     * Creates an instance of TfcGermplasm to reflect the germplasm
     * entry with the supplied tair_object_id. 
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database 
     * error
     */
    public TfcGermplasm( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {   

	super( conn, tair_object_id );   
    }

    /**
     * Implements abstract method in superclass to return "Germplasm"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Germplasm";
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
     * all Germplasm specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all Germplasm specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "germplasm_id",
	    "taxon_id",
	    "species_variant_id",
	    "name",
	    "germplasm_type",
	    "special_growth_conditions",
	    "description",
	    "ploidy",
	    "is_aneuploid",
	    "aneuploid_chromosome",
	    "has_polymorphisms",
	    "has_foreign_dna",
	    "is_mutant",
	    "mutagen",
	    "is_natural_variant",
	    "is_mapping_strain",
	    "is_obsolete",
	    "date_entered",
	    "original_name",
	    "date_last_modified"
	};	    

	return localClassColumns;
    }

    /**
     * Retrieves Germplasm specific data from result set and stores
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "germplasm_id" );
	if ( !results.wasNull() ) {
	    germplasm_id = new Long( id );
	}
	
	set_ploidy( results.getString( "ploidy" ) );
	set_mutagen( results.getString( "mutagen" ) );
	set_name( results.getString( "name" ) );
	set_germplasm_type( results.getString( "germplasm_type" ) );

	set_is_mutant(
	    TextConverter.stringToBoolean( results.getString( "is_mutant" ) ) );

	set_has_foreign_dna( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_foreign_dna" ) ) );

	set_is_natural_variant( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_natural_variant" ) ) );

	set_is_mapping_strain( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_mapping_strain" ) ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
	        results.getString( "is_obsolete" ) ) );

	set_special_growth_conditions( 
	    results.getString( "special_growth_conditions" ) );

	set_description( results.getString( "description" ) );

	set_is_aneuploid( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_aneuploid" ) ) );
	
	int i = results.getInt( "aneuploid_chromosome" );
	if ( !results.wasNull() ) {
	    set_aneuploid_chromosome( new Integer( i ) );
	}
	
	id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}
	
	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ) {
	    set_species_variant_id( new Long( id ) );
	}
	
	set_has_polymorphisms( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_polymorphisms" ) ) );

	set_date_last_modified( results.getDate( "date_last_modified" ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );

    }


    //
    // Get 'em and set 'em
    //

    public void set_germplasm_id ( Long id ) { 
	this.germplasm_id = id; 
    }

    public Long get_germplasm_id() { 
	return germplasm_id; 
    }

    public void set_taxon_id ( Long id ) { 
	this.taxon_id = id; 
    }

    public Long get_taxon_id() { 
	return taxon_id; 
    }

    public void set_species_variant_id ( Long id ) { 
	this.species_variant_id = id; 
    }

    public Long get_species_variant_id() {
	return species_variant_id; 
    }

    public void set_name ( String name ) { 
	this.name = name; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_germplasm_type( String germplasm_type ) { 
	this.germplasm_type = germplasm_type; 
    }

    public String get_germplasm_type() { 
	return germplasm_type; 
    }

    public void set_has_foreign_dna( Boolean has_foreign_dna ) {
	this.has_foreign_dna = has_foreign_dna; 
    }

    public Boolean get_has_foreign_dna() { 
	return has_foreign_dna; 
    }

    public void set_is_mutant( Boolean is_mutant ) { 
	this.is_mutant = is_mutant; 
    }

    public Boolean get_is_mutant() {
	return is_mutant; 
    }

    public void set_has_polymorphisms( Boolean has_polymorphisms ) { 
	this.has_polymorphisms = has_polymorphisms; 
    }

    public Boolean get_has_polymorphisms() { 
	return has_polymorphisms; 
    }

    public void set_is_natural_variant( Boolean is_natural_variant ) { 
	this.is_natural_variant = is_natural_variant; 
    }

    public Boolean get_is_natural_variant() { 
	return is_natural_variant; 
    }

    public void set_is_mapping_strain( Boolean is_mapping_strain ) { 
	this.is_mapping_strain = is_mapping_strain; 
    }

    public Boolean get_is_mapping_strain() { 
	return is_mapping_strain; 
    }

    public void set_special_growth_conditions ( String conditions ) { 
	this.special_growth_conditions = conditions; 
    }

    public String get_special_growth_conditions() { 
	return special_growth_conditions; 
    }

    public void set_ploidy( String ploidy ) { 
	this.ploidy = ploidy; 
    }

    public String get_ploidy() { 
	return ploidy; 
    }
  
    public void set_mutagen( String mutagen ) { 
	this.mutagen = mutagen; 
    }

    public String get_mutagen() {
	return mutagen; 
    }

    public void set_description( String description ) { 
	this.description = description; 
    }

    public String get_description() { 
	return description; 
    }

    public void set_is_aneuploid( Boolean is_aneuploid ) { 
	this.is_aneuploid = is_aneuploid; 
    }

    public Boolean get_is_aneuploid() { 
	return is_aneuploid; 
    }

    public void set_aneuploid_chromosome( Integer chromosome ) { 
	this.aneuploid_chromosome = chromosome; 
    }

    public Integer get_aneuploid_chromosome() { 
	return aneuploid_chromosome; 
    }
    
    public void set_is_obsolete( Boolean is_obsolete ) { 
	this.is_obsolete = is_obsolete; 
    }

    public Boolean get_is_obsolete() {
	return is_obsolete; 
    }

    public void set_date_last_modified( java.util.Date last_modified ) { 
	this.date_last_modified = last_modified; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
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
     * Retrieves tair_object_id for submitted germplasm id
     *
     * @param conn An active connection to the database
     * @param germplasm_id Germplasm id to retrieve tair_object_id for
     * @return Tair object id for germplasm_id, or <code>null</code> if 
     * no record found for germplasm_id
     */
    public static Long retrieveTairObjectID( DBconnection conn, 
					     Long germplasm_id ) 
	throws SQLException {

	Long tairObjectID = null;

	String query = 
	    "SELECT tair_object_id " +
	    "FROM Germplasm " +
	    "WHERE germplasm_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( germplasm_id );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    tairObjectID = new Long( results.getLong( "tair_object_id" ) );
	}
	conn.releaseResources();

	return tairObjectID;
    }


    /**
     * Retrieves tair object id id for submitted germplasm name
     *
     * @param conn An active connection to the database
     * @param name Germplasm name to retrieve id for
     * @return Tair object id for submitted name, or <code>null</code>
     * if no row found for name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveTairObjectID( DBconnection conn, String name )
	throws SQLException {

        Long id = null;

        String query = 
	    "SELECT tair_object_id " +
	    "FROM Germplasm " +
	    "WHERE name = " + TextConverter.dbQuote( name.toUpperCase() );
    
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "tair_object_id" ) );
        }
        conn.releaseResources();

        return id;
    }


    /**
     * Retrieves germplasm tair object id for submitted ABRC stock number.
     * Although technically the schema allows for multiple germplasms to
     * be found for a single stock number, this should never happen.
     *
     * @param conn An active connection to the database
     * @param stockNumber Stock number to look up
     * @return Tair object id for germplasm associated to stockNumber, or
     * <code>null</code> if no germplasm found for stockNumber
     * @throws SQLException if a database error occurs
     */
    public static Long stockNumberToTairObjectID( DBconnection conn,
						  String stockNumber )
	throws SQLException {

	Long tairObjID = null;

	String query =
	    "SELECT g.tair_object_id " +
	    "FROM Germplasm g, TairObject_Stock ts, Stock s " +
	    "WHERE g.tair_object_id = ts.tair_object_id " +
	    "AND ts.stock_id = s.stock_id " +
	    "AND s.name = " + 
	    TextConverter.dbQuote( stockNumber.toUpperCase() );
	
	conn.setQuery( query );
	//	conn.setQueryVariable( stockNumber.toUpperCase() );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    tairObjID = new Long( results.getLong( "tair_object_id" ) );
	}
	conn.releaseResources();

	return tairObjID;
    }
     

    /**
     * Stores contents of germplasm to the database as an INSERT or UPDATE 
     * depending on whether germplasm_id primary key is NULL or not.
     * 
     * <p>
     * Since storing TfcGermplasm data results in storage to the TairObject
     * table through TfcTairObject super class, this method should be called as
     * part of an explicit database transaction to properly handle committing or 
     * rolling back of transaction in case of errors
     *
     * @param conn An active connection to the database
     * @throws RecordNotFoundException if no row found for tair object id when
     * updating.
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if no tair object id has been set for
     * object when trying to UPDATE, or if required data for germplasm
     * has not be set before storing
     */
    public void store( DBconnection conn ) 
        throws RecordNotFoundException, SQLException, InvalidActionException {

	// ensure required values have been set
	validate();

	// store TairObject values before Germplasm to ensure 
	// a tair_object_id is created for new entries
	super.store( conn );


	// if primary key null, do an insert and save newly 
	// created germplasm id in member variable
        if ( get_germplasm_id() == null ) {
	    insert( conn );
	    
	    // else do update
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
	// require germplasm name, germplasm_type at a minimum
	if ( get_name() == null ||
	     get_germplasm_type() == null ) {

	    String msg =
		"Cannot store germplasm with name: " + get_name() +
		", germplasm germplasm_type: " + get_germplasm_type();

	    throw new InvalidActionException( msg );
	}
    }


   /** 
     * Inserts a new row into Germplasm containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	// Get map of Germplasm specific column names and values to store
	Map columnValues = getLocalValuesMap();

	// use utility method in superclass to create INSERT 
	// statement using columnValues map. INSERT will automatically
	// include tair_object_id as well as a SELECT to get
	// newly created germplasm_id.
	String insertQuery = createChildTableInsert( columnValues, "GERMPLASM_ID", "GERMPLASM_SEQ" );
	conn.setInsertQuery( insertQuery, "GERMPLASM_ID" );
	Long id = conn.executeInsert();
	set_germplasm_id( id );
	conn.releaseResources();
	}

    /** 
     * Updates an existing row in Germplasm with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn ) 
	throws RecordNotFoundException, SQLException {
	
	// set now as date last modified for update
	set_date_last_modified( new java.util.Date() );

	// Get map of Germplasm specific column names and values to store
	Map columnValues = getLocalValuesMap();
	
	// use utility method in superclass to create UPDATE
	// statement using columnValues map -- UPDATE will always
	// be done using tair_object_id as primary key column in
	// WHERE clause
	String updateQuery = createChildTableUpdate( columnValues );
	conn.setQuery( updateQuery );
	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();
	
	if ( rowsAffected <= 0 ) { 
	    throw new RecordNotFoundException( "Update on Germplasm " + 
					       "failed: No row found " +
					       "for tair object id: " + 
					       get_tair_object_id() );
	}
	
    }
    
    /**
     * Retrieves values to store for a Germplasm as a Map of column names
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

	localValues.put( "taxon_id", get_taxon_id() );
	localValues.put( "species_variant_id", get_species_variant_id() );
	localValues.put( "germplasm_type", TextConverter.dbQuote( get_germplasm_type() ) );
	
	localValues.put( "special_growth_conditions", 
			 TextConverter.dbQuote( 
			     get_special_growth_conditions() ) );
	
	localValues.put( "description", 
			 TextConverter.dbQuote( get_description() ) );
	
	localValues.put( "ploidy", TextConverter.dbQuote( get_ploidy() ) );
	
	localValues.put( "is_aneuploid", 
			 TextConverter.dbQuote( get_is_aneuploid() ) );

	localValues.put( "aneuploid_chromosome", get_aneuploid_chromosome() );

	localValues.put( "has_polymorphisms", 
			 TextConverter.dbQuote( get_has_polymorphisms() ) );
	
	localValues.put( "has_foreign_dna", 
			 TextConverter.dbQuote( get_has_foreign_dna() ) );
	
	localValues.put( "is_mutant", 
			 TextConverter.dbQuote( get_is_mutant() ) );

	localValues.put( "mutagen", 
			 TextConverter.dbQuote( get_mutagen() ) );
	
	localValues.put( "is_natural_variant", 
			 TextConverter.dbQuote( get_is_natural_variant() ) );
	
	localValues.put( "is_mapping_strain", 
			 TextConverter.dbQuote( get_is_mapping_strain() ) );
    	
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
	System.out.println( "****** TfcGermplasm content test ******" );
	System.out.println( "germplasm_id: " + get_germplasm_id() );
	System.out.println( "ploidy: " + get_ploidy() );
	System.out.println( "mutagen: " + get_mutagen() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "species_variant_id: " + get_species_variant_id() );
	System.out.println( "special_growth_conditions: " + get_special_growth_conditions() );
	System.out.println( "has_foreign_dna: " + get_has_foreign_dna() );
	System.out.println( "has_polymorphisms: " + get_has_polymorphisms() );
	System.out.println( "is_mutant: " + get_is_mutant() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
	System.out.println( "is_natural_variant: " + get_is_natural_variant() );
	System.out.println( "is_mapping_strain: " + get_is_mapping_strain() );
	System.out.println( "description: " + get_description() );
	System.out.println( "aneuploid_chromosome: " + get_aneuploid_chromosome() );
	System.out.println( "is_aneuploid: " + get_is_aneuploid() );
	System.out.println( "name: " + get_name() );
	System.out.println( "germplasm_type: " + get_germplasm_type() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcGermplasm content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1005003786 );
	    TfcGermplasm germplasm = new TfcGermplasm( conn, id );
	    germplasm.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
