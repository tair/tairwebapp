// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.75 $
// $Date: 2006/08/01 23:39:45 $
// ------------------------------------------------------------------------------

package org.tair.abrc;


import java.util.Date;
import java.util.Iterator;

import org.jboss.logging.Logger;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsAffiliation;
import org.tair.tfc.TfcStockNote;
import org.tair.utilities.DataConstants;
import org.tair.utilities.EMail;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.TextConverter;
import org.tair.utilities.WebApp;


/**
 * OrderEmailHandler contains functions for sending emails associated with stock
 * orders. When a stock order is placed, emails must be sent to user who placed
 * order, PI of user's lab (if different than user), and Seed or DNA address at
 * ABRC to ensure they are notified of new order. Emails are also sent to user
 * as stocks in order have their status upgraded to "in progress", "shipped".
 * "sent to NASC" etc.
 */

public class OrderEmailHandler {
  private static final Logger logger = 
    Logger.getLogger(OrderEmailHandler.class);

  /**
   * Sends emails to user who placed stock order, PI of user's lab, and ABRC
   * curator. ABRC addresses are referenced through values in
   * <code>WebApp</code>. Any orders that include DNA stocks will send
   * mail to "DNA_ADDRESS"; any orders that include seed stocks will send mail
   * to "SEED_ADDRESS". If an order is placed with an invalid user or PI email
   * address, code will mail ABRC regardless. If the user email and the PI
   * email are both the same, only the user email gets sent.
   * 
   * The EMail class through which the methods send mail must authorize the
   * email addresses for actually sending the mail.
   * 
   * @param order Order just placed that needs confirmation email sent
   * @see WebApp
   */
  public static void sendOrderConfirmation(CompositeOrder order) {
      sendUserEmail(order);
      String userEmail = order.get_person_email();
      String piEmail = order.get_organization_email();
      if (!userEmail.equalsIgnoreCase(piEmail)) {
        sendPIEmail(order);
      }
  }

  /**
   * Create email text for user who placed order, including address and stock
   * info
   */
  private static void sendUserEmail(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();
    msg.append("Dear Colleague,\n");
    msg
        .append("Thank you for ordering stocks from the Arabidopsis "
                + "Biological Resource Center (ABRC). If you have paid by credit card, "
                + "your card will be charged when your stocks are shipped.  For all other "
                + "payment types, you will receive a link to the invoice by email when your stocks "
                + "are shipped.");
    msg.append("\n\n");

    msg.append("ABRC Order Number:  " + order.get_order_number());

    msg.append("\n");

    appendUserOrderInfo(order, msg);

    msg.append("Stock(s) Ordered:\n");

    appendUserStockInfo(order, msg, "all");

    appendUserInfo(order, msg, true);

    msg.append("Complete Order Details at: ");
    msg.append("\n");
    msg
        .append(WebApp.getServerURL()
                + "/servlets/Order?state=search&search_action=detail&mode=user&orders_id="
                + order.get_orders_id() + "\n");

    addDisclaimer(msg);

    msg.append("\n\n");

    msg.append("If you have questions concerning your order, please "
               + "contact us at abrc@osu.edu ");

    logger.debug("Sending confirmation email for order " + order.get_order_number());
    send(order.get_person_email(), msg.toString(), "ABRC Stock Order " + 
         order.get_order_number() + " Placed");

  }

  /**
   * Send PI of lab who placed order a confirmation email with address and stock
   * info
   */
  private static void sendPIEmail(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();
    msg.append("Dear Colleague,\n");
    msg
        .append("A member of your laboratory has placed an order with "
                + "the Arabidopsis Biological Resource Center (ABRC).  If you have paid by credit card, "
                + "your card will be charged when your stocks are shipped.  For all other "
                + "payment types, you will receive a link to the invoice by email when your stocks "
                + "are shipped.");

    msg.append("\n\n");

    msg.append("ABRC Order Number:  " + order.get_order_number());

    msg.append("\n");

    appendUserOrderInfo(order, msg);

    msg.append("Stock(s) Ordered:\n");

    appendUserStockInfo(order, msg, "new");

    appendUserInfo(order, msg, true);

    msg.append("Complete Order Details at: ");
    msg.append("\n");
    msg
        .append(WebApp.getServerURL()
                + "/servlets/Order?state=search&search_action=detail&mode=user&orders_id="
                + order.get_orders_id() + "\n");

    addDisclaimer(msg);

    msg.append("\n\n");

    msg.append("If you have questions concerning your order, please "
               + "contact us at abrc@osu.edu ");

    // notify PIs
    String ordererEmail = order.get_person_email();
    String[] piAddresses = order.get_pi_email();
    if (piAddresses != null && piAddresses.length > 0) {
      String subject = "ABRC Stock Order Placed";
      for (int i = 0; i < piAddresses.length; i++) {
        if (!ordererEmail.equals(piAddresses[i])) {
          send(piAddresses[i], msg.toString(), subject);
        }
      }
    }

  }

  /**
   * Send PI of lab who placed order a confirmation email with address and stock
   * info
   */
  public static void sendNASCPIEmail(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();
    msg.append("Dear Colleague,\n");

    if (order.hasDNAStock() && order.hasSeedStock()) {
      msg
          .append("A member of your laboratory has placed an order.  "
                  + "ABRC will ship the DNA stocks and collect payment.  "
                  + "If you have paid by credit card, your card will be charged when your stocks "
                  + "are shipped.  For all other payment types, you will receive an invoice by email "
                  + "when your stocks are shipped.  Since you are located in Europe, the Nottingham "
                  + "Arabidopsis Stock Centre (NASC) will ship the seed stocks and collect payment.");

      msg.append("\n\n");
    }
    if (order.hasSeedStock() && !order.hasDNAStock()) {
      msg
          .append("A member of your laboratory has placed an order. Since your lab is in Europe, "
                  + "the Nottingham Arabidopsis Stock Centre (NASC) will ship the order and collect payment.");
      msg.append("\n\n");
    }
    if (order.hasDNAStock() && !order.hasSeedStock()) {
      msg
          .append("A member of your laboratory has placed an order with the Arabidopsis Biological Resource Center (ABRC). "
                  + "If you have paid by credit card, your card will be charged when your stocks "
                  + "are shipped.  For all other payment types, you will receive an invoice by email "
                  + "when your stocks are shipped.  ");
      msg.append("\n\n");
    }

    msg.append("ABRC Order Number:  " + order.get_order_number());

    msg.append("\n\n");

    appendUserOrderInfo(order, msg);

    msg.append("Stock Ordered:\n");

    appendUserStockInfo(order, msg, "all");

    appendUserInfo(order, msg, true);

    msg.append("Complete Order Details at: ");
    msg.append("\n\n");
    msg
        .append(WebApp.getServerURL()
                + "/servlets/Order?state=search&search_action=detail&mode=user&orders_id="
                + order.get_orders_id() + "\n");

    if (order.hasDNAStock()) {
      addDisclaimer(msg);
    }
    msg.append("\n\n");

    msg.append("If you have questions concerning your order, please "
               + "contact us at abrc@osu.edu ");

    msg.append("\n\n");

    // notify PIs
    String ordererEmail = order.get_person_email();
    String[] piAddresses = order.get_pi_email();
    if (piAddresses != null && piAddresses.length > 0) {
      String subject = "ABRC Stock Order Placed";
      for (int i = 0; i < piAddresses.length; i++) {
        if (!ordererEmail.equals(piAddresses[i])) {
          send(piAddresses[i], msg.toString(), subject);
        }
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

    msg.append(order.get_person_first_name() + " "
               + order.get_person_last_name() + "\n");

    msg.append(TextConverter.dbToEmail(order.get_person_address()) + "\n");
    msg.append(order.get_person_city());

    if (order.get_person_state() != null) {
      msg.append(", " + order.get_person_state());
    }

    msg.append(" " + EmptyTextConverter.convert(order.get_person_postal_code())
               + "\n");

    msg.append(order.get_person_country() + "\n");

    msg.append("\n");

  }

  /**
   * Add contact information for lab person placed order as member of
   */
  public static void appendUserOrgInfo(CompositeOrder order, StringBuffer msg) {

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
    msg
        .append(TextConverter.dbToEmail(order.get_organization_address())
                + "\n");
    msg.append(order.get_organization_city());
    if (order.get_organization_state() != null) {
      msg.append(", " + order.get_organization_state());
    }
    msg.append(" "
               + EmptyTextConverter.convert(order
                   .get_organization_postal_code()) + "\n");
    msg.append(order.get_organization_country() + "\n");

  }

  /**
   * Add miscellaneous information for order
   */
  private static void appendUserOrderInfo(CompositeOrder order, StringBuffer msg) {

    // msg.append( "Order Number: " + order.get_order_number() + "\n" );
    msg.append("Order Date: "
               + TextConverter.dateToString(order.get_order_date()) + "\n");

    // displays the payment type, i.e, po or online_credit_card, or
    // non-charged
    if (order.hasInvoice() && order.hasOrderCharge()) {
      CompositeInvoice invoice = order.getInvoice();
      if (invoice.get_payment_method()
          .equals(DataConstants.getPurchaseOrderPaymentMethod())
          && invoice.get_payment_ref_id() != null) {
        msg.append("Payment type:  " + invoice.get_payment_method() + " (PO# "
                   + invoice.get_payment_ref_id() + ")");
        msg.append("\n");
      } else {
        msg.append("Payment type:  " + invoice.get_payment_method());
        msg.append("\n");
      }
    } else {
      msg.append("Payment type: non-charged");
      msg.append("\n");
    }

    // calculate order charge
    if (order.hasOrderCharge()) {
      msg.append("Total ABRC Charges:  "
                 + TextConverter.floatToMoneyString(order.getTotalCharges()));
      msg.append("\n");
    }

    if (order.get_orderer_comments() != null) {
      msg
          .append("comments: "
                  + TextConverter.dbToEmail(order.get_orderer_comments())
                  + "\n");
    }
  }

  /**
   * Create list of stocks for user emails
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
        if (includeOnly.equals("all")
            || (includeOnly.equals("in progress") && stock.get_new_downloaded())
            || (includeOnly.equals("shipped") && stock.get_new_shipped())
            || (includeOnly.equals("NASC_forwarded") && stock.get_new_NASC())
            || (includeOnly.equals("NASC_ship") && stock.get_new_NASC_ship())
            || (includeOnly.equals("new") && stock.is_new() || (includeOnly
                .equals("backordered") && stock.back_ordered()))) {

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
      msg.append("\n");

    }

  }

  private static void appendUserStockInfoforNASC(CompositeOrder order,
                                                 StringBuffer msg) {
    Stock stock = null;
    boolean firstSeed = true;
    boolean firstDNA = true;
    boolean commercial =
        (order.get_organization_commercial() != null && order
            .get_organization_commercial().booleanValue());

    StringBuffer seedStocks = null;
    StringBuffer dnaStocks = null;
    Iterator stockIter = order.getStocks();

    if (stockIter != null) {
      while (stockIter.hasNext()) {
        stock = (Stock)stockIter.next();

        // only put requested stocks into message
        if (stock.is_seed()) {
          if (firstSeed) {
            seedStocks = new StringBuffer();
            seedStocks.append("\n---Seed Stocks---\n");
            firstSeed = false;
          } else {
            seedStocks.append(", ");
          }
          seedStocks.append(stock.get_stock_number());
          appendStockPrice(commercial, stock, seedStocks);
        } else {
          if (firstDNA) {
            dnaStocks = new StringBuffer();
            dnaStocks.append("\n---DNA Stocks----\n");
            firstDNA = false;
          } else {
            dnaStocks.append(", ");
          }
          dnaStocks.append(stock.get_stock_number());
          appendStockPrice(commercial, stock, dnaStocks);
        }
      }
    }
    if (seedStocks != null) {
      msg.append(seedStocks.toString() + "\n");
      msg.append("Total seed stocks: " + order.getSeedStockCount() + "\n");
      if (dnaStocks != null) {
        msg.append("\n");
      }
    }

    if (dnaStocks != null) {
      msg.append(dnaStocks.toString() + "\n");
      msg.append("Total DNA stocks: " + order.getDNAStockCount() + "\n");
    }

    // append ABRC public comments immediately after stocks on all emails
    if (order.get_ABRC_public_comments() != null) {
      msg.append("\nABRC comments: " + order.get_ABRC_public_comments());
    }
  }

  /**
   * Add stock price if stock is a fixed price stock
   */
  private static void appendStockPrice(boolean commercial, Stock stock,
                                       StringBuffer msg) {
    if (stock.get_calculated_stock_charge() != null) {
      msg.append(" ($" + stock.get_calculated_stock_charge() + ")");
    }
  }

  /**
   * /** Sends email to user who placed stock order notifying them that one or
   * more stocks in their order have been downloaded by ABRC and have had their
   * status upgraded to "in progress". If sending email fails for any reason
   * (such as invalid email address), error is printed to STDERR and ignored.
   * 
   * @param order Stock order to send message for
   * @see WebApp
   */
  public static void sendInProgressUpdate(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();

      msg.append("Dear Colleague,\n\n");
      msg.append("Thank you for ordering stocks from the Arabidopsis "
                 + "Biological Resource Center (ABRC). "
                 + "The following stocks from order# "
                 + order.get_order_number() + " are being processed:\n\n");

      appendUserStockInfo(order, msg, "in progress");

      msg.append("\n\nYou will receive another update when stocks "
                 + "are shipped.\n\n");

      appendUserInfo(order, msg, false);

      msg.append("\n");

      appendUserOrgInfo(order, msg);

      msg.append("\nYou can check the progress of this and other orders "
                 + "you have placed on the TAIR website at "
                 + WebApp.getServerURL()
                 + "/servlets/Order?state=search&mode=user\n\n");

      msg.append("If you have questions concerning your order, "
                 + "please contact us at abrc@osu.edu\n\n");

      msg.append("Please note that your lab will be responsible for any "
                 + "charges associated with this order.  You can read about "
                 + "our fee structure at "
                 + WebApp.getServerURL()
                 + "/abrc/fees.html\n\n");

      msg.append("Stocks are usually shipped within one week of being "
                 + "downloaded for processing. If you did not request express "
                 + "shipping, your order will be shipped by US mail. "
                 + "Delivery times vary from 1 to 2 weeks within the US "
                 + "and from 2 to 6 weeks outside the US.\n");

      send(order.get_person_email(), msg.toString(), "ABRC Stock Order Updated");
  }

  /**
   * Sends email to user who placed stock order notifying them that one or more
   * stocks in their order have been shipped. If sending email fails for any
   * reason (such as invalid email address), error is printed to STDERR and
   * ignored.
   * 
   * <p>
   * @param order Stock order to send message for
   * @see WebApp
   */
  public static void sendShippedUpdate(CompositeOrder order,
                                       java.util.Date shipDate) {
    StringBuffer msg = new StringBuffer();

      msg.append("Dear Colleague,\n\n");
      msg.append("Thank you for ordering stocks from the Arabidopsis "
                 + "Biological Resource Center (ABRC). "
                 + "Stocks from order # " + order.get_order_number() + " "
                 + "have been shipped.  This is your invoice. "
                 + "Please submit this to your purchasing department and "
                 + "request that they send us payment by check or credit card"
                 + "\n\n");

      msg
          .append("You can view your invoice on the TAIR web site at: "
                  + WebApp.getServerURL()
                  + "/servlets/Order?state=search&search_action=detail&mode=user&orders_id="
                  + order.get_orders_id() + "\n\n");

      msg
          .append("If you have any questions concerning your order, please contact "
                  + "us at abrc@osu.edu." + "\n\n");

      msg.append("This shipment:  ");

      appendUserStockInfo(order, msg, "shipped");

      msg.append("\n");

      // displays the payment type, i.e, po or online_credit_card
      if (order.hasInvoice()) {
        CompositeInvoice invoice = order.getInvoice();
        if (invoice.get_payment_method()
            .equals(DataConstants.getPurchaseOrderPaymentMethod())
            && invoice.get_payment_ref_id() != null) {
          msg.append("Payment type:  " + invoice.get_payment_method()
                     + " ( PO# " + invoice.get_payment_ref_id() + ")");
        } else {
          msg.append("Payment type:  " + invoice.get_payment_method());
        }

      }

      send(order.get_person_email(), msg.toString(), "ABRC Stock Order Shipped");
  }

  /**
   * Sends email to non-charged user who placed stock order notifying them that
   * one or more stocks in their order have been shipped. If sending email fails
   * for any reason (such as invalid email address), error is printed to STDERR
   * and ignored.
   * 
   * @param order Stock order to send message for
   * @see WebApp
   */
  public static void sendWaivedUpdate(CompositeOrder order,
                                      java.util.Date shipDate) {
    StringBuffer msg = new StringBuffer();

      msg.append("Dear Colleague,\n");
      msg.append("ABRC order # " + order.get_order_number()
                 + " was shipped on " + TextConverter.dateToString(shipDate)
                 + ".  There is no charge.\n\n");

      msg.append("Stock(s) Shipped:\n");

      appendUserStockInfo(order, msg, "shipped");

      // this is to find any stocks that are new (not shipped yet)
      // and to include in email message to be shipped separately
      // won't print message if no new stocks are found
      if (checkForNewStocks(order)) {
        msg.append("Stocks to be shipped separately:\n");
        appendUserStockInfo(order, msg, "new");
      }

      msg.append("\n");

      msg.append("Shipping Address: ");

      msg.append("\n");

      appendUserInfo(order, msg, true);

      msg.append("\n\n");

      msg
          .append("If you have any questions concerning your order, please contact "
                  + "us at abrc@osu.edu." + "\n\n");

      send(order.get_person_email(), msg.toString(), "ABRC Order Shipped");
  }

  /**
   * Sends email to user who placed stock order notifying them that one or more
   * stocks in their order have been sent to NASC for fulfillment. If sending
   * email fails for any reason (such as invalid email address), error is
   * printed to STDERR and ignored. A copy of user's email is also sent to NASC
   * using the address stored in the NASC_ADDRESS property of WebApp.
   * 
   * <p>
   * Stocks may be sent to NASC in two cases - one where the forwarded stocks
   * will not qualify for an ABRC user fee, and one where the stocks will
   * qualify for a fee. These two different cases are represented by different
   * stock statuses. The NASCship flag will specify which case this method is
   * being called to send mail for - this is needed for determining which stock
   * status should isolated for sending mail.
   * 
   * @param order Stock order to send message for
   * @param NASCship If <code>true</code>, email will include details on
   *          stocks that are sent to NASC that will still qualify for an ABRC
   *          user fee (stock status = NASC_will_ship); if <code>false</code>,
   *          email will include details on stocks that are forwarded to NASC
   *          and will not qualify for ABRC user fee (status =
   *          forwarded_to_NASC)
   * @see WebApp
   */
  public static void sendNASCUpdate(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();

      msg.append("Dear Colleague,\n");
      if (order.hasDNAStock() && order.hasSeedStock()) {
        msg
            .append("Thank you for ordering stocks from the Arabidopsis Biological Resource "
                    + "Center(ABRC).  ABRC will ship the DNA stocks and collect payment.  "
                    + "If you have paid by credit card, your card will be charged when your stocks "
                    + "are shipped.  For all other payment types, you will receive an invoice by email "
                    + "when your stocks are shipped.  Since you are located in Europe, the Nottingham "
                    + "Arabidopsis Stock Centre (NASC) will ship the seed stocks and collect payment.");

        msg.append("\n\n");
      }
      if (order.hasSeedStock() && !order.hasDNAStock()) {
        msg
            .append("Thank you for your order. Since your lab is in Europe, "
                    + "the Nottingham Arabidopsis Stock Centre (NASC) will ship the order and collect payment.");
        msg.append("\n\n");
      }

      msg.append("ABRC Order Number:  " + order.get_order_number());

      msg.append("\n\n");

      appendUserOrderInfo(order, msg);

      msg.append("Stock Ordered:\n");

      appendUserStockInfo(order, msg, "all");

      appendUserInfo(order, msg, true);

    if (order.hasDNAStock()) {
      msg.append("Complete Order Details at: ");
      msg.append("\n\n");
      msg
          .append(WebApp.getServerURL()
                  + "/servlets/Order?state=search&search_action=detail&mode=user&orders_id="
                  + order.get_orders_id() + "\n");

      addDisclaimer(msg);

      msg.append("\n\n");

      msg
          .append("If you have questions concerning your DNA stock order, please "
                  + "contact us at abrc@osu.edu ");

      msg.append("\n\n");
    }

    if (order.hasSeedStock()) {

      msg
          .append("If you have questions concerning your seed stock order, please "
                  + "contact NASC at orders@arabidopsis.org ");
    }

    send(order.get_person_email(), msg.toString(), "ABRC Stock Order Placed");

    // call NASC method to send to NASC
    sendUpdatetoNASC(order);

  }

  /**
   * Sends email to user who placed stock order notifying them that one or more
   * stocks in their order have been sent to NASC for fulfillment. If sending
   * email fails for any reason (such as invalid email address), error is
   * printed to STDERR and ignored. A copy of user's email is also sent to NASC
   * using the address stored in the NASC_ADDRESS property of WebApp.
   * 
   * <p>
   * Stocks may be sent to NASC in two cases - one where the forwarded stocks
   * will not qualify for an ABRC user fee, and one where the stocks will
   * qualify for a fee. These two different cases are represented by different
   * stock statuses. The NASCship flag will specify which case this method is
   * being called to send mail for - this is needed for determining which stock
   * status should isolated for sending mail.
   * 
   * @param order Stock order to send message for
   * @param NASCship If <code>true</code>, email will include details on
   *          stocks that are sent to NASC that will still qualify for an ABRC
   *          user fee (stock status = NASC_will_ship); if <code>false</code>,
   *          email will include details on stocks that are forwarded to NASC
   *          and will not qualify for ABRC user fee (status =
   *          forwarded_to_NASC)
   * @see WebApp
   */
  public static void sendUpdatetoNASC(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();

      msg.append("Dear Colleague,\n\n");
      msg.append("Thank you for ordering stocks from the Arabidopsis "
                 + "Biological Resource Center (ABRC). The following "
                 + "stocks from order# " + order.get_order_number()
                 + " have been forwarded to the Nottingham Arabidopsis "
                 + "Stock Centre (NASC) for shipment.\n\n");

      appendUserStockInfoforNASC(order, msg);
      msg.append("\n");

      appendUserInfo(order, msg, false);
      msg.append("\n");

      msg.append("Phone #: " + order.get_person_phone() + "\n");
      msg.append("Fax #: " + order.get_person_fax() + "\n");
      msg.append("Email: " + order.get_person_email() + "\n");

      msg.append("\nAny fee for the order will be billed to:\n");

      appendUserOrgInfo(order, msg);

      msg.append("\nYou can check the progress of this and other orders "
                 + "you have placed on the TAIR website at " + "http://"
                 + WebApp.getServerURL()
                 + "/servlets/Order?state=search&mode=user\n\n");

      msg.append("If you have questions concerning your order, please "
                 + "contact us at abrc@osu.edu\n\n");

      msg.append("Please note that your lab will be responsible for "
                 + "any charges associated with this order.  You can "
                 + "read about our fee structure at " + "http://"
                 + WebApp.getServerURL()
                 + "/abrc/fees.html\n\n");

      // only send to NASC
      send(WebApp.getProperty("NASC_ADDRESS"), msg.toString(),
           "ABRC Stock Order Updated -- Order # " + order.get_order_number());
  }

  /**
   * Sends email to user notifying them that their order was cancelled by either
   * user or curator. If sending email fails for any reason (such as invalid
   * email address), error is printed to STDERR and ignored.
   * 
   * @param order Stock order to send message for
   */
  public static void sendCancelledMsg(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();

      msg.append("Dear Colleague,\n\n");
      msg.append("An item from ABRC order # " + order.get_order_number()
                 + " has been cancelled." + "\n\n");

      msg.append("Stock(s) cancelled:");

      appendUserStockInfo(order, msg, "all");

      msg.append("\n\nIf you have questions concerning your order, please "
                 + "contact us at abrc@osu.edu\n\n");

      send(order.get_person_email(), msg.toString(),
           "ABRC Stock Order Cancelled");
  }

  /**
   * Get a new StringBuffer initialized with the first part of a stock note.
   * 
   * @param orderNumber the text order number for the order needing a note
   * @return a StringBuffer containing salutation and introduction to a stock
   *         note
   */
  public static StringBuffer getStockNoteMessage(Long orderNumber) {
    StringBuffer msg = new StringBuffer();

    msg.append("Dear Colleague\n\n");
    msg.append("There are special notes associated to stocks in your order ");
    msg.append(orderNumber);
    msg.append(". Please note:\n\n");

    return msg;
  }

  /**
   * Sends special stock note/MTA release form associated with stock to person
   * who placed order and lab PI(s). One email will be sent for each stock note
   * associated to stock.
   * 
   * @param order Stock order stock appears in
   * @param stock Stock to send stock note email(s) for
   */
  public static void sendStockNote(CompositeOrder order, Stock stock) {
    StringBuffer msg = new StringBuffer();

    // should never be false here, but check just in case
    if (stock.hasPopulatedStockNotes()) {

      msg.append("Dear Colleague\n\n");
      msg.append("Stock number " + stock.get_name() + " included in "
                 + "your order # " + order.get_order_number() + " has a "
                 + "special note associated to it. Please note:\n\n");

      // for each note associated to stock, send one message to
      // orderer & PIs
      String ordererEmail = order.get_person_email();
      String[] piAddresses = order.get_pi_email();
      String subject = "ABRC Stock Order Special Note";
      Iterator iter = stock.getStockNotes();
      while (iter.hasNext()) {
        TfcStockNote stockNote = (TfcStockNote)iter.next();
        String fullMsg = msg.toString() +
        // convert \ to \n
                         TextConverter.dbToText(stockNote.get_note());

        send(ordererEmail, fullMsg, subject);
        if (piAddresses != null && piAddresses.length > 0) {
          for (int i = 0; i < piAddresses.length; i++) {
            if (!ordererEmail.equals(piAddresses[i])) {
              send(piAddresses[i], fullMsg, subject);
            }
          }
        }
      }
    }
  }

  /**
   * Sends special stock notes/MTA release form associated with stocks in order
   * to person who placed order and lab PI(s). All notes for the order appear in
   * the email.
   * 
   * @param order Stock order containing notes
   * @param message the message body to send
   */
  public static void sendStockNote(CompositeOrder order, String message) {
    // TAIR-95: Prevent sending of duplicate emails on order of more than one
    // stock with the same stock note.
    String ordererEmail = order.get_person_email();
    String[] piAddresses = order.get_pi_email();
    String subject = "ABRC Stock Order Special Notes";
    send(ordererEmail, message, subject);
    if (piAddresses != null && piAddresses.length > 0) {
      for (int i = 0; i < piAddresses.length; i++) {
        if (!ordererEmail.equals(piAddresses[i])) {
          send(piAddresses[i], message, subject);
        }
      }
    }
  }

  /**
   * Sends email to users who have backordered items. If sending email fails for
   * any reason (such as invalid email address), error is printed to STDERR and
   * ignored.
   * 
   * @param order Stock order to send message for
   * @see WebApp
   */
  public static void sendBackOrdered(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();

      msg.append("Dear Colleague,\n");
      msg
          .append("An item from ABRC order# "
                  + order.get_order_number()
                  + " is backordered, and will be shipped at a later date at no charge. "
                  + "\n\n");

      msg.append("Stock(s) backordered:\n");

      appendUserStockInfo(order, msg, "backordered");

      msg
          .append("If you have any questions concerning your order, please contact "
                  + "us at abrc@osu.edu." + "\n\n");

      send(order.get_person_email(), msg.toString(),
           "ABRC Stock(s) Backordered");

  }

  /*
   * /** Sends email to users who have backordered items. If sending email fails
   * for any reason (such as invalid email address), error is printed to STDERR
   * and ignored.
   * 
   * @param order Stock order to send message for
   * 
   * @see WebApp
   */
  public static void sendShippedBackOrdered(CompositeOrder order) {
    StringBuffer msg = new StringBuffer();
    Date dateSent = new Date();
    String dateSentStr = null;

    // gets the date for orders with or without invoices (waived charge
    // orders)
      dateSentStr = " was shipped on " + TextConverter.dateToString(dateSent);

      msg.append("Dear Colleague,\n");
      msg.append("A backordered item from ABRC order# "
                 + order.get_order_number() + dateSentStr + ".");

      msg.append("\n\n");

      msg.append("Stock(s) Shipped:\n");

      appendUserStockInfo(order, msg, "shipped");
      
      msg.append("\nStock(s) Still Backordered:\n");
      
      appendUserStockInfo(order, msg, "backordered");

      appendUserInfo(order, msg, true);

      msg
          .append("If you have any questions concerning your order, please contact "
                  + "us at abrc@osu.edu." + "\n\n");

      send(order.get_person_email(), msg.toString(),
           "ABRC Backordered Item(s) Shipped");
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
   * Convenience method to send all mails through Email object
   */
  private static void send(String address, String msg, String subj) {
    try {
      if (address != null && msg != null) {
        logger.debug("Sending order email");
        EMail.send(WebApp.getProperty("MAIL_HOST"),
                   WebApp.getProperty("ABRC_FROM_ADDRESS"),
                   address,
                   subj,
                   msg);
      }
    } catch (Exception e) {
      // Wrap exception as runtime exception and re-throw to handle elsewhere.
      throw new RuntimeException("Could not send order email to " + address
                                 + ": " + e.getMessage(), e);
    }
  }

  /**
   * ABRC Material Transfer Agreement and Order Disclaimer message for emails
   */
  public static void addDisclaimer(StringBuffer msg) {
    msg.append("\n");
    msg.append("DISCLAIMER:\n");
    msg.append("Please review carefully the following terms under which the Arabidopsis Biological ");
    msg.append("Resource Center is transferring these materials to you, the Recipient:\n");
    msg.append(" 1. The service is treated as an academic collaboration without issues of indemnity.\n");
    msg.append(" 2. Although ABRC makes every reasonable attempt to ensure the correctness of stocks, ABRC ");
    msg.append("and the donors of the stock do not imply any warranty whatsoever regarding the material and ");
    msg.append("its use, nor do they guarantee (i) that the material or its use does not infringe on any ");
    msg.append("rights or claims from third parties; or (ii) the material's suitability, novelty or safety ");
    msg.append("for any purpose whatsoever.\n");
    msg.append(" 3. Any fees that we assess are substantially less than the real cost of storing, producing ");
    msg.append("and distributing the material and therefore the service is not-for-profit and not commercial ");
    msg.append("and all costs passed to you represent partial recovery of our production costs.\n");
    msg.append(" 4. You have read the available information published on this stock, including our stock ");
    msg.append("descriptions, and are aware of the nature of the material that you have ordered including ");
    msg.append("any special conditions, regulations and requirements for your local handling of the material.\n\n");
    msg.append("We strongly encourage you to characterize all stocks shortly after receipt.  Your confirmation/validation ");
    msg.append("of diagnostic results may be useful to other users, so please send them to us if possible.\n\n");
    msg.append("If you are unhappy about any of the above conditions, please login to TAIR and cancel the order ");
    msg.append("by clicking on \"View My Current and Past Orders\" from your personal home page.");
  }

}
