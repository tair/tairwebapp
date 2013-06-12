//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2005/10/21 22:57:44 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * TfcOrdersStock stores one row of data from the Orders_Stock table which
 * represents the many to many relationship between Orders and DNA stocks.
 * 
 * Implements Serializable so order session attributes can be serialized if
 * server is restarted
 */

public class TfcOrdersStock implements Serializable {

    /**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = -2055888281407381806L;
    private Long orders_id;
    private Long stock_id;
    private String status;
    private int quantity;
    private String waive_charge;
    private java.util.Date date_last_modified;
    private java.util.Date date_shipped;
    private Float stock_charge;

    /**
     * Creates an empty instance of TfcOrdersStock
     */
    public TfcOrdersStock() {
    }

    /**
     * Creates an instance of TfcOrdersStock to represent the relationship
     * between the supplied order id and stock id.
     * 
     * @param conn
     *            An active connection to the database
     * @param stockID
     *            The value of stock_id to search for
     * @param orderID
     *            The value of order_id to search for
     * @throws SQLException
     *             thrown if a database error occurs
     * @throws RecordNotFoundException
     *             if no row found for combination of stockID and orderID
     */
    public TfcOrdersStock( DBconnection conn, Long stockID, Long orderID ) throws SQLException {

        boolean found = false;

        String query = "SELECT status, "
                       + "quantity, "
                       + "waive_charge, "
                       + "date_last_modified, "
                       + "date_shipped, "
                       + "stock_charge "
                       + "FROM Orders_Stock "
                       + "WHERE stock_id = ? "
                       + "AND orders_id = ? ";

        try {
          conn.setQuery( query );
          conn.setQueryVariable( 1, stockID );
          conn.setQueryVariable( 2, orderID );

          ResultSet results = conn.getResultSet();
          found = results.next();
          if ( found ) {

              this.quantity = results.getInt( "quantity" );
              this.status = results.getString( "status" );
              this.waive_charge = results.getString( "waive_charge" );
              this.date_last_modified = results.getDate( "date_last_modified" );
              this.date_shipped = results.getDate( "date_shipped" );
              this.stock_charge = new Float( results.getFloat( "stock_charge" ) );
              this.orders_id = orderID;
              this.stock_id = stockID;
          }
        } finally {
          conn.releaseResources();
        }

        if ( !found ) {
            throw new RecordNotFoundException( "Stock id "
                                               + stockID
                                               + " not found for order "
                                               + orderID );
        }
    }

    public final void set_orders_id( Long value ) {
        orders_id = value;
    }

    public final void set_stock_id( Long value ) {
        stock_id = value;
    }

    public final void set_date_shipped( java.util.Date value ) {
        date_shipped = value;
    }

    public final void set_date_last_modified( java.util.Date value ) {
        date_last_modified = value;
    }

    public final void set_status( String status ) {
        this.status = status;
    }

    public final void set_quantity( int quantity ) {
        this.quantity = quantity;
    }

    public final void set_waive_charge( String reason ) {
        this.waive_charge = reason;
    }

    public final void set_stock_charge( Float charge ) {
        this.stock_charge = charge;
    }

    public final Long get_orders_id() {
        return orders_id;
    }

    public final Long get_stock_id() {
        return stock_id;
    }

    public final String get_status() {
        return status;
    }

    public final java.util.Date get_date_shipped() {
        return date_shipped;
    }

    public final java.util.Date get_date_last_modified() {
        return date_last_modified;
    }

    public final int get_quantity() {
        return quantity;
    }

    public final String get_waive_charge() {
        return waive_charge;
    }

    public final Float get_stock_charge() {
        return stock_charge;
    }

    /**
     * Utility method to look up how many seed or DNA stocks are contained by a
     * stock order. Counts will conditionally include stocks that have an
     * "inactive" (cancelled) status depending on submitted value of
     * includeInactive.
     * 
     * @param conn
     *            An active connection to the database
     * @param orders_id
     *            Orders id to look up stock counts for
     * @param isSeed
     *            If <code>true</code> count returned will be for seed stocks
     *            found in order; if <code>false</code> count returned will be
     *            for DNA stocks in order.
     * @param includeInactive
     *            If <code>true</code> count will be for all stocks in order
     *            (of requested type) regardless of status; if
     *            <code>false</code> stocks with "inactive" status will not be
     *            included in count.
     * @return Number of stocks of requested type found in order
     * @throws SQLException
     *             if a database error occurs
     */
    public static int getStockCount( DBconnection conn,
                                    Long orders_id,
                                    boolean isSeed,
                                    boolean includeInactive )
        throws SQLException {

        int count = 0;

        StringBuffer query = new StringBuffer();
        query.append( "SELECT COUNT(*) AS stock_count "
                      + "FROM Orders_Stock os, Stock s "
                      + "WHERE os.stock_id = s.stock_id "
                      + "AND os.orders_id = "
                      + orders_id.toString()
                      + " "
                      + "AND s.is_seed = "
                      + TextConverter.dbQuote( new Boolean( isSeed ) ) );

        // exclude inactive stocks unless specifically requested
        if ( !includeInactive ) {
            String inactiveStatus = DataConstants.getInactiveStock();
            query.append( " AND os.status != "
                          + TextConverter.dbQuote( inactiveStatus ) );
        }

        conn.setQuery( query.toString() );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            count = results.getInt( "stock_count" );
        }
        conn.releaseResources();

        return count;
    }

    /**
     * Stores the contents of the object to the Orders_Stock table as either an
     * INSERT or UPDATE depending on whether a row exists for this combination
     * of orders_id and stock_id.
     * 
     * @param conn
     *            An active connection to the database with INSERT privileges on
     *            Orders_Stock table
     * @throws InvalidActionException
     *             if object cannot be stored due to invalid data
     * @throws SQLException
     *             thrown if order id or stock id are null, or if an error
     *             occurs while writing to the database
     */
    public void store( DBconnection conn )
        throws SQLException, InvalidActionException {

        validate();

        if ( !exists( conn ) ) {
            insert( conn );
        } else {
            update( conn );
        }
    }

    /**
     * Queries database to see if a row already exists for this combination of
     * orders_id and stock_id
     * 
     * @param conn
     *            An active connection to the database
     * @return <code>true</code> if a row already exists for combination of
     *         orders_id and stock_id or <code>false</code> if no row found.
     * @throws SQLException
     *             if a database error occurs
     */
    private boolean exists( DBconnection conn ) throws SQLException {
        boolean exists = false;

        String query = "SELECT count(*) AS stock_count "
                       + "FROM Orders_Stock "
                       + "WHERE orders_id = ? "
                       + "AND stock_id = ?";

        try {
          conn.setQuery( query );
          conn.setQueryVariable( 1, get_orders_id() );
          conn.setQueryVariable( 2, get_stock_id() );

          ResultSet results = conn.getResultSet();
          if ( results.next() ) {
              int count = results.getInt( "stock_count" );
              if ( count > 0 ) {
                  exists = true;
              }
          }
        } finally {
          conn.releaseResources();
        }

        return exists;
    }

    /**
     * Validates object to ensure that required data has been properly set.
     * 
     * @throws InvalidActionException
     *             if any data required for storing to db have not been set
     */
    private void validate() throws InvalidActionException {

        // require orders id and stock id at a minimum
        if ( get_orders_id() == null || get_stock_id() == null ) {
            String msg = "Cannot store OrdersStock with : "
                         + "orders_id: "
                         + get_orders_id()
                         + ", "
                         + "stock_id: "
                         + get_stock_id();
            throw new InvalidActionException( msg );
        }
    }

    /**
     * Inserts a new row into Orders_Stock containing contents of object
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException
     *             if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

        String query = StoreUtils.createInsertStatement( "Orders_Stock",
                                                         getColumnValuesMap( true ));
        try {
          conn.setQuery( query );
          conn.executeUpdate();
        } finally {
          conn.releaseResources();
        }
    }

    /**
     * Updates an existing row in Orders_Stock with contents of object
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException
     *             if UPDATE does not affect any rows
     * @throws SQLException
     *             if a database error occurs
     */
    private void update( DBconnection conn )
        throws RecordNotFoundException, SQLException {

        // Orders_Stock has composite primary key of orders_id and stock_id
        Map<String, Long> keysMap = new HashMap<String, Long>();
        keysMap.put( "orders_id", get_orders_id() );
        keysMap.put( "stock_id", get_stock_id() );

        String query = StoreUtils
                                 .createUpdateStatement( "Orders_Stock",
                                                         keysMap,
                                                         getColumnValuesMap( false ) );

        int rowsAffected;
        try {
          conn.setQuery( query );
          rowsAffected = conn.executeUpdate();
        } finally {
          conn.releaseResources();
        }

        // error if no row updated
        if ( rowsAffected <= 0 ) {
            String msg = "Orders_Stock UPDATE failed: no row found for "
                         + "orders_id: "
                         + get_orders_id()
                         + ", "
                         + "stock_id: "
                         + get_stock_id();

            throw new RecordNotFoundException( msg );
        }
    }

    /**
     * Retrieves values to store for this class as a Map of column names and
     * values to store for each column using current values of member variables.
     * This Map can be used by utility methods defined in StoreUtils to create
     * INSERT and UPDATE SQL statements.
     * 
     * <p>
     * Column names and values must be stored in Map as String. Values must be
     * stored with any quotation marks around values included in String so that
     * they can be directly included in SQL created in utility class.
     * 
     * <p>
     * Submitted insert flag determines whether primary key values (orders_id
     * and stock_id) should be included in returned values map. If inserting a
     * new row, these are required, if updating values should be used in WHERE
     * clause to define row for updating
     * 
     * @param insert
     *            If <code>true</code> orders_id and stock_id composite key
     *            values will be included in values map; if <code>false</code>
     *            key values will not be included in map.
     * @return Map of column names for table as String keys referencing values
     *         for each column name.
     */
    private Map<String, String> getColumnValuesMap( boolean insert ) {
        Map<String, String> columnValues = new HashMap<String, String>();

        if ( insert ) {
            columnValues.put( "orders_id",
                              TextConverter.dbQuote( get_orders_id() ) );

            columnValues.put( "stock_id",
                              TextConverter.dbQuote( get_stock_id() ) );
        }

        columnValues.put( "status", TextConverter.dbQuote( get_status() ) );

        columnValues.put( "quantity", String.valueOf( get_quantity() ) );

        columnValues.put( "waive_charge",
                          TextConverter.dbQuote( get_waive_charge() ) );

        columnValues.put( "stock_charge",
                          TextConverter.dbQuote( get_stock_charge() ) );

        columnValues.put("date_shipped", TextConverter.dbQuote(get_date_shipped(), "mm/dd/yyyy" ) );

        columnValues
                    .put( "date_last_modified",
                          TextConverter
                                       .dbQuote( get_date_last_modified(), "mm/dd/yyyy" ) );

        return columnValues;
    }

    /**
     * Deletes row for combination of orders_id and stock_id from the database.
     * 
     * @param conn
     *            A database connection with INSERT/UPDATE/DELETE privileges
     * @throws SQLException
     *             if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {

        // try to only delete if row has already been inserted
        if ( get_orders_id() != null && get_stock_id() != null ) {
            String query = "DELETE Orders_Stock "
                           + "WHERE orders_id = ? "
                           + "AND stock_id = ?";
            try {
              conn.setQuery( query );
              conn.setQueryVariable( 1, get_orders_id() );
              conn.setQueryVariable( 2, get_stock_id() );
              conn.executeUpdate();
            } catch (Exception e) {
              conn.releaseResources();
            }
        }
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "order id: " + get_orders_id() );
        System.out.println( "stock id: " + get_stock_id() );
        System.out.println( "last modified: " + get_date_last_modified() );
        System.out.println( "item status: " + get_status() );
        System.out.println( "quantity: " + get_quantity() );
        System.out.println( "waive charge: " + get_waive_charge() );
        System.out.println( "stock charge: " + get_stock_charge() );
    }

}
