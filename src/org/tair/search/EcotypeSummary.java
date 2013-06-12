//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/04/05 22:44:22 $
//------------------------------------------------------------------------------
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.tair.querytools.AliasVector;
import org.tair.querytools.StockCollection;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Accessible;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.RecordNotFoundException;
 

/**
 * EcotypeSummary represents the information needed to display one ecotype record
 * as part of the ecotype search results. EcotypeSummary contains all fields from 
 * the temp table used to hold ecotype search results as well as collections of 
 * additional information (such as stocks, polymorphisms & species variant data) 
 * associated w/ecotype
 *
 * <p>
 * EcotypeSummary implements Accessible interface to facilitate creation of the 
 * object's TAIR accession number through <code>AccessionManager</code>
 */

public class EcotypeSummary implements Accessible {

    private Long tairObjectID;
    private Long speciesVariantID;
    private String name;
    private String abbrevName;
    private String baseName;
    private String type;
    private String location;
    private String country;
    private String originalName;

    // only populated for downloads
    private String habitat;
    private String minAltitude;
    private String maxAltitude;
    private String minLongitude;
    private String maxLongitude;
    private String minLatitude;
    private String maxLatitude;
    private String monthlyPrecipitation;
    private String dailyTemperature;
    private String numPlants;


    // stocks for any germplasms associated to ecotype - stored as StockObject
    private StockCollection stocks;

    // all aliases associated with a particular species variant
    private AliasVector aliases;

    /**
     * Creates an empty instance of EcotypeSummary
     */
    public EcotypeSummary() {  }


    /**
     * Creates an instance of EcotypeSummary that reflects data for the 
     * ecotype with submitted tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Ecotype tair_object_id to retrieve information for
     * @throws SQLException in the case of an invalid operation or database 
     * error, or if no row can be found for tair_object_id
     */
    public EcotypeSummary( DBconnection conn, Long tair_object_id ) 
	throws SQLException {   

	if ( tair_object_id != null ) {
	    populateEcotype( conn, tair_object_id );
	    populate( conn );
	}
    }

    public final Long getTairObjectID() { 
	return tairObjectID; 
    }

    public final Long getSpeciesVariantID() { 
	return speciesVariantID; 
    }

    public final String getName() {
	return name; 
    }

    public final String getAbbrevName() {
	return abbrevName; 
    }

    public final String getBaseName() { 
	return baseName; 
    }

    public final String getType() { 
	return type; 
    }

    public final String getLocation() { 
	return location; 
    }

    public final String getCountry() { 
	return country; 
    }

    public final String getOriginalName() { 
	return originalName; 
    }

    public final String getHabitat() { 
	return habitat; 
    }

    public final String getMinAltitude() {
	return minAltitude; 
    }

    public final String getMaxAltitude() { 
	return maxAltitude; 
    }

    public final String getMinLongitude() { 
	return minLongitude; 
    }

    public final String getMaxLongitude() {
	return maxLongitude; 
    }

    public final String getMinLatitude() { 
	return minLatitude; 
    }

    public final String getMaxLatitude() {
	return maxLatitude; 
    }

    public final String getMonthlyPrecipitation() { 
	return monthlyPrecipitation; 
    }

    public final String getDailyTemperature() { 
	return dailyTemperature; 
    }

    public final String getNumPlants() { 
	return numPlants; 
    }


    public final void setTairObjectID( Long id ) { 
	this.tairObjectID = id;
    }

    public final void setSpeciesVariantID( Long id ) { 
	this.speciesVariantID = id; 
    }

    public final void setName( String name ) { 
	this.name = name; 
    }

    public final void setAbbrevName( String name ) { 
	this.abbrevName = name; 
    }

    public final void setBaseName( String name ) { 
	this.baseName = name; 
    }

    public final void setType( String type ) {
	this.type = type; 
    }

    public final void setLocation( String location ) { 
	this.location = location; 
    }

    public final void setCountry( String country ) { 
	this.country = country; 
    }

    public final void setOriginalName( String name ) { 
	this.originalName = name; 
    }

    public final void setHabitat( String habitat ) { 
	this.habitat = habitat; 
    }

    public final void setMinAltitude( String altitude ) { 
	this.minAltitude = altitude; 
    }

    public final void setMaxAltitude( String altitude ) { 
	this.maxAltitude = altitude; 
    }

    public final void setMinLongitude( String longitude ) { 
	this.minLongitude = longitude; 
    }

    public final void setMaxLongitude( String longitude ) { 
	this.maxLongitude = longitude; 
    }

    public final void setMinLatitude( String latitude ) { 
	this.minLatitude = latitude; 
    }

    public final void setMaxLatitude( String latitude ) { 
	this.maxLatitude = latitude; 
    }

    public final void setMonthlyPrecipitation( String precipitation ) { 
	this.monthlyPrecipitation = precipitation; 
    }

    public final void setDailyTemperature( String temperature ) { 
	this.dailyTemperature = temperature; 
    }

    public final void setNumPlants( String num_plants ) { 
	this.numPlants = num_plants; 
    }

  
    
    /**
     * Populate basic species variant info. - if summary object is created 
     * through EcotypeSearcher (which it almost always is), this info is 
     * populated by Searcher directly
     */
    private void populateEcotype( DBconnection conn, Long tair_object_id ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	boolean found = false;
    
	query = 
	    "SELECT s.tair_object_id, " +
	    "s.species_variant_id, " +
	    "s.abbrev_name, " +
	    "s.base_name, " +
	    "s.original_name, " +
	    "s.name, " +
	    "s.speciesvariant_type, " +
	    "s.location, " +
	    "s.country, " +
	    "FROM SpeciesVariant s " +
	    "WHERE s.tair_object_id = " + tair_object_id.toString();
	conn.setQuery( query );
	results = conn.getResultSet();
	if ( results.next() ) {
	    found = true;
	    setTairObjectID( tair_object_id );
	    setSpeciesVariantID( new Long( results.getLong( "species_variant_id" ) ) );
	    setAbbrevName( results.getString( "abbrev_name" ) );
	    setBaseName( results.getString( "base_name" ) );
	    setName( results.getString( "name" ) );
	    setType( results.getString( "type" ) );
	    setLocation( results.getString( "location" ) );
	    setCountry( results.getString( "country" ) );
	    setOriginalName( results.getString( "original_name" ) );
	}
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No species variant found with " +
					       "tair object id: " + 
					       tair_object_id );
	}
    }


    /**
     * Retrieves associated data for ecotype including submitters.
     * This method assumes tair object and basic ecotype info has 
     * already been populated for the object. This method does
     * not populate description - this must be done by calling 
     * populateDescription() method; this is done since description
     * is needed for creating tab-delimited downloads, but is not
     * needed for displaying search results.
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public void populate( DBconnection conn ) throws SQLException {
	if ( getTairObjectID() != null && getSpeciesVariantID() != null ) {
	    stocks = new StockCollection( conn, getSpeciesVariantID(), "species_variant" );
	    aliases = new AliasVector(conn, getTairObjectID() );
    }
    }
  
    /**
     * Determines if ecotype has associated stocks
     *
     * @return <code>true</code> if ecotype has associated stocks, or 
     * <code>false</code> if no stocks associated to ecotype
     */
    public final boolean hasStocks() {
	return ( stocks != null && !stocks.isEmpty() );
    }


    /**
     * Retrieve stocks for ecotype
     *
     * @return Stocks for ecotype as an <code>Iterator</code> of 
     * <code>StockObject</code> objects, or <code>null</code> if ecotype
     * has no stocks
     */
    public final Iterator getStocks() {
	return ( hasStocks() ) ? stocks.iterator() : null;
    }

    /**
     * Determines if a species variant has associated aliases
     *
     * @return <code>true</code> if species varaint has aliases, and 
     * <code>false</code> if no aliases are associated
     */
     public boolean hasAliases(){
        return (aliases != null && !aliases.isEmpty() );
     }

    
    /**
    * Retrieve aliases for ecotype in a String
    *
    * @return Aliases for a particular ecotype
    */
    public final String getAliasesString() {
        return (hasAliases() ) ? aliases.get_alias_string() : null;
    }
    
    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public final String getAccession() { 
	return AccessionManager.getAccession( this ); 
    }

    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (ecotype) for use in creating TAIR accession
     */
    public final String getElementType() { 
	return "species_variant"; 
    }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR accession
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { 
	return getTairObjectID(); 
    }



    /**
     * Creates a tab-delimited string of data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>Accession</li>
     * <li>Name</li>
     * <li>Abbrev Name</li>
     * <li>Country</li>
     * <li>Location</li>
     * <li>Habitat</li>
     * <li>Altitude (min/max)</li>
     * <li>Longitude (min/max)</li>
     * <li>Latitude (min/max)</li>
     * <li>Daily Temperature</li>
     * <li>Monthly Precipitation</li>
     * <li>Number of Plants</li>
     * </ul>
     *
     * @return Tab-delimited string of ecotype data
     */     
    public final String createExport() {
	StringBuffer export = new StringBuffer();
	export.append( getAccession() + "\t" );
	export.append( EmptyTextConverter.convert( getOriginalName() ) + "\t" );
	export.append( EmptyTextConverter.convert( getAbbrevName() ) + "\t" );
	export.append( EmptyTextConverter.convert( getCountry() ) + "\t" );
	export.append( EmptyTextConverter.convert( getLocation() ) + "\t" );
	export.append( EmptyTextConverter.convert( getHabitat() ) + "\t" );
	export.append( getRangeString( getMinAltitude(), getMaxAltitude() ) + "\t" );
	export.append( getRangeString( getMinLongitude(), getMaxLongitude() ) + "\t" );
	export.append( getRangeString( getMinLatitude(), getMaxLatitude() ) + "\t" );
	export.append( EmptyTextConverter.convert( getMonthlyPrecipitation() ) + "\t" );
	export.append( EmptyTextConverter.convert( getDailyTemperature() ) + "\t" );
	export.append( EmptyTextConverter.convert( getNumPlants() ) + "\n" );
	return export.toString();
    }


    /**
     * Convenience method to create a single combined string out of minimum 
     * and maximum values. Resulting string is formatted as "minValue/maxValue"; 
     * method only appends non-null values. Used exclusively for creating 
     * tab-delimited exports
     */
    private String getRangeString( String minValue, String maxValue ) {
	StringBuffer range = new StringBuffer();

	if ( minValue != null ) {
	    range.append( minValue );
	}

	// try to avoid having slash on its own
	if ( minValue != null || maxValue != null ) {
	    range.append( "/" );
	}

	if ( maxValue != null ) {
	    range.append( maxValue );
	}

	return range.toString();
    }


    /**
     * Retrieve column order of download file
     *
     * @return Column order used when creating export as a tab-delimited string
     */ 
    public final String getExportHeader() {
	String header = 
	    "TAIR Accession\t" +
	    "Name\t" +
	    "Abbrev Name\t" +
	    "Country\t" +
	    "Location\t" +
	    "Habitat\t" +
	    "Altitude (min/max)\t" +
	    "Longitude (min/max)\t" +
	    "Latitude (min/max)\t" +
	    "Daily Temperature\t" +
	    "Monthly Precipitation\t" +
	    "Number Plants\n";
	return header;
    }


    /**
     * Retrieves species variant data that is only used when creating 
     * tab-delimited exports. Population of these fields is done separately
     * from the main populate() method since this data is not needed for 
     * display of search results, and we might as well avoid cost of getting
     * it when it's not needed. This method assumes that other species variant
     * info has already been populated.
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public void populateDownloadData( DBconnection conn ) throws SQLException {
	String query = null;
	ResultSet results = null;

	if ( getSpeciesVariantID() != null ) {
	    query = 
		"SELECT habitat, " +
		"min_altitude, " +
		"max_altitude, " +
		"min_longitude, " +
		"max_longitude, " +
		"min_latitude, " +
		"max_latitude, " +
		"monthly_precipitation, " +
		"daily_temperature, " +
		"num_plants " +
		"FROM SpeciesVariant " +
		"WHERE species_variant_id = " + getSpeciesVariantID().toString();
	    conn.setQuery( query );
	    results = conn.getResultSet();
	    if ( results.next() ) {
		setHabitat( results.getString( "habitat" ) );
		setMinAltitude( results.getString( "min_altitude" ) );
		setMaxAltitude( results.getString( "max_altitude" ) );
		setMinLongitude( results.getString( "min_longitude" ) );
		setMaxLongitude( results.getString( "max_longitude" ) );
		setMinLatitude( results.getString( "min_latitude" ) );
		setMaxLatitude( results.getString( "max_latitude" ) );
		setMonthlyPrecipitation( results.getString( "monthly_precipitation" ) );
		setDailyTemperature( results.getString( "daily_temperature" ) );
		setNumPlants( results.getString( "num_plants" ) );
	    }
	    conn.releaseResources();
	}
    }


    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** EcotypeSummary content test ******" );
	System.out.println( "tair object id: " + getTairObjectID() );
	System.out.println( "species variant id: " + getSpeciesVariantID() );
	System.out.println( "name: " + getName() );
	System.out.println( "abbrev name: " + getAbbrevName() );
	System.out.println( "base name: " + getBaseName() );
	System.out.println( "type: " + getType() );
	System.out.println( "location: " + getLocation() );
	System.out.println( "country: " + getCountry() );
	System.out.println( "original name: " + getOriginalName() );
	System.out.println( "Habitat: " + getHabitat() );
	System.out.println( "min altitude: " + getMinAltitude() );
	System.out.println( "max latitude: " + getMaxAltitude() );
	System.out.println( "min longitude: " + getMinLongitude() );
	System.out.println( "max longitude: " + getMaxLongitude() );
	System.out.println( "min latitude: " + getMinLatitude() );
	System.out.println( "max latitude: " + getMaxLatitude() );
	System.out.println( "monthly precipitation: " + getMonthlyPrecipitation() );
	System.out.println( "daily temperature: " + getDailyTemperature() );
	System.out.println( "num plants: " + getNumPlants() );

	if ( stocks != null && !stocks.isEmpty() ) {
	    stocks.test();
	}
	System.out.println( "**** EcotypeSummary content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    EcotypeSummary ecotype = new EcotypeSummary( conn, new Long( 2 ) );
	    ecotype.populateDownloadData( conn );
	    ecotype.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}
      
    }

}
