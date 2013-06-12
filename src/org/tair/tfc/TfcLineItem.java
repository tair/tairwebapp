//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2005/05/26 21:32:32 $
//------------------------------------------------------------------------------


package org.tair.tfc;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * TfcLineItem stores one row of data from the LineItem table
 */

public class TfcLineItem implements Serializable {

  /**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = -215987912125469041L;
  /** Logger */
  private static final Logger logger = Logger.getLogger(TfcLineItem.class);
  
    private Long line_item_id;
    private Long invoice_id;
    private Long payment_id;
    private Long stock_id;
    private Long orders_id;
    private String status;
    private String type;
    private Float amount;
    private java.util.Date notifiedDate;

    /**
     * Creates an empty instance of TfcLineItem
     */
    public TfcLineItem() { }

    /**
     * Creates an instance of TfcLineItem that reflects the data referenced
     * by submitted line_item_id
     *
     * @param conn An active connection to the database
     * @param line_item_id The value for line_item_id to search for
     * @throws RecordNotFoundException if no row found for line_item_id
     * @throws SQLException if a database error occurs
     */
    public TfcLineItem( DBconnection conn, Long line_item_id ) 
        throws RecordNotFoundException, SQLException {

        String query = getBaseQuery() + "WHERE line_item_id = ?";
        conn.setQuery( query );
        conn.setQueryVariable( line_item_id );

        ResultSet results = conn.getResultSet();
        boolean found = populate( results );
        conn.releaseResources();
        
        if ( !found ) {
            throw new RecordNotFoundException( "No line item exists with " +
                                               "line item id: " + 
                                               line_item_id );
        }
    }


    /**
     * Creates SELECT statement for retrieving one row of line item data
     * 
     * @return SELECT for retrieving line item data
     */
    private String getBaseQuery() {
        String query = 
            "SELECT line_item_id, " +
            "invoice_id, " +
            "payment_id, " +
            "stock_id, " +
            "orders_id, " +
            "status, " +
            "lineitem_type, " +
            "amount, " +
            "notification_date " +
            "FROM LineItem ";

        return query;
    }

    /**
     * Retrieves results of SQL query and populates member variables
     *
     * @param results ResultSet from population query
     * @return <code>true</code> if a row of results was found, 
     * <code>false</code> if population query produced no results
     * @throws SQLException if a database error occurs
     */
    private boolean populate( ResultSet results ) throws SQLException {
        boolean found = results.next();

        if ( found ) {
            set_line_item_id( new Long( results.getLong( "line_item_id" ) ) );
            set_invoice_id( new Long( results.getLong( "invoice_id" ) ) );

            long l = results.getLong( "payment_id" );
            if ( !results.wasNull() ) {
                set_payment_id( new Long( l ) );
            }

            l = results.getLong( "stock_id" );
            if ( !results.wasNull() ) {
                set_stock_id( new Long( l ) );
            }

            l = results.getLong( "orders_id" );
            if ( !results.wasNull() ) {
                set_orders_id( new Long( l ) );
            }

            set_status( results.getString( "status" ) );
            set_type( results.getString( "lineitem_type" ) );
            
            float f = results.getFloat( "amount" );
            if ( !results.wasNull() ) {
                set_amount( new Float( f ) );
            }
       
            set_notified_date( results.getDate( "notification_date" ) );
        
        }
        return found;
    }


      
    //
    // get 'em and set 'em
    //

    public final void set_line_item_id( Long line_item_id ) {
        this.line_item_id = line_item_id;
    }

    public final Long get_line_item_id() {
        return line_item_id;
    }

    public final void set_invoice_id( Long invoice_id ) { 
        this.invoice_id = invoice_id; 
    }

    public final Long get_invoice_id() { 
        return invoice_id; 
    }

    public final void set_payment_id( Long payment_id ) { 
        this.payment_id = payment_id;
    }

    public final Long get_payment_id() {
        return payment_id;
    }

    public final void set_stock_id( Long stock_id ) {
        this.stock_id = stock_id;
    }

    public final Long get_stock_id() {
        return stock_id;
    }
    
    public final void set_orders_id( Long orders_id ) {
        this.orders_id = orders_id;
    }

    public final Long get_orders_id() {
        return orders_id;
    }

    public final void set_status( String status ) {
        this.status = status;
    }

    public final String get_status() {
        return status;
    }

    public final void set_type( String type ) {
        this.type = type;
    }
    
    public final String get_type() {
        return type;
    }

    public final void set_amount( Float amount ) {
        this.amount = amount;
    }

    public final Float get_amount() {
        return amount;
    }
    
    public final void set_notified_date( java.util.Date notifiedDate ) {
        this.notifiedDate = notifiedDate;
    }
    
    public final java.util.Date get_notified_date() {
        return notifiedDate;
    }

    /**
     * Stores data in this object to LineItem table.  If line_item_id is
     * <code>null</code> data is INSERTed to the table and resulting 
     * line_item_id is stored in the object.  If line_item_id is not null,
     * database is UPDATEd with current information in the object.
     *
     * @param conn An active connection to the database with INSERT/UPDATE
     * permissions
     * @throws InvalidActionException if data required for storing has
     * not been correctly set
     * @throws SQLException thrown if a database error occurs
     */  
    public void store( DBconnection conn ) 
        throws InvalidActionException, SQLException {

        // ensure required data has been set
        validate();
        
        if ( get_line_item_id() == null ) {
            insert( conn );
        } else {
            update( conn );
        }

	TfcInvoice invoice = new TfcInvoice(conn, get_invoice_id());
	invoice.set_date_last_modified(new java.util.Date());
	invoice.store(conn);
    }
    

    /**
     * Validates object to ensure that required data has been properly set. 
     *
     * @throws InvalidActionException if any data required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {
        // require payment type, amount and invoice id at a minimum
        if ( get_type() == null ||
             get_amount() == null ||
             get_invoice_id() == null ) {

            String msg =
                "Cannot store LineItem with type " + get_type() + ", " +
                "amount: " + get_amount() + ", " +
                "invoice_id: " + get_invoice_id();

            throw new InvalidActionException( msg );
        }
    }


  /**
   * Inserts a new row into LineItem containing contents of object
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws SQLException if a database error occurs
   */
  private void insert(DBconnection conn) throws SQLException {

    if (conn == null) {
      throw new RuntimeException("No connection for LineItem insert");
    }

//    String query =
//      StoreUtils.createInsertStatement("LineItem", getColumnValuesMap());
// Let's try just coding the damn SQL statement like it was regular JDBC :)
    String  query = "INSERT INTO LineItem ( line_item_id, amount, status, stock_id, invoice_id, lineitem_type, orders_id) VALUES (?, ?, ?, ?, ?, ?, ?) ";

    try {
      // Generate the id in a dummy query.
      conn.setQuery("SELECT LINEITEM_SEQ.NEXTVAL AS ID FROM DUAL");
      ResultSet rs = conn.getResultSet();
      if (rs.next()) {
      line_item_id = rs.getLong("ID");
      if (line_item_id == null || rs.wasNull()) {
        throw new SQLException("Could not generate new line item id from sequence LINEITEM_SEQ");
      }
      conn.releaseResources();
      // Now do the insert with the new line item id and the various parameters.
      conn.setQuery(query);
      conn.setQueryVariable(1, line_item_id);
      conn.setQueryVariable(2, amount);
      conn.setQueryVariable(3, status);
      // stock_id can be null
      if (stock_id != null) {
        conn.setQueryVariable(4, stock_id);
      } else {
        conn.setNullLongQueryVariable(4);
      }
      conn.setQueryVariable(5, invoice_id);
      conn.setQueryVariable(6, type);
      // orders_id can be null
      if (orders_id != null) {
        conn.setQueryVariable(7, orders_id);
      } else {
        conn.setNullLongQueryVariable(7);
      }
      conn.executeUpdate();
      } else {
        throw new SQLException("Could not get generated line item id from sequence LINEITEM_SEQ");
      }
    } catch (SQLException e) {
      logger.debug("SQL statement in error (insert line item): " + query);
      throw e;
    } finally {
      conn.releaseResources();
    }
  }

    /** 
     * Updates an existing row in LineItem with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
        throws RecordNotFoundException, SQLException {

        String query = 
            StoreUtils.createUpdateStatement( "LineItem", 
                                              "line_item_id",
                                              get_line_item_id(),
                                              getColumnValuesMap() );
        Debugger.println( Debugger.logMsg( this, "query = " + query ) );
        conn.setQuery( query ); 
        int rowsAffected = conn.executeUpdate();
        conn.releaseResources();

        // error if no row updated
        if ( rowsAffected <= 0 ) {
            String msg = 
                "LineItem UPDATE failed: no row found for " +
                "line_item_id: " + get_line_item_id();
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
    private Map<String, String> getColumnValuesMap() {
        Map<String, String> columnValues = new HashMap<String, String>();
        if (type.equalsIgnoreCase("INSERT") ){ 
            columnValues.put( "line_item_id", "LINEITEM_SEQ.NEXTVAL");
        }
        columnValues.put( "invoice_id", TextConverter.dbQuote( get_invoice_id() ) );
        columnValues.put( "payment_id", TextConverter.dbQuote( get_payment_id() ) );
        columnValues.put( "stock_id", TextConverter.dbQuote( get_stock_id() ) );
        columnValues.put( "orders_id", TextConverter.dbQuote( get_orders_id() ) );
        columnValues.put( "status", TextConverter.dbQuote( get_status() ) );
        columnValues.put( "lineitem_type", TextConverter.dbQuote( get_type() ) );
        columnValues.put( "amount", TextConverter.dbQuote( get_amount() ) );
        columnValues.put( "notification_date", 
                          TextConverter.dbQuote( get_notified_date(), "mm/dd/yyyy" ) );

        return columnValues;
    }


    /**
     * Deletes line item from the database. If line item has a NULL line_item_id,
     * no database action is carried out (since it's assumed that line item 
     * hasn't been stored to db yet).
     *
     * @param conn A database connection with INSERT/UPDATE/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
        if ( get_line_item_id() != null ) {
            String query = "DELETE LineItem WHERE line_item_id = ?";
            try {
              conn.setQuery( query );
              conn.setQueryVariable( get_line_item_id() );
              conn.executeUpdate();
            } finally {
              conn.releaseResources();
            }
        }
    }

    /**
     * For unit testing only
     */
    public void test() {
        logger.debug( "line_item_id: " + get_line_item_id() );
        logger.debug( "invoice_id: " + get_invoice_id() );
        logger.debug( "payment_id: " + get_payment_id() );
        logger.debug( "stock_id: " + get_stock_id() );
        logger.debug( "orders_id: " + get_orders_id() );
        logger.debug( "status: " + get_status() );
        logger.debug( "type: " + get_type() );
        logger.debug( "amount: " + get_amount() );
        logger.debug( "notified_date: " + get_notified_date() );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            Long lineItemID = new Long( 1 );

            DBconnection conn = new DBconnection();
            TfcLineItem lineItem = new TfcLineItem( conn, lineItemID );
            lineItem.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }           
    }
}
