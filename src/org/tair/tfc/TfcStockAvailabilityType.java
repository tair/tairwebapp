//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/04/05 22:40:55 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;

import org.tair.utilities.*;

/** 
 * TfcStockAvailabilityType maps to the StockAvailabilityType table in the tair 
 * database. Each instance maps one row of data. Each data object maps to one 
 * field of a row in the table. Each field has one set method and one get 
 * method for accessing from outside of class.
 *
 * <p>
 * Unlike other Tfc classes, TfcStockAvailabilityType will not always execute a
 * SQL query to get data from the database.  Since availability type data does 
 * not change very often and is required by every instance of TfcStock, lookup 
 * data is stored in a static member variable so that once retrieved a value 
 * does not need to be retrieved again. When the constructor for this class is
 * called, member variables are populated from the static collection instead of
 * from the database.
 *
 * <p>
 * This is a litle convoluted, but is done to facilitate the quick translation
 * of the stock availability type id to literal value of availability type 
 * without incurring another database query. The convention of instantiating
 * the class using its constructor is kept for consistency; for ID to type 
 * translation, the utility method typeForID can be used with the same effect
 */


public class TfcStockAvailabilityType {

    /**
     * Collection of stock availability type data, stored with stock 
     * availability type ID as Long key referencing literal value of 
     * availability type. New entries will be retrieved from the database
     * and added to collection as new values of stock availability type id 
     * are encountered through constructor
     */
    private static Map stockAvailabilityTypes = new HashMap();


    /**
     * Primary key value for a single stock availability type
     */
    private Long stock_availability_type_id;

    /**
     * Literal type value for a single stock availability type
     */
    private String stock_availability_type;


    /**
     * Creates an instance of TfcStockAvailabilityType that reflects data 
     * referenced by submitted stock_availability_type_id.
     *
     * @param stock_availability_type_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for ID
     * @throws SQLException thrown if a database error occurs 
     */
    public TfcStockAvailabilityType( Long stock_availability_type_id ) 
        throws RecordNotFoundException, SQLException {

	// Get type value using typeForID utility method that 
	// accesses static collection of all possible types. 
	// RecordNotFoundException will be thrown if no row found for
	// stock type id
	this.stock_availability_type = typeForID( stock_availability_type_id );
	this.stock_availability_type_id = stock_availability_type_id;
    }

    /**
     * Utility method to retrieve the stock type literal value for
     * submitted stock type id. This is equivalent to creating an instance
     * of TfcStockAvailabilityType getting the type value through 
     * get_stock_availability_type
     *
     * @param stock_availability_type_id Stock type id to retrieve data for
     * @return Stock type for submitted stock type id
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public static String typeForID( Long stock_availability_type_id )
	throws RecordNotFoundException, SQLException {

	// get entry for this stock type id if necessary -- will throw
	// exception if no row found for id
	if ( !stockAvailabilityTypes.containsKey( stock_availability_type_id ) ) {
	    loadRow( stock_availability_type_id );
	}

	String type = 
	    (String) stockAvailabilityTypes.get( stock_availability_type_id );
	
	return type;
    }

    /**
     * Get row from database table for stock type id and store data in 
     * stockAvailabilityTypes collection. This method should only be called once 
     * for each element child table. RecordNotFoundException will be thrown
     * if no row found for stock type id
     *
     * @param stock_availability_type_id Stock type id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    private static void loadRow( Long stock_availability_type_id ) 
	throws RecordNotFoundException, SQLException {
	
	DBconnection conn = null;
	DBReadManager connectionPool = null;
	boolean found = false;

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

	    String query =
		"SELECT stock_availability_type " +
		"FROM StockAvailabilityType " +
		"WHERE stock_availability_type_id = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( stock_availability_type_id );

	    // save data with stock type id as key referencing type
	    ResultSet results = conn.getResultSet();
	    found = results.next();

	    if ( found ) {
		String type = 
		    results.getString( "stock_availability_type" );

		stockAvailabilityTypes.put( stock_availability_type_id,
					    type );
				
	    }
	    conn.releaseResources();

	} finally {
	    connectionPool.return_connection( conn );
	}
	    
        if ( !found ) {
            throw new RecordNotFoundException( "No stock availability type " +
					       "found for type id: " + 
                                               stock_availability_type_id );
        }
    }

    public void set_stock_availability_type_id( Long avail ) { 
        this.stock_availability_type_id = avail; 
    }

    public Long get_stock_availability_type_id() { 
        return stock_availability_type_id; 
    }

    public void set_stock_availability_type( String type ) { 
        this.stock_availability_type = type; 
    }

    public String get_stock_availability_type() { 
        return stock_availability_type; 
    }
    

    /**
     * For unit testing only
     */
    public void test(){
        System.out.println( "****** TfcStockAvailabilityType content test *******" );
        System.out.println( "stock availability_type_id: " +get_stock_availability_type_id() );
        System.out.println( "stock availability_type: " + get_stock_availability_type() );
        System.out.println( "****** TfcStockAvailabilityType content end *******" );
    }


    public static void main( String[] args ) {
    
        try {
            TfcStockAvailabilityType availability = 
		new TfcStockAvailabilityType( new Long( 2 ) );
            availability.test();
            
        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }
}
