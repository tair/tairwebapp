// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.26 $
// $Date: 2006/05/26 22:13:38 $
// ------------------------------------------------------------------------------

package org.tair.tfc;


import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.bs.community.BsCountry;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * TfcOrders maps to the Orders table in the tair database. Each instance maps
 * one row of data. Each data object maps to one field of a row in the table.
 * 
 * <p>
 * Implements Serializable so order session attributes can be serialized if
 * server is restarted
 */

public class TfcOrders implements Serializable {
  private static final Logger logger = Logger.getLogger(TfcOrders.class);

  /**
   * Generated serial version UID for serializable interface
   */
  private static final long serialVersionUID = -7434766649397051553L;
  private Long orders_id;
  private Long order_number;
  private java.util.Date order_date;
  private String orderer_comments;

  private String status;
  private String ABRC_comments;
  private String ABRC_public_comments;
  private java.util.Date date_complete;
  private Boolean no_charge;

  private BigInteger person_id;
  private String person_address;
  private String person_city;
  private String person_state;
  private String person_postal_code;
  private String person_phone;
  private String person_email;
  private String person_fax;

  private BigInteger organization_id;
  private String organization_address;
  private String organization_city;
  private String organization_state;
  private String organization_postal_code;
  private String organization_phone;
  private String organization_email;
  private String organization_fax;

  // resolve country ids locally for simplicity
  private BigInteger person_country_id;
  private BsCountry personCountry;
  private BigInteger organization_country_id;
  private BsCountry organizationCountry;

  /**
   * Creates an empty instance of TfcOrders
   */
  public TfcOrders() {
  }

  /**
   * Creates an instance of TfcOrders that reflects the data referenced by
   * submitted orders_id
   * 
   * @param conn An active connection to the database
   * @param orders_id The orders_id to use for retrieving information
   * @throws RecordNotFoundException if no row found for orders_id
   * @throws SQLException if a database error occurs
   */
  public TfcOrders(DBconnection conn, Long orders_id)
      throws RecordNotFoundException, SQLException {

    String query = getBaseQuery() + "WHERE orders_id = ?";
    boolean found;
    try {
      conn.setQuery(query);
      conn.setQueryVariable(orders_id);

      ResultSet results = conn.getResultSet();
      found = populate(results);
    } finally {
      conn.releaseResources();
    }

    if (!found) {
      throw new RecordNotFoundException("No order found for " + "orders_id: "
                                        + orders_id);
    }
  }

  /**
   * Retrieves SELECT query for populating object
   * @return the base SELECT query
   */
  private String getBaseQuery() {
    String query =
      "SELECT orders_id, " + "order_number, " + "order_date, "
          + "orderer_comments, " + "status, " + "ABRC_comments, "
          + "ABRC_public_comments, " + "date_complete, " + "no_charge, "
          + "person_id, " + "person_address, " + "person_city, "
          + "person_country_id, " + "person_state, " + "person_postal_code, "
          + "person_phone, " + "person_email, " + "person_fax, "
          + "organization_id, " + "organization_address, "
          + "organization_city, " + "organization_state, "
          + "organization_country_id, " + "organization_postal_code, "
          + "organization_phone, " + "organization_email, "
          + "organization_fax " + "FROM Orders ";

    return query;

  }

  /**
   * Retrieves data from result set and stores in member variables
   * @param results the input result set
   * 
   * @return <code>true</code> if query produced results, <code>false</code> if
   *         result set is empty (no results)
   * @throws SQLException if a database error occurs
   */
  private boolean populate(ResultSet results) throws SQLException {

    boolean found = results.next();
    if (found) {
      this.orders_id = new Long(results.getLong("orders_id"));
      this.order_number = new Long(results.getLong("order_number"));

      this.order_date = results.getDate("order_date");
      this.orderer_comments = results.getString("orderer_comments");
      this.status = results.getString("status");
      this.ABRC_comments = results.getString("ABRC_comments");

      this.ABRC_public_comments = results.getString("ABRC_public_comments");

      this.date_complete = results.getDate("date_complete");

      String noCharge = results.getString("no_charge");
      this.no_charge = TextConverter.stringToBoolean(noCharge);

      BigDecimal id = results.getBigDecimal("person_id");
      this.person_id = id.toBigInteger();
      this.person_address = results.getString("person_address");
      this.person_city = results.getString("person_city");

      this.person_state = results.getString("person_state");
      this.person_postal_code = results.getString("person_postal_code");
      this.person_phone = results.getString("person_phone");
      this.person_email = results.getString("person_email");
      this.person_fax = results.getString("person_fax");

      id = results.getBigDecimal("organization_id");
      this.organization_id = id.toBigInteger();

      this.organization_address = results.getString("organization_address");

      this.organization_city = results.getString("organization_city");
      this.organization_state = results.getString("organization_state");
      this.organization_postal_code =
        results.getString("organization_postal_code");

      this.organization_phone = results.getString("organization_phone");
      this.organization_email = results.getString("organization_email");
      this.organization_fax = results.getString("organization_fax");

      id = results.getBigDecimal("person_country_id");
      if (id != null) {
        this.person_country_id = id.toBigInteger();
        CountryDelegate countryDel =
          CommunityDelegateFactory.getCountryDelegate();
        IPrimaryKey key =
          CommunityFactory.getCountryPrimaryKey(person_country_id);
        this.personCountry = countryDel.getObject((SequencePrimaryKey)key);
      }

      id = results.getBigDecimal("organization_country_id");
      if (id != null) {
        this.organization_country_id = id.toBigInteger();
        CountryDelegate countryDel =
          CommunityDelegateFactory.getCountryDelegate();
        IPrimaryKey key =
          CommunityFactory.getCountryPrimaryKey(organization_country_id);
        this.organizationCountry =
          countryDel.getObject((SequencePrimaryKey)key);
      }

    }

    return found;
  }

  /**
   * Retrieves orders_id for submitted order number if the order is not new or
   * in progress.
   * 
   * @param conn An active connection to the database
   * @param order_number the order number for the order to translate to an id
   * @return Orders id for submitted order number or <code>null</code> if no
   *         invoice found for order
   * @throws SQLException if a database error occurs
   * @throws InvalidFormException when the invoice is not found
   */
  public static Long translateOrderNumber(DBconnection conn, Long order_number)
      throws SQLException, InvalidFormException {

    Long orders_id = null;

    // Get orders_id corresponding to order_number for invoices with items
    // having a positive amount, stock-orders not in-progress or new, and
    // all items having a notification date.
    String query =
      "SELECT o.orders_id FROM Orders o JOIN Invoice i ON o.orders_id = i.orders_id LEFT JOIN LineItem li ON i.invoice_id = li.invoice_id WHERE o.order_number = ? AND li.amount > 0 AND EXISTS (SELECT 1 FROM Orders_Stock WHERE orders_id = o.orders_id AND status NOT IN ('in_progress', 'new')) GROUP BY o.orders_id HAVING count(li.notification_date) > 0 and sum(li.amount) > 0";

    try {
      conn.setQuery(query);
      conn.setQueryVariable(order_number);
      
      logger.debug("Translate Order Number to Orders ID query: " + query);
      logger.debug("Querying with order number " + order_number);

      ResultSet results = conn.getResultSet();
      if (results.next()) {
        orders_id = new Long(results.getLong("orders_id"));
      } else if (!results.next()) {
        orders_id = TfcOrders.translateOrdersID(conn, order_number);
      } else {
        logger.info("Invoice not found: order number " + order_number);
      }
    } finally {
      conn.releaseResources();
    }

    return orders_id;
  }

  /**
   * Retrieves orders_id for submitted orders_id.
   * 
   * @param conn An active connection to the database
   * @param orders_id Order id to find order number for
   * @return Orders id for submitted order number or <code>null</code> if no
   *         invoice found for order
   * @throws SQLException if a database error occurs
   * @throws InvalidFormException when there is no invoice for the input orders
   *           id
   */
  public static Long translateOrdersID(DBconnection conn, Long orders_id)
      throws SQLException, InvalidFormException {

    String query =
      "SELECT distinct o.orders_id " + "FROM Orders o, Invoice i, LineItem li "
          + "WHERE o.orders_id = ? " + "AND o.orders_id = i.orders_id "
          + "AND i.invoice_id = li.invoice_id " + "AND (li.amount > 0)";

    try {
      conn.setQuery(query);
      conn.setQueryVariable(orders_id);

      ResultSet results = conn.getResultSet();
      if (results.next()) {
        orders_id = new Long(results.getLong("orders_id"));
      } else {
        conn.releaseResources();
        throw new InvalidFormException("Invoice not found.");
      }
    } finally {
      conn.releaseResources();
    }

    return orders_id;
  }

  //
  // Get 'em and set 'em
  //

  /**
   * @return
   */
  public BigInteger get_organization_id() {
    return organization_id;
  }

  /**
   * @param id
   */
  public void set_orders_id(Long id) {
    this.orders_id = id;
  }

  /**
   * @return
   */
  public Long get_orders_id() {
    return orders_id;
  }

  /**
   * @param order_number
   */
  public void set_order_number(Long order_number) {
    this.order_number = order_number;
  }

  /**
   * @return
   */
  public Long get_order_number() {
    return order_number;
  }

  /**
   * @param date
   */
  public void set_order_date(java.util.Date date) {
    this.order_date = date;
  }

  /**
   * @return
   */
  public java.util.Date get_order_date() {
    return order_date;
  }

  /**
   * @param comments
   */
  public void set_orderer_comments(String comments) {
    this.orderer_comments = comments;
  }

  /**
   * @return
   */
  public String get_orderer_comments() {
    return orderer_comments;
  }

  /**
   * @param id
   */
  public void set_person_id(BigInteger id) {
    this.person_id = id;
  }

  /**
   * @return
   */
  public BigInteger get_person_id() {
    return person_id;
  }

  /**
   * @param address
   */
  public void set_person_address(String address) {
    this.person_address = address;
  }

  /**
   * @return
   */
  public String get_person_address() {
    return person_address;
  }

  /**
   * @param city
   */
  public void set_person_city(String city) {
    this.person_city = city;
  }

  /**
   * @return
   */
  public String get_person_city() {
    return person_city;
  }

  /**
   * @param state
   */
  public void set_person_state(String state) {
    this.person_state = state;
  }

  /**
   * @return
   */
  public String get_person_state() {
    return person_state;
  }

  /**
   * Sets country name for person. Country name will immediately be resolved to
   * a BsCountry object. If the input is null, the object and country id will be
   * unchanged.
   * 
   * @param country the name of the person's country
   */
  public void set_person_country(String country) {
    // Set country only if input is not null.
    if (country != null) {
      CountryDelegate del = CommunityDelegateFactory.getCountryDelegate();
      this.personCountry = del.getCountryByName(country);
      this.person_country_id = personCountry.getCountryId();
    }
  }

  /**
   * Retrieves person country name. Value returned actually should be normalized
   * value for country_id in the Country table.
   * @return the country name
   */
  public String get_person_country() {
    return personCountry != null ? personCountry.getName() : null;
  }

  /**
   * Sets country id for person placing order. ID will immediately be resolved
   * to the corresponding BsCountry object.
   * 
   * @param id Country id to set for person
   */
  public void set_person_country_id(Long id) {
    CountryDelegate del = CommunityDelegateFactory.getCountryDelegate();
    IPrimaryKey key =
      CommunityFactory.getCountryPrimaryKey(new BigInteger(id.toString()));
    this.personCountry = del.getObject((SequencePrimaryKey)key);
  }

  /**
   * Retrieves country id for person placing order
   * @return 
   */
  public BigInteger get_person_country_id() {
    return person_country_id;
  }

  /**
   * @param code
   */
  public void set_person_postal_code(String code) {
    this.person_postal_code = code;
  }

  /**
   * @return
   */
  public String get_person_postal_code() {
    return person_postal_code;
  }

  /**
   * @param phone
   */
  public void set_person_phone(String phone) {
    this.person_phone = phone;
  }

  /**
   * @return
   */
  public String get_person_phone() {
    return person_phone;
  }

  /**
   * @param mail
   */
  public void set_person_email(String mail) {
    this.person_email = mail;
  }

  /**
   * @return
   */
  public String get_person_email() {
    return person_email;
  }

  /**
   * @param fax
   */
  public void set_person_fax(String fax) {
    this.person_fax = fax;
  }

  /**
   * @return
   */
  public String get_person_fax() {
    return person_fax;
  }

  /**
   * @param id
   */
  public void set_organization_id(BigInteger id) {
    this.organization_id = id;
  }

  /**
   * @param address
   */
  public void set_organization_address(String address) {
    this.organization_address = address;
  }

  /**
   * @return
   */
  public String get_organization_address() {
    return organization_address;
  }

  /**
   * @param city
   */
  public void set_organization_city(String city) {
    this.organization_city = city;
  }

  /**
   * @return
   */
  public String get_organization_city() {
    return organization_city;
  }

  /**
   * @param state
   */
  public void set_organization_state(String state) {
    this.organization_state = state;
  }

  /**
   * @return
   */
  public String get_organization_state() {
    return organization_state;
  }

  /**
   * Sets country name for organization. Country name will immediately be
   * resolved to a BsCountry object. If the input country is null, the
   * organization country and id will be unchanged.
   * @param country 
   * 
   * @param countryName Name of country to set for person
   */
  public void set_organization_country(String country) {
    if (country != null) {
      CountryDelegate del = CommunityDelegateFactory.getCountryDelegate();
      this.organizationCountry = del.getCountryByName(country);
      this.organization_country_id = organizationCountry.getCountryId();
    }
  }

  /**
   * Retrieves organization country name. Value returned actually should be
   * normalized value for country_id in the Country table.
   * @return 
   */
  public String get_organization_country() {
    return organizationCountry != null ? organizationCountry.getName() : null;
  }

  /**
   * Sets country id for organization placing order. ID will immediately be
   * resolved to the corresponding BsCountry object.
   * 
   * @param id Country id to set for organization
   */
  public void set_organization_country_id(BigInteger id) {
    CountryDelegate del = CommunityDelegateFactory.getCountryDelegate();
    IPrimaryKey key = CommunityFactory.getCountryPrimaryKey(id);
    this.organizationCountry = del.getObject((SequencePrimaryKey)key);
    this.organization_country_id = organizationCountry.getCountryId();
  }

  /**
   * Retrieves country id for organization placing order
   * @return 
   */
  public BigInteger get_organization_country_id() {
    return organization_country_id;
  }

  /**
   * @param code
   */
  public void set_organization_postal_code(String code) {
    this.organization_postal_code = code;
  }

  /**
   * @return
   */
  public String get_organization_postal_code() {
    return organization_postal_code;
  }

  /**
   * @param phone
   */
  public void set_organization_phone(String phone) {
    this.organization_phone = phone;
  }

  /**
   * @return
   */
  public String get_organization_phone() {
    return organization_phone;
  }

  /**
   * @param mail
   */
  public void set_organization_email(String mail) {
    this.organization_email = mail;
  }

  /**
   * @return
   */
  public String get_organization_email() {
    return organization_email;
  }

  /**
   * @param fax
   */
  public void set_organization_fax(String fax) {
    this.organization_fax = fax;
  }

  /**
   * @return
   */
  public String get_organization_fax() {
    return organization_fax;
  }

  /**
   * @param status
   */
  public void set_status(String status) {
    this.status = status;
  }

  /**
   * @return
   */
  public String get_status() {
    return status;
  }

  /**
   * @param comments
   */
  public void set_ABRC_comments(String comments) {
    this.ABRC_comments = comments;
  }

  /**
   * @return
   */
  public String get_ABRC_comments() {
    return ABRC_comments;
  }

  /**
   * @param comments
   */
  public void set_ABRC_public_comments(String comments) {
    this.ABRC_public_comments = comments;
  }

  /**
   * @return
   */
  public String get_ABRC_public_comments() {
    return ABRC_public_comments;
  }

  /**
   * @param value
   */
  public void set_date_complete(java.util.Date value) {
    this.date_complete = value;
  }

  /**
   * @return
   */
  public java.util.Date get_date_complete() {
    return date_complete;
  }

  /**
   * @param no_charge
   */
  public void set_no_charge(Boolean no_charge) {
    this.no_charge = no_charge;
  }

  /**
   * @return
   */
  public Boolean get_no_charge() {
    return no_charge;
  }

  /**
   * Stores data in this object to Orders table in the database. If orders_id is
   * <code>null</code> data is INSERTed to the table and resulting orders_id is
   * stored in the object. If orders_id is not null, database is UPDATEd with
   * current information in the object
   * 
   * <p>
   * New orders are assigned an order number separate from the orders_id primary
   * key. This is done to facilitate credit card authorizations where order
   * number is needed before order is stored to the database. This method will
   * ensure that submitted order has an order_number before storing; if order
   * has a null order_number, one will be assigned at this point. Since all
   * orders should be persisted to the db through this method, this should
   * ensure that all orders are given a number - field is defined as NON-NULL in
   * the db, so database should complain loudly if somehow order number is not
   * set.
   * 
   * @param conn An active connection to the database. Connection must have
   *          INSERT and UPDATE permissions on the Orders table, or an exception
   *          will be thrown
   * @throws InvalidActionException if data not properly set before storing
   * @throws SQLException thrown if a database error occurs
   * @throws Exception 
   */
  public void store(DBconnection conn) throws Exception {

    // ensure required data has been set
    validate();

    if (get_orders_id() == null) {
      // make sure order number is set for new orders
      if (get_order_number() == null) {
        set_order_number(TfcOrderNumber.getNextOrderNumber(conn));
      }

      /*
       * Fix for TAIR-770 Needs to make sure that duplicate order_numbers do not
       * occur in the database. Not adding it in as a database constraint
       * because of old duplicated order_numbers in the database that are
       * attached to multiple active unvoided invoices
       */
      validateOrderNumber(conn);

      insert(conn);
    } else {
      update(conn);
    }
  }

  /**
   * Validates object to ensure that same order number is not uses twice.
   * @param conn the JDBC connection wrapper
   * @throws SQLException when there is a database problem
   * 
   * @throws InvalidActionException if order number is stored twice
   */
  private void validateOrderNumber(DBconnection conn) throws SQLException,
      InvalidActionException {
    try {
      conn.setQuery("SELECT COUNT(*) from Orders where order_number = ?");
      conn.setQueryVariable(1, get_order_number());
      ResultSet results = conn.getResultSet();
      if (results.next()) {
        if (results.getInt(1) > 0) {
          throw new InvalidActionException("Cannot store order with "
                                           + "order_number: "
                                           + get_order_number()
                                           + " because order_number "
                                           + "already exists");
        }
      }
    } finally {
      conn.releaseResources();
    }
  }

  /**
   * Validates object to ensure that required data has been properly set.
   * 
   * @throws InvalidActionException if any data required for storing to db have
   *           not been set
   */
  private void validate() throws InvalidActionException {

    if (get_person_id() == null || get_organization_id() == null) {
      throw new InvalidActionException("Cannot store order with "
                                       + "person id: " + get_person_id() + ", "
                                       + "organization id: "
                                       + get_organization_id());
    }
  }

  /**
   * Inserts a new row into Orders containing contents of object.
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws SQLException if a database error occurs
   */
  private void insert(DBconnection conn) throws SQLException {

    String query =
      StoreUtils.createInsertStatement("Orders", getColumnValuesMap("INSERT"));
    logger.debug("Inserting order number " + order_number + ": " + query);
    // insert row and get newly created id
    Long id;
    try {
      conn.setInsertQuery(query, "orders_id");
      id = conn.executeInsert();
      set_orders_id(id);
      logger.debug("Inserted order id " + id);
    } finally {
      conn.releaseResources();
    }
  }

  /**
   * Updates an existing row in Orders with contents of object
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws RecordNotFoundException if UPDATE does not affect any rows
   * @throws SQLException if a database error occurs
   */
  private void update(DBconnection conn) throws RecordNotFoundException,
      SQLException {

    String query =
      StoreUtils.createUpdateStatement("Orders",
                                       "orders_id",
                                       get_orders_id(),
                                       getColumnValuesMap("UPDATE"));
    try {
      logger.debug("Updating order: " + query);
      conn.setQuery(query);
      int rowsAffected = conn.executeUpdate();
      // error if no row updated
      if (rowsAffected <= 0) {
        String msg =
          "Orders UPDATE failed: no row found for " + "orders_id: "
              + get_orders_id();
        throw new RecordNotFoundException(msg);
      }
    } catch (SQLException e) {
      // SQL exception on insert, probably duplicate order, log and ignore
      // This suppresses user display after the user accidentally clicks
      // on Update more than once.
      logger.error("Error inserting processed order number "
                   + get_order_number(), e);
    } finally {
      conn.releaseResources();
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
   * @param type INSERT or UPDATE
   * 
   * @return Map of column names for table as String keys referencing values for
   *         each column name.
   */
  private Map<String, String> getColumnValuesMap(String type) {
    Map<String, String> columnValues = new HashMap<String, String>();
    if (type.equalsIgnoreCase("INSERT")) {
      columnValues.put("orders_id", "ORDERS_SEQ.NEXTVAL");
    }

    columnValues.put("order_number", TextConverter.dbQuote(get_order_number()));

    columnValues.put("order_date", TextConverter.dbQuote(get_order_date(),
                                                         "mm/dd/yyyy"));

    columnValues.put("orderer_comments",
                     TextConverter.dbQuote(get_orderer_comments()));

    columnValues.put("status", TextConverter.dbQuote(get_status()));

    columnValues.put("ABRC_comments",
                     TextConverter.dbQuote(get_ABRC_comments()));

    columnValues.put("ABRC_public_comments",
                     TextConverter.dbQuote(get_ABRC_public_comments()));

    columnValues.put("date_complete",
                     TextConverter.dbQuote(get_date_complete(), "mm/dd/yyyy"));

    columnValues.put("no_charge", TextConverter.dbQuote(get_no_charge()));

    columnValues.put("person_id", TextConverter.dbQuote(get_person_id()));

    columnValues.put("person_address",
                     TextConverter.dbQuote(get_person_address()));

    columnValues.put("person_city", TextConverter.dbQuote(get_person_city()));

    columnValues.put("person_state", TextConverter.dbQuote(get_person_state()));

    columnValues.put("person_country_id",
                     TextConverter.dbQuote(get_person_country_id()));

    columnValues.put("person_postal_code",
                     TextConverter.dbQuote(get_person_postal_code()));

    columnValues.put("person_phone", TextConverter.dbQuote(get_person_phone()));

    columnValues.put("person_email", TextConverter.dbQuote(get_person_email()));

    columnValues.put("person_fax", TextConverter.dbQuote(get_person_fax()));

    columnValues.put("organization_id",
                     TextConverter.dbQuote(get_organization_id()));

    columnValues.put("organization_address",
                     TextConverter.dbQuote(get_organization_address()));

    columnValues.put("organization_city",
                     TextConverter.dbQuote(get_organization_city()));

    columnValues.put("organization_state",
                     TextConverter.dbQuote(get_organization_state()));

    columnValues.put("organization_country_id",
                     TextConverter.dbQuote(get_organization_country_id()));

    columnValues.put("organization_postal_code",
                     TextConverter.dbQuote(get_organization_postal_code()));

    columnValues.put("organization_phone",
                     TextConverter.dbQuote(get_organization_phone()));

    columnValues.put("organization_email",
                     TextConverter.dbQuote(get_organization_email()));

    columnValues.put("organization_fax",
                     TextConverter.dbQuote(get_organization_fax()));

    return columnValues;

  }

  /**
   * For unit testing only
   */
  public void test() {
    logger.debug("orders id: " + get_orders_id());
    logger.debug("order number: " + get_order_number());
    logger.debug("order date: " + get_order_date());
    logger.debug("comments: " + get_orderer_comments());
    logger.debug("person id: " + get_person_id());
    logger.debug("person address: " + get_person_address());
    logger.debug("person city:" + get_person_city());
    logger.debug("person state: " + get_person_state());
    logger.debug("person country: " + get_person_country());
    logger.debug("person country_id: " + get_person_country_id());
    logger.debug("person postal: " + get_person_postal_code());
    logger.debug("person phone: " + get_person_phone());
    logger.debug("person email: " + get_person_email());
    logger.debug("person fax: " + get_person_fax());
    logger.debug("organization id: " + get_organization_id());

    logger.debug("organization address: " + get_organization_address());

    logger.debug("organization city:" + get_organization_city());
    logger.debug("organization state: " + get_organization_state());

    logger.debug("organization country: " + get_organization_country());

    logger.debug("organization country_id: "
                       + get_organization_country_id());

    logger.debug("organization postal: " + get_organization_postal_code());

    logger.debug("organization phone: " + get_organization_phone());
    logger.debug("organization email: " + get_organization_email());
    logger.debug("organization fax: " + get_organization_fax());

    logger.debug("status: " + get_status());
    logger.debug("ABRC comments: " + get_ABRC_comments());
    logger.debug("ABRC public comments: " + get_ABRC_public_comments());

    logger.debug("date_complete: " + get_date_complete());
    logger.debug("no_charge: " + get_no_charge());
  }

  /**
   * For unit testing only
   * @param args command line arguments
   */
  public static void main(String args[]) {
    DBconnection conn = null;
    Long orderID = null;
    TfcOrders order = null;

    if (args == null || args.length < 1) {
      logger.debug("\nUsage: java org.tair.abrc.TfcOrders order_id\n");
      System.exit(0);
    } else {
      try {
        orderID = new Long(args[0]);
      } catch (NumberFormatException nfe) {
        logger.debug("Invalid order id: " + nfe.getMessage());
        System.exit(0);
      }
    }

    try {
      conn = new DBconnection();
      order = new TfcOrders(conn, orderID);
      order.test();
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
    }
  }

}
