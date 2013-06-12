//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2004/04/12 17:31:28 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the CloneAlternateSize table in the tair database. Each 
 * instance maps one row of data in CloneAlternateSize table. Each data object
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.
 */

public class TfcCloneAlternateSize extends TfcTairObject {   
    
    private Long  clone_alt_size_id;
    private Long clone_id;
    private Float alternate_size;
    private java.util.Date date_last_modified;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcCloneAlternateSize
     */
    public TfcCloneAlternateSize() { 
        super();
    }

    /**
     * Creates an instance of TfcCloneAlternateSize that reflects the
     * data referenced by submitted clone_alt_size_id.
     * 
     * @param conn An active connection to the database
     * @param clone_alt_size_id ID to retrieve data for
     * @throws SQLException in the case of an invalid operation or database
     * error
     */
    public TfcCloneAlternateSize( DBconnection conn, Long clone_alt_size_id )
	throws SQLException {
	
        super( conn, clone_alt_size_id );
    }

    /**
     * Implements abstract method in superclass to return "CloneAlternateSize"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "CloneAlternateSize";
    }

    /**
     * Implements abstract method in superclass to return "clone_alt_size_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "clone_alt_size_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all CloneAlternateSize specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of table specific columns to include in SELECT 
     * statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
            "clone_alt_size_id",
            "clone_id",
            "alternate_size",
            "date_last_modified",
	    "date_entered",
	    "original_name",
            "is_obsolete"
	};	    
	
	return localClassColumns;
    }

    /**
     * Retrieves CloneAlternateSize specific data from result set and store
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
        long id = results.getLong( "clone_alt_size_id" );
        if ( !results.wasNull() ) {
            set_clone_alt_size_id( new Long( id ) );
        }
	
        id = results.getLong( "clone_id" );
        if ( !results.wasNull() ) {
            set_clone_id( new Long( id ) );
        }
	
        float f = results.getFloat( "alternate_size" );
        if ( !results.wasNull() ) {
            set_alternate_size( new Float( f ) );
        }
      
        set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );

        set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );
    }
    
    
    public void set_clone_alt_size_id ( Long value ) {  
	clone_alt_size_id = value; 
    }

    public Long get_clone_alt_size_id() { 
	return clone_alt_size_id; 
    }

    public void set_clone_id ( Long value ) { 
	clone_id = value; 
    }

    public Long get_clone_id() {
	return clone_id; 
    }

    public void set_alternate_size ( Float value ) { 
	alternate_size = value; 
    }

    public Float get_alternate_size() { 
	return alternate_size; 
    }

    public void set_date_last_modified ( java.util.Date value ) { 
	date_last_modified = value; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_is_obsolete ( Boolean value ) {
	is_obsolete = value; 
    }

    public Boolean get_is_obsolete() {
	return is_obsolete; 
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
	System.out.println( "****** TfcCloneAlternateSize content test ******" );
	System.out.println( "clone_alt_size_id: " + get_clone_alt_size_id() );
	System.out.println( "clone_id: " + get_clone_id() );
	System.out.println( "alternate_size: " + get_alternate_size() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );     
	System.out.println( "is_obsolete: " + get_is_obsolete() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcCloneAlternateSize content test end ****" );
    }
    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection connection = new DBconnection();
	    Long test_id = new Long( 2 );
	    TfcCloneAlternateSize size = 
		new TfcCloneAlternateSize( connection, test_id );

	    size.test();
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
