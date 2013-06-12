//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.18 $
// $Date: 2005/02/10 20:28:06 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * This class maps to the Locus table in the tair database. Each instance 
 * represents one row of data; each member variable maps to a column of a 
 * row in the table.
 */

public class TfcLocus extends TfcMapElement {   

    private Long locus_id;
    private String tmp_name;
    private String tmp_full_name;
    private String name;
    private Long rep_genemodel_id;
    private Long taxon_id;
    private Long species_variant_id;
    private Boolean is_sequenced;
    private java.util.Date date_last_modified;
    private Boolean is_obsolete;
    private String chromosome;
    private String original_name;
    private java.util.Date date_entered;
    //these are made up of the composite set of coordinates from the gene model(s) at
    // locus
    private Long span_start_position;
    private Long span_end_position;

    /**
     * Creates an empty instance of TfcLocus
     */
    public TfcLocus() { 
	super();
    }

    /**
     * Creates an instance of TfcLocus that reflects that data referenced by
     * submitted locus_id
     *
     * @param conn An active connection to the database
     * @param locus_id Locus id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcLocus( DBconnection conn, Long locus_id ) 
	throws RecordNotFoundException, SQLException {
	super( conn, locus_id );
  }

    /**
     * Implements abstract method in superclass to return "Locus" as name of 
     * database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Locus";
    }

    /**
     * Implements abstract method in superclass to return "locus_id" as name 
     * of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "locus_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Locus specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all Locus specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
	    "locus_id",
	    "name," +
	    "tmp_name",
	    "tmp_full_name",
	    "rep_genemodel_id",
	    "taxon_id",
	    "species_variant_id",
	    "date_last_modified",
	    "is_sequenced",
	    "chromosome",
	    "date_entered",
	    "original_name",
	    "is_obsolete"
	};
	
	return localClassColumns;
    }
    
    
    /**
     * Retrieves Locus specific data from result set and stores in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_locus_id( new Long( results.getLong( "locus_id" ) ) );
	set_name( results.getString( "name" ) );
	set_tmp_name( results.getString( "tmp_name" ) );
	set_tmp_full_name( results.getString( "tmp_full_name" ) );

	long id = results.getLong( "rep_genemodel_id" );
	if ( !results.wasNull() ) {
	    set_rep_genemodel_id( new Long( id ) );
	}     
      
	id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	    set_taxon_id( new Long( id ) );
	}     
      
	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ) {
	    set_species_variant_id( new Long( id ) );
	}     
      
	set_date_last_modified( results.getDate( "date_last_modified" ) );

	set_is_sequenced( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_sequenced" ) ) );

	set_chromosome( results.getString( "chromosome" ) );
	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }
  
    /**
     * Retrieves locus name for submitted locus_id
     *
     * @param conn An active connection to the database
     * @param locus_id Locus id to retrieve data for
     * @return Locus name for locus_id, or <code>null</code> if no row found
     *  for locus_id
     * @throws SQLException thrown if a database error occurs
     */
    public static String retrieveLocusName( DBconnection conn, Long locus_id ) 
	throws SQLException {

	String name = null;
	
	String query = 
	    "SELECT name " +
	    "FROM Locus " +
	    "WHERE locus_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( locus_id );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    name = results.getString( "name" );
	}
	conn.releaseResources();

	return name;
    }
   
    
    public void populateSpan(DBconnection conn, Long locus_id) throws SQLException
    {
    	String query = "SELECT start_position,end_position,g.gene_id,g.map_element_id FROM " +
    			"Gene g,MapElement_Locus l,GlobalAssignment ga WHERE g.map_element_id=l.map_element_id and " +
    			"l.map_element_id=ga.map_element_id " +
    			"and g.is_obsolete=\'F\' and ga.is_obsolete=\'F\' and l.locus_id = ?";
    	
    	conn.setQuery(query);
    	conn.setQueryVariable( locus_id );
    	ResultSet results = conn.getResultSet();
    	this.span_start_position=Long.MAX_VALUE;
    	this.span_end_position=Long.MIN_VALUE;
    	while( results.next() )
    	{
    	    long tstart = (long) results.getFloat("start_position");
    	    long tend = (long) results.getFloat("end_position");
    	    if(tstart < this.span_start_position.longValue())
    	    {
    	    	this.span_start_position=tstart;
    	    }
    	    if(tend > this.span_end_position.longValue())
    	    {
    	    	this.span_end_position=tend;
    	    }
    	}
    	conn.releaseResources();
    }
	

    // 
    // Get 'em and set 'em
    //

    public void set_locus_id( Long id ) { 
	this.locus_id = id; 
    }

    public Long get_locus_id() {
	return locus_id; 
    }

    public void set_tmp_name( String name ) { 
	this.tmp_name = name; 
    }

    public String get_tmp_name() { 
	return tmp_name; 
    }

    public void set_tmp_full_name( String name ) { 
	this.tmp_full_name = name; 
    }

    public String get_tmp_full_name() { 
	return tmp_full_name; 
    }

    public void set_name( String name ) { 
	this.name = name; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_rep_genemodel_id( Long id ) { 
	this.rep_genemodel_id = id; 
    }

    public Long get_rep_genemodel_id() { 
	return rep_genemodel_id; 
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

    public void set_date_last_modified( java.util.Date date ) {
	this.date_last_modified = date; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
	this.is_obsolete = is_obsolete; 
    }

    public Boolean get_is_obsolete() {
	return is_obsolete; 
    }

    public void set_chromosome( String chromosome ) { 
	this.chromosome = chromosome; 
    }

    public String get_chromosome() { 
	return chromosome; 
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
     * Retrieves locus id for submitted locus name
     *
     * @param conn An active connection to the database
     * @param name Locus name to retrieve id for
     * @return Locus id for submitted name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveLocusID( DBconnection conn, String name )
	throws SQLException {

        Long id = null;

        String query = 
	    "SELECT locus_id " +
	    "FROM Locus " +
	    "WHERE upper(name) = upper(" +
	    TextConverter.dbQuote( name ) + ")";
    
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "locus_id" ) );
        }
        conn.releaseResources();

        return id;
    }

    /**
     * For unit testing only 
     */
    public void test() {
	super.test();
	System.out.println( "****** TfcLocus content test ****** " );
	System.out.println( "locus_id: " + get_locus_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "tmp_name: " + get_tmp_name() );
	System.out.println( "tmp_full_name: " + get_tmp_full_name() );
	System.out.println( "rep_genemodel_id: " + get_rep_genemodel_id() );
	System.out.println( "taxon_id: " + get_taxon_id() );
	System.out.println( "species_variant_id: " + get_species_variant_id() );
	System.out.println( "chromosome is: " + get_chromosome() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "is_sequenced: " + get_is_sequenced() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcLocus content test end **** " );         
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try {

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 26566 );
	    TfcLocus locus = new TfcLocus( conn, id );
	    locus.test();


	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

	public Long getSpan_start_position() {
		return span_start_position;
	}
	
	public Long getSpan_end_position() {
		return span_end_position;
	}
}
