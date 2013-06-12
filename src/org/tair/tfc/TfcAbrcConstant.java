//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2005/03/11 00:07:29 $
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
 * This class maps to the AbrcConstant table in the tair database. Each 
 * instance maps one row of data in AbrcConstant table. Each data object maps
 * to one field of a row in the table. Each field has one set method and one get
 * method for accessing from outside of class.
 */


public class TfcAbrcConstant {

    private Long abrc_constant_id;
    private String name;
    private Float constant;
    private String description;
    private java.util.Date date_last_modified;


    /**
     * Creates an empty instance of TfcAbrcConstant
     */
    public TfcAbrcConstant() { }

  
    /**
     * Creates an instance of TfcAbrcConstant that reflects the data 
     * referenced by submitted abrc_constant_id
     *
     * @param conn An active connection to the database
     * @param abrc_constant_id Id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public  TfcAbrcConstant( DBconnection conn, Long abrc_constant_id ) 
	throws RecordNotFoundException, SQLException {

        String query =
	    "SELECT abrc_constant_id, " +
	    "name, " +
	    "abrcconstant_constant, " +
	    "description, " +
	    "date_last_modified " +
	    "FROM AbrcConstant "+
	    "WHERE abrc_constant_id = " + abrc_constant_id.toString();

	try {
	    conn.setQuery( query );
	    ResultSet results = conn.getResultSet();
	    boolean found = results.next();

	    if ( found ) {
		set_abrc_constant_id( abrc_constant_id );
		set_name( results.getString( "name" ) );
		set_constant( new Float( results.getFloat( "abrcconstant_constant" ) ) );
		set_description( results.getString( "description" ) );
		set_date_last_modified( results.getDate( "date_last_modified" ) );
	    } else { 
		throw new RecordNotFoundException( "No constant found for " +
						   "abrc_constant_id: " +
						   abrc_constant_id );
	    }
	} finally {
	    conn.releaseResources();
	}
    }

    public void set_abrc_constant_id( Long abrc_constant_id ) {
	this.abrc_constant_id = abrc_constant_id;
    }

    public Long get_abrc_constant_id() {
	return abrc_constant_id;
    }

    public void set_name( String name ) {
	this.name = name;
    }

    public String get_name() {
	return name;
    }

    public void set_constant( Float constant ) {
	this.constant = constant;
    }

    public Float get_constant() {
	return constant;
    }

    public void set_description( String description ) {
	this.description = description;
    }

    public String get_description() {
	return description;
    }

    public void set_date_last_modified( java.util.Date date ) {
	this.date_last_modified = date;
    }

    public java.util.Date get_date_last_modified() {
	return date_last_modified;
    }


    /**
     * Stores ABRC constant data to the database as an UPDATE or INSERT 
     * depending on whether abrc_constant_id is null or not.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
        throws SQLException, InvalidActionException {

        // ensure required data has been set
        validate();
	
        if ( get_abrc_constant_id() == null ) {
            insert( conn );
        } else {
            update( conn );
        }

    }

    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any data required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {
	// require name and constant value at a minimum
	
	if ( get_name() == null ||
	     get_constant() == null ) {

	    String msg =
		"Cannot store Abrc constant with name: " + get_name() + ", " +
		"constant: " + get_constant();

	    throw new InvalidActionException( msg );
	}
    }


   /** 
     * Inserts a new row into AbrcConstant containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {
	
	String query = StoreUtils.createInsertStatement( "AbrcConstant", 
							 getColumnValuesMap() );
	
	// insert row and get newly created id
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    Long id = new Long( results.getLong( 1 ) );
	    set_abrc_constant_id( id );
	}
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in AbrcConstant with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    StoreUtils.createUpdateStatement( "AbrcConstant", 
					      "abrc_constant_id",
					      get_abrc_constant_id(),
					      getColumnValuesMap() );
	
	conn.setQuery( query );	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();

	// error if no row updated
	if ( rowsAffected <= 0 ) {
	    String msg = 
		"AbrcConstant UPDATE failed: no row found for " +
		"abrc_constant_id: " + get_abrc_constant_id();
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
     * @return Map of column names for table as String keys referencing
     * values for each column name.  
     */
    private Map getColumnValuesMap() {
	Map columnValues = new HashMap();

	columnValues.put( "name", 
			  TextConverter.dbQuote( get_name() ) );
	
	columnValues.put( "abrcconstant_constant", 
			  TextConverter.dbQuote( get_constant() ) );

	columnValues.put( "description", 
			  TextConverter.dbQuote( get_description() ) );

	return columnValues;

    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** TfcAbrcConstant content test ******" ); 
	System.out.println( "abrc_constant_id: " + get_abrc_constant_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "constant: " + get_constant() );
	System.out.println( "description: " + get_description() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "**** TfcAbrcConstant content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	
        try {

            DBconnection conn = new DBconnection();
	                Long id = new Long( 1 );
            TfcAbrcConstant constant = new TfcAbrcConstant( conn, id );
            constant.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
