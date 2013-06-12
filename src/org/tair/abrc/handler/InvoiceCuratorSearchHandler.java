/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceSearchResult;
import org.tair.abrc.payment.InvoiceSearcher;
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
 * Perform a curator search and set up the results.
 * 
 * @author Robert J. Muller
 */
public class InvoiceCuratorSearchHandler extends InvoiceSearchHandler {

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    extractParameters(request);

    search(request, type);

    return createResponse();
  }

  /**
   * Search for the results and create a results manager in the search session.
   * 
   * @param request the HTTP request containing the session and the search
   *          session
   * @param query the SQL query string
   * @param invoiceSearcher the invoice searcher with which to search
   * @throws SQLException when there is a problem performing the search
   */
  private void search(HttpServletRequest request, String query)
      throws SQLException {
    InvoiceSearcher searcher = new InvoiceSearcher(params);
    type = searcher.createSearchSQL();

    queryId = new Integer(type.hashCode()).toString();
    params.put("queryId", String.valueOf(queryId));
    SearchSession searchSession =
      SessionHandler.getSearchSession(request, type, queryId);
    searchSession.registerSearch(type, queryId);

    searchSession.setSearchCriteria(type, params);
    Map<Long, InvoiceSearchResult> results = searcher.search(type);

    ISearchResultsManager<InvoiceSearchResult, Long> manager =
      getResultsManager(results);

    searchSession.setInvoiceResultsManager(queryId, manager);
  }

  /**
   * Create a request handler response with the appropriate attributes.
   * 
   * @return the response
   */
  private RequestHandlerResponse createResponse() {
    RequestHandlerResponse response = new RequestHandlerResponse();

    response.setAttribute("pageNum", new Integer(1));
    response.setAttribute("size", size);
    response.setAttribute("searchCriteria", searchCriteria);
    response.setAttribute("query_id", queryId);

    // Display the summary results page.
    response.setPage(SUMMARY);

    return response;
  }
}
