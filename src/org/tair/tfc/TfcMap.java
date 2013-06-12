//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/04/12 17:31:30 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Map table in the tair database. Each instance 
 * represents one row of data; each member variable maps to a column of a 
 * row in the table.
 */

public class TfcMap extends TfcMapElement {   
    
    private Long map_id;
    private String name;
    private String map_type;
    private Long taxon_id;
    private Long species_variant_id;
    private String chromosome;
    private Float length;
    private String units;
    private Boolean is_obsolete;
    private Boolean is_sequenced;
    private java.util.Date date_last_modified;
    private String original_name;
    private java.util.Date date_entered;


    /**
     * Creates an empty instance of TfcMap
     */
    public TfcMap() {
	super();
    }

    /**
     * Creates an instance of TfcMap that reflects the data referenced by 
     * submitted map id
     *
     * @param conn An active connection to the database
     * @param map_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcMap( DBconnection conn, Long map_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, map_id );   
    }

    /**
     * Implements abstract method in superclass to return "Map" as name of 
     * database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Map";
    }

    /**
     * Implements abstract method in superclass to return "map_id" as name 
     * of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "map_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Map specific columns to be included in SQL SELECT statement when 
     * populating object.
     *
     * @return String array of all Map specific columns to include in SELECT
     * statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
	    "map_id",
	    "name",
	    "map_type",
	    "taxon_id",
	    "species_variant_id",
	    "length",
	    "units",
	    "chromosome",
	    "is_sequenced",
	    "is_obsolete",
	    "date_entered",
	    "original_name",
	    "date_last_modified"
	};
	
	return localClassColumns;
    }
    
    /**
     * Retrieves Map specific data from result set and stores in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_map_id( new Long( results.getLong( "map_id" ) ) );
	set_name( results.getString( "name" ) );
	set_map_type( results.getString( "map_type" ) );

	long id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ){
	    set_taxon_id( new Long( id ) );
	}

	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ){
	    set_species_variant_id( new Long( id ) );
	}

	set_is_sequenced( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_sequenced" ) ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );
     
	float f= results.getFloat( "length" );
	if ( !results.wasNull() ){
	    set_length( new Float( f ) );
	}
      
	set_units( results.getString( "units" ) );
	set_chromosome( results.getString( "chromosome" ) );
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }


    //
    // Get 'em and set 'em
    //
    
    public void set_map_id ( Long value ) { 
	map_id = value; 
    }

    public Long get_map_id() { 
	return map_id; 
    }

    public void set_name ( String value ) { 
	name = value; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_map_type ( String value ) {
	map_type = value; 
    }

    public String get_map_type() { 
	return map_type; 
    }

    public void set_chromosome ( String value ) { 
	chromosome = value; 
    }

    public String get_chromosome() {
	return chromosome; 
    }

    public void set_units ( String value ) { 
	units = value; 
    }

    public String get_units() { 
	return units; 
    }

    public void set_date_last_modified ( java.util.Date value ) { 
	date_last_modified = value; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_length ( Float value ) { 
	length = value; 
    }

    public Float get_length() { 
	return length; 
    }

    public void set_taxon_id ( Long value ) { 
	taxon_id = value; 
    }

    public Long get_taxon_id() { 
	return taxon_id; 
    }

    public void set_species_variant_id ( Long value ) { 
	species_variant_id = value; 
    }

    public Long get_species_variant_id() { 
	return species_variant_id; 
    }

    public void set_is_sequenced ( Boolean value ) { 
	is_sequenced = value; 
    }

    public Boolean get_is_sequenced() { 
	return is_sequenced; 
    }

    public void set_is_obsolete( Boolean value ) { 
	is_obsolete = value; 
    }

    public Boolean get_is_obsolete() {
	return is_obsolete; 
    }

    public void set_original_name( String name ) { 
	this.original_name = name; 
    }

    public String get_original_name() { 
	return original_name; 
    }

    public void set_date_entered( java.util.Date date ) { 
	this.date_entered = date;
    }

    public java.util.Date get_date_entered() { 
	return date_entered; 
    }

    /**
     * For unit testing only
     */
    public void test(){
	super.test();
	System.out.println( "****** TfcMap content test ******" );
	System.out.println( "map_id: " + get_map_id() );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "map_element_id: " + get_map_element_id() );
	System.out.println( "map_type: " + get_map_type() );
	System.out.println( "name: " + get_name() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "species_variant_id: " + get_species_variant_id() );
	System.out.println( "units: " + get_units() );
	System.out.println( "chromosome: " + get_chromosome() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "length: " + get_length() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
	System.out.println( "is_sequenced: " + get_is_sequenced() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcMap content test end ****" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ){
    
	try {

	    DBconnection conn = new DBconnection();
	    Long test_id = new Long( 1 );
	    TfcMap map = new TfcMap( conn, test_id );
	    map.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
