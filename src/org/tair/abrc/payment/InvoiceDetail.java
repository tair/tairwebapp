// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.3 $
// $Date: 2005/11/04 23:18:32 $
// ------------------------------------------------------------------------------

package org.tair.abrc.payment;


import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcOrders;
import org.tair.tfc.TfcOrdersStock;
import org.tair.tfc.TfcStock;
import org.tair.utilities.DataConstants;
import org.tair.utilities.Debugger;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * InvoiceDetail is a composite object that contains information about an
 * invoice: it contains basic invoice attributes from TfcInvoice, ShippedNotPaid
 * lineItems, a list of CompositePayments, and order information from TfcOrders
 * 
 * 
 * 
 * 
 * 
 */

public class InvoiceDetail {

  private TfcInvoice invoice;
  private DBReadManager connectionPool;
  private ArrayList payments;
  private TfcOrders order;
  private LineItemCollection readyForPayment;
  private Map readyForPaymentStocks;
  private Map readyForPaymentOrdersStocks;

  private BigInteger organizationId;
  private BigInteger personId;

  /**
   * no arg constructor
   * 
   * @throws SQLException
   */
  public InvoiceDetail() throws SQLException {
  }

  /**
   * Creates an instance of InvoiceDetail that reflects the data referenced by
   * submitted orders_id
   * 
   * @param conn An active connection to the database
   * @param orders_id Invoice id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  public InvoiceDetail(Long ordersID) throws SQLException {
    DBconnection conn = null;
    if (ordersID != null) {
      try {
        conn = getConnection();

        // this method is used to get the invoice_id from passing in the
        // ordersID
        Long invoiceID = TfcInvoice.translateOrdersID(conn, ordersID);
        setInvoice(conn, invoiceID);
        setOrder(conn, getInvoice().get_orders_id());
        setOrganization();
        setPerson();
        setReadyForPaymentLineItems(conn);
        setPayments(conn);
        setReadyForPaymentStocks(conn);
        setReadyForPaymentOrdersStocks(conn);
      } finally {
        if (conn != null)
          returnConnection(conn);
      }
    }
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBReadManager.getInstance();
    return connectionPool.get_connection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    DBReadManager.return_connection(conn);
  }

  // instantiates a TfcInvoice object
  private void setInvoice(DBconnection conn, Long invoiceID)
      throws SQLException {
    invoice = new TfcInvoice(conn, invoiceID);
    if (invoice != null)
      System.out.println(" invoice ! = null ");
  }

  /**
   * returns an instance of TfcInvoice
   * 
   * @returns TfcInvoice
   */
  public TfcInvoice getInvoice() {
    return invoice;
  }

  // instantiates a TfcOrders object
  private void setOrder(DBconnection conn, Long orderID) throws SQLException {
    order = new TfcOrders(conn, orderID);
  }

  /**
   * returns an instance of TfcOrders for the invoice
   * 
   * @returns TfcOrders
   */
  public TfcOrders getOrder() {
    return order;
  }

  // instantiates a BsOrganization object and sets the organization id from
  // the
  /**
   * Sets the organization id from the associated order.
   */
  private void setOrganization() {
    organizationId = getOrder().get_organization_id();
  }

  /**
   * returns an instance of BsOrganization for the invoice
   * 
   * @return BsOrganization
   */
  public BsOrganization getOrganization() {
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    IPrimaryKey key =
      CommunityFactory.getOrganizationPrimaryKey(getOrder().get_organization_id());
    BsOrganization organization = delegate.getObject((SequencePrimaryKey)key);
    return organization;
  }

  /**
   * Sets the person id for the invoice from the person id in the associated
   * order.
   */
  private void setPerson() {
    personId = getOrder().get_person_id();
  }

  /**
   * Get the person associated with the invoice, if any
   * 
   * @return person or null
   */
  public BsPerson getPerson() {
    BsPerson person = null;
    if (personId != null) {
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(personId);
      person = delegate.getObject((SequencePrimaryKey)key);
    }
    return person;
  }

  // instantiates a line item collection with unpaid, shipped items
  /**
   * Create a collection of line items with unpaid, shipped items.
   * 
   * @param conn the JDBC connection wrapper
   * @throws SQLException when there is a database problem
   */
  private void setReadyForPaymentLineItems(DBconnection conn)
      throws SQLException {
    readyForPayment =
      new LineItemCollection(conn,
                             getInvoice().get_invoice_id(),
                             "shippedNotPaid");
  }

  // instantiates an ArrayList of CompositePayments
  private void setPayments(DBconnection conn) throws SQLException {
    CompositePayment payment = null;
    ArrayList ids = new ArrayList();
    payments = new ArrayList();
    StringBuffer query = new StringBuffer();
    query.append("SELECT DISTINCT payment_id AS id FROM LineItem ");
    query.append("WHERE payment_id is not NULL AND invoice_id = ");
    query.append(getInvoice().get_invoice_id());
    Debugger.println(Debugger.logMsg(this, "query = " + query));
    conn.setQuery(query.toString());
    ResultSet results = conn.getResultSet();
    while (results.next()) {
      ids.add(new Long(results.getLong("id")));
    }
    conn.releaseResources();
    Iterator iter = ids.iterator();
    while (iter.hasNext()) {
      payments.add(new CompositePayment(conn, (Long)iter.next()));
    }
  }

  /**
   * Returns an instance of LineItemCollection that contains shippedNotPaid
   * items including order charges if appropriate for the invoice
   * 
   * @returns LineItemCollection
   */
  public LineItemCollection getReadyForPayment() {
    return readyForPayment;
  }

  /**
   * Returns an instance of ArrayList that contians CompositePayment objects for
   * the invoice
   * 
   * @returns ArrayList
   * @see CompositePayment
   */
  public ArrayList getPayments() {
    return payments;
  }

  // populates a hashMap of TfcStocks that can be accessed via line item id
  private void setReadyForPaymentStocks(DBconnection conn) throws SQLException {
    TfcLineItem item = null;
    readyForPaymentStocks = new HashMap();
    Iterator iter = getReadyForPayment().iterator();
    if (iter != null) {
      while (iter.hasNext()) {
        item = (TfcLineItem)iter.next();
        if (item.get_type().equalsIgnoreCase(DataConstants.getStockChargeLineItem())) {
          readyForPaymentStocks.put(item.get_line_item_id(),
                                    new TfcStock(conn, item.get_stock_id()));
        }
      }
    }
  }

  // populates a hashMap of TfcOrdersStocks that can be accessed via
  // line item id
  private void setReadyForPaymentOrdersStocks(DBconnection conn)
      throws SQLException {
    TfcLineItem item = null;
    readyForPaymentOrdersStocks = new HashMap();
    Iterator iter = getReadyForPayment().iterator();
    if (iter != null) {
      while (iter.hasNext()) {
        item = (TfcLineItem)iter.next();
        if (item.get_type().equalsIgnoreCase(DataConstants.getStockChargeLineItem())) {
          readyForPaymentOrdersStocks.put(item.get_line_item_id(),
                                          new TfcOrdersStock(conn,
                                                             item.get_stock_id(),
                                                             item.get_orders_id()));
        }
      }
    }
  }

  /**
   * Returns an instance of TfcStock for the provided line item id used to get
   * stock name, etc for display
   * 
   * @returns TfcStock
   */
  public TfcStock getStock(Long lineItemID) {
    TfcStock stock = null;
    if (lineItemID != null) {
      if (readyForPaymentStocks != null) {
        stock = (TfcStock)readyForPaymentStocks.get(lineItemID);
      }
    }
    return stock;
  }

  /**
   * Returns an instance of TfcOrdersStock for the provided line item id used to
   * get unit charge and qty for display
   * 
   * @returns TfcOrdersStock
   */
  public TfcOrdersStock getOrdersStock(Long lineItemID) {
    TfcOrdersStock ordersStock = null;
    if (lineItemID != null) {
      ordersStock = (TfcOrdersStock)readyForPaymentOrdersStocks.get(lineItemID);
    }
    return ordersStock;
  }

}
