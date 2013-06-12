//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.15 $
// $Date: 2005/02/10 20:28:07 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Polymorphism table in the tair database. Each 
 * instance maps one row of data in Polymorphism table. Each data object 
 * maps to one field of a row in the table. Each field has one set method
 * and one get method for accessing from outside of class.
 */

public class TfcPolymorphism extends TfcMapElement {

    private Long polymorphism_id;
    private Long genetic_marker_id;
    private Long clone_id;
    private Long taxon_id;
    private Long ref_polymorphism_id;
    private Long caused_by_id;
    private Long vector_id;
    private String name;
    private String polymorphism_type;
    private Integer state_number;
    private String lengths;
    private String units;
    private Boolean is_present;
    private String chromosome;
    private String description;
    private String polymorphic_sequence;
    private String inheritance;
    private String insertion_type;
    private String deletion_type;
    private String mutation_site;
    private String allele_mode;
    private String mutagen;
    private java.util.Date date_last_modified;
    private Boolean is_allele;
    private Boolean has_flank_sequence;
    private Boolean has_observable_phenotype;
    private Boolean is_obsolete;
    private Boolean is_induced;
    private String original_name;
    private java.util.Date date_entered;


    /**
     * Creates an empty instance of TfcPolymorphism
     */
    public TfcPolymorphism() {  
        super();
    }
 
    /**
     * Creates an instance of TfcPolymorphism that reflects the data
     * referenced by submitted polymorphism_id
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id     
     * @throws SQLException if a database error occurs
     */
    public TfcPolymorphism( DBconnection conn, Long polymorphism_id ) 
	throws RecordNotFoundException, SQLException {

        super( conn, polymorphism_id );
    }

    /**
     * Implements abstract method in superclass to return "Polymorphism" as
     * name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Polymorphism";
    }

    /**
     * Implements abstract method in superclass to return "polymorphism_id" 
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "polymorphism_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Polymorphism specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of all Polymorphism specific columns to include
     * in SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
            "polymorphism_id", 
            "taxon_id",
            "clone_id",
            "genetic_marker_id",
            "vector_id",
            "name",
            "polymorphism_type",
            "state_number",
            "chromosome",
            "description",
            "lengths",
            "units",
            "polymorphic_sequence",
            "has_observable_phenotype",
            "inheritance",
            "insertion_type",
            "deletion_type",
            "allele_mode",
            "mutagen",
            "is_induced",
            "mutation_site",
            "is_allele",
            "has_flank_sequence",
            "is_present",
            "date_last_modified",
            "ref_polymorphism_id",
            "caused_by_id",
	    "date_entered",
	    "original_name",
            "is_obsolete"
	};
	
	return localClassColumns;
    }
    
    /**
     * Retrieves Polymorphism specific data from result set and stores in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_polymorphism_id( new Long( results.getLong( "polymorphism_id" ) ) );
	long id = results.getLong( "genetic_marker_id" );
	if( !results.wasNull() ) {
	    set_genetic_marker_id( new Long( id ) );
	}
        
	set_name( results.getString( "name" ) );
	set_polymorphism_type( results.getString( "polymorphism_type" ) );
	set_units( results.getString( "units" ) );
	set_lengths ( results.getString( "lengths" ) );

	int i = results.getInt( "state_number" );
	if( !results.wasNull() ) {
	    set_state_number ( new Integer( i ) );
	}
        
	set_is_present( 
            TextConverter.stringToBoolean(
	        results.getString( "is_present" ) ) );
        
	id = results.getLong( "taxon_id" );
	if( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}

	id = results.getLong( "clone_id" );
	if ( !results.wasNull() ) {
	    set_clone_id( new Long( id ) );
	}
        
	id = results.getLong( "ref_polymorphism_id" );
	if( !results.wasNull() ) {
	    set_ref_polymorphism_id( new Long( id ) );
	}
        
	id = results.getLong( "caused_by_id" );
	if( !results.wasNull() ) {
	    set_caused_by_id( new Long( id ) );
	}

	id = results.getLong( "vector_id" );
	if( !results.wasNull() ) {
	    set_vector_id( new Long( id ) );
	}
        
	set_chromosome( results.getString( "chromosome" ) );
	set_description( results.getString( "description" ) );
	set_polymorphic_sequence( results.getString( "polymorphic_sequence" ) );
	set_inheritance( results.getString( "inheritance" ) );
	set_insertion_type( results.getString( "insertion_type" ) );
	set_deletion_type( results.getString( "deletion_type" ) );
	set_mutation_site( results.getString( "mutation_site" ) );
	set_allele_mode( results.getString( "allele_mode" ) );
	set_mutagen( results.getString( "mutagen" ) );
	set_date_last_modified( results.getDate( "date_last_modified" ) );
            
	set_has_observable_phenotype( 
	    TextConverter.stringToBoolean(
		results.getString( "has_observable_phenotype" ) ) );

	set_is_allele( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_allele" ) ) );

	set_is_induced( 
	    TextConverter.stringToBoolean( 
	        results.getString( "is_induced" ) ) );

	set_has_flank_sequence( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_flank_sequence" ) ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
	        results.getString( "is_obsolete" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }

    //
    // Get 'em and set 'em
    //

    public void set_polymorphism_id( Long id ) {
	this.polymorphism_id = id;  
    }

    public Long get_polymorphism_id() { 
	return polymorphism_id; 
    }

    public void set_polymorphism_type( String polymorphism_type ) { 
	this.polymorphism_type = polymorphism_type; 
    }

    public String get_polymorphism_type() { 
	return polymorphism_type; 
    }

    public void set_genetic_marker_id( Long id ) { 
	this.genetic_marker_id = id;
    }

    public Long get_genetic_marker_id() { 
	return genetic_marker_id; 
    }

    public void set_taxon_id( Long id ) {
	this.taxon_id = id; 
    }

    public Long get_taxon_id() { 
	return taxon_id; 
    }

    public void set_clone_id( Long id ) { 
	this.clone_id = id; 
    }

    public Long get_clone_id() {
	return clone_id; 
    }

    public void set_caused_by_id( Long id ) { 
	this.caused_by_id = id; 
    }

    public Long get_caused_by_id() { 
	return caused_by_id; 
    }

    public void set_vector_id( Long id ) { 
	this.vector_id = id; 
    }

    public Long get_vector_id() { 
	return vector_id; 
    }

    public void set_ref_polymorphism_id( Long id ) { 
	this.ref_polymorphism_id = id; 
    }

    public Long get_ref_polymorphism_id() {
	return ref_polymorphism_id; 
    }

    public void set_name( String name ) { 
	this.name = name; 
    }

    public String get_name() { 
	return name;  
    }

    public void set_state_number( Integer number ) { 
	this.state_number = number; 
    }

    public Integer get_state_number() { 
	return state_number; 
    }

    public void set_lengths( String lengths ) { 
	this.lengths = lengths; 
    }

    public String get_lengths() { 
	return lengths; 
    }

    public void set_units( String units ) {
	this.units = units; 
    }

    public String get_units() { 
	return units; 
    }

    public void set_is_present( Boolean is_present ) { 
	this.is_present = is_present; 
    }

    public Boolean get_is_present() { 
	return is_present; 
    }

    public void set_chromosome( String chromosome ) {
	this.chromosome = chromosome; 
    }

    public String get_chromosome() { 
	return chromosome; 
    }

    public void set_description( String description ) { 
	this.description = description; 
    }

    public String get_description() { 
	return description; 
    }

    public void set_polymorphic_sequence( String sequence ){ 
	this.polymorphic_sequence = sequence; 
    }

    public String get_polymorphic_sequence() { 
	return polymorphic_sequence; 
    }

    public void set_inheritance( String inheritance ) {
	this.inheritance = inheritance; 
    }
    
    public String get_inheritance() {
	return inheritance; 
    }

    public void set_insertion_type( String type ) { 
	this.insertion_type = type; 
    }

    public String get_insertion_type() {
	return insertion_type; 
    }

    public void set_deletion_type( String type ) { 
	this.deletion_type = type; 
    }

    public String get_deletion_type() { 
	return deletion_type; 
    }

    public void set_mutation_site( String site ) { 
	this.mutation_site = site; 
    }

    public String get_mutation_site() { 
	return mutation_site; 
    }

    public void set_allele_mode( String mode ) { 
	this.allele_mode = mode; 
    }

    public String get_allele_mode() { 
	return allele_mode; 
    }

    public void set_mutagen( String mutagen ) { 
	this.mutagen = mutagen; 
    }

    public String get_mutagen() { 
	return mutagen; 
    }

    public void set_date_last_modified( java.util.Date date ) { 
	this.date_last_modified = date; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_is_allele( Boolean is_allele ) { 
	this.is_allele = is_allele; 
    }

    public Boolean get_is_allele() { 
	return is_allele; 
    }

    public void set_has_flank_sequence( Boolean has_flank_sequence ) {
	this.has_flank_sequence = has_flank_sequence; 
    }

    public Boolean get_has_flank_sequence() { 
	return has_flank_sequence; 
    }

    public void set_is_induced( Boolean is_induced ) { 
	this.is_induced = is_induced; 
    }

    public Boolean get_is_induced() {
	return is_induced; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
	this.is_obsolete  = is_obsolete; 
    }

    public Boolean get_is_obsolete() {
	return is_obsolete; 
    }

    public void set_has_observable_phenotype( Boolean has_observable ) {
        has_observable_phenotype = has_observable;
    }
    
    public Boolean get_has_observable_phenotype() { 
	return has_observable_phenotype; 
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
     * Retrieves polymorphism id for submitted polymorphism name
     *
     * @param conn An active connection to the database
     * @param name Polymorphism name to retrieve id for
     * @return Polymorphism id for submitted name
     * @throws SQLException if a database error occurs
     */
    public static Long retrievePolymorphismID( DBconnection conn, String name )
	throws SQLException {

        Long id = null;

        String query = 
	    "SELECT polymorphism_id " +
	    "FROM Polymorphism " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name );
    
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "polymorphism_id" ) );
        }
        conn.releaseResources();

        return id;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** TfcPolymorphism content test ******" );
        System.out.println( "polymorphism_id: " + get_polymorphism_id() );
        System.out.println( "polymorphism_type: " + get_polymorphism_type() );    
        System.out.println( "genetic_marker_id: " + get_genetic_marker_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "lengths: " + get_lengths() );
        System.out.println( "units: " + get_units() );
        System.out.println( "state_number: " + get_state_number() );
        System.out.println( "is_present: " + get_is_present() );
        System.out.println( "taxon_id: " + get_taxon_id() );
        System.out.println( "clone id: " + get_clone_id() );
        System.out.println( "vector id: " + get_vector_id() );
        System.out.println( "ref_polymorphism_id: " + 
			    get_ref_polymorphism_id() );
        System.out.println( "caused_by_id: " + get_caused_by_id() );
        System.out.println( "chromosome: " + get_chromosome() );
        System.out.println( "description: " + get_description() );
        System.out.println( "polymorphic_sequence: " + 
			    get_polymorphic_sequence() );
        System.out.println( "inheritance: " + get_inheritance() );
        System.out.println( "mutation_site: " + get_mutation_site() );
        System.out.println( "allele_mode: " + get_allele_mode() );
        System.out.println( "mutagen: " + get_mutagen() );
        System.out.println( "insertion_type: " + get_insertion_type() );
        System.out.println( "deletion_type: " + get_deletion_type() );
        System.out.println( "date_last_modified: " + 
			    get_date_last_modified() );
        System.out.println( "is_allele: " + get_is_allele() );
        System.out.println( "has_flank_sequence: " + 
			    get_has_flank_sequence() );
        System.out.println( "is induced: " + get_is_induced() );
        System.out.println( "has observable phenotype: " + 
			    get_has_observable_phenotype() );
        System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
        System.out.println( "**** TfcPolymorphism content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try {

            DBconnection conn = new DBconnection();
            Long test_id = new Long( 102589 );
            TfcPolymorphism poly = new TfcPolymorphism( conn, test_id );
            poly.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }  
}
