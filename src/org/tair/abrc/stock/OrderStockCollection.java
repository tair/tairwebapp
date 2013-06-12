// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.13 $
// $Date: 2005/08/24 22:37:09 $
// ------------------------------------------------------------------------------

package org.tair.abrc.stock;


import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;


/**
 * OrderStockCollection is a custom collection specifically for stock objects
 * created as part of the ABRC stock ordering tools. Stocks are stored as
 * <code>Stock</code> objects, which extend TfcStock to contain order specific
 * data on each stock
 * 
 * Implements Serializable so order session attributes can be serialized if
 * server is restarted
 */

public class OrderStockCollection implements Serializable, Iterable<Stock> {
  /**  */
  private static final long serialVersionUID = 1L;

  private ArrayList<Stock> stocks;

  // List of stocks that have been removed from order since collection
  // was created. Order for each stock in collection will be deleted
  // from the database the next time store is called
  private ArrayList<Stock> deleted;

  /**
   * Creates an empty instance of StockCollection
   */
  public OrderStockCollection() {
    stocks = new ArrayList<Stock>();
  }

  /**
   * Creates an instance of OrderStockCollection that has references to all
   * members of supplied OrderStockCollection.
   * 
   * @param submittedStocks the OrderStockcollection to copy
   */
  public OrderStockCollection(OrderStockCollection submittedStocks) {
    stocks = new ArrayList<Stock>();

    Iterator<Stock> iter = submittedStocks.iterator();
    while (iter.hasNext()) {
      stocks.add(iter.next());
    }
  }

  /**
   * Creates an instance of OrderStockCollection that contains all seed and dna
   * stocks for submitted order id
   * 
   * @param conn An active connection to the database
   * @param orders_id Order id to retrieve stocks for
   * @throws SQLException thrown if a database error occurs
   */
  public OrderStockCollection(DBconnection conn, Long orders_id)
      throws SQLException {

    stocks = new ArrayList<Stock>();
    populateStocks(conn, orders_id);
  }

  /**
   * Retrieve all stock ids for order from Orders_Stock linking table and create
   * Stock objects for each
   * 
   * @param conn An active connection to the database
   * @param orders_id Order id to retrieve stocks for
   * @throws SQLException
   */
  private void populateStocks(DBconnection conn, Long orders_id)
      throws SQLException {

    // only need stock id, but select other fields for sorting results
    // first by dna vs. seed, then alphanumerically by stock number
    String query =
      "SELECT s.stock_id, "
          + "s.name, "
          + "s.stock_number_prefix, "
          + "s.stock_number_suffix, "
          + "s.is_seed "
          + "FROM Orders_Stock os, Stock s "
          + "WHERE os.stock_id = s.stock_id "
          + "AND os.orders_id = ? "
          + "ORDER BY s.is_seed, "
          + "s.stock_number_prefix, "
          + "s.stock_number_suffix, "
          + "s.name ";

    ArrayList<Long> ids;
    try {
      conn.setQuery(query);
      conn.setQueryVariable(orders_id);

      ids = null;

      ResultSet results = conn.getResultSet();
      while (results.next()) {
        if (ids == null) {
          ids = new ArrayList<Long>();
        }
        ids.add(new Long(results.getLong("stock_id")));
      }
    } finally {
      conn.releaseResources();
    }

    if (ids != null && !ids.isEmpty()) {
      createStocks(conn, ids, orders_id);
    }
  }

  /**
   * Utility method to create Stock objects for collection of stock ids
   * 
   * @param conn
   * @param ids
   * @param orders_id
   * @throws SQLException
   */
  private void createStocks(DBconnection conn, ArrayList<Long> ids,
                            Long orders_id) throws SQLException {

    Stock stock = null;
    Long id = null;

    Iterator<Long> iter = ids.iterator();
    while (iter.hasNext()) {
      id = (Long)iter.next();
      stock = new Stock(conn, id, orders_id);
      addElement(stock);
    }
  }

  //
  // Standard collection wrappers
  //

  /**
   * Adds submitted stock to collection
   * 
   * @param stock Stock to add to collection
   */
  public void addElement(Stock stock) {
    stocks.add(stock);
  }

  /**
   * Determines if collection is empty or not
   * 
   * @return <code>true</code> if collection is empty or <code>false</code> if
   *         collection is not empty
   */
  public boolean isEmpty() {
    return stocks.isEmpty();
  }

  /**
   * Determines number of stocks in collection
   * 
   * @return number of stocks in collection
   */
  public int size() {
    return stocks.size();
  }

  /**
   * Determines if collection contains submitted stock
   * 
   * @param stock Stock to look for in collection
   * @return <code>true</code> if collection contains submitted stock or
   *         <code>false</code> if collection does not contains stock
   */
  public boolean contains(Stock stock) {
    return stocks.contains(stock);
  }

  /**
   * Retrieves all stocks in collection
   * 
   * @return All stocks in collection as an <code>Iterator</code> of
   *         <code>Stock</code> objects
   */
  public Iterator<Stock> iterator() {
    return stocks.iterator();
  }

  /**
   * Returns index of submitted stock in collection
   * 
   * @param stock Stock to find index of
   * @return index of stock in collection
   */
  public int indexOf(Stock stock) {
    return stocks.indexOf(stock);
  }

  /**
   * Retrieves stock at submitted index
   * 
   * @param index Index of stock to retrieve
   * @return Stock at submitted index
   */
  public Stock get(int index) {
    return (Stock)stocks.get(index);
  }

  /**
   * Removes stock from collection. Stock order will be deleted from the
   * database the next time store is called on the collection
   * 
   * @param stock Stock to remove from collection
   */
  public void remove(Stock stock) {
    stocks.remove(stock);

    if (deleted == null) {
      deleted = new ArrayList<Stock>();
    }
    deleted.add(stock);
  }

  /**
   * Retrieves a stock from inner collection by checking for stock that has
   * requested stock number.
   * 
   * @param stockNumber the stock number
   * 
   * @return Stock with requested stockNumber, or <code>null</code> if no stock
   *         is in collection that has stockNumber.
   */
  public Stock getStock(String stockNumber) {
    Stock returnStock = null;

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        if (stock.get_stock_number() != null
            && stock.get_stock_number().equals(stockNumber)) {
          returnStock = stock;
          break;
        }
      }
    }
    return returnStock;
  }

  /**
   * Retrieves a stock from inner collection by checking for stock that has
   * requested stock_id.
   * 
   * @param stock_id the unique identifier for a stock
   * 
   * @return Stock with requested stock_id, or <code>null</code> if no stock is
   *         in collection that has stock_id.
   */
  public Stock getStock(Long stock_id) {
    Stock returnStock = null;

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        if (stock_id.equals(stock.get_stock_id())) {
          returnStock = stock;
          break;
        }
      }
    }
    return returnStock;
  }

  /**
   * Retrieves extended price for stock with submitted stock id. This value is
   * calculated for stock by multiplying quantity ordered by base price of stock
   * item. This value should be the same as the LineItem charge for this stock,
   * or can be used for displaying price of stocks in orders that precede
   * payment functionality and do not have associated invoice/line item data.
   * 
   * @param stock_id Id of stock to get price for
   * @return Line item charge for stock or zero if stock not found in collection
   */
  public Float getLineItemCharge(Long stock_id) {
    Stock stock = getStock(stock_id);

    return stock.getLineItemCharge();
  }

  /**
   * Retrieves number of DNA and seed stocks in order. This method differs from
   * size() method in that in will only return the number of stocks in
   * collection whose status is not "inactive" (or cancelled).
   * 
   * @return Number of active DNA and seed stocks in order, or 0 if no active
   *         stocks in order
   */
  public int getStockCount() {
    int stockCount = 0;

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        if (!stock.inactive()) {
          stockCount += stock.get_quantity();
        }
      }
    }
    return stockCount;
  }

  /**
   * Retrieves number of active DNA stocks in order. Count will only include DNA
   * stocks in order whose status is not "inactive" (or cancelled).
   * 
   * @return Number of active DNA stocks in order, or 0 if no active DNA stocks
   *         in order
   */
  public int getDNAStockCount() {
    int stockCount = 0;

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = (Stock)iter.next();
        if (!stock.is_seed() && !stock.inactive()) {
          stockCount += stock.get_quantity();
        }
      }
    }
    return stockCount;
  }

  /**
   * Retrieves number of active seed stocks in order. Count will only include
   * seed stocks in order whose status is not "inactive" (or cancelled)
   * 
   * @return Number of active seed stocks in order, or 0 if no active seed
   *         stocks in order
   */
  public int getSeedStockCount() {
    int stockCount = 0;

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        if (stock.is_seed() && !stock.inactive()) {
          stockCount += stock.get_quantity();
        }
      }
    }
    return stockCount;
  }

  /**
   * Determines whether current order has DNA stocks associated with it or not
   * 
   * @return <code>true</code> if order has DNA stocks; <code>false</code> if
   *         order has no DNA stocks
   */
  public boolean hasDNAStock() {
    boolean hasDNA = false;

    if (!isEmpty()) {
      Stock stock = null;

      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        if (!stock.is_seed()) {
          hasDNA = true;
          break;
        }
      }
    }
    return hasDNA;
  }

  /**
   * Determines whether current order has seed stocks associated with it or not
   * 
   * @return <code>true</code> if order has seed stocks; <code>false</code> if
   *         order has no seed stocks
   */
  public boolean hasSeedStock() {
    boolean hasSeed = false;

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        if (stock.is_seed()) {
          hasSeed = true;
          break;
        }
      }
    }
    return hasSeed;
  }

  /**
   * Determines if collection contains any stocks whose status is NOT new. This
   * is useful for display purposes on confirmation page shown directly after
   * order is placed. If any stocks have been automatically sent to NASC, or are
   * now waiting for any MTA, a status column can be added to display for
   * showing those special statuses. This method allows that to be determined
   * before iterating through individual stocks.
   * 
   * @return <code>true</code> if collection contains stocks with any status
   *         besides new, or <code>false</code> if all stocks in collection are
   *         new.
   */
  public boolean hasOtherStatusStocks() {
    boolean hasOtherStatus = false;

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        if (!DataConstants.getNewStock().equals(stock.get_status())) {

          hasOtherStatus = true;
          break;
        }
      }
    }
    return hasOtherStatus;
  }

  /**
   * Determines if collection contains any fixed price stocks. A stock is
   * considered a fixed price stock if its fixed_price flag is set to true
   * 
   * @return <code>true</code> if collection contains any fixed price stocks;
   *         <code>false</code> if no fixed price stocks contained in order.
   */
  public boolean hasFixedPriceStocks() {
    boolean hasFixedPrice = false;

    if (!isEmpty()) {
      Iterator<Stock> iter = iterator();
      Stock stock = null;
      while (iter.hasNext()) {
        stock = iter.next();
        if (stock.get_fixed_price() != null
            && stock.get_fixed_price().booleanValue()) {
          hasFixedPrice = true;
          break;
        }
      }
    }

    return hasFixedPrice;
  }

  /**
   * Returns formatted <code>String</code> that contains the total charges for
   * all fixed price stocks in order in $US money format ($0.00). Calculation is
   * done by getTotalStockPrice(), but result is formatted here for easy
   * display.
   * 
   * @return Total stock charge for this order in $US format, or $0.00 if no
   *         stocks in order.
   */
  public String getFormatTotalStockPrice() {
    return TextConverter.floatToMoneyString(getTotalStockPrice());
  }

  /**
   * Calculates total price of all stocks in order. Any stock that has had its
   * charges waived will not be counted towards the total.
   * 
   * @return Total price of all stocks in order as a floating point value, or
   *         zero if no stocks in order.
   */
  public float getTotalStockPrice() {

    float total = 0;

    if (!isEmpty()) {

      Stock stock;
      float stockPrice;

      Iterator<Stock> iter = iterator();
      while (iter.hasNext()) {
        stock = iter.next();
        if (stock.get_waive_charge() == null
            && stock.get_stock_charge() != null) {

          stockPrice = stock.get_stock_charge().floatValue();
          stockPrice *= stock.get_quantity();
          total += stockPrice;
        }
      }
    }
    return total;
  }

  /**
   * Determines if any stocks in collection are completed. This information can
   * then be used to determine if order is completed.
   * 
   * @return <code>true</code> if all stocks in collection are completed, or
   *         <code>false</code> if all stocks in collection are not completed
   */
  public boolean stocksComplete() {
    boolean complete = true;
    Iterator<Stock> iter = null;
    Stock stock = null;

    if (!isEmpty()) {
      iter = iterator();
      while (iter.hasNext()) {
        stock = iter.next();
        if (!stock.completed()) {
          complete = false;
          break;
        }
      }
    }
    return complete;
  }

  /**
   * Determines if any stocks in order are in progress. This information can
   * then used to determine whether order is considered in progress. Method will
   * return <code>true</code> if any stocks in collection are in progress, back
   * ordered, waiting for an MTA or if some have been shipped while others are
   * new.
   * 
   * @return <code>true</code> if at least one stock in collection is in
   *         progress, or <code>false</code> if no stocks in order are in
   *         progress.
   */
  public boolean stocksInProgress() {
    boolean inProgress = false;
    Iterator<Stock> iter;
    Stock stock;

    // track if any stock in order has been shipped
    boolean otherShipped = false;

    if (!isEmpty()) {
      iter = iterator();
      while (iter.hasNext()) {
        stock = iter.next();
        if (stock.in_progress()
            || stock.back_ordered()
            || stock.waiting_for_MTA()
            || (stock.is_new() && otherShipped)) {

          inProgress = true;
          break;
        } else if (stock.shipped()) {
          otherShipped = true;
        }
      }
    }
    return inProgress;
  }

  /**
   * Determines if all stocks in collection have been set to "inactive"
   * 
   * @return <code>true</code> if all stocks in collection have status of
   *         "inactive", or <code>false</code> if all stocks are not inactive
   */
  public boolean stocksInactive() {
    Iterator<Stock> iter = null;
    boolean allInactive = true;
    Stock stock = null;

    if (!isEmpty()) {
      iter = iterator();
      while (iter.hasNext()) {
        stock = iter.next();
        if (!stock.inactive()) {
          allInactive = false;
          break;
        }
      }
    }
    return allInactive;
  }

  /**
   * Determines if any stocks in collection are shipped. This information can
   * then be used to determine if invoice status should be updated to
   * in_progress.
   * 
   * @return <code>true</code> if any stock in collection is shipped, or
   *         <code>false</code> if all stocks in collection are not shipped
   */
  public boolean stocksShipped() {
    boolean shipped = false;
    Iterator<Stock> iter = null;
    Stock stock = null;

    if (!isEmpty()) {
      iter = iterator();
      while (iter.hasNext()) {
        stock = iter.next();
        if (stock.shipped()) {
          shipped = true;
          break;
        }
      }
    }
    return shipped;
  }

  /**
   * Examines all stocks in collection and forwards all seed stocks in order to
   * NASC if lab uses NASC as seed center, or if stock record is flagged to send
   * that stock to NASC for fulfillment.
   * 
   * <p>
   * If lab uses NASC, stocks will be forwarded to NASC using the stock status
   * "forwarded_to_NASC", which means the stock will not be included in ABRC
   * user fee calculations.
   * 
   * <p>
   * If stock's NASC_request field = 'T', stock is forwarded to NASC for
   * fulfillment. Stock status will be 'forwarded_to_NASC' and stock will not be
   * eligible for ABRC user fee
   * 
   * <p>
   * If stock's NASC_request_fee field = 'T', stock is forwarded to NASC for
   * fulfillment. Stock status will be 'NASC_will_ship' and stock will be
   * eligible for ABRC user fee
   * 
   * @param organizationUsesNASC If <code>true</code> all seed stocks in
   *          collection will have their status set to "forwarded to NASC"; if
   *          <code>false</code>, individual stocks will be examined and
   *          forwarded to NASC according to rules above
   */
  public void setNASCDefaults(boolean organizationUsesNASC) {
    Iterator<Stock> iter = null;
    Stock stock = null;

    if (!isEmpty()) {
      iter = iterator();
      while (iter.hasNext()) {
        stock = iter.next();
        if (stock.is_seed()) {

          if (organizationUsesNASC) {
            stock.set_status(DataConstants.getNASCStock());
            stock.set_stock_charge(new Float(0));
          } else if (stock.get_NASC_request() != null
                     && stock.get_NASC_request().booleanValue()) {

            stock.set_status(DataConstants.getNASCStock());
            stock.set_stock_charge(new Float(0));
          } else if (stock.get_NASC_request_fee() != null
                     && stock.get_NASC_request_fee().booleanValue()) {
            stock.set_status(DataConstants.getNASCShipStock());
          }
        }
      }
    }
  }

  /**
   * If any stocks in order require an MTA signature before shipping, set status
   * to 'waiting_for_MTA' add additional check to see if the status is currently
   * "forwarded to NASC", if so do not update the status ( European users should
   * not require MTA_signature, if the order has been forwarded to NASC, they
   * will handle any requirements )
   */
  public void setMTAStatus() {
    Iterator<Stock> iter = null;
    Stock stock = null;

    if (!isEmpty()) {
      iter = iterator();
      while (iter.hasNext()) {
        stock = (Stock)iter.next();
        if (!stock.get_status().equalsIgnoreCase(DataConstants.getNASCStock())) {
          if (stock.get_MTA_signature() != null
              && stock.get_MTA_signature().booleanValue()) {
            stock.set_status(DataConstants.getMTAStock());
          }
        }
      }
    }
  }

  /**
   * Stores all stocks in collection to database; orders_id is used to ensure
   * that all stocks have order number correctly set before being stored.
   * Storing of stocks to the database is done locally without any transaction
   * control; database transaction handling should be implemented by client code
   * that calls this store() method to properly commit or rollback transactions.
   * 
   * <p>
   * As stocks are stored, method keeps track of various item status flags and
   * returns them in a collection where the property is stored as a string key
   * referencing a boolean value that determines if that property was set while
   * storing stocks. These flags are then used by CompositeOrder (who is
   * probably the only client to call this method) to send various emails to
   * users/curators/NASC curators informing them of stock and order status
   * changes. The keys returned in the messageFlags collection are:
   * 
   * <ul>
   * <li>downloaded - If referenced value is <code>true</code> one or more
   * stocks were just downloaded by ABRC curators and had their status set to
   * "in progress"</li>
   * <li>shipped - If referenced value is <code>true</code> one or more stocks
   * had their status set to "shipped"</li>
   * <li>NASC - If referenced value is <code>true</code> one or more stocks had
   * their status set to "forwarded to NASC"</li>
   * <li>NASC_ship - If referenced value is <code>true</code> one or more stocks
   * had their status set to "NASC will ship"</li>
   * <li>dateModified - java.util.Date value used for all stocks as
   * date_last_modified - needed for sending shipped/cancelled emails
   * </ul>
   * 
   * @param conn An active connection to the database
   * @param orders_id Orders id to store for all stocks in collection
   * @return Map of status flags generated by storing stocks
   * @throws InvalidActionException thrown if a stock cannot be stored due to
   *           missing or invalid data
   * @throws SQLException thrown if a database error occurs
   */

  public Map<String, Object> store(DBconnection conn, Long orders_id)
      throws InvalidActionException, SQLException {

    // hold flags to return to CompositeOrder for sending emails
    HashMap<String, Object> messages = null;

    // check if any stocks have been set to "in progress"
    boolean downloadedMsg = false;

    // check if any stocks have been shipped
    boolean shippedMsg = false;

    // check if any stocks have sent to NASC
    boolean nascMsg = false;

    // check if any stocks will be shipped by NASC
    boolean nascShipMsg = false;

    // save date batch of stocks was modified for use email msgs
    java.util.Date dateModified = null;

    // delete any stocks removed from collection since it was created
    delete(conn);

    Iterator<Stock> iter = stocks.iterator();
    if (iter != null) {
      Stock stock = null;
      while (iter.hasNext()) {
        stock = (Stock)iter.next();
        // make sure stock has current order number
        stock.set_orders_id(orders_id);
        stock.store(conn);

        if (stock.get_new_downloaded()) {
          downloadedMsg = true;
        } else if (stock.get_new_shipped()) {
          shippedMsg = true;
          // all stocks should have same date, save one for reference
          if (dateModified == null) {
            dateModified = stock.get_date_last_modified();
          }
        } else if (stock.get_new_NASC()) {
          nascMsg = true;
        } else if (stock.get_new_NASC_ship()) {
          nascShipMsg = true;
        }
      }
    }

    messages = new HashMap<String, Object>();
    messages.put("download", new Boolean(downloadedMsg));
    messages.put("shipped", new Boolean(shippedMsg));
    messages.put("NASC", new Boolean(nascMsg));
    messages.put("NASC_ship", new Boolean(nascShipMsg));
    messages.put("dateModified", dateModified);

    return messages;
  }

  /**
   * Stores all stocks in collection to the database. Stocks are stored without
   * any examination or modification of inner properties; no return value is
   * returned. Storing of stocks to the database is done locally without any
   * transaction control; database transaction handling should be implemented by
   * client code that calls this store() method to properly commit or rollback
   * transactions.
   * 
   * @param conn An active connection to the database
   * @throws InvalidActionException thrown if a stock cannot be stored due to
   *           missing or invalid data
   * @throws SQLException thrown if a database error occurs
   */
  public void store(DBconnection conn) throws InvalidActionException,
      SQLException {

    // delete any stocks removed from collection since it was created
    delete(conn);

    if (!isEmpty()) {
      Stock stock = null;
      for (Iterator<Stock> iter = iterator(); iter.hasNext();) {
        stock = iter.next();
        stock.store(conn);
      }
    }
  }

  /**
   * Deletes any stocks that have been removed from collection since it was
   * created. After deleting all stocks, deleted list is cleared.
   * 
   * @param conn An active connection to the database
   * @throws SQLException if a database error occurs
   */
  private void delete(DBconnection conn) throws SQLException {

    if (deleted != null) {
      Stock stock = null;
      for (Iterator<Stock> iter = deleted.iterator(); iter.hasNext();) {
        stock = iter.next();
        stock.delete(conn);
      }
      deleted.clear();
    }
  }

  /**
   * For unit testing only
   */
  public void test() {
    Iterator<Stock> iter = iterator();

    if (iter != null) {
      while (iter.hasNext()) {
        Stock tmp = iter.next();
        tmp.test();
      }
    }
  }
}
