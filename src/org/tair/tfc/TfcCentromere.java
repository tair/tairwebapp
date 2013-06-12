//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/04/12 17:31:27 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Centromere table in the tair database. Each 
 * instance maps one row of data in Centromere table. Each data object 
 * maps to one field of a row in the table.
 */

public class TfcCentromere extends TfcMapElement {   

    private Long centromere_id;
    private String name;
    private Long taxon_id;
    private Long species_variant_id;
    private String chromosome;
    private Float length;
    private String units;
    private Boolean has_flank_sequence;
    private Boolean is_obsolete;
    private Boolean is_sequenced;
    private java.util.Date date_last_modified;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcCentromere
     */
    public TfcCentromere() {
	super();
    }

    /**
     * Creates an instance of TfcCentromere that reflects data referenced
     * by submitted centromere_id
     *
     * @param conn An active connection to the database
     * @param centromere_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcCentromere( DBconnection conn, Long centromere_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, centromere_id );
   }

    /**
     * Implements abstract method in superclass to return "Centromere"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Centromere";
    }

    /**
     * Implements abstract method in superclass to return "centromere_id" as 
     * name of primary key column to use when creating SQL statement 
     * for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "centromere_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Centromere specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all Centromere specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
	    "centromere_id",
	    "name",
	    "taxon_id",
	    "species_variant_id",
	    "length",
	    "units",
	    "chromosome",
	    "is_sequenced",
	    "is_obsolete",
	    "has_flank_sequence",
	    "date_entered",
	    "original_name",
	    "date_last_modified"
	};

	return localClassColumns;
    }


    /**
     * Retrieves Centromere specific data from result set and stores in member
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "centromere_id" );
	if ( !results.wasNull() ) {
	    set_centromere_id( new Long( id ) );
	}

	set_name( results.getString( "name" ) );
	
	id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}
	
	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ) {
	    set_species_variant_id( new Long( id ) );
	}
	
	set_is_sequenced( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_sequenced" ) ) );

	set_has_flank_sequence( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_flank_sequence" ) ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
	         results.getString( "is_obsolete" ) ) );
	
	float f= results.getFloat( "length" );
	if ( !results.wasNull() ) {
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
    
    public void set_centromere_id( Long id) {
	this.centromere_id = id;
    }
    
    public Long get_centromere_id() { 
	return centromere_id; 
    }

    public void set_name( String name ) { 
	this.name = name; 
    }
    
    public String get_name() { 
	return name; 
    }

    public void set_chromosome( String chromosome ) {
	this.chromosome = chromosome; 
    }

    public String get_chromosome() { 
	return chromosome; 
    }

    public void set_units( String units ) { 
	this.units = units;
    }

    public String get_units() { 
	return units; 
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

    public void set_taxon_id( Long id ) { 
	this.taxon_id = id;
    }

    public Long get_taxon_id() { 
	return taxon_id; 
    }

    public void set_species_variant_id( Long id ) { 
	this.species_variant_id = id; 
    }

    public Long get_species_variant_id() { 
	return species_variant_id; 
    }

    public void set_is_sequenced( Boolean is_sequenced ) { 
	this.is_sequenced = is_sequenced;
    }

    public Boolean get_is_sequenced() { 
	return is_sequenced; 
    }

    public void set_has_flank_sequence( Boolean has_flank_sequence ) {
	this.has_flank_sequence = has_flank_sequence;
    }

    public Boolean get_has_flank_sequence() { 
	return has_flank_sequence; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
	this.is_obsolete = is_obsolete; 
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
    public void test() {
	super.test();
	System.out.println( "****** TfcCentromere content test ******" );
	System.out.println( "centromere_id: " + get_centromere_id() );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "map_element_id: " + get_map_element_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "species_variant_id: " + get_species_variant_id() );
	System.out.println( "units: " + get_units() );
	System.out.println( "chromosome: " + get_chromosome() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "length: " + get_length() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
	System.out.println( "has_flank_sequence: " + get_has_flank_sequence() );
	System.out.println( "is_sequenced: " + get_is_sequenced() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcCentromere content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
	try{
	    // THIS WILL FAIL - TABLE EMPTY -- 3.25.2004 NM
	    DBconnection conn = new DBconnection();
	    Long test_id = new Long( 229 );
	    TfcCentromere centromere = new TfcCentromere( conn, test_id );
	    centromere.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}
    }
}
