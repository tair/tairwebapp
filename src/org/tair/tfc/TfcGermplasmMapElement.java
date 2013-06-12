//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2006/01/18 00:11:22 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.io.Serializable;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class map to the Germplasm_MapElement table in the tair database. Each
 * instance maps one row of data in Germplasm_MapElement table. Each data 
 * object maps to one field of a row in the table. Each field has one set 
 * method and  one get method for accessing from outside of class.
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */

public class TfcGermplasmMapElement implements Serializable {   

    private Long germplasm_id;
    private Long map_element_id;
    private String genotype;
    private String segregation_ratio;

    /**
     * Creates an empty instance of TfcGermplasmMapElement
     */
    public TfcGermplasmMapElement() { }

    /**
     * Creates an instance of TfcGermplasmMapElement that reflects
     * the data for the relationship between submitted germplasm_id
     * and map_element_id
     *
     * @param conn An active connection to the database
     * @param germplasm_id Germplasm id to retrieve data for
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs, or if no
     * row found for germplasm_id and map_element_id
     */
    public  TfcGermplasmMapElement( DBconnection conn, 
				    Long germplasm_id, 
				    Long map_element_id ) 
	throws SQLException {

	String query =
	    "SELECT germplasm_id, " +
	    "map_element_id, " +
	    "genotype, " +
	    "segregation_ratio " +
	    "FROM Germplasm_MapElement " +
	    "WHERE map_element_id = ? " +
	    "AND germplasm_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, map_element_id );
	conn.setQueryVariable( 2, germplasm_id );
	
	ResultSet results = conn.getResultSet();
	boolean found = results.next();
	if ( found ) {
	    long id = results.getLong( "germplasm_id" );
	    if ( !results.wasNull() ) {
		this.germplasm_id = new Long( id );
	    }
	    
	    id = results.getLong( "map_element_id" );
	    if ( !results.wasNull() ) {
		this.map_element_id = new Long( id );
	    }
	    
	    this.genotype = results.getString( "genotype" );
	    this.segregation_ratio = results.getString( "segregation_ratio" );
	}
	conn.releaseResources();
	
	if ( !found ) {
	    throw new RecordNotFoundException( "No relationship found " +
					       "between germplasm_id " + 
					       germplasm_id +
					       " and map element id " + 
					       map_element_id );
	}
    }
    
    //
    // Get 'em and set 'em
    //

    public void set_germplasm_id ( Long id ) {
	this.germplasm_id = id;
    }

    public Long get_germplasm_id() { 
	return germplasm_id; 
    }
    
    public void set_map_element_id ( Long id ) { 
	this.map_element_id = id; 
    }

    public Long get_map_element_id() { 
	return map_element_id;
    }
  
    public void set_genotype( String genotype ) { 
	this.genotype = genotype; 
    }

    public String get_genotype() {
	return genotype;
    }

    public void set_segregation_ratio( String ratio ) { 
	this.segregation_ratio = ratio;
    }

    public String get_segregation_ratio() { 
	return segregation_ratio;
    }

    /**
     * Stores association between germplasm and map element as an INSERT
     * or UPDATE depending on if a row already exists for this combination
     * of germplasm id and map element id.
     *
     * @param conn A database connection with INSERT/UPDATE/DELETE privileges
     * @throws InvalidActionException if required data has not been set
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// throw exception if required data is invalid or missing 
	validate();

	if ( exists( conn ) ) {
	    update( conn );
	} else {
	    insert( conn );
	}
    }

    /** 
     * Inserts a new row into Germplasm_MapElement containing contents of
     * object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	// create insert w/out SELECT @@IDENTITY since join table has
	// no primary key
	String query = 
	    StoreUtils.createInsertStatement( "Germplasm_MapElement", 
					      getColumnValuesMap( false ));
	conn.setQuery( query );
	conn.executeUpdate();
	conn.releaseResources();
    }

    /** 
     * Determines if a row exists in Germplasm_MapElement with this combination
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
	    "FROM Germplasm_MapElement " +
	    "WHERE germplasm_id = ? " +
	    "AND map_element_id = ? ";
	
	conn.setQuery( query );
	conn.setQueryVariable( 1, get_germplasm_id() );
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
     * Updates an existing row in Germplasm_MapElement with contents of object
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
	keysMap.put( "germplasm_id", get_germplasm_id() );
	keysMap.put( "map_element_id", get_map_element_id() );
	
	String query = 
	    StoreUtils.createUpdateStatement( "Germplasm_MapElement",
					      keysMap,
					      getColumnValuesMap( true ) );
	
	conn.setQuery( query );	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated --- shouldn't happen, since presumably
	// we just checked to make sure row exists
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"Germplasm_MapElement UPDATE failed: " +
		"no row found for germplasm id: " + 
		get_germplasm_id() + " " +
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
	    columnValues.put( "germplasm_id", 
			      TextConverter.dbQuote( get_germplasm_id() ) );

	    columnValues.put( "map_element_id", 
			      TextConverter.dbQuote( get_map_element_id() ) );
	}

	columnValues.put( "genotype", 
			  TextConverter.dbQuote( get_genotype() ) );

	columnValues.put( "segregation_ratio",
			  TextConverter.dbQuote( get_segregation_ratio() ) );


	return columnValues;

    }


    /**
     * Ensures that data required for storing to database has been 
     * properly set
     *
     * @throws InvalidActionException if required data is invalid or missing
     */
    private void validate() throws InvalidActionException {

	if ( get_germplasm_id() == null ||
	     get_map_element_id() == null ) {

	    String errMsg = 
		"Cannot store Germplasm_MapElement with " + 
		"germplasm id: " + get_germplasm_id() + 
		" and map_element_id: " + get_map_element_id();

	    throw new InvalidActionException( errMsg );
	}
    }

    /**
     * For unit testing only
     */
    public void test() {  
	System.out.println( "*** TfcGermplasmMapElement content test ***" );
	System.out.println( "map_element_id:" + get_map_element_id() );
	System.out.println( "germplasm_id:" + get_germplasm_id() );
	System.out.println( "genotype: " + get_genotype() );
	System.out.println( "segregation ratio: " + get_segregation_ratio() );
	System.out.println( "*** TfcGermplasmMapElement content test end ***" );
    }
    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    Long germplasm_id = new Long( 3485 );
	    Long map_element_id = new Long( 2479408 );

	    TfcGermplasmMapElement element = 
		new TfcGermplasmMapElement( conn, 
					    germplasm_id, 
					    map_element_id );
	    element.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }


}
