// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.43 $
// $Date: 2005/06/16 14:55:12 $
// ------------------------------------------------------------------------------

package org.tair.abrc;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.stock.Stock;
import org.tair.abrc.stock.UnorderedStock;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.BooleanWebFormField;
import org.tair.utilities.CompoundVector;
import org.tair.utilities.CompoundWebFormField;
import org.tair.utilities.DataConstants;
import org.tair.utilities.DateWebFormField;
import org.tair.utilities.DefaultWebFormField;
import org.tair.utilities.DelimitedWebFormField;
import org.tair.utilities.EmptyOrderException;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.LongWebFormField;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.WebFormField;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * OrderFormValidator handles retrieval and validation of submitted HTML form
 * parameters for different order search and update functions. Common order form
 * fields are abstracted and stored as <code>WebFormField</code> objects that
 * contain information such as the form field name, maximum length, default
 * value, required field for submission and others.
 * 
 * @see WebFormField
 * @see DefaultWebFormField
 * @see DelimitedWebFormField
 * @see CompoundWebFormField
 * @see DateWebFormField
 * @see LongWebFormField
 */

public class OrderFormValidator {

  /**
   * Retrieve collection of other fields for order page
   */
  private static WebFormField[] getOrderFields() {
    WebFormField[] orderFields = new WebFormField[6];
    orderFields[0] = new WebFormField("orderer_comments", false);
    orderFields[1] = new BooleanWebFormField("phytosanitary_charge", "true");

    orderFields[2] = new WebFormField("delete", false);
    orderFields[2].setMultiple(true);

    // fields from curator view only
    orderFields[3] = new WebFormField("ABRC_comments", false);
    orderFields[4] = new WebFormField("ABRC_public_comments", false);
    orderFields[5] = new BooleanWebFormField("no_charge", "true");

    return orderFields;
  }

  /**
   * Retrieves collection of order search fields
   */
  private static WebFormField[] getOrderSearchFields() {
    WebFormField[] searchFields = new WebFormField[26];
    searchFields[0] = new LongWebFormField("order_number_from", false);
    searchFields[1] = new LongWebFormField("order_number_to", false);

    searchFields[2] =
      new DelimitedWebFormField("stock_numbers", false, 50, "\n");

    searchFields[3] = new LongWebFormField("person_id", false);
    searchFields[4] = new LongWebFormField("organization_id", false);
    searchFields[5] = new WebFormField("last_name", false, 30);
    searchFields[6] = new WebFormField("first_name", false, 30);
    searchFields[7] = new WebFormField("organization_name", false, 100);
    searchFields[8] = new WebFormField("donor_last_name", false, 30);
    searchFields[9] = new WebFormField("donor_first_name", false, 30);

    searchFields[10] = new WebFormField("donor_organization_name", false, 30);

    searchFields[11] = new LongWebFormField("donor_person_id", false);

    searchFields[12] = new LongWebFormField("donor_organization_id", false);

    searchFields[13] = new DateWebFormField("order_date_from", false);
    searchFields[14] = new DateWebFormField("order_date_to", false);

    searchFields[15] = new DateWebFormField("last_modified_from", false);

    searchFields[16] = new DateWebFormField("last_modified_to", false);

    searchFields[17] = new DateWebFormField("date_complete_from", false);

    searchFields[18] = new DateWebFormField("date_complete_to", false);
    searchFields[19] = new WebFormField("stock_status", false);
    searchFields[20] = new WebFormField("order_status", false);
    searchFields[21] = new WebFormField("waive_charge", false);
    searchFields[22] = new WebFormField("seed_stock_center", false);
    searchFields[23] = new WebFormField("stock_type", false);
    searchFields[24] = new DateWebFormField("donated_date_from", false);
    searchFields[25] = new DateWebFormField("donated_date_to", false);

    return searchFields;
  }

  /**
   * Retrieve collection of form fields that are not strictly search fields, but
   * needed for searching & creating scroll links
   */
  private static WebFormField[] getOrderSearchConfigFields() {
    WebFormField[] configFields = new WebFormField[10];
    configFields[0] = new WebFormField("mode", false);
    configFields[1] = new DefaultWebFormField("order_by", "o.order_number");

    configFields[2] =
      new DefaultWebFormField("last_name_method", DataConstants.SEARCH_STARTS);

    configFields[3] =
      new DefaultWebFormField("first_name_method", DataConstants.SEARCH_STARTS);

    configFields[4] =
      new DefaultWebFormField("organization_name_method",
                              DataConstants.SEARCH_STARTS);

    configFields[5] =
      new DefaultWebFormField("donor_last_name_method",
                              DataConstants.SEARCH_STARTS);

    configFields[6] =
      new DefaultWebFormField("donor_first_name_method",
                              DataConstants.SEARCH_STARTS);

    configFields[7] =
      new DefaultWebFormField("donor_organization_name_method",
                              DataConstants.SEARCH_STARTS);

    configFields[8] = new DefaultWebFormField("search_in", "any");
    configFields[9] = new WebFormField("community_name", false);
    return configFields;
  }

  /**
   * Gets WebFormField that represents text area that DNA stock numbers are
   * entered in
   */
  private static DelimitedWebFormField getStockField() {
    DelimitedWebFormField stockField =
      new DelimitedWebFormField("stock_number", false, 50, "\n");
    return stockField;
  }

  /**
   * Gets WebFormField that represents quantities for individual stocks
   */
  private static CompoundWebFormField getStockQuantityField() {
    CompoundWebFormField quantityField =
      new CompoundWebFormField("quantity", false, 10, "quantity_", false);
    return quantityField;
  }

  /**
   * Gets WebFormField to represent order id for stock number in value
   */
  private static CompoundWebFormField getOrderStockField() {
    // set orderStockField as a field w/multiple values
    CompoundWebFormField orderStockField =
      new CompoundWebFormField("stock", false, 50, "stock_id_", true);

    orderStockField.setMultiple(true);

    return orderStockField;
  }

  /**
   * Gets WebFormField that represents waive charge status for stock number in
   * name
   */
  private static CompoundWebFormField getWaiveChargeField() {
    CompoundWebFormField waiveChargeField =
      new CompoundWebFormField("waive_charge",
                               false,
                               50,
                               "waive_charge_",
                               false);
    return waiveChargeField;
  }

  /**
   * Gets WebFormField that represents date to use for updating status
   */
  private static DateWebFormField getDateModified() {
    DateWebFormField dateModified =
      new DateWebFormField("date_last_modified", false);

    return dateModified;
  }

  /**
   * Iterate through fields & validate according to each fields rules
   */
  private static void validateFields(HttpServletRequest request,
                                     WebFormField[] formFields, Map target,
                                     Map errors) {
    for (int i = 0; i < formFields.length; i++) {
      try {
        // only add to target if non value is retrieved --
        // helpful for determining whether an empty form was
        // submitted
        Object value = formFields[i].validate(request);
        if (value != null && !value.toString().equals("")) {
          target.put(formFields[i].getFieldName(), value);
        }
      } catch (InvalidParameterException ipe) {
        errors.put(formFields[i].getFieldName(), ipe.getMessage());
      }
    }
  }

  /**
   * Retrieves and validates order search parameters received in
   * <code>HttpServletRequest</code>. All information returned as Map of values.
   * 
   * @param request <code>HttpServletRequest</code> forwarded from OrderServlet
   * @return Map of retrieved search values
   * @throws InvalidFormException thrown if incomplete or invalid information
   *           submitted
   */
  @SuppressWarnings("unchecked")
  public static Map validateOrderSearchInfo(HttpServletRequest request,
                                            String mode)
      throws InvalidFormException, SQLException {

    HashMap searchParams = new HashMap();
    TreeMap errors = new TreeMap();

    // get search params first - throw exception if no user fields submitted
    WebFormField[] searchFields = getOrderSearchFields();
    validateFields(request, searchFields, searchParams, errors);
    if (searchParams.isEmpty()) {
      throw new InvalidFormException("No search fields submitted");
    }

    // get config fields that will be there no matter what
    WebFormField[] configFields = getOrderSearchConfigFields();
    validateFields(request, configFields, searchParams, errors);

    // do mode specific error checking
    if (mode.equals("stock_number")) {
      if (searchParams.get("stock_numbers") == null
          || ((String[])searchParams.get("stock_numbers")).length <= 0) {

        errors.put("stock_numbers", "No stock number entered");
      }

    } else if (mode.equals("donor")) {
      if (searchParams.get("donor_person_id") == null) {
        errors.put("donor", "No donor information entered");
      }

    } else if (mode.equals("donor_lab")) {
      if (searchParams.get("donor_organization_id") == null) {
        errors.put("donor", "No donor information entered");
      }

      // if user had to select donor lab from list, display value for
      // lab name may not be populated - make sure to get it now
      if (searchParams.get("community_name") == null) {
        BigInteger id =
          new BigInteger(((Long)searchParams.get("donor_organization_id")).toString());
        OrganizationDelegate delegate =
          CommunityDelegateFactory.getOrganizationDelegate();
        IPrimaryKey key = CommunityFactory.getOrganizationPrimaryKey(id);
        BsOrganization organization =
          delegate.getObject((SequencePrimaryKey)key);
        searchParams.put("community_name", organization.getName());
      }

    }

    if (!errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

    return searchParams;
  }

  /**
   * Retrieves and validates order information received in
   * <code>HttpServletRequest</code>. All information, including stock
   * information returned as Map of values.
   * 
   * @param request <code>HttpServletRequest</code> forwarded from OrderServlet
   * @param connectionPool A collection of active connections to the database
   * @param unordered Collection to store list stocks requested, but not ordered
   *          for any reason (such as invalid stock number)
   * @return Map of retrieved information including DNA and seed stocks just
   *         submitted for ordering (referenced by <code>String</code> keys
   *         "stocks" and "seeds" respectively, and other submitted order values
   *         referenced by field names in WebFormFields
   * @throws InvalidFormException thrown if incomplete or invalid information
   *           submitted
   * @throws SQLException thrown if an error occurs while retrieving stock
   *           information from the database
   * @throws InvalidParameterException in an invalid id received
   */
  public static HashMap validateOrderInfo(HttpServletRequest request,
                                          DBconnection conn,
                                          UnorderedStock unordered)
      throws InvalidFormException, InvalidParameterException, SQLException {

    HashMap orderInfo = validateStockInfo(request, conn, unordered);

    // will be null if no stocks submitted at this stage, so initialize
    if (orderInfo == null) {
      orderInfo = new HashMap();
    }

    // use errors to accumulate error messages so all can be displayed
    // at once
    TreeMap errors = new TreeMap();

    // get order info from web form
    WebFormField[] orderFields = getOrderFields();
    validateFields(request, orderFields, orderInfo, errors);

    Map stockQuantity = null;
    try {
      stockQuantity = getStockQuantities(request);
      if (stockQuantity != null) {
        orderInfo.put("stockQuantity", stockQuantity);
      }
    } catch (InvalidFormException ife) {
      errors.putAll(ife.getFormErrors());
    }

    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

    return orderInfo;

  }

  /**
   * Retrieves objects for submitted DNA and seed stock numbers by querying
   * database. Any stocks not ordered for any reason are stored in unordered
   * 
   * @param request <code>HttpServletRequest</code> forwarded from OrderServlet
   * @param connectionPool A collection of active database connections
   * @param unordered Collection to store list stocks requested, but not ordered
   *          for any reason (such as invalid stock number)
   * @return Map of retrieved information including DNA and seed stocks just
   *         submitted for ordering (referenced by <code>String</code> key
   *         "stocks", and other submitted order values referenced by field
   *         names in WebFormFields
   * @throws SQLException thrown if an error occurs while retrieving stock
   *           information from the database
   * @throws InvalidParameterException thrown if an invalid stock id received
   */
  public static HashMap validateStockInfo(HttpServletRequest request,
                                          DBconnection conn,
                                          UnorderedStock unordered)
      throws SQLException, InvalidParameterException {

    HashMap stockInfo = null;

    // get stocks - pass unordered to record invalid ids
    Stock[] stocks = getStocks(request, conn, unordered);

    if (stocks != null && stocks.length > 0) {
      if (stockInfo == null) {
        stockInfo = new HashMap();
      }
      stockInfo.put("stocks", stocks);
    }
    return stockInfo;
  }

  /**
   * Retrieves stock numbers and quantities to update them to by parsing stock
   * number out of name of quantity field. Quantity value is translated to an
   * <code>Integer</code>. Retrieval of stock number and quantity are done by
   * calling validate() on corresponding <code>CompoundWebFormField</code>
   * (quantityField) object. Both values are stored in a map with stock number
   * is as <code>String</code> key referencing quantity for that stock number.
   * 
   * @param request HttpServletRequest passed from OrderServlet
   * @throws InvalidFormException thrown if invalid quantity submitted (i.e.
   *           negative, zero or non-numeric values)
   * @return Map containing stock number as <code>String</code> key referencing
   *         <code>Integer</code> quantity.
   */
  public static Map getStockQuantities(HttpServletRequest request)
      throws InvalidFormException {

    HashMap quantities = null;
    TreeMap errors = null;

    WebFormField quantityField = null;
    try {
      quantityField = getStockQuantityField();
      CompoundVector tmpQuantities =
        (CompoundVector)quantityField.validate(request);

      if (tmpQuantities != null && tmpQuantities.size() > 0) {
        quantities = tmpQuantities.toHashMap();
      }
    } catch (InvalidParameterException ipe) {
      if (errors == null) {
        errors = new TreeMap();
      }
      errors.put(quantityField.getFieldName(), ipe.getMessage());
    }

    if (quantities != null && !quantities.isEmpty()) {

      Integer quantity = null;
      String submittedQuantity = null;
      String stockNumber = null;

      Iterator iter = quantities.keySet().iterator();
      while (iter.hasNext()) {
        try {
          stockNumber = (String)iter.next();
          submittedQuantity = (String)quantities.get(stockNumber);
          quantity = new Integer(submittedQuantity);
          if (quantity.intValue() <= 0) {
            if (errors == null) {
              errors = new TreeMap();
            }
            errors.put(stockNumber, "Quantity cannot be zero");
          } else {
            quantities.put(stockNumber, quantity);
          }
        } catch (NumberFormatException nfe) {
          if (errors == null) {
            errors = new TreeMap();
            errors.put(stockNumber, submittedQuantity
                                    + " is not a valid quantity");
          }
        }
      }
      if (errors != null && !errors.isEmpty()) {
        throw new InvalidFormException(errors, "Invalid Form Submission");
      }
    }
    return quantities;
  }

  /**
   * Retrieves array of Stock objects for submitted DNA stock numbers. Invalid
   * ids, or stocks that are unavailable are saved in unordered for reference
   * later. Individual exceptions thrown when stocks are not found are caught
   * and saved so that complete list of unordered stocks can be shown
   */
  private static Stock[] getStocks(HttpServletRequest request,
                                   DBconnection conn, UnorderedStock unordered)
      throws SQLException, InvalidParameterException {

    Stock[] orderStocks = null;
    Stock stock = null;
    String[] stocks = getStockNumbers(request);

    if (stocks != null && stocks.length > 0) {
      Vector orderVect = null;
      for (int i = 0; i < stocks.length; i++) {
        try {
          stock = new Stock(conn, stocks[i].trim().toUpperCase());
          if (orderVect == null) {
            orderVect = new Vector();
          }

          // if unavailable save for display to user
          if (stock.get_available() != null
              && !stock.get_available().equals(DataConstants.getAvailableStock())) {

            unordered.addUnavailableStock(stock);
          } else {
            orderVect.addElement(stock);
          }
        } catch (RecordNotFoundException r) {
          unordered.addInvalidStock(stocks[i]);
        }
      }

      if (orderVect != null && !orderVect.isEmpty()) {
        orderStocks = new Stock[orderVect.size()];
        orderVect.copyInto(orderStocks);
      }
    }
    return orderStocks;
  }

  /**
   * Examines all seed and DNA stocks in order and checks to make sure that they
   * are available and allowed to be ordered by the selected organization for
   * this order. Stocks that are unavailable shouldn't make it this far without
   * being caught, but check to make sure. Some stocks are restricted so that
   * they can be ordered by academic (non-commercial) labs only. Stocks not
   * ordered for any reason are put into unordered for display to the user
   * 
   * @param order CompositeOrder in progress
   * @param unordered Collection to store list stocks requested, but not ordered
   *          for any reason
   * @throws EmptyOrderException thrown as
   *           <code>InvalidParameterException</code> if there are no stocks in
   *           order
   * @throws InvalidActionException thrown if invalid stock cannot be removed
   *           from order due to status constraints -- this should never happen
   *           since order validation happens when order is first placed and
   *           stock status is "new" or <code>null</code>.
   */
  public static void validateOrder(CompositeOrder order,
                                   UnorderedStock unordered)
      throws InvalidParameterException, InvalidActionException {

    if (order.hasStocks()) {
      validateStocks(order, unordered);
    }

    if (!order.hasStocks()) {
      EmptyOrderException e = new EmptyOrderException("No Stocks in order");
      e.setUnordered(unordered);
      throw e;
    }
  }

  /*
   * same as validate order except this is called when we don't want stocks to
   * be forwarded to an empty_stock page
   */
  public static void validateOrder_noForward(CompositeOrder order,
                                             UnorderedStock unordered)
      throws InvalidParameterException, InvalidActionException {

    System.out.println("OrderFormValidator: " + order.hasStocks());
    if (order.hasStocks()) {
      validateStocks(order, unordered);
    }
  }

  /**
   * Validates DNA stocks in order to make sure they are all available and not
   * restricted from ordering by selected lab for order
   */
  private static void validateStocks(CompositeOrder order,
                                     UnorderedStock unordered)
      throws InvalidParameterException, InvalidActionException {

    Iterator iter = order.getStocks();
    Stock stock = null;
    String seed_stock_center = order.get_seed_stock_center();
    boolean NASC =
      (seed_stock_center != null && seed_stock_center.equals(DataConstants.getNASCStockCenter()));

    if (iter != null) {
      while (iter.hasNext()) {
        stock = (Stock)iter.next();

        // if unavailable save for display to user
        if (stock.get_available() != null
            && !stock.get_available().equals(DataConstants.getAvailableStock())) {

          unordered.addUnavailableStock(stock);

          // commercial orgs cannot order restricted stocks
        } else if (stock.get_is_restricted() != null
                   && (stock.get_is_restricted()).booleanValue()) {

          BsOrganization organization = order.get_organization();

          if (organization.getCommercial() != null
              && (organization.getCommercial())) {
            unordered.addRestrictedStock(stock);
          }
        }
        if (NASC && stock.is_seed()) {
          unordered.addfwtoNASCStock(stock);
        }
      }

      if (unordered.getUnavailableStock() != null) {
        iter = unordered.getUnavailableStock();
        while (iter.hasNext()) {
          stock = (Stock)iter.next();
          order.removeStock(stock.get_stock_number());
        }
      }

      if (unordered.getRestrictedStock() != null) {
        iter = unordered.getRestrictedStock();
        while (iter.hasNext()) {
          stock = (Stock)iter.next();
          order.removeStock(stock.get_stock_number());
        }
      }

      if (unordered.getfwtoNASCStock() != null) {
        iter = unordered.getfwtoNASCStock();
        while (iter.hasNext()) {
          stock = (Stock)iter.next();
          order.removeStock(stock.get_stock_number());
        }
      }
    }
  }

  /**
   * Retrieves multiple stock numbers from form submission by calling validate()
   * on corresponding <code>DelimitedWebFormField</code> object (stockField).
   * 
   * @param request HttpServletRequest from OrderServlet
   * @return String array of submitted stock numbers, or <code>null</code> if no
   *         stock numbers in form submission.
   * @throws InvalidParameterException thrown if submission violates
   *           restrictions of <code>DelimitedWebFormField</code>
   * @see DelimitedWebFormField
   */
  public static String[] getStockNumbers(HttpServletRequest request)
      throws InvalidParameterException {

    DelimitedWebFormField stockField = getStockField();
    return (String[])stockField.validate(request);
  }

  /**
   * Retrieves date to use as date last modified value for stock and order
   * updates. <code>String</code> value is retrieved and converted to a
   * <code>java.util.Date</code> object by calling validate() on corresponding
   * <code>DateWebFormField</code> (date_last_modified).
   * 
   * @return Date object representing submitted value to use as modification
   *         date.
   * @throws InvalidFormException thrown if invalid value submitted for date.
   * @see DateWebFormField
   */
  public static java.util.Date getDateModified(HttpServletRequest request)
      throws InvalidFormException {

    java.util.Date date_last_modified = null;
    DateWebFormField dateModified = getDateModified();

    try {
      date_last_modified = (java.util.Date)dateModified.validate(request);
    } catch (InvalidParameterException ipe) {
      throw new InvalidFormException(ipe.getMessage());
    }
    return date_last_modified;
  }

  /**
   * Retrieves stock numbers and stock charge waiver values to update them to by
   * parsing stock number out of name of charge waiver field. Stock number and
   * waiver are retrieved by calling validate() on corresponding
   * <code>CompoundWebFormField</code> object (waiveChargeField). Both values
   * are stored in a <code>CompoundVector</code> with stock number is as
   * <code>String</code> key referencing waiver for that stock number.
   * 
   * @param request HttpServletRequest passed from OrderServlet
   * @throws InvalidParameterException thrown if invalid stock number submitted
   *           for waiver
   * @return CompoundVector containing <code>String</code> stock number
   *         referencing waiver as corresponding value.
   * @see CompoundWebFormField
   * @see CompoundVector
   */
  public static CompoundVector getWaiveCharges(HttpServletRequest request)
      throws InvalidParameterException {

    CompoundWebFormField waiveChargeField = getWaiveChargeField();
    return (CompoundVector)waiveChargeField.validate(request);
  }

  /**
   * Retrieves order ids and stock numbers by parsing order id out of name of
   * stock id field. Order ID and stock number are retrieved by calling
   * validate() on corresponding <code>CompoundWebFormField</code> object
   * (orderStockField). Both values are stored in a <code>CompoundVector</code>
   * with order number as <code>String</code> key referencing stock number.
   * 
   * @param request HttpServletRequest passed from OrderServlet
   * @throws InvalidParameterException thrown if invalid stock numbers received
   * @return CompoundVector containing <code>String</code> order id referencing
   *         stock number as corresponding value.
   * @see CompoundWebFormField
   * @see CompoundVector
   */
  public static CompoundVector getStockIDs(HttpServletRequest request)
      throws InvalidParameterException {

    CompoundWebFormField orderStockField = getOrderStockField();
    return (CompoundVector)orderStockField.validate(request);
  }

  /**
   * Retrieves stock numbers and charges entered for each stock by parsing stock
   * number out of name of stock charge form field. Stock number and charge are
   * retrieved by calling validate() on an instance of
   * <code>CompoundWebFormField</code> created to represent the field found in
   * HTML form. Both values are stored in a <code>CompoundVector</code> with
   * stock number as <code>String</code> key referencing stock charge as a
   * String.
   * 
   * @param request HttpServletRequest passed from OrderServlet
   * @throws InvalidParameterException thrown if invalid input received
   * @return CompoundVector containing <code>String</code> stock number
   *         referencing stock charge as a String
   */
  public static CompoundVector getStockCharges(HttpServletRequest request)
      throws InvalidParameterException {
    CompoundWebFormField stockChargeField =
      new CompoundWebFormField("stock_charge",
                               false,
                               50,
                               "stock_charge_",
                               false);

    return (CompoundVector)stockChargeField.validate(request);
  }
}
