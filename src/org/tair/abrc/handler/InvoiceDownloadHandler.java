/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceSearchResult;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.ISearchResultsManager;
import org.tair.search.SearchResultDownloadSelectionDecorator;
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
 * Create a requested download from the search results for a set of selected
 * invoice ids.
 * 
 * @author Robert J. Muller
 */
public class InvoiceDownloadHandler extends InvoiceSearchHandler {
  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    extractParameters(request);

    SearchSession searchSession = SessionHandler.getSearchSession(request);

    // Get the manager for the search from the session..
    ISearchResultsManager<InvoiceSearchResult, Long> manager =
      searchSession.getInvoiceResultsManager(queryId);

    if (ids == null || ids.isEmpty()) {
      // Download selected, but no rows, so just use all rows in the result.
      if (ids == null) {
        ids = new ArrayList<Long>();
      }
      for (InvoiceSearchResult result : manager) {
        ids.add(result.getId());
      }
    }

    // Decorate the manager with a download-selection decorator.
    manager =
      new SearchResultDownloadSelectionDecorator<InvoiceSearchResult, Long>(manager,
                                                                            ids);

    // Set the download into the response.
    RequestHandlerResponse response = new RequestHandlerResponse();
    // Setting downloadText tells SearchServlet to download the text as a file
    // and then redisplay the current page.
    response.setAttribute("downloadText", manager.export());
    // Tell the response handler to name the file "invoice", no extension
    response.setAttribute("downloadName", "invoice");

    return response;
  }
}
