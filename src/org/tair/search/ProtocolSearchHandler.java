//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2004/06/02 19:39:45 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;

/**
 * ProtocolSearchHandler handles all search functions for protocols.
 * When searching, ProtocolSearchHandler uses the <code>SearchSession</code>
 * object to create a temp table to hold an individual users protocol search
 * results. With these stored results, user can easily scroll through a large
 * result set through subsequent requests to ProtocolSearchHandler.
 *
 * <p>
 * ProtocolSearchHandler uses <code>ProtocolSearcher</code> to perform
 * initial search, to retrieve pages of results when scrolling through
 * results, and to retrieve protocol info. when download option is selected.
 */

public class ProtocolSearchHandler implements RequestHandler {

    /**
     * Processes servlet request to perform requested action. Method  uses the 
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate. The possible values of action 
     * are:
     *
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to ProtocolSearcher for searching</li>
     * <li>re_search - Requested page number of multiple page result set is
     * retrieved from request and passed to ProtocolSearcher to receive 
     * requested page of results</li>
     * <li>download - Marked protocols are retrieved from request and 
     * information is collected into tab-delimited format for download
     * </ul>
     *
     * <p>Results of search and re_search are returned as a
     * <code>SearchResultsCollection</code> containing an array of 
     * <code>ProtocolSummary</code> objects as well as scrolling params, links
     * and plain text explanation of search parameters used to construct result
     * set
     *
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing URL of JSP to forward to,
     * and any search results objects that may have resulted from request
     * @throws SQLException thrown if a database error occurs while searching
     * @throws InvalidParameterException thrown if an invalid search action
     * is requested, or an invalid protocol id is submitted for download
     * @throws InvalidFormException thrown if no protocols selected for 
     * download
     * @throws SessionOutOfTimeException thrown when re_searching 
     * if no protocol search is in progress
     */
    public RequestHandlerResponse process(HttpServletRequest request) 
        throws SQLException, InvalidParameterException, InvalidFormException,
               SessionOutOfTimeException {

        // action might be in "action" or "search_action"  - summary pages use
        // search action because of conflicts with form.action attribute in
        // javascript in Mac IE 4.5
        String action = request.getParameter("action");
        if (action == null) {
            action = request.getParameter("search_action");
        }

        if (action == null) {
            throw new InvalidParameterException( "No action or search action " +
						 "found for Protocol Search.");
        }

        RequestHandlerResponse response = null;

        if (action.equals("search")) {
            response = search(request, true);

        }
        else if (action.equals("re_search")) {
            response = search(request, false);

        }
        else if (action.equals("download")) {
            response = download(request);

        }
        else {
            throw new InvalidParameterException( "Invalid Protocol Search " +
						 "action requested: " + action);
        }
        return response;
    }

    /**
     * Returns literal value of search type prefix used
     * for creating temp tables in protocol search and
     * for registering and retrieving items from SearchSession
     *
     * @return literal value of protocol search type prefix
     * (should be "protocol")
     */
    public static String getSearchType() {
        return "protocol";
    }

    /**
     * retrieve search and scroll parameters to execute search and return
     * selected slice of result set
     *
     * @param request -- HTTP servlet request
     * @param firstSeach -- true if this is the first search, otherwise, false
     * @return a request handler response 
     */
    private RequestHandlerResponse search(HttpServletRequest request,
                                          boolean firstSearch) 
        throws SQLException, InvalidFormException, InvalidParameterException,
               SessionOutOfTimeException {

        RequestHandlerResponse response = null;
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        ProtocolSearcher searcher = new ProtocolSearcher();
        String query_id = "";

        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            ScrollParams scrollParams = 
		    ScrollCalculator.getScrollParams(request);

            // if first time through this search, populate temp table & 
            // get 1st page of results
	        Map searchParams = null;
	        SearchSession searchSession = null;
            
            if (firstSearch) {
                searchParams = getSearchParams(request);

                // register search w/SearchSession
                String insert_query = searcher.generateInsertLine( conn, searchParams, "form" );
                if (MasterTableInfo.queryIDExists( insert_query, conn ) ){
                    firstSearch = false;
                }
                query_id = MasterTableInfo.getQueryID( insert_query, conn, getSearchType() );
                searchSession = SessionHandler.getSearchSession(request, conn, getSearchType());
                searchParams.put( "query_id", query_id );
                
                searchSession.setSearchCriteria(query_id, searchParams);
            } else {
                // get search data from session
                searchSession = SessionHandler.getSearchSession(request);
                
                if (searchSession != null && searchSession.searchInProgress(getSearchType())) {
                    query_id = (String) request.getParameter("query_id");
                    searchParams = searchSession.getSearchCriteria(query_id);
                    if (searchParams == null ) { 
                        throw new SessionOutOfTimeException ("No protocal search in progress");
                    }

                    // Check for any items selected for download and 
                    // save in searchSession
                    saveSelectedItems(request, searchSession);
                } else {
                    throw new SessionOutOfTimeException( "No protocol search " + "in progress");
                }
            }
            
            SearchResultsCollection searchCollection = 
		    searcher.search(conn, searchParams, scrollParams, firstSearch);

            response = new RequestHandlerResponse();
            response.setAttribute("searchCollection", searchCollection);
            response.setAttribute("query_id", query_id);
            response.setPage(searchCollection.getResultsPage());

        }
        finally {
	    connectionPool.return_connection(conn);
        }
        return response;

    }

    /**
     * Saves any reference ids selected on search results page for
     * future download or use in community protocol association
     * module.  This is done to allow user to select items on multiple
     * pages while scrolling through results, then downloading or
     * associating to them all at once.
     *
     * @param request HttpServletRequest from search servlet
     * @param searchSession Search session object containing user's
     * search info and lists of items to download
     * @throws InvalidParameterException if an invalid id or
     * relationship type is received.
     */
    private void saveSelectedItems(HttpServletRequest request,
                                   SearchSession searchSession) 
        throws InvalidParameterException {

        if (!TextConverter.isEmpty(request.getParameter("id"))) {

            // transform submitted reference ids into Long and
            // save in search session until needed for download
            // or associating to community record
            String[] formIDs = request.getParameterValues("id");
            Long[] ids = TextConverter.stringToLongArray(formIDs);
            searchSession.addDownload(getSearchType(), ids);
        }
    }

    /**
     * Retrieve search params from request
     * @param request -- get Request passed from JSP
     * @return searchParams -- a Map object that contains the searchParams
     */

    private Map getSearchParams(HttpServletRequest request) {
        HashMap searchParams = new HashMap();

	if ( !TextConverter.isEmpty( request.getParameter( "term_1" ) ) ) {
	    searchParams.put( "term_1", request.getParameter( "term_1" ).trim() );
	    searchParams.put( "method_1", request.getParameter( "method_1" ) );
	    searchParams.put( "type_1", request.getParameter( "type_1" ) );
	}

	if ( !TextConverter.isEmpty( request.getParameter( "term_2" ) ) ) {
	    searchParams.put( "term_2", request.getParameter( "term_2" ).trim() );
	    searchParams.put( "method_2", request.getParameter( "method_2" ) );
	    searchParams.put( "type_2", request.getParameter( "type_2" ) );
	}


	if ( !TextConverter.isEmpty( request.getParameter( "keywords" ) ) ) {
	    searchParams.put( "keywords", request.getParameterValues( "keywords" ) );
	}
        
	searchParams.put( "order", request.getParameter( "order" ) );

        return searchParams;
    }
    

    /**
     * Collect information for each selected protocol and create tab-delimited
     * export string for download
     * @param request -- request from JSP
     * @return response -- JSP page to be posted on the web
     */
    private RequestHandlerResponse download(HttpServletRequest request) 
        throws SQLException, InvalidFormException, InvalidParameterException,
               SessionOutOfTimeException {

        Long[] formIDs;
        StringBuffer export = null;
        ProtocolSummary[] protocols = null;
        ProtocolSearcher searcher = null;
        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        String sessionID = null;
        RequestHandlerResponse response = null;
        SearchSession searchSession = null;
        List ids = null;

        searchSession = SessionHandler.getSearchSession(request);
        String query_id = (String) request.getParameter("query_id");
        if (searchSession == null ||
            !searchSession.searchInProgress(getSearchType()) ||
            query_id == null) {

            throw new SessionOutOfTimeException( "No protocol search " +
						 "in progress");
        }
        else {

            // get any protocols selected on previous pages
            ids = searchSession.getDownload(query_id);
            if (ids == null) {
                ids = new ArrayList();
            }
        }

        // combine previously selected with selections from current page
        if (!TextConverter.isEmpty(request.getParameter("id"))) {
            formIDs = 
		TextConverter.stringToLongArray(
		    request.getParameterValues("id"));

            if (formIDs != null && formIDs.length > 0) {
                for (int i = 0; i < formIDs.length; i++) {
                    ids.add(formIDs[i]);
                }
            }
        }

        if (ids == null || ids.isEmpty()) {
            throw new InvalidFormException( "No protocols selected " +
					    "for download");
        }

        try {

            sessionID = request.getSession().getId();
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            searcher = new ProtocolSearcher();
            protocols = searcher.getSelected(conn, ids, query_id);
            export = new StringBuffer();

            if (protocols != null && protocols.length > 0) {
                // get header from first element in results
                export.append(protocols[0].getExportHeader());
                for (int i = 0; i < protocols.length; i++) {
                    export.append(protocols[i].createExport());
                }
            }
            response = new RequestHandlerResponse();
            response.setAttribute("downloadText", export.toString());
            response.setPage("/jsp/common/download.jsp");

        }
        catch (NumberFormatException nfe) {
            throw new InvalidParameterException("Invalid reference id: " +
                                                nfe.getMessage());

        }
        finally {
	    connectionPool.return_connection(conn);
        }
        return response;
    }
}
