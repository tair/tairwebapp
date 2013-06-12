//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2005/02/10 20:28:06 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/** 
 * This class maps to the HostStrain table in the tair database. Each instance
 * maps one row of data in HostaStrain. Each member variable maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.  
 */

public class TfcHostStrain extends TfcTairObject {   

    private Long host_strain_id;
    private String name;
    private String genotype;
    private String original_name;
    private String antibiotic_resistance;
    private String media;
    private java.util.Date date_entered;
    private Float growth_temperature;
    private String description;
    private String duration_of_growth;
    private Long taxon_id;
    private java.util.Date date_last_modified;
    private Boolean is_obsolete;

    /**
     * Creates an empty instance of TfcHostStrain
     */
    public TfcHostStrain() {
	super();
    }

    /**
     * Creates an instance of TfcHostStrain that reflects the data referenced
     * by submitted host_strain_id.
     * 
     * @param conn An active connection to the database
     * @param host_strain_id Host strain id to retrieve data for
     * @throws RecordNotFoundException if no row found for host_strain_id
     * @throws SQLException if a database error occurs
     */
    public TfcHostStrain( DBconnection conn, Long host_strain_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, host_strain_id );
    }


    /**
     * Implements abstract method in superclass to return "HostStrain" as name
     * of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "HostStrain";
    }

    /**
     * Implements abstract method in superclass to return "host_strain_id" as name
     * of primary key column to use when creating SQL statement for object 
     * population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "host_strain_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all HostStrain specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all columns to include in SELECT statment
     * when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "host_strain_id",
	    "name",
	    "genotype",
	    "original_name",
	    "antibiotic_resistance",
	    "media",
	    "date_entered",
	    "growth_temperature",
	    "description",
	    "duration_of_growth",
	    "taxon_id",
	    "date_last_modified",
	    "is_obsolete"
	};

	return localClassColumns;
    }


    /**
     * Retrieves HostStrain specific data from result set and stores in member
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {

	set_host_strain_id( new Long( results.getLong( "host_strain_id" ) ) );
	set_name( results.getString( "name" ) );
	set_genotype( results.getString( "genotype" ) );
	set_original_name( results.getString( "original_name" ) );

	set_antibiotic_resistance( 
	    results.getString( "antibiotic_resistance" ) );

	set_media( results.getString( "media" ) );
	set_date_entered( results.getDate( "date_entered" ) );

	float temp = results.getFloat( "growth_temperature" );
	if ( !results.wasNull() ) {
	    set_growth_temperature( new Float( temp ) );
	}

	set_description( results.getString( "description" ) );
	set_duration_of_growth( results.getString( "duration_of_growth" ) );
	
	long id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}

	set_date_last_modified( results.getDate( "date_last_modified" ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );
    }


    /**
     * Retrieves host strain id for submitted name
     * 
     * @param conn An active connection to the database
     * @param name Host strain name to get id for
     * @return Host strain id for submitted name or <code>null</code>
     * if no row found for name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveHostStrainID( DBconnection conn, String name ) 
	throws SQLException {

	Long id = null;

	String query = 
	    "SELECT host_strain_id " +
	    "FROM HostStrain " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name );
	
	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    id = new Long( results.getLong( "host_strain_id" ) );
	}
	conn.releaseResources();

	return id;
    }
  
    /**
     * Retrieves description for submitted host strain id
     *
     * @param conn An active connection to the database
     * @param host_strain_id Host strain id to retrieve data for
     * @return Description for host strain id, or <code>null</code>
     * if no row found for host strain id
     */
    public static String retrieveDescription( DBconnection conn, 
					      Long host_strain_id )
	throws SQLException {

	String description = null;

	String query =
	    "SELECT description " +
	    "FROM HostStrain " +
	    "WHERE host_strain_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( host_strain_id );
	
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    description = results.getString( "description" );
	}
	conn.releaseResources();

	return description;
    }
			       

    //
    // Get 'em and set 'em
    //

    public void set_host_strain_id( Long id ) {
	this.host_strain_id = id;
    }

    public Long get_host_strain_id() {
	return host_strain_id;
    }

    public void set_name( String name ) {
	this.name = name;
    }

    public String get_name() {
	return name;
    }

    public void set_genotype( String genotype ) {
	this.genotype = genotype;
    }
    
    public String get_genotype() {
	return genotype;
    }

    public void set_original_name( String name ) {
	this.original_name = name;
    }

    public String get_original_name() {
	return original_name;
    }

    public void set_antibiotic_resistance( String resistance ) {
	this.antibiotic_resistance = resistance;
    }

    public String get_antibiotic_resistance() {
	return antibiotic_resistance;
    }

    public void set_media( String media ) {
	this.media = media;
    }

    public String get_media() {
	return media;
    }

    public void set_date_entered( java.util.Date date ) {
	this.date_entered = date;
    }

    public java.util.Date get_date_entered() {
	return date_entered;
    }

    public void set_growth_temperature( Float temp ) {
	this.growth_temperature = temp;
    }

    public Float get_growth_temperature() {
	return growth_temperature;
    }

    public void set_description( String description ) {
	this.description = description;
    }

    public String get_description() {
	return description;
    }

    public void set_duration_of_growth( String duration ) {
	this.duration_of_growth = duration;
    }

    public String get_duration_of_growth() {
	return duration_of_growth;
    }

    public void set_taxon_id( Long id ) {
	this.taxon_id = id;
    }

    public Long get_taxon_id() {
	return taxon_id;
    }

    public void set_date_last_modified( java.util.Date date ) {
	this.date_last_modified = date;
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


    /**
     * For unit testing only
     */
    public void test() {
	super.test();

        System.out.println( "****** TfcHostStrain content test ******" );
	System.out.println( "host_strain_id: " + get_host_strain_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "genotype: " + get_genotype() );
	System.out.println( "original_name: " + get_original_name() );
	System.out.println( "antibiotic_resistance: " + get_antibiotic_resistance() );
	System.out.println( "media: " + get_media() );
	System.out.println( "date_entered: " + get_date_entered() );
	System.out.println( "growth_temperature: " + get_growth_temperature() );
	System.out.println( "description: " + get_description() );
	System.out.println( "duration_of_growth: " + get_duration_of_growth() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
	System.out.println( "****** TfcHostStrain content end ******" );

    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try {

	    DBconnection conn = new DBconnection();
	    Long hostStrainID = new Long( 27 );
	    TfcHostStrain strain = new TfcHostStrain( conn, hostStrainID );
	    strain.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
