// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.8 $
// $Date: 2006/07/26 21:27:06 $
// ------------------------------------------------------------------------------

package org.tair.abrc.payment;


import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLineItem;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;


/**
 * LineItemCollection is a custom collection that stores all line items for an
 * invoice or payment as a collection of <code>TfcLineItem</code> objects. You
 * can have duplicate stock line items but not duplicate order charges.
 */

public class LineItemCollection implements Serializable {
  private static final Logger logger =
    Logger.getLogger(LineItemCollection.class);
  /**
   * Generated serial version UID for Serializable object
   */
  private static final long serialVersionUID = 5136742278065498693L;

  private ArrayList<TfcLineItem> items;

  // list of items removed from collection since collection was last
  // created or stored to the database. All items in collection will be
  // deleted from the database next time store is called on collection
  private ArrayList<TfcLineItem> deleted;

  // id and object type (payment or invoice) this collection of line items
  // is for. If type is "payment", id will be payment_id collection was
  // created for; if type is "invoice" id will be invoice_id collection was
  // created for
  private Long id;
  private String type;

  /**
   * Creates an empty instance of LineItemCollection
   */
  public LineItemCollection() {
    items = new ArrayList<TfcLineItem>();
    deleted = new ArrayList<TfcLineItem>();
  }

  /**
   * Creates an instance of LineItemCollection contains all line items for
   * either an invoice or payment according to the submitted value of type.
   * Acceptable literal type values are:
   * 
   * <ul>
   * <li>invoice - submitted id must be invoice_id</li>
   * <li>payment - submitted id must payment_id</li>
   * </ul>
   * 
   * @param conn An active connection to the database
   * @param id Invoice or payment id to retrieve line items for
   * @param type If submitted value is "invoice" line items will be retrieved
   *          for an invoice id; if value is "payment" line items will be
   *          retrieved for a payment id
   * @throws SQLException if a database error occurs
   */
  public LineItemCollection(DBconnection conn, Long id, String type)
      throws SQLException {

    this();

    populate(conn, id, type);
    setCollectionID(id);
    setCollectionType(type);
  }

  /**
   * Populates collection by retrieving line_item_ids associated to submitted
   * invoice or payment id and creating TfcLineItem objects for each
   * 
   * @param conn An active connection to the database
   * @param id Invoice or payment id to retrieve line items for
   * @param type If submitted value is "invoice" line items will be retrieved
   *          for an invoice id; if value is "payment" line items will be
   *          retrieved for a payment id
   * @throws SQLException if a database error occurs
   */
  private void populate(DBconnection conn, Long id, String type)
      throws SQLException {

    ArrayList<Long> ids = new ArrayList<Long>();

    StringBuffer query = new StringBuffer();
    query.append("SELECT line_item_id " + "FROM LineItem li ");

    if (type.equals("invoice")) {
      query.append("WHERE invoice_id = ?");

      // line items for shipped stocks, not notified
    } else if (type.equals("shippedNotNotified")) {
      query.append("WHERE invoice_id = ? ");
      query.append("AND notification_date is NULL ");
      query.append("AND li.status = 'unpaid' ");
      query.append("AND EXISTS ( SELECT 'X' ");
      query.append("FROM Orders_Stock os WHERE ");
      query.append("os.stock_id = li.stock_id ");
      query.append("AND os.orders_id = li.orders_id ");
      query.append("AND os.status = 'shipped' ) ");

      // line items for charges or shipped stocks, not paid
    } else if (type.equals("shippedNotPaid")) {
      query.append("WHERE invoice_id = ? ");
      query.append("AND li.status = 'unpaid' ");
      query.append("AND ( ( li.lineitem_type <> 'stock_charge' ");
      query.append("AND EXISTS ( SELECT 'X' FROM Invoice i ");
      query.append("WHERE i.invoice_id = li.invoice_id ");
      query.append("AND i.status <> 'new' ) ");
      query.append("OR EXISTS ( SELECT 'X' ");
      query.append("FROM Orders_Stock os WHERE ");
      query.append("os.stock_id = li.stock_id ");
      query.append("AND os.orders_id = li.orders_id ");
      query.append("AND os.status = 'shipped' ) ) )");

    } else if (type.equals("payment")) {
      query.append("WHERE payment_id = ?");
    }

    try {
      conn.setQuery(query.toString());
      conn.setQueryVariable(id);

      ResultSet results = conn.getResultSet();
      while (results.next()) {
        ids.add(new Long(results.getLong("line_item_id")));
      }
    } finally {
      conn.releaseResources();
    }
    for (Long item_id : ids) {
      add(new TfcLineItem(conn, item_id));
    }
  }

  /**
   * Retrieves invoice_id or payment_id this collection of line items is for. Id
   * type can be determined through the getCollectionType method which will
   * return either "payment" or "invoice" (or null) depending on what value was
   * submitted in the constructor.
   * 
   * <p>
   * This method may return <code>null</code> if collection was created using
   * the no params constructor to represent items for a new invoice or payment
   * and type has not yet been explicitly set through the setCollectionType
   * method.
   * 
   * @return Id used to populate collection or <code>null</code> if no
   *         collection id has been set for collection yet.
   */
  public Long getCollectionID() {
    return id;
  }

  /**
   * Returns string value representing the type of line item collection this
   * instance represents. Type should be "payment" or "invoice" if collection
   * represents all line items for a payment or invoice. This method may return
   * <code>null</code> if collection was created using the no params constructor
   * to represent items for a new invoice or payment and type has not yet been
   * explicitly set through the setCollectionType method.
   * 
   * @return Type of line item collection this collection was created as or
   *         <code>null</code> if no collection type has been set for collection
   *         yet.
   */
  public String getCollectionType() {
    return type;
  }

  /**
   * Sets collection type for this collection. This method should be used to
   * define a collection that was created empty and populated with items for a
   * new invoice or payment. This data should be set when setting value of
   * collection id so that type of id is clearly defined
   * 
   * @param type Type of line item collection this collection instance
   *          represents (invoice or payment).
   */
  public void setCollectionType(String type) {
    this.type = type;
  }

  /**
   * Sets id for object collection was populated for. This method should be used
   * to define a collection that was created empty and populated with items for
   * a new invoice or payment. Id must be an invoice_id or a payment_id;
   * collection type should be set accordingly to clearly define which is being
   * used
   * 
   * @param id Invoice id or payment id for all items collection; id type is
   *          determined by collection type.
   */
  public void setCollectionID(Long id) {
    this.id = id;
  }

  /**
   * Calculates total amount of payments that have been applied to line items in
   * collection. This is done by adding together all line item amounts that have
   * a "paid" status
   * 
   * @return Total payments made as a floating point number or zero if no
   *         payments have been made.
   */
  public Float getPaymentTotal() {
    float totalPaid = 0;

    if (!isEmpty()) {
      TfcLineItem item = null;
      String status = null;

      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        status = item.get_status();
        if (DataConstants.getPaidLineItem().equals(status)) {
          totalPaid += item.get_amount().floatValue();
        }
      }
    }

    return new Float(totalPaid);
  }

  /**
   * Determines if collection contains any line items that have had payments
   * applied to them. This is done by iterating through line items and checking
   * status to find "paid" items.
   * 
   * @return <code>true</code> if at leas one item in collection has been paid
   *         or <code>false</code> if collection is empty or if no items have a
   *         status of paid.
   */
  public boolean hasPayments() {
    boolean hasPayments = false;

    if (!isEmpty()) {
      TfcLineItem item = null;
      String status = null;
      String paidStatus = DataConstants.getPaidLineItem();

      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        status = item.get_status();
        if (paidStatus.equals(status)) {
          hasPayments = true;
          break;
        }
      }
    }
    return hasPayments;
  }

  /**
   * Determines if collection contains any line item charges for stocks. This is
   * useful since order can contain stocks without incurring a charge; in this
   * case, other charges such as order charge are waived as well.
   * 
   * @return <code>true</code> if collection has stock line item charges or
   *         <code>false</code> if collection has no stock line item charges
   */
  public boolean hasStockCharges() {
    boolean hasCharges = false;

    if (!isEmpty()) {

      TfcLineItem item = null;
      Float amount = null;
      String stockChargeType = DataConstants.getStockChargeLineItem();

      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        amount = item.get_amount();
        if (stockChargeType.equals(item.get_type())
            && (amount != null && amount.floatValue() > 0)) {
          hasCharges = true;
          break;
        }
      }
    }

    return hasCharges;
  }

  /**
   * Retrieves total of all stock charge line items in collection
   * 
   * @return Total amount of all stock charge line items in collection or zero
   *         if no stock charges in collection
   */
  public Float getStockCharges() {
    float totalCharges = 0;

    if (!isEmpty()) {

      TfcLineItem item = null;
      Float amount = null;
      String stockChargeType = DataConstants.getStockChargeLineItem();

      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        amount = item.get_amount();
        if (stockChargeType.equals(item.get_type()) && amount != null) {

          totalCharges += amount.floatValue();
        }
      }
    }

    return new Float(totalCharges);
  }

  /**
   * Returns total amount of all line item charges in collection.
   * 
   * @return Total amount of line item charges in collection or zero if no
   *         charges in collection
   */
  public Float getTotalCharges() {
    float total = 0;

    if (!isEmpty()) {

      TfcLineItem item = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();

        total += item.get_amount().floatValue();
      }
    }

    return new Float(total);
  }

  /**
   * Retrieves item with submitted line_item_id
   * 
   * @param id Id of item to return
   * @return Item with submitted id, or <code>null</code> if id not found
   */
  public TfcLineItem get(Long id) {
    TfcLineItem item = null;

    if (!isEmpty()) {
      TfcLineItem tmpItem = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        tmpItem = (TfcLineItem)iter.next();
        if (id.equals(tmpItem.get_line_item_id())) {
          item = tmpItem;
          break;
        }
      }
    }

    return item;
  }

  /**
   * Retrieves line item representing a stock charge for stock with submitted
   * stock_id in order with submitted orders_id. This method should be always be
   * used to get stock charge LineItem objects since there can be multiple line
   * items with this type for each order (unlike other line item types). All
   * other line item types can be retrieved using the getItemType method.
   * 
   * 
   * @param stock_id Id of stock to retrieve line item charge for
   * @param orders_id Order id to retrieve line item charge for stock from. This
   *          will be null for new orders that have not yet saved to the
   *          database
   * @return TfcLineItem object representing charge for stock in order or
   *         <code>null</code> if object not found
   */
  public TfcLineItem getStockItem(Long stock_id, Long orders_id) {
    TfcLineItem item = null;

    // all stock charges use same LineItem.type value
    String type = DataConstants.getStockChargeLineItem();

    if (!isEmpty()) {
      TfcLineItem tmpItem = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        tmpItem = (TfcLineItem)iter.next();

        if (type.equals(tmpItem.get_type())
            && stock_id.equals(tmpItem.get_stock_id())
            && ((orders_id == null && tmpItem.get_orders_id() == null) || orders_id.equals(tmpItem.get_orders_id()))) {
          item = tmpItem;

          break;
        }
      }
    }

    return item;
  }

  /**
   * Retrieves all stock charge line items for invoice. This method can be used
   * to get all stock charge LineItem objects since there can be multiple line
   * items with this type for each order (unlike other line item types). All
   * other line item types can be retrieved using the getItemType method.
   * 
   * 
   * @return Iterator of TfcLineItem objects representing charge for stocks in
   *         order or <code>null</code> if no stock line items in invoicwe
   */
  public Iterator<TfcLineItem> getStockItems() {
    Iterator<TfcLineItem> iter = null;
    ArrayList<TfcLineItem> items = new ArrayList<TfcLineItem>();

    // all stock charges use same LineItem.type value
    String type = DataConstants.getStockChargeLineItem();

    if (!isEmpty()) {
      TfcLineItem item = null;
      for (Iterator<TfcLineItem> itemIter = iterator(); itemIter.hasNext();) {
        item = (TfcLineItem)itemIter.next();
        if (type.equals(item.get_type())) {
          items.add(item);
        }
      }
    }
    if (!items.isEmpty()) {
      iter = items.iterator();
    }
    return iter;
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
  public Float getStockCharge(Long stock_id, Long orders_id) {
    TfcLineItem item = getStockItem(stock_id, orders_id);

    return (item != null) ? item.get_amount() : new Float(0);
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
  public boolean stockItemPaid(Long stock_id, Long orders_id) {
    boolean paid = false;

    TfcLineItem item = getStockItem(stock_id, orders_id);
    if (item != null) {
      paid = DataConstants.getPaidLineItem().equals(item.get_status());
    }

    return paid;
  }

  /**
   * Determines if all stock charge line items have been paid. This will return
   * true only if collection contains stock charge line items to begin with.
   * False will be returned if any stock charge line items are unpaid or if
   * collection has no stock charge line items.
   * 
   * @return <code>true</code> if all stock charge line items in collection have
   *         been paid; <code>false</code> if any stock charge line items are
   *         unpaid or if collection has no stock charge items.
   */
  public boolean stockItemsPaid() {
    boolean paid = true;
    boolean hasStocks = false;

    if (!isEmpty()) {
      String paidStatus = DataConstants.getPaidLineItem();
      String type = DataConstants.getStockChargeLineItem();

      TfcLineItem item = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        if (type.equals(item.get_type())) {
          hasStocks = true;
          if (!paidStatus.equals(item.get_status())) {
            paid = false;
            break;
          }
        }
      }
    }

    if (!hasStocks) {
      paid = false;
    }

    return paid;
  }

  /**
   * Retrieves first line item found in collection with submitted type. For all
   * LineItem.type values other than stock_charge, this method should return the
   * desired LineItem object correctly. All requests for stock charge items
   * should be done through the getStockItem method, since there may be multiple
   * line items in the collection (one for each stock in the order).
   * 
   * @param type Line item type to retrieve
   * @return First line item found in collection with submitted type or
   *         <code>null</code> if no line item found for that type
   */
  public TfcLineItem getItemType(String type) {
    TfcLineItem item = null;

    if (!isEmpty()) {
      TfcLineItem tmpItem = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        tmpItem = (TfcLineItem)iter.next();
        if (type.equals(tmpItem.get_type())) {
          item = tmpItem;
          break;
        }
      }
    }

    return item;
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
    TfcLineItem item = getItemType(type);
    Float charge = (item != null) ? item.get_amount() : new Float(0);

    return charge;
  }

  /**
   * Sets te amount of line item charge for submitted data type. This method
   * should not be used for stock line items can be easily used by order or
   * express charge
   * 
   * @param type line item type to set charge amount for
   * @param amount to set the line item to
   */
  public void setLineItemCharge(String type, Float amount) {
    TfcLineItem item = getItemType(type);
    item.set_amount(amount);
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
  public boolean itemTypePaid(String type) {
    boolean paid = false;

    TfcLineItem item = getItemType(type);

    if (item != null) {
      String status = item.get_status();
      paid = DataConstants.getPaidLineItem().equals(status);
    }

    return paid;
  }

  /**
   * Removes all charges from collection
   */
  public void clear() {
    if (!isEmpty()) {
      TfcLineItem item = null;
      String type = DataConstants.getStockChargeLineItem();
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        item.set_amount(new Float(0.00f));
      }
    }
    // deleted.addAll( items );
    // items.clear();

  }

  /**
   * Determines if collection contains elements or not
   * 
   * @return <code>true</code> if collection has no elements in it, or
   *         <code>false</code> if collection has at least one element in it
   */
  public boolean isEmpty() {
    return items.isEmpty();
  }

  /**
   * Determines number of elements in collection
   * 
   * @return Number of elements in collection
   */
  public int size() {
    return items.size();
  }

  /**
   * Retrieves all elements in collection
   * 
   * @return Elements in collection as an <code>Iterator</code> of
   *         <code>TfcLineItem</code> objects, or <code>null</code> if no
   *         elements in collection
   */
  public Iterator<TfcLineItem> iterator() {
    return !isEmpty() ? items.iterator() : null;
  }

  /**
   * Retrieves element at submitted index
   * 
   * @param index Index of item to retrieve
   * @return Element at submitted index, or <code>null</code> if no element at
   *         requested index
   */
  public TfcLineItem get(int index) {
    return items.get(index);
  }

  /**
   * Determines index of submitted object in collection
   * 
   * @param item Item object to retrieve index of
   * @return index of item within collection
   */
  public int indexOf(TfcLineItem item) {
    return items.indexOf(item);
  }

  /**
   * Adds supplied element to collection if it does not duplicate an
   * already-present order charge.
   * 
   * @param item Item to add to collection
   */
  public void add(TfcLineItem item) {
    boolean duplicate = false;
    if (DataConstants.ORDER_CHARGE_LINE_ITEM.equalsIgnoreCase(item.get_type())) {
      // order charge, see if there's already one in the array.
      for (TfcLineItem existingItem : items) {
        if (DataConstants.ORDER_CHARGE_LINE_ITEM.equalsIgnoreCase(existingItem.get_type())) {
          // Log and ignore the add attempt, removing the duplicate charge.
          logger.error("Adding order charge but already have an order charge for "
                       + existingItem.get_amount());
          duplicate = true;
        }
      }
    }
    if (!duplicate) {
      items.add(item);
    }
  }

  /**
   * Determines if supplied element is in collection
   * 
   * @return <code>true</code> if supplied element is in collection;
   *         <code>false</code> if element is not found
   */
  public boolean contains(TfcLineItem item) {
    return items.contains(item);
  }

  /**
   * Removes submitted line item from collection. Line item will be deleted from
   * the database if it has a non-null line_item_id the next time store method
   * is called on collection
   * 
   * @param item Line item to remove from collection
   */
  public void remove(TfcLineItem item) {
    item.set_amount(new Float(0.00f));
    // items.remove( item );
    // deleted.add( item );
  }

  /**
   * Delete stock charge line item for submitted stock in submitted order from
   * collection. Line item will be deleted from the database if it has a
   * non-null line_item_id the next time store method is called on collection
   * 
   * @param stock_id Stock id of stock to remove charge for
   * @param orders_id Orders id to remove stock charge from
   */
  public void deleteStockCharge(Long stock_id, Long orders_id) {
    if (!isEmpty()) {
      TfcLineItem item = null;
      String type = DataConstants.getStockChargeLineItem();
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        if (type.equals(item.get_type())
            && stock_id.equals(item.get_stock_id())
            && ((orders_id == null && item.get_orders_id() == null) || orders_id.equals(item.get_orders_id()))) {

          deleted.add(item);
          iter.remove();
        }
      }
    }
  }

  /**
   * Removes stock charge line item for submitted stock in submitted order from
   * collection. Line item will be deleted from the database if it has a
   * non-null line_item_id the next time store method is called on collection
   * 
   * @param stock_id Stock id of stock to remove charge for
   * @param orders_id Orders id to remove stock charge from
   */
  public void removeStockCharge(Long stock_id, Long orders_id) {
    if (!isEmpty()) {
      TfcLineItem item = null;
      String type = DataConstants.getStockChargeLineItem();
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        if (type.equals(item.get_type())
            && stock_id.equals(item.get_stock_id())
            && ((orders_id == null && item.get_orders_id() == null) || orders_id.equals(item.get_orders_id()))) {

          item.set_amount(new Float(0.00f));
          // deleted.add( item );
          // iter.remove();
        }
      }
    }
  }

  /**
   * Removes all line item charges with submitted type from collection
   * 
   * @param type Type of line items to remove
   */
  public void remove(String type) {
    if (!isEmpty()) {
      TfcLineItem item = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        if (type.equals(item.get_type())) {

          // deleted.add( item );
          // iter.remove();
          item.set_amount(new Float(0.00f));
        }
      }
    }
  }

  /**
   * Sets value of orders_id all stock charge line items in collection. NOTE:
   * this value should only be set for stock charge items to correctly reference
   * the stock/order join row in Orders_Stock. Other line items should not have
   * this value set.
   * 
   * @param orders_id Orders id to set for all stock charge line items
   */
  public void setStockOrdersID(Long orders_id) {
    String stockType = DataConstants.getStockChargeLineItem();

    if (!isEmpty()) {
      TfcLineItem lineItem = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        lineItem = (TfcLineItem)iter.next();
        if (stockType.equals(lineItem.get_type())) {
          lineItem.set_orders_id(orders_id);
        }
      }
    }
  }

  /**
   * Sets value of invoice_id for all items in collection
   * 
   * @param invoice_id Invoice id to set for all items in collection.
   */
  public void setInvoiceID(Long invoice_id) {
    if (!isEmpty()) {
      TfcLineItem item = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        item.set_invoice_id(invoice_id);
      }
    }
  }

  /**
   * Sets value of payment_id for all items in collection
   * 
   * @param payment_id Payment id to set for all items in collection.
   */
  public void setPaymentID(Long payment_id) {
    if (!isEmpty()) {
      TfcLineItem item = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        item.set_payment_id(payment_id);
      }
    }
  }

  /**
   * Stores contents of collection to the database.
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws InvalidActionException if required data has not been set for any
   *           data element
   * @throws SQLException if a database error occurs
   */
  public void store(DBconnection conn) throws InvalidActionException,
      SQLException {
    Long invoice_id = null;
    if (!isEmpty()) {
      TfcLineItem item = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();
        invoice_id = item.get_invoice_id();
      }
    }
    System.out.println("id : " + invoice_id);

    String query1 =
      "SELECT count(*) as county from Invoice WHERE invoice_id = " + invoice_id;
    try {
      conn.setQuery(query1);
      ResultSet results1 = conn.getResultSet();
      while (results1.next()) {
        System.out.println("PART LIC1 : " + results1.getLong("county"));
      }
    } finally {
      conn.releaseResources();
    }

    // delete any items removed since collection was created
    delete(conn);
    String query2 =
      "SELECT count(*) as county from Invoice WHERE invoice_id = " + invoice_id;
    try {
      conn.setQuery(query1);
      ResultSet results2 = conn.getResultSet();
      while (results2.next()) {
        System.out.println("PART LIC2 : " + results2.getLong("county"));
      }
    } finally {
      conn.releaseResources();
    }
    if (!isEmpty()) {
      TfcLineItem item = null;
      for (Iterator iter = iterator(); iter.hasNext();) {
        item = (TfcLineItem)iter.next();

        String query3 =
          "SELECT count(*) as county from Invoice WHERE invoice_id = "
              + item.get_invoice_id();
        System.out.println(" query : " + query3);
        try {
          conn.setQuery(query3);
          ResultSet results3 = conn.getResultSet();
          while (results3.next()) {
            System.out.println("PART LIC3 LOOPY : " + results3.getLong("county"));
          }
        } finally {
          conn.releaseResources();
        }
        item.store(conn);

        String query4 =
          "SELECT count(*) as county from Invoice WHERE invoice_id = "
              + item.get_invoice_id();
        logger.debug(" query : " + query4);
        try {
          conn.setQuery(query4);
          ResultSet results4 = conn.getResultSet();
          while (results4.next()) {
            logger.debug("PART LIC4 LOOPY : " + results4.getLong("county"));
          }
        } finally {
          conn.releaseResources();
        }
      }
    }
  }

  /**
   * Deletes any items removed from collection since it was created from the
   * database.
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws SQLException if a database error occurs
   */
  private void delete(DBconnection conn) throws SQLException {
    if (deleted != null && !deleted.isEmpty()) {
      for (TfcLineItem item : deleted) {
        item.delete(conn);
      }
    }

    // clear deleted items now that they're gone from the db
    deleted.clear();
  }

  /**
   * For unit testing only
   */
  public void test() {
    logger.debug("****** LineItemCollection content ******");
    if (!isEmpty()) {
      Iterator<TfcLineItem> iter = iterator();
      while (iter.hasNext()) {
        TfcLineItem item = iter.next();
        item.test();
      }
    }
    logger.debug("**** LineItemCollection content end ****");
  }
}
