//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2005/02/10 20:28:04 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Contig table in the tair database. Each instance
 * maps one row of data in Contig table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 */

public class TfcContig extends TfcMapElement {   

    private Long contig_id;
    private Long taxon_id;
    private String name;
    private String chromosome;
    private String units;
    private String group_name;
    private String type;
    private java.util.Date date_last_modified;
    private Long species_variant_id;
    private Float length;
    private Boolean is_sequenced;
    private Boolean is_obsolete;
    private Boolean has_flank_sequence;
    private Float ratio;
    private String description;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcContig
     */
    public TfcContig() { 
	super();
    }


    /**
     * Creates an instance of TfcContig that reflects the data referenced by
     * submitted contig_id
     * 
     * @param conn An active connection to the database
     * @param contig_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcContig( DBconnection conn, Long contig_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, contig_id );
    }

    /**
     * Implements abstract method in superclass to return "Contig"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Contig";
    }

    /**
     * Implements abstract method in superclass to return "contig_id" as
     * name of primary key column to use when creating SQL statement 
     * for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "contig_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Contig specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all Contig specific columns to include in
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
	    "contig_id",
	    "date_last_modified",
	    "type",
	    "species_variant_id",
	    "name",
	    "chromosome",
	    "length",
	    "units",
	    "is_sequenced",
	    "has_flank_sequence",
	    "ratio",
	    "taxon_id",
	    "group_name",
	    "description",
	    "date_entered",
	    "original_name",
	    "is_obsolete"
	};
	
	return localClassColumns;
    }
    
    
    /**
     * Retrieves Contig specific data from result set and stores in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "contig_id" );
	if ( !results.wasNull() ) {
	    set_contig_id( new Long( id ) );
	}
                           
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_type( results.getString( "type" ) );

	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ) {
	    set_species_variant_id( new Long( id ) );
	}

	set_name( results.getString( "name" ) );
	set_chromosome( results.getString( "chromosome" ) );
      
	float f = results.getFloat( "length" );
	if ( !results.wasNull() ) {
	    set_length( new Float( f ) );
	}
                       
	set_units( results.getString( "units" ) );

	set_is_sequenced( 
	    TextConverter.stringToBoolean(
		results.getString( "is_sequenced" ) ) );

	set_has_flank_sequence( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_flank_sequence" ) ) );
      
	f = results.getFloat( "ratio" );
	if ( !results.wasNull() ) {
	    set_ratio( new Float( f ) );
	}
      
      
	id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}

	set_group_name( results.getString( "group_name" ) );
	set_description( results.getString( "description" ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean(
		results.getString( "is_obsolete" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }

    //
    // Get 'em and set 'em
    //

    public void set_contig_id( Long value ) {
	contig_id = value;
    }

    public Long get_contig_id() {
	return contig_id;
    }
    
    public void set_taxon_id( Long value ) {
	taxon_id = value;
    }
    
    public Long get_taxon_id() {
	return taxon_id;
    }
  
    public void set_name( String value ) {
	name = value;
    }

    public String get_name() {
	return name;
    }

    public void set_chromosome( String value ) {
	chromosome = value;
    }

    public String get_chromosome() {
	return chromosome;
    }

    public void set_units( String value ) {
	units = value;
    }

    public String get_units() {
	return units;
    }

    public void set_group_name( String value ) {
	group_name = value;
    }

    public String get_group_name() {
	return group_name;
    }

    public void set_type( String value ) {
	type = value;
    }

    public String get_type() {
	return type;
    }

    public void set_date_last_modified( java.util.Date value ) {
	date_last_modified = value;
    }

    public java.util.Date get_date_last_modified() {
	return date_last_modified;
    }

    public void set_species_variant_id( Long value ) {
	species_variant_id = value;
    }

    public Long get_species_variant_id() {
	return species_variant_id;
    }

    public void set_length( Float value ) {
	length = value;
    }

    public Float get_length() {
	return length;
    }

    public void set_is_sequenced( Boolean value ) {
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

    public void set_has_flank_sequence( Boolean value ) {
	has_flank_sequence = value;
    }

    public Boolean get_has_flank_sequence() {
	return has_flank_sequence;
    }

    public void set_ratio( Float value ) {
	ratio = value;
    }

    public Float get_ratio() {
	return ratio;
    }

    public void set_description( String value ) {
	description = value;
    }

    public String get_description() {
	return description;
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
     * Retrieves contig id for submitted contig name
     *
     * @param conn An active connection to the database
     * @param name Contig name to retrieve id for
     * @return Contig id for submitted name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveContigID( DBconnection conn, String name )
	throws SQLException {

        Long id = null;

        String query = 
	    "SELECT contig_id " +
	    "FROM Contig " +
	    "WHERE name = " + 
	    TextConverter.dbQuote( name );
    
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "contig_id" ) );
        }
        conn.releaseResources();

        return id;
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** TfcContig content test ******" );
	System.out.println( "contig_id: " + get_contig_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "chromosome: " + get_chromosome() );
	System.out.println( "units: " + get_units() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "type: " + get_type() );
	System.out.println( "species_variant_id: " + get_species_variant_id() );
	System.out.println( "length: " + get_length() );
	System.out.println( "ratio: " + get_ratio() );
	System.out.println( "is_sequenced: " + get_is_sequenced() );
	System.out.println( "has_flank_sequence: " + get_has_flank_sequence() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "group_name: " + get_group_name() );
	System.out.println( "description: " + get_description() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcContig content test end ****" );
        
    }

    /**
     * main function is used to for testing only 
     */
    public static void main( String[] args ) {
	try {
	    DBconnection connection = new DBconnection();
	    Long test_id = new Long( 2 );
	    TfcContig contig = new TfcContig( connection, test_id );
	    contig.test();
          
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
