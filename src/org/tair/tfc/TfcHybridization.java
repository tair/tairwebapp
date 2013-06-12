//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2004/04/12 17:31:30 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the Hybridization table in the tair database. Each 
 * instance maps one row of data in Hybridization table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 */

public class TfcHybridization extends TfcTairObject {   

    private Long hybridization_id;
    private Long probe_id;
    private Long assignment_id;
    private Long map_id;
    private Long clone_id;
    private String type;
    private Boolean clone_size_known;
    private Boolean checked_by_southern;
    private Boolean has_expected_bands;
    private Boolean is_obsolete;
    private java.util.Date date_last_modified;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcHybridization 
     */
    public TfcHybridization( ) { 
	super( );
    }

    /**
     * Creates an instance of TfcHybridization that reflects data referenced
     * by submitted hybridization_id
     *
     * @param conn An active connection to the database
     * @param hybridization_id Hybridization id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database error 
     */
    public TfcHybridization( DBconnection conn, Long hybridization_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, hybridization_id );
    }

    /**
     * Implements abstract method in superclass to return "Hybridization"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Hybridization";
    }

    /**
     * Implements abstract method in superclass to return "hybridization_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "hybridization_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Hybridization specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all Hybridization specific columns to include in
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "clone_id",
	    "map_id",
	    "hybridization_id",
	    "assignment_id",
	    "probe_id",   
	    "type",                   
	    "clone_size_known",
	    "checked_by_southern",
	    "has_expected_bands",
	    "is_obsolete",
	    "date_entered",
	    "original_name",
	    "date_last_modified"
	};	    

	return localClassColumns;
    }

    /**
     * Retrieves Hybridization specific data from result set and stores
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "clone_id" );
	if ( !results.wasNull() ) {
	    set_clone_id( new Long( id ) );
	}
	
	id = results.getLong( "map_id" );
	if ( !results.wasNull() ) {
	    set_map_id( new Long( id ) );
	}
	
	id = results.getLong( "hybridization_id" );
	if ( !results.wasNull() ) {
	    set_hybridization_id( new Long( id ) );
	}
	
	id = results.getLong( "assignment_id" );
	if ( !results.wasNull() ) {
	    set_assignment_id( new Long( id ) );
	}
	
	id = results.getLong( "probe_id" );
	if ( !results.wasNull() ) {
	    set_probe_id( new Long( id ) );
	}
	
	set_type( results.getString( "type" ) );
	
	set_clone_size_known( 
	    TextConverter.stringToBoolean(
		results.getString( "clone_size_known" ) ) );

	set_checked_by_southern(
	    TextConverter.stringToBoolean(
		results.getString( "checked_by_southern" ) ) );

	set_has_expected_bands( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_expected_bands" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }             

    public void set_hybridization_id( Long value ) { 
	hybridization_id = value; 
    }

    public Long get_hybridization_id() { 
	return hybridization_id; 
    }

    public void set_probe_id( Long value ) { 
	probe_id = value; 
    }

    public Long get_probe_id() { 
	return probe_id; 
    }

    public void set_assignment_id( Long value ) { 
	assignment_id = value; 
    }

    public Long get_assignment_id() { 
	return assignment_id; 
    }

    public void set_map_id( Long value ) { 
	map_id = value; 
    }

    public Long get_map_id() { 
	return map_id; 
    }

    public void set_clone_id( Long value ) {
	clone_id = value; 
    }

    public Long get_clone_id() { 
	return clone_id; 
    }

    public void set_type( String value ) { 
	type = value; 
    }

    public String get_type() { 
	return type; 
    }

    public void set_clone_size_known( Boolean value ) { 
	clone_size_known = value; 
    }

    public Boolean get_clone_size_known() { 
	return clone_size_known; 
    }

    public void set_checked_by_southern( Boolean value ) {
	checked_by_southern = value; 
    }

    public Boolean get_checked_by_southern() { 
	return checked_by_southern; 
    }

    public void set_has_expected_bands( Boolean value ) { 
	has_expected_bands = value; 
    }

    public Boolean get_has_expected_bands() {
	return has_expected_bands; 
    }

    public void set_is_obsolete( Boolean value ) { 
	is_obsolete = value; 
    }

    public Boolean get_is_obsolete() { 
	return is_obsolete; 
    }

    public void set_date_last_modified( java.util.Date value ) { 
	date_last_modified = value; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
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
	System.out.println( "****** TfcHybridization content test ******" );
	System.out.println( "hybridization_id: " + get_hybridization_id() );
	System.out.println( "map_id: " + get_map_id() );
	System.out.println( "clone_id: " + get_clone_id() );
	System.out.println( "probe_id: " + get_probe_id() );
	System.out.println( "assignment_id: " + get_assignment_id() );
	System.out.println( "type: " + get_type() );
	System.out.println( "clone_size_known: " + get_clone_size_known() );
	System.out.println( "check_by_southern: " + get_checked_by_southern() );
	System.out.println( "has_expected_bands: " + get_has_expected_bands() );
	System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcHybridization content test end ****" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    Long test_id = new Long( 343 );

	    TfcHybridization hybridization =
		new TfcHybridization( conn, test_id );

	    hybridization.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
