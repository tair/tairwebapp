//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2005/02/10 20:28:05 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/** 
 * TfcDnaFragment maps to the DnaFragment table in the tair database. Each 
 * instance maps one row of data. Each data object maps to one field of a
 * row in the table. Each field has one set method and one get method for 
 * accessing from outside of class.
 */

public class TfcDnaFragment extends TfcMapElement {   
    
    private Long dna_fragment_id;
    private String name;
    private String type;
    private Long taxon_id;
    private Long species_variant_id;
    private String chromosome;
    private Float length;
    private String units;
    private Boolean has_flank_sequence;
    private Boolean is_obsolete;
    private Boolean is_sequenced;
    private java.util.Date date_last_modified;
    private Boolean is_arrayed;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcDnaFragment
     */
    public TfcDnaFragment() {
	super();
    }

    /**
     * Creates an instance of TfcDnaFragment that reflects the data 
     * referenced by submitted tair_object_id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcDnaFragment( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

        super( conn, tair_object_id );
    }

    /**
     * Implements abstract method in superclass to return "DnaFragment"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "DnaFragment";
    }

    /**
     * Implements abstract method in superclass to return "tair_object_id" 
     * as name of primary key column to use when creating SQL statement 
     * for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "tair_object_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all DnaFragment specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all DnaFragment specific columns to include in
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
	    "dna_fragment_id",
	    "name," +
	    "dnafragment_type",
	    "taxon_id",
	    "species_variant_id",
	    "length",
	    "units",
	    "chromosome",
	    "is_sequenced",
	    "is_obsolete",
	    "has_flank_sequence",
	    "date_last_modified",
	    "date_entered",
	    "original_name",
	    "is_arrayed"
	};
	
	return localClassColumns;
    }
    
    
    /**
     * Retrieves DnaFragment specific data from result set and stores in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "dna_fragment_id" );
	if ( !results.wasNull() ){
	    set_dna_fragment_id( new Long( id ) );
	}
	
	set_name( results.getString( "name" ) );
	set_type( results.getString( "dnafragment_type" ) );
      
	id = results.getLong( "taxon_id" );
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

	set_has_flank_sequence( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_flank_sequence" ) ) );

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
	set_is_arrayed( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_arrayed" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }

    
    /**
     * Utility method to retrieve type value for DnaFragment with submitted 
     * map_element_id.  This method is used in particular by 
     * org.tair.querytools.ArrayElement, which needs to get value of type alone 
     * for a display value
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve type for
     * @return Type value for submitted map_element_id, or <code>null</code> if
     * no row found in DnaFragment for submitted id
     * @throws SQLException if a database error occurs
     */
    public static String retrieveType( DBconnection conn, Long map_element_id )
	throws SQLException {

        String type = null;

        String query = 
	    "SELECT dnafragment_type " +
	    "FROM DnaFragment " +
	    "WHERE map_element_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( map_element_id );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            type = results.getString( "dnafragment_type" );
        }
        conn.releaseResources();

        return type;
    }

    /**
     * Retrieves tair object id for dna fragment with submitted name
     *
     * @param conn An active connection to the database
     * @param name Dna fragment name to retrieve id for
     * @return Tair object id for dna fragment with submitted name, or 
     * <code>null</code> if no dna fragment found for name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveTairObjectID( DBconnection conn, String name )
	throws SQLException {
	
	Long tairObjectID = null;

	String query =
	    "SELECT tair_object_id " +
	    "FROM DnaFragment " +
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


    //
    // Get 'em and set 'em
    //

    public void set_dna_fragment_id( Long id ) {
	this.dna_fragment_id = id; 
    }

    public Long get_dna_fragment_id() { 
	return dna_fragment_id; 
    }

    public void set_name( String name ) {
	this.name = name; 
    }

    public String get_name() {
	return name; 
    }

    public void set_type( String type ) { 
	this.type = type;
    }

    public String get_type() { 
	return type; 
    }

    public void set_is_arrayed( Boolean is_arrayed ) { 
	this.is_arrayed = is_arrayed; 
    }

    public Boolean get_is_arrayed() { 
	return is_arrayed; 
    }

    public void set_chromosome( String chr ) {
	this.chromosome = chr; 
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
	taxon_id = id; 
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
    public void test(){
        super.test();
        System.out.println( "****** TfcDnaFragment content test ******" );
        System.out.println( "dna_fragment_id: " + get_dna_fragment_id() );
        System.out.println( "type: " + get_type() );
        System.out.println( "name: " + get_name() );
        System.out.println( "taxon_id: " + get_taxon_id() );
        System.out.println( "species_variant_id: " + get_species_variant_id() );
        System.out.println( "units: " + get_units() );
        System.out.println( "chromosome: " + get_chromosome() );
        System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "length: " + get_length() );
        System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "is_sequenced: " + get_is_sequenced() );
        System.out.println( "is_arrayed: " + get_is_arrayed() );
        System.out.println( "has_flank_sequence: " + get_has_flank_sequence() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
        System.out.println( "**** TfcDnaFragment content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ){

        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 1005722639 );
            TfcDnaFragment fragment = new TfcDnaFragment( conn, id );
            fragment.test();

            System.out.println( "get type for map element id..." );
            id = new Long( 1002915877 );
            System.out.println( "type: " + TfcDnaFragment.retrieveType( conn, id ) );

        } catch ( Exception e ){
            e.printStackTrace();
        }
    }

}
