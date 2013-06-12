/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.payment.InvoiceSearchResult;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.SearchSession;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcPayment;
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
 * Set the invoice status. Create the handler with the constructor that takes
 * the target status as an argument. The target status can be "in progress",
 * "paid in full", or "canceled" (use the DataConstants values for these
 * statuses). In-progress status requires special actions, setting the line
 * items to unpaid with amount 0.
 * 
 * 
 * @author Robert J. Muller
 * @see org.tair.utilities.DataConstants
 */
public class InvoiceStatusHandler extends InvoiceSearchHandler {
  /** the status to which to change */
  private final String status;
  private SearchSession session = null;

  /**
   * Create a InvoiceStatusHandler object.
   * 
   * @param status the status to which to change the invoice status
   */
  public InvoiceStatusHandler(String status) {
    this.status = status;
  }

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    DBconnection conn = null;

    extractParameters(request);

    // Get the session to allow updating status in results.
    session = SessionHandler.getSearchSession(request);

    try {
      conn = DBWriteManager.getInstance().getSearchConnection();
      // Turn off autocommit to do single transaction.
      conn.remove_auto_commit_mode();

      // Process changes to in-progress
      if (status.equals(DataConstants.INVOICE_STATUS_IN_PROGRESS)) {
        setInProgressStatus(conn);
      } else {
        setOtherStatus(conn);
      }

    } catch (SQLException e) {
      if (conn != null) {
        conn.rollback();
      }
      throw e;
    } finally {
      if (conn != null) {
        // Reset autocommit
        conn.set_auto_commit_mode();
        DBWriteManager.return_connection(conn);
      }
    }

    return setUpResponse();
  }

  /**
   * Set up the request handler response by setting the searchCriteria, size,
   * and queryId attributes. The page to which to forward is SUMMARY.
   * 
   * @return a request handler response.
   */
  private RequestHandlerResponse setUpResponse() {
    // Set up the response.

    RequestHandlerResponse response = new RequestHandlerResponse();

    response.setAttribute("searchCriteria", searchCriteria);
    response.setAttribute("size", size);
    response.setAttribute("query_id", queryId);

    response.setPage(SUMMARY);
    return response;
  }

  /**
   * <p>
   * Set the invoice status to a status other than in-progress, checking for
   * status validity. Rules:
   * </p>
   * <ol>
   * <li>status can change only on invoices that are in progress or paid in full
   * </li>
   * <li>changing status to paid in full requires eligible amount be 0</li>
   * <li>changing status to canceled requires invoice total to be 0</li>
   * <li>changing status to in progress requires current status to be paid in
   * full</li>
   * <li>changing status to in progress sets all line items to unpaid and amount
   * for each item to 0</li>
   * </ol>
   * <p>
   * If the conditions aren't satisfied, the method ignores the status-change
   * request.
   * </p>
   * 
   * @param conn the JDBC connection wrapper
   * @throws SQLException
   * @throws InvalidActionException
   * @throws InvalidFormException when no ids were selected
   */
  private void setOtherStatus(DBconnection conn) throws SQLException,
      InvalidActionException, InvalidFormException {
    TfcInvoice invoice;
    int changeCount = 0;

    if (formIds == null || formIds.length == 0) {
      throw new InvalidFormException("No rows selected for setting status");
    }
    
    // Iterate through selected invoices on current page.
    for (Long id : formIds) {
      // Query the invoice and get the eligible amount.
      invoice = new TfcInvoice(conn, id);
      float eligibleAmt =
        TfcInvoice.getEligibleForPayment(conn, invoice.get_invoice_id());

      // Validate the status change and store it.
      if (invoice.get_status().equals(DataConstants.INVOICE_STATUS_IN_PROGRESS)
          || invoice.get_status().equals(DataConstants.INVOICE_STATUS_PAID_IN_FULL)) {

        if ((status.equals(DataConstants.INVOICE_STATUS_PAID_IN_FULL) && eligibleAmt == 0.0)
            || (status.equals(DataConstants.INVOICE_STATUS_CANCELLED) && invoice.get_invoice_total().floatValue() == 0.0)) {

          changeCount++;
          invoice.set_status(status);
          invoice.store(conn);
          updateInvoiceStatusInResults(invoice.get_invoice_id(),
                                       invoice.get_status());
        }
      }
    }
    setSearchCriteria("<p>" + changeCount + " invoice"
                      + (changeCount == 1 ? "" : "s") + " modified.</p>");
  }

  /**
   * Set invoice status to in-progress for the selected invoices. This change
   * entails setting line items to be unpaid with amount 0.
   * 
   * @param conn the JDBC connection wrapper
   * 
   * @return a request handler response
   * @throws SQLException when there is a database problem setting status
   * @throws InvalidActionException when the change can't be stored
   * @throws InvalidFormException when no ids were selected
   */
  private void setInProgressStatus(DBconnection conn) throws SQLException,
      InvalidActionException, InvalidFormException {
    int changeCount = 0;

    if (ids == null || ids.size() == 0) {
      throw new InvalidFormException("No rows selected for setting status");
    }
    
    Set<Long> pay_ids = new HashSet<Long>();

    // Process the invoices to set status.
    for (Long id : ids) {
      // Query the invoice.
      CompositeInvoice invoice = new CompositeInvoice(conn, id);
      if (invoice.get_status().equals(DataConstants.INVOICE_STATUS_PAID_IN_FULL)) {
        // paid in full, so change to in-progress is OK
        changeCount++;
        invoice.set_status(DataConstants.INVOICE_STATUS_IN_PROGRESS);
        invoice.store(conn);
        updateInvoiceStatusInResults(invoice.get_invoice_id(),
                                     invoice.get_status());
        for (TfcLineItem item : invoice) {
          if (item.get_payment_id() != null) {
            // Item has been paid, add id to set and set to unpaid.
            pay_ids.add(item.get_payment_id());
            item.set_status(DataConstants.LINE_ITEM_STATUS_UNPAID);
            item.store(conn);
          }
        }
      }
    }

    // Set the search criteria by adding the invoices-modified report.
    setSearchCriteria("<p>" + changeCount + " invoice"
                      + (changeCount == 1 ? "" : "s") + " modified.</p>");

    // Process the reset payments to set the date to today and amount to 0.
    for (Long id : pay_ids) {
      // Query payment, set to 0.
      TfcPayment pay = (new TfcPayment(conn, id));
      pay.set_payment_date(new java.util.Date());
      pay.set_amount(new Float(0.0));
      pay.store(conn);
    }

    // Commit the transaction.
    conn.commit();
  }

  /**
   * Update the invoice status for a specified invoice in the search results.
   * 
   * @param invoiceId the invoice id
   * @param status the new status
   */
  private void updateInvoiceStatusInResults(Long invoiceId, String status) {
    // Get the search result from the session.
    InvoiceSearchResult result =
      session.getInvoiceResultsManager(queryId).getResultByKey(invoiceId);
    result.setInvoiceStatus(status);
  }
}
