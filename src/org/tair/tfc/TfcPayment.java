// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.6 $
// $Date: 2005/03/02 22:40:56 $
// ------------------------------------------------------------------------------

package org.tair.tfc;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * TfcPayment maps to the Payment table in the TAIR database. Each instance maps
 * one row of data. Each data object maps to one field of a row in the table.
 */

public class TfcPayment {
  private static final Logger logger = Logger.getLogger(TfcPayment.class);

  private Long payment_id;
  private String type;
  private Float amount;
  private java.util.Date payment_date;
  private String verification_code;
  private String name_on_check;
  private String check_number;
  private String payment_ref_id;
  private String request_token;
  private java.util.Date check_date;

  /**
   * Creates an empty instance of TfcPayment
   */
  public TfcPayment() {
  }

  /**
   * Creates an instance of TfcPayment that reflects the data referenced by
   * submitted payment id.
   * 
   * @param conn An active connection to the database
   * @param payment_id The payment_id to use for retrieving information
   * @throws RecordNotFoundException if no row found for payment_id
   * @throws SQLException if a database error occurs
   */
  public TfcPayment(DBconnection conn, Long payment_id)
      throws RecordNotFoundException, SQLException {

    String query = getBaseQuery() + "WHERE payment_id = ?";
    conn.setQuery(query);
    conn.setQueryVariable(payment_id);
    
    logger.debug("Payment query: " + query);
    logger.debug("Payment id: " + payment_id);

    ResultSet results = conn.getResultSet();
    boolean found = populate(results);
    conn.releaseResources();

    if (!found) {
      throw new RecordNotFoundException("No payment exists with payment id: " + payment_id);
    }
  }

  /**
   * Creates SELECT statement for retrieving one row of payment data
   * 
   * @return SELECT for retrieving payment data
   */
  private String getBaseQuery() {
    String query =
      "SELECT payment_id, payment_type, amount, payment_date, verification_code, name_on_check, check_number, payment_ref_id, request_token, check_date FROM Payment ";

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
      set_payment_id(new Long(results.getLong("payment_id")));
      set_type(results.getString("payment_type"));

      float f = results.getFloat("amount");
      if (!results.wasNull()) {
        set_amount(new Float(f));
      }

      set_payment_date(results.getDate("payment_date"));
      set_verification_code(results.getString("verification_code"));
      set_name_on_check(results.getString("name_on_check"));
      set_check_number(results.getString("check_number"));
      set_payment_ref_id(results.getString("payment_ref_id"));
      set_request_token(results.getString("request_token"));
      set_check_date(results.getDate("check_date"));
    }
    return found;
  }

  //
  // get 'em and set 'em
  //

  /**
   * @param token
   */
  public final void set_request_token(String token) {
    this.request_token = token;
  }

  /**
   * @return
   */
  public final String get_request_token() {
    return request_token;
  }

  /**
   * @param payment_id
   */
  public final void set_payment_id(Long payment_id) {
    this.payment_id = payment_id;
  }

  /**
   * @return
   */
  public final Long get_payment_id() {
    return payment_id;
  }

  /**
   * @return
   */
  public final String get_type() {
    return type;
  }

  /**
   * @param type
   */
  public final void set_type(String type) {
    this.type = type;
  }

  /**
   * @param amount
   */
  public final void set_amount(Float amount) {
    this.amount = amount;
  }

  /**
   * @return
   */
  public final Float get_amount() {
    return amount;
  }

  /**
   * @param payment_date
   */
  public final void set_payment_date(java.util.Date payment_date) {
    this.payment_date = payment_date;
  }

  /**
   * @return
   */
  public final java.util.Date get_payment_date() {
    return payment_date;
  }

  /**
   * @param code
   */
  public final void set_verification_code(String code) {
    this.verification_code = code;
  }

  /**
   * @return
   */
  public String get_verification_code() {
    return verification_code;
  }

  /**
   * @param name_on_check
   */
  public final void set_name_on_check(String name_on_check) {
    this.name_on_check = name_on_check;
  }

  /**
   * @return
   */
  public final String get_name_on_check() {
    return name_on_check;
  }

  /**
   * @param check_number
   */
  public final void set_check_number(String check_number) {
    this.check_number = check_number;
  }

  /**
   * @return
   */
  public final String get_check_number() {
    return check_number;
  }

  /**
   * @param id
   */
  public final void set_payment_ref_id(String id) {
    this.payment_ref_id = id;
  }

  /**
   * @return
   */
  public String get_payment_ref_id() {
    return payment_ref_id;
  }

  /**
   * @param check_date
   */
  public final void set_check_date(java.util.Date check_date) {
    this.check_date = check_date;
  }

  /**
   * @return
   */
  public final java.util.Date get_check_date() {
    return check_date;
  }

  /**
   * Stores data in this object to Payment table. If payment_id is
   * <code>null</code> data is INSERTed to the table and resulting payment_id is
   * stored in the object. If payment_id is not null, database is UPDATEd with
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

    if (get_payment_id() == null) {
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
    // require payment type, amount and payment date at a minimum
    if (get_type() == null || get_amount() == null
        || get_payment_date() == null) {

      String msg =
        "Cannot store Payment with type " + get_type() + ", " + "amount: "
            + get_amount() + ", " + "payment date: " + get_payment_date();

      throw new InvalidActionException(msg);
    }
  }

  /**
   * Inserts a new row into Payment containing contents of object
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws SQLException if a database error occurs
   */
  private void insert(DBconnection conn) throws SQLException {

    try {
      // Get a sequence number.
      conn.setQuery("SELECT PAYMENT_SEQ.NEXTVAL FROM DUAL");
      ResultSet results = conn.getResultSet();
      if (results.next()) {
        set_payment_id(results.getLong(1));
      }
      conn.releaseResources();

      String query =
        StoreUtils.createInsertStatement("Payment", getColumnValuesMap());

      // insert row and get newly created id
      conn.setQuery(query);
      conn.executeUpdate();
    } finally {
      if (conn != null) {
        conn.releaseResources();
      }
    }
  }

  /**
   * Updates an existing row in Payment with contents of object
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws RecordNotFoundException if UPDATE does not affect any rows
   * @throws SQLException if a database error occurs
   */
  private void update(DBconnection conn) throws RecordNotFoundException,
      SQLException {

    String query =
      StoreUtils.createUpdateStatement("Payment",
                                       "payment_id",
                                       get_payment_id(),
                                       getColumnValuesMap());

    conn.setQuery(query);
    int rowsAffected = conn.executeUpdate();
    conn.releaseResources();

    // error if no row updated
    if (rowsAffected <= 0) {
      String msg =
        "Payment UPDATE failed: no row found for " + "payment_id: "
            + get_payment_id();

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
  private Map<String, String> getColumnValuesMap() {
    Map<String, String> columnValues = new HashMap<String, String>();

    columnValues.put("payment_id", TextConverter.dbQuote(this.get_payment_id()));
    columnValues.put("payment_type", TextConverter.dbQuote(get_type()));
    columnValues.put("amount", TextConverter.dbQuote(get_amount()));

    columnValues.put("payment_date", TextConverter.dbQuote(get_payment_date(),
                                                           "mm/dd/yyyy"));

    columnValues.put("verification_code",
                     TextConverter.dbQuote(get_verification_code()));

    columnValues.put("name_on_check",
                     TextConverter.dbQuote(get_name_on_check()));

    columnValues.put("check_number", TextConverter.dbQuote(get_check_number()));

    columnValues.put("payment_ref_id",
                     TextConverter.dbQuote(get_payment_ref_id()));

    columnValues.put("request_token",
                     TextConverter.dbQuote(get_request_token()));

    columnValues.put("check_date", TextConverter.dbQuote(get_check_date(),
                                                         "mm/dd/yyyy"));

    return columnValues;
  }

  /**
   * Deletes this payment from the database. Any foreign key conflicts (in
   * Invoice_Payment) must be resolved by deleting all invoice to payment
   * associations before calling this method or SQLException will be thrown.
   * Connection must have INSERT/UPDATE/DELETE privileges, or exception will be
   * thrown.
   * 
   * @param conn An active connection to the database
   * @throws SQLException thrown if a database error occurs
   */
  public void delete(DBconnection conn) throws SQLException {
    String query = "DELETE Payment WHERE payment_id = ?";
    try {
      conn.setQuery(query);
      conn.setQueryVariable(get_payment_id());
      conn.executeUpdate();
    } catch (Exception e) {
      conn.releaseResources();
    }
  }
}
