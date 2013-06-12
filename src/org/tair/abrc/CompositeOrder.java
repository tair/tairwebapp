// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.106 $
// $Date: 2006/08/01 23:38:57 $
// ------------------------------------------------------------------------------

package org.tair.abrc;


import java.io.Serializable;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.jboss.logging.Logger;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.payment.creditcard.CreditCardController;
import org.tair.abrc.stock.OrderStockCollection;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsAddress;
import org.tair.bs.community.BsAffiliation;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsCountry;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.DB;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcOrderNumber;
import org.tair.tfc.TfcOrders;
import org.tair.tfc.TfcStockNote;
import org.tair.utilities.DataConstants;
import org.tair.utilities.EmptyOrderException;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;

import com.poesys.bs.delegate.DelegateException;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * CompositeOrder extends TfcOrders and is the main composite class for
 * creating, updating and storing ABRC stock orders. CompositeOrder contains
 * several attributes of stock order as classes and wraps many of their
 * accessor/mutators. The contained objects are:
 * 
 * <ul>
 * <li>BsPerson - person object for user placing order
 * <li>BsOrganization - organization object for lab user has chosen to place
 * order with
 * <li>CompositeInvoice - invoice representing payment information and itemized
 * charges for order.
 * </ul>
 * 
 * Orders maintain a reference to full composite objects for associated person
 * and lab attributes. When someone creates a new order, referencing the
 * accessor methods of CompositeOrder directly returns the value held by the
 * relevant Composite object. If the instance of CompositeOrder represents an
 * order that already exists, accessor methods return the values that were
 * stored with the order, not the values associated directly with the composite.
 * This allows information such as address information to be edited before the
 * order is placed without having to worry about keeping information in
 * composite objects and order synchronized. The first time the system stores
 * the order, it translates information from composite objects to member
 * variables of TfcOrders. It also sends emails about the order to the customer
 * and to the lab PI, as well as any special notes associated with stocks.
 * 
 * <p>
 * In addition to person and organization information, the system stores stock
 * information internally as <code>Stock</code> objects that extend
 * <code>TfcStock</code> to contain order specific data.
 * 
 * @see BsPerson
 * @see BsOrganization
 * @see TfcOrders
 * @see Stock
 */

public class CompositeOrder extends TfcOrders implements Serializable {

  private static final Logger logger = Logger.getLogger(CompositeOrder.class);

  /** Serializable required field */
  private static final long serialVersionUID = -1397122182788919503L;

  /** The Invoice associated with the order */
  private CompositeInvoice invoice;

  /** A specialized collection to handle Stock objects */
  private OrderStockCollection stocks;

  /** Is the order new? */
  private boolean newOrder;

  /**
   * Users cannot have quantities > 1 for user fee stocks. If the user tries to
   * add a stock that's already in the order, duplicateStocks will hold it
   * temporarily so a message can be displayed to the user. Since order can have
   * a lifespan extending over several pages, the system may populate this
   * collection and clear it multiple times.
   */
  private ArrayList<Stock> duplicateStocks;

  /**
   * A flag to track whether a curator is placing the order on behalf of a user.
   * This property should be set true only for a new order. This allows the
   * curator to enter ABRC comments on order pages that a normal user can't see.
   */
  private boolean proxyOrder = false;

  /**
   * A flag to track if the user has canceled the order; this is set true when
   * the servlet calls the cancel() method and triggers the sending of a
   * specialized email message when the system calls store().
   */
  private boolean orderCancelled = false;

  /**
   * Get the order using the order number.
   * 
   * @param order_number the order number of the order to get
   * @return a composite order
   */
  public static CompositeOrder byOrderNumber(Long order_number) {
    DBconnection conn = DB.getRead();
    try {
      conn.setQuery("SELECT orders_id FROM Orders WHERE order_number = ?");
      conn.setQueryVariable(new Long(order_number));
      ResultSet rs = conn.getResultSet();
      if (rs.next())
        return new CompositeOrder(conn, new Long(rs.getLong("orders_id")));
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DB.release(conn);
    }
    return null;
  }

  /**
   * Creates an empty instance of CompositeOrder. Order date is set to the
   * current date by default, creating a new order.
   */
  public CompositeOrder() {
    super();

    // set today's date for order
    set_order_date(new java.util.Date());
    newOrder = true;
  }

  /**
   * Creates an instance of CompositeOrder and populating with order info. in
   * the database associated with orderID
   * 
   * @param conn An active connection to the database
   * @param orderID orders_id to create CompositeOrder for
   * @throws SQLException thrown if an error occurs while retrieving information
   */
  public CompositeOrder(DBconnection conn, Long orderID) throws SQLException {

    super(conn, orderID);
    newOrder = false;

    stocks = new OrderStockCollection(conn, orderID);

    // only create invoice if order has one - not all will
    Long invoiceID = TfcInvoice.translateOrdersID(conn, orderID);
    if (invoiceID != null) {
      invoice = new CompositeInvoice(conn, invoiceID);
    }
  }

  /**
   * Creates an instance of CompositeOrder and populating with order info. in
   * the database associated with orderID. It populates order info based on mode
   * so it doesn't need to populate useless information
   * 
   * @param conn An active connection to the database
   * @param orderID orders_id to create CompositeOrder for
   * @param mode that tells you what you want to populate
   * @throws SQLException thrown if an error occurs while retrieving information
   */
  public CompositeOrder(DBconnection conn, Long orderID, String mode)
      throws SQLException {

    super(conn, orderID);
    if (mode.equals("download_items")) {
      newOrder = false;

      stocks = new OrderStockCollection(conn, orderID);

      // only create invoice if order has one - not all will
      Long invoiceID = TfcInvoice.translateOrdersID(conn, orderID);
      if (invoiceID != null) {
        invoice = new CompositeInvoice(conn, invoiceID);
      }
    } else if (mode.equals("download_orders")
               || mode.equals("send_payment_request")
               || mode.equals("update_list_items")) {
      newOrder = false;
      stocks = new OrderStockCollection(conn, orderID);
    } else {
      newOrder = false;
      stocks = new OrderStockCollection(conn, orderID);
    }
    // only create invoice if order has one - not all will
    Long invoiceID = TfcInvoice.translateOrdersID(conn, orderID);
    if (invoiceID != null) {
      invoice = new CompositeInvoice(conn, invoiceID);
    }

  }

  /**
   * Creates an instance of CompositeOrder with fields null for population
   * externally. This constructor is best used for "cloning" a new order from an
   * existing one since it allows manual control of newOrder flag
   * 
   * @param newOrder if <code>true</code> order flagged as new order, otherwise
   *          as existing order
   */
  public CompositeOrder(boolean newOrder) {
    super();
    this.newOrder = newOrder;
  }

  /**
   * Sets any orderer comments for this order. This version overrides
   * implementation in superclass to filter all entries through the
   * TextConverter.textToDB() method, which transforms hard returns that may
   * have been entered in HTML textareas into backslashes (\), which is how they
   * should be stored in the db.
   * 
   * @param comments Comments to set for order
   */
  public void set_orderer_comments(String comments) {
    super.set_orderer_comments(TextConverter.textToDB(comments));
  }

  /**
   * Sets any ABRC private comments for this order. This version overrides
   * implementation in superclass to filter all entries through the
   * TextConverter.textToDB() method, which transforms hard returns that may
   * have been entered in HTML textareas into backslashes (\), which is how they
   * should be stored in the db.
   * 
   * @param comments Comments to set for order
   */
  public void set_ABRC_comments(String comments) {
    super.set_ABRC_comments(TextConverter.textToDB(comments));
  }

  /**
   * Sets any ABRC public comments for this order. This version overrides
   * implementation in superclass to filter all entries through the
   * TextConverter.textToDB() method, which transforms hard returns that may
   * have been entered in HTML textareas into backslashes (\), which is how they
   * should be stored in the db.
   * 
   * @param comments Comments to set for order
   */
  public void set_ABRC_public_comments(String comments) {
    super.set_ABRC_public_comments(TextConverter.textToDB(comments));
  }

  /**
   * Sets orderer comments for order, optionally allowing submitted value to be
   * appended to any comments already entered instead of completely replacing
   * comments with current value
   * 
   * @param value Comments to set for order
   * @param append if <code>true</code> submitted value is appended to any
   *          existing value; if <code>false</code> any submitted comments will
   *          be replaced by newly submitted value
   */
  public void set_orderer_comments(String value, boolean append) {
    String existing = super.get_orderer_comments();
    if (append && existing != null) {
      super.set_orderer_comments(existing
                                 + "\\"
                                 + EmptyTextConverter.convert(TextConverter.textToDB(value)));
    } else {
      super.set_orderer_comments(TextConverter.textToDB(value));
    }
  }

  /**
   * Creates a copy of this order with all data from existing order except for
   * stocks which must be added to new order & removed from existing order
   * manually. This method is used to create a new order for selected stocks in
   * case stocks are on long term back order and curator wants to complete &
   * invoice other stocks in order. New order will have its newOrder flag set to
   * <code>false</code> so that person/org data is returned from the order, not
   * from composite objects.
   * 
   * @return <code>CompositeOrder</code> that has exact data as existing order
   *         without any stocks in it.
   */
  public CompositeOrder copy() {
    CompositeOrder copiedOrder = new CompositeOrder(false);
    copiedOrder.set_person(get_person());
    copiedOrder.set_organization(get_organization());
    copiedOrder.set_order_date(get_order_date());
    copiedOrder.set_orderer_comments(get_orderer_comments());
    copiedOrder.set_person_id(get_person_id());
    copiedOrder.set_person_address(get_person_address());
    copiedOrder.set_person_city(get_person_city());
    copiedOrder.set_person_state(get_person_state());
    copiedOrder.set_person_country(get_person_country());
    copiedOrder.set_person_postal_code(get_person_postal_code());
    copiedOrder.set_person_phone(get_person_phone());
    copiedOrder.set_person_email(get_person_email());
    copiedOrder.set_person_fax(get_person_fax());
    copiedOrder.set_organization_id(get_organization_id());
    copiedOrder.set_organization_address(get_organization_address());
    copiedOrder.set_organization_city(get_organization_city());
    copiedOrder.set_organization_state(get_organization_state());
    copiedOrder.set_organization_country(get_organization_country());

    copiedOrder.set_organization_postal_code(get_organization_postal_code());

    copiedOrder.set_organization_phone(get_organization_phone());
    copiedOrder.set_organization_email(get_organization_email());
    copiedOrder.set_organization_fax(get_organization_fax());

    copiedOrder.set_ABRC_comments(get_ABRC_comments());
    copiedOrder.set_ABRC_public_comments(get_ABRC_public_comments());
    copiedOrder.set_status(get_status());
    copiedOrder.set_date_complete(get_date_complete());
    copiedOrder.set_no_charge(get_no_charge());

    return copiedOrder;
  }

  /**
   * Retrieves street address of person associated with order. If order is new,
   * this value comes directly from BsPerson, if order is an order that has
   * already been placed, this value comes directly from the value stored with
   * the order in Orders table.
   * 
   * @return Street address of person placing order, or <code>null</code> if no
   *         person associated with order
   */
  public String get_person_address() {
    return (newOrder && hasPerson()) ? get_person().getCommunity().getAddress().getAddress()
        : super.get_person_address();
  }

  /**
   * Retrieves city of person associated with order. If order is new, this value
   * comes directly from BsPerson, if order is an order that has already been
   * placed, this value comes directly from the value stored with the order in
   * Orders table.
   * 
   * @return City of person placing order, or <code>null</code> if no person
   *         associated with order
   */
  public String get_person_city() {
    return (newOrder && hasPerson()) ? get_person().getCommunity().getAddress().getCity()
        : super.get_person_city();
  }

  /**
   * Retrieves state or region of person associated with order. If order is new,
   * this value comes directly from BsPerson, if order is an order that has
   * already been placed, this value comes directly from the value stored with
   * the order in Orders table.
   * 
   * @return State or region of person placing order, or <code>null</code> if no
   *         person associated with order
   */
  public String get_person_state() {
    return (newOrder && hasPerson()) ? get_person().getCommunity().getAddress().getRegion()
        : super.get_person_state();
  }

  /**
   * Retrieves country of person associated with order. If order is new, this
   * value comes directly from BsPerson, if order is an order that has already
   * been placed, this value comes directly from the value stored with the order
   * in Orders table.
   * 
   * @return Country of person placing order, or <code>null</code> if no person
   *         associated with order
   */
  public String get_person_country() {
    return (newOrder && hasPerson()) ? get_person().getCommunity().getAddress().getCountryObject().getName()
        : super.get_person_country();
  }

  /**
   * Retrieves postal code of person associated with order. If order is new,
   * this value comes directly from BsPerson, if order is an order that has
   * already been placed, this value comes directly from the value stored with
   * the order in Orders table.
   * 
   * @return Postal code of person placing order, or <code>null</code> if no
   *         person associated with order
   */
  public String get_person_postal_code() {
    return (newOrder && hasPerson()) ? get_person().getCommunity().getAddress().getPostalCode()
        : super.get_person_postal_code();
  }

  /**
   * Retrieves work phone number of person associated with order. If order is
   * new, this value comes directly from BsPerson, if order is an order that has
   * already been placed, this value comes directly from the value stored with
   * the order in Orders table.
   * 
   * @return Work phone number of person placing order, or <code>null</code> if
   *         no person associated with order
   */
  public String get_person_phone() {
    return (newOrder && hasPerson()) ? get_person().getCommunity().getPhone("work")
        : super.get_person_phone();
  }

  /**
   * Retrieves email address of person associated with order. This value comes
   * directly from BsPerson.
   * <p>
   * TAIR-344: Change behavior from getting the email stored with the order for
   * old orders.
   * </p>
   * 
   * @return Current email address of person placing order, or <code>null</code>
   *         if no person associated with order
   */
  public String get_person_email() {
    return (hasPerson()) ? get_person().getCommunity().getEmail() : null;
  }

  /**
   * Retrieves fax number of person associated with order. If order is new, this
   * value comes directly from BsPerson, if order is an order that has already
   * been placed, this value comes directly from the value stored with the order
   * in Orders table.
   * 
   * @return Fax number of person placing order, or <code>null</code> if no
   *         person associated with order
   */
  public String get_person_fax() {
    return (newOrder && hasPerson()) ? get_person().getCommunity().getPhone("fax")
        : super.get_person_fax();
  }

  /**
   * Retrieves street address of organization associated with order. If order is
   * new, this value comes directly from BsOrganization, if order is an order
   * that has already been placed, this value comes directly from the value
   * stored with the order in Orders table.
   * 
   * @return Street address of organization placing order, or <code>null</code>
   *         if no organization associated with order
   */
  public String get_organization_address() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getAddress().getAddress()
        : super.get_organization_address();
  }

  /**
   * Retrieves city of organization associated with order. If order is new, this
   * value comes directly from BsOrganization, if order is an order that has
   * already been placed, this value comes directly from the value stored with
   * the order in Orders table.
   * 
   * @return City of organization placing order, or <code>null</code> if no
   *         organization associated with order
   */
  public String get_organization_city() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getAddress().getCity()
        : super.get_organization_city();
  }

  /**
   * Retrieves state or region of organization associated with order. If order
   * is new, this value comes directly from BsOrganization, if order is an order
   * that has already been placed, this value comes directly from the value
   * stored with the order in Orders table.
   * 
   * @return State or region of organization placing order, or <code>null</code>
   *         if no organization associated with order
   */
  public String get_organization_state() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getAddress().getRegion()
        : super.get_organization_state();
  }

  /**
   * Retrieves country of organization associated with order. If order is new,
   * this value comes directly from BsOrganization, if order is an order that
   * has already been placed, this value comes directly from the value stored
   * with the order in Orders table.
   * 
   * @return Country of organization placing order, or <code>null</code> if no
   *         organization associated with order
   */
  public String get_organization_country() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getAddress().getCountryObject().getName()
        : super.get_organization_country();
  }

  /**
   * Retrieves postal code of organization associated with order. If order is
   * new, this value comes directly from BsOrganization, if order is an order
   * that has already been placed, this value comes directly from the value
   * stored with the order in Orders table.
   * 
   * @return Postal code of organization placing order, or <code>null</code> if
   *         no organization associated with order
   */
  public String get_organization_postal_code() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getAddress().getPostalCode()
        : super.get_organization_postal_code();
  }

  /**
   * Retrieves main phone number of organization associated with order. If order
   * is new, this value comes directly from BsOrganization, if order is an order
   * that has already been placed, this value comes directly from the value
   * stored with the order in Orders table.
   * 
   * @return Main phone number of organization placing order, or
   *         <code>null</code> if no organization associated with order
   */
  public String get_organization_phone() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getPhone("work")
        : super.get_organization_phone();
  }

  /**
   * Retrieves email address of organization associated with order. If order is
   * new, this value comes directly from BsOrganization, if order is an order
   * that has already been placed, this value comes directly from the value
   * stored with the order in Orders table.
   * 
   * @return Email address of organization placing order, or <code>null</code>
   *         if no organization associated with order
   */
  public String get_organization_email() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getEmail()
        : super.get_organization_email();
  }

  /**
   * Retrieves fax number of organization associated with order. If order is
   * new, this value comes directly from BsOrganization, if order is an order
   * that has already been placed, this value comes directly from the value
   * stored with the order in Orders table.
   * 
   * @return fax number of organization placing order, or <code>null</code> if
   *         no organization associated with order
   */
  public String get_organization_fax() {
    return (newOrder && hasOrganization()) ? get_organization().getCommunity().getPhone("fax")
        : super.get_organization_fax();
  }

  /**
   * Retrieves list of email addresses for all PIs associated with organization
   * placing the order.
   * 
   * @return String Array of email addresses for all PIs of organization, or
   *         null if no organization associated with this order, or if
   *         organization has no PIs (shouldn't get this far if organization has
   *         no PIs, but just in case).
   */
  public String[] get_pi_email() {
    List<String> emails = new ArrayList<String>();
    if (hasOrganization()) {
      Collection<BsAffiliation> affiliates;
      try {
        affiliates = get_organization().getAffiliation();
      } catch (SQLException e) {
        throw new DelegateException("Could not lazily load organizational affiliations");
      }
      for (BsAffiliation affiliate : affiliates) {
        if (affiliate.getPi()) {
          emails.add(affiliate.getMember().getEmail());
        }
      }
    }
    return emails.size() > 0 ? emails.toArray(new String[emails.size()]) : null;
  }

  /**
   * Retrieves full affiliation objects for all PIs associated with organization
   * placing the order
   * 
   * @return Array of <code>BsAffiliation</code> objects representing all PIs
   *         for organization placing order, or <code>null</code> if no
   *         organization associated with this order, or if organization has no
   *         PIs (shouldn't get this far if organization has no PIs, but just in
   *         case);
   */
  public BsAffiliation[] get_pi_affiliations() {
    List<BsAffiliation> affs = new ArrayList<BsAffiliation>();
    if (hasOrganization()) {
      Collection<BsAffiliation> affiliates;
      try {
        affiliates = get_organization().getAffiliation();
      } catch (SQLException e) {
        throw new DelegateException("Could not lazily load organizational affiliations");
      }
      for (BsAffiliation affiliate : affiliates) {
        if (affiliate.getPi()) {
          affs.add(affiliate);
        }
      }
    }
    return affs.size() > 0 ? affs.toArray(new BsAffiliation[affs.size()])
        : null;
  }

  /**
   * Sets the person object for this order to the submitted object
   * 
   * @param person The <code>BsPerson</code> object to use for this order.
   */
  public void set_person(BsPerson person) {
    set_person_id(person.getPersonId());
  }

  /**
   * Updates person fields maintained as part of order to match contents of
   * contained BsPerson. InvalidActionException thrown if no person is
   * associated with this order or has no address, phone, or email.
   * 
   * @throws InvalidActionException when there is missing information for the
   *           person
   */
  private void setPersonInfo() throws InvalidActionException {
    BsPerson person = get_person();
    if (person == null || get_person().getPersonId() == null) {
      throw new InvalidActionException("No person associated with this order");
    }
    if (get_person().getCommunity() == null) {
      throw new InvalidActionException("No community associated with person for order");
    }
    BsAddress address = get_person().getCommunity().getAddress();
    if (address == null || address.getAddress() == null) {
      throw new InvalidActionException("Person has no address for order");
    }
    String email = get_person().getCommunity().getEmail();
    if (email == null) {
      throw new InvalidActionException("Person has no email for order");
    }

    set_person_id(person.getPersonId());
    set_person_address(address.getAddress());
    set_person_city(address.getCity());
    set_person_state(address.getRegion());
    set_person_country(address.getCountryObject().getName());
    set_person_postal_code(address.getPostalCode());
    set_person_phone(person.getCommunity().getPhone("work"));
    set_person_fax(person.getCommunity().getPhone("fax"));
    set_person_email(email);
  }

  /**
   * Determines whether current order has a person associated with it or not
   * 
   * @return <code>true</code> if order has a person; <code>false</code> if
   *         order has no person
   */
  public boolean hasPerson() {
    return (get_person_id() != null);
  }

  /**
   * Sets the organization object for this order to the submitted object
   * 
   * @param organization The <code>BsOrganization</code> object to use for this
   *          order.
   */
  public void set_organization(BsOrganization organization) {
    // Don't cache the organization object, just set the id.
    set_organization_id(organization.getOrganizationId());

    // if setting lab for first time, make sure stock prices are
    // set correctly for academic vs. commercial price
    if (newOrder) {
      updateStockPrices();
    }
  }

  /**
   * Sets a new lab for this order. If setting lab through this method, it is
   * assumed that order already exists and organization data previously stored
   * will be updated to match new organization. It is also assumed that
   * organization has been validated as an active lab that person placing order
   * is a member of. Organization data will be updated when store() is next
   * called.
   * 
   * @param organization New organization to user for order
   * @throws InvalidActionException thrown if null organization submitted
   */
  public void set_new_organization(BsOrganization organization)
      throws InvalidActionException {

    set_organization_id(organization.getOrganizationId());
    setOrganizationInfo();

    // if setting new lab, update stock prices for
    // academic vs. commercial price
    updateStockPrices();
  }

  /**
   * Updates organization fields maintained as part of order to match contents
   * of contained BsOrganization. InvalidActionException thrown if no
   * organization is associated with this order
   * 
   * @throws InvalidActionException when the organization is null
   */
  private void setOrganizationInfo() throws InvalidActionException {
    BsOrganization organization = get_organization();
    if (organization == null || organization.getOrganizationId() == null) {

      throw new InvalidActionException("No organization associated with this order");
    }

    set_organization_id(organization.getOrganizationId());
    set_organization_address(organization.getCommunity().getAddress().getAddress());
    set_organization_city(organization.getCommunity().getAddress().getCity());
    set_organization_state(organization.getCommunity().getAddress().getRegion());
    set_organization_country(organization.getCommunity().getAddress().getCountryObject().getName());
    set_organization_country_id(organization.getCommunity().getAddress().getCountryId());
    set_organization_postal_code(organization.getCommunity().getAddress().getPostalCode());
    set_organization_phone(organization.getCommunity().getPhone("work"));
    set_organization_email(organization.getCommunity().getEmail());
    set_organization_fax(organization.getCommunity().getPhone("fax"));
  }

  /**
   * Determines whether current order has an organization associated with it or
   * not
   * 
   * @return <code>true</code> if order has an organization; <code>false</code>
   *         if order has no organization
   */
  public boolean hasOrganization() {
    return (get_organization_id() != null);
  }

  /**
   * Sets the order number using TfcOrderNumber.getNextOrderNumber
   * 
   * @throws SQLException when there is a database problem
   */
  public void assignNewOrderNumber() throws SQLException {

    DBWriteManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.get_connection();
      this.set_order_number(TfcOrderNumber.getNextOrderNumber(conn));
    } finally {
      DBWriteManager.return_connection(conn);
    }
  }

  /**
   * Returns a reference to the person object associated with this order.
   * 
   * @return <code>BsPerson</code> object representing person placing order.
   */
  public BsPerson get_person() {
    PersonDelegate personDelegate =
      CommunityDelegateFactory.getPersonDelegate();
    IPrimaryKey key =
      CommunityFactory.getPersonPrimaryKey(new BigInteger(super.get_person_id().toString()));
    return personDelegate.getObject((SequencePrimaryKey)key);
  }

  /**
   * Returns a reference to the organization object associated with this order.
   * 
   * @return <code>BsOrganization</code> object representing lab for order.
   */
  public BsOrganization get_organization() {
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    IPrimaryKey key =
      CommunityFactory.getOrganizationPrimaryKey(get_organization_id());
    return delegate.getObject((SequencePrimaryKey)key);
  }

  /**
   * Retrieves community ID of person placing order. Value not stored in Orders
   * table, but comes from associated Composite object
   * 
   * @return Community ID of person placing order, or <code>null</code> if no
   *         person associated with this order
   */
  public BigInteger get_person_community_id() {
    return hasPerson() ? get_person().getCommunityId() : null;
  }

  /**
   * Retrieves first name of person placing order.
   * 
   * @return First name of person placing order, or null if no person associated
   *         with this order
   */
  public String get_person_first_name() {
    return hasPerson() ? get_person().getFirstName() : null;
  }

  /**
   * Retrieves last name of person placing order
   * 
   * @return Last name of person placing order, or null if no person associated
   *         with this order
   */
  public String get_person_last_name() {
    return hasPerson() ? get_person().getLastName() : null;
  }

  /**
   * Returns combination of first name and last name of person who placed the
   * order.
   * 
   * @return String containing first name and last name
   */
  public String get_person_name() {
    return get_person_first_name() + " " + get_person_last_name();
  }

  /**
   * Retrieves suffix of person placing order
   * 
   * @return Suffix of person placing order, or null if no person associated
   *         with this order
   */
  public String get_person_suffix() {
    return hasPerson() ? get_person().getSuffix() : null;
  }

  /**
   * Retrieves primary job title of person placing order
   * 
   * @return Primary job title of person placing order, or null if no person
   *         associated with this order
   */
  public String get_person_primary_job_title() {
    return hasPerson() ? get_person().getPrimaryJobTitle() : null;
  }

  /**
   * Retrieves active lab affiliations for person placing order Value not stored
   * in Orders table, but comes from associated Composite object
   * 
   * @return Person's active lab affiliations as an <code>Iterator</code> of
   *         <code>BsAffiliation</code> objects
   */
  public Iterator<BsAffiliation> get_person_active_labs() {
    List<BsAffiliation> affs = new ArrayList<BsAffiliation>();
    if (hasPerson()) {
      Collection<BsAffiliation> affiliates;
      try {
        affiliates = get_person().getCommunity().getAffiliation();
      } catch (SQLException e) {
        throw new DelegateException("Could not lazily load person affiliations");
      }
      for (BsAffiliation affiliate : affiliates) {
        if (BsCommunity.Status.ACTIVE.equals(affiliate.getOrganization().getCommunity().getMemberStatus())
            && BsOrganization.Type.LAB.equals(affiliate.getOrganization().getOrganizationType())) {
          affs.add(affiliate);
        }
      }
    }
    return affs.size() > 0 ? affs.iterator() : null;
  }

  /**
   * Determines number of active labs for person placing order
   * 
   * @return Number of active lab affiliations for person placing order.
   */
  public int get_number_person_active_labs() {
    List<BsAffiliation> affs = new ArrayList<BsAffiliation>();
    if (hasPerson()) {
      Collection<BsAffiliation> affiliates;
      try {
        affiliates = get_person().getCommunity().getAffiliation();
      } catch (SQLException e) {
        throw new DelegateException("Could not lazily load person affiliations");
      }
      for (BsAffiliation affiliate : affiliates) {
        if (BsCommunity.Status.ACTIVE.equals(affiliate.getOrganization().getCommunity().getMemberStatus())) {
          affs.add(affiliate);
        }
      }
    }
    return affs.size();
  }

  /**
   * Retrieves name of organization placing order
   * 
   * @return Name of organization placing order, or null if no organization
   *         associated with this order
   */
  public String get_organization_name() {
    return hasOrganization() ? get_organization().getName() : null;
  }

  /**
   * Retrieves list of names of PIs for organization placing order
   * 
   * @return String array of PI names for organization placing order, or null if
   *         no organization associated with this order (shouldn't get this far
   *         if organization has no PIs, but just in case).
   */
  public String[] get_organization_pi_list() {
    PersonDelegate del = CommunityDelegateFactory.getPersonDelegate();
    List<String> pis = new ArrayList<String>();
    if (hasOrganization()) {
      Collection<BsAffiliation> affiliates;
      try {
        affiliates = get_organization().getAffiliation();
      } catch (SQLException e) {
        throw new DelegateException("Could not lazily load organizational affiliations");
      }
      for (BsAffiliation affiliate : affiliates) {
        if (affiliate.getPi()) {
          // Look up the person corresponding to the PI.
          BsPerson pi = del.getPersonByCommunityId(affiliate.getCommunityId());
          // Construct the person's name.
          StringBuilder builder = new StringBuilder(pi.getFirstName());
          if (pi.getFirstName() != null) {
            builder.append(" ");
          }
          builder.append(pi.getLastName());
          // Add the name to the list.
          pis.add(builder.toString());
        }
      }
    }
    return pis.size() > 0 ? pis.toArray(new String[pis.size()]) : null;
  }

  /**
   * Retrieves community ID of organization placing order.
   * 
   * @return Community ID of organization placing order, or <code>null</code> if
   *         no organization associated with this order
   */
  public BigInteger get_organization_community_id() {
    return hasOrganization() ? get_organization().getCommunityId() : null;
  }

  /**
   * Retrieves commercial status of organization placing order
   * 
   * @return Commercial status of organization placing order, or null if no
   *         organization associated with this order
   */
  public Boolean get_organization_commercial() {
    return hasOrganization() ? get_organization().getCommercial() : null;
  }

  /**
   * Retrieves abrc_fees_waived status of organization placing order
   * 
   * @return abrc_fees_waived status of organization placing order, or null if
   *         no organization associated with this order
   */
  public Boolean get_organization_ABRC_fees_waived() {
    return hasOrganization() ? get_organization().getAbrcFeesWaived() : null;
  }

  /**
   * Retrieves NASC fee payment status of organization placing order
   * 
   * @return NASC payment status of organization placing order, or null if no
   *         organization associated with this order
   */
  public Boolean get_organization_NASC_fee_paid() {
    return hasOrganization() ? get_organization().getNascFeePaid() : null;
  }

  /**
   * Retrieves seed stock center for organization placing order
   * 
   * @return Seed stock center for organization placing order, or null if no
   *         organization associated with this order, or if organization has no
   *         stock center explicitly chosen
   */
  public String get_seed_stock_center() {
    return hasOrganization() ? get_organization().getSeedStockCenter() : null;
  }

  /**
   * Determines whether organization placing order uses NASC for seed orders.
   * This value is based on the seed_stock_center value stored for the
   * organization. Since this value is regularly updated as new orders are
   * stored, calling this method before order is stored may give a different
   * result than after order is stored.
   * 
   * @return <code>true</code> if organization placing order uses NASC for seed
   *         stocks; <code>false</code> if organization does not use NASC.
   */
  public boolean organizationUsesNASC() {
    String localCenter = get_seed_stock_center();
    return (hasOrganization() && DataConstants.getNASCStockCenter().equals(localCenter));
  }

  /**
   * Returns preferred seed stock center for organization. If this value is null
   * in the database, this method calculates stock center on organization's
   * country and returns result.
   * 
   * @return Seed stock center (ABRC/NASC) for this organization
   */
  public String get_format_stock_center() {
    String country = get_organization_country();
    String center = get_seed_stock_center();
    String returnCenter = null;

    if (center != null) { // if value already stored in db, return that
      returnCenter = center;
    } else {
      CountryDelegate del = CommunityDelegateFactory.getCountryDelegate();
      BsCountry countryObject = del.getCountryByName(country);
      if (BsCountry.StockCenter.OPTIONAL.equals(countryObject.getStockCenter())) {
        // if "other" country that hasn't chosen, return Undetermined
        returnCenter = "Undetermined";
      } else {
        // if has chosen, return preferred stock center
        returnCenter = countryObject.getStockCenter();
      }
    }
    return returnCenter;
  }

  /**
   * Determines if order has an invoice created for it
   * 
   * @return <code>true</code> if order has an invoice created for it or
   *         <code>false</code> if no order created for invoice
   */
  public boolean hasInvoice() {
    return (invoice != null);
  }

  /**
   * Sets invoice for stock order
   * 
   * @param invoice Invoice to set for stock order
   */
  public void setInvoice(CompositeInvoice invoice) {
    this.invoice = invoice;
  }

  /**
   * Gets invoice for stock order
   * 
   * @return Invoice for stock order
   */
  public CompositeInvoice getInvoice() {
    return invoice;
  }

  //
  // CompositeInvoice wrappers - helpful to make part of order to simplify
  // life at JSP level. Consolidating code here helps since source of
  // stock order prices vary depending on whether order being displayed
  // has an invoice or not.
  //

  /**
   * Retrieves total charges for order including stock charges, order charges,
   * express shipping charges etc. This amount will only include stock charges
   * for orders that do not have invoices.
   * 
   * <p>
   * 
   * @return Total charges for order
   */
  public Float getTotalCharges() {
    Float total = null;

    if (hasInvoice()) {
      total = invoice.get_invoice_total();
    } else {
      total = new Float(stocks.getTotalStockPrice());
    }

    return total;
  }

  /**
   * Retrieves total charges for order.
   * 
   * @return Total charges for order
   */
  public Float getTotalOrderCharges() {

    Float amt = this.getEligibleForPayment();
    if (amt.floatValue() == 0)
      amt = this.getTotalCharges();

    return amt;
  }

  /**
   * Determines if order invoice has a balance due. This will return false for
   * all orders that do not have an associated invoice
   * 
   * <p>
   * 
   * @return <code>true</code> if order invoice has a balance due or
   *         <code>false</code> if invoice is paid in full
   */
  public boolean hasBalanceDue() {
    return hasInvoice() ? invoice.hasBalanceDue() : false;
  }

  /**
   * Calculates balance due on order by subtracting total amount paid from
   * invoice total. If no payments have been made, invoice total will be
   * returned. If order has no invoice associated to it, zero will be returned.
   * 
   * <p>
   * 
   * @return Total balance due for invoice as a floating point number.
   */
  public Float getBalanceDue() {
    return hasInvoice() ? invoice.getBalanceDue() : new Float(0);
  }

  /**
   * Generates an iterator over the eligible-for-payment line items based on the
   * following: <li>Stock charges that are shipped and unpaid</li> <li>Express
   * Shipping Charge (if any) and hasn't been paid and has at least one stock
   * shipped</li> <li>Phytosanitary Charge (if any) and hasn't been paid and has
   * at least one stock shipped</li> <li>Order Charge that hasn't been paid and
   * has at least one stock shipped</li>
   * <p>
   * 
   * @return <code>Iterator</code> of <code>LineItems</code> or null not line
   *         items eligible for payment.
   */
  public Iterator<TfcLineItem> getEligibleForPaymentLineItems() {
    Iterator<TfcLineItem> iter = null;
    List<TfcLineItem> lineItems = new ArrayList<TfcLineItem>();

    if (hasInvoice()) {
      CompositeInvoice invoice = getInvoice();
      Iterator<TfcLineItem> itemIter = invoice.getStockItems();
      boolean anyShipped = false;

      if (itemIter != null) {
        while (itemIter.hasNext()) {
          TfcLineItem item = itemIter.next();

          if (item == null)
            logger.error("Null line item in getEligibleForPaymentLineItems");
          else {
            Stock stock = stocks.getStock(item.get_stock_id());
            if (stock == null)
              logger.error("No stock for line item " + item.get_stock_id());
            else {
              // allow stock status to be set unless item has been paid for
              boolean stockPaid = invoice.stockItemPaid(item.get_stock_id());

              // add to the list, the line item,if the stock hasn't been paid
              // but has shipped - track if any stocks have been shipped
              if (!anyShipped && stock.shipped()) {
                anyShipped = true;
              }

              if (!stockPaid && stock.shipped()) {
                lineItems.add(item);
              }
            }
          }
        }
      }

      if (anyShipped || !lineItems.isEmpty()) {
        // now get the other line items (order, express, and phyto)
        // only if any stocks have been been shipped
        if (invoice.hasOrderCharge() && !invoice.orderChargePaid()) {
          lineItems.add(invoice.getOrderChargeLineItem());
        }

        if (invoice.hasExpressShippingCharge()
            && !invoice.expressShippingChargePaid()) {
          lineItems.add(invoice.getExpressShippingLineItem());
        }

        if (invoice.hasPhytosanitaryCharge()
            && !invoice.phytosanitaryChargePaid()) {
          lineItems.add(invoice.getPhytosanitaryLineItem());
        }
      }

      if (!lineItems.isEmpty()) {
        iter = lineItems.iterator();
      }
    }
    return iter;
  }

  /**
   * Calculates balance eligible for payment on order which includes the
   * following: <li>Stock charges that are shipped and unpaid</li> <li>Express
   * Shipping Charge (if any) and hasn't been paid and has at least one stock
   * shipped</li> <li>Phytosanitary Charge (if any) and hasn't been paid and has
   * at least one stock shipped</li> <li>Order Charge that hasn't been paid and
   * has at least one stock shipped</li>
   * <p>
   * 
   * @return Total balance eligible for payment as a floating point number.
   */
  public Float getEligibleForPayment() {
    float total = 0;

    // get line items eligible for payment and calculate total from them
    Iterator<TfcLineItem> iter = getEligibleForPaymentLineItems();
    if (iter != null) {
      while (iter.hasNext()) {
        TfcLineItem item = iter.next();
        Float itemCharge = item.get_amount();
        if (itemCharge != null) {
          total += itemCharge.floatValue();
        }
      }
    }

    return new Float(total);
  }

  /**
   * Retrieves total of all stock charges for order. Total is calculated either
   * through invoice's line items or order's collection stocks depending on
   * whether order has an associated invoice or not.
   * 
   * @return Total amount of all stock charges for order or zero if no stock
   *         charges in order
   */
  public Float getTotalStockCharges() {
    Float total = null;

    if (hasInvoice()) {
      total = invoice.getStockCharges();
    } else if (hasStocks()) {
      total = new Float(stocks.getTotalStockPrice());
    } else {
      total = new Float(0);
    }
    return total;
  }

  /**
   * Returns formatted <code>String</code> that contains the total charges for
   * all stocks in order in $US money format ($0.00).
   * 
   * @return Total stock charges for this order in $US format, or
   *         <code>null</code> if no stocks in order.
   */
  public String getFormatTotalStockPrice() {
    return TextConverter.floatToMoneyString(getTotalStockCharges());
  }

  /**
   * Calculates total amount of payments that have been applied to this order.
   * This is done by adding together all line item amounts for invoice that have
   * a "paid" status
   * 
   * @return Total payment towards stock charges as a floating point number or
   *         zero if no payments have been made.
   */
  public Float getPaymentTotal() {
    return hasInvoice() ? invoice.getPaymentTotal() : new Float(0);
  }

  /**
   * Retrieves amount charged for stock charge line item for stock with
   * submitted stock_id. This amount is the extended price for that stock item
   * within this order and accounts for multiplying base price by quantity.
   * 
   * 
   * @param stock_id Id of stock to retrieve charge for
   * @return Amount charged for stock charge line item in order or zero if stock
   *         not found in order
   */
  public Float getLineItemStockCharge(Long stock_id) {
    Float charge = null;

    // get charge from invoice or stock collection if no invoice for order
    if (hasInvoice()) {
      charge = invoice.getStockCharge(stock_id);
    } else {
      charge = stocks.getLineItemCharge(stock_id);
    }
    return charge;
  }

  /**
   * Determines if line item for stock has been paid. This will return true only
   * if stock had a stock charge line item to begin with. False will be returned
   * if stock line item is unpaid or if stock never had a line item charge set.
   * 
   * <p>
   * This will always return false for orders without an invoice.
   * 
   * @param stock_id Stock id to check line item status for
   * @return <code>true</code> if line item charge for stock has been paid or
   *         <code>false</code> if line item has not been paid for or if stock
   *         has no line item associated with it.
   */
  public boolean stockLineItemPaid(Long stock_id) {
    return hasInvoice() ? invoice.stockItemPaid(stock_id) : false;
  }

  /**
   * Determines if all stock charge line items have been paid. This will return
   * true only if order contains stock charge line items to begin with. False
   * will be returned if any stock charge line items are unpaid or if order has
   * no stock charge line items.
   * 
   * <p>
   * This will always return false for orders without an invoice
   * 
   * @return <code>true</code> if all stock charge line items for order have
   *         been paid; <code>false</code> if any stock charge line items are
   *         unpaid or if order has no stock charge items.
   */
  public boolean stockLineItemsPaid() {
    return hasInvoice() ? invoice.stockItemsPaid() : false;
  }

  /**
   * Returns amount of order charge line item. This will return zero for orders
   * without invoices.
   * 
   * @return Amount of order charge line item
   */
  public Float getOrderCharge() {
    return hasInvoice() ? invoice.getOrderCharge() : new Float(0);
  }

  /**
   * Determines if order's invoice contains an order charge line item. This will
   * return false for orders without an invoice.
   * 
   * @return <code>true</code> if invoice contains an order charge or
   *         <code>false</code> if no order charge found
   */
  public boolean hasOrderCharge() {
    return hasInvoice() ? invoice.hasOrderCharge() : false;
  }

  /**
   * Determines if order charge line item has been paid. This will return true
   * only if order an order charge line item to begin with. False will be
   * returned if line item is unpaid or if no order charge line item has been
   * set.
   * 
   * <p>
   * This will always return false for orders without an invoice.
   * 
   * @return <code>true</code> if order charge line item has been paid or
   *         <code>false</code> if line item has not been paid for or if order
   *         has no order charge line item associated with it.
   */
  public boolean orderChargePaid() {
    return hasInvoice() ? invoice.orderChargePaid() : false;
  }

  /**
   * Returns amount of express shipping charge line item. This will return zero
   * for orders without an invoice.
   * 
   * @return Amount of express shipping charge line item
   */
  public Float getExpressShippingCharge() {
    return hasInvoice() ? invoice.getExpressShippingCharge() : new Float(0);
  }

  /**
   * Determines if invoice contains an express shipping charge line item. This
   * will always return false for orders without an invoice.
   * 
   * @return <code>true</code> if invoice contains an express shipping charge or
   *         <code>false</code> if no express shipping charge found
   */
  public boolean hasExpressShippingCharge() {
    return hasInvoice() ? invoice.hasExpressShippingCharge() : false;
  }

  /**
   * Determines if express shipping charge line item has been paid. This will
   * return true only if order an express shippingr charge line item to begin
   * with. False will be returned if line item is unpaid or if order has no
   * express shipping charge.
   * 
   * <p>
   * This will always return false for orders without an invoice.
   * 
   * @return <code>true</code> if express shipping charge line item has been
   *         paid or <code>false</code> if line item has not been paid for or if
   *         order has no express shipping charge line item associated with it.
   */
  public boolean expressShippingChargePaid() {
    return hasInvoice() ? invoice.expressShippingChargePaid() : false;
  }

  /**
   * Determines if invoice contains a phytosanitary charge line item. This will
   * always return false for orders without an invoice.
   * 
   * <p>
   * 
   * @return <code>true</code> if invoice contains a phytosanitary charge or
   *         <code>false</code> if no order charge found
   */

  public boolean hasPhytosanitaryCharge() {
    return hasInvoice() ? invoice.hasPhytosanitaryCharge() : false;

  }

  /**
   * Returns amount of phytosanitary charge line item. This will return zero for
   * orders without an invoice.
   * 
   * @return Amount of phytosanitary charge line item
   */
  public Float getPhytosanitaryCharge() {
    return hasInvoice() ? invoice.getPhytosanitaryCharge() : new Float(0);
  }

  /**
   * Determines if phytosanitary charge line item has been paid. This will
   * return true only if order a phytosanitary charge line item to begin with.
   * False will be returned if line item is unpaid or if order has no
   * phytosanitary charge.
   * 
   * <p>
   * This will always return false for orders without an invoice.
   * 
   * @return <code>true</code> if phytosanitary charge line item has been paid
   *         or <code>false</code> if line item has not been paid for or if
   *         order has no phytosanitary charge line item associated with it.
   */
  public boolean phytosanitaryChargePaid() {
    return hasInvoice() ? invoice.phytosanitaryChargePaid() : false;
  }

  //
  // END INVOICE WRAPPERS
  //

  /**
   * Determines if order is being placed by curator on behalf of a user
   * 
   * @return <code>true</code> if order is being placed by curator for another
   *         user, or <code>false</code> if order is not being placed by curator
   *         for a user
   */
  public boolean getProxyOrder() {
    return proxyOrder;
  }

  /**
   * Set this order as being an order that is placed by curator for another
   * user. This value only lasts while order is being placed for first time.
   * 
   * @param proxy If <code>true</code> order is being placed by curator for
   *          another user or if <code>false</code> order is not being placed by
   *          curator for another user
   */
  public void setProxyOrder(boolean proxy) {
    this.proxyOrder = proxy;
  }

  /**
   * Retrieves number of active DNA and seed stocks in order. This count will
   * only include stocks whose status is not "inactive" (cancelled).
   * 
   * @return Number of active DNA and seed stocks in order, or 0 if no active
   *         stocks in order
   */
  public int getStockCount() {
    return hasStocks() ? stocks.getStockCount() : 0;
  }

  /**
   * Retrieves number of active DNA stocks in order. This count will only
   * include DNA stocks whose status is not "inactive" (cancelled).
   * 
   * @return Number of active DNA stocks in order, or 0 if no active DNA stocks
   *         in order
   */
  public int getDNAStockCount() {
    return hasStocks() ? stocks.getDNAStockCount() : 0;
  }

  /**
   * Retrieves number of active seed stocks in order. This count will only
   * include seed stocks whose status is not "inactive" (or cancelled).
   * 
   * @return Number of active seed stocks in order, or 0 if no active seed
   *         stocks in order
   */
  public int getSeedStockCount() {
    return hasStocks() ? stocks.getSeedStockCount() : 0;
  }

  /**
   * Determines whether current order has stocks associated with it or not
   * 
   * return <code>true</code> if order has stocks; <code>false</code> if order
   * has no stocks
   * 
   * @return true if there are stocks, false if not
   */
  public boolean hasStocks() {
    return (stocks != null && !stocks.isEmpty());
  }

  /**
   * Retrieves list of stocks in order
   * 
   * @return <code>Iterator</code> of <code>Stock</code> objects, or null if
   *         order has no stocks in it
   */
  public Iterator<Stock> getStocks() {
    return hasStocks() ? stocks.iterator() : null;
  }

  /**
   * Determines whether current order has DNA stocks associated with it or not
   * 
   * @return <code>true</code> if order has DNA stocks; <code>false</code> if
   *         order has no DNA stocks
   */
  public boolean hasDNAStock() {
    return hasStocks() ? stocks.hasDNAStock() : false;
  }

  /**
   * Determines whether current order has seed stocks associated with it or not
   * 
   * @return <code>true</code> if order has seed stocks; <code>false</code> if
   *         order has no seed stocks
   */
  public boolean hasSeedStock() {
    return hasStocks() ? stocks.hasSeedStock() : false;
  }

  /**
   * Determines if order currently has a collection of stocks that user tried to
   * add when stock was already in order. User fee stocks cannot have a quantity
   * greater than 1; if user tries to add a stock that is already in order, it
   * is saved temporarily in a collection of duplicate stocks so that an
   * explanatory message can be displayed to user. This collection may be
   * populated and cleared multiple times over the lifespan of the order
   * 
   * @return <code>true</code> if order currently has collection of user fee
   *         stocks that user tried to order multiple quantities of, or
   *         <code>false</code> if order has no duplicate stocks
   */
  public boolean hasDuplicateStocks() {
    return (duplicateStocks != null && !duplicateStocks.isEmpty());
  }

  /**
   * Retrieves any user fee stocks that user tried to order when stock was
   * already in the order. These stocks are stored temporarily so that user can
   * be shown a message explaining that quantities for these stocks are limited
   * to one.
   * 
   * @return Any duplicate user fee stocks as an <code>Iterator</code> of
   *         <code>Stock</code> objects, or <code>null</code> if no duplicate
   *         stocks in order
   */
  public Iterator<Stock> getDuplicateStocks() {
    return hasDuplicateStocks() ? duplicateStocks.iterator() : null;
  }

  /**
   * Clears collection of duplicate user fee stocks. This should be done after a
   * message is given to user explaining why duplicate stocks were not added to
   * order. Since order may persist in user's session over multiple pages, it is
   * necessary to clear this collection so that its contents always accurately
   * reflect the order status following the user's last action
   */
  public void clearDuplicateStocks() {
    if (duplicateStocks != null) {
      duplicateStocks.clear();
    }
  }

  /**
   * Adds a duplicate user fee stock to temporary collection for displaying
   * explanatory message to user on next page
   * 
   * @param stock the stock to add
   */
  private void addDuplicateStock(Stock stock) {
    if (duplicateStocks == null) {
      duplicateStocks = new ArrayList<Stock>();
    }
    duplicateStocks.add(stock);
  }

  /**
   * Determines if order contains submitted stock as a duplicate stock that user
   * attempted to order twice. This method is helpful for making sure that added
   * stock doesn't show up in both list of stocks that were added as well as in
   * the explanatory message given to user to explain why mutliple quantities
   * cannot be added
   * 
   * @param stock Stock to search for as duplicate stock
   * @return <code>true</code> if submitted stock is contained in order's
   *         current collection of duplicate stocks, or <code>false</code> if
   *         stock is not found in duplicate stock collection
   */
  public boolean containsDuplicateStock(Stock stock) {
    return (hasDuplicateStocks() && duplicateStocks.contains(stock));
  }

  /**
   * Determines if order contains submitted stock
   * 
   * @param stock the submitted stock
   * 
   * @return <code>true</code> if order contains stock, or <code>false</code> if
   *         order does not contain stock
   */
  public boolean containsStock(Stock stock) {
    return (hasStocks() && stocks.contains(stock));
  }

  /**
   * Adds a single stock to inner collection of stocks. If stock is a fixed
   * price stock, quantity will be automatically incremented if stock is already
   * in order; other stocks will not have their quantities increased - quantity
   * must be set explicitly by curator if it is to be greater than 1. This is to
   * prevent researchers from accidentally ordering a high quantity of stocks.
   * 
   * @param stock Stock to be added to order
   */
  public void addStock(Stock stock) {

    if (stocks == null) {
      stocks = new OrderStockCollection();
    }

    // if stock already in order
    if (stocks.contains(stock)) {

      // increment quantity for fixed price stocks
      if (stock.get_fixed_price() != null
          && stock.get_fixed_price().booleanValue()) {

        Stock tmp = stocks.get(stocks.indexOf(stock));
        int currQuantity = tmp.get_quantity();
        tmp.set_quantity(stock.get_quantity() + currQuantity);

        // if user fee stock already in order, add to collection of
        // duplicate stocks
      } else {
        addDuplicateStock(stock);
      }

      // else add any stocks not already in order
    } else {
      stocks.addElement(stock);

      // make sure stock_charge is set correctly when adding stock
      updateStockPrice(stock);
    }

  }

  /**
   * Examines all stocks in order & makes sure stock_charge is set correctly.
   * This method should only be called when order is new, since curator could
   * set prices for fixed price stocks to arbitrary values and this method would
   * re-set prices to base prices in database
   */
  public void updateStockPrices() {
    Iterator<Stock> iter = null;
    Stock stock = null;
    if (hasStocks()) {
      iter = stocks.iterator();
      while (iter.hasNext()) {
        stock = iter.next();
        updateStockPrice(stock);
      }
    }
  }

  /**
   * Updates a single stock to its correct base or commercial price based on
   * commercial status of organization placing order. If organization or order
   * itself has all charges waived, method sets price to zero and sets a
   * "curator" waiver.
   * 
   * @param stock the stock to update
   */
  private void updateStockPrice(Stock stock) {
    boolean commercial =
      (get_organization_commercial() != null && get_organization_commercial().booleanValue());

    Boolean waived = get_organization_ABRC_fees_waived();
    boolean labChargesWaived = (waived != null && waived.booleanValue());

    waived = get_no_charge();
    boolean orderChargesWaived = (waived != null && waived.booleanValue());

    float stockPrice = stock.get_base_price().floatValue();
    logger.debug("stock type : " + stock.get_stock_type());
    if (commercial
        && !stock.get_stock_type().equalsIgnoreCase("phytosanitary_certificate")) {
      AbrcConstantCollection constants = AbrcConstantCollection.getInstance();

      float multiplier = constants.getValue("commercial stock").floatValue();

      stockPrice *= multiplier;

    } else if (labChargesWaived || orderChargesWaived) {
      stock.set_waive_charge(DataConstants.getCuratorNoCharge());
      stockPrice = 0;
    }

    stock.set_stock_charge(new Float(stockPrice));
  }

  /**
   * Adds array of stocks to inner collection of stocks
   * 
   * @param stockArray Array of stocks to be added to order
   */
  public void addStock(Stock[] stockArray) {
    for (int i = 0; i < stockArray.length; i++) {
      addStock(stockArray[i]);
    }
  }

  /**
   * Removes selected stock from order as well as associated line item charge
   * from invoice.
   * 
   * @param stock Stock to remove from order
   * @throws InvalidActionException thrown if trying to remove a stock has been
   *           processed already (i.e. if stock is completed or in progress or
   *           has already been paid for).
   */
  public void removeStock(Stock stock) throws InvalidActionException {
    if (stock.in_progress() || stock.completed()) {
      throw new InvalidActionException(stock.get_stock_number()
                                       + " cannot be removed from "
                                       + "order if status is "
                                       + stock.get_status());

    } else if (stockLineItemPaid(stock.get_stock_id())) {
      throw new InvalidActionException(stock.get_stock_number()
                                       + " has a been paid for and "
                                       + "cannot be removed from " + "order");
    } else {
      stocks.remove(stock);

      if (hasInvoice() && invoice.hasStockCharge(stock.get_stock_id())) {
        invoice.deleteStockCharge(stock.get_stock_id());
      }
    }
  }

  /**
   * Removes selected stock from order, by removing the Stock object referenced
   * by supplied stock number (name) from inner collection of stocks
   * 
   * @param stockNumber Stock number (name) of stock to remove from order
   * @throws InvalidActionException thrown if trying to remove a stock has been
   *           processed already (i.e. if stock is completed or in progress ).
   */
  public void removeStock(String stockNumber) throws InvalidActionException {
    Stock stock = stocks.getStock(stockNumber);
    if (stock != null) {
      removeStock(stock);
    }
  }

  /**
   * Removes selected stocks from order, by removing the Stock object referenced
   * by each supplied stock number (name) in the array from inner collection of
   * stocks
   * 
   * @param stockNumbers Array of stock numbers to remove from order
   * @throws EmptyOrderException thrown if all stocks are removed at once.
   *           Before exception is thrown, all stocks will be put back into
   *           order to preserve record in case of mistake. Order can still be
   *           completely emptied by simply calling one of the other removeStock
   *           methods that remove stocks one at a time, but throwing exception
   *           here makes it easy to detect errors when batch deleting.
   * @throws EmptyOrderException thrown if attempting to remove all stocks from
   *           order at once.
   * @throws InvalidActionException thrown if trying to remove a stock has been
   *           processed already (i.e. if stock is completed or in progress ).
   */
  public void removeStock(String[] stockNumbers) throws EmptyOrderException,
      InvalidActionException {

    EmptyOrderException eoe = null;

    OrderStockCollection tmpStocks = new OrderStockCollection(stocks);

    for (int i = 0; i < stockNumbers.length; i++) {
      removeStock(stockNumbers[i]);
    }

    // if stocks are now empty, might wanna put 'em all back in.
    if (!hasStocks()) {
      if (tmpStocks != null && !tmpStocks.isEmpty()) {
        stocks = null;
        stocks = tmpStocks;
      }
      eoe = new EmptyOrderException("No stocks in order");
      eoe.setOrderID(get_orders_id());
      throw eoe;
    }
  }

  /**
   * Removes selected stocks from order, by removing the Stock object referenced
   * by each supplied stock number (name) in the array from inner collection of
   * stocks. This version optionally will not add stocks back into order when
   * throwing EmptyOrderException (though the exception is still thrown).
   * 
   * @param stockNumbers Array of stock numbers to remove from order
   * @param noWarning If <code>true</code> and all stocks are removed at once,
   *          EmptyOrderException is thrown & stocks are not added back to
   *          order, if <code>false</code> stocks will be added back in to order
   *          before exception is thrown
   * @throws EmptyOrderException thrown if all stocks are removed at once.
   *           Before exception is thrown, all stocks will be put back into
   *           order to preserve record in case of mistake. Order can still be
   *           completely emptied by simply calling one of the other removeStock
   *           methods that remove stocks one at a time, but throwing exception
   *           here makes it easy to detect errors when batch deleting.
   * @throws EmptyOrderException thrown if attempting to remove all stocks from
   *           order at once.
   * @throws InvalidActionException thrown if trying to remove a stock has been
   *           processed already (i.e. if stock is completed or in progress ).
   */
  public void removeStock(String[] stockNumbers, boolean noWarning)
      throws EmptyOrderException, InvalidActionException {

    EmptyOrderException eoe = null;

    if (noWarning) {
      for (int i = 0; i < stockNumbers.length; i++) {
        removeStock(stockNumbers[i]);
      }

      // if stocks are now empty, throw exception w/out repopulating
      if (!hasStocks()) {
        eoe = new EmptyOrderException("No stocks in order");
        eoe.setOrderID(get_orders_id());
        throw eoe;
      }
    } else { // otherwise use version where stocks are added back in
      removeStock(stockNumbers);
    }

  }

  /**
   * Returns a reference to the stock in inner collection that has submitted
   * stock number.
   * 
   * @param stockNumber Stock number of stock to retrieve
   * @return Stock object with submitted stock number (runtime class will be
   *         <code>OrderStock</code> or <code>SeedStock</code>, or
   *         <code>null</code> if no Stock in order with this stock number.
   */
  public Stock getStock(String stockNumber) {
    return hasStocks() ? stocks.getStock(stockNumber) : null;
  }

  /**
   * Get a stock based on a stock id
   * 
   * @param id the stock id
   * @return the corresponding stock
   */
  public Stock getStock(Long id) {
    return (hasStocks() && id != null) ? stocks.getStock(id) : null;
  }

  /**
   * Determines if order contains any stocks whose status is NOT new. This is
   * useful for display purposes on confirmation page shown directly after order
   * is placed. If any stocks have been automatically sent to NASC, or are now
   * waiting for any MTA, a status column can be added to display for showing
   * those special statuses. This method allows that to be determined before
   * iterating through individual stocks.
   * 
   * @return <code>true</code> if order contains stocks with any status besides
   *         new, or <code>false</code> if all stocks in order are new.
   */
  public boolean hasOtherStatusStocks() {
    return hasStocks() ? stocks.hasOtherStatusStocks() : false;
  }

  /**
   * Cancels order by setting the order status to "Cancelled" and status of all
   * stocks in order to "inactive". All stocks in order must be either new" or
   * "inactive" to cancel an order - if order contains any stocks that have
   * been, or are being processed, <code>InvalidActionException</code> will be
   * thrown. After calling cancel(), store() must be called for changes to be
   * saved to database.
   * 
   * NOTE: LineItem charges must be explicitly cancelled when cancelling a stock
   * order. For orders with a credit card authorization, this includes a full
   * void of the order charges.
   * 
   * @throws InvalidActionException thrown if stocks that are not new or
   *           inactive are in the order.
   */
   public void cancel() throws InvalidActionException {
    Iterator<Stock> iter;
    Stock stock;
    boolean stocksCancel = true;

    if (hasStocks()) {
      iter = getStocks();
      while (iter.hasNext()) {
        stock = iter.next();
        if (stock.in_progress() || (stock.completed() && !stock.inactive())) {

          stocksCancel = false;
          break;
        }
      }
    }

    if (!stocksCancel) {
      throw new InvalidActionException("Cannot cancel order if one or "
                                       + "more stocks have already been "
                                       + "processed.");
    } else {
      set_status(DataConstants.getCancelledOrder());
      if (hasStocks()) {
        iter = getStocks();
        while (iter.hasNext()) {
          stock = iter.next();
          stock.set_status(DataConstants.getInactiveStock());
          stock.set_stock_charge(new Float(0));
        }
      }

      // set flag to send cancel email when store() is called
      this.orderCancelled = true;
    }
  }

  /**
   * Determines whether order is considered complete by examining the status of
   * each stock in the order. Order will be considered to be complete if order
   * status is set explicitly as complete, or if all stocks in the order are
   * complete. NOTE: because order status is calculated as well as stored, it
   * may be possible to get a result here that doesn't match with order status
   * in the database. Once store() is called, however, order status should be in
   * synch. with results of this method.
   * 
   * @return <code>true</code> if order is completed, or <code>false</code> if
   *         order is not complete
   */
  private boolean orderComplete() {
    return (hasStocks()) ? stocks.stocksComplete() : true;
  }

  /**
   * Determines whether order is considered in progress by examining the status
   * of each stock in the order. Order will be considered to be in progress if
   * order status is set explicitly, or if any stocks in the order are in
   * progress, back ordered, waiting for an MTA or if some stocks in order have
   * been shipped while others are new.
   * 
   * NOTE: because order status is calculated as well as stored, it may be
   * possible to get a result here that doesn't match with order status in the
   * database. Once store() is called, however, order status should be in synch.
   * with results of this method.
   * 
   * @return <code>true</code> if order is completed, or <code>false</code> if
   *         order is not complete
   */
  private boolean orderInProgress() {
    return (hasStocks()) ? stocks.stocksInProgress() : false;
  }

  /**
   * Determine if all stocks in order have been set to "inactive"
   * 
   * @return true if all stocks are inactive
   */
  private boolean stocksInactive() {
    return (hasStocks()) ? stocks.stocksInactive() : true;
  }

  /**
   * Set order status automatically according to statuses of stocks
   */
  private void updateStatus() {

    // if all stocks in order completed, set order status completed - make
    // sure to only set status if order status is changing to complete date
    // complete info. accurate
    if (orderComplete()) {

      // if all stocks in order are inactive set order to cancelled if
      // not done already
      if (stocksInactive()) {
        if (!DataConstants.getCancelledOrder().equals(get_status())) {

          set_status(DataConstants.getCancelledOrder());
          set_date_complete(new java.util.Date());

          // if auto-canceling order, set flag for email
          this.orderCancelled = true;

          // also cancel the invoice
          if (hasInvoice()) {

            // else remove all line items and void any
            // credit card authorizations
            invoice.removeAllCharges();
            if (invoice.isCreditCard()) {
              try {
                CreditCardController.fullVoid(invoice);
              } catch (Exception e) {
                logger.error("Error in voiding credit card: " + e.getMessage(), e);
              }
            }
            invoice.set_status(DataConstants.getCancelledInvoice());
          }
        }

        // else set to completed if not done already
      } else if (!DataConstants.getCompletedOrder().equals(get_status())) {

        set_status(DataConstants.getCompletedOrder());
        set_date_complete(new java.util.Date());
      }

      // if any stocks in progress, entire order is in progress
    } else if (orderInProgress()) {
      set_status(DataConstants.getInProgressOrder());
      set_date_complete(null);

    } else { // else set order status to new
      set_status(DataConstants.getNewOrder());
      set_date_complete(null);
    }
  }

  /**
   * Stores all order information to the database, including person and
   * organization contact information, all DNA and seed stocks in order and all
   * invoice and line item payment information. If order is being created for
   * the first time, person and organization information in the TfcOrders object
   * is synched with the information in the BsPerson and BsOrganization objects
   * to create a "snapshot" of user's information that will be stored with order
   * even if user changes address in the future
   * 
   * @param conn An active connection with INSERT/UPDATE/DELETE privileges on
   *          the database
   * @param do_trans call remove_auto_commit and commit if true
   * @throws InvalidActionException when the order has no stocks
   * @throws SQLException when there is a database problem loading stocks or notes
   */
  public void store(DBconnection conn, boolean do_trans) throws InvalidActionException, SQLException {

    // only store order if there are stocks in it, or if canceling order
    if (!DataConstants.getCancelledOrder().equals(get_status())
        && (stocks == null || stocks.isEmpty())) {
      throw new InvalidActionException("No stocks in order");
    }

    // Store the invoice, getting back message instructions.
    Map<String, Object> messageFlags = storeInvoice(conn, do_trans);

    // Send order-status emails.
    sendEmails(messageFlags);

    // Send any stock notes/MTAs for stocks in order; do this only when first
    // placing the order and only after storing the new order.
    if (newOrder) {
      lazyLoadStockNotes(conn);
      sendStockNotes();
    }
  }

  public void store(DBconnection conn) throws InvalidActionException, SQLException {
    store(conn, true);
  }

  /**
   * Load any stock notes for the stocks associated with this CompositeOrder.
   * 
   * @param conn a valid database connection
   * @throws SQLException when there is a problem querying the stock notes.
   */
  private void lazyLoadStockNotes(DBconnection conn) throws SQLException {
    // Loop through the stocks in the order and lazy-load stock notes.
    Iterator<Stock> iter = getStocks();
    while (iter.hasNext()) {
      Stock stock = iter.next();
      if (stock.get_has_stock_notes() != null
          && stock.get_has_stock_notes().booleanValue()) {

        stock.populateStockNotes(conn);
      }
    }
  }

  /**
   * Store the invoice in the database along with referenced stocks. The method
   * is a single transaction across several tables.
   * 
   * @param conn a valid database connection
   * @param do_trans call remove_auto_commit and commit if true
   * @return an output Map of message flags for sending email messages
   * @throws SQLException 
   */
  private Map<String, Object> storeInvoice(DBconnection conn, boolean do_trans) throws SQLException
      {
    Map<String, Object> messageFlags = null;
    try {
      if (do_trans)
        conn.remove_auto_commit_mode();

      if (get_orders_id() == null) {
        synchContactInfo();
      }

      // Update the order status for each store action.
      updateStatus();
      super.store(conn);

      if (hasStocks()) {
        messageFlags = stocks.store(conn, get_orders_id());
      }

      // Store the invoice and the associated line item charges unless the order
      // has no charges.
      if (hasInvoice()) {
        invoice.set_orders_id(get_orders_id());
        // Set status to in_progress if any items are shipped and invoice status
        // is new.
        if (invoice.get_status().equalsIgnoreCase("new")
            && stocks.stocksShipped()) {
          invoice.set_status("in_progress");
        }
        logger.debug("storing invoice");
        invoice.store(conn);
        logger.debug("invoice stored");

      }

      if (do_trans)
        conn.commit();

      // rollback changes if any problems - propagate exception as
      // SQLException
    } catch (Exception e) {
      logger.error("Error storing composite order " + get_order_number()
                   + " with orders_id " + get_orders_id() + ": "
                   + e.getMessage(), e);
      if (conn != null && do_trans) {
        conn.rollback();
      }
      
      throw new RuntimeException(e.getMessage(), e);
    } finally { // make sure to reinstate auto-commit
      if (do_trans)
        conn.set_auto_commit_mode();
    }
    return messageFlags;
  }

  /**
   * Ensure that contact info stored with order is in synch with Composite
   * Objects when order is first placed.
   * 
   * @throws InvalidActionException when there is no person or lab associated
   *           with order
   * @throws SQLException when there is a problem updating the stock center
   */
  private void synchContactInfo()
      throws InvalidActionException {
    if (newOrder) {
      setPersonInfo();
      setOrganizationInfo();

      if (hasSeedStock()) {
        // set seed stock center for organization if not already set
        updateStockCenter();
      }

      // if invoice has no charges, set it to null and skip saving it
      Float total = invoice != null ? invoice.get_invoice_total() : null;
      if (total == null || total.floatValue() == 0)
        invoice = null;
    }
  }

  /**
   * Examines all stocks in order and forwards all seed stocks in order to NASC
   * if lab uses NASC as seed center, or if stock record is flagged to send that
   * stock to NASC for fulfillment.. This method is called by store() when order
   * is first placed, but is offered as a public method so that it can be called
   * when orders are being combined as well. This is done so that seed stocks
   * being combined into an existing order will be forwarded to NASC
   * automatically, even though the normal logic in store() won't be executed
   * 
   * If lab uses NASC, stocks will be forwarded to NASC using the stock status
   * "forwarded_to_NASC", which means the stock will not be included in ABRC
   * user fee calculations.
   * 
   * If stock's NASC_request field = 'T', stock is forwarded to NASC for
   * fulfillment. Stock status will be 'forwarded_to_NASC' and stock will not be
   * eligible for ABRC user fee
   * 
   * If stock's NASC_request_fee field = 'T', stock is forwarded to NASC for
   * fulfillment. Stock status will be 'NASC_will_ship' and stock will be
   * eligible for ABRC user fee
   * 
   */

  public void setNASCDefaults() {
    if (hasStocks()) {
      stocks.setNASCDefaults(organizationUsesNASC());
    }
  }

  /**
   * Examines all stocks in order and sets status to 'waiting_for_MTA' if stock
   * requires an MTA signature before shipment. This method is called when order
   * is first placed, but is offered as a public method so that it can be called
   * when orders are being combined as well. This is done so that stocks being
   * combined into an existing order will have this status set automatically,
   * even though the normal logic in store() won't be executed.
   */
  public void setMTAStatus() {
    if (hasStocks()) {
      stocks.setMTAStatus();
    }
  }

  /**
   * Send emails to various parties notifying them of updated status of stock
   * orders - should only be called after store() method to ensure info. is
   * current. MessageFlags collection is originally created by
   * OrderStockCollection which determines if each stock in collection has
   * changed status as the stock's data is being stored to database
   * 
   * @param messageFlags the set of flags keyed on name
   */
  private void sendEmails(Map<String, Object> messageFlags) {
    Stock stock;

    // determines if any stocks have been set to "in progress"
    Boolean downloadedMsg = null;

    // determines if any stocks have been shipped
    Boolean shippedMsg = null;

    // determines if any stocks have sent to NASC (no fee)
    Boolean nascMsg = null;

    // determines if any stocks are backordered
    boolean stockBackOrdered = false;

    // determines if any stocks will be shipped by NASC (fee)
    // Boolean nascShipMsg = null;

    // date last modified value used when saving stocks
    java.util.Date dateModified = null;

    // determines if any stocks will be shipped with fee waived
    Boolean waivedObj = get_organization_ABRC_fees_waived();
    boolean labFeesWaived = (waivedObj != null && waivedObj.booleanValue());

    waivedObj = get_no_charge();
    boolean orderFeesWaived = (waivedObj != null && waivedObj.booleanValue());

    if (messageFlags != null && !messageFlags.isEmpty()) {
      downloadedMsg = (Boolean)messageFlags.get("downloaded");
      shippedMsg = (Boolean)messageFlags.get("shipped");
      nascMsg = (Boolean)messageFlags.get("NASC");
      dateModified = (java.util.Date)messageFlags.get("dateModified");
    }

    if (downloadedMsg != null && downloadedMsg.booleanValue()) {
      OrderEmailHandler.sendInProgressUpdate(this);
    }

    if (hasStocks()) {
      Iterator<Stock> iter = getStocks();
      while (iter.hasNext()) {
        stock = iter.next();

        if (stock.back_ordered()) {
          stockBackOrdered = true;
        }
      }
    }
    // sends appropriate email message for shipped stocks if fees are waived and
    // not backordered
    if (shippedMsg != null && shippedMsg.booleanValue()) {
      if (labFeesWaived || orderFeesWaived && !stockBackOrdered) {
        {
          OrderEmailHandler.sendWaivedUpdate(this, dateModified);
        }
      }
    }

    // if NASC, send email to user and PI

    if (nascMsg != null && nascMsg.booleanValue()) {

      OrderEmailHandler.sendNASCUpdate(this);
      OrderEmailHandler.sendNASCPIEmail(this);
    }

    //
    // DISABLE THIS MESSAGE FOR NOW.
    //
    // ABRC still wants to track these stock orders but does not want to
    // handle them using the automated email. Will probably be revisited
    // after credit card/payment updates are complete
    //
    // NM 2.8.2005
    // 

    /*
     * if ( nascShipMsg != null && nascShipMsg.booleanValue() ) {
     * OrderEmailHandler.sendNASCUpdate( this, true ); }
     */

    // if order was just cancelled, send user email to notify
    if (this.orderCancelled) {
      OrderEmailHandler.sendCancelledMsg(this);
    }
  }

  /**
   * Email any stock notes associated with any of the stocks in the order. The
   * stock notes may be the same for multiple stocks, so this method extracts
   * the notes and de-dups them into a map so that the email contains only one
   * instance of each specific note. The method aggregates the stock names with
   * the note and the email displays the associated stocks in alphabetical order
   * with the note. The method logs exceptions but ignores them, so that not
   * sending a note does not interfere with storing the order.
   * 
   * <p>
   * TAIR-95: Send one email for all notes.
   * </p>
   */
  private void sendStockNotes() {
    TreeMap<String, Set<String>> notes =
      new TreeMap<String, Set<String>>();

    try {
      // Gather all the notes in all the order's stocks into the map.
      if (stocks != null) {
        for (Stock stock : stocks) {
          if (stock.getStockNoteCollection() != null) {
            for (TfcStockNote stockNote : stock.getStockNoteCollection()) {
              // Extract the note and proceed only if it is not null.
              String note = stockNote.get_note();
              if (note != null) {
                // Convert \ to \n
                note = TextConverter.dbToText(stockNote.get_note());
                /*
                 * Check the notes map for the note already being there. If it
                 * is, get the corresponding set of stock names; if not, create
                 * a new set and add it to the map. The SortedSet results in the
                 * stock names being ordered alphabetically.
                 */
                Set<String> stocks = notes.get(note);
                if (stocks == null) {
                  stocks = new TreeSet<String>();
                  notes.put(note, stocks);
                }
                // Add the stock name to the set.
                stocks.add(stock.get_name());
              }
            }
          }
        }
      }

      // Now send one email with all the stock notes, if any.
      if (notes.size() > 0)
        OrderEmailHandler.sendStockNote(this, createStockNoteBody(notes));
    } catch (RuntimeException e) {
      // Email had problem, log and proceed.
      logger.warn("Could not email stock notes, proceeding with order.", e);
    }
  }

  /**
   * Create the stock note body from a Map of Stock sets (Set of String) keyed
   * on the note text (String) in this format:
   * <p>
   * <code>
   * <p>
   * Stocks a, b, c:
   * <p>
   * note 1
   * <p>
   * Stocks d, e:
   * <p>
   * note 2
   * </code>
   * 
   * @param notes a Map of Sets of String keyed on a String
   * @return
   */
  private String createStockNoteBody(Map<String, Set<String>> notes) {
    StringBuffer buffer =
      OrderEmailHandler.getStockNoteMessage(this.get_order_number());

    Iterator<String> noteItr = notes.keySet().iterator();
    String noteSeparator = ""; // no separator for first note
    while (noteItr.hasNext()) {
      String note = noteItr.next();
      buffer.append(noteSeparator);
      Collection<String> stocks = notes.get(note);
      // Check to make sure there are stocks for the note.
      if (stocks.size() > 0) {
        if (stocks.size() > 1) {
          // Pluralize the prefix "Stocks".
          buffer.append("Stocks ");
        } else {
          // Only one "Stock".
          buffer.append("Stock ");
        }
        Iterator<String> stockItr = stocks.iterator();
        String stockSeparator = ""; // no separator for first string
        while (stockItr.hasNext()) {
          String stock = stockItr.next();
          buffer.append(stockSeparator);
          buffer.append(stock);
          stockSeparator = ", "; // comma-space separator for second-nth
          // strings
        }
      }
      buffer.append(":\n\n");
      buffer.append(note);
      noteSeparator = "\n\n"; // double space between notes
    }

    return buffer.toString();
  }

  /**
   * If seeds in order & seed stock center is null for organization, populate it
   * & save
   * 
   * @throws InvalidActionException when there is
   */
  private void updateStockCenter() throws InvalidActionException {
    BsOrganization organization = get_organization();

    if (hasSeedStock() && get_seed_stock_center() == null) {
      CountryDelegate countryDel =
        CommunityDelegateFactory.getCountryDelegate();

      String name = get_organization_country();
      BsCountry country = countryDel.getCountryByName(name);
      String preferredCenter = country.getStockCenter();

      // if "other" country that has a choice, set to ABRC since they've
      // implicitly chosen ABRC by placing this order
      if (BsCountry.StockCenter.OPTIONAL.equals(country.getStockCenter())) {
        organization.setSeedStockCenter(BsCountry.StockCenter.ABRC.toString());

        // otherwise, save as preferred center for lab's country in
        // data constants
      } else {
        organization.setSeedStockCenter(preferredCenter);
      }

      // Update organization as a separate transaction. The update will persist
      // regardless of the completion of the transaction for the order.
      OrganizationDelegate orgDel =
        CommunityDelegateFactory.getOrganizationDelegate();
      orgDel.update(organization);
    }
  }

  /**
   * <p>
   * Creates tab-delimited <code>String</code> of order shipping and billing
   * info for export to ABRC. This version allows creation of either "order"
   * export, formatted as other version of createABRCExport(), or "item" export,
   * in which case export consists of output from each selected
   * <code>Stock</code> object's createABRCExport() method.
   * </p>
   * <p>
   * All work of creating export is actually handled by OrderExporter, however
   * keep this method as public interface to creating order exports to avoid
   * binding to OrderExporter itself
   * </p>
   * 
   * @param stockNumbers Stock numbers from order to include in export
   * @param itemExport if <code>true</code> items will be exported in "item"
   *          format (as defined in org.tair.abrc.Stock object); if
   *          <code>false</code> data will be formatted in "order" format
   *          (defined within OrderExporter)
   * @return Tab delimited <code>String</code> containing all order or item
   *         export information
   */
  public String createABRCExport(String[] stockNumbers, boolean itemExport) {
    return OrderExporter.createABRCExport(this, stockNumbers, itemExport);
  }

  /**
   * Get the last-shipped date.
   * 
   * @param altStr the string to return if the date is null
   * @return
   */
  public String get_latest_shipped_date(String altStr) {
    java.util.Date lastShipped = get_latest_shipped_date();
    return lastShipped != null ? lastShipped.toString() : altStr;
  }

  /**
   * Get the latest-shipped date.
   * 
   * @return the date
   */
  public java.util.Date get_latest_shipped_date() {
    Iterator<Stock> it = stocks.iterator();
    if (!it.hasNext())
      return null;
    java.util.Date lastShipped = ((Stock)it.next()).get_date_shipped();
    java.util.Date shipped = null;
    while (it.hasNext()) {
      shipped = it.next().get_date_shipped();
      if (shipped != null && shipped.after(lastShipped))
        lastShipped = shipped;
    }
    return lastShipped;
  }
}
