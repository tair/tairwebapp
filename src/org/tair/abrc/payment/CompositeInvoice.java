// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.22 $
// $Date: 2006/03/01 19:30:34 $
// ------------------------------------------------------------------------------
package org.tair.abrc.payment;


import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;


/**
 * CompositeInvoice extends TfcInvoice and is the main composite class for
 * creating, maintaining and storing invoices for stock orders.
 */

public class CompositeInvoice extends TfcInvoice implements Serializable,
    Iterable<TfcLineItem> {

  /**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = -2788948865741722793L;
  // collection of LineItem charges associated to invoice
  // lineitem collection may include all line items for an invoice
  // or may be filtered to include only
  // 1 - shipped stocks that have no notifications for payment
  // or 2 - unpaid charges plus unpaid shipped stocks
  private LineItemCollection lineItems;
  static private final Logger logger = Logger.getLogger(CompositeInvoice.class);

  /**
   * Creates an empty instance of CompositeInvoice
   */
  public CompositeInvoice() {
    super();
  }

  /**
   * Creates an instance of CompositeInvoice that reflects the data referenced
   * by submitted invoice_id
   * 
   * @param conn An active connection to the database
   * @param invoice_id Invoice id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  public CompositeInvoice(DBconnection conn, Long invoice_id)
      throws SQLException {
    super(conn, invoice_id);

    lineItems = new LineItemCollection(conn, invoice_id, "invoice");
  }

  /**
   * Creates an instance of CompositeInvoice that reflects the data referenced
   * by submitted invoice_id and the line items are filtered by specified
   * condition, ie; 'shippedNotNotified', ''shippedNotPaid' this facilitates
   * bulk submission of payments for credit card invoices and bulk notifications
   * sent for po invoices
   * 
   * @param conn An active connection to the database
   * @param invoice_id Invoice id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  public CompositeInvoice(DBconnection conn, Long invoice_id, String filter)
      throws SQLException {
    super(conn, invoice_id);

    if (filter != null) {
      lineItems = new LineItemCollection(conn, invoice_id, filter);
    }
  }

  /**
   * Determines if invoice has line items associated to it
   * 
   * @return <code>true</code> if invoice has line items associated to it or
   *         <code>false</code> if no line items associated with invoice
   */
  public boolean hasLineItems() {
    return (lineItems != null && !lineItems.isEmpty());
  }

  /**
   * Retrieves all line items for invoice
   * 
   * @return Retrieves line items for invoice as an <code>Iterator</code> of
   *         <code>TfcLineItem</code> objects or <code>null</code> if no line
   *         items exist for invoice
   */
  public Iterator getLineItems() {
    return hasLineItems() ? lineItems.iterator() : null;
  }

  /**
   * Retrieves line item representing a stock charge for stock with submitted
   * stock_id. This method should be always be used to get stock charge LineItem
   * objects since there can be multiple line items with this type for each
   * order (unlike other line item types). All other line item types can be
   * retrieved using the getItemType method.
   * 
   * 
   * @param stock_id Id of stock to retrieve line item charge for
   * @return TfcLineItem object representing charge for stock in order or
   *         <code>null</code> if object not found
   */
  public TfcLineItem getStockItem(Long stock_id) {
    return hasLineItems() ? lineItems.getStockItem(stock_id, get_orders_id())
        : null;
  }

  /**
   * Retrieves all stock charge line items for invoice. This method can be used
   * to get all stock charge LineItem objects since there can be multiple line
   * items with this type for each order (unlike other line item types). All
   * other line item types can be retrieved using the getItemType method.
   * 
   * @return Iterator of TfcLineItem objects representing charge for stocks in
   *         order or <code>null</code> if no stock line items in invoice
   */
  public Iterator<TfcLineItem> getStockItems() {
    return hasLineItems() ? lineItems.getStockItems() : null;
  }

  /**
   * Determines if line item for stock has been paid or not. This method should
   * always be used to get payment status of stock charge line items. All other
   * line item types should use the lineItemPaid method.
   * 
   * @param stock_id Stock id of stock to retrieve line item status for
   * @return <code>true</code> if line item for stock has been paid or
   *         <code> if line item has not been paid, or if no line item for stock
   * is found in collection
   */
  public boolean stockItemPaid(Long stock_id) {
    return hasLineItems() ? lineItems.stockItemPaid(stock_id, get_orders_id())
        : false;
  }

  /**
   * Retrieves amount charged for stock charge line item for stock with
   * submitted stock_id. This method should be always be used to get stock
   * charge amounts since there can be multiple line items with this type for
   * each order (unlike other line item types). All other line item types can be
   * retrieved using the getLineItemCharge method.
   * 
   * 
   * @param stock_id Id of stock to retrieve line item charge for
   * @return Amount charged for stock charge line item in order or zero if stock
   *         not found in order
   */
  public Float getStockCharge(Long stock_id) {
    Float stockCharge = null;

    if (hasLineItems()) {
      stockCharge = lineItems.getStockCharge(stock_id, get_orders_id());
    } else {
      stockCharge = new Float(0);
    }
    return stockCharge;
  }

  /**
   * Determines if invoice has a stock charge line item for stock with submitted
   * stock id.
   * 
   * @param stock_id Id of stock to check line item status for
   * @return <code>true</code> if stock has a line item charge or
   *         <code>false</code> if no line item charge for stock
   */
  public boolean hasStockCharge(Long stock_id) {
    return (getStockCharge(stock_id).floatValue() > 0);
  }

  /**
   * Determines if invoice contains any line item charges for stocks. This is
   * useful since order can contain stocks without incurring a charge; in this
   * case, other charges such as order charge are waived as well.
   * 
   * @return <code>true</code> if invoice has stock line item charges or
   *         <code>false</code> if invoice has no stock line item charges
   */
  public boolean hasStockCharges() {
    return hasLineItems() ? lineItems.hasStockCharges() : false;
  }

  /**
   * Retrieves total of all stock charge line items for invoice.
   * 
   * @return Total amount of all stock charge line items for invoice or zero if
   *         no stock charges in order
   */
  public Float getStockCharges() {
    return hasLineItems() ? lineItems.getStockCharges() : new Float(0);
  }

  /**
   * Determines if all stock charge line items have been paid. This will return
   * true only if invoice contains stock charge line items to begin with. False
   * will be returned if any stock charge line items are unpaid or if invoice
   * has no stock charge line items.
   * 
   * @return <code>true</code> if all stock charge line items for invoice have
   *         been paid; <code>false</code> if any stock charge line items are
   *         unpaid or if invoice has no stock charge items.
   */
  public boolean stockItemsPaid() {
    return hasLineItems() ? lineItems.stockItemsPaid() : false;
  }

  /**
   * Retrieves first line item found in collection with submitted type. For all
   * LineItem.type values other than stock_charge, this method should return the
   * desired LineItem object correctly. All requests for stock charge items
   * should be done through the getStockItem method, since there may be multiple
   * line items in the collection (one for each stock in the order).
   * 
   * @param type Line item type to retrieve
   * @return First line item found in invoice with submitted type or
   *         <code>null</code> if no line item found for that type
   */
  public TfcLineItem getItemType(String type) {
    return hasLineItems() ? lineItems.getItemType(type) : null;
  }

  /**
   * Retrieves amount of line item charge for submitted line item type. This
   * method should not be used for stock charge line items; getStockItemCharge
   * should be used in this case
   * 
   * @param type Line item type to retrieve charge amount for
   * @return Amount charged for submitted line item type or zero if line item
   *         not found.
   */
  public Float getLineItemCharge(String type) {
    return hasLineItems() ? lineItems.getLineItemCharge(type) : new Float(0);
  }

  /**
   * Determines if line item in collection with submitted type has a paid status
   * or not. This method should be used to determine paid status of all line
   * item types other than stock charges.
   * 
   * @param type Line item type to check status for
   * @return <code>true</code> if line item has been paid for or
   *         <code>false</code> if line item has not been paid for.
   */
  public boolean lineItemPaid(String type) {
    return hasLineItems() ? lineItems.itemTypePaid(type) : false;
  }

  /**
   * Retrieves line item for order charge. This is simply a convenience wrapper
   * to getItemType.
   * 
   * @return Line item for order charge
   */
  public TfcLineItem getOrderChargeLineItem() {
    return getItemType(DataConstants.getOrderChargeLineItem());
  }

  /**
   * Returns amount of order charge line item. This is a convenience wrapper to
   * getLineItemCharge
   * 
   * @return Amount of order charge line item
   */
  public Float getOrderCharge() {
    return getLineItemCharge(DataConstants.getOrderChargeLineItem());
  }

  /**
   * Determines if invoice contains an order charge line item
   * 
   * @return <code>true</code> if invoice contains an order charge or
   *         <code>false</code> if no order charge found
   */
  public boolean hasOrderCharge() {
    return (getOrderCharge().floatValue() > 0);
  }

  /**
   * Determines if order charge line item has been paid. This is simply a
   * convenience wrapper to lineItemPaid
   * 
   * @return <code>true</code> if order charge line item has been paid or
   *         <code>false</code> if line item has not been paid or if no order
   *         charge line item exists in collection
   */
  public boolean orderChargePaid() {
    return lineItemPaid(DataConstants.getOrderChargeLineItem());
  }

  /**
   * Retrieves line item for express shipping charge. This is simply a
   * convenience wrapper to getItemType.
   * 
   * @return Line item for express shipping charge
   */
  public TfcLineItem getExpressShippingLineItem() {
    return getItemType(DataConstants.getExpressShippingLineItem());
  }

  /**
   * Returns amount of express shipping charge line item. This is a convenience
   * wrapper to getLineItemCharge
   * 
   * @return Amount of express shipping charge line item
   */
  public Float getExpressShippingCharge() {
    return getLineItemCharge(DataConstants.getExpressShippingLineItem());
  }

  /**
   * Sets amount of express shipping charge line item.
   * 
   * @param amount amount to set the express shipping charge to
   */
  public void setExpressShippingCharge(Float amount) {
    String type = DataConstants.getExpressShippingLineItem();
    lineItems.setLineItemCharge(type, amount);
  }

  /**
   * Determines if invoice contains an express shipping charge line item
   * 
   * @return <code>true</code> if invoice contains an express shipping charge or
   *         <code>false</code> if no express shipping charge found
   */
  public boolean hasExpressShippingCharge() {
    return (getExpressShippingCharge().floatValue() > 0);
  }

  /**
   * Determines if express shipping charge line item has been paid. This is
   * simply a convenience wrapper to lineItemPaid
   * 
   * @return <code>true</code> if express shipping charge line item has been
   *         paid or <code>false</code> if line item has not been paid or if no
   *         express shipping charge line item exists in collection
   */
  public boolean expressShippingChargePaid() {
    return lineItemPaid(DataConstants.getExpressShippingLineItem());
  }

  /**
   * Retrieves line item for phytosanitary charge. This is simply a convenience
   * wrapper to getItemType.
   * 
   * @return Line item for phytosanitary charge
   */
  public TfcLineItem getPhytosanitaryLineItem() {
    return getItemType(DataConstants.getPhytosanitaryChargeLineItem());
  }

  /**
   * Determines if invoice contains a phytosanitary charge line item.
   * 
   * <p>
   * 
   * @return <code>true</code> if invoice contains a phytosanitary charge or
   *         <code>false</code> if no order charge found
   */
  public boolean hasPhytosanitaryCharge() {
    boolean hasCharge = false;

    TfcLineItem item = getPhytosanitaryLineItem();
    if (item != null) {
      hasCharge = (item.get_amount().floatValue() > 0);
    }

    return hasCharge;
  }

  /**
   * Returns amount of phytosanitary charge line item. This is a convenience
   * wrapper to getLineItemCharge
   * 
   * @return Amount of phytosanitary charge line item
   */
  public Float getPhytosanitaryCharge() {
    Float charge =
      getLineItemCharge(DataConstants.getPhytosanitaryChargeLineItem());

    return charge;
  }

  /**
   * Determines if phytosanitary charge line item has been paid. This is simply
   * a convenience wrapper to lineItemPaid
   * 
   * @return <code>true</code> if phytosanitary charge line item has been paid
   *         or <code>false</code> if line item has not been paid or if no
   *         phytosanitary charge line item exists in collection
   */
  public boolean phytosanitaryChargePaid() {
    return lineItemPaid(DataConstants.getPhytosanitaryChargeLineItem());
  }

  /**
   * Adds submitted line item to invoice's collection of line items
   * 
   * @param lineItem Line item to add to collection
   */
  public void addLineItem(TfcLineItem lineItem) {
    if (lineItems == null) {
      lineItems = new LineItemCollection();
    }
    lineItems.add(lineItem);
  }

  /**
   * Removes submitted line item from invoice's collection of line items.
   * 
   * @param lineItem Line item to remove from collection
   */
  public void removeLineItem(TfcLineItem lineItem) {
    lineItems.remove(lineItem);
  }

  /**
   * Removes order charge line item from invoice's collection of line items.
   */
  public void removeOrderCharge() {
    lineItems.remove(DataConstants.getOrderChargeLineItem());
  }

  /**
   * Removes express shipping charge line item from invoice's collection of line
   * items.
   */
  public void removeExpressShippingCharge() {
    lineItems.remove(DataConstants.getExpressShippingLineItem());
  }

  /**
   * Removes phytosanitary charge line item from invoice's collection of line
   * items.
   */
  public void removePhytosanitaryCharge() {
    lineItems.remove(DataConstants.getPhytosanitaryChargeLineItem());
  }

  /**
   * Delete stock charge line item for stock with submitted stock_id.
   * 
   * @param stock_id Id of stock to retrieve line item charge for
   */
  public void deleteStockCharge(Long stock_id) {
    lineItems.deleteStockCharge(stock_id, get_orders_id());
  }

  /**
   * Removes stock charge line item for stock with submitted stock_id.
   * 
   * @param stock_id Id of stock to retrieve line item charge for
   */
  public void removeStockCharge(Long stock_id) {
    lineItems.removeStockCharge(stock_id, get_orders_id());
  }

  /**
   * Removes all stock charge line items from invoice
   */
  public void removeStockCharges() {
    lineItems.remove(DataConstants.getStockChargeLineItem());
  }

  /**
   * Convenience method to remove all line item charges for invoice. This is
   * done to remove any charges that were previously set that are no longer
   * needed (such as if a stock order is found to contain only reship stocks).
   * Individual charges can be removed one by one through line item type
   * specific methods, but this gateway method is useful for clearing all
   * charges at once.
   */
  public void removeAllCharges() {
    if (hasLineItems()) {
      lineItems.clear();
    }
  }

  /**
   * Calculates total amount of payments that have been applied to this invoice.
   * This is done by adding together all line item amounts for invoice that have
   * a "paid" status
   * 
   * @return Total payment towards this invoice as a floating point number or
   *         zero if no payments have been made.
   */
  public Float getPaymentTotal() {
    return hasLineItems() ? lineItems.getPaymentTotal() : new Float(0);
  }

  /**
   * Determines if invoice has had any payments applied to it.
   * 
   * @return <code>true</code> if any line items for invoice have been paid or
   *         <code>false</code> if no payments have been made
   */
  public boolean hasPayments() {
    return hasLineItems() ? lineItems.hasPayments() : false;
  }

  /**
   * Calculates balance due on this invoice by subtracting total amount paid
   * from invoice total. If no payments have been made, invoice total will be
   * returned.
   * 
   * <p>
   * 
   * @return Total balance due for invoice as a floating point number - this
   *         will be zero if no balance is due for the invoice.
   */
  public Float getBalanceDue() {

    float invoiceTotal = get_invoice_total().floatValue();
    float paymentTotal = getPaymentTotal().floatValue();

    float balanceDue = invoiceTotal - paymentTotal;

    return new Float(balanceDue);
  }

  /**
   * Determines if invoice has a balance due. This is a convenience method that
   * simply determines if getBalanceDue returns a non-zero amount or not.
   * 
   * <p>
   * 
   * @return <code>true</code> if invoice has a balance due or
   *         <code>false</code> if invoice is paid in full
   */
  public boolean hasBalanceDue() {
    return (getBalanceDue().floatValue() > 0);
  }

  /**
   * Overrides superclass method to always calculate invoice total charges from
   * all existing line items. Superclass method will return the current value of
   * the invoice_total member variable, as stored in the database. Superclass
   * value should always equal the full calculated value, but method is
   * overridden here to avoid confusion as well as need to worry about
   * synchronizing invoice total values constantly during invoice and order
   * maintenance actions.
   * 
   * @return Total of charges for invoice or zero if invoice has no charges
   */
  public Float get_invoice_total() {
    return hasLineItems() ? lineItems.getTotalCharges() : new Float(0);
  }

  /**
   * Returns invoice total as it was stored in the database last. This value
   * maps to the value of superclass's invoice_total member variable so this
   * method is simply a wrapper to the superclass's implementation of
   * get_invoice_total (which is overridden here to always return the total as
   * calculated from line items). This is needed in the small number of cases
   * where client code needs to know what the original value of the invoice was
   * when order was placed (for example, when validating order charge updates).
   * 
   * @return Invoice total as stored in the database instead of as calculated
   *         total of invoice's line items
   */
  public Float getLastInvoiceTotal() {
    return super.get_invoice_total();
  }

  /**
   * Adds charges of all line items currently in invoice and updates invoice
   * total field recorded in superclass. This method should be called whenever
   * invoice is stored to the database to ensure to ensure that total stored in
   * Invoice table matches the total of all line item charges for invoice.
   */
  private void updateInvoiceTotal() {
    if (hasLineItems()) {
      set_invoice_total(lineItems.getTotalCharges());
    } else {
      set_invoice_total(new Float(0));
    }
  }

  /**
   * Stores invoice data and all associated LineItem info. to the database.
   * 
   * @param conn A connection with INSERT/UPDATE/DELETE privileges
   * @throws InvalidActionException if invoice or line items are in an invalid
   *           state for storing to the database
   * @throws SQLException if a database error occurs
   */
  public void store(DBconnection conn) throws InvalidActionException,
      SQLException {

    // make sure invoice total member variable is correctly set
    updateInvoiceTotal();

    super.store(conn);
    String query1 =
      "SELECT count(*) as county from Invoice WHERE invoice_id = "
          + get_invoice_id();
    try {
      conn.setQuery(query1);
      ResultSet results1 = conn.getResultSet();
      while (results1.next()) {
        logger.debug("PART1 : " + results1.getLong("county"));
      }
    } finally {
      conn.releaseResources();
    }

    // set invoice id and orders_id (for any stock charges) for line
    // items in collection before storing
    //
    // store lineItems if not null, even if empty to ensure that any
    // line items removed since invoice was created get deleted from db
    if (lineItems != null) {
      String query2 =
        "SELECT count(*) as county from Invoice WHERE invoice_id = "
            + get_invoice_id();
      try {
        conn.setQuery(query2);
        ResultSet results2 = conn.getResultSet();
        while (results2.next()) {
          logger.debug("PART2 : " + results2.getLong("county"));
        }
      } finally {
        conn.releaseResources();
      }
      lineItems.setInvoiceID(get_invoice_id());
      String query3 =
        "SELECT count(*) as county from Invoice WHERE invoice_id = "
            + get_invoice_id();
      try {
        conn.setQuery(query3);
        ResultSet results3 = conn.getResultSet();
        while (results3.next()) {
          logger.debug("PART3 : " + results3.getLong("county"));
        }
      } finally {
        conn.releaseResources();
      }
      lineItems.setStockOrdersID(get_orders_id());
      String query4 =
        "SELECT count(*) as county from Invoice WHERE invoice_id = "
            + get_invoice_id();
      try {
        conn.setQuery(query4);
        ResultSet results4 = conn.getResultSet();
        while (results4.next()) {
          logger.debug("PART4 : " + results4.getLong("county"));
        }
      } finally {
        conn.releaseResources();
      }
      lineItems.store(conn);
    }
  }

  @Override
  public Iterator<TfcLineItem> iterator() {
    return lineItems.iterator();
  }
}
