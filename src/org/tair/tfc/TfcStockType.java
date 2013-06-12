//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/04/05 22:40:55 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import org.tair.utilities.*;

/** 
 * TfcStockType maps to the StockType table in the tair database. Each instance
 * maps one row of data. Each data object maps to one field of a row in the 
 * table. Each field has one set method and one get method for accessing from
 * outside of class.
 *
 * <p>
 * Unlike other Tfc classes, TfcStockType will not always execute a SQL query
 * to get data from the database.  Since stock type data does not change very
 * often and is required by every instance of TfcStock, lookup data is stored
 * in a static member variable so that once retrieved a value does not need 
 * to be retrieved again. When the constructor for this class is called, member
 * variables are populated from the static collection instead of from the 
 * database.
 *
 * <p>
 * This is a litle convoluted, but is done to facilitate the quick translation
 * of the stock type id to literal value of stock type without incurring another
 * database query. The convention of instantiating the class using its 
 * constructor is kept for consistency; for ID to type translation, the 
 * utility method typeForID can be used with the same effect
 */


public class TfcStockType {

    /**
     * Collection of stock type data, stored with stock type ID as Long key
     * referencing literal value of stock type. New entries will be retrieved 
     * from the database and added to collection as new values of stock type id
     * are encountered through constructor
     */
    private static Map stockTypes = new HashMap();


    /**
     * Primary key value for a single stock type
     */
    private Long stock_type_id;

    /**
     * Literal type value for a single stock type
     */
    private String stock_type;


    /**
     * Creates an instance of TfcStockType that reflects data referenced
     * by submitted stock_type_id.
     *
     * @param stock_type_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for stock_type_id
     * @throws SQLException thrown if a database error occurs 
     */
    public TfcStockType( Long stock_type_id ) 
        throws RecordNotFoundException, SQLException {

	// Get type value using typeForID utility method that 
	// accesses static collection of all possible types. 
	// RecordNotFoundException will be thrown if no row found for
	// stock type id
	this.stock_type = typeForID( stock_type_id );
	this.stock_type_id = stock_type_id;
    }

    /**
     * Utility method to retrieve the stock type literal value for
     * submitted stock type id. This is equivalent to creating an instance
     * of TfcStockType getting the type value through get_stock_type
     *
     * @param stock_type_id Stock type id to retrieve data for
     * @return Stock type for submitted stock type id
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public static String typeForID( Long stock_type_id )
	throws RecordNotFoundException, SQLException {

	// get entry for this stock type id if necessary -- will throw
	// exception if no row found for id
	if ( !stockTypes.containsKey( stock_type_id ) ) {
	    loadRow( stock_type_id );
	}

	String type = (String) stockTypes.get( stock_type_id );
	
	return type;
    }

    /**
     * Get row from database table for stock type id and store data in 
     * stockTypes collection. This method should only be called once 
     * for each element child table. RecordNotFoundException will be thrown
     * if no row found for stock type id
     *
     * @param stock_type_id Stock type id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    private static void loadRow( Long stock_type_id ) 
	throws RecordNotFoundException, SQLException {
	
	DBconnection conn = null;
	DBReadManager connectionPool = null;
	boolean found = false;

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

	    String query =
		"SELECT stock_type " +
		"FROM StockType " +
		"WHERE stock_type_id = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( stock_type_id );

	    // save data with stock type id as key referencing type
	    ResultSet results = conn.getResultSet();
	    found = results.next();

	    if ( found ) {
		stockTypes.put( stock_type_id,
				results.getString( "stock_type" ) );
	    }
	    conn.releaseResources();

	} finally {
	    connectionPool.return_connection( conn );
	}
	    
        if ( !found ) {
            throw new RecordNotFoundException( "No stock type found for " +
                                               "stock type id: " + 
                                               stock_type_id );
        }
    }


    public void set_stock_type_id( Long avail ) { 
        this.stock_type_id = avail; 
    }

    public Long get_stock_type_id() { 
        return stock_type_id; 
    }

    public void set_stock_type( String type ) { 
        this.stock_type = type; 
    }

    public String get_stock_type() { 
        return stock_type; 
    }
    

    /**
     * For unit testing only
     */
    public void test(){
        System.out.println( "****** TfcStockType content test *******" );
        System.out.println( "stock type id: " + get_stock_type_id() );
        System.out.println( "stock type: " + get_stock_type() );
        System.out.println( "****** TfcStockType content end *******" );
    }


    public static void main( String[] args ) {
    
        try {
            TfcStockType availability = new TfcStockType( new Long( 31 ) );
            availability.test();
            
        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }
}
