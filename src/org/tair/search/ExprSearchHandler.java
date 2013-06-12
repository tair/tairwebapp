//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
// $Revision: 1.6 $
// $Date: 2004/07/01 21:57:57 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcKeyword;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;

/**
 * ExprSearchHandler handles all search functions for expression sets. When
 * searching, ExprSearchHandler uses the <code>SearchSession</code> object 
 * to create a temp table to hold an individual users expression sets search
 * results. With these stored results, user can easily scroll through a large
 * result set through subsequent requests to ExprSearchHandler.
 *
 * <p>
 * ExprSearchHandler uses <code>ExprSearcher</code> to perform initial search
 * and to store the search results. ExprSearchHandler sets response attributes
 * and forwards execution to the appropriate jsp for display
 */


public class ExprSearchHandler implements RequestHandler {
    private String searchType = "expr";


    /**
     * Processes servlet request to perform requested action.  Method  uses the 
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of action 
     * are:
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to EcotypeSearcher for searching</li>
     * <li>re_search - Requested page number of multiple page result set is
     * retrieved from request and passed to EcotypeSearcher to receive requested
     * page of results</li>
     * <li>download - Marked search results are retrieved from request and 
     * information is collected into tab-delimited format for download</li>
     * </ul>
     * 
     * <p>
     * Results of search and re_search are returned as a 
     * <code>SearchResultsCollection</code> containing an array of 
     * <code>ExprSummary</code> objects, as well as scrolling params, link and 
     * plain text explanation of search parameters used to construct result set
     *
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing URL of JSP to forward to, and any
     * search results objects that may have resulted from request
     * @throws SQLException thrown if a database error occurs while searching
     * @throws InvalidParameterException thrown if an invalid search action is 
     * requested, or an invalid id is submitted for download
     * @throws InvalidFormException thrown if no items selected for download
     * @throws SessionOutOfTimeException thrown when re_searching if no protein 
     * search is in progress
     */  
    public RequestHandlerResponse process( HttpServletRequest request ) 
	throws SQLException, InvalidParameterException, InvalidFormException, 
	       SessionOutOfTimeException {

	String action = request.getParameter( "search_action" );
	RequestHandlerResponse response = null;
    
	if ( action != null && action.equals( "search" ) ) {
	    response = search( request, true );
      
	} else if ( action != null && action.equals( "re_search" ) ) {
	    response = search( request, false );
      
	} else if ( action != null && action.equals( "download" ) ) {
	    response = download( request );

	} else {
	    throw new InvalidParameterException( "Invalid search action " +
						 "requested: " + action );
	}
	return response;
    }


    /**
     * Retrieves search and scroll parameters to execute search and return 
     * selected slice of result set
     */
    private RequestHandlerResponse search( HttpServletRequest request, 
					   boolean firstSearch ) 
	throws SQLException, SessionOutOfTimeException, 
	       InvalidParameterException {

	RequestHandlerResponse response = null;

	DBWriteManager connectionPool = null;
	DBconnection conn = null;
    String query_id = "";
    
	try {
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.getSearchConnection();
	    ScrollParams scrollParams = 
		ScrollCalculator.getScrollParams( request );
	    ExprSearcher searcher = new ExprSearcher();


	    // if first time through this search, populate temp table 
	    // and get 1st page of results      
	    Map searchParams = null;
	    SearchSession searchSession = null;
	    if ( firstSearch ) {
		    searchParams = getSearchParams( request, conn ); 
		    searchParams.put( "sessionID", request.getSession( true ).getId() );

		// register search w/SearchSession
        String insert_query = searcher.generateInsertLine(conn, searchParams, "form");
        if (MasterTableInfo.queryIDExists( insert_query, conn ) ) {
            firstSearch = false;
        }
        query_id = MasterTableInfo.getQueryID ( insert_query, conn, searchType );
		searchSession = SessionHandler.getSearchSession( request, conn, searchType ); 
        searchParams.put ( "query_id", query_id );

		searchSession.setSearchCriteria( query_id, searchParams );
        
		// else get requested slice of result set already
		// stored in temp table
	    } else {
		// get search data from session 
		searchSession = SessionHandler.getSearchSession( request );
		if ( searchSession != null && 
		     searchSession.searchInProgress( searchType ) ){
            query_id = (String) request.getParameter("query_id");
		    searchParams = searchSession.getSearchCriteria( query_id );
            if (searchParams == null ) { 
                throw new SessionOutOfTimeException( "No experiment search in progress" );
            }
            searchParams.put( "query_id", query_id );
		    // check for any items selected for download and save in 
		    // searchSession until download is selected action
		    if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {

			    Long[] ids = TextConverter.stringToLongArray( 
					 request.getParameterValues( "id" ) );

			    searchSession.addDownload( searchType, ids );
		    }

		} else {
		    throw new SessionOutOfTimeException( "No experiment " +
							 "search in progress" );
		}
	    }

	    SearchResultsCollection searchCollection = 
		searcher.search( conn, 
				 searchParams, 
				 scrollParams, 
				 firstSearch );

	    response = new RequestHandlerResponse();
	    response.setAttribute( "searchCollection", searchCollection );
        response.setAttribute( "query_id", query_id );
	    response.setPage( searchCollection.getResultsPage() );
      
	} finally {
	    connectionPool.return_connection( conn );
	}

	return response;
    }

  
    /**
     * Retrieves search params from request
     */
    private Map getSearchParams( HttpServletRequest request, DBconnection conn )
	throws SQLException {

	HashMap searchParams = new HashMap();
	if ( !TextConverter.isEmpty( request.getParameter( "term_1" ) ) ) {
	    searchParams.put( "term_1", 
			      request.getParameter( "term_1" ).trim() );

	    searchParams.put( "name_type_1", 
			      request.getParameter( "name_type_1" ) );

	    searchParams.put( "method_1", 
			      request.getParameter( "method_1" ) );
	}

	if ( !TextConverter.isEmpty( request.getParameter( "term_2" ) ) ) {
	    searchParams.put( "term_2", 
			      request.getParameter( "term_2" ).trim() );

	    searchParams.put( "name_type_2", 
			      request.getParameter( "name_type_2" ) );

	    searchParams.put( "method_2", 
			      request.getParameter( "method_2" ) );
	}

	if ( !TextConverter.isEmpty( request.getParameter( "term_3" ) ) ) {
	    searchParams.put( "term_3", 
			      request.getParameter( "term_3" ).trim() );

	    searchParams.put( "name_type_3", 
			      request.getParameter( "name_type_3" ) );

	    searchParams.put( "method_3", 
			      request.getParameter( "method_3" ) );
	}
    
	if ( !TextConverter.isEmpty( request.getParameter( "order" ) ) ) {
	    searchParams.put( "order", request.getParameter( "order" ) );
	}
	if ( !TextConverter.isEmpty( request.getParameter( "array_name" ) ) ) {
	    searchParams.put( "array_name", request.getParameter( "array_name" ) );
	}

        
	// if searching by experiment category, submitted values will be 
	// keyword ids -- get keyword values for each for displaying search 
	// parameters.
	if ( !TextConverter.isEmpty( 
		  request.getParameter( "experiment_category" ) ) ) {

	    Long[] keywordIDs = 
		TextConverter.stringToLongArray( 
		    request.getParameterValues( "experiment_category" ) );

	    searchParams.put( "experiment_category_id", keywordIDs );
	    searchParams.put( "experiment_category", 
			      TfcKeyword.translateKeywordIDs( conn, 
							      Arrays.asList(keywordIDs) ) );
	}

	if ( !TextConverter.isEmpty( 
		  request.getParameter( "experiment_goal" ) ) ) {

	    searchParams.put( "experiment_goal", 
			      request.getParameter( "experiment_goal" ).trim() );
	    
	    searchParams.put( "goal_method", 
			      request.getParameter( "goal_method" ) );
	}

	if ( !TextConverter.isEmpty( 
		  request.getParameter( "experimental_factor" ) ) ) {

	    searchParams.put( "experimental_factor", 
			      request.getParameter( "experimental_factor" ).trim() );
	    
	    searchParams.put( "factor_method",
			      request.getParameter( "factor_method" ) );
	}


	if ( !TextConverter.isEmpty( request.getParameter( "bio_sample" ) ) ) {
	    searchParams.put( "bio_sample", 
			      request.getParameter( "bio_sample" ) );

	    searchParams.put( "bio_sample_method", 
			      request.getParameter( "bio_sample_method" ) );
	}

	return searchParams;
    }


    /**
     * Create tab delimited exports for selected items
     */
    private RequestHandlerResponse download( HttpServletRequest request ) 
	throws SQLException, InvalidFormException, InvalidParameterException, 
	       SessionOutOfTimeException {

	RequestHandlerResponse response = null;

	List ids = null;
	SearchSession searchSession = 
	    SessionHandler.getSearchSession( request );
    String query_id = (String) request.getParameter("query_id");

	if ( searchSession == null ||
	     !searchSession.searchInProgress( searchType ) ||
         query_id == null ) {

	    throw new SessionOutOfTimeException( "No experiment search " +
						 "in progress" );
	} else {
	    // get any items selected on previous pages
	    ids = searchSession.getDownload( searchType );
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	}

	// combine previously selected with selections from current page
	if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
	    Long[] formIDs = TextConverter.stringToLongArray( 
				 request.getParameterValues( "id" ) );

	    if ( formIDs != null && formIDs.length > 0 ) {
		for ( int i = 0; i < formIDs.length; i++ ) {
		    ids.add( formIDs[ i ] );
		}
	    }
	}

	if ( ids == null || ids.isEmpty() ) {
	    throw new InvalidFormException( "No records selected for " +
					    "download" );
	}
    
	DBWriteManager connectionPool = null;
	DBconnection conn = null;
	String downloadText = null;	

	try {

	    String sessionID = request.getSession().getId();
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.getSearchConnection();

	    ExprSearcher searcher = new ExprSearcher();
	    ExprSummary[] records = searcher.getSelected( conn, 
							  ids, 
							  query_id );
      
	    if ( records != null && records.length > 0 ) {
		StringBuffer export = new StringBuffer();

		// get header from first element in results
		export.append( records[ 0 ].getExportHeader() );
		for ( int i = 0; i < records.length; i++ ) {
		    export.append( records[ i ].createExport() );
		}
		downloadText = export.toString();
	    }

	    response = new RequestHandlerResponse();
	    response.setPage( "/jsp/common/download.jsp" );
	    response.setAttribute( "downloadText", downloadText );
      
	} catch ( NumberFormatException nfe ) {
	    throw new InvalidParameterException( "Invalid id: " + 
						 nfe.getMessage() );
      
	} finally {
	    connectionPool.return_connection( conn );
	}
	return response;
    }

}

