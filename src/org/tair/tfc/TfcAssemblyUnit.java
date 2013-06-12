//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2005/02/10 20:28:04 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the AssemblyUnit table. Each instance represents
 * one row of data; each member variable maps to a column of a row in 
 * the table.
 */

public class TfcAssemblyUnit extends TfcMapElement {   

    private Long assembly_unit_id;
    private Long taxon_id;
    private Long species_variant_id;
    private String chromosome;
    private String name;
    private String seq_status;
    private String ic_accession;
    private Float length;
    private String units;
    private Boolean is_sequenced;
    private Character orientation;
    private String tigr_clone_id;
    private String right_overlap_clone;
    private String left_overlap_clone;
    private Integer right_overlap_size;
    private Integer left_overlap_size;
    private String group_name;
    private java.util.Date date_last_modified;
    private String note;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;
   

    /**
     * Creates an empty instance of TfcAssemblyUnit
     */
    public TfcAssemblyUnit() { 
	super();
    }

    /**
     * Creates an instance of TfcAssemblyUnit to reflect the data referenced
     * by submitted assembly_unit_id
     *
     * @param conn An active connection to the database
     * @param assembly_unit_id Assembly unit id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TfcAssemblyUnit( DBconnection conn, Long assembly_unit_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, assembly_unit_id );
    }

    /**
     * Implements abstract method in superclass to return "AssemblyUnit"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "AssemblyUnit";
    }

    /**
     * Implements abstract method in superclass to return "assembly_unit_id" as
     * name of primary key column to use when creating SQL statement 
     * for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "assembly_unit_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all AssemblyUnit specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of all AssemblyUnit specific columns to include in
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
	    "assembly_unit_id",
	    "chromosome",
	    "length",
	    "units",
	    "is_sequenced",
	    "right_overlap_size",
	    "left_overlap_size",
	    "name",
	    "seq_status",
	    "ic_accession",
	    "tigr_clone_id",
	    "right_overlap_clone",
	    "left_overlap_clone",
	    "group_name",
	    "note",    
	    "orientation",
	    "date_last_modified",
	    "taxon_id",
	    "species_variant_id",
	    "date_entered",
	    "original_name",
	    "is_obsolete "
	};
	return localClassColumns;
    }
    
    
    /**
     * Retrieves AssemblyUnit specific data from result set and store in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_assembly_unit_id( 
	    new Long( results.getLong( "assembly_unit_id" ) ) );

	set_chromosome( results.getString( "chromosome" ) );
	set_units( results.getString( "units" ) );;      

	set_is_sequenced( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_sequenced" ) ) );

	float f = results.getInt( "length" );
	if ( !results.wasNull() ) {
	    set_length( new Float( f ) );
	}
                       
	int i = results.getInt( "right_overlap_size" );
	if ( !results.wasNull() ) {
	    set_right_overlap_size( new Integer( i ) );
	}
      
	i = results.getInt( "left_overlap_size" );
	if ( !results.wasNull() ) {
	    set_left_overlap_size( new Integer( i ) );
	}
      
	set_name( results.getString( "name" ) );
	set_seq_status( results.getString( "seq_status" ) );
	set_ic_accession( results.getString( "ic_accession" ) );
	set_tigr_clone_id( results.getString( "tigr_clone_id" ) );
	set_right_overlap_clone( results.getString( "right_overlap_clone" ) );
	set_left_overlap_clone( results.getString( "left_overlap_clone" ) );
	set_group_name( results.getString( "group_name" ) );
	set_note( results.getString( "note" ) );

	String s = results.getString( "orientation" );
	if ( !results.wasNull() ) {
	    set_orientation( new Character( s.charAt( 0 ) ) );
	}
                       
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	long id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}
      
	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ) {
	    set_species_variant_id( new Long( id ) );
	}
      
	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }
  
    /**
     * Retrieves assembly unit name for submitted map element id
     *
     * @param conn An active connection to the database
     * @param assembly_unit_id Assembly unit id to retrieve name for
     * @return Name for submitted assembly unit id
     * @throws SQLException thrown if a database error occurs
     */
    public static String retrieveMapElementName( DBconnection conn, 
						 Long map_element_id ) 
	throws SQLException {

	String name = null;

	String query = 
	    "SELECT name " +
	    "FROM AssemblyUnit " +
	    "WHERE map_element_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( map_element_id );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    name = results.getString( "name" );
	}
	conn.releaseResources();

	return name;
    }
  

    //
    // Get 'em and set 'em
    //

    public void set_assembly_unit_id( Long id ) { 
	this.assembly_unit_id = id; 
    }

    public Long get_assembly_unit_id() { 
	return assembly_unit_id; 
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

    public void set_chromosome( String chromosome ) {
	this.chromosome = chromosome; 
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

    public void set_seq_status( String status ) { 
	this.seq_status = status; 
    }

    public String get_seq_status() { 
	return seq_status; 
    }
    public void set_ic_accession( String accession ) { 
	this.ic_accession = accession; 
    }

    public String get_ic_accession() {
	return ic_accession; 
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

    public void set_is_sequenced( Boolean is_sequenced ) { 
	this.is_sequenced = is_sequenced; 
    }
    
    public Boolean get_is_sequenced() {
	return is_sequenced; 
    }

    public void set_orientation( Character orientation ) { 
	this.orientation = orientation; 
    }

    public Character get_orientation() {
	return orientation; 
    }

    public void set_tigr_clone_id( String id ) { 
	this.tigr_clone_id = id; 
    }

    public String get_tigr_clone_id() { 
	return tigr_clone_id; 
    }

    public void set_right_overlap_clone( String clone ) { 
	this.right_overlap_clone = clone; 
    }

    public String get_right_overlap_clone() { 
	return right_overlap_clone; 
    }

    public void set_left_overlap_clone( String clone ) { 
	this.left_overlap_clone = clone; 
    }

    public String get_left_overlap_clone() { 
	return left_overlap_clone; 
    }

    public void set_right_overlap_size( Integer size ) { 
	this.right_overlap_size = size; 
    }

    public Integer get_right_overlap_size() { 
	return right_overlap_size; 
    }

    public void set_left_overlap_size( Integer size ) { 
	this.left_overlap_size = size; 
    }

    public Integer get_left_overlap_size() { 
	return left_overlap_size; 
    }

    public void set_group_name( String name ) { 
	this.group_name = name; 
    }

    public String get_group_name() {
	return group_name; 
    }

    public void set_date_last_modified( java.util.Date date ) {
	this.date_last_modified = date; 
    }

    public java.util.Date get_date_last_modified() {
	return date_last_modified; 
    }

    public void set_note( String note ) {
	this.note = note; 
    }

    public String get_note() { 
	return note; 
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
     * Translates seq status code into text
     *
     * @return text for seq status associated with code stored in 
     * seq_status field, or <code>null</code> if no matching translation
     * for status.  Translation value stored locally here, not in database.
     */
    public String get_seq_status_translation() {

	String translation = null;

	String status = get_seq_status();
	if ( status != null ) {
	    if ( status.equals( "10" ) ) {
		translation = "intention to sequence or unknown";

	    } else if ( status.equals( "20" ) ) {
		translation = "clone library in preparation"; 

	    } else if ( status.equals( "30" ) ) {
		translation = "sequencing started"; 

	    } else if ( status.equals( "40" ) ) {
		translation = "preliminary GenBank release"; 

	    } else if ( status.equals( "50" ) ) {
		translation = "sequencing finished"; 

	    } else if ( status.equals( "60" ) ) {
		translation = "annotated GenBank release"; 

	    } else if ( status.equals( "90" ) ) {
		translation = "clone deregistered";
	    }
	}
	return translation;
    }

    /**
     * Retrieves assembly unit id for submitted assembly unit name
     *
     * @param conn An active connection to the database
     * @param name Assembly unit name to retrieve id for
     * @return Assembly unit id for submitted name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveAssemblyUnitID( DBconnection conn, 
					       String name )
	throws SQLException {

        Long id = null;

        String query = 
	    "SELECT assembly_unit_id " +
	    "FROM AssemblyUnit " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name );
	
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "assembly_unit_id" ) );
        }
        conn.releaseResources();

        return id;
    }

    /**
     * For unit testing only
     */
    public void test() {
	super.test();
    
	System.out.println( "****** TfcAssemblyUnit content test ******" );
	System.out.println( "assembly_unit_id: " + get_assembly_unit_id() );
	System.out.println( "chromosome: " + get_chromosome() );
	System.out.println( "length: " + get_length() );
	System.out.println( "units: " + get_units() );  
	System.out.println( "is_sequenced: " + get_is_sequenced() );
	System.out.println( "right_overlap_size: " + get_right_overlap_size() );
	System.out.println( "left_overlap_size: " + get_left_overlap_size() );
	System.out.println( "name: " + get_name() );
	System.out.println( "seq_status: " + get_seq_status() );
	System.out.println( "ic_accession: " + get_ic_accession() );
	System.out.println( "tigr_clone_id: " + get_tigr_clone_id() );
	System.out.println( "right_overlap_clone: " + 
			    get_right_overlap_clone() );
	System.out.println( "left_overlap_clone: " + 
			    get_left_overlap_clone() );
	System.out.println( "group_name: " + get_group_name() );
	System.out.println( "note: " + get_note() );
	System.out.println( "orientation: " + get_orientation() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );    
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "species_variant_id: " + get_species_variant_id() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcAssemblyUnit content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        
	try {
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1 );
	    TfcAssemblyUnit clone = new TfcAssemblyUnit( conn, id );
	    clone.test();

	} catch (Exception e ) {
	    e.printStackTrace();
	}
    }
}
