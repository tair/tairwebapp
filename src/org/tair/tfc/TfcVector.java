//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.17 $
// $Date: 2005/02/10 20:28:07 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * This class map to the table Vector in the tair database. Each instance
 * maps one row of data in Vector table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 */

public class TfcVector extends TfcTairObject {

    private Long vector_id;
    private String name;
    private String vector_type;
    private Boolean is_obsolete;
    private java.util.Date date_last_modified;
    private Float length;
    private String units;
    private String description;
    private String ic_accession;
    private String origin_replication;
    private String polylinker;
    private String selectable_markers;
    private String usage_type;
    private String promoter_info;
    private String reporter_info;
    private String antibiotic_resistance;
    private String promoter_name;
    private String reporter_name;
    private String original_name;
    private Long host_strain_id;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcVector
     */
    public TfcVector() {
	super();
    }

    /**
     * Creates an instance of TfcVector to reflect data represented by
     * submitted vector_id
     *
     * @param conn An active connectin to the database
     * @param vector_id the object id of a row in the Vector table
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcVector( DBconnection conn, Long vector_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, vector_id );
    }

    /**
     * Implements abstract method in superclass to return "Vector"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
        return "Vector";
    }

    /**
     * Implements abstract method in superclass to return "vector_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
        return "vector_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Vector specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all Vector specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
        String[] localClassColumns = new String[] {
            "vector_id",
            "vector_type",
            "name",
            "length",
            "units",
            "is_obsolete",
            "description",
            "ic_accession",
            "origin_replication",
            "polylinker",
            "selectable_markers",
            "usage_type",
            "promoter_info",
            "reporter_info",
            "promoter_name",
            "reporter_name",
	    "date_entered",
	    "original_name",
	    "host_strain_id",
            "antibiotic_resistance",
            "date_last_modified "
        };          
        
        return localClassColumns;
    }

    /**
     * Retrieves Vector specific data from result set and stores in member
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
        long id = results.getLong( "vector_id" );
        if ( !results.wasNull() ) {
            set_vector_id( new Long( id ) );
	}
        
	set_vector_type( results.getString( "vector_type" ) );
	set_name( results.getString( "name" ) );
        
	float f = results.getFloat( "length" );
	if ( !results.wasNull() ) {
	    set_length( new Float( f ) );
	}
        
	set_units( results.getString( "units" ) );
	
	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );
	
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_description(DBconnection.getClob(results, "description"));
    set_ic_accession( results.getString( "ic_accession" ) );
	set_origin_replication( results.getString( "origin_replication" ) );
	set_polylinker( results.getString( "polylinker" ) );
	set_selectable_markers( results.getString( "selectable_markers" ) );
	set_usage_type( results.getString( "usage_type" ) );
	set_promoter_info( results.getString( "promoter_info" ) );
	set_reporter_info( results.getString( "reporter_info" ) );
	set_promoter_name( results.getString( "promoter_name" ) );
	set_reporter_name( results.getString( "reporter_name" ) );
	
	set_antibiotic_resistance( 
	    results.getString( "antibiotic_resistance" ) );

	id = results.getLong( "host_strain_id" );
	if ( !results.wasNull() ) {
	    set_host_strain_id( new Long( id ) );
	}

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }
    

    /**
     * Retrieves vector id for submitted vector name
     * 
     * @param conn An active connection to the database
     * @param name Vector name to retrieve data for
     * @return vector id for submitted vector name or <code>null</code>
     * if no row found for name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveVectorID( DBconnection conn, String name ) 
	throws SQLException {

	Long id = null;

	String query = 
	    "SELECT vector_id " +
	    "FROM Vector " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name );
    
	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    id = new Long( results.getLong( "vector_id" ) );
	}
	conn.releaseResources();

	return id;
    }

    //
    // Get 'em and set 'em
    //

    public void set_vector_id( Long id ) {
	this.vector_id = id; 
    }
    
    public Long get_vector_id() { 
	return vector_id; 
    }

    public void set_name( String name ) { 
	this.name = name; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_vector_type( String vector_type ) { 
	this.vector_type = vector_type; 
    }

    public String get_vector_type() { 
	return vector_type; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) {
	this.is_obsolete = is_obsolete; 
    }

    public Boolean get_is_obsolete() { 
	return is_obsolete; 
    }

    public void set_date_last_modified( java.util.Date date ) {
	this.date_last_modified = date;
    }

    public java.util.Date get_date_last_modified() {
	return date_last_modified; 
    }

    public void set_length( Float length ) { 
	this.length = length; 
    }

    public Float get_length() { 
	return length; 
    }

    public void set_units( String units ) {
	this.units = units;
    }

    public String get_units() { 
	return units; 
    }

    public void set_description( String descr ) { 
	this.description = descr; 
    }

    public String get_description() { 
	return description; 
    }

    public void set_ic_accession( String accession ) {
	this.ic_accession = accession; 
    }

    public String get_ic_accession() {
	return ic_accession; 
    }

    public void set_origin_replication( String replication ) {
	this.origin_replication = replication; 
    }

    public String get_origin_replication() {
	return origin_replication; 
    }

    public void set_polylinker( String polylinker ) { 
	this.polylinker = polylinker; 
    }

    public String get_polylinker() { 
	return polylinker; 
    }

    public void set_selectable_markers( String markers ) {
	this.selectable_markers = markers; 
    }

    public String get_selectable_markers() { 
	return selectable_markers; 
    }

    public void set_usage_type( String type ) { 
	this.usage_type = type; 
    }

    public String get_usage_type() {
	return usage_type; 
    }

    public void set_promoter_info( String info ) { 
	this.promoter_info = info; 
    }

    public String get_promoter_info() { 
	return promoter_info; 
    }

    public void set_promoter_name( String name ) { 
	this.promoter_name = name; 
    }

    public String get_promoter_name() { 
	return promoter_name; 
    }

    public void set_reporter_info( String info ) { 
	this.reporter_info = info; 
    }

    public String get_reporter_info() { 
	return reporter_info; 
    }

    public void set_reporter_name( String name ) { 
	this.reporter_name = name; 
    }

    public String get_reporter_name() { 
	return reporter_name; 
    }

    public void set_antibiotic_resistance( String resistance ) { 
	this.antibiotic_resistance = resistance; 
    }

    public String get_antibiotic_resistance() {
	return antibiotic_resistance; 
    }

    public void set_original_name ( String name ) { 
	this.original_name = name; 
    }

    public String get_original_name() { 
	return original_name; 
    }

    public void set_host_strain_id( Long id ) {
	this.host_strain_id = id; 
    }
    
    public Long get_host_strain_id() { 
	return host_strain_id; 
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
	System.out.println( "****** TfcVector content test ******" );
	System.out.println( "vector_id: " + get_vector_id() );
	System.out.println( "vector_type: " + get_vector_type() );
	System.out.println( "name: " + get_name() );
	System.out.println( "length: " + get_length() );
	System.out.println( "units: " + get_units() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "description: " + get_description() );
	System.out.println( "ic_accession: " + get_ic_accession() );
	System.out.println( "origin_replication: " + get_origin_replication() );
	System.out.println( "polylinker: " + get_polylinker() );
	System.out.println( "selectable_markers: " + get_selectable_markers() );
	System.out.println( "usage_type: " + get_usage_type() );
	System.out.println( "promoter_info: " + get_promoter_info() );
	System.out.println( "reporter_info: " + get_reporter_info() );
	System.out.println( "promoter name: " + get_promoter_name() );
	System.out.println( "reporter name: " + get_reporter_name() );
	System.out.println( "host strain id: " + get_host_strain_id() );

	System.out.println( "antibiotic_resistance: " + 
			    get_antibiotic_resistance() );

        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcVector content test end ****" );
    }

  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
      
	try {

	    DBconnection conn = new DBconnection();
	    Long test_id = new Long( 500500119 );
	    TfcVector vector = new TfcVector( conn, test_id );
	    vector.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}

    }
}
