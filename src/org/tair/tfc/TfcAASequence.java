//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.21 $
// $Date: 2005/02/10 20:28:03 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/** 
 * This class maps to the AASequence table in the tair database. Each instance
 * maps one row of data in AASequence table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.  
 *
 * <p>
 * Since AA sequence data is so large, this object provides constructors to 
 * instantiate object both with and without retrieving sequence data, so that 
 * overhead of retrieving data is only incurred when absolutely necessary
 */

public class TfcAASequence extends TfcTairObject {   

    private Long aa_sequence_id;
    private String type;
    private String name;
    private String sequence;
    private String description;
    private String genbank_definition;
    private Boolean is_obsolete;
    private String genbank_gi;
    private String genbank_protein_id;
    private String swissprot_id;
    private String uniprot_id;
    private String trembl_id;
    private String ec_number;
    private String PIR_accession;
    private Integer version;
    private Boolean is_experimental;
    private Boolean is_modified;
    private Float calc_MW;
    private Float calc_pI;
    private Integer length;
    private java.util.Date date_last_modified;
    private java.util.Date date_made_public;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcAASequence
     */
    public TfcAASequence() { 
        super();
    }

    /**
     * Creates an instance of TfcAASequence that contains all data for the 
     * amino acid with the submitted tair object id except for the AA sequence
     * text itself. This version of the constructor should be used when 
     * information is needed about the sequence, but the actual sequence is 
     * not required.
     *
     * @param conn An active connection to the database
     * @param tair_object_id the object id of a row in the AASequence table
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcAASequence( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {
        super( conn, tair_object_id );
    }


    /**
     * Creates an instance of TfcAASequence that contains all data
     * for the submitted tair object id, optionally including the 
     * AA sequence text itself.
     *
     * @param conn An active connection to the database
     * @param tair_object_id the object id of a row in the AASequence table
     * @param getSequence If <code>true</code>, full sequence will be retrieved;
     * if <code>false</code> sequence will not be retrieved
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database 
     * error
     */
    public TfcAASequence( DBconnection conn, 
                          Long tair_object_id, 
                          boolean getSequence ) 
	throws RecordNotFoundException, SQLException {

        super( conn, tair_object_id );
	
	// If sequence text is needed, execute separate SELECT just
	// to get it.  Given setup of object population that occurs
	// in superclass constructor, this has to be done separately
	// since we have no way of optionally including sequence column
	// in column list (since super() has to be first statement in
	// consructor)
        if ( getSequence ) {
	    loadSequence( conn );
	}
    }

    /**
     * Loads sequence text and stores it in member variable. Due to
     * the size of sequence data, this field is never retrieved in the
     * initial SELECT that populates this object.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void loadSequence( DBconnection conn ) 
	throws SQLException {
	
	String query = 
	    "SELECT sequence " +
	    "FROM AASequence " +
	    "WHERE tair_object_id = ? AND is_obsolete = 'F'";
	conn.setQuery( query );
	conn.setQueryVariable( get_tair_object_id() );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    set_sequence( results.getString( "sequence" ) );
	}
	conn.releaseResources();
    }


    /**
     * Implements abstract method in superclass to return "AASequence" as name 
     * of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "AASequence";
    }

    /**
     * Implements abstract method in superclass to return "tair_object_id" as name
     * of primary key column to use when creating SQL statement for object 
     * population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "tair_object_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all AASequence specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all columns to include in SELECT statment
     * when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "aa_sequence_id", 
	    "aasequence_type", 
	    "name", 
	    "description", 
	    "genbank_definition", 
	    "is_obsolete", 
	    "genbank_gi", 
	    "genbank_protein_id", 
	    "swissprot_id", 
        "uniprot_id",
	    "trembl_id", 
	    "ec_number", 
	    "PIR_accession", 
	    "version", 
	    "is_experimental", 
	    "is_modified", 
	    "calc_MW", 
	    "calc_pI", 
	    "length", 
	    "date_last_modified", 
	    "date_made_public",
	    "date_entered",
	    "original_name"
	};

	return localClassColumns;
    }


    /**
     * Retrieves AASequence specific data from result set and stores in member 
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "aa_sequence_id" );
	if ( !results.wasNull() ) {
	    set_aa_sequence_id( new Long( id ) );
	}
	
	int i = results.getInt( "version" );
	if ( !results.wasNull() ) {
	    set_version( new Integer( i ) );
	}            
	
	i = results.getInt( "length" );
	if ( !results.wasNull() ) {
	    set_length( new Integer( i ) );
	}
	    
	set_name( results.getString( "name" ) );
	set_genbank_definition( results.getString( "genbank_definition" ) );

	set_is_obsolete(
	    TextConverter.stringToBoolean( results.getString( "is_obsolete" ) ) );

	set_genbank_gi( results.getString( "genbank_gi" ) );
	set_genbank_protein_id( results.getString( "genbank_protein_id" ) );
	set_date_made_public(  results.getDate( "date_made_public" ) ); 
	set_date_last_modified( results.getDate( "date_last_modified" ) );

	set_is_experimental( 
	    TextConverter.stringToBoolean( results.getString( "is_experimental" ) ) );

	set_is_modified( 
	    TextConverter.stringToBoolean( results.getString( "is_modified" ) ) );

	set_type( results.getString( "aasequence_type" ) );
	set_description( results.getString( "description" ) );
	set_PIR_accession( results.getString( "PIR_accession" ) );
	
	set_swissprot_id( results.getString( "swissprot_id" ) );
    set_uniprot_id( results.getString( "uniprot_id" ));
	set_trembl_id( results.getString( "trembl_id" ) );
	set_ec_number( results.getString( "ec_number" ) );
	
	float f = results.getFloat( "calc_MW" );
	if ( !results.wasNull() ) {
	    set_calc_MW( new Float( f ) );
	}
	
	f = results.getFloat( "calc_pI" );
	if ( !results.wasNull() ) {
	    set_calc_pI( new Float( f ) );
	}

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }
  
    public void set_aa_sequence_id ( Long value ) { 
	aa_sequence_id = value; 
    }

    public Long get_aa_sequence_id() { 
	return aa_sequence_id; 
    }

    public void set_sequence ( String value ) { 
	sequence = value; 
    }

    public String get_sequence() { 
	return sequence; 
    }
    
    public void set_name ( String value ) {
	name = value; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_type ( String value ){ 
	type = value; 
    }

    public String get_type() { 
	return type; 
    }

    public void set_description ( String value ) {
	description = value; 
    }

    public String get_description() { 
	return description; 
    }

    public void set_PIR_accession ( String value ) { 
	PIR_accession = value; 
    }

    public String get_PIR_accession() { 
	return PIR_accession; 
    }
    
    public void set_genbank_definition ( String value ) { 
	genbank_definition = value; 
    }

    public String get_genbank_definition() { 
	return genbank_definition; 
    }

    public void set_is_obsolete ( Boolean value ) { 
	is_obsolete = value; 
    }

    public Boolean get_is_obsolete() { 
	return is_obsolete; 
    }
    
    public void set_genbank_gi ( String value ) { 
	genbank_gi = value; 
    }

    public String get_genbank_gi() {
	return genbank_gi; 
    }
    
    public void set_genbank_protein_id ( String value ) { 
	genbank_protein_id = value; 
    }

    public String get_genbank_protein_id() { 
	return genbank_protein_id; 
    }

    public void set_version ( Integer value ) { 
	version = value; 
    }

    public Integer get_version() { 
	return version; 
    }
    
    public void set_date_last_modified ( java.util.Date value ) { 
	date_last_modified = value; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }
    
    public void set_date_made_public ( java.util.Date value ) { 
	date_made_public = value;
    }

    public java.util.Date get_date_made_public() { 
	return date_made_public; 
    }

    public void set_is_experimental ( Boolean value ) { 
	is_experimental = value; 
    }

    public Boolean get_is_experimental() {
	return is_experimental; 
    }

    public void set_is_modified ( Boolean value ) {
	is_modified = value; 
    }

    public Boolean get_is_modified() {
	return is_modified; 
    }

    public void set_swissprot_id( String id ) {
	swissprot_id = id; 
    }
 
    public String get_swissprot_id() { 
	return swissprot_id; 
    }
    
    public void set_uniprot_id( String id ) {
    uniprot_id = id; 
    }
     
    public String get_uniprot_id() { 
    return uniprot_id; 
    }

    public void set_trembl_id( String id ) { 
	trembl_id = id; 
    }

    public String get_trembl_id() { 
	return trembl_id; 
    }

    public void set_ec_number( String number ) { 
	ec_number = number; 
    }

    public String get_ec_number() { 
	return ec_number; 
    }

    public void set_calc_MW( Float value ) { 
	calc_MW = value; 
    }

    public Float get_calc_MW() { 
	return calc_MW; 
    }

    public void set_calc_pI( Float value ) { 
	calc_pI = value; 
    }

    public Float get_calc_pI() { 
	return calc_pI; 
    }

    public void set_length( Integer value ) { 
	length = value; 
    }

    public Integer get_length() { 
	return length; 
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
     * Retrieves tair object id for submitted AA sequence name
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve id for
     * @return Tair object id for submitted name
     * @throws RecordNotFoundException thrown if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveTairObjectID( DBconnection conn, String name )
	throws RecordNotFoundException, SQLException {

        Long id = null;

        String query = 
	    "SELECT tair_object_id " +
	    "FROM AASequence " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name ) +
	    " AND is_obsolete = 'F'";
    
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "tair_object_id" ) );
        }
        conn.releaseResources();


	if ( id == null ) {
	    throw new RecordNotFoundException( "No AA sequence found " +
					       "with name: " + name );
	}

        return id;
    }    


    /**
     * For unit testing only
     */
    public void test() {
        super.test();

        System.out.println( "****** TfcAASequence content test ******" );
        System.out.println( "aa_sequence_id: " + get_aa_sequence_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "sequence: " + get_sequence() );
        System.out.println( "genbank_definition: " + get_genbank_definition() );
        System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "genbank_gi: " + get_genbank_gi() );
        System.out.println( "genbank_protein_id: " + get_genbank_protein_id() );
        System.out.println( "date_made_public: " + get_date_made_public() );
        System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "version: " + get_version() );
        System.out.println( "is_experimental: " + get_is_experimental() );  
        System.out.println( "is_modified: " + get_is_modified() );    
        System.out.println( "type: " + get_type() );    
        System.out.println( "PIR_accession: " + get_PIR_accession() );
        System.out.println( "description: " + get_description() );   
        System.out.println( "swissprot_id: " + get_swissprot_id() );
        System.out.println( "uniprot_id: " + get_uniprot_id() );
        System.out.println( "trembl_id: " + get_trembl_id() );
        System.out.println( "ec_number: " + get_ec_number() );
        System.out.println( "calc_MW: " + get_calc_MW() );
        System.out.println( "calc_pI: " + get_calc_pI() );
        System.out.println( "length: " + get_length() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
        System.out.println( "**** TfcAASequence content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 3987107 );
            TfcAASequence aa_sequence = new TfcAASequence( conn, id, true );
            aa_sequence.test();
        } catch (Exception e ) {
            e.printStackTrace();
        }

    }  

}
