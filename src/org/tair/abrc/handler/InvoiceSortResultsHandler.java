/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceSearchResult;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.ISearchResultsManager;
import org.tair.search.SearchResultsSortDecorator;
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
 * <p>
 * This results handler sets up the decorated results manager hierarchy to sort
 * the results in a specific order. The sorting is always done before any page
 * extraction, so the sort always sorts all results, not just the results on a
 * given page. The sort decorator lets you re-sort the data temporarily, but the
 * iterator on that decorator will always return the set of all results sorted
 * by the comparator you create here.
 * </p>
 * <p>
 * The sort column must be specified using the InvoiceSearchResult Sort enum
 * type. The user interface should return the enum value as a fully capitalized
 * string.
 * </p>
 * <p>
 * The sort permits sorting by a single sort column at once. The implementation
 * replaces any existing sort decorator with the newly specified one. The
 * manager defers the actual sort to the request for results or to the request
 * to get sorted results.
 * </p>
 * 
 * @author Robert J. Muller
 * @see InvoiceSearchResult.Sort
 */
public class InvoiceSortResultsHandler extends InvoiceSearchHandler {

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    // Get the shared parameters.
    extractParameters(request);
    // Get the parameter map from the last search.
    SearchSession searchSession = SessionHandler.getSearchSession(request);
    getParamsFromSearchSession(searchSession);

    // Get the kind of sort to perform.
    InvoiceSearchResult.Sort sort =
      InvoiceSearchResult.Sort.fromString(sortColumn.toUpperCase());

    // Get the manager from the current session (or a new base manager).
    ISearchResultsManager<InvoiceSearchResult, Long> manager =
      searchSession.getInvoiceResultsManager(queryId);

    // Create the new sort decorator to wrap the base results manager.
    ISearchResultsManager<InvoiceSearchResult, Long> sortDecorator =
      new SearchResultsSortDecorator<InvoiceSearchResult, Long>(manager,
                                                                sort.getComparator());
    
    // If the current manager has been removed, replace it with the new
    // sort manager (replacing the old sort with the new one).
    if (manager.isRemoved()) {
      manager = sortDecorator;
    }
    
    // Repaginate taking the new sort order into account.
    manager.setPage(pageNum);

    searchSession.setInvoiceResultsManager(queryId, manager);

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
