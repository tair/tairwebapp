// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.13 $
// $Date: 2006/07/26 22:00:31 $
// ------------------------------------------------------------------------------
package org.tair.tfc;


import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.abrc.payment.LineItemCollection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * TfcInvoice maps to the Invoice table in the tair database. Each instance maps
 * one row of data. Each data object maps to one field of a row in the table.
 */

public class TfcInvoice implements Serializable {

  /**
   * Generated serial version UID for Serializable object
   */
  private static final long serialVersionUID = -4649176224798467726L;

  private static final Logger logger = Logger.getLogger(TfcInvoice.class);

  private Long invoice_id;
  private String invoice_number;
  private Long orders_id;
  private java.util.Date invoice_date;
  private java.util.Date date_invoice_created;
  private Float auth_amount;
  private String payment_method;
  private java.util.Date date_last_modified;
  private String verification_code;
  private String status;
  private Float invoice_total;
  private String payment_ref_id;
  private String request_token;

  /**
   * Creates an empty instance of TfcInvoice with default invoice_date of now,
   * and status of "new".
   */
  public TfcInvoice() {
    set_date_invoice_created(new java.util.Date());
    set_status(DataConstants.getNewInvoice());
  }

  /**
   * Creates an instance of TfcInvoice that reflects the data referenced by
   * submitted invoice_id.
   * 
   * @param conn An active connection to the database
   * @param invoice_id The invoice_id to use for retrieving information
   * @throws RecordNotFoundException if no row found for submitted id
   * @throws SQLException if a database error occurs
   */
  public TfcInvoice(DBconnection conn, Long invoice_id) throws SQLException {

    if (invoice_id == null) {
      throw new SQLException("Null invoice id for querying invoice");
    }
    String query = getBaseQuery() + "WHERE invoice_id = ?";
    boolean found = false;
    try {
      conn.setQuery(query);
      conn.setQueryVariable(invoice_id);

      ResultSet results = conn.getResultSet();
      found = populate(results);
    } finally {
      conn.releaseResources();
    }

    if (!found) {
      throw new RecordNotFoundException("No invoice exists with "
                                        + "invoice id: " + invoice_id);
    }
  }

  /**
   * Creates SELECT statement for retrieving one row of invoice data
   * 
   * @return SELECT for retrieving invoice data
   */
  private String getBaseQuery() {
    String query =
      "SELECT invoice_id, " + "orders_id, " + "invoice_date, "
          + "date_invoice_created, " + "auth_amount, " + "payment_method, "
          + "date_last_modified, " + "verification_code, " + "status, "
          + "invoice_total, " + "payment_ref_id, " + "request_token "
          + "FROM Invoice ";

    return query;
  }

  /**
   * Retrieves results of SQL query and populates member variables
   * 
   * @param results ResultSet from population query
   * @return <code>true</code> if a row of results was found, <code>false</code>
   *         if population query produced no results
   * @throws SQLException if a database error occurs
   */
  private boolean populate(ResultSet results) throws SQLException {
    boolean found = results.next();

    if (found) {
      set_invoice_id(new Long(results.getLong("invoice_id")));
      set_orders_id(new Long(results.getLong("orders_id")));
      set_date_invoice_created(results.getDate("date_invoice_created"));

      java.util.Date d = results.getDate("invoice_date");
      if (!results.wasNull()) {
        set_invoice_date(d);
      }

      float f = results.getFloat("auth_amount");
      if (!results.wasNull()) {
        set_auth_amount(new Float(f));
      }

      set_payment_method(results.getString("payment_method"));
      set_date_last_modified(results.getDate("date_last_modified"));
      set_verification_code(results.getString("verification_code"));
      set_status(results.getString("status"));

      f = results.getFloat("invoice_total");
      if (!results.wasNull()) {
        set_invoice_total(new Float(f));
      }

      set_payment_ref_id(results.getString("payment_ref_id"));
      set_request_token(results.getString("request_token"));
    }

    return found;
  }

  /**
   * Retrieves invoice_id for submitted orders_id. Since orders_id is UNIQUE
   * within Invoice, this translation should reliably return the single invoice
   * for a stock order. This method can also be used to determine if an order
   * has an invoice associated with it, since not all stock orders do (either
   * because they have no charges or because they pre-date invoice/payment
   * functionality)
   * 
   * @param conn An active connection to the database
   * @param orders_id Order id to find invoice id for
   * @return Invoice id for submitted orders_id or <code>null</code> if no
   *         invoice found for order
   * @throws SQLException if a database error occurs
   */
  public static Long translateOrdersID(DBconnection conn, Long orders_id)
      throws SQLException {

    Long invoice_id = null;

    String query =
      "SELECT invoice_id " + "FROM Invoice " + "WHERE orders_id = ?";

    try {
      conn.setQuery(query);
      conn.setQueryVariable(orders_id);

      ResultSet results = conn.getResultSet();
      if (results.next()) {
        invoice_id = new Long(results.getLong("invoice_id"));
      }
    } finally {
      conn.releaseResources();
    }

    return invoice_id;
  }

  /**
   * Retrieves order number for submitted orders_id.
   * 
   * @param conn An active connection to the database
   * @param orders_id Order id to find order number for
   * @return Order number for submitted orders_id or <code>null</code> if no
   *         order found
   * @throws SQLException if a database error occurs
   */
  public static Long translateOrdersNumber(DBconnection conn, Long orders_id)
      throws SQLException {

    Long order_number = null;

    String query = "SELECT order_number FROM Orders WHERE orders_id = ?";
    conn.setQuery(query);
    conn.setQueryVariable(orders_id);

    ResultSet results = conn.getResultSet();
    if (results.next()) {
      order_number = new Long(results.getLong("order_number"));
    }
    conn.releaseResources();

    return order_number;
  }

  /**
   * Retrieves orders_id for submitted invoice_id.
   * 
   * @param conn An active connection to the database
   * @param invoice_id the invoice id to translate to an orders id
   * @return Orders id for submitted invoice_id or <code>null</code> if no
   *         invoice found for order
   * @throws SQLException if a database error occurs
   */
  public static Long translateInvoiceID(DBconnection conn, Long invoice_id)
      throws SQLException {

    Long orders_id = null;

    String query =
      "SELECT DISTINCT i.orders_id FROM Invoice i JOIN LineItem li ON i.invoice_id = li.invoice_id WHERE i.invoice_id = ? AND (li.amount > 0 AND li.notification_date IS NOT NULL)";

    try {
      conn.setQuery(query);
      conn.setQueryVariable(invoice_id);
      
      logger.debug("Translate Invoice ID to Orders ID query: " + query);
      logger.debug("Querying with invoice id " + invoice_id);

      ResultSet results = conn.getResultSet();
      if (results.next()) {
        orders_id = new Long(results.getLong("orders_id"));
      } else {
        logger.info("Invoice not found--invoice id " + invoice_id);
      }
    } finally {
      conn.releaseResources();
    }

    return orders_id;
  }

  /**
   * Gets the Eligible For Payment Amount for an Invoice.
   * 
   * @param conn An active connection to the database
   * @param orders_id Order id to find the Eligible For Payment Amount for
   * @return The amount that is Eligible For Payment
   * @throws SQLException if a database error occurs
   */
  public static float getEligibleForPayment(DBconnection conn, Long invoice_id)
      throws SQLException {

    float amount = 0;

    LineItemCollection eligibleItems =
      new LineItemCollection(conn, invoice_id, "shippedNotPaid");

    Iterator<TfcLineItem> itemIter = eligibleItems.iterator();
    if (itemIter != null) {
      while (itemIter.hasNext()) {
        TfcLineItem item = itemIter.next();
        amount += item.get_amount().floatValue();
      }
    }

    return amount;

  }

  /**
   * Convenience method to determine if invoice is a "credit card" invoice
   * (meaning a credit card authorization was made when stock order was placed)
   * or a "purchase order" invoice. This distinction is needed in several parts
   * of order/invoice maintenance code where type specific actions must be taken
   * on invoices according to their payment type.
   * 
   * @return <code>true</code> if payment method of invoice is credit card;
   *         <code>false</code> if payment method is not credit card (i.e. null
   *         or purchase order).
   */
  public boolean isCreditCard() {
    String ccMethod = DataConstants.getCreditCardPaymentMethod();
    return (ccMethod.equals(get_payment_method()));
  }

  //
  // get 'em and set 'em
  //

  public final void set_invoice_id(Long invoice_id) {
    this.invoice_id = invoice_id;
  }

  public final Long get_invoice_id() {
    return invoice_id;
  }

  // mjr - use this setter when invoice number is implemented in full
  /*
   * public final void set_invoice_number( String invoice_number ) {
   * this.invoice_number = invoice_number; }
   */
  public final String get_invoice_number() {
    Long id = get_invoice_id();
    invoice_number = id == null ? null : "ABRC" + id.toString();
    return invoice_number;
  }

  public final void set_orders_id(Long orders_id) {
    this.orders_id = orders_id;
  }

  public final Long get_orders_id() {
    return orders_id;
  }

  public final void set_invoice_date(java.util.Date invoice_date) {
    this.invoice_date = invoice_date;
  }

  private final void set_date_invoice_created(java.util.Date date_invoice_created) {
    this.date_invoice_created = date_invoice_created;
  }

  public final java.util.Date get_invoice_date() {
    return invoice_date;
  }

  public final java.util.Date get_date_invoice_created() {
    return date_invoice_created;
  }

  public final void set_auth_amount(Float amount) {
    this.auth_amount = amount;
  }

  public final Float get_auth_amount() {
    return auth_amount;
  }

  public final void set_payment_method(String method) {
    this.payment_method = method;
  }

  public final String get_payment_method() {
    return payment_method;
  }

  public final void set_date_last_modified(java.util.Date modified) {
    this.date_last_modified = modified;
  }

  public final java.util.Date get_date_last_modified() {
    return date_last_modified;
  }

  public final void set_verification_code(String code) {
    this.verification_code = code;
  }

  public final String get_verification_code() {
    return verification_code;
  }

  public final void set_status(String status) {
    this.status = status;
  }

  public final String get_status() {
    return status;
  }

  public final void set_invoice_total(Float total) {
    this.invoice_total = total;
  }

  /**
   * Returns invoice total value as stored in the database. This method may be
   * overridden by sub-classes to present a dynamically calculated total that
   * exactly matches total of line items for an invoce, however this version
   * simply returns the current value of the invoice total member variable
   * 
   * @return Total charges for invoice or <code>null</code> if invoice has no
   *         charges
   */
  public Float get_invoice_total() {
    return invoice_total;
  }

  public final void set_payment_ref_id(String id) {
    this.payment_ref_id = id;
  }

  public final String get_payment_ref_id() {
    return payment_ref_id;
  }

  public String get_request_id() {
    return this.payment_ref_id;
  }

  public String get_request_token() {
    return this.request_token;
  }

  public void set_request_token(String token) {
    this.request_token = token;
  }

  /**
   * Stores data in this object to Invoice table. If invoice_id is
   * <code>null</code> data is INSERTed to the table and resulting invoice_id is
   * stored in the object. If invoice_id is not null, database is UPDATEd with
   * current information in the object.
   * 
   * @param conn An active connection to the database with INSERT/UPDATE
   *          permissions
   * @throws InvalidActionException if data required for storing has not been
   *           correctly set
   * @throws SQLException thrown if a database error occurs
   */
  public void store(DBconnection conn) throws InvalidActionException,
      SQLException {

    // ensure required data has been set
    validate();

    // set now as date last modified
    set_date_last_modified(new java.util.Date());

    if (get_invoice_id() == null) {
      insert(conn);
    } else {
      update(conn);
    }

  }

  /**
   * Validates object to ensure that required data has been properly set.
   * 
   * @throws InvalidActionException if any data required for storing to db have
   *           not been set
   */
  private void validate() throws InvalidActionException {
    // require orders_id, status and payment method at a minimum

    if (get_orders_id() == null || get_status() == null
        || get_payment_method() == null) {

      String msg =
        "Cannot store Invoice with orders_id " + get_orders_id() + ", "
            + "status: " + get_status() + ", " + "payment method: "
            + get_payment_method();

      throw new InvalidActionException(msg);
    }
  }

  /**
   * Inserts a new row into Invoice containing contents of object
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws SQLException if a database error occurs
   */
  private void insert(DBconnection conn) throws SQLException {

    String query =
      StoreUtils.createInsertStatement("Invoice", getColumnValuesMap("INSERT"));

    logger.info("----------TRACE INSERT INVOICE");
    Thread.dumpStack();

    // insert row and get newly created id
    conn.setInsertQuery(query, "invoice_id");
    Long id = conn.executeInsert();
    set_invoice_id(id);
    conn.releaseResources();
  }

  /**
   * Updates an existing row in Invoice with contents of object
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws RecordNotFoundException if UPDATE does not affect any rows
   * @throws SQLException if a database error occurs
   */
  private void update(DBconnection conn) throws RecordNotFoundException,
      SQLException {

    String query =
      StoreUtils.createUpdateStatement("Invoice",
                                       "invoice_id",
                                       get_invoice_id(),
                                       getColumnValuesMap("UPDATE"));

    conn.setQuery(query);
    int rowsAffected = conn.executeUpdate();
    conn.releaseResources();

    // error if no row updated
    if (rowsAffected <= 0) {
      String msg =
        "Invoice UPDATE failed: no row found for " + "invoice_id: "
            + get_invoice_id();
      throw new RecordNotFoundException(msg);
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
   * @return Map of column names for table as String keys referencing values for
   *         each column name.
   */
  private Map<String, String> getColumnValuesMap(String type) {
    Map<String, String> columnValues = new HashMap<String, String>();
    if (type.equalsIgnoreCase("INSERT")) {
      columnValues.put("invoice_id", "INVOICE_SEQ.NEXTVAL");
    }
    columnValues.put("orders_id", TextConverter.dbQuote(get_orders_id()));

    columnValues.put("invoice_date",
                     TextConverter.dbQuote(get_invoice_date(), "mm/dd/yyyy"));

    columnValues.put("date_invoice_created",
                     TextConverter.dbQuote(get_date_invoice_created(),
                                           "mm/dd/yyyy"));

    columnValues.put("auth_amount", TextConverter.dbQuote(get_auth_amount()));

    columnValues.put("payment_method",
                     TextConverter.dbQuote(get_payment_method()));

    columnValues.put("verification_code",
                     TextConverter.dbQuote(get_verification_code()));

    columnValues.put("status", TextConverter.dbQuote(get_status()));

    columnValues.put("invoice_total",
                     TextConverter.dbQuote(get_invoice_total()));

    columnValues.put("payment_ref_id",
                     TextConverter.dbQuote(get_payment_ref_id()));

    columnValues.put("request_token",
                     TextConverter.dbQuote(get_request_token()));

    columnValues.put("date_last_modified",
                     TextConverter.dbQuote(get_date_last_modified(),
                                           "mm/dd/yyyy"));
    return columnValues;

  }
}
