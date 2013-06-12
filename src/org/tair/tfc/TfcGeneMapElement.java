//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/07/07 15:35:43 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Gene_MapElement table in the tair database. Each 
 * instance maps one row of data in Gene_MapElement table. Each data object maps
 * to one field of a row in the table.
 */

public class TfcGeneMapElement {

    private Long gene_id;
    private Long map_element_id;
    private String relationship_type;
    private String gene_feature_site;
    private java.util.Date date_last_modified;

    /**
     * Creates an empty instance of TfcGeneMapElement
     */
    public TfcGeneMapElement() { }

  
    /**
     * Creates an instance of TfcGeneMapElement that represents the
     * relationship between submitted gene id and map element id
     *
     * @param conn An active connection to the database
     * @param gene_id Gene id to retrieve data for
     * @param map_element_id Map element id to retrieve data for
     * @throws RecordNotFoundException if no record found for submitted ids
     * @throws SQLException if a database error occurs
     */
    public TfcGeneMapElement( DBconnection conn, 
			      Long gene_id, 
			      Long map_element_id ) 
	throws SQLException {


	String query =
	    "SELECT gene_id, " +
	    "map_element_id, " +
	    "relationship_type, " +
	    "gene_feature_site, " +
	    "date_last_modified " +
	    "FROM Gene_MapElement " +
	    "WHERE gene_id = ? " +
	    "AND map_element_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, gene_id );
	conn.setQueryVariable( 2, map_element_id );
    
	ResultSet results = conn.getResultSet();
	boolean found = results.next();
	if ( found ) {
	    this.gene_id = gene_id;
	    this.map_element_id = map_element_id;
	    this.relationship_type = results.getString( "relationship_type" );
	    this.gene_feature_site = results.getString( "gene_feature_site" );
	    this.date_last_modified = results.getDate( "date_last_modified" );
	}
	conn.releaseResources();
    
	if ( !found ) {
	    throw new RecordNotFoundException( "No row found for " +
					       "gene id: " + gene_id + 
					       " and map element id: " +
					       map_element_id );
	}
    }



    public Long get_gene_id() { 
	return gene_id; 
    }

    public Long get_map_element_id() {
	return map_element_id; 
    }

    public String get_relationship_type() {
	return relationship_type; 
    }

    public String get_gene_feature_site() { 
	return gene_feature_site;
    }

    public java.util.Date get_date_last_modified() {
	return date_last_modified; 
    }

    public void set_gene_id( Long id ) { 
	this.gene_id = id;
    }

    public void set_map_element_id( Long id ) {
	this.map_element_id = id; 
    }

    public void set_relationship_type( String type ) {
	this.relationship_type = type;
    }

    public void set_gene_feature_site( String type ) {
	this.gene_feature_site = type;
    }

    public void set_date_last_modified( java.util.Date date ) {
	this.date_last_modified = date;
    }


    /**
     * Stores association between gene and map element as an INSERT
     * or UPDATE depending on if a row already exists for this combination
     * of gene id and map element id.
     *
     * @param conn A database connection with INSERT/UPDATE/DELETE privileges
     * @throws InvalidActionException if required data has not been set
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// throw exception if required data is invalid or missing 
	validate();

	// set date last modified to now for either action
	set_date_last_modified( new java.util.Date() );

	if ( exists( conn ) ) {
	    update( conn );
	} else {
	    insert( conn );
	}
    }

    /** 
     * Inserts a new row into Gene_MapElement containing contents of
     * object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	// create insert w/out SELECT @@IDENTITY since join table has
	// no primary key
	String query = 
	    StoreUtils.createInsertStatement( "Gene_MapElement", 
					      getColumnValuesMap( false ));
	conn.setQuery( query );
	conn.executeUpdate();
	conn.releaseResources();
    }

    /** 
     * Determines if a row exists in Gene_MapElement with this combination
     * of germplasm and map element ids
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @return <code>true</code> if a row found with this combination of ids,
     * <code>false</code> if no row found with this combination of ids
     * @throws SQLException if a database error occurs
     */
    private boolean exists( DBconnection conn )throws SQLException {
	boolean exists = false;

	String query = 
	    "SELECT COUNT(*) " +
	    "FROM Gene_MapElement " +
	    "WHERE gene_id = ? " +
	    "AND map_element_id = ? ";
	
	conn.setQuery( query );
	conn.setQueryVariable( 1, get_gene_id() );
	conn.setQueryVariable( 2, get_map_element_id() );
	
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    if ( results.getInt( 1 ) > 0 ) {
		exists = true;
	    }
	}
	conn.releaseResources();

	return exists;
    }

    /** 
     * Updates an existing row in Gene_MapElement with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {
	
	// create map of primary key column names and values to use
	// for creating update statement with composite primary key
	Map keysMap = new HashMap();
	keysMap.put( "gene_id", get_gene_id() );
	keysMap.put( "map_element_id", get_map_element_id() );
	
	String query = 
	    StoreUtils.createUpdateStatement( "Gene_MapElement",
					      keysMap,
					      getColumnValuesMap( true ) );
	
	conn.setQuery( query );	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated --- shouldn't happen, since presumably
	// we just checked to make sure row exists
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"Gene_MapElement UPDATE failed: " +
		"no row found for gene id: " + 
		get_gene_id() + " " +
		"and map element id: " + get_map_element_id();
	    throw new RecordNotFoundException( msg );
	}
    }



    /**
     * Retrieves values to store for this class as a Map of column names
     * and values to store for each column using current values of member 
     * variables. This Map can be used by utility methods defined in StoreUtils
     * to create INSERT and UPDATE SQL statements.
     *
     * <p>
     * Column names and values must be stored in Map as String. Values must be 
     * stored with any quotation marks around values included in String so
     * that they can be directly included in SQL created in utility class.
     *
     * <p>
     * If method is called to get values for an UPDATE, germplasm id
     * and map element id will not be included in returned map since they
     * represent primary key values used for identifying row in table.
     *
     * @param update If <code>true</code> returned values will be used
     * for an UPDATE, meaning primary key values will not be included 
     * in map; if <code>false</code> returned values will be used for
     * an INSERT, meaning primary key values must be included
     * @return Map of column names for table as String keys referencing
     * values for each column name.  
     */
    private Map getColumnValuesMap( boolean update ) {
	Map columnValues = new HashMap();
	
	if ( !update ) {
	    columnValues.put( "gene_id", 
			      TextConverter.dbQuote( get_gene_id() ) );

	    columnValues.put( "map_element_id", 
			      TextConverter.dbQuote( get_map_element_id() ) );
	}

	columnValues.put( "relationship_type", 
			  TextConverter.dbQuote( get_relationship_type() ) );

	columnValues.put( "gene_feature_site",
			  TextConverter.dbQuote( get_gene_feature_site() ) );

	columnValues.put( "date_last_modified",
			  TextConverter.dbQuote( get_date_last_modified(), 
						 "mm/dd/yyyy") );
	
	return columnValues;

    }


    /**
     * Ensures that data required for storing to database has been 
     * properly set
     *
     * @throws InvalidActionException if required data is invalid or missing
     */
    private void validate() throws InvalidActionException {

	if ( get_gene_id() == null ||
	     get_map_element_id() == null ) {

	    String errMsg = 
		"Cannot store Gene_MapElement with " + 
		"gene id: " + get_gene_id() + 
		" and map_element_id: " + get_map_element_id();

	    throw new InvalidActionException( errMsg );
	}
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "gene_id: " + get_gene_id() );
	System.out.println( "map_element_id: " + get_map_element_id() );
	System.out.println( "relationship_type: " + get_relationship_type() );
	System.out.println( "gene_feature_site: " + get_gene_feature_site() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {
	    DBconnection conn = new DBconnection();
	    Long geneID = new Long( 37650 );
	    Long mapElementID = new Long( 114 );
	    TfcGeneMapElement geneMapElement = 
		new TfcGeneMapElement( conn, geneID, mapElementID );

	    geneMapElement.test();
      
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }


}


