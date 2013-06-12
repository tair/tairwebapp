//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/11/29 18:18:16 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * This class maps to the BioSample_EnvCond table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 */

public class TfcBioSampleEnvCond {

    private Long bio_sample_id;
    private Long environmental_condition_id;
    private Integer order_number;
    private Boolean is_experimental_variable;


    /**
     * Creates an empty instance of TfcBioSampleEnvCond
     */
    public TfcBioSampleEnvCond() { }


    /**
     * Creates an instance of TfcBioSampleEnvCond that reflects the
     * data referenced by the combination of submitted bio_sample_id
     * and environmental_condition_id
     *
     * @param conn An active connection to the database
     * @param bio_sample_id Bio sample id to retrieve data for
     * @param environmental_condition_id Environmental condition id to retrieve 
     * data for
     * @throws SQLException thrown if a database error occurs, or if no row found
     * for combination of submitted ids
     */
    public TfcBioSampleEnvCond( DBconnection conn, 
				Long bio_sample_id, 
				Long environmental_condition_id ) 
	throws SQLException {

	String query =
	    "SELECT bio_sample_id, " +
	    "environmental_condition_id, " +
	    "order_number, " +
	    "is_experimental_variable " +
	    "FROM BioSample_EnvCond " +
	    "WHERE bio_sample_id = ? " +
	    "AND environmental_condition_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, bio_sample_id );
	conn.setQueryVariable( 2, environmental_condition_id );

	ResultSet results = conn.getResultSet();
	boolean found = processResults( results );
	conn.releaseResources();
    
	if ( !found ) {
	    String errMsg = 
		"No entry found for bio sample id: " + 
		bio_sample_id + " " + 
		"and environmental_condition_id: " + 
		environmental_condition_id;

	    throw new RecordNotFoundException( errMsg );
	}
    }


    /**
     * Store results of query in member variables - return flag to notify 
     * caller whether query produced results or not
     *
     * @param results ResultSet from population query
     * @throws SQLException if a database error occurs
     */
    private boolean processResults( ResultSet results ) throws SQLException {
	boolean found = false;

	found = results.next();
	if ( found ) {
	    set_bio_sample_id( new Long( results.getLong( "bio_sample_id" ) ) );

	    Long envCondID =  
		new Long( results.getLong( "environmental_condition_id" ) );
	    set_environmental_condition_id( envCondID );
      
	    int num = results.getInt( "order_number" );
	    if ( !results.wasNull() ) {
		set_order_number( new Integer( num ) );
	    }

	    set_is_experimental_variable( 
		TextConverter.stringToBoolean( 
		    results.getString( "is_experimental_variable" ) ) );
	}

	return found;
    }

    //
    // Get 'em and set 'em
    //

    public void set_bio_sample_id( Long id ) { 
	this.bio_sample_id = id;
    }

    public Long get_bio_sample_id() {
	return bio_sample_id;
    }

    public void set_environmental_condition_id( Long id ) {
	this.environmental_condition_id = id;
    }

    public Long get_environmental_condition_id() { 
	return environmental_condition_id;
    }

    public void set_order_number( Integer number ) { 
	this.order_number = number;
    }

    public Integer get_order_number() {
	return order_number;
    }

    public void set_is_experimental_variable( Boolean is_exp_variable ) { 
	this.is_experimental_variable = is_exp_variable;
    }

    public Boolean get_is_experimental_variable() { 
	return is_experimental_variable; 
    }
 
    /**
     * Determines if environmental condition id is associated to any
     * bio sample ids. This is helpful for determining whether an 
     * environmental condition record can be deleted or not after its 
     * association to a bio sample id has been removed
     *
     * @param conn An active connection to the database
     * @return <code>true</code> if environmental condition is associated
     * to any bio sample ids <code>false</code> if no associations found
     * @throws SQLException if a database error occurs
     */
    public static boolean hasBioSamples( DBconnection conn, 
					 Long environmental_condition_id )
	throws SQLException {

	boolean hasBioSamples = false;

	String query =
	    "SELECT COUNT( bio_sample_id ) AS sample_count " +
	    "FROM BioSample_EnvCond " +
	    "WHERE environmental_condition_id = ?";
	conn.setQuery( query );
	conn.setQueryVariable( 1, environmental_condition_id );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    if ( results.getInt( "sample_count" ) > 0 ) {
		hasBioSamples = true;
	    }
	}
	conn.releaseResources();

	return hasBioSamples;
    }

    
    /**
     * Stores association between bio sample and environmental condition.
     * This operation is done as an INSERT or as an UPDATE depending on
     * whether an existing row for bio sample id and env. condition id 
     * exists in the database.
     *
     * @param conn A database connection with INSERT/UPDATE/DELETE privileges
     * @throws InvalidActionException if required data has not been set
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// throw exception if required data is invalid or missing 
	validate();

	if ( !exists( conn ) ) {
	    insert( conn );
	} else {
	    update( conn );
	}

    }
   /**
     * Delete entry from BioSample_EnvCond for a give bio_sample_id and 
     * environmental_condition_id.
     *
     * @param conn A database connection with INSERT/UPDATE/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws  SQLException {
	if ( exists( conn ) ) {
	    String query = 
		"DELETE BioSample_EnvCond " +
		"WHERE environmental_condition_id = ? " +
		"AND  bio_sample_id = ? ";
	    conn.setQuery( query );
	    conn.setQueryVariable( 1, get_environmental_condition_id() );
	    conn.setQueryVariable( 2, get_bio_sample_id() );
	    conn.executeUpdate();
	    conn.releaseResources();      
        } 
    }

    /** 
     * Determines if a row exists in BioSample_EnvCond with this combination
     * of bio sample and environmental condition ids.
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
	    "FROM BioSample_EnvCond " +
	    "WHERE bio_sample_id = ? " +
	    "AND environmental_condition_id = ? ";
	
	conn.setQuery( query );
	conn.setQueryVariable( 1, get_bio_sample_id() );
	conn.setQueryVariable( 2, get_environmental_condition_id() );
	
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
     * Inserts a new row into BioSample_EnvCond containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {
	// create insert w/out SELECT @@IDENTITY since join table has
	// no primary key
	String query = 
	    StoreUtils.createInsertStatement( "BioSample_EnvCond", 
					      getColumnValuesMap( false )); 
	conn.setQuery( query );
	conn.executeUpdate();
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in BioSample_EnvCond with contents of object
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
	keysMap.put( "bio_sample_id", get_bio_sample_id() );

	keysMap.put( "environmental_condition_id", 
		     get_environmental_condition_id() );
	
	String query = 
	    StoreUtils.createUpdateStatement( "BioSample_EnvCond",
					      keysMap,
					      getColumnValuesMap( true ) );
	
	conn.setQuery( query );	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated --- shouldn't happen, since presumably
	// we just checked to make sure row exists
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"BioSample_EnvCond UPDATE failed: " +
		"no row found for bio sample id: " + 
		get_bio_sample_id() + " " +
		"and environmental condition id: " + 
		get_environmental_condition_id();
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
     * If method is called to get values for an UPDATE, bio sample id
     * and environmental condition id will not be included in returned map since
     * they represent primary key values used for identifying row in table.
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
	    columnValues.put( "bio_sample_id", 
			      TextConverter.dbQuote( get_bio_sample_id() ) );
	    
	    columnValues.put( "environmental_condition_id", 
			      TextConverter.dbQuote( 
	         		   get_environmental_condition_id() ) );
	}

	columnValues.put( "order_number", 
			  TextConverter.dbQuote( get_order_number() ) );
	
	columnValues.put( "is_experimental_variable", 
			  TextConverter.dbQuote( 
			      get_is_experimental_variable() ) );

	return columnValues;

    }

    /**
     * Ensures that data required for storing to database has been 
     * properly set
     *
     * @throws InvalidActionException if required data is invalid or missing
     */
    private void validate() throws InvalidActionException {

	if ( get_bio_sample_id() == null ||
	     get_environmental_condition_id() == null ) {

	    String errMsg =
		"Cannot store BioSample_EnvCond with " +
		"bio sample id: " + get_bio_sample_id() + 
		" environmental condition id: " +
		get_environmental_condition_id();
	    
	    throw new InvalidActionException( errMsg);
	}
    }




    /**
     * For unit testing only
     */
    public void test() { 
	System.out.println( "*** TfcBioSampleEnvCond content test ***" );
	System.out.println( "bio_sample_id: " + get_bio_sample_id() );
	System.out.println( "environmental_condition_id: " + 
			    get_environmental_condition_id() );
	System.out.println( "order_number: " + get_order_number() );
	System.out.println( "is_experimental_variable: " +
			    get_is_experimental_variable() );
	System.out.println( "**** TfcBioSampleEnvCond content test end ****" );
    }




    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try {

	    DBconnection conn = new DBconnection();
	    Long bioSampleID = new Long( 5 );
	    Long envCondID = new Long( 7 );
	    TfcBioSampleEnvCond bioSamp = 
		new TfcBioSampleEnvCond( conn, bioSampleID, envCondID );
	    bioSamp.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
