// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.29 $
// $Date: 2006/08/09 18:14:18 $
// ------------------------------------------------------------------------------

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.CompositeOrder;
import org.tair.abrc.OrderEmailHandler;
import org.tair.abrc.OrderFormValidator;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.payment.PriceCalculator;
import org.tair.abrc.payment.creditcard.CreditCardController;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.community.LoginChecker;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLineItem;
import org.tair.utilities.CompoundVector;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * OrderMaintenanceHandler handles updating of stock orders once they have been
 * placed,including alterations made by users, lab PIs and curators. There are
 * two main contexts in which orders are updated - detail, where only one order
 * is being altered, and list, where several orders are updated simultaneously.
 * Curators may do updates in both list and detail mode, whereas users and PIs
 * will only update from detail mode.
 */

public class OrderMaintenanceHandler implements RequestHandler {
  private DBWriteManager connectionPool;

  /**
   * Examines "mode" parameter in <code>HttpServletRequest</code> to determine
   * what actions to take on orders. Mode can be "detail", where curator acts on
   * a single stock order, "list", where curator acts on many stock orders at
   * the same time, or "user" where user or PI acts on a single order.
   * 
   * <p>
   * Curator can update orders in a variety of ways including:
   * 
   * <ul>
   * <li>Downloading/Exporting selected stocks - request forwarded to
   * <code>DownloadHandler</code> for collection of data and downloading.
   * <li>Deleting selected stocks from orders (by setting status to "inactive")
   * <li>Cancel entire orders
   * <li>Specify last modified date for stock changes
   * <li>Update stock status
   * <li>Activate phytosanitary charges (list only)
   * <li>Change lab for order (detail only)
   * <li>Update stock quantities (detail only)
   * <li>Update ABRC comments (detail only)
   * </ul>
   * 
   * Users and PIs can update user comments, delete selected stocks and cancel
   * orders. All actions to stocks and orders are restricted based on the status
   * of individual stock items in the order.
   * 
   * <p>
   * After changes have been made to one or more <code>CompositeOrder</code>s,
   * each order is saved to the database. Most of item status restrictions and
   * order status evaluation is done implicitly by CompositeOrder.
   * 
   * @param request HttpServletRequest from OrderServlet
   * @return RequestHandlerResponse containing URL of page to forward user to
   *         along with any attributes to add to request for display
   * @throws InvalidParameterException thrown if an invalid order or stock id is
   *           received
   * @throws InvalidFormException thrown if action requested and no stocks or
   *           orders are selected
   * @throws SQLException thrown if an error occurs while retrieving or updating
   *           data
   * @throws UnauthorizedRequestException thrown if user tries to access curator
   *           functions
   * @throws InvalidLoginException thrown if user not logged in.
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidParameterException, InvalidFormException, SQLException,
      UnauthorizedRequestException, InvalidLoginException {

    RequestHandlerResponse response = null;
    String mode = request.getParameter("mode");

    this.connectionPool = DBWriteManager.getInstance();

    // in detail, act on order as a whole
    if (mode != null && mode.equals("detail")) {
      response = updateDetail(request);

      // in list, act on individual items that may be from
      // different orders
    } else if (mode != null && mode.equals("list")) {
      response = updateList(request);

    } else if (mode != null && mode.equals("user") || mode.equals("pi")) {
      response = updateUser(request);

    } else {
      throw new InvalidParameterException("Invalid action requested: " + mode);
    }

    return response;

  }

  /**
   * Update single stock from curator detail page
   */
  private RequestHandlerResponse updateDetail(HttpServletRequest request)
      throws InvalidParameterException, SQLException, InvalidFormException,
      InvalidActionException {

    RequestHandlerResponse response = null;
    DBconnection conn = null;

    // track if order is being downloaded - don't save again if so
    boolean orderDownloaded = false;

    try {
      conn = connectionPool.get_connection();

      // create CompositeOrder for editing and set for retrieval on
      // next page
      Long orderID = null;
      try {
        orderID = new Long(request.getParameter("orders_id"));
      } catch (NumberFormatException nfe) {
        throw new InvalidParameterException("Invalid order id: "
                                            + nfe.getMessage());
      }

      CompositeOrder order = new CompositeOrder(conn, orderID);
      response = new RequestHandlerResponse();
      response.setAttribute("order", order);

      // set comments even if cancelling order
      String ABRC_comments = request.getParameter("ABRC_comments");
      String ABRC_public_comments =
        request.getParameter("ABRC_public_comments");

      order.set_ABRC_comments(ABRC_comments);
      order.set_ABRC_public_comments(ABRC_public_comments);

      // get date to use for status change - default to today's date
      java.util.Date dateModified = OrderFormValidator.getDateModified(request);

      if (dateModified == null) {
        dateModified = new java.util.Date();
      }

      // cancel order if requested using utility method
      // in CancelOrderHandler
      if (request.getParameter("cancel") != null
          && request.getParameter("cancel").equals("true")) {

        cancelOrder(order, dateModified);
        response.setPage("/jsp/abrc/cancel_order.jsp");

      } else { // otherwise update order w/submitted info.

        Map quantities = OrderFormValidator.getStockQuantities(request);
        updateStockQuantities(order, quantities);

        // change lab for order if requested
        String orgID = request.getParameter("organization_id");
        if (!TextConverter.isEmpty(orgID)) {
          changeLab(request, conn, order);
        }

        // update individual stocks with selected action
        String action = request.getParameter("action");
        if (!TextConverter.isEmpty(action)) {
          orderDownloaded =
            updateDetailStocks(request,
                               conn,
                               response,
                               action,
                               order,
                               dateModified);
        }

        // update stock line item charges after updating
        updateStockItemCharges(order);

        // check for increase/decrease in invoice charges - void
        // as necessary
        validateInvoiceCharges(order);
      }

      // save all changes made above to order if not already saved as
      // part of download
      if (!orderDownloaded) {
        order.store(conn);
      }

      // default page view to order detail
      if (response.getPage() == null) {
        response.setPage("/jsp/abrc/curator_order_detail.jsp");
      }

    } finally {
      DBWriteManager.return_connection(conn);
    }

    return response;
  }

  /**
   * Updates stocks from one or more orders through order search results
   * 
   * @param request HttpServletRequest from OrderServlet
   * @throws SQLException if a database error occurs
   * @throws InvalidFormException if no stocks or orders selected
   * @throws InvalidParameterException if an invalid stock or order id is
   *           received
   */
  private RequestHandlerResponse updateList(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidParameterException {

    RequestHandlerResponse response = null;
    DBconnection conn = null;

    try {

      String action = request.getParameter("action");
      if (TextConverter.isEmpty(action)) {
        throw new InvalidFormException("No action selected");
      }

      // get date to use for status change - default to today's date
      java.util.Date dateModified = OrderFormValidator.getDateModified(request);

      if (dateModified == null) {
        dateModified = new java.util.Date();
      }

      conn = connectionPool.get_connection();

      // get stock/order ids
      CompoundVector orderStockIDs = OrderFormValidator.getStockIDs(request);

      if (orderStockIDs == null || orderStockIDs.isEmpty()) {
        throw new InvalidFormException("No stocks selected");
      }

      response = new RequestHandlerResponse();
      if (action.equals("download_order")) {
        download(orderStockIDs, response, false, dateModified);

      } else if (action.equals("download_stock")) {
        download(orderStockIDs, response, true, dateModified);

        // else perform selected action on all selected items
      } else {
        updateListItems(request,
                        conn,
                        response,
                        action,
                        orderStockIDs,
                        dateModified);

      }

    } finally {
      DBWriteManager.return_connection(conn);
    }
    return response;
  }

  /**
   * Perform user updates user order maintenance page
   * 
   * @param request HttpServletRequest from OrderServlet
   * @return Response containing any objects for display and JSP URL to redirect
   *         to
   * @throws InvalidParameterException if an invalid order or stock id is
   *           received
   * @throws SQLException if a database error occurs
   * @throws InvalidLoginException if user is not logged in
   * @throws UnauthorizedRequestException if user does not have permissions to
   *           update order
   * @throws InvalidFormException if missing or invalid form data submitted
   */
  private RequestHandlerResponse updateUser(HttpServletRequest request)
      throws InvalidParameterException, SQLException, InvalidLoginException,
      UnauthorizedRequestException, InvalidFormException {

    DBconnection conn = null;
    RequestHandlerResponse response = null;

    try {

      conn = connectionPool.get_connection();

      Long orderID = null;
      try {
        orderID = new Long(request.getParameter("orders_id"));
      } catch (NumberFormatException nfe) {
        throw new InvalidParameterException("Invalid order number: "
                                            + nfe.getMessage());
      }

      CompositeOrder order = new CompositeOrder(conn, orderID);

      // must be person who placed order, pi of lab or curator
      // to update order
      BigInteger communityID = SessionHandler.getCommunityID(request);
      if (!LoginChecker.hasOrderPermissions(communityID, order)
          && !LoginChecker.isTairCurator(request)) {
        throw new UnauthorizedRequestException("Not authorized for "
                                               + "this resource");
      }

      Map quantities = OrderFormValidator.getStockQuantities(request);
      updateStockQuantities(order, quantities);

      String[] stockNumbers = request.getParameterValues("stock_number");

      // cancel all selected items
      if (stockNumbers != null && stockNumbers.length > 0) {
        String cancelStatus = DataConstants.getInactiveStock();
        removeItemCharges(stockNumbers,
                          order,
                          new java.util.Date(),
                          cancelStatus);
      }

      String comments = null;
      if (!TextConverter.isEmpty(request.getParameter("orderer_comments"))) {

        comments = request.getParameter("orderer_comments");
      }

      order.set_orderer_comments(comments);

      // update stock line item charges after updating
      updateStockItemCharges(order);
      // check for increase/decrease in invoice charges
      validateInvoiceCharges(order);

      System.out.println("DEBUG [HLP-837] : Update order.store FROM OrderMaintenanceHandler.updateUser");
      order.store(conn);
      response = new RequestHandlerResponse();
      response.setPage("/jsp/abrc/user_order_updated.jsp");

    } finally {
      DBWriteManager.return_connection(conn);
    }

    return response;
  }

  /**
   * Changes lab for submitted order if the person who placed the order is
   * affiliated with the specified lab
   * 
   * @param request HttpServletRequest from OrderServlet
   * @param conn An active connection to the database
   * @param order Order to update
   * @throws InvalidParameterException if invalid organization id submitted
   * @throws InvalidFormException if organization is not valid for person who
   *           placed order
   * @throws SQLException if a database error occurs
   */
  private void changeLab(HttpServletRequest request, DBconnection conn,
                         CompositeOrder order)
      throws InvalidParameterException, InvalidFormException, SQLException {

    BigInteger organizationID = null;
    BsOrganization organization = null;
    BsPerson person = order.get_person();
    try {
      OrganizationDelegate delegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      if (!TextConverter.isEmpty(request.getParameter("organization_id"))) {
        organizationID =
          new BigInteger(request.getParameter("organization_id"));
        IPrimaryKey key =
          CommunityFactory.getOrganizationPrimaryKey(organizationID);
        organization = delegate.getObject((SequencePrimaryKey)key);
        if (!organization.hasAffiliate(person)) {
          throw new InvalidFormException(order.get_person_name()
                                         + " not a member of lab id: "
                                         + organizationID);
        }
      } else {
        throw new InvalidParameterException("Change-lab request has no organization id");
      }
    } catch (NumberFormatException nfe) {
      throw new InvalidParameterException("Invalid organization id: "
                                          + nfe.getMessage());
    }

    order.set_new_organization(organization);
  }

  /**
   * Update one or more stocks from curator order detail page according to
   * selected action. This method assumes that stocks should have been requested
   * to take action on and throws InvalidFormException if no stock numbers found
   * in request.
   * 
   * <p>
   * Returns a boolean value to flag if order or stocks in order were downloaded
   * - this value is used by calling method to determine whether order needs to
   * be saved or not (since downloading will automatically store order)
   * 
   * @param request HttpServletRequest from OrderServlet
   * @param conn An active connection to the database
   * @param response Response to hold URL to redirect to
   * @param action Action to take on selected stocks
   * @param order Order containing stocks to update
   * @param dateModified Modification date to use for all updates
   * @throws InvalidFormException if no stock numbers selected
   * @throws SQLException if a database error occurs
   * @throws InvalidParameterException if an invalid id received
   */
  private boolean updateDetailStocks(HttpServletRequest request,
                                     DBconnection conn,
                                     RequestHandlerResponse response,
                                     String action, CompositeOrder order,
                                     java.util.Date dateModified)
      throws InvalidFormException, SQLException, InvalidParameterException {

    boolean orderDownloaded = false;

    // holds selected stocks w/order id as key referencing stock
    // number value
    CompoundVector orderStockIDs = OrderFormValidator.getStockIDs(request);

    if (orderStockIDs == null || orderStockIDs.isEmpty()) {
      throw new InvalidFormException("No stocks selected");
    }

    if (action.equals("download_order")) {
      download(orderStockIDs, response, false, dateModified);
      orderDownloaded = true;

    } else if (action.equals("download_stock")) {
      download(orderStockIDs, response, true, dateModified);
      orderDownloaded = true;

      // else update all stocks in list to selected status
    } else {
      // all stocks have same order id in detail mode
      Object[] stockIDs = orderStockIDs.getAllValues();

      // do special tasks if cancelling or backordering or getting MTA stock
      if (action.equals(DataConstants.getInactiveStock())
          || action.equals(DataConstants.getBackOrderedStock())
          || action.equals(DataConstants.getMTAStock())) {
        removeItemCharges(stockIDs, order, new java.util.Date(), action);

        // send an email to the user informing them that the item has been
        // backordered.
        if (action.equals(DataConstants.getBackOrderedStock())) {
          OrderEmailHandler.sendBackOrdered(order);
        }
        // else update
      } else {
        updateStatus(stockIDs, order, action, dateModified);
      }
    }

    return orderDownloaded;
  }

  /**
   * Updates selected order or stock items from curator order search results
   * with selected action.
   * 
   * @param request HttpServletRequest from OrderServlet
   * @param conn An active connection to the database
   * @param response Response object to hold items for display and JSP URL to
   *          redirect to
   * @param action Selected action to take on selected items
   * @param orderStockIDs Selected stocks and orders to perform action on
   * @param dateModified Modification date to use for updates
   * @throws SQLException if a database error occurs
   * @throws InvalidActionException if invalid update action is selected (if new
   *           order cannot be created due to business rules)
   * @throws InvalidParameterException if invalid stock status or action is
   *           submitted
   */
  private void updateListItems(HttpServletRequest request, DBconnection conn,
                               RequestHandlerResponse response, String action,
                               CompoundVector orderStockIDs,
                               java.util.Date dateModified)
      throws SQLException, InvalidActionException, InvalidParameterException {

    CompositeOrder order = null;
    Long orderID = null;
    Object[] stockIDs = null;
    for (int i = 0; i < orderStockIDs.size(); i++) {
      orderID = (Long)orderStockIDs.getKeyAt(i);
      order = new CompositeOrder(conn, orderID, "update_list_items");
      stockIDs = orderStockIDs.getValuesFor(orderID);

      // cancel or backorder selected stock items or MTA stocks
      if (action.equals(DataConstants.getInactiveStock())
          || action.equals(DataConstants.getBackOrderedStock())
          || action.equals(DataConstants.getMTAStock())) {
        removeItemCharges(stockIDs, order, new java.util.Date(), action);

        // update stock line item charges after updating
        updateStockItemCharges(order);

        // validate charges and do partial void of cc orders
        validateInvoiceCharges(order);

        // send an email to the user informing them that the stock item has been
        // backordered
        if (action.equals(DataConstants.getBackOrderedStock())) {
          OrderEmailHandler.sendBackOrdered(order);
        }
        // else update selected to requested stock status
      } else {
        updateStatus(stockIDs, order, action, dateModified);
      }

      System.out.println("DEBUG [HLP-837] : Update order.store FROM OrderMaintenanceHandler.updateListItems");
      order.store(conn); // save changes for this order

      // increment to last index so we don't repeat order processing
      i = orderStockIDs.lastKeyIndex(orderID);
    }

    response.setPage("/jsp/abrc/order_list_updated.jsp");

    // save search parameters used to create resultset
    // so we can return from "updated" page
    String searchString = request.getParameter("search_string");
    response.setAttribute("search_string", searchString);
  }

  /**
   * Download items by sending collection of order/stock ids to DownloadHandler
   * 
   * @param orderStockIDs Selected items as order ids referencing stock ids
   * @param response Response to contain attributes and JSP URL to redirect to
   * @param itemDownload If <code>true</code> curator selected "dowload items",
   *          else curator selected "download order"
   * @param dateModified Modification date to use for updates
   */
  private void download(CompoundVector orderStockIDs,
                        RequestHandlerResponse response, boolean itemDownload,
                        java.util.Date dateModified) {

    response.setAttribute("orderStock", orderStockIDs);
    response.setAttribute("dateModified", dateModified);
    response.setPage("/servlets/Order?" + "state=download&"
                     + "download_type=order&" + "item=" + itemDownload);
  }

  /**
   * Utility method to update selected stocks in order with given status. This
   * method should NOT be called to cancel or backorder stocks since there are
   * payment related tasks that must be performed; use removeItemCharges for
   * those cases to ensure proper clean up.
   */
  private void updateStatus(Object[] stockIDs, CompositeOrder order,
                            String status, java.util.Date dateModified)
      throws InvalidParameterException, InvalidActionException {

    String stockNumber = null;
    Stock stock = null;
    Long stockID = null;
    boolean isBackOrdered = false;
    boolean stock_isBackOrdered = false;

    for (int i = 0; i < stockIDs.length; i++) {

      stockNumber = (String)stockIDs[i];

      // if stock has been paid for, cannot update status to
      // anything but shipped
      stock = order.getStock(stockNumber);

      if (stock.back_ordered() == true) {
        stock_isBackOrdered = stock.back_ordered();
      }

      stock.set_status(status);
      stock.set_order_date_last_modified(dateModified);

      stockID = stock.get_stock_id();

      if (!DataConstants.getShippedStock().equals(status) && order.hasInvoice()
          && order.getInvoice().stockItemPaid(stockID)) {
        throw new InvalidActionException("Cannot set " + stockNumber
                                         + " status to " + status
                                         + " if payment has been made");
      }

    }

    /*
     * this checks if the back-ordered stock has just been set to shipped if any
     * or all of the stock items have been backordered and are now set to be
     * shipped, email a confirmation to the user. This handles one or multiple
     * backordered items set to be shipped
     */
    if (stock_isBackOrdered && status.equals("shipped") && !isBackOrdered) {
      isBackOrdered = true;

      OrderEmailHandler.sendShippedBackOrdered(order);
    }

  }

  /**
   * Cancels or sets to back-ordered selected stock items from order. These
   * actions is processed separately than other status changes since the actions
   * require payment and invoice actions to remove the line item stock charge
   * for each stock and to void the charge if stock was being paid for with a
   * credit card
   * 
   * @param stockNumbers List of stock numbers to cancel
   * @param order Order containing stock items
   * @param dateModified Date last modified to set for stock items
   * @throws InvalidActionException if stock cannot be set inactive or
   *           backordered because it has already been shipped
   */
  private void removeItemCharges(Object[] stockNumbers, CompositeOrder order,
                                 java.util.Date dateModified, String status)
      throws InvalidActionException {

    // make sure only cancellations and backorders are being
    // processed here
    String cancelled = DataConstants.getInactiveStock();
    String backOrdered = DataConstants.getBackOrderedStock();
    String MTA = DataConstants.getMTAStock();

    if (!status.equals(cancelled) && !status.equals(backOrdered)
        && !status.equals(MTA)) {
      throw new InvalidActionException("Invalid status submitted "
                                       + "for removing charges: " + status);
    }

    String stockNumber = null;
    Stock stock = null;

    CompositeInvoice invoice = order.getInvoice();
    // System.out.println
    // ("OrderMaintenanceHandler: removeItemCharges invoice_status : "
    // +invoice.get_status() );
    for (int i = 0; i < stockNumbers.length; i++) {
      stockNumber = (String)stockNumbers[i];
      stock = order.getStock(stockNumber);

      // clean up payment info. for stock -- cannot remove charge for
      // stock if payment already made
      if (invoice != null) {
        if (invoice.stockItemPaid(stock.get_stock_id())) {
          throw new InvalidActionException("Cannot cancel or backorder"
                                           + " stock if payment has been "
                                           + "made: " + stockNumber);
        }
        invoice.removeStockCharge(stock.get_stock_id());
      }

      stock.set_status(status);
      stock.set_stock_charge(new Float(0));
      stock.set_order_date_last_modified(dateModified);
    }
  }

  /**
   * Updates quantities of several stocks at once by iterating through contents
   * of quantityMap, which contains stock numbers as <code>String</code> keys
   * referencing <code>Integer</code> quantity to set for given stock. If
   * supplied stock number is not in order, quantity update request is silently
   * ignored. This method iterates through collection and uses
   * updateStockQuantity() to actually do the quantity update for each stock.
   * 
   * @param quantityMap Map of stock numbers to update with corresponding
   *          quantity to set for stock number.
   */
  private void updateStockQuantities(CompositeOrder order, Map quantities) {
    String stockNumber = null;
    int quantity;
    Stock stock = null;

    if (quantities != null && !quantities.isEmpty()) {
      Iterator iter = quantities.keySet().iterator();
      while (iter.hasNext()) {
        stockNumber = (String)iter.next();
        quantity = ((Integer)quantities.get(stockNumber)).intValue();
        stock = order.getStock(stockNumber);
        stock.set_quantity(quantity);
      }
    }
  }

  /**
   * Iterates through all stocks in order and makes sure that line item charges
   * still reflect the correct charges for each stock after any updating of
   * status, quantity etc.
   * 
   * @param order Order to update line item charges for
   */
  private void updateStockItemCharges(CompositeOrder order) {

    if (order.hasInvoice()) {
      CompositeInvoice invoice = order.getInvoice();
      Stock stock = null;
      TfcLineItem item = null;
      Float charge = null;
      Float max_express_charge = invoice.getExpressShippingCharge();
      boolean express_charge_change = false;
      boolean express_required = false;
      Float current_max_express_charge = new Float(0.00);

      String cancelledStatus = DataConstants.getInactiveStock();
      String backOrderedStatus = DataConstants.getBackOrderedStock();
      String MTAStatus = DataConstants.getMTAStock();
      String shippedStatus = DataConstants.getShippedStock();

      for (Iterator iter = order.getStocks(); iter.hasNext();) {
        stock = (Stock)iter.next();
        item = invoice.getStockItem(stock.get_stock_id());

        // only process if a line item already exists
        if (item != null) {
          // get new charge for stock
          charge = PriceCalculator.getStockCharge(stock);

          // if charge is zero or stock has been canceled or
          // backordered, remove line item
          if (charge.floatValue() == 0
              || stock.get_status().equals(cancelledStatus)
              || stock.get_status().equals(backOrderedStatus)
              || stock.get_status().equals(MTAStatus)) {

            invoice.removeStockCharge(stock.get_stock_id());
            express_charge_change = true;
            // else set new line item charge
          } else {
            item.set_amount(charge);
            if (current_max_express_charge.compareTo(stock.get_express_shipping_charge()) < 0
                && stock.express_shipping_required()) {
              current_max_express_charge = stock.get_express_shipping_charge();
            }
          }

        }
      }

      // go through all the stocks in the order and see if express shipping is
      // REQUIRED, or CHOSEN.
      if (invoice.hasExpressShippingCharge()) {
        for (Iterator iter = order.getStocks(); iter.hasNext();) {
          stock = (Stock)iter.next();
          if (stock.express_shipping_required()) {
            express_required = true;
          }
        }
      }
      if (invoice.hasExpressShippingCharge()) {
        if (express_charge_change == false) {
          invoice.setExpressShippingCharge(max_express_charge);
        } else if (current_max_express_charge.compareTo(max_express_charge) < 0) {
          if (express_required == true) {
            invoice.setExpressShippingCharge(current_max_express_charge);
          }
        } else {
          invoice.setExpressShippingCharge(max_express_charge);
        }
      }
      // check to see if order still has any stock charges - if not,
      // remove all other charges
      if (!invoice.hasStockCharges()) {
        invoice.removeAllCharges();
      }
    }
  }

  /**
   * Checks invoice for changes in total amount following any updates to stock
   * statuses or quantities.
   * 
   * An exception will be thrown if order's price has increased from initial
   * amount quoted when it was placed - this is not allowed by system's rules
   * because of various issues with invoicing and credit card payments.
   * 
   * <p>
   * If total price of order has been decreased from initial amount, a partial
   * void will be issued for any credit card orders.
   * 
   * @param order Order to validate charges for
   * @throws InvalidActionException if order charges are increased past original
   *           amount
   */
  private void validateInvoiceCharges(CompositeOrder order)
      throws InvalidActionException {

    if (order.hasInvoice()) {
      CompositeInvoice invoice = order.getInvoice();
      float total = invoice.get_invoice_total().floatValue();
      float origTotal = 0;

      // auth_amount represents original total for cc orders
      if (invoice.isCreditCard()) {
        origTotal = invoice.get_auth_amount().floatValue();

        // value currently stored in db (as opposed to total calculated
        // from line items) is best source of orig. total for po orders
      } else {
        origTotal = invoice.getLastInvoiceTotal().floatValue();
      }

      if (total > origTotal) {
        throw new InvalidActionException("Cannot increase order charges");

        // do partial void of cc auth amount if amount has decreased - if
        // new total is zero, do a full void
      } else if (invoice.isCreditCard() && origTotal >= total) {
        if (total == 0) {
          try {
            CreditCardController.fullVoid(invoice);
            invoice.set_status(DataConstants.getCancelledInvoice());
          } catch (Exception e) {
            e.printStackTrace();
          }
        } // ***commented this out as partial void is not working correctly
        // } else {
        // CreditCardController.partialVoid( invoice );
        // }
      } else if (!invoice.isCreditCard() && origTotal >= total) {
        if (total == 0) {
          invoice.set_status(DataConstants.getCancelledInvoice());
        }
      }
    }
  }

  public static void cancelOrder(CompositeOrder order,
                                 java.util.Date dateModified)
      throws InvalidActionException {
    order.cancel();
    order.set_date_complete(dateModified);
    // check to make sure that no payments have been made for
    // invoice line items -- shouldn't be possible to have line
    // items paid without stocks being shipped (in which case
    // an exception should have already been thrown), but check
    // to make sure
    if (order.hasInvoice()) {
      CompositeInvoice invoice = order.getInvoice();
      if (invoice.hasPayments()) {
        throw new InvalidActionException("Cannot cancel order if payments have already been made");
      } else {
        // else remove all line items and void any
        // credit card authorizations
        invoice.removeAllCharges();
        if (invoice.isCreditCard())
          try {
            CreditCardController.fullVoid(invoice);
          } catch (Exception e) {
            e.printStackTrace();
          }
        invoice.set_status(DataConstants.getCancelledInvoice());
      }
    }
  }
}
