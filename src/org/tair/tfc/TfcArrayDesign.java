//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/07/06 16:32:59 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the ArrayDesign table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 */

public class TfcArrayDesign {   

    private Long array_design_id;
    private String name; 
    private String manufacturer;
    private Integer num_spots;
    private String description;
    private String platform_type;
    private String surface_type;
    private Integer number_of_slides;
    private String comments;

    /**
     * Creates an empty instance of TfcArrayDesign
     */
    public TfcArrayDesign() {  }

    /**
     * Creates an instance of TfcArrayDesign that reflects the data referenced
     * by submitted array_design_id
     *
     * @param conn An active connection to the database
     * @param array_design_id Array design id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException thrown if a database error occurs
     */
    public  TfcArrayDesign( DBconnection conn, Long array_design_id ) 
	throws SQLException {

	boolean found = false;

	String query = 
	    getBaseQuery() + 
	    "WHERE array_design_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( array_design_id );

	ResultSet results = conn.getResultSet();
	found = processResults( results );
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No array design found for " +
					       "array_design_id: " + 
					       array_design_id );
	}
    }
  
    /**
     * Store results of query in member variables
     */
    private boolean processResults( ResultSet results ) throws SQLException {
	
	boolean found = results.next();

	if ( found ) {
	    Long id = new Long( results.getLong( "array_design_id" ) );
	    set_array_design_id( id );
	    set_name( results.getString( "name" ) );
	    set_manufacturer( results.getString( "manufacturer" ) );
	    
	    int num = results.getInt( "num_spots" );
	    if ( !results.wasNull() ) {
		set_num_spots( new Integer( num ) );
	    }

	    set_description( results.getString( "description" ) ); 
	    set_platform_type( results.getString( "platform_type" ) );
	    set_surface_type( results.getString( "surface_type" ) );

	    num = results.getInt( "number_of_slides" );
	    if ( !results.wasNull() ) {
		set_number_of_slides( new Integer( num ) );
	    }
	    set_comments( results.getString( "comments" ) );
	}
	
	return found;
    }

    /**
     * Return basic select statement
     */
    private String getBaseQuery() {
	StringBuffer query = new StringBuffer();

	query.append( "SELECT array_design_id, " +
		      "name, " +
		      "manufacturer, " +
		      "num_spots, " +
		      "description, " +
		      "platform_type, " +
		      "surface_type, " +
		      "number_of_slides, " +
		      "comments " + 
		      "FROM ArrayDesign " );

	return query.toString();
    } 

    public void set_array_design_id( Long id ) { 
	this.array_design_id = id;  
    }

    public Long get_array_design_id() {
	return array_design_id; 
    }

    public void set_name( String name ) { 
	this.name = name; 
    }

    public String get_name() {
	return name; 
    }

    public void set_manufacturer( String manufacturer ) {
	this.manufacturer = manufacturer;
    }

    public String get_manufacturer() { 
	return manufacturer; 
    }

    public void set_num_spots( Integer num ) { 
	this.num_spots = num; 
    }

    public Integer get_num_spots() { 
	return num_spots; 
    }

    public void set_description( String descr ) {
	this.description = descr;
    }

    public String get_description() {
	return description;
    }

    public void set_platform_type( String type ) { 
	this.platform_type = type; 
    }

    public String get_platform_type() { 
	return platform_type;
    }

    public void set_surface_type( String type ) {
	this.surface_type = type;
    }

    public String get_surface_type() { 
	return surface_type;
    }

    public void set_number_of_slides( Integer num ) { 
	this.number_of_slides = num;
    }

    public Integer get_number_of_slides() { 
	return number_of_slides;
    }

    public void set_comments( String comments ) { 
	this.comments = comments; 
    }

    public String get_comments() {
	return comments;
    }


    /**
     * Retrieves array design id for submitted array design name
     *
     * @param conn An active connection to the database
     * @param name Array design name to look up
     * @return Array design id for submitted array design name or
     * <code>null</code> if no row found for name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveArrayDesignID( DBconnection conn,
					      String name )
        throws SQLException {

        Long id = null;

        String query =
            "SELECT array_design_id " +
            "FROM ArrayDesign " +
            "WHERE UPPER( name ) = " +
	    TextConverter.dbQuote( name.toUpperCase() );

        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "array_design_id" ) );
        }
        conn.releaseResources();

        return id;
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcArrayDesign content test ******" );
	System.out.println( "array_design_id: " + get_array_design_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "manufacturer: " + get_manufacturer() );
	System.out.println( "num_spots: " + get_num_spots() );
	System.out.println( "description: " + get_description() );
	System.out.println( "platform_type: " + get_platform_type() );
	System.out.println( "surface_type: " + get_surface_type() );
	System.out.println( "number_of_slides: " + get_number_of_slides() );
	System.out.println( "comments: " + get_comments() );
	System.out.println( "**** TfcArrayDesign content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 26 );
	    TfcArrayDesign ad = new TfcArrayDesign( conn, id );
	    ad.test();

	    System.out.println( "\nId for name..." );
	    id = TfcArrayDesign.retrieveArrayDesignID( conn,
						       "affymetrix 8k" );
	    System.out.println( "id: " + id );
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }  
}
