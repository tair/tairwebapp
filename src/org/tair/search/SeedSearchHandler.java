/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.dna.StockSummary;
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
  * SeedSearchHandler handles search functions for seed stocks. When searching,
  * SeedSearchHandler uses the <code>SearchSession</code> object to create
  * a temp table to hold an individual user's seed search results. With these
  * stored results, user can easily scroll through a large result set through
  * subsequent requests to SeedSearchHandler.
  *
  * <p>
  * Since there is no stand alone seed search, SeedSearchHandler is used to
  * allow users to scroll through seed results after initial search has been
  * performed by SeedSearcher as part of the general search, or to scroll through
  * all member stocks of a stock pool or set
  */

public class SeedSearchHandler implements RequestHandler {   
  private String searchType = "seed";  

  /**
   * Creates an instance of SeedSearchHandler
   */
  public SeedSearchHandler() { }


  /**
   * Processes servlet request to perform requested action.  Method  uses the 
   * "search_action" parameter in the submitted <code>HttpServletRequest</code>
   * to determine what action is appropriate.  The possible values of search_action are:
   * <ul>
   * <li>search - Should only be called to display member stocks of a stock pool or
   * set; temp table will be populated and first page of results will be returned
   * <li>re_search - Requested page number of multiple page result set is
   * retrieved from request and passed to GermplasmSearcher to receive requested
   * page of results</li>
   * <li>download - Marked search results are retrieved from request and information
   * is collected into tab-delimited format for download
   * </ul>
   * 
   * <p>Results of re_search are returned as a <code>SearchResultsCollection</code>
   * containing an array of <code>StockSummary</code> objects, as well as scrolling 
   * params, link and plain text explanation of search parameters used to construct result set
   *
   * @param request HttpServletRequest passed from SearchServlet
   * @return RequestHandlerResponse containing URL of JSP to forward to, and any
   * search results objects that may have resulted from request
   * @exception SQLException thrown if a database error occurs while searching
   * @exception InvalidParameterException thrown if an invalid search action is requested, or
   * an invalid id is submitted for download
   * @exception InvalidFormException thrown if no items selected for download
   * @exception SessionOutOfTimeException thrown when re_searching if no protein search is in progress
   */  
  public RequestHandlerResponse process( HttpServletRequest request ) throws SQLException, InvalidParameterException, InvalidFormException, SessionOutOfTimeException {

    String action = request.getParameter( "search_action" );
    RequestHandlerResponse response = null;
    
    if ( action != null && action.equals( "search" ) ) {
      response = search( request, true );
    } else if ( action != null && action.equals( "re_search" ) ) {
      response = search( request, false );
      
    } else if ( action != null && action.equals( "download" ) ) {
      response = download( request );

    } else {
      throw new InvalidParameterException( "Invalid search action requested: " + action );
    }
    return response;
  }


  // retrieve search and scroll parameters to execute search and return selected slice of result set
  private RequestHandlerResponse search( HttpServletRequest request, boolean firstSearch ) throws SQLException, InvalidParameterException, SessionOutOfTimeException {
    RequestHandlerResponse response = null;
    SearchSession searchSession = null;
    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    ScrollParams scrollParams = null;
    SearchResultsCollection searchCollection = null;
    SeedSearcher searcher = null;
    Map<String, Object> searchParams = null;

  
    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();
      scrollParams = ScrollCalculator.getScrollParams( request );
      searcher = new SeedSearcher();
      String query_id = "";

      if ( firstSearch ) { // will be true if viewing member stocks of stock pool or set
	        // SessionHandler will automatically register search with SearchSession if not done already
	        searchSession = SessionHandler.getSearchSession( request, conn, searchType );
	        searchParams = getSearchParams( request );
            
            //register with search Session
            String insert_query = searcher.generateInsertLine( conn, searchParams, "form");
            if (MasterTableInfo.queryIDExists( insert_query, conn) ){
                firstSearch = false;
            }
            query_id = MasterTableInfo.getQueryID( insert_query, conn, searchType );

	        searchParams.put( "query_id", query_id);
            searchSession.setSearchCriteria( query_id, searchParams );

      } else {	// get requested slice of result set already stored in temp table
	
	        searchSession = SessionHandler.getSearchSession( request ); // get search data from session 
	        if ( searchSession != null && searchSession.searchInProgress( searchType ) ){
	            query_id = (String) request.getParameter( "query_id" );
                searchParams = searchSession.getSearchCriteria( query_id );
                if (searchParams == null ) { 
	                throw new SessionOutOfTimeException( "No seed search in progress" );
	            }
                // check for any items selected for download and save in searchSession until download is selected action
	            if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
	                Long[] ids = TextConverter.stringToLongArray( request.getParameterValues( "id" ) );
	                searchSession.addDownload( query_id, ids );
	            }
	
	        } else {
	            throw new SessionOutOfTimeException( "No seed search in progress" );
	        }
            searchParams.put( "query_id", query_id );
      }

      searchCollection = searcher.search( conn, searchParams, scrollParams, firstSearch );
      response = new RequestHandlerResponse();
      response.setAttribute( "searchCollection", searchCollection );
      response.setAttribute( "query_id", query_id );
      response.setPage( searchCollection.getResultsPage() );
      
    } finally {
      if ( conn != null ) {
	connectionPool.return_connection( conn );
      }
    }
    return response;
  }


  // retrieve search params from request -- since there is no stand alone search form, this
  // should only yield parent stock pool/set info. to use for creating list of member stocks
  private Map<String, Object> getSearchParams( HttpServletRequest request ) throws InvalidParameterException {
    HashMap<String, Object> searchParams = new HashMap<String, Object>();
    
    // transform id to Long and save parent name for future display of search criteria
    try {
      if ( !TextConverter.isEmpty( request.getParameter( "parent_id" ) ) ) {
	searchParams.put( "parent_id", new Long( request.getParameter( "parent_id" ) ) );
	searchParams.put( "parent_name", request.getParameter( "parent_name" ) );
      } else {
	throw new InvalidParameterException( "Invalid parent tair object id: null" );
      }

    } catch ( NumberFormatException nfe ) {
      throw new InvalidParameterException( "Invalid parent tair object id: " + nfe.getMessage() );
    }

    return searchParams;
  }


  private RequestHandlerResponse download( HttpServletRequest request ) throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
    Long[] formIDs;
    StringBuffer export = null;
    String downloadText = null;
    StockSummary[] records = null;
    SeedSearcher searcher = null;
    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    String session_id = null;
    RequestHandlerResponse response = null;
    List<Long> ids = null;
    SearchSession searchSession = null;

    searchSession = SessionHandler.getSearchSession( request );
    String query_id = (String) request.getParameter("query_id");
    if ( searchSession == null || !searchSession.searchInProgress( searchType ) || query_id == null) {
      throw new SessionOutOfTimeException( "No seed search in progress" );
    } else {
      ids = searchSession.getDownload( query_id ); // get any items selected on previous pages
      if ( ids == null ) {
	ids = new ArrayList<Long>();
      }
    }

    // combine previously selected with selections from current page
    if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
      formIDs = TextConverter.stringToLongArray( request.getParameterValues( "id" ) );
      if ( formIDs != null && formIDs.length > 0 ) {
	for ( int i = 0; i < formIDs.length; i++ ) {
	  ids.add( formIDs[ i ] );
	}
      }
    }

    if ( ids == null || ids.isEmpty() ) {
      throw new InvalidFormException( "No records selected for download" );
    }
    
    try {
      session_id = request.getSession().getId();
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();
      searcher = new SeedSearcher();
      records = searcher.getSelected( conn, ids, query_id );
      
      if ( records != null && records.length > 0 ) {
	export = new StringBuffer();
	export.append( records[ 0 ].getExportHeader() ); // get header from first element in results
	for ( int i = 0; i < records.length; i++ ) {
	  export.append( records[ i ].createExport() );
	}
	downloadText = export.toString();
      }

      response = new RequestHandlerResponse();
      response.setPage( "/jsp/common/download.jsp" );
      response.setAttribute( "downloadText", downloadText );
      
    } catch ( NumberFormatException nfe ) {
      throw new InvalidParameterException( "Invalid id: " + nfe.getMessage() );
      
    } finally {
      if ( conn != null ) {
	connectionPool.return_connection( conn );
      }
    }
    return response;
  }

}
