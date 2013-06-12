//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.15 $
// $Date: 2005/02/10 20:28:04 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * This class maps to the CloneEnd table in the tair database. Each instance
 * maps one row of data in CloneEnd table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 */

public class TfcCloneEnd extends TfcMapElement {   

    private Long clone_end_id;
    private Long clone_id;
    private String type;
    private String oligo_info;
    private Long taxon_id;
    private Long species_variant_id;
    private String chromosome;
    private String name;
    private Float length;
    private String units;
    private Boolean has_flank_sequence;
    private Boolean is_sequenced;
    private Boolean is_obsolete;
    private java.util.Date date_last_modified;
    private String original_name;
    private java.util.Date date_entered;
   
    /**
     * Creates an empty instance of TfcCloneEnd
     */
    public TfcCloneEnd() {
	super();
    }

    /**
     * Creates an instance of TfcCloneEnd that reflects the data referenced
     * by submitted clone_end_id
     *
     * @param conn An active connection to the database
     * @param clone_end_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcCloneEnd(  DBconnection conn, Long clone_end_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, clone_end_id );
    }

    /**
     * Implements abstract method in superclass to return "CloneEnd"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "CloneEnd";
    }

    /**
     * Implements abstract method in superclass to return "clone_end_id" as
     * name of primary key column to use when creating SQL statement 
     * for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "clone_end_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all CloneEnd specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all CloneEnd specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
	    "clone_end_id",
	    "clone_id",
	    "name",
	    "oligo_info",
	    "cloneend_type",
	    "taxon_id",
	    "species_variant_id",
	    "chromosome",
	    "length",
	    "units",
	    "has_flank_sequence",
	    "is_sequenced",
	    "is_obsolete",
	    "date_entered",
	    "original_name",
	    "date_last_modified"
	};
	
	return localClassColumns;
    }
    
    
    /**
     * Retrieves CloneEnd specific data from result set and store in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_clone_end_id( new Long( results.getLong( "clone_end_id" ) ) );

	long id = results.getLong( "clone_id" );
	if ( !results.wasNull() ) {
	    set_clone_id( new Long( id ) );
	}

	set_name( results.getString( "name" ) );
	set_oligo_info( results.getString( "oligo_info" ) );
	set_type( results.getString( "cloneend_type" ) );

	id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ){
	    set_taxon_id( new Long( id ) );
	}
        
	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ){
	    set_species_variant_id( new Long( id ) );
	}
        
	set_chromosome( results.getString( "chromosome" ) );

	float f = results.getFloat( "length" );
	if( !results.wasNull() ){
	    set_length( new Float( f ) );
	}

	set_units( results.getString( "units" ) );

	set_has_flank_sequence( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_flank_sequence" ) ) );

	set_is_sequenced( 
	    TextConverter.stringToBoolean( 
	        results.getString( "is_sequenced" ) ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );

	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }

    public void set_clone_id( Long id ) { 
	this.clone_id = id; 
    }

    public Long get_clone_id() {
	return clone_id; 
    }

    public void set_clone_end_id( Long id ) { 
	this.clone_end_id = id; 
    }

    public Long get_clone_end_id() { 
	return clone_end_id; 
    }

    public void set_type( String type ) {
	this.type = type;
    }

    public String get_type() {
	return type; 
    }

    public void set_oligo_info( String info ) { 
	this.oligo_info = info; 
    }

    public String get_oligo_info() { 
	return oligo_info; 
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

    public void set_chromosome( String chr ) {
	this.chromosome = chr; 
    }

    public String get_chromosome() { 
	return chromosome; 
    }

    public void set_name( String name ) {
	this.name = name; 
    }

    public String get_name() { 
	return name; 
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

    public void set_has_flank_sequence( Boolean has_flank_sequence ) {
	this.has_flank_sequence = has_flank_sequence;
    }

    public Boolean get_has_flank_sequence() { 
	return has_flank_sequence; 
    }

    public void set_is_sequenced( Boolean is_sequenced ) {
	this.is_sequenced = is_sequenced; 
    }

    public Boolean get_is_sequenced() {
	return is_sequenced; 
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
     * Retrieve clone end id for submitted clone end name
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve clone end id for
     * @return Clone end id for submitted clone end name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveCloneEndID( DBconnection conn, 
					   String name ) 
	throws SQLException {

        Long id = null;

        String query = 
            "SELECT clone_end_id " +
	    "FROM CloneEnd " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name );

        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "clone_end_id" ) );
        }
        conn.releaseResources();

        return id;
    }

    /**
     * For unit testing only
     */
    public void test(){
	super.test();
	System.out.println( "****** TfcCloneEnd content test ******" );
	System.out.println( "clone_end_id: " + get_clone_end_id() );
	System.out.println( "clone_id: " + get_clone_id() ); 
	System.out.println( "type: " + get_type() );
	System.out.println( "name: " + get_name() );
	System.out.println( "oligo_info: " + get_oligo_info() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "species_variant_id: " + get_species_variant_id() );
	System.out.println( "chromosome: " + get_chromosome() );
	System.out.println( "units: " + get_units() );
	System.out.println( "length: " + get_length() );
	System.out.println( "has_flank_sequence: " + get_has_flank_sequence() );
	System.out.println( "is_sequenced: " + get_is_sequenced() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcCloneEnd content test end ****" );
    }  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){

	try{
	    DBconnection conn = new DBconnection();
	    Long test_id = new Long( 385 );

	    TfcCloneEnd clone_end = new TfcCloneEnd( conn, test_id );
	    clone_end.test();
          

	} catch( Exception e ) {
	    e.printStackTrace();
	}

    }

}
