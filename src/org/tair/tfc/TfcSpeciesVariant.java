//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.19 $
// $Date: 2005/02/10 20:28:07 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the table SpeciesVariant in the tair database. Each 
 * instance maps one row of data in SpeciesVariant table. Each data object 
 * maps to one field of a row in the table.
 */


public class TfcSpeciesVariant extends TfcTairObject {   

    private Long species_variant_id;
    private Long taxon_id;
    private String speciesvariant_type;
    private String name;
    private String abbrev_name;
    private String accession_number;
    private String base_name;
    private String location;
    private String country;
    private String habitat;
    private String min_altitude;
    private String max_altitude;
    private String min_longitude;
    private String max_longitude;
    private String min_latitude;
    private String max_latitude;
    private java.util.Date date_collected;
    private String monthly_precipitation;
    private String daily_temperature;
    private String num_plants;
    private java.util.Date date_last_modified;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;
  
    /**
     * Creates an empty instance of TfcSpeciesVariant
     */
    public TfcSpeciesVariant() {
	super();
    }

    /**
     * Creates an instance of TfcSpeciesVariant that represents data referenced
     * by submitted species_variant_id
     *
     * @param conn An active connection to the database
     * @param species_variant_id Species variant id to retrieve data for
     * @throws SQLException thrown if a database error occurs, or if no record
     * found for species_variant_id
     */
    public TfcSpeciesVariant( DBconnection conn, Long species_variant_id ) 
	throws SQLException {

	super( conn, species_variant_id );
    }

    /**
     * Implements abstract method in superclass to return "SpeciesVariant"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "SpeciesVariant";
    }

    /**
     * Implements abstract method in superclass to return "species_variant_id" 
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "species_variant_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all SpeciesVariant specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of all SpeciesVariant specific columns to include
     * in SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "species_variant_id",
            "taxon_id",
            "speciesvariant_type",
            "name",
            "abbrev_name",
            "accession_number",
            "base_name",
            "location",
            "country",
            "habitat",
            "min_altitude",
            "max_altitude",
            "min_longitude",
            "max_longitude",
            "min_latitude",
            "max_latitude",
            "date_collected",
            "monthly_precipitation",
            "daily_temperature",
            "num_plants",
            "date_last_modified",
	    "date_entered",
	    "original_name",
            "is_obsolete"
	};
	
	return localClassColumns;
    }


    /**
     * Retrieves SpeciesVariant specific data from result set and store
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_species_variant_id( 
	    new Long( results.getLong( "species_variant_id" ) ) );
	
	long id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}
	
	set_speciesvariant_type( results.getString( "speciesvariant_type" ) );
	set_name( results.getString( "name" ) );
	set_abbrev_name( results.getString( "abbrev_name" ) );
	set_accession_number( results.getString( "accession_number" ) );
	set_base_name( results.getString( "base_name" ) );
	set_location( results.getString( "location" ) );
	set_country( results.getString( "country" ) );
	set_habitat( results.getString( "habitat" ) );
	set_min_altitude( results.getString( "min_altitude" ) );
	set_max_altitude( results.getString( "max_altitude" ) );
	set_min_longitude( results.getString( "min_longitude" ) );
	set_max_longitude( results.getString( "max_longitude" ) );
	set_min_latitude( results.getString( "min_latitude" ) );
	set_max_latitude( results.getString( "max_latitude" ) );
	set_date_collected( results.getDate( "date_collected" ) );

	set_monthly_precipitation( 
	    results.getString( "monthly_precipitation" ) );

	set_daily_temperature( results.getString( "daily_temperature" ) );
	set_num_plants( results.getString( "num_plants" ) );
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );

	set_is_obsolete(
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );
    }


    /**
     * Retrieves tair object id for submitted species_variant_id
     * 
     * @param conn An active connection to the database
     * @param species_variant_id ID to retrieve super id for
     * @throws SQLException in the case of an invalid operation or database
     *  error
     * @return Tair object id for species_variant_id or <code>null</code> if no
     * matching record found
     */
    public static Long retrieveTairObjectID( DBconnection conn, 
					     Long species_variant_id ) 
	throws SQLException {

        Long tairObjectID = null;
	String query =
	    "SELECT tair_object_id "+
	    "FROM SpeciesVariant "+
	    "WHERE species_variant_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( species_variant_id );
	
	ResultSet results = conn.getResultSet();         
	if ( results.next() ) {
	    tairObjectID = new Long( results.getLong( "tair_object_id" ) );
	}

	conn.releaseResources();

        return tairObjectID;
    }

    /**
     * Retrieves tair object id for submitted species variant name
     * 
     * @param conn An active connection to the database
     * @param name Species variant name to retrieve super id for
     * @throws SQLException in the case of an invalid operation or database 
     *  error
     * @return Tair object id for name, or <code>null</code> if no matching 
     * record found
     */
    public static Long retrieveTairObjectID( DBconnection conn, String name ) 
	throws SQLException {

        Long tairObjectID = null;

	String query =
	    "SELECT tair_object_id "+
	    "FROM SpeciesVariant "+
	    "WHERE name = " +
	    TextConverter.dbQuote( name );
	
	conn.setQuery( query );
	
	ResultSet results = conn.getResultSet();         
	if ( results.next() ) {
	    tairObjectID = new Long( results.getLong( "tair_object_id" ) );
	}
	conn.releaseResources();

        return tairObjectID;
    }


    /**
     * Retrieves species variant id for submitted species variant name
     * 
     * @param conn An active connection to the database
     * @param name Species variant name to retrieve super id for
     * @throws SQLException if a database error occurs
     * @return Speces variant id for name, or <code>null</code> if no matching 
     * record found
     */
    public static Long retrieveSpeciesVariantID( DBconnection conn,
						 String name ) 
	throws SQLException {

        Long speciesVariantID = null;

        if ( name != null ) {
            String query =
                "SELECT species_variant_id " +
                "FROM SpeciesVariant " +
                "WHERE name = " +
		TextConverter.dbQuote( name );
      
            conn.setQuery( query );

            ResultSet results = conn.getResultSet();         
            if ( results.next() ) {
                speciesVariantID = 
		    new Long( results.getLong( "species_variant_id" ) );
            }
            conn.releaseResources();
        }
        return speciesVariantID;
    }



    
    /**
     * Retrieves species variant id for submitted species variant abbreviated
     * name
     * 
     * @param conn An active connection to the database
     * @param abbrevName Species variant abbreviated name to retrieve id for
     * @throws SQLException in the case of an invalid operation or database error
     * @return Speces variant id for abbrevName, or <code>null</code> if no 
     * matching record found
     */
    public static Long abbrevNameToSpeciesVariantID( DBconnection conn,
						     String abbrevName ) 
	throws SQLException {

        Long speciesVariantID = null;

	String query =
	    "SELECT species_variant_id "+
	    "FROM SpeciesVariant "+
	    "WHERE UPPER(abbrev_name) = " +
	    TextConverter.dbQuote( abbrevName.toUpperCase() );
      
	conn.setQuery( query );
	
	ResultSet results = conn.getResultSet();         
	if ( results.next() ) {
	    speciesVariantID = 
		new Long( results.getLong( "species_variant_id" ) );
	}
	conn.releaseResources();

	return speciesVariantID;
    }


    /**
     * Determines the best non-null name for species variant by examining 
     * original name, name and finally abbreviated name before returning 
     * <code>null</code> if all three are <code>null</code>
     *
     * @return Original name, name or abbreviated name (in that order) 
     * depending on which value is not <code>null</code> or <code>null</code>
     * if all three values are null.
     */
    public String get_format_name() {
        String formatName = null;
        
        if ( !TextConverter.isEmpty( get_original_name() ) ) {
            formatName = get_original_name();
        } else if ( !TextConverter.isEmpty( get_name() ) ) {
            formatName = get_name();
        } else { // give abbrev name, even if null
            formatName = get_abbrev_name();
        }
        return formatName;
    }



    public void set_species_variant_id ( Long value ) { 
	this.species_variant_id = value; 
    }

    public Long get_species_variant_id() { 
	return species_variant_id; 
    }

    public void set_taxon_id ( Long value ) { 
	this.taxon_id = value; 
    }

    public Long get_taxon_id() { 
	return taxon_id; 
    }

    public void set_speciesvariant_type( String value ) { 
	this.speciesvariant_type = value; 
    }

    public String get_speciesvariant_type() { 
	return speciesvariant_type; 
    }

    public void set_name( String value ) { 
	this.name = value; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_abbrev_name( String value ) { 
	this.abbrev_name = value; 
    }

    public String get_abbrev_name() { 
	return abbrev_name; 
    }

    public void set_accession_number( String value ) { 
	this.accession_number = value; 
    }

    public String get_accession_number() { 
	return accession_number; 
    }

    public void set_base_name( String name ) { 
	this.base_name = name; 
    }

    public String get_base_name() {
	return base_name; 
    }

    public void set_location( String location ) { 
	this.location = location; 
    }

    public String get_location() { 
	return location; 
    }

    public void set_country( String country ) {
	this.country = country; 
    }

    public String get_country() { 
	return country; 
    }

    public void set_habitat( String habitat ) { 
	this.habitat = habitat; 
    }

    public String get_habitat() { 
	return habitat; 
    }

    public void set_min_altitude( String altitude ) { 
	this.min_altitude = altitude; 
    }

    public String get_min_altitude() {
	return min_altitude; 
    }

    public void set_max_altitude( String altitude ) {
	this.max_altitude = altitude; 
    }

    public String get_max_altitude() {
	return max_altitude; 
    }

    public void set_min_longitude( String longitude ) { 
	this.min_longitude = longitude; 
    }

    public String get_min_longitude() {
	return min_longitude; 
    }

    public void set_max_longitude( String longitude ) {
	this.max_longitude = longitude; 
    }

    public String get_max_longitude() { 
	return max_longitude; 
    }

    public void set_min_latitude( String latitude ) { 
	this.min_latitude = latitude; 
    }

    public String get_min_latitude() { 
	return min_latitude; 
    }

    public void set_max_latitude( String latitude ) { 
	this.max_latitude = latitude; 
    }

    public String get_max_latitude() {
	return max_latitude; 
    }

    public void set_date_collected( java.util.Date date_collected ) { 
	this.date_collected = date_collected; 
    }

    public java.util.Date get_date_collected() {
	return date_collected; 
    }

    public void set_monthly_precipitation( String precipitation ) {
	this.monthly_precipitation = precipitation; 
    }

    public String get_monthly_precipitation() { 
	return monthly_precipitation; 
    }

    public void set_daily_temperature( String temperature ) { 
	this.daily_temperature = temperature; 
    }

    public String get_daily_temperature() { 
	return daily_temperature; 
    }

    public void set_num_plants( String num_plants ) {
	this.num_plants = num_plants; 
    }

    public String get_num_plants() {
	return num_plants; 
    }

    public void set_date_last_modified( java.util.Date last_modified ) { 
	this.date_last_modified = last_modified; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
	this.is_obsolete = is_obsolete; 
    }

    public Boolean get_is_obsolete() { 
	return is_obsolete; 
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
        System.out.println( "****** TfcSpeciesVariant content test ******" );
        System.out.println( "taxon_id: " + get_taxon_id() );
        System.out.println( "species_variant_id: " + get_species_variant_id() );
        System.out.println( "speciesvariant_type: " + get_speciesvariant_type() );
        System.out.println( "name: " + get_name() );
        System.out.println( "abbrev_name: " + get_abbrev_name() );
        System.out.println( "accession_number: " + get_accession_number() );
        System.out.println( "base name: " + get_base_name() );
        System.out.println( "location: " + get_location() );
        System.out.println( "country: " + get_country() );
        System.out.println( "min_altitude: " + get_min_altitude() );
        System.out.println( "max_altitude: " + get_max_altitude() );
        System.out.println( "min_longitude: " + get_min_longitude() );
        System.out.println( "max_longitude: " + get_max_longitude() );
        System.out.println( "min_latitude: " + get_min_latitude() );
        System.out.println( "max_latitude: " + get_max_latitude() );
        System.out.println( "date_collected: " + get_date_collected() );

        System.out.println( "monthly_precipitation: " + 
			    get_monthly_precipitation() );

        System.out.println( "daily_temperature: " + get_daily_temperature() );
        System.out.println( "num_plants: " + get_num_plants() );
        System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
        System.out.println( "**** TfcSpeciesVariant content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 305 );
            TfcSpeciesVariant species_variant =
		new TfcSpeciesVariant( conn, test_id );

            species_variant.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
