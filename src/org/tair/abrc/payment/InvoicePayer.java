// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.8 $
// $Date: 2006/03/03 20:56:55 $
// ------------------------------------------------------------------------------
package org.tair.abrc.payment;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.jboss.logging.Logger;
import org.tair.abrc.payment.creditcard.CreditCardController;
import org.tair.abrc.payment.creditcard.CreditCardReply;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcOrders;
import org.tair.tfc.TfcPayment;
import org.tair.utilities.InvalidActionException;


/**
 * InvoicePayer handles creating a payment object for the payment, updating the
 * associated line items for the payment and if necessary, invokes paymentech
 * module for credit card captures
 * 
 */

public class InvoicePayer {
  
  private static final Logger logger = Logger.getLogger(InvoicePayer.class);

  private Map<String, Object> params;
  private DBWriteManager connectionPool;
  private CompositeInvoice invoice;
  private String method;
  private Long invoiceID;
  private ArrayList<Long> itemIDs;
  private String reference;
  private java.util.Date checkDate;
  private String checkNumber;
  private String checkName;

  /**
   * Create a InvoicePayer object.
   */
  public InvoicePayer() {
  }

  /**
   * Pay an invoice based on input parameters.
   * 
   * @param params parameters for payment stored in Map
   * @exception SQLException thrown if a database error occurs.
   * @throws InvalidActionException when payment processing has a problem
   */
  public void pay(Map<String, Object> params) throws SQLException,
      InvalidActionException {
    setParams(params);
    try {
      processPayment();
    } catch (Exception e) {
      throw new InvalidActionException("pay(): " + e.getMessage(), e);
    }
  }

  // returns the selected payment method
  private String getMethod() {
    if (getParams().get("method") != null) {
      method = (String)getParams().get("method");
      if (method.equalsIgnoreCase("credit")) {
        // this will need to change so it can track online
        // vs manual credit card method
        // this should be changed in the jsp and passed
        // through the handler
        method = "online_credit_card";
      }
    }
    return method;
  }

  // returns the selected invoice id
  private Long getInvoiceID() {
    if (params.get("invoice_id") != null) {
      invoiceID = new Long((Integer)params.get("invoice_id"));
    }
    return invoiceID;
  }

  // returns the ArrayList of line item ids that are included in the payment
  /**
   * Returns the list of line item ids included in the payment
   * 
   * @return a list of line item ids
   */
  private List<Long> getItemIDs() {
    if (getParams().get("id_list") != null) {
      String idList = (String)getParams().get("id_list");
      itemIDs = new ArrayList<Long>();
      if (idList != null) {
        StringTokenizer st = new StringTokenizer(idList, ";");
        Long id = null;
        while (st.hasMoreTokens()) {
          id = new Long(st.nextToken());
          if (!itemIDs.contains(id)) {
            itemIDs.add(id);
          }
        }
      }
    }
    return itemIDs;
  }

  // returns the transaction reference id provided to record a credit card
  // payment that was done through the virual terminal
  private String getTxReference() {
    if (getParams().get("reference") != null) {
      reference = (String)getParams().get("reference");
    }
    return reference;
  }

  // returns the tfc invoice object that the payment will be applied to
  private CompositeInvoice getInvoice() {
    return invoice;
  }

  // returns the provided name on check
  private String getCheckName() {
    if (getParams().get("name_on_check") != null) {
      checkName = (String)getParams().get("name_on_check");
    }
    return checkName;
  }

  // returns the provided number on check
  private String getCheckNumber() {
    if (getParams().get("check_number") != null) {
      checkNumber = (String)getParams().get("check_number");
    }
    return checkNumber;
  }

  // returns the provided check date
  private java.util.Date getCheckDate() {
    if (getParams().get("check_date") != null) {
      checkDate = (java.util.Date)getParams().get("check_date");
    }
    return checkDate;
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBWriteManager.getInstance();
    return connectionPool.get_connection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    DBWriteManager.return_connection(conn);
  }

  // sets the parameters that user specified on search form
  private void setParams(Map<String, Object> params) {
    this.params = params;
  }

  // returns the map object of search parameters the user entered
  private Map<String, Object> getParams() {
    return params;
  }

  private void processPayment() throws Exception {
    DBconnection conn = null;

    try {
      conn = getConnection();
      conn.remove_auto_commit_mode();

      invoice = new CompositeInvoice(conn, getInvoiceID());
      
      if (invoice == null) {
        throw new Exception("Could not create composite invoice to process");
      }

      Iterator<Long> idIter = getItemIDs().iterator();
      TfcLineItem item = null;
      TfcPayment payment = null;
      float paymentTotal = 0;
      TfcOrders order = new TfcOrders(conn, getInvoice().get_orders_id());
      if (idIter != null) {
        while (idIter.hasNext()) {
          item = new TfcLineItem(conn, idIter.next());
          paymentTotal += item.get_amount().floatValue();
        }
      }
      payment = new TfcPayment();
      payment.set_type(getMethod());
      payment.set_amount(new Float(paymentTotal));
      payment.set_payment_date(new java.util.Date());
      if (getMethod().equalsIgnoreCase("check")) {
        payment.set_name_on_check(getCheckName());
        payment.set_check_number(getCheckNumber());
        payment.set_check_date(getCheckDate());
        payment.set_payment_ref_id(getInvoice().get_payment_ref_id());
      } else {

        // check to see if this is a credit card invoice and the payment is
        // a credit payment -- if so -- we need to do a capture
        // against paymentetch -- we need to reference the tx reference
        // number that we got when the charge was authorized
        if (getInvoice().get_payment_method().equalsIgnoreCase("credit_card")) {
          if (invoice.get_request_token() != null) {
            CreditCardReply reply =
              CreditCardController.captureOrderPayment(invoice,
                                                       order,
                                                       new Float(paymentTotal));
            payment.set_payment_ref_id(reply.getRequestID());
            payment.set_request_token(reply.getRequestToken());
          } else {
            // this is a paymentech thing
            // authorize payment - will throw exception if communications error
            // occurs while talking to remote service
            throw new Exception("ERROR: Trying to process order "
                                + order.get_order_number()
                                + " which uses Paymentech");

          }
        } else {
          // credit payment against a po invoice -- record the virtual terminal
          // ref id
          payment.set_payment_ref_id(getTxReference());
        }
      }
      // transaction handling here
      conn.remove_auto_commit_mode();
      payment.store(conn);
      // line item updates
      idIter = getItemIDs().iterator();
      if (idIter != null) {
        while (idIter.hasNext()) {
          item = new TfcLineItem(conn, (Long)idIter.next());
          item.set_status("paid");
          item.set_payment_id(payment.get_payment_id());
          item.store(conn);
        }
      }
      // if bal due on invoice = 0, update status to paid_in_full
      float calcBalDue = 0;
      calcBalDue = invoice.getBalanceDue().floatValue() - paymentTotal;
      TfcInvoice justInvoice = new TfcInvoice(conn, invoice.get_invoice_id());
      if (calcBalDue == 0) {
        // update status of invoice to paid_in_full
        justInvoice.set_status("paid_in_full");
        justInvoice.store(conn);

      }
      conn.commit();

      // end of transaction handling
      // rollback changes if any problems - propagate exception as
      // SQLException
    } catch (Exception e) {
      logger.error("Exception processing payment:" + e.getMessage(), e);
      conn.rollback();
      if (invoice != null && invoice.get_invoice_id() != null) {
      throw new Exception("(invoice " + invoice.get_invoice_id() + "): "
                          + e.getMessage(), e);
      } else {
        throw new Exception("(invoice with no id):" + e.getMessage(), e);
      }
    } finally {
      if (conn != null) {
        conn.set_auto_commit_mode();
        returnConnection(conn);
      }
    }
  }
}
