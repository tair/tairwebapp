//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2005/05/03 21:15:35 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.jboss.logging.Logger;
import org.tair.db.DB;

/**
 * TfcOrderNumber represents the OrderNumber table in the TAIR database.  This
 * table contains a single row which represents the last used value for ABRC
 * stock order number (stored as Orders.order_number).  As new orders are 
 * created, client code should populate order_number for new orders by
 * retrieving this value, incrementing it and then saving new value. Retrieving
 * a new order_number to use should be done using this class's
 * getNextOrderNumber utility method which takes care of all of these details
 * in a thread safe manner. 
 *
 * <p>
 * Manual order number generation is used so that a valid order number can
 * be supplied to Paymentech's credit card authorization service when validating
 * a user's card for a stock order charge. Previously, order numbers were simply
 * the orders_id of the order, but since no orders_id is created until order 
 * is saved to the database after cc authorization succeeds, this has been
 * switched. To preserve previous values, however, all orders placed before
 * the credit card payment updates were made active have had their order_number
 * field populated with the orders_id.
 */

public class TfcOrderNumber {
  private static final Logger logger = Logger.getLogger(TfcOrderNumber.class);

    /**
     * Retrieves the next unique order_number for a stock order. This value
     * determined by retrieving the last saved value from the database, 
     * incrementing it, ensuring the new number has not been used by an existing
     * stock order and then saving new value to the OrderNumber table. All of
     * these actions must be atomic to ensure that method retrieves a unique
     * order number. Method is synchronized to be thread safe. All client
     * code MUST use this method for determining what order_number to use 
     * to make sure that a valid order number is used.
     *
     * <p>
     * This value will be saved in the Orders.order_number field as new orders
     * are created. This column is NON-NULL and UNIQUE to ensure that all
     * orders have a unique value.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @return Unique order number to use for a stock order being placed
     * @throws SQLException if a database error occurs
     */
    public static synchronized Long getNextOrderNumber( DBconnection conn )
	throws SQLException {

	long orderNumber;
  try {
    // get current value of order number
    String query = "SELECT order_number FROM OrderNumber";
    conn.setQuery( query );
    ResultSet results = conn.getResultSet();

    orderNumber = 0;
    if ( results.next() ) {
        orderNumber = results.getLong( "order_number" );
    }
    conn.releaseResources();

    // if no order number was found in db, throw an error -- should never
    // happen, but it's important enough that this value be correct that
    // we'll go ahead and make the extra check
    if ( orderNumber == 0 ) {
        throw new SQLException( "No order number could be found" );
    }

    // Increment order number and ensure that new value has not
    // already been used by another order. Do this until a unique value
    // is found
    orderNumber++;
    while ( !uniqueOrderNumber( conn, orderNumber ) ) {
        orderNumber++;
    }

    // save new value for order number and return confirmed
    // unique value to client code for use in stock order
    query = 
        "UPDATE OrderNumber " +
        "SET order_number = " + String.valueOf( orderNumber );

    conn.setQuery( query );
    conn.executeUpdate();
  } finally {
    // Make sure all resources are reclaimed.
    conn.releaseResources();
  }
	
	return new Long( orderNumber );

    }

	public static Long getNextOrderNumber()
	{
		DBconnection conn = DB.getWrite();
		try {
			return TfcOrderNumber.getNextOrderNumber(conn);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			DB.release(conn);
		}
	}

    /**
     * Checks Orders table in database to ensure that submitted order number
     * has not already been used by an existing order in the database. Since 
     * orders placed before payment updates were done use orders_id as 
     * order_number, there may be occasions where orderNumber matches the value 
     * for a previously placed order (though this shouldn't happen until 
     * order_number reaches 100,000). 
     *
     * @param conn An active connection to the database
     * @param orderNumber Order number to check for uniqueness
     * @return <code>true</code> if submitted order number is not found in the
     * Orders table or <code>false</code> if order number is found in the table.
     * @throws SQLException if a database error occurs
     */
    private static boolean uniqueOrderNumber( DBconnection conn, 
					      long orderNumber )
	throws SQLException {

	boolean unique = true;

	String query =
	    "SELECT count(*) AS order_count " +
	    "FROM Orders " +
	    "WHERE order_number = " + String.valueOf( orderNumber );

	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() && results.getInt( "order_count" ) > 0 ) {
	    unique = false;
	}
	conn.releaseResources();

	return unique;
    }
	
	    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {
	    DBWriteManager pool = DBWriteManager.getInstance();
	    DBconnection conn = pool.get_connection();
	    Long number = TfcOrderNumber.getNextOrderNumber( conn );
	    logger.debug( "number: " + number );
	    
	} catch ( Exception e ) {
	    e.printStackTrace();
    
	}
    }

}
