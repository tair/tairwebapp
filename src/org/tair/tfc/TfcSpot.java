//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/12/01 23:45:24 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;

/**
 * This class maps to the Spot table. Each instance represents one row of data;
 * each member variable maps to a column of a row in the table.
 */

public class TfcSpot {   

    private Long spot_id;
    private String spot_name;
    private Long array_design_id;
    private Long array_element_id;
    private Integer column_number;
    private Integer row_number;
    private Integer sector;
    private Integer sector_row;
    private Integer sector_column;
    private Integer plate;
    private Integer plate_row;
    private Integer plate_column;


    /**
     * Creates an empty instance of TfcSpot
     */
    public TfcSpot() {  }


    /**
     * Creates an instance of TfcSpot that reflects the data referenced by
     * submitted spot_id
     *
     * @param conn An active connection to the database
     * @param spot_id Spot id to retrieve data for
     * @throws SQLException thrown if a database error occurs
     * @throws RecordNotFoundException if no row found for submitted id
     */
    public TfcSpot( DBconnection conn, Long spot_id ) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    getBaseQuery() + 
	    "WHERE spot_id = " + spot_id.toString();

	boolean found = processResults( conn, query );

	if ( !found ) {
	    throw new RecordNotFoundException( "No spot found for spot_id: " + 
					       spot_id );
	}
    }
  
    /**
     * Store results of query in member variables
     */
    private boolean processResults( DBconnection conn, String query ) 
	throws SQLException {

	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	boolean found = results.next();

	if ( found ) {
	    set_spot_id( new Long( results.getLong( "spot_id" ) ) );
	    set_spot_name( results.getString( "spot_name" ) );

	    set_array_design_id( 
		new Long( results.getLong( "array_design_id" ) ) );

	    set_array_element_id( 
		new Long( results.getLong( "array_element_id" ) ) );
      

	    int num = results.getInt( "column_number" );
	    if ( !results.wasNull() ) {
		set_column_number( new Integer( num ) );
	    }

	    num = results.getInt( "row_number" );
	    if ( !results.wasNull() ) {
		set_row_number( new Integer( num ) );
	    }


	    num = results.getInt( "sector" );
	    if ( !results.wasNull() ) {
		set_sector( new Integer( num ) );
	    }

	    num = results.getInt( "sector_row" );
	    if ( !results.wasNull() ) {
		set_sector_row( new Integer( num ) );
	    }

	    num = results.getInt( "sector_column" );
	    if ( !results.wasNull() ) {
		set_sector_column( new Integer( num ) );
	    }

	    num = results.getInt( "plate" );
	    if ( !results.wasNull() ) {
		set_plate( new Integer( num ) );
	    }

	    num = results.getInt( "plate_row" );
	    if ( !results.wasNull() ) {
		set_plate_row( new Integer( num ) );
	    }

	    num = results.getInt( "plate_column" );
	    if ( !results.wasNull() ) {
		set_plate_column( new Integer( num ) );
	    }
	}

	conn.releaseResources();

	return found;
    }

    /**
     * Return basic select statement
     */
    private String getBaseQuery() {
	StringBuffer query = new StringBuffer();

	query.append( "SELECT spot_id, " +
		      "spot_name, " +
		      "array_design_id, " +
		      "array_element_id, " +
		      "column_number, " +
		      "row_number, " +
		      "sector, " +
		      "sector_row, " +
		      "sector_column, " +
		      "plate, " +
		      "plate_row, " +
		      "plate_column " +
		      "FROM Spot " );

	return query.toString();
    } 


    public void set_spot_id( Long id ) { 
	this.spot_id = id; 
    }

    public Long get_spot_id() {
	return spot_id; 
    }

    public void set_spot_name( String name ) { 
	this.spot_name = name;
    }

    public String get_spot_name() {
	return spot_name; 
    }

    public void set_array_design_id( Long id ) {
	this.array_design_id = id;  
    }

    public Long get_array_design_id() { 
	return array_design_id;
    }

    public void set_array_element_id( Long id ) { 
	this.array_element_id = id;
    }

    public Long get_array_element_id() { 
	return array_element_id; 
    }

    public void set_column_number( Integer num ) { 
	this.column_number = num;
    }

    public Integer get_column_number() {
	return column_number;
    }

    public void set_row_number( Integer num ) { 
	this.row_number = num;
    }

    public Integer get_row_number() {
	return row_number; 
    }

    public void set_sector( Integer sector ) {
	this.sector = sector;
    }

    public Integer get_sector() {
	return sector;
    }

    public void set_sector_row( Integer row ) {
	this.sector_row = row;
    }

    public Integer get_sector_row() {
	return sector_row;
    }

    public void set_sector_column( Integer column ) {
	this.sector_column = column; 
    }

    public Integer get_sector_column() {
	return sector_column;
    }

    public void set_plate( Integer plate ) {
	this.plate = plate;
    }

    public Integer get_plate() {
	return plate;
    }

    public void set_plate_row( Integer row ) {
	this.plate_row = row;
    }

    public Integer get_plate_row() {
	return plate_row;
    }

    public void set_plate_column( Integer column ) {
	this.plate_column = column;
    }

    public Integer get_plate_column() {
	return plate_column;
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcSpot content test ******" );
	System.out.println( "spot_id: " + get_spot_id() );
	System.out.println( "spot_name: " + get_spot_name() );
	System.out.println( "array_design_id: " + get_array_design_id() );
	System.out.println( "array_element_id: " + get_array_element_id() );
	System.out.println( "column_number: " + get_column_number() );
	System.out.println( "row_number: " + get_row_number() );
	System.out.println( "sector: " + get_sector() );
	System.out.println( "sector_row: " + get_sector_row() );
	System.out.println( "sector_column: " + get_sector_column() );
	System.out.println( "plate: " + get_plate() );
	System.out.println( "plate_row: " + get_plate_row() );
	System.out.println( "plate_column: " + get_plate_column() );
	System.out.println( "**** TfcSpot content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try {
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 39126 );
	    TfcSpot spot = new TfcSpot( conn, id );
	    spot.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }  
}
