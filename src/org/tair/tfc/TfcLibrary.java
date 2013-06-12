//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.20 $
// $Date: 2005/02/10 20:28:06 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;


/**
 * This class maps to the Library table in the tair database. Each instance
 * maps one row of data in Library table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 */

public class TfcLibrary extends TfcTairObject {   

    private Long library_id;
    private Long vector_id;
    private java.util.Date date_last_modified;
    private String name;
    private String description;
    private String abbreviation;
    private Boolean is_obsolete;   
    private String insert_type;
    private Long species_variant_id;
    private Long host_strain_id;
    private String insert_size_range;
    private Long taxon_id;
    private Long restriction_enzyme_1_id;
    private Long restriction_enzyme_2_id;
    private String original_name;
    private java.util.Date date_entered;
  

    /**
     * Creates an empty instance of TfcLibrary
     */
    public TfcLibrary() {
        super();
    }


    /**
     * Creates an instance of TfcLibrary that reflects the data
     * referenced by submitted library_id
     *
     * @param conn An active connection to the database
     * @param library_id Library id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database 
     * error
     */
    public TfcLibrary( DBconnection conn, Long library_id ) 
	throws RecordNotFoundException, SQLException {

        super( conn, library_id );
    }

    /**
     * Implements abstract method in superclass to return "Library"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Library";
    }

    /**
     * Implements abstract method in superclass to return "library_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "library_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Library specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all Library specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "library_id",
	    "vector_id",
	    "date_last_modified",
	    "name",
	    "description",
	    "abbreviation",
	    "insert_type",
	    "host_strain_id",
	    "species_variant_id",
	    "insert_size_range",
	    "taxon_id",
	    "restriction_enzyme_1_id",
	    "restriction_enzyme_2_id",
	    "date_entered",
	    "original_name",
	    "is_obsolete "
	};	    

	return localClassColumns;
    }

    /**
     * Retrieves Library specific data from result set and stores in member
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "library_id" );
	if ( !results.wasNull() ) {
	    set_library_id( new Long( id ) );
	}
	
	id = results.getLong( "vector_id" );
	if ( !results.wasNull() ) {
	    set_vector_id( new Long( id ) );
	}
	
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_name( results.getString( "name" ) );
	set_description( results.getString( "description" ) );
	set_abbreviation( results.getString( "abbreviation" ) );
	set_insert_type( results.getString( "insert_type" ) );
	
	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ) {
	    set_species_variant_id( new Long( id ) );
	}
	
	id = results.getLong( "host_strain_id" );
	if ( !results.wasNull() ) {
	    set_host_strain_id( new Long( id ) );
	}

	set_insert_size_range( results.getString( "insert_size_range" ) );
	
	id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}
        
	id = results.getLong( "restriction_enzyme_1_id" );
	if ( !results.wasNull() ) {
	    set_restriction_enzyme_1_id( new Long( id ) );
	}
	
	id = results.getLong( "restriction_enzyme_2_id" );
	if ( !results.wasNull() ) {
	    set_restriction_enzyme_2_id( new Long( id ) );
	}
	
	set_is_obsolete( 
	    TextConverter.stringToBoolean(
		results.getString( "is_obsolete" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }



    /**
     * Retrieves library id for submitted name
     * 
     * @param conn An active connection to the database
     * @param name Library name to get id for
     * @return Library id for submitted name or <code>null</code>
     * if no row found for name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveLibraryID( DBconnection conn, String name ) 
	throws SQLException {

	Long id = null;

	String query = 
	    "SELECT library_id " +
	    "FROM Library " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name );
    
	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    id = new Long( results.getLong( "library_id" ) );
	}
	conn.releaseResources();

	return id;
    }


    //
    // Get 'em and set 'em
    //

    public void set_library_id ( Long value ) {
	library_id = value; 
    }

    public Long get_library_id() { 
	return library_id; 
    }

    public void set_vector_id ( Long value ) { 
	vector_id = value; 
    }

    public Long get_vector_id() { 
	return vector_id; 
    }

    public void set_date_last_modified ( java.util.Date value ) { 
	date_last_modified = value; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_name ( String value ) { 
	name = value; 
    }

    public String get_name() {
	return name; 
    }

    public void set_description ( String value ) {
	description = value; 
    }

    public String get_description() { 
	return description; 
    }

    public void set_abbreviation ( String value ) { 
	abbreviation = value; 
    }

    public String get_abbreviation() { 
	return abbreviation; 
    }
    
    public void set_is_obsolete ( Boolean value ) {  
	is_obsolete = value; 
    }

    public Boolean get_is_obsolete() { 
	return is_obsolete; 
    }

    public String get_insert_type() { 
	return insert_type; 
    }

    public void set_insert_type( String type ) { 
	this.insert_type = type; 
    }

    public Long get_species_variant_id() { 
	return species_variant_id; 
    }

    public void set_species_variant_id( Long id ) { 
	this.species_variant_id = id; 
    }

    public String get_insert_size_range() {
	return insert_size_range; 
    }

    public void set_insert_size_range( String range ) { 
	this.insert_size_range = range; 
    }

    public Long get_taxon_id() { 
	return taxon_id; 
    }

    public void set_taxon_id( Long id ) { 
	this.taxon_id = id; 
    }

    public Long get_host_strain_id() { 
	return host_strain_id; 
    }

    public void set_host_strain_id( Long id ) { 
	this.host_strain_id = id; 
    }

    public Long get_restriction_enzyme_1_id() { 
	return restriction_enzyme_1_id; 
    }

    public void set_restriction_enzyme_1_id( Long id ) { 
	this.restriction_enzyme_1_id = id; 
    }

    public Long get_restriction_enzyme_2_id() { 
	return restriction_enzyme_2_id; 
    }

    public void set_restriction_enzyme_2_id( Long id ) {
	this.restriction_enzyme_2_id = id; 
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
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** TfcLibrary content test ******" );
        System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "library_id: " + get_library_id() );
        System.out.println( "vector_id: " + get_vector_id() );
        System.out.println( "description: " + get_description() );
        System.out.println( "name: " + get_name() );
        System.out.println( "abbreviation: " + get_abbreviation() );
        System.out.println( "insert type: " + get_insert_type() );
        System.out.println( "species_variant_id: " + get_species_variant_id() );
        System.out.println( "insert size range: " + get_insert_size_range() );
        System.out.println( "taxon id: " + get_taxon_id() );
	System.out.println( "host strain id: " + get_host_strain_id() );

        System.out.println( "restriction_enzyme_1_id: " +
			    get_restriction_enzyme_1_id() );

        System.out.println( "restriction enzyme 2 id: " + 
			    get_restriction_enzyme_2_id() );

        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
        System.out.println( "**** TfcLibrary content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 22 );
            TfcLibrary library = new TfcLibrary( conn, test_id );
            library.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
