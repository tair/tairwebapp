// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.22 $
// $Date: 2006/08/01 18:09:09 $
// ------------------------------------------------------------------------------

package org.tair.abrc;


import java.sql.SQLException;
import java.util.Iterator;

import org.jboss.logging.Logger;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsAffiliation;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLineItem;
import org.tair.utilities.Debugger;
import org.tair.utilities.EMail;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.WebApp;


/**
 * InvoiceEmailHandler contains functions for sending emails associated with
 * purchase order invoices. When a set of stocks is shipped the curator may
 * indicate that notifications should be sent out notifying the orderer that
 * payment is due for the newly set of shipped stocks. emails must be sent to
 * user who placed order, PI of user's lab (if different than user), and Seed or
 * DNA address at ABRC to ensure they are notified of request for payment. The
 * EMail class through which all mail is sent must check to be sure the mail is
 * authorized to be sent.
 */

public class InvoiceEmailHandler {
  private static final Logger logger =
    Logger.getLogger(InvoiceEmailHandler.class);

  private CompositeOrder order;
  private CompositeInvoice invoice;
  private DBWriteManager connectionPool;

  /**
   * Sends emails to user, PI of user's lab, and ABRC curator. ABRC addresses
   * are referenced through values in <code>WebApp</code>. Any orders that
   * include DNA stocks will send mail to "DNA_ADDRESS"; any orders that include
   * seed stocks will send mail to "SEED_ADDRESS". If an order is placed with an
   * invalid user or PI email address, code will mail ABRC regardless.
   * 
   * @param invoice CompositeInvoice
   * @see WebApp
   */
  // NOTE: instead of CompositeInvoice use TfcInvoice and custom
  // LineItemsCollection
  // also include local method for updating line item status
  public boolean sendRequestForPayment(Long invoice_id) throws SQLException,
      InvalidActionException {
    // only send user/PI mail if mail enabled for site
    DBconnection conn = null;
    boolean updated = false;
    try {
      conn = getConnection();
      setInvoice(conn, invoice_id);
      setOrder(conn, getInvoice().get_orders_id(), "send_payment_request");
      // send mail only for po invoices right now
      // by virtue of a filter used to create the composite
      // invoice the line items for the invoice will only
      // be shipped stocks, not already notified

      if (getInvoice().get_payment_method().equalsIgnoreCase("purchase_order")
          && getInvoice().hasLineItems()) {
        Debugger.println(Debugger.logMsg(this, "*** SEND PO MAIL *** "));
        sendPOUserEmail();
        updated = updateLineItems(conn);
      }

      else if (getInvoice().get_payment_method().equalsIgnoreCase("credit_card")
               && getInvoice().hasLineItems()) {
        Debugger.println(Debugger.logMsg(this, "*** SEND CC MAIL *** "));
        sendCCUserEmail();
        updated = updateLineItems(conn);
      }

    } finally {
      returnConnection(conn);
    }
    return updated;
  }

  /**
   * Sends past due request for payment emails to user, PI of user's lab, and
   * ABRC curator. ABRC addresses are referenced through values in
   * <code>WebApp</code>. Any orders that include DNA stocks will send mail to
   * "DNA_ADDRESS"; any orders that include seed stocks will send mail to
   * "SEED_ADDRESS". If an order is placed with an invalid user or PI email
   * address, code will mail ABRC regardless.
   * 
   * @param invoice CompositeInvoice
   * @see WebApp
   */

  public boolean sendPastDueRequestForPayment(Long invoice_id)
      throws SQLException, InvalidActionException {
    // only send user/PI mail if mail enabled for site
    DBconnection conn = null;
    boolean updated = false;
    try {
      conn = getConnection();
      // setInvoice( conn, invoice_id );
      setInvoiceforPastDue(conn, invoice_id);

      setOrder(conn, getInvoice().get_orders_id(), "send_payment_request");

      sendPastDueInvoiceEmail();

      updated = updateLineItems(conn);

    } finally {
      returnConnection(conn);
    }
    return updated;
  }

  /**
   * Create purchase order email text for user who placed order, including stock
   * info
   */
  private void sendPOUserEmail() {
    StringBuffer msg = new StringBuffer();

    msg.append("Dear Colleague,\n");
    msg.append("ABRC order #"
               + order.get_order_number()
               + " was shipped on "
               + TextConverter.dateToString(order.getInvoice().get_date_last_modified())
               + ".  "
               + "Payment is due when you receive your stocks. Total ABRC Charges: "
               + TextConverter.floatToMoneyString(order.getEligibleForPayment())
               + "."
               + "\n\n"
               + "Payment type: "
               + "Purchase Order/Other (PO# "
               + invoice.get_payment_ref_id()
               + ")"
               + "\n"
               + "Please print your invoice and submit it to your accounting department.  "
               + " They may send us payment by check or pay online by credit card at the link below. "
               + "We cannot accept electronic transfers to our bank."
               + "\n\n");

    msg.append("Invoice #: "
               + invoice.get_invoice_number()
               + " Print invoice at: "
               + WebApp.getServerURL()
               + "/servlets/Search?type=invoice&search_action=userdetail&mode=user&orders_id="
               + order.get_orders_id()
               + " or go to "
               + WebApp.getServerURL()
               + "/servlets/Search?type=invoice&search_action=userdetailform and enter the invoice number or the order number. "
               + "Login is required."
               + "\n\n");

    // this is to find any stocks that have been processed and shipped to
    // include in email message
    msg.append("Stock(s) Shipped:  " + "\n");

    appendUserStockInfo(order, msg, "shipped");

    // this is to find any stocks that are new (not shipped yet)
    // and to include in email message to be shipped separately
    // won't print message if no new stocks are found
    if (checkForNewStocks(order)) {
      msg.append("Stocks to be shipped separately:  ");
      msg.append("\n");
      appendUserStockInfo(order, msg, "new");
    }

    msg.append("\n");

    appendUserInfo(order, msg, true);

    msg.append("\n");

    msg.append("If you have any questions concerning your order, please contact "
               + "us at abrc@osu.edu."
               + "\n\n");

    send(order.get_person_email(), msg.toString(), "ABRC Payment Request");
  }

  /**
   * Create credit card email text for user who placed order, including stock
   * info
   */
  private void sendCCUserEmail() {
    StringBuffer msg = new StringBuffer();

    // only send user mail if mail enabled for site
    msg.append("Dear Colleague,\n");
    msg.append("ABRC order #"
               + order.get_order_number()
               + " was shipped on "
               + TextConverter.dateToString(order.getInvoice().get_date_last_modified())
               + ".  "
               + "Your credit card has been charged "
               + TextConverter.floatToMoneyString(order.getEligibleForPayment())
               + "."
               + "\n"
               + "\n");

    msg.append("Invoice#: "
               + invoice.get_invoice_number()
               + " Print paid invoice at: "
               + WebApp.getServerURL()
               + "/servlets/Search?type=invoice&search_action=userdetail&mode=user&orders_id="
               + order.get_orders_id()
               + "\n\n");

    // this is to find any stocks that have been processed and shipped to
    // include in email message
    msg.append("Stock(s) Shipped:  " + "\n");

    appendUserStockInfo(order, msg, "shipped");

    // this is to find any stocks that are new (not shipped yet)
    // and to include in email message to be shipped separately
    // won't print message if no new stocks are found
    if (checkForNewStocks(order)) {
      msg.append("Stocks to be shipped separately:  ");
      msg.append("\n");
      appendUserStockInfo(order, msg, "new");
    }
    msg.append("\n");

    appendUserInfo(order, msg, true);

    msg.append("\n");

    msg.append("If you have any questions concerning your order, please contact "
               + "us at abrc@osu.edu."
               + "\n\n");

    send(order.get_person_email(), msg.toString(), "ABRC Order Shipped");
  }

  /**
   * Create purchase order email text for user who placed order, including stock
   * info
   */
  private void sendPastDueInvoiceEmail() {
    StringBuffer msg = new StringBuffer();

    msg.append("Dear Colleague,\n\n");
    msg.append("The following invoice is past due.");

    msg.append("\n\n");

    msg.append("Invoice #: "
               + invoice.get_invoice_number()
               + ".  Total ABRC Charges: "
               + TextConverter.floatToMoneyString(order.getEligibleForPayment())
               + "."
               + "\n"
               + "Print invoice at:  "
               + WebApp.getServerURL()
               + "/servlets/Search?type=invoice&search_action=userdetail&mode=user&orders_id="
               + order.get_orders_id()
               + " or go to http://www.arabidopsis.org/servlets/Search?type=invoice&search_action=userdetailform "
               + "and enter the invoice number or the order number. Login is required."
               + "\n\n");

    msg.append("Please submit this invoice to your accounting department.  They may "
               + "send us payment by check or pay online by credit card at the link "
               + "above. We cannot accept electronic transfers to our bank.");

    msg.append("\n\n");

    msg.append("If you have any questions concerning your order, please contact "
               + "us at abrc@osu.edu."
               + "\n\n");

    send(order.get_person_email(), msg.toString(), "ABRC Invoice Past Due");
  }

  /**
   * Check to see if any stock order is not shipped (new) This is used for the
   * display or not of "Stocks to be shipped separately" line in email
   */
  private static boolean checkForNewStocks(CompositeOrder order) {
    boolean isNewStock = false;
    Stock stock = null;

    Iterator stockIter = order.getStocks();
    // check to see if any stock in order are new, not shipped.
    if (stockIter != null) {
      while (stockIter.hasNext()) {
        stock = (Stock)stockIter.next();

        if (stock.get_status().equals("new")) {
          isNewStock = true;
        }
      }
    }
    return isNewStock;
  }

  /**
   * Add stock information to order that is shipped or not shipped (new)
   */
  private static void appendUserStockInfo(CompositeOrder order,
                                          StringBuffer msg, String includeOnly) {
    Stock stock = null;
    boolean firstSeed = true;
    boolean firstDNA = true;

    StringBuffer seedStocks = null;
    StringBuffer dnaStocks = null;
    Iterator stockIter = order.getStocks();

    if (stockIter != null) {
      while (stockIter.hasNext()) {
        stock = (Stock)stockIter.next();

        // only put requested stocks into message
        if (includeOnly.equals("shipped")
            && stock.get_status().equals("shipped")
            || (includeOnly.equals("new") && stock.get_status().equals("new"))) {

          if (stock.is_seed()) {
            if (firstSeed) {
              seedStocks = new StringBuffer();
              firstSeed = false;
            } else {
              seedStocks.append(", ");
            }
            seedStocks.append(stock.get_stock_number());
          } else {
            if (firstDNA) {
              dnaStocks = new StringBuffer();
              firstDNA = false;
            } else {
              dnaStocks.append(", ");
            }
            dnaStocks.append(stock.get_stock_number());
          }
        }

      }
      if (seedStocks != null) {
        msg.append(seedStocks.toString() + "\n");
      }

      if (dnaStocks != null) {
        msg.append(dnaStocks.toString() + "\n");
      }

    }
  }

  /**
   * Add contact information for person who placed order; if order is being sent
   * to NASC for fulfillment, append extra contact info. not needed by ABRC
   */
  private static void appendUserInfo(CompositeOrder order, StringBuffer msg,
                                     boolean shipped) {

    if (shipped) {
      msg.append("Shipping Address:\n");
    } else {
      msg.append("The order will be shipped to:\n");
    }

    msg.append(order.get_person_first_name()
               + " "
               + order.get_person_last_name()
               + "\n");

    msg.append(TextConverter.dbToEmail(order.get_person_address()) + "\n");
    msg.append(order.get_person_city());

    if (order.get_person_state() != null) {
      msg.append(", " + order.get_person_state());
    }

    msg.append(" "
               + EmptyTextConverter.convert(order.get_person_postal_code())
               + "\n");

    msg.append(order.get_person_country() + "\n");

    msg.append("\n");

  }

  /**
   * Add contact information for lab person placed order as member of
   */
  public static void appendUserOrgInfo(CompositeOrder order, StringBuffer msg) {

    // msg.append( "\nAny fee for the order will be billed to:\n" );

    BsAffiliation[] pi = order.get_pi_affiliations();
    if (pi != null && pi.length > 0) {
      for (int i = 0; i < pi.length; i++) {
        msg.append(pi[i].getMember().getName());
        if (i < (pi.length - 1)) {
          msg.append(", ");
        }
      }
      msg.append("\n");
    }

    msg.append(order.get_organization_name() + "\n");
    msg.append(TextConverter.dbToEmail(order.get_organization_address()) + "\n");
    msg.append(order.get_organization_city());
    if (order.get_organization_state() != null) {
      msg.append(", " + order.get_organization_state());
    }
    msg.append(" "
               + EmptyTextConverter.convert(order.get_organization_postal_code())
               + "\n");
    msg.append(order.get_organization_country() + "\n");

  }

  /**
   * updates TfcLineItems to indicate that a notification was sent.
   * 
   * @param conn A connection with INSERT/UPDATE/DELETE privileges
   * @throws InvalidActionException if invoice or line items are in an invalid
   *           state for storing to the database
   * @throws SQLException if a database error occurs
   */
  private boolean updateLineItems(DBconnection conn)
      throws InvalidActionException, SQLException {

    boolean updated = false;
    java.util.Date today = new java.util.Date();
    Iterator iter = null;
    TfcLineItem item = null;
    iter = getInvoice().getLineItems();
    if (iter != null) {
      while (iter.hasNext()) {
        item = (TfcLineItem)iter.next();
        item.set_notified_date(today);
        item.store(conn);
        updated = true;
      }
    }
    return updated;
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBWriteManager.getInstance();
    return connectionPool.get_connection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    connectionPool.return_connection(conn);
  }

  // instantiates a CompositInvoice object
  private void setInvoice(DBconnection conn, Long invoiceID)
      throws SQLException {
    invoice = new CompositeInvoice(conn, invoiceID, "shippedNotNotified");
  }

  // instantiates a CompositInvoice object
  private void setInvoiceforPastDue(DBconnection conn, Long invoiceID)
      throws SQLException {
    invoice = new CompositeInvoice(conn, invoiceID, "shippedNotPaid");
  }

  // returns an instantiated CompositeInvoice object
  private CompositeInvoice getInvoice() {
    return invoice;
  }

  // instantiates a CompositeOrder object
  private void setOrder(DBconnection conn, Long orderID, String type)
      throws SQLException {
    order = new CompositeOrder(conn, orderID, type);
  }

  /**
   * Convenience method to send all mails through Email object
   */
  private static void send(String address, String msg, String subj) {
    try {
      if (address != null && msg != null) {
        logger.debug("Sending invoice email");
        EMail.send(WebApp.getProperty("MAIL_HOST"),
                   WebApp.getProperty("ABRC_FROM_ADDRESS"),
                   address,
                   subj,
                   msg);
      }
    } catch (Exception e) { // swallow mail exceptions - print to STDERR
      System.err.println("Could not send order email to: " + address);
      System.err.println("Message: " + msg);
      e.printStackTrace();
    }
  }

}
