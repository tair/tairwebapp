//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.26 $
// $Date: 2005/02/10 20:28:05 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the Gene table in the tair database. Each instance
 * maps one row of data in Gene table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method 
 * for accessing from outside of class.
 */

public class TfcGene extends TfcMapElement {

    private Long gene_id;
    private Long taxon_id;
    private Long species_variant_id;
    private Long gene_model_type_id;
    private Long primary_symbol_id;
    private String gene_model_type;
    private String name;
    private String name_type;
    private String chromosome;
    private String units;
    private java.util.Date date_last_modified;
    private Float length;
    private Boolean is_predicted;
    private Boolean is_exp_verified;
    private String verification_method;
    private String description;
    private Boolean has_flank_sequence;
    private Boolean is_obsolete;
    private Boolean is_sequenced;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcGene
     */
    public TfcGene() { 
        super();
    }

    /**
     * Creates an instance of TfcGene that reflects the data referenced
     * by submitted gene_id
     *
     * @param conn An active connection to the database
     * @param gene_id Gene id to retrieve data for
     * @throws RecordNotFoundException if no row found for gene_id
     * @throws SQLException if a database error occurs
     */
    public TfcGene( DBconnection conn, Long gene_id ) 
	throws RecordNotFoundException, SQLException {

        super( conn, gene_id);   
    }

    /**
     * Implements abstract method in superclass to return "Gene"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Gene";
    }

    /**
     * Implements abstract method in superclass to return "gene_id" as
     * name of primary key column to use when creating SQL statement 
     * for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "gene_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Gene specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all Gene specific columns to include in
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
            "gene_id",
            "units",
            "chromosome",
            "date_last_modified",
            "name",
            "length",
            "is_predicted",
            "is_exp_verified",
            "verification_method",
            "gene_model_type_id",
            "name_type",
            "description",
            "taxon_id",
            "species_variant_id",
            "has_flank_sequence",
            "is_sequenced",
	        "date_entered",
	        "original_name",
            "is_obsolete",
            "primary_symbol_id"
	
    };

	return localClassColumns;
    }
    
    
    /**
     * Retrieves Gene specific data from result set and stores in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_gene_id( new Long( results.getLong( "gene_id" ) ) );
	set_units( results.getString( "units" ) );
	set_chromosome( results.getString( "chromosome" ) );
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_name( results.getString( "name" ) );
    set_primary_symbol_id( new Long(results.getLong("primary_symbol_id") ) );
	float f = results.getFloat( "length" );
	if ( !results.wasNull() ) {
	    set_length( new Float( f ) );
	}
                       
	set_is_predicted( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_predicted" ) ) );

	set_is_exp_verified( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_exp_verified" ) ) );

	set_verification_method( results.getString( "verification_method" ) );

	long id = results.getLong( "gene_model_type_id" );
	if ( !results.wasNull() ) {
	    set_gene_model_type_id( new Long( id ) );
	}

	set_name_type( results.getString( "name_type" ) );
	set_description( results.getString( "description" ) );

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

	if ( gene_model_type_id != null ) {
	    TfcGeneModelType type = new TfcGeneModelType( gene_model_type_id );
	    set_gene_model_type( type.get_gene_model_type() );
	}

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }

    /**
     * Retrieves description for submitted gene id
     * 
     * @param conn An active connection to the database
     * @gene_id Gene id to retrieve description for
     * @return Description for gene id, or <code>null</code> if 
     * no row found for gene_id
     * @throws SQLException if a db error occurs
     */
    public static String retrieveDescription( DBconnection conn, Long gene_id ) 
        throws SQLException {

        String description = null;
        ResultSet results = null;

        String query = 
            "SELECT description " + 
            "FROM Gene " +
            "WHERE gene_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( gene_id );

        results = conn.getResultSet();
        if ( results.next() ) {
            description = results.getString( "description" );
        }
        conn.releaseResources();
        
        return description;
    }


    //
    // Get 'em and set 'em
    //

    public void set_gene_id ( Long id ) {
        this.gene_id = id;
    }

    public Long get_gene_id() {
        return gene_id;
    }
    
    public void set_gene_model_type_id ( Long id ) {
        this.gene_model_type_id = id;
    }

    public Long get_gene_model_type_id() {
        return gene_model_type_id;
    }

    public void set_gene_model_type ( String type ) {
        this.gene_model_type = type;
    }

    public String get_gene_model_type() {
        return gene_model_type;
    }

    public void set_name ( String name ) {
        this.name = name;
    }
    
    public String get_name() {
        return name;
    }

    public void set_primary_symbol_id (Long id ){
        this.primary_symbol_id = id;
    }
    
    public Long get_primary_symbol_id(){
        return primary_symbol_id;
    }
    public void set_name_type ( String type ) {
        this.name_type = type;
    }

    public String get_name_type() {
        return name_type;
    }

    public void set_chromosome ( String chromosome ) {
        this.chromosome = chromosome;
    }

    public String get_chromosome() {
        return chromosome;
    }

    public void set_units ( String units ) {
        this.units = units;
    }

    public String get_units() {
        return units;
    }

    public void set_date_last_modified ( java.util.Date value ) {
        this.date_last_modified = value;
    }

    public java.util.Date get_date_last_modified() {
        return date_last_modified;
    }

    public void set_length ( Float length ) {
        this.length = length;
    }

    public Float get_length() {
        return length;
    }

    public void set_is_predicted ( Boolean is_predicted ) {
        this.is_predicted = is_predicted;
    }

    public Boolean get_is_predicted() {
        return is_predicted;
    }

    public void set_is_exp_verified ( Boolean is_verified ) {
        this.is_exp_verified = is_verified;
    }

    public Boolean get_is_exp_verified() {
        return is_exp_verified;
    }

    public void set_verification_method ( String method ) {
        this.verification_method = method;
    }

    public String get_verification_method() {
        return verification_method;
    }

    public void set_description ( String description ) {
        this.description = description;
    }

    public String get_description() {
        return description;
    }

    public void set_taxon_id ( Long id ) {
        this.taxon_id = id;
    }

    public Long get_taxon_id() {
        return taxon_id;
    }

    public void set_species_variant_id ( Long id ) {
        this.species_variant_id = id;
    }

    public Long get_species_variant_id() {
        return species_variant_id;
    }

    public void set_is_sequenced ( Boolean is_sequenced ) {
        this.is_sequenced = is_sequenced;
    }

    public Boolean get_is_sequenced() {
        return is_sequenced;
    }

    public void set_has_flank_sequence ( Boolean value ) {
        has_flank_sequence = value;
    }

    public Boolean get_has_flank_sequence() {
        return has_flank_sequence;
    }

    public void set_is_obsolete ( Boolean is_obsolete ) {
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
     * Retrieves gene id for submitted gene name
     *
     * @param conn An active connection to the database
     * @param name Gene name to retrieve id for
     * @return Gene id for submitted name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveGeneID( DBconnection conn, String name )
	throws SQLException {

        Long id = null;

      // adding an order by so that if the name exists whre is_obsolete = 'F'
      // we will get that gene instead of the obsoleted one. 
        String query = 
	    "SELECT gene_id " +
	    "FROM Gene " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name.toUpperCase() ) + " " +
      "ORDER BY is_obsolete ASC ";
    
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "gene_id" ) );
        }
        conn.releaseResources();

        return id;
    }

    /**
     * Retrieves gene name for submitted gene id
     *
     * @param conn An active connection to the database
     * @param name Gene id to retrieve name for
     * @return Gene name for submitted id
     * @throws RecordNotFoundException thrown if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public static String retrieveGeneName( DBconnection conn, Long id )
	throws RecordNotFoundException, SQLException {

        String name = null;
       
        String query = 
	    "SELECT name " +
	    "FROM Gene " +
	    "WHERE gene_id = ?";
    
        conn.setQuery( query );
	conn.setQueryVariable( id );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            name = results.getString( "name" );
        }
        conn.releaseResources();
        
        return name;
    }

    /**
     * Retrieves gene id for submitted map element id
     *
     * @param conn An active connection to the database
     * @param map_id  The map element id to retrieve gene_id for
     * @return Gene id for submitted map_element_id
     * @throws RecordNotFoundException thrown if no row found for submitted map_element_id
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveGeneIDUsingMapElementID( DBconnection conn, Long map_id )
	throws RecordNotFoundException, SQLException {

        Long id = null;

        String query = 
	    "SELECT gene_id " +
	    "FROM Gene " +
	    "WHERE map_element_id = ?";
    
        conn.setQuery( query );
	conn.setQueryVariable( map_id );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "gene_id" ) );
        }
        conn.releaseResources();


	if ( id == null ) {
	    throw new RecordNotFoundException( "No gene found " +
					       "with map element id : " + map_id);
	}

        return id;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** TfcGene content test ******" );
        System.out.println( "gene_id: " + get_gene_id() );
        System.out.println( "taxon_id: " + get_taxon_id() );
        System.out.println( "species_variant_id: " + 
			    get_species_variant_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "name: " + get_name() );
        System.out.println( "units: " + get_units() );
        System.out.println( "chromosome: " + get_chromosome() );
        System.out.println( "date_last_modified: " + 
			    get_date_last_modified() );
        System.out.println( "length: " + get_length() );
        System.out.println( "verification_method: " + 
			    get_verification_method() );
        System.out.println( "is_predicted: " + get_is_predicted() );
        System.out.println( "is_exp_verified: " + get_is_exp_verified() );
        System.out.println( "gene_model_type_id: " + get_gene_model_type_id() );
        System.out.println( "gene_model_type: " + get_gene_model_type() );
        System.out.println( "name_type: " + get_name_type() );
        System.out.println( "description: " + get_description() );
        System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "has_flank_sequence: " + get_has_flank_sequence() );
        System.out.println( "is_sequenced: " + get_is_sequenced() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
        System.out.println( "**** TfcGene content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 26816 );

            TfcGene gene = new TfcGene( conn, test_id );
            gene.test();

        }  catch( Exception e ) {
            e.printStackTrace();
        }
    }
}
