// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.20 $
// $Date: 2006/03/20 18:02:52 $
// ------------------------------------------------------------------------------

package org.tair.abrc.stock;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.tair.db.DB;
import org.tair.querytools.AliasVector;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcOrdersStock;
import org.tair.tfc.TfcStock;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * Stock extends <code>TfcStock</code> to represent stock information that is
 * used in the ordering process. In addition to data in <code>TfcStock</code>,
 * Stock contains an <code>AliasVector</code> of aliases for this stock, as well
 * as an instance of <code>TfcOrdersStock</code> which contains order specific
 * information about the stock, such as order number, stock status, quantity
 * etc.
 */

public class Stock extends TfcStock {

  /**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = 1614195014076379347L;

  // will be null for any stocks not joined to Clone
  private String insert_type;

  // aliases for stock stored as TfcAlias
  private AliasVector aliases;

  // order specific info. for this stock
  private TfcOrdersStock orders_stock;

  // flags if stock status set to "in progress" in which
  // case user gets email
  private boolean downloaded = false;

  // flags if stock status set to "shipped" in which
  // case user gets email.
  private boolean shipped = false;

  // flags if stock status set to "sent to NASC" in which
  // case user gets email.
  private boolean NASC = false;

  // flags if stock status set to "NASC will ship" in which
  // case user gets email
  private boolean NASC_ship = false;

  // stock notes for stock - stored as TfcStockNote - collection must
  // be manually populated using the populateStockNotes() method
  private StockNoteCollection stockNotes = null;

  /**
   * Creates an empty instance of Stock
   */
  public Stock() {
    super();
    orders_stock = new TfcOrdersStock();
  }

  /**
   * Creates an instance of Stock that contains data for the the stock with
   * submitted stockID and order specific info. for this stockID in order with
   * submitted orderID.
   * 
   * @param conn An active connection to the database
   * @param stockID The stock_id of stock to get data for
   * @param orderID The order id of the order this stock appears in
   * @throws RecordNotFoundException if stock id not found or not found in order
   * @throws SQLException thrown if a database error occurs
   */
  public Stock(DBconnection conn, Long stockID, Long orderID)
      throws RecordNotFoundException, SQLException {

    super(conn, stockID);
    populateAliases(conn);
    populateInsertType(conn);

    if (orderID != null) {
      orders_stock = new TfcOrdersStock(conn, stockID, orderID);
    } else {
      orders_stock = new TfcOrdersStock();
      orders_stock.set_quantity(DataConstants.getDefaultQuantity());
      orders_stock.set_status(DataConstants.getNewStock());
      orders_stock.set_date_last_modified(new java.util.Date());
    }
    orders_stock.set_stock_id(stockID);
    orders_stock.set_orders_id(orderID);
  }

  /**
   * Creates an instance of Stock that contains data for the stock with stock_id
   * of submitted id
   * 
   * @param conn An active connection to the database
   * @param id The stock id to create this instance for
   * @throws RecordNotFoundException if no stock found for id
   * @throws SQLException thrown if a database error occurs
   */
  public Stock(DBconnection conn, Long id) throws RecordNotFoundException,
      SQLException {

    super(conn, id);
    populateInsertType(conn);
    populateAliases(conn);
    orders_stock = new TfcOrdersStock();
    orders_stock.set_stock_id(id);
    orders_stock.set_quantity(DataConstants.getDefaultQuantity());
    orders_stock.set_status(DataConstants.getNewStock());
    orders_stock.set_date_last_modified(new java.util.Date());
  }

  /**
   * Creates an instance of Stock that contains data for the stock with the
   * submitted name. This version of the constructor determines the stock_id
   * from name, and then retrieves information based on that id
   * 
   * @param conn An active connection to the database
   * @param name The name of the stock to create this instance for
   * @throws RecordNotFoundException if no stock found for name
   * @throws SQLException thrown if a database error occurs
   */
  public Stock(DBconnection conn, String name) throws RecordNotFoundException,
      SQLException {

    super(conn, getStockID(conn, name));
    populateInsertType(conn);
    populateAliases(conn);
    orders_stock = new TfcOrdersStock();
    orders_stock.set_stock_id(get_stock_id());
    orders_stock.set_quantity(DataConstants.getDefaultQuantity());
    orders_stock.set_status(DataConstants.getNewStock());
    orders_stock.set_date_last_modified(new java.util.Date());
  }

  /**
   * Retrieves stock id given stock number (name) -- this version differs from
   * similar method in super-class in that stock aliases can be used
   * successfully
   */
  private static Long getStockID(DBconnection conn, String name)
      throws RecordNotFoundException, SQLException {

    String query = null;
    ResultSet results = null;
    Long stockID = null;

    if (name != null) {
      query = "SELECT s.stock_id " +
      // use name/alias for name searching
              "FROM Stock s, StockNameAlias sna "
              + "WHERE s.stock_id = sna.stock_id "
              + "AND sna.name LIKE "
              + TextConverter.dbQuote(name.toUpperCase())
              + " ESCAPE '\\\'";

      conn.setQuery(query);

      results = conn.getResultSet();
      if (results.next()) {
        stockID = new Long(results.getLong("stock_id"));
      }
      conn.releaseResources();
    }

    if (stockID == null) {
      throw new RecordNotFoundException("Invalid stock name: " + name);
    }

    return stockID;
  }

  /**
   * Retrieve insert type for any stocks that are clones
   */
  private void populateInsertType(DBconnection conn) throws SQLException {
    ResultSet results = null;
    String query =
      "SELECT c.insert_type "
          + "FROM Clone c, TairObject_Stock t "
          + "WHERE t.tair_object_id = c.tair_object_id "
          + "AND t.stock_id = "
          + get_stock_id().toString();

    try {
      conn.setQuery(query);
      results = conn.getResultSet();
      if (results.next()) {
        this.insert_type = results.getString("insert_type");
      }
    } finally {
      conn.releaseResources();
    }
  }

  /**
   * Retrieves aliases for this stock
   * 
   * @param conn An active connection to the database
   * @throws SQLException thrown if an error occurs while retrieving data
   * @see AliasVector
   */
  public void populateAliases(DBconnection conn) throws SQLException {
    aliases = new AliasVector(conn, get_tair_object_id());
  }

  /**
   * Override version in TfcStock to keep orders_stock & stock in synch.
   */
  public void set_stock_id(Long id) {
    super.set_stock_id(id);

    // orders_stock will be null when this is called as part
    // of TfcStock initialization - okay, since this value will be
    // set when TfcOrdersStock constructor is called
    if (orders_stock != null) {
      orders_stock.set_stock_id(id);
    }
  }

  /**
   * Returns a context-specific version of stock type. For DNA stocks that are
   * joined to Clone, this will be the value of insert type in the Clone table.
   * For all other stocks, this will be directly from the StockType table.
   * 
   * @return Context specific value to display for DNA stock type
   */
  public String get_format_stock_type() {
    String returnType =
      (insert_type != null) ? insert_type + " clone" : get_stock_type();
    return returnType;
  }

  /**
   * Retrieve aliases for stock
   * 
   * @return Aliases for this stock as an <code>Iterator</code> of
   *         <code>TfcAlias</code> objects, or
   *         <code> null if no aliases for this
   * stock
   */
  public Iterator get_aliases() {
    return hasAliases() ? aliases.iterator() : null;
  }

  /**
   * Determines if stock has associated aliases
   * 
   * @return <code>true</code> if stock has associated aliases, or
   *         <code>false</code> if no aliases associated to stock
   */
  public boolean hasAliases() {
    return (aliases != null && !aliases.isEmpty());
  }

  /**
   * Retrieves stock aliases as a delimited string
   */
  public String get_alias_string() {
    return hasAliases() ? aliases.get_alias_string() : null;
  }

  //
  // order stock wrappers
  //

  public void set_stock_charge(Float charge) {
    orders_stock.set_stock_charge(charge);
  }

  public Float get_stock_charge() {
    return orders_stock.get_stock_charge();
  }

  public void set_orders_id(Long id) {
    orders_stock.set_orders_id(id);
  }

  public Long get_orders_id() {
    return orders_stock.get_orders_id();
  }

  public void set_quantity(int quantity) {
    orders_stock.set_quantity(quantity);
  }

  public int get_quantity() {
    return orders_stock.get_quantity();
  }

  public void set_waive_charge(String reason) {
    orders_stock.set_waive_charge(reason);
  }

  public String get_waive_charge() {
    return orders_stock.get_waive_charge();
  }

  public void set_order_date_last_modified(java.util.Date date_last_modified) {
    orders_stock.set_date_last_modified(date_last_modified);
  }

  public java.util.Date get_order_date_last_modified() {
    return orders_stock.get_date_last_modified();
  }

  public String get_status() {
    return orders_stock.get_status();
  }

  /**
   * Special method to return stock status only if it is not "new". This is
   * useful on JSP shown directly after order is placed where any non-new status
   * is shown (if order was automatically forwarded to NASC for fulfillment, or
   * if stock needs an MTA before being shipped. This method makes the
   * comparison and returns either a non-new status or an empty string
   * 
   * @return Stock status if it is not "new", or empty string if stock status is
   *         new.
   */
  public String get_other_status() {
    return DataConstants.getNewStock().equals(get_status()) ? "" : get_status();
  }

  /**
   * Returns date stock item in order was last modified. This is overridden from
   * the TfcStock superclass (which returns the date the stock's data itself was
   * last modified). This is done to hopefully remove any confusion by always
   * returning the info. for this stock in relation to the stock order it is
   * part of
   */
  public java.util.Date get_date_last_modified() {
    return orders_stock.get_date_last_modified();
  }

  //
  // status change flags
  //

  public boolean get_new_downloaded() {
    return downloaded;
  }

  public boolean get_new_shipped() {
    return shipped;
  }

  public boolean get_new_NASC() {
    return NASC;
  }

  public boolean get_new_NASC_ship() {
    return NASC_ship;
  }

  //
  // old methods from Stock interface that wrap TfcStock methods - keep for
  // now for backwards compatibility with client code uses these methods
  //
  public void set_available(String available) {
    set_stock_availability_type(available);
  }

  public String get_available() {
    return get_stock_availability_type();
  }

  public void set_stock_number(String number) {
    set_name(number);
  }

  public String get_stock_number() {
    return get_name();
  }

  /**
   * Determines whether stock is a seed stock or not -- differs slightly from
   * the get_is_seed() method in that a simple boolean value is returned instead
   * of a Boolean object. Old Stock interface method - keep for now for
   * backwards compatibility
   * 
   * @return <code>true</code> if stock is a seed stock, or <code>false</code>
   *         if stock is a DNA stock
   */
  public boolean is_seed() {
    return (get_is_seed() != null && get_is_seed().booleanValue());
  }

  /**
   * Sets the status for this stock in order. If stock status is being upgraded
   * to "in progress", downloaded flag is set to true; if stock status is being
   * upgraded to "shipped", shipped flag is set to true; if stock status is
   * being set to "sent to NASC", NASC flag is set to true. When order is next
   * saved, these flags will be examined so that user can be notified of status
   * changes.
   */
  public void set_status(String status) {
    orders_stock.set_status(status);
    if (DataConstants.getInProgressStock().equals(status)) {
      this.downloaded = true;

    } else if (DataConstants.getShippedStock().equals(status)) {
      orders_stock.set_date_shipped(new java.util.Date());
      this.shipped = true;

    } else if (DataConstants.getNASCStock().equals(status)) {
      this.NASC = true;

    } else if (DataConstants.getNASCShipStock().equals(status)) {
      this.NASC_ship = true;
    }
  }

  /**
   * Retrieves stock charge formatted in $US money format ($0.00). This value
   * may differ from the value returned by get_base_price() since it is the
   * price stored for this particular stock in this specific order, a price
   * which may be set manually by curator
   * 
   * @return String containing formatted stock price, or null if stock has no
   *         base price
   */
  public String get_format_stock_charge() {
    return TextConverter.floatToString(orders_stock.get_stock_charge());
  }

  /**
   * Retrieves formatted stock charge of stock if no waiver has been granted for
   * this stock as part of a stock order or "waived" if stock has been granted a
   * waiver. Using this method avoids having to do this comparison on the order
   * display level
   * 
   * @return Formatted string containing stock charge of this stock in US money
   *         format, or "waived" if a charge waiver has been granted for this
   *         stock in current order
   */
  public String get_calculated_stock_charge() {
    String calculatedStr = null;
    if (hasWaiver()) {
      calculatedStr = "waived";
    } else {
      calculatedStr = get_format_stock_charge();
    }
    return calculatedStr;
  }

  /**
   * Retrieves line item charge for stock. This value equals the base price of
   * stock (as stored in stock_charge) multiplied by the quantity ordered. This
   * value should be the same as the LineItem charge for this stock in current
   * order, or can be used to display that value for orders that do not have
   * invoice/line item data.
   * 
   * @return Line item charge for stock or zero if stock has no charge, or if
   *         stock has a charge waiver associated with it.
   */
  public Float getLineItemCharge() {
    float charge = 0;

    if (get_stock_charge() != null && !hasWaiver()) {
      charge = get_stock_charge().floatValue();
      charge *= get_quantity();
    }

    return new Float(charge);
  }

  /**
   * Determines if stock has a charge waiver associated with it or not
   * 
   * @return <code>true</code> if stock has a charge waiver or
   *         <code>false</code> if no waiver for stock.
   */
  public boolean hasWaiver() {
    return (get_waive_charge() != null);
  }

  /**
   * Determines whether stock has a mandatory express shipping charge associated
   * with it.
   * 
   * @return <code>true</code> if stock has a mandatory express shipping charge,
   *         or <code>false</code> if stock does not have a mandatory express
   *         shipping charge
   */
  public boolean express_shipping_required() {
    return (get_express_shipping_required() != null && get_express_shipping_required().booleanValue());
  }

  /**
   * Determines whether this stock is on back order or not. This status is
   * checked separately since in some contexts a stock that is back-ordered is
   * the same as "in_progress", while other times it is the same as "completed".
   * 
   * @return <code>true</code> if stock status is set to back ordered, or
   *         <code>false</code> if status is not set to back ordered.
   */
  public boolean back_ordered() {
    String status = get_status();
    return (status != null && status.equals(DataConstants.getBackOrderedStock()));
  }

  /**
   * Determines whether this stock is in progress by checking the value of the
   * stock status to see if it set as in progress.
   * 
   * @return <code>true</code> if stock status is "in progress", or
   *         <code>false</code> if status is not "in progress"
   */
  public boolean in_progress() {
    String status = get_status();
    return (status != null && status.equals(DataConstants.getInProgressStock()));
  }

  /**
   * Determines whether this stock is waiting for an MTA signature by checking
   * the value of the stock status to see if it set as "waiting_for_MTA".
   * 
   * @return <code>true</code> if stock status is "waiting_for_MTA", or
   *         <code>false</code> if status is not "waiting_for_MTA"
   */
  public boolean waiting_for_MTA() {
    String status = get_status();
    return (status != null && status.equals(DataConstants.getMTAStock()));
  }

  /**
   * Determines whether this stock has been forwared to NASC for fulfillment by
   * checking the value of the stock status to see if it set as "to nasc".
   * 
   * @return <code>true</code> if stock status is "sent to NASC", or
   *         <code>false</code> if status is not "sent to NASC"
   */
  public boolean sent_to_NASC() {
    String status = get_status();
    return (status != null && status.equals(DataConstants.getNASCStock()));
  }

  /**
   * Determines whether this stock has will be shipped by NASC. This status
   * differs from the sent_to_NASC status in that stocks with this status will
   * count towards an ABRC user fee, whereas stocks sent to NASC will not.
   * 
   * @return <code>true</code> if stock status is "NASC will ship", or
   *         <code>false</code> if status is not "NASC will ship"
   */
  public boolean NASC_will_ship() {
    String status = get_status();
    return (status != null && status.equals(DataConstants.getNASCShipStock()));
  }

  /**
   * Determines whether this stock has been cancelled checking the value of the
   * stock status to see if it set as "inactive".
   * 
   * @return <code>true</code> if stock status is "inactive", or
   *         <code>false</code> if status is not "inactive"
   */
  public boolean inactive() {
    String status = get_status();
    return (status != null && status.equals(DataConstants.getInactiveStock()));
  }

  /**
   * Determines whether this stock is new by checking the value of the stock
   * status to see if it is null or set as "new".
   * 
   * @return <code>true</code> if stock status is "new" or <code>null</code>, or
   *         <code>false</code> if status is not "new"
   */
  public boolean is_new() {
    String status = get_status();
    return (status == null || status.equals(DataConstants.getNewStock()));
  }

  /**
   * Determines whether this stock has been shipped by checking the value of the
   * stock status to see if it is set to "shipped".
   * 
   * @return <code>true</code> if stock status is "shipped", or
   *         <code>false</code> if status is not "shipped"
   */
  public boolean shipped() {
    String status = get_status();
    return (status == null || status.equals(DataConstants.getShippedStock()));
  }

  /**
   * Determines whether this stock is completed by checking the value of the
   * stock status. If status is equal to shipped, sent to NASC/NASC will ship or
   * inactive, stock is considered to be completed.
   * 
   * @return <code>true</code> if stock status is shipped, set to NASC/NASC will
   *         ship, or inactive, or <code>false</code> if status is not any of
   *         these.
   */
  public boolean completed() {
    boolean completed = false;
    String status = get_status();

    // test positively for stock status - stock is completed if it's
    // been shipped, sent to NASC, NASC will ship, or is inactive
    if (status != null
        && (status.equals(DataConstants.getShippedStock())
            || status.equals(DataConstants.getNASCStock())
            || status.equals(DataConstants.getNASCShipStock()) || status.equals(DataConstants.getInactiveStock()))) {
      completed = true;
    }
    return completed;
  }

  /**
   * Overrides the delete method defined in TfcTairObject to delete this stock's
   * presence in the order (through TfcOrdersStock).
   * 
   * @param conn An active connection to the database
   * @throws SQLException if a database error occurs
   */
  public void delete(DBconnection conn) throws SQLException {
    orders_stock.delete(conn);
  }

  /**
   * Stores order specific data for this stock to the database by calling
   * store() method of <code>TfcOrdersStock</code>. This method sets some
   * defaults before storing - if quantity is zero, quantity is set to default
   * quantity of 1; if status is null status is set to "new", and today's date
   * is used as last modified date if date is null.
   * 
   * @param conn An active connection to the database; connection must have
   *          INSERT/UPDATE/DELETE permissions on the database or an exception
   *          will be thrown.
   * @throws InvalidActionException if any stock cannot be stored to the
   *           database because of missing or invalid data
   * @throws SQLException thrown if an error occurs while trying to update
   *           database.
   */
  public void store(DBconnection conn) throws InvalidActionException,
      SQLException {

    // default quantity, status & date if not set explicitly
    if (orders_stock.get_quantity() == 0) {
      orders_stock.set_quantity(DataConstants.getDefaultQuantity());
    }

    if (orders_stock.get_status() == null) {
      orders_stock.set_status(DataConstants.getNewStock());
    }

    if (orders_stock.get_date_last_modified() == null) {
      orders_stock.set_date_last_modified(new java.util.Date());
    }

    orders_stock.store(conn);
  }

  /**
   * Tests whether this instance of Stock is equal to another object. If
   * submitted object is an instance of Stock that has the same stock number as
   * this instance, test will return <code>true</code>; otherwise will return
   * <code>false</code>.
   * 
   * @param obj Object to make comparison against
   * @return <code>true</code> if submitted object is a non-null instance of
   *         Stock with the same stock id as this instance, or
   *         <code>false</code> if submitted object is not equivalent.
   */
  public boolean equals(Object obj) {
    boolean equalTo = false;
    if (obj != null && obj instanceof Stock) {
      Stock stock = (Stock)obj;
      if (stock.get_stock_id() != null) {
        long compareID = stock.get_stock_id().longValue();
        if (get_stock_id() != null && get_stock_id().longValue() == compareID) {
          equalTo = true;
        }
      }
    }
    return equalTo;
  }

  /**
   * Populates stock's collection of stock notes/MTA releases. This population
   * is done separately from constructor since these notes are only needed when
   * stock order is first placed; if stock has associated notes, each note text
   * will be sent to orderer & lab PI when order is placed.
   * 
   * @param conn An active connection to the database
   * @throws SQLExcpetion thrown if a database error occurs
   */
  public void populateStockNotes(DBconnection conn) throws SQLException {
    if (get_stock_id() != null
        && (get_has_stock_notes() != null && get_has_stock_notes().booleanValue())) {
      this.stockNotes = new StockNoteCollection(conn, get_stock_id());
    }
  }

  /**
   * Determines if stock's collection of stock notes has any note elements in
   * it. This is different from the the get_has_stock_notes() method in the
   * superclass, which simply flags whether stock has associated stock notes in
   * the database; this method determines whether the current instance of stock
   * has its collection of notes populated
   * 
   * @return <code>true</code> if stock's collection of stock notes has elements
   *         in it, or <code>false</code> if no stock notes in stock's
   *         collection
   */
  public boolean hasPopulatedStockNotes() {
    return (stockNotes != null && !stockNotes.isEmpty());
  }

  /**
   * Retrieves any stock notes associated to stock. This method must be called
   * after the populateStockNotes() method has been called to return a non-null
   * value.
   * 
   * @return Stock notes associated to stock as an <code>Iterator</code> of
   *         <code>TfcStockNote</code> objects, or <code> null</code> if no
   *         stock notes associated to stock, or if stock note collection has
   *         not yet been populated.
   */
  public Iterator getStockNotes() {
    return (hasPopulatedStockNotes()) ? stockNotes.iterator() : null;
  }

  /**
   * Get the StockNoteCollection for the stock.
   * 
   * @return a stock note collection with all the notes associated with the
   *         stock
   */
  public StockNoteCollection getStockNoteCollection() {
    return (hasPopulatedStockNotes()) ? stockNotes : null;
  }

  public java.util.Date get_date_shipped() {
    return orders_stock.get_date_shipped();
  }

  public static Stock getStock(String name) {
    DBconnection conn = DB.getRead();
    try {
      return new Stock(conn, name);
    } catch (Exception e) {
    } finally {
      DB.release(conn);
    }
    return null;
  }

  public static Stock getStock(Long stock_id) {
    DBconnection conn = DB.getRead();
    try {
      return new Stock(conn, stock_id);
    } catch (Exception e) {
    } finally {
      DB.release(conn);
    }
    return null;
  }

  public static boolean expressShippingRequired(Long stock_id) {
    DBconnection conn = DB.getRead();
    try {
      conn.setQuery("SELECT express_shipping_required FROM Stock WHERE stock_id = ?");
      conn.setQueryVariable(1, stock_id);
      ResultSet rs = conn.getResultSet();
      Boolean b =
        rs.next() ? TextConverter.stringToBoolean(rs.getString("express_shipping_required"))
            : null;
      return b != null ? b.booleanValue() : false;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    } finally {
      DB.release(conn);
    }
  }

  public static float expressShippingCharge(Long stock_id) {
    DBconnection conn = DB.getRead();
    try {
      conn.setQuery("SELECT express_shipping_charge FROM Stock WHERE stock_id = ?");
      conn.setQueryVariable(1, stock_id);
      ResultSet rs = conn.getResultSet();
      return rs.next() ? rs.getFloat("express_shipping_charge") : 0;
    } catch (Exception e) {
      e.printStackTrace();
      return 0;
    } finally {
      DB.release(conn);
    }
  }

  /**
   * For unit testing only
   */
  public void test() {
    super.test();
    orders_stock.test();
  }

  /**
   * for unit testing only
   */
  public static void main(String[] args) {
    DBconnection conn = null;
    try {
      conn = new DBconnection();

      System.out.println("----- Using numeric ID -----");
      Stock stock = new Stock(conn, new Long(51645));
      stock.test();

      System.out.println("----- Using string name -----");
      stock = new Stock(conn, "CD3-178");
      stock.test();

      System.out.println("----- Using string name (alias) -----");
      stock = new Stock(conn, "185H11T7");
      stock.test();

      System.out.println("----- Using numeric ID and order number -----");
      stock = new Stock(conn, new Long(100113), new Long(100304));
      stock.test();

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
