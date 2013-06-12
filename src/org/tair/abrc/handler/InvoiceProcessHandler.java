/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.tair.abrc.InvoiceEmailHandler;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.payment.CreditCardPaymentHandler;
import org.tair.abrc.payment.InvoiceSearchResult;
import org.tair.abrc.payment.InvoiceSearcher;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.ISearchResultsManager;
import org.tair.search.SearchSession;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcOrdersStock;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * <p>
 * Process the list of selected, payable invoices:
 * </p>
 * <ol>
 * <li>process credit-card captures</li>
 * <li>process purchase order notifications</li>
 * <li>update process date for first-time invoices</li>
 * </ol>
 * <p>
 * Set the request handler response with an appropriate search criterion and
 * with the current result settings.
 * </p>
 * 
 * @author Robert J. Muller
 */
public class InvoiceProcessHandler extends InvoiceSearchHandler {

  private static final Logger logger =
    Logger.getLogger(InvoiceProcessHandler.class);

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    updatedRows = 0;

    extractParameters(request);

    List<Long> invoiceIDs = getPayableInvoiceIDs();
    processCreditCardCaptures(invoiceIDs);
    processPurchaseOrderNotifications(invoiceIDs);

    DBconnection conn = null;

    try {
      conn = DBWriteManager.getInstance().get_connection();

      for (Long invoiceId : invoiceIDs) {
        updatedRows++;

        // Query the invoice object.
        TfcInvoice invoice = new TfcInvoice(conn, invoiceId);

        // If there is no invoice date, set the date to current date.
        if (invoice.get_invoice_date() == null) {
          invoice.set_invoice_date(new java.util.Date());
          invoice.store(conn);
        }
      }
    } finally {
      if (conn != null) {
        DBWriteManager.return_connection(conn);
        conn = null;
      }
    }

    RequestHandlerResponse response = new RequestHandlerResponse();

    setSearchCriteriaResponse(response);

    // Refresh the search results to include things changed.
    redoSearch(request);

    response.setAttribute("pageNum", pageNum);
    response.setAttribute("size", size);
    response.setAttribute("query_id", queryId);

    response.setPage(SUMMARY);

    return response;
  }

  /**
   * Redo the search using the currently operative search criteria. This new
   * search resets the search results to whatever is currently in the database,
   * taking into account changes since the original search.
   * 
   * @param request the HTTP request containing the session
   * @throws SQLException when there is a problem doing the search
   */
  protected void redoSearch(HttpServletRequest request) throws SQLException {
    // Get the original parameters from the search session.
    SearchSession searchSession = SessionHandler.getSearchSession(request);
    // Only redo search if there is a search session and a previous query.
    if (searchSession != null && queryId != null) {
      Map<String, Object> oldParams = searchSession.getSearchCriteria(queryId);
      // Only redo search if there are search parameters available.
      if (oldParams != null) {
        InvoiceSearcher searcher = new InvoiceSearcher(oldParams);

        String query = null; // local query, not member query
        try {
          query = searchSession.getSearchTypeFromId(new Integer(queryId));

          if (query != null) {
            // Get the new results using the query from the search session.
            Map<Long, InvoiceSearchResult> results = searcher.search(query);

            // Get the search manager and replace the results in the base
            // manager.
            ISearchResultsManager<InvoiceSearchResult, Long> manager =
              searchSession.getInvoiceResultsManager(queryId);
            manager.setResults(results);
          }
        } catch (NumberFormatException e) {
          throw new RuntimeException(queryId
                                     + " is not a hash code for a query");
        } catch (RuntimeException e) {
          // log and continue to exit
          logger.warn("Could not find query to redo after processing invoices: "
                      + e.getMessage());
        }
      }
    }
  }

  /**
   * Returns a list of invoice ids for those invoices that are eligible for
   * payment
   * 
   * @return a list of Long ids eligible for payment
   * @throws SQLException when there is a database problem looking up
   *           eligibility
   */
  private List<Long> getPayableInvoiceIDs() throws SQLException {
    List<Long> eligibleIds = new ArrayList<Long>(ids.size());

    for (Long id : ids) {
      // Add ids that are eligible for payment.
      if (eligibleForPayment(id)) {
        eligibleIds.add(id);
      }
    }
    return eligibleIds;
  }

  /**
   * Returns true if all stock items for this invoice have shipped.
   * 
   * @param invoiceID the identifier for the invoice
   * @return true if all items have shipped, false otherwise
   * @throws SQLException if there is a problem querying the information
   */
  private boolean eligibleForPayment(Long invoiceID) throws SQLException {
    boolean eligible = true;
    DBconnection conn = null;
    try {
      conn = DBWriteManager.getInstance().getSearchConnection();
      CompositeInvoice invoice = new CompositeInvoice(conn, invoiceID);
      TfcOrdersStock os;
      boolean itemsExist = false;
      for (TfcLineItem item : invoice) {
        itemsExist = true;
        if ("stock_charge".equals(item.get_type())) {
          os =
            new TfcOrdersStock(conn, item.get_stock_id(), item.get_orders_id());
          if (!stockEligibleForPayment(os)) {
            eligible = false;
            break; // only need one ineligible item
          }
        }
      }
      if (!itemsExist) {
        // No items, therefore no eligible payments.
        eligible = false;
      }
    } finally {
      DBWriteManager.return_connection(conn);
    }
    return eligible;
  }

  /**
   * Determine whether a stock is eligible for payment based on the stock status
   * and charge. MTA with no charge, Shipped, NASC, Backordered, and Inactive
   * stocks are eligible for payment.
   * 
   * @param os a stock for an order
   * @return true if the stock is eligible for payment, false if not
   */
  private boolean stockEligibleForPayment(TfcOrdersStock os) {
    String status = os.get_status();
    Float charge = os.get_stock_charge();
    if (DataConstants.getMTAStock().equals(status) && charge != null
        && charge.floatValue() == 0)
      return true;
    if (DataConstants.getShippedStock().equals(status))
      return true;
    if (DataConstants.getNASCStock().equals(status))
      return true;
    if (DataConstants.getBackOrderedStock().equals(status))
      return true;
    if (DataConstants.getInactiveStock().equals(status))
      return true;
    return false;
  }

  /**
   * For invoice types of credit card, capture costs for unpaid, shipped items
   * 
   * @param ids the list of invoice ids
   * @throws SQLException when there is a database problem
   * @throws InvalidParameterException when the id is not valid
   */
  private void processCreditCardCaptures(List<Long> ids) throws SQLException,
      InvalidParameterException {
    if (ids != null) {
      CreditCardPaymentHandler pay = new CreditCardPaymentHandler();
      for (Long id : ids) {
        pay.captureBulkPayments(id);
      }
    }
  }

  /**
   * For invoice types of purchase order, send email request for payment.
   * 
   * @param ids the list of selected invoice ids
   * @throws SQLException when there is a database problem
   * @throws InvalidParameterException when an id is invalid
   */
  private void processPurchaseOrderNotifications(List<Long> ids)
      throws SQLException, InvalidParameterException {
    if (ids != null) {
      InvoiceEmailHandler email = new InvoiceEmailHandler();
      for (Long id : ids) {
        email.sendRequestForPayment(id);
      }
    }
  }

  /**
   * Set the search criteria into the response, building the criteria string
   * from the number of updated rows.
   * 
   * @param response the response
   */
  private void setSearchCriteriaResponse(RequestHandlerResponse response) {
    StringBuilder message = new StringBuilder(" There were ");

    message.append("<font class=\"emphasis\">");
    message.append(updatedRows);
    message.append("</font> ");

    if (updatedRows == 1) {
      message.append(" item processed. <p>");
    } else if (updatedRows > 1) {
      message.append(" items processed. <p>");
    } else {
      message.append(" items eligible for payment. <p>");
    }

    // Set the data member search criteria.
    setSearchCriteria(message.toString());
    // Set the response from the data member.
    response.setAttribute("searchCriteria", searchCriteria);
  }
}
