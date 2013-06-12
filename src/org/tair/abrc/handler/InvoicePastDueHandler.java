/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.InvoiceEmailHandler;
import org.tair.abrc.payment.InvoiceSearcher;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.SearchSession;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * Process list of selected invoices from search results
 * 
 * @author Robert J. Muller
 */
public class InvoicePastDueHandler extends InvoiceSearchHandler {

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    extractParameters(request);

    updatedRows = 0;

    // Send out the emails to the selected invoiced users.
    sendPastDueInvoiceEmail();

    SearchSession searchSession = SessionHandler.getSearchSession(request);
    
    // Retrieve the query from the session and set the type to it.
    type = searchSession.getSearchTypeFromId(new Integer(queryId));

    // Refresh results to get notification dates; note that queryId stays the
    // same.
    RequestHandlerResponse response = refresh(searchSession);

    response.setAttribute("pageNum", new Integer(1));
    response.setAttribute("size", size);
    response.setAttribute("query_id", queryId);

    setSearchCriteria(" Past due invoices were sent. <p> ");
    response.setAttribute("searchCriteria", searchCriteria);

    response.setPage(SUMMARY);

    return response;
  }

  /**
   * Runs the search again from the session parameters to refresh results.
   * 
   * @param searchSession the search session from the user's session
   * @return a new request handler response
   * 
   * @throws SQLException when there is a problem with the query
   * @throws InvalidParameterException when the query id isn't valid
   * @throws SessionOutOfTimeException when no search is in progress to refresh
   */
  private RequestHandlerResponse refresh(SearchSession searchSession)
      throws SQLException, InvalidParameterException, SessionOutOfTimeException {
    if (searchSession != null && searchSession.searchInProgress(type)) {
      params = (Map<String, Object>)searchSession.getSearchCriteria(type);
    } else {
      throw new SessionOutOfTimeException("No " + type + " search in progress");
    }
    InvoiceSearcher searcher = new InvoiceSearcher(params);
    return search(searchSession, searcher, USER_SUMMARY);
  }

  /**
   * For invoice types of purchase order, send email past-due notification and
   * set the updatedRows counter for each invoice updated.
   * 
   * @throws SQLException when there is a database problem
   * @throws InvalidParameterException when an id is invalid
   */
  private void sendPastDueInvoiceEmail() throws SQLException,
      InvalidParameterException {

    InvoiceEmailHandler email = new InvoiceEmailHandler();

    if (ids != null) {
      for (Long id : ids) {
        // send email for past due invoices
        if (email.sendPastDueRequestForPayment(id)) {
          updatedRows++;
        }
      }
    }
  }
}
