/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceSearchResult;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.ISearchResultsManager;
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
 * Get another results page after doing the initial search.
 * 
 * @author Robert J. Muller
 */
public class InvoiceNewPageHandler extends InvoiceSearchHandler {

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    SearchSession searchSession = SessionHandler.getSearchSession(request);

    // Get the shared parameter data members.
    extractParameters(request);
    // Get the parameter map used in the previous search from the session.
    getParamsFromSearchSession(searchSession);

    // Set the page to display in the page handler and in the JSP response.
    ISearchResultsManager<InvoiceSearchResult, Long> manager =
      searchSession.getInvoiceResultsManager(queryId);
    manager.setPage(pageNum);

    return createResponse();
  }

  /**
   * Create the request handler response using data members.
   * 
   * @return the response
   */
  private RequestHandlerResponse createResponse() {
    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setAttribute("pageNum", pageNum);

    response.setAttribute("size", size);
    response.setAttribute("searchCriteria", searchCriteria);
    response.setAttribute("sortColumn", sortColumn);
    response.setAttribute("query_id", queryId);

    response.setPage(SUMMARY);
    return response;
  }
}
