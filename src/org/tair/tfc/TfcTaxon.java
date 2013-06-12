//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.16 $
// $Date: 2004/07/06 16:33:04 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;


/**
 * This class maps to the Taxon table in the tair database. Each instance
 * maps one row of data in Taxon table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method 
 * for accessing from outside of class.
 */

public class TfcTaxon extends TfcTairObject {

    private Long taxon_id;
    private String genus;
    private String species;
    private String division_code;
    private String scientific_name;
    private String common_name;
    private String taxonomy;
    private String genbank_taxonomy_id;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcTaxon
     */
    public TfcTaxon() {  
	super();
    }


    /**
     * Creates an instance of TfcTaxon to reflect the data for the
     * taxon with the submitted taxon_id.

     * @param conn An active connection to the database
     * @param taxon_id Taxon id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcTaxon( DBconnection conn, Long taxon_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, taxon_id );
    }

    /**
     * Implements abstract method in superclass to return "Taxon"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Taxon";
    }

    /**
     * Implements abstract method in superclass to return "taxon_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "taxon_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Taxon specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all Taxon specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "taxon_id",
	    "genus",
	    "species",
	    "division_code",
	    "scientific_name",
	    "common_name",
	    "taxonomy",
	    "date_entered",
	    "original_name",
	    "genbank_taxonomy_id"
	};	    
	
	return localClassColumns;
    }

    /**
     * Retrieves Taxon specific data from result set and stores in member
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {    
	set_taxon_id( new Long( results.getLong( "taxon_id" ) ) );
	set_genus( results.getString( "genus" ) );
	set_species( results.getString( "species" ) );
	set_division_code( results.getString( "division_code" ) );
	set_scientific_name( results.getString( "scientific_name" ) );
	set_common_name( results.getString( "common_name" ) );
	set_taxonomy( results.getString( "taxonomy" ) );
	set_genbank_taxonomy_id( results.getString( "genbank_taxonomy_id" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }


    /**
     * Utility method to retrieve scientific name for a given taxon id. 
     * This is useful in situations where a quick translation of id to name 
     * is needed for display purposes (as in displaying search criteria for 
     * germplasm search)
     *
     * @param conn An active connection to the database
     * @param taxon_id Taxon id to retrieve data for
     * @return Scientific name for taxon id
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException thrown if a database error occurs
     */
    public static String get_scientific_name( DBconnection conn, Long taxon_id ) 
	throws RecordNotFoundException, SQLException {

	String scientificName = null;
	
	String query = 
	    "SELECT scientific_name " +
	    "FROM Taxon " +
	    "WHERE taxon_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( taxon_id );
	
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    scientificName = results.getString( "scientific_name" );
	}
	conn.releaseResources();

	if ( scientificName == null ) {
	    throw new RecordNotFoundException( "No taxon found for taxon id: " + 
					       taxon_id );
	}

	return scientificName;
    }
    

    /**
     * Utility method to determine the taxon id given a taxon's scientific_name
     * value. This is useful in cases where we want to search using taxon id of
     * Arabidopsis thaliana and joining to Taxon table separately is cumbersome,
     * or likely to be a performance drain (as in germplasm search where we can 
     * search by entries that are *not* A. thaliana. Determining the literal 
     * taxon_id value means that searching can be done without another table 
     * join at the cost of one quick db query here to translate the value.
     *
     * @param conn An active connection to the database
     * @param scientificName Scientific_name value to translate to taxon_id
     * @return Taxon id of taxon with submitted scientificName. If scientificName
     * yields more than one taxon id, only the first one will be returned
     * @throws RecordNotFoundException if no row found for submitted id    
     * @throws SQLException thrown if a database error occurs
     */
    public static Long translateScientificName( DBconnection conn, 
						String scientificName ) 
	throws RecordNotFoundException, SQLException {

	Long taxonID = null;

	String query = 
	    "SELECT taxon_id " +
	    "FROM Taxon " +
	    "WHERE scientific_name = " +
	    TextConverter.dbQuote( scientificName );

	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    taxonID = new Long( results.getLong( "taxon_id" ) );
	}
	conn.releaseResources();

	
	return taxonID;
    }

    //
    // Get 'em and set 'em
    //

    public void set_taxon_id( Long id ) { 
	this.taxon_id = id; 
    }

    public Long get_taxon_id() {
	return taxon_id; 
    }

    public void set_genus ( String genus ) { 
	this.genus = genus; 
    }
    
    public String get_genus() { 
	return genus; 
    }

    public void set_species( String species ) { 
	this.species = species; 
    }

    public String get_species() { 
	return species; 
    }

    public void set_division_code( String code ) { 
	this.division_code = code; 
    }

    public String get_division_code() { 
	return division_code; 
    }

    public void set_scientific_name( String name ) { 
	this.scientific_name = name; 
    }

    public String get_scientific_name() { 
	return scientific_name; 
    }

    public void set_common_name( String name ) { 
	this.common_name = name; 
    }

    public String get_common_name() { 
	return common_name; 
    }

    public void set_taxonomy( String taxonomy ) {
	this.taxonomy = taxonomy; 
    }

    public String get_taxonomy() { 
	return taxonomy; 
    }

    public void set_genbank_taxonomy_id( String id ) { 
	this.genbank_taxonomy_id = id; 
    }

    public String get_genbank_taxonomy_id() {
	return genbank_taxonomy_id; 
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
	System.out.println( "****** TfcTaxon content test ******" );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "genus: " + get_genus() );
	System.out.println( "species: " + get_species() );      
	System.out.println( "division_code: " + get_division_code() );
	System.out.println( "scientific_name: " + get_scientific_name() );
	System.out.println( "common_name: " + get_common_name() );
	System.out.println( "taxonomy: " + get_taxonomy() );
	System.out.println( "genbank_taxonomy_id: " + get_genbank_taxonomy_id() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcTaxon content test end ****" );
    }
    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        
	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1 );
	    TfcTaxon taxon = new TfcTaxon( conn, id );
	    taxon.test();

	    System.out.println( "Retrieving scientific name..." );
	    System.out.println( TfcTaxon.get_scientific_name( conn, id ) );

	} catch ( Exception e ) {
	    e.printStackTrace();
	}

    }

}
