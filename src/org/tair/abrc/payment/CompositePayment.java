// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.payment;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcOrdersStock;
import org.tair.tfc.TfcPayment;
import org.tair.tfc.TfcStock;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;


/**
 * CompositePayment extends TfcPayment and contains
 * a LineItemCollection created with the provided payment id
 * 
 * CompositePayment also contains a Maps of Stock information for each of 
 * the stock types in the LineItemCollection 
 * 
 * CompositePayment also contains a Maps of OrdersStock information for 
 * each of the stock types in the LineItemCollection 
 */

public class CompositePayment extends TfcPayment {

  private LineItemCollection lineItems;
  private Map paidStocks;
  private Map paidOrdersStocks;

  /**
   * Creates an empty instance of CompositePayment
   *
   */
  public CompositePayment() {  
    super();
    lineItems = new LineItemCollection();
    paidStocks = new HashMap();
    paidOrdersStocks = new HashMap();
  }


  /** Creates an instance of CompositePayment that represents an existing 
   * payment in the database with submitted payment id 
   *
   * @param conn An active connection to the database
   * @param paymentID The payment_id of the payment to retrieve
   * @exception SQLException thrown if an error occurs while retrieving data.
   */
  public CompositePayment( DBconnection conn, Long paymentID ) throws SQLException {
    super( conn, paymentID );
    lineItems = new LineItemCollection( conn, paymentID, "payment" );
    setPaidStocks( conn );
    setPaidOrdersStocks( conn );
  }
  
  /**
   * Applies a payment amount towards the invoice referenced by supplied invoiceID.  If
   * the amount applied to the invoice exceeds the amount due on the invoice, 
   * <code>InvalidActionException</code> will be thrown. If no invoice with supplied
   * invoice ID is contained by this payment, payment application will fail silently.
   *
   * @param invoiceID ID of the invoice to apply the payment to
   * @param amount Amount of payment to apply to invoice
   * @exception InvalidActionException thrown if amount applied exceeds invoice total.
   */
  public final void applyPayment( Long invoiceID, Float amount ) 
  throws InvalidActionException {
  }

  /**
   * Determines if invoice has line items associated to it
   *
   * @return <code>true</code> if invoice has line items associated to it
   * or <code>false</code> if no line items associated with invoice
   */
  public boolean hasLineItems() {
    return ( lineItems != null && !lineItems.isEmpty() );
  }

  /**
   * Retrieves all line items for invoice
   *
   * @return Retrieves line items for invoice as an <code>Iterator</code> of
   * <code>TfcLineItem</code> objects or <code>null</code> if no line items
   * exist for invoice
   */
  public Iterator getLineItems() {
    return hasLineItems() ? lineItems.iterator() : null;
  }

/*
  /**
   * Retrieves line item representing a stock charge for stock with submitted
   * stock_id. This method should be always be used to get stock charge 
   * LineItem objects since there can be multiple line items with this type
   * for each order (unlike other line item types). All other line item types
   * can be retrieved using the getItemType method.
   * 
   *
   * @param stock_id Id of stock to retrieve line item charge for
   * @return TfcLineItem object representing charge for stock in order or
   * <code>null</code> if object not found
   */
  /*public TfcLineItem getStockItem( Long stock_id ) {
    return hasLineItems() ? 
        lineItems.getStockItem( stock_id, get_orders_id() ) : null;
  }*/


  /**
   * Determines if line item for stock has been paid or not.  This method
   * should always be used to get payment status of stock charge line 
   * items. All other line item types should use the lineItemPaid method.
   *
   * @param stock_id Stock id of stock to retrieve line item status for
   * @return <code>true</code> if line item for stock has been paid or
   * <code> if line item has not been paid, or if no line item for stock
   * is found in collection
   */
  /*public boolean stockItemPaid( Long stock_id ) {
    return hasLineItems() ? 
        lineItems.stockItemPaid( stock_id, get_orders_id() ) : false;
  }*/

  /**
   * Retrieves amount charged for stock charge line item for stock with 
   * submitted stock_id. This method should be always be used to get stock 
   * charge amounts since there can be multiple line items with this type
   * for each order (unlike other line item types). All other line item types
   * can be retrieved using the getLineItemCharge method.
   * 
   *
   * @param stock_id Id of stock to retrieve line item charge for
   * @return Amount charged for stock charge line item in order or zero if
   * stock not found in order
   */
  /*  public Float getStockCharge( Long stock_id ) {
    Float stockCharge = null;

    if ( hasLineItems() ) {
        stockCharge = lineItems.getStockCharge( stock_id, 
                            get_orders_id() );
    } else {
        stockCharge = new Float( 0 );
    }
    return stockCharge;
  }
*/
  /**
   * Determines if invoice contains any line item charges for stocks.  This is
   * useful since order can contain stocks without incurring a charge; in this
   * case, other charges such as order charge are waived as well.
   *
   * @return <code>true</code> if invoice has stock line item charges or 
   * <code>false</code> if invoice has no stock line item charges
   */
/*  public boolean hasStockCharges() {
    return hasLineItems() ? lineItems.hasStockCharges() : false;
  }
*/
  /**
   * Retrieves total of all stock charge line items for invoice.
   *
   * @return Total amount of all stock charge line items for invoice 
   * or zero if no stock charges in order
   */
/*  public Float getStockCharges() {
    return hasLineItems() ? lineItems.getStockCharges() : new Float( 0 );
  }
*/ 

  /**
   * Determines if all stock charge line items have been paid. This
   * will return true only if invoice contains stock charge line items
   * to begin with.  False will be returned if any stock charge line
   * items are unpaid or if invoice has no stock charge line items.
   *
   * @return <code>true</code> if all stock charge line items for invoice
   * have been paid; <code>false</code> if any stock charge line items
   * are unpaid or if invoice has no stock charge items.
   */
/*  public boolean stockItemsPaid() {
    return hasLineItems() ? lineItems.stockItemsPaid() : false;
  }
*/

  /**
   * Retrieves first line item found in collection with submitted type.  For
   * all LineItem.type values other than stock_charge, this method should 
   * return the desired LineItem object correctly. All requests for stock
   * charge items should be done through the getStockItem method, since
   * there may be multiple line items in the collection (one for each stock
   * in the order).
   *
   * @param type Line item type to retrieve
   * @return First line item found in invoice with submitted type or 
   * <code>null</code> if no line item found for that type
   */
/*  public TfcLineItem getItemType( String type ) {
    return hasLineItems() ? lineItems.getItemType( type ) : null;
  }
*/

  /**
   * Retrieves amount of line item charge for submitted line item type.
   * This method should not be used for stock charge line items;
   * getStockItemCharge should be used in this case
   *
   * @param type Line item type to retrieve charge amount for
   * @return Amount charged for submitted line item type or zero if
   * line item not found.
   */
/*  public Float getLineItemCharge( String type ) {
    return hasLineItems() ?
        lineItems.getLineItemCharge( type ) : new Float( 0 );
  }
*/

  /**
   * Determines if line item in collection with submitted type has
   * a paid status or not.  This method should be used to determine
   * paid status of all line item types other than stock charges.
   *
   * @param type Line item type to check status for
   * @return <code>true</code> if line item has been paid for or 
   * <code>false</code> if line item has not been paid for.
   */
/*  public boolean lineItemPaid( String type ) {
    return hasLineItems() ? lineItems.itemTypePaid( type ) : false;
  }
*/

  /**
   * Retrieves line item for order charge. This is simply a convenience
   * wrapper to getItemType.
   * 
   * @return Line item for order charge
   */
/*  public TfcLineItem getOrderChargeLineItem() {
    return getItemType( DataConstants.getOrderChargeLineItem() );
  }
*/



  /**
   * Returns amount of order charge line item. This is a convenience
   * wrapper to getLineItemCharge
   *
   * @return Amount of order charge line item
   */
/*  public Float getOrderCharge() {
    return getLineItemCharge( DataConstants.getOrderChargeLineItem() );
  }
*/

  /**
   * Determines if invoice contains an order charge line item
   *
   * @return <code>true</code> if invoice contains an order charge or
   * <code>false</code> if no order charge found
   */
/*  public boolean hasOrderCharge() {
    return ( getOrderCharge().floatValue() > 0 );
  }
*/

  /**
   * Determines if order charge line item has been paid. This is simply
   * a convenience wrapper to lineItemPaid
   *
   * @return <code>true</code> if order charge line item has been paid or
   * <code>false</code> if line item has not been paid or if no order
   * charge line item exists in collection
   */
/*  public boolean orderChargePaid() {
    return lineItemPaid( DataConstants.getOrderChargeLineItem() );
  }
*/

  /**
   * Retrieves line item for express shipping charge. This is simply a 
   * convenience wrapper to getItemType.
   * 
   * @return Line item for express shipping charge
   */
/*  public TfcLineItem getExpressShippingLineItem() {
    return getItemType( DataConstants.getExpressShippingLineItem() );
  }
*/


  /**
   * Returns amount of express shipping charge line item. This is a 
   * convenience wrapper to getLineItemCharge
   *
   * @return Amount of express shipping charge line item
   */
/*  public Float getExpressShippingCharge() {
    return getLineItemCharge( DataConstants.getExpressShippingLineItem() );
  }
*/
  /**
   * Determines if invoice contains an express shipping charge line item
   *
   * @return <code>true</code> if invoice contains an express shipping 
   * charge or <code>false</code> if no express shipping charge found
   */
/*  public boolean hasExpressShippingCharge() {
    return ( getExpressShippingCharge().floatValue() > 0 );
  }
*/

  /**
   * Determines if express shipping charge line item has been paid. This 
   * is simply a convenience wrapper to lineItemPaid
   *
   * @return <code>true</code> if express shipping charge line item has 
   * been paid or <code>false</code> if line item has not been paid or if 
   * no express shipping charge line item exists in collection
   */
/*  public boolean expressShippingChargePaid() {
    return lineItemPaid( DataConstants.getExpressShippingLineItem() );
  }
*/

  /**
   * Retrieves line item for phytosanitary charge. This is simply a 
   * convenience wrapper to getItemType.
   * 
   * @return Line item for phytosanitary charge
   */
/*  public TfcLineItem getPhytosanitaryLineItem() {
    return getItemType( DataConstants.getPhytosanitaryChargeLineItem() );
  }
*/

  /**
   * Determines if invoice contains a phytosanitary charge line item.
   *
   * <p>
   * @return <code>true</code> if invoice contains a phytosanitary charge 
   * or <code>false</code> if no order charge found
   */
/*  public boolean hasPhytosanitaryCharge( ) {
    boolean hasCharge = false;

    TfcLineItem item = getPhytosanitaryLineItem();
    if ( item != null ) {
        hasCharge = ( item.get_amount().floatValue() > 0 );
    }
    
    return hasCharge;
  }
*/

  /**
   * Returns amount of phytosanitary charge line item. This is a 
   * convenience wrapper to getLineItemCharge
   *
   * @return Amount of phytosanitary charge line item
   */
/*  public Float getPhytosanitaryCharge() {
    Float charge = 
        getLineItemCharge( DataConstants.getPhytosanitaryChargeLineItem() );

    return charge;
  }
*/
  /**
   * Determines if phytosanitary charge line item has been paid. This 
   * is simply a convenience wrapper to lineItemPaid
   *
   * @return <code>true</code> if phytosanitary charge line item has 
   * been paid or <code>false</code> if line item has not been paid or if 
   * no phytosanitary charge line item exists in collection
   */
/*  public boolean phytosanitaryChargePaid() {
    return lineItemPaid( DataConstants.getPhytosanitaryChargeLineItem() );
  }
*/
  /**
   * Adds submitted line item to invoice's collection of line items
   *
   * @param lineItem Line item to add to collection
   */
 /* public void addLineItem( TfcLineItem lineItem ) {
    if ( lineItems == null ) {
        lineItems = new LineItemCollection();
    }
    lineItems.add( lineItem );
  }
*/
  /**
   * Removes submitted line item from invoice's collection of line
   * items.
   * 
   * @param lineItem Line item to remove from collection
   */
/*  public void removeLineItem( TfcLineItem lineItem ) {
    lineItems.remove( lineItem );
  }
*/
  /**
   * Overrides superclass method to always calculate invoice total charges
   * from all existing line items.  Superclass method will return the current
   * value of the invoice_total member variable, as stored in the database.
   * Superclass value should always equal the full calculated value, but 
   * method is overridden here to avoid confusion as well as need to
   * worry about synchronizing invoice total values constantly during
   * invoice and order maintenance actions.
   *
   * @return Total of line item charges for invoice
   */
/*  public Float get_invoice_total() {
    return get_invoice_total( true );
  }
*/

  // populates a hashMap of TfcStocks that can be accessed via line item id
  private void setPaidStocks( DBconnection conn ) 
      throws SQLException {
      TfcLineItem item = null;
      paidStocks = new HashMap();
      Iterator iter = getLineItems();
      if ( iter != null ) {
      while ( iter.hasNext() ) {
          item = ( TfcLineItem )iter.next();
          if ( item.get_type().
                  equalsIgnoreCase
                      ( DataConstants.getStockChargeLineItem() ) ) {
               paidStocks.put
                  ( item.get_line_item_id(), 
                      new TfcStock( conn, item.get_stock_id() ) );
          }
      }
      }
  }
  // populates a hashMap of TfcOrdersStocks that can be accessed via 
  // line item id
  private void setPaidOrdersStocks( DBconnection conn ) 
      throws SQLException {
      TfcLineItem item = null;
      paidOrdersStocks = new HashMap();
      Iterator iter = getLineItems();
      if ( iter != null ) {
      while ( iter.hasNext() ) {
          item = ( TfcLineItem )iter.next();
          if ( item.get_type().
                  equalsIgnoreCase
                      ( DataConstants.getStockChargeLineItem() ) ) {
              paidOrdersStocks.put
                  ( item.get_line_item_id(), 
                      new TfcOrdersStock( conn, 
                          item.get_stock_id(),
                          item.get_orders_id() ) );
          }
      }
      }
  }
  /**
   * Returns an instance of TfcStock for the provided line item id 
   *  used to get stock name, etc for display
   * @returns TfcStock
   */
  public TfcStock getStock( Long lineItemID) {
      TfcStock stock = null;   
      if ( lineItemID != null ) {
          if ( paidStocks != null ) {
              stock = ( TfcStock )paidStocks.get( lineItemID ); 
          }
      }
      return stock;
  }
  
  /**
   * Returns an instance of TfcOrdersStock for the provided line item id 
   *  used to get unit charge and qty for display
   * @returns TfcOrdersStock
   */
  public TfcOrdersStock getOrdersStock( Long lineItemID) {
      TfcOrdersStock ordersStock = null;   
      if ( lineItemID != null ) {
          ordersStock = ( TfcOrdersStock )
              paidOrdersStocks.get( lineItemID );   
      }
      return ordersStock;
  }

  /**
   * For unit testing only 
   */
  public void test() {
    System.out.println( "------------" );
  }
}
