//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.20 $
// $Date: 2005/02/10 20:28:06 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the table NucleotideSequence in the tair database. Each 
 * instance maps one row of data in NucleotideSequence table. Each data object 
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.  
 *
 * <p>
 * Since NT sequence data is so large, this object provides constructors to 
 * instantiate object both with and without retrieving sequence data, so that 
 * overhead of retrieving data is only incurred when absolutely necessary
 */

public class TfcNucleotideSequence extends TfcTairObject {   
    
    private Long nucleotide_seq_id;
    private Long translation_tables_id;
    private String name;
    private String nucleotidesequence_type;
    private String genome_type;
    private String sequence;
    private String ic_accession;
    private String definition;
    private String genbank_gi;
    private Integer a_count;
    private Integer c_count;
    private Integer g_count;
    private Integer t_count;
    private Integer other_count;
    private Integer version;
    private Integer length;
    private java.util.Date date_made_public;
    private java.util.Date date_last_modified;
    private Boolean is_cds;
    private Boolean cds_is_full_length;
    private Boolean cds_is_transpliced;
    private Boolean cds_is_est;
    private String sequence_class;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcNucleotideSequence
     */
    public TfcNucleotideSequence() { 
	super();
    }


    /**
     * Creates an instance of TfcNucleotideSequence that contains all data
     * for the submitted nucleotide sequence id except for the NT sequence text
     * itself. This version of the constructor should be used when information
     * is needed about the sequence, but the actual sequence is not required.
     *
     * @param conn An active connection to the database
     * @param nucleotide_seq_id the object id of a row in the NucleotideSequence
     * table
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database 
     *  error
     */
    public TfcNucleotideSequence( DBconnection conn, Long nucleotide_seq_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, nucleotide_seq_id );
    }


    /**
     * Creates an instance of TfcNucleotideSequence that contains all data
     * for the submitted nucleotide sequence id, optionally including the 
     * NT sequence text itself.
     *
     * @param connection An active connection to the database
     * @param nucleotide_seq_id the object id of a row in the NucleotideSequence table
     * @param getSequence If <code>true</code>, full sequence will be retrieved; if 
     * <code>false</code> sequence will not be retrieved
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TfcNucleotideSequence( DBconnection conn, 
				  Long nucleotide_seq_id, 
				  boolean getSequence ) 
	throws RecordNotFoundException, SQLException {       

	super( conn, nucleotide_seq_id );

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
	
	// set textsize to handle large field
	//conn.setQuery( "set textsize 100000000" ); 
	//conn.executeUpdate();

	String query = 
	    "SELECT sequence " +
	    "FROM NucleotideSequence " +
	    "WHERE nucleotide_seq_id = ?";
	conn.setQuery( query );
	conn.setQueryVariable( get_nucleotide_seq_id() );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    set_sequence( results.getString( "sequence" ) );
	}
	conn.releaseResources();
    }


    /**
     * Implements abstract method in superclass to return "NucleotideSequence"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "NucleotideSequence";
    }

    /**
     * Implements abstract method in superclass to return "nucleotide_seq_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "nucleotide_seq_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all NucleotideSequence specific columns to be included in SQL SELECT
     * statement when populating object.
     *
     * @return String array of all NucleotideSequence specific columns to 
     * include in SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "nucleotide_seq_id",
	    "translation_tables_id",
	    "nucleotidesequence_type",
	    "name",
	    "genome_type",
	    "a_count",
	    "c_count",
	    "g_count",
	    "t_count",
	    "length",
	    "other_count",
	    "ic_accession",
	    "definition",
	    "genbank_gi",
	    "version",
	    "date_made_public",
	    "date_last_modified",
	    "is_cds",
	    "cds_is_full_length",
	    "cds_is_transpliced",
	    "cds_is_est",
	    "date_entered",
	    "original_name",
	    "sequence_class"
	};

	return localClassColumns;
    }


    /**
     * Retrieves NucleotideSequence specific data from result set and store 
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "nucleotide_seq_id" );
	if ( !results.wasNull() ) {
	    set_nucleotide_seq_id( new Long( id ) );
	}
	
	id = results.getLong( "translation_tables_id" );
	if ( !results.wasNull() ) {
	    set_translation_tables_id( new Long( id ) );
	}
	
	set_nucleotidesequence_type( results.getString( "nucleotidesequence_type" ) );
	set_name( results.getString( "name" ) );
	set_genome_type( results.getString( "genome_type" ) );
	
	int i = results.getInt( "a_count" );
	if ( !results.wasNull() ) {
	    set_a_count( new Integer( i ) );
	}
	
	i = results.getInt( "c_count" );
	if ( !results.wasNull() ) {
	    set_c_count( new Integer( i ) );
	}
	
	i = results.getInt( "g_count" );
	if ( !results.wasNull() ) {
	    set_g_count( new Integer( i ) );
	}
	
	i = results.getInt( "t_count" );
	if ( !results.wasNull() ) {
	    set_t_count( new Integer( i ) );
	}
	
	i = results.getInt( "other_count" );
	if ( !results.wasNull() ) {
	    set_other_count( new Integer( i ) );
	}
	
	i = results.getInt( "length" );
	if ( !results.wasNull() ) {
	    set_length( new Integer( i ) );
	}
	
	set_ic_accession( results.getString( "ic_accession" ) );
    set_definition( DBconnection.getClob(results, "definition") );
	
	set_genbank_gi( results.getString( "genbank_gi" ) );   
	
	i = results.getInt( "version" );
	if ( !results.wasNull() ) {
	    set_version( new Integer( i ) );
	}
	
	set_date_made_public( results.getDate( "date_made_public" ) ); 
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	
	set_is_cds( 
	    TextConverter.stringToBoolean( results.getString( "is_cds" ) ) );

	set_cds_is_full_length( 
	    TextConverter.stringToBoolean( 
		results.getString( "cds_is_full_length" ) ) );

	set_cds_is_transpliced( 
	    TextConverter.stringToBoolean( 
		results.getString( "cds_is_transpliced" ) ) );

	set_cds_is_est( 
	    TextConverter.stringToBoolean( 
		results.getString( "cds_is_est" ) ) );

	set_sequence_class( results.getString( "sequence_class" ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }

    
    /**
     * Retrieves nucleotide seq id for submitted name
     *
     * @param conn An active connection to the database
     * @return Nucleotide seq id for submitted name, or <code>null</code>
     * if no row found for name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveNucleotideSeqID( DBconnection conn, 
						String name ) 
	throws SQLException {

        Long id = null;
        ResultSet results = null;

        String query = 
            "SELECT nucleotide_seq_id " +
            "FROM NucleotideSequence " +
	    "WHERE name = " +
	    TextConverter.dbQuote( name );
    
        conn.setQuery( query );

        results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "nucleotide_seq_id" ) );
        }
        conn.releaseResources();

        return id;
    }


    //
    // Get 'em and set 'em
    //
    
    public void set_nucleotide_seq_id( Long value ) { 
	nucleotide_seq_id = value; 
    }

    public Long get_nucleotide_seq_id() { 
	return nucleotide_seq_id; 
    }

    public void set_translation_tables_id( Long value ) { 
	translation_tables_id = value; 
    }

    public Long get_translation_tables_id() { 
	return translation_tables_id; 
    }

    public void set_name( String value ) { 
	name = value; 
    }

    public String get_name() {
	return name; 
    }

    public void set_nucleotidesequence_type( String value ) { 
	nucleotidesequence_type = value; 
    }

    public String get_nucleotidesequence_type() { 
	return nucleotidesequence_type; 
    }

    public void set_genome_type( String value ) {
	genome_type = value; 
    }

    public String get_genome_type() {
	return genome_type; 
    }

    public void set_sequence( String value ) {
	sequence = value; 
    }

    public String get_sequence() { 
	return sequence; 
    }

    public void set_ic_accession( String value ) { 
	ic_accession = value; 
    }

    public String get_ic_accession() { 
	return ic_accession; 
    }

    public void set_definition( String value ) { 
	definition = value; 
    }

    public String get_definition() { 
	return definition; 
    }

    public void set_genbank_gi( String value ) { 
	genbank_gi = value; 
    }

    public String get_genbank_gi() { 
	return genbank_gi; 
    }

    public void set_a_count( Integer value ) { 
	a_count = value; 
    }

    public Integer get_a_count() {
	return a_count; 
    }

    public void set_c_count( Integer value ) { 
	c_count = value; 
    }

    public Integer get_c_count() { 
	return c_count; 
    }

    public void set_g_count( Integer value ) { 
	g_count = value; 
    }

    public Integer get_g_count() {
	return g_count; 
    }

    public void set_t_count( Integer value ) { 
	t_count = value; 
    }

    public Integer get_t_count() { 
	return t_count; 
    }

    public void set_other_count( Integer value ) { 
	other_count = value; 
    }

    public Integer get_other_count() {
	return other_count; 
    }

    public void set_length( Integer value ) { 
	length = value; 
    }

    public Integer get_length() { 
	return length; 
    }

    public void set_version( Integer value ) { 
	version = value; 
    }

    public Integer get_version() { 
	return version; 
    }

    public void set_date_made_public( java.util.Date value ) { 
	date_made_public = value; 
    }

    public java.util.Date get_date_made_public() { 
	return date_made_public; 
    }

    public void set_date_last_modified( java.util.Date value ) { 
	date_last_modified = value; 
    }

    public java.util.Date get_date_last_modified() {
	return date_last_modified; 
    }

    public void set_is_cds( Boolean value ) { 
	is_cds = value; 
    }

    public Boolean get_is_cds() {
	return is_cds; 
    }

    public void set_cds_is_full_length( Boolean value ) { 
	cds_is_full_length = value; 
    }

    public Boolean get_cds_is_full_length() { 
	return cds_is_full_length; 
    }

    public void set_cds_is_transpliced( Boolean value ) { 
	cds_is_transpliced = value; 
    }

    public Boolean get_cds_is_transpliced() { 
	return cds_is_transpliced; 
    }

    public void set_cds_is_est( Boolean value ) { 
	cds_is_est = value; 
    }

    public Boolean get_cds_is_est() { 
	return cds_is_est; 
    }

    public void set_sequence_class( String sequence_class ) { 
	this.sequence_class = sequence_class; 
    }

    public String get_sequence_class() { 
	return sequence_class; 
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
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** TfcNucleotideSequence content test ******" );
	System.out.println( "nucleotide_seq_id: " + get_nucleotide_seq_id() );
	System.out.println( "translation_tables_id: " + 
			    get_translation_tables_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "nucleotidesequence_type: " + get_nucleotidesequence_type() );
	System.out.println( "genome_type: " + get_genome_type() );
	System.out.println( "ic_accession: " + get_ic_accession() );
	System.out.println( "definition: " + get_definition() );
	System.out.println( "genbank_gi: " + get_genbank_gi() );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "sequence: " + get_sequence() );
	System.out.println( "a_count: " + get_a_count() );
	System.out.println( "c_count: " + get_c_count() );
	System.out.println( "g_count: " + get_g_count() );
	System.out.println( "t_count: " + get_t_count() );
	System.out.println( "other_count: " + get_other_count() );
	System.out.println( "length: " + get_length() );
	System.out.println( "version: " + get_version() );
	System.out.println( "date_made_public: " + get_date_made_public() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "is_cds: " + get_is_cds() );
	System.out.println( "cds_is_full_length: " + get_cds_is_full_length() );
	System.out.println( "cds_is_transpliced: " + get_cds_is_transpliced() );
	System.out.println( "cds_is_est: " + get_cds_is_est() );
	System.out.println( "sequence class: " + get_sequence_class() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcNucleotideSequence content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 6 );
	    TfcNucleotideSequence nucleotide_sequence = 
		new TfcNucleotideSequence( conn, id );
	    nucleotide_sequence.test();

	    nucleotide_sequence = new TfcNucleotideSequence( conn, id, true );
	    nucleotide_sequence.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}   
    }

}
