/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAssemblyUnit;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;

/**
  * GeneticMarkerSearchHandler handles all search functions for genetic markers. When searching,
  * GeneticMarkerSearchHandler uses the <code>SearchSession</code> object to create
  * a temp table to hold an individual users genetic marker search results. With these
  * stored results, user can easily scroll through a large result set through
  * subsequent requests to GeneticMarkerSearchHandler.
  *
  * <p>
  * GeneticMarkerSearchHandler uses <code>GeneticMarkerSearcher</code> to perform initial search,
  * to retrieve pages of results when scrolling through results, and to retrieve
  * genetic marker info. when download option is selected.
  */

public  class GeneticMarkerSearchHandler implements RequestHandler {   
  private String searchType = "marker";

  public GeneticMarkerSearchHandler() { }

  /**
   * Processes servlet request to perform requested action.  Method  uses the 
   * "action" parameter in the submitted <code>HttpServletRequest</code>
   * to determine what action is appropriate.  The possible values of action are:
   * <ul>
   * <li>search - Search parameters are retrieved from request and passed
   * to GeneticMarkerSearcher for searching</li>
   * <li>re_search - Requested page number of multiple page result set is
   * retrieved from request and passed to GeneticMarkerSearcher to receive requested
   * page of results</li>
   * <li>download - Marked genetic markers are retrieved from request and information
   * is collected into tab-delimited format for download
   * </ul>
   * 
   * <p>Results of search and re_search are returned as a <code>SearchResultsCollection</code>
   * containing an array of <code>GeneticMarkerSummary</code> objects as well as scrolling params, links
   * and plain text explanation of search parameters used to construct result set
   *
   * @param request HttpServletRequest passed from SearchServlet
   * @return RequestHandlerResponse containing URL of JSP to forward to, and any
   * search results objects that may have resulted from request
   * @exception SQLException thrown if a database error occurs while searching
   * @exception InvalidParameterException thrown if an invalid search action isrequested, or
   * an invalid genetic marker id is submitted for download
   * @exception InvalidFormException thrown if no genetic markers selected for download
   * @exception SessionOutOfTimeException thrown when re_searching if no genetic marker search is in progress
   */ 
  public RequestHandlerResponse process( HttpServletRequest request ) throws SQLException, InvalidParameterException, InvalidFormException, SessionOutOfTimeException {
    // action might be in "action" or "search_action"  - summary pages use
    // search action because of conflicts with form.action attribute in javascript in Mac IE 4.5
    String action = request.getParameter( "action" );
    if ( action == null ) {
      action = request.getParameter( "search_action" );
    }


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
    private RequestHandlerResponse search( HttpServletRequest request, boolean firstSearch ) throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
        RequestHandlerResponse response = null;
        SearchSession searchSession = null;
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        ScrollParams scrollParams = null;
        SearchResultsCollection searchCollection = null;
        GeneticMarkerSearcher searcher = null;
        Map searchParams = null;
        String query_id = "";
    
        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            scrollParams = ScrollCalculator.getScrollParams( request );
            searcher = new GeneticMarkerSearcher();

            // if first time through this search, populate temp table & get 1st page of results      
            if ( firstSearch ) {

	            // create search data that persists in session
	            searchParams = getSearchParams( request, conn );
	            searchParams.put( "sessionID", request.getSession( true ).getId() );
                
                //register with searchSession
                String insert_query = searcher.generateInsertLine(conn, searchParams, "form" );
                if ( MasterTableInfo.queryIDExists (insert_query, conn) ){
                    firstSearch = false;
                }
                query_id = MasterTableInfo.getQueryID( insert_query, conn, searchType );

	            // SessionHandler will automatically register search with SearchSession if not done already
	            searchSession = SessionHandler.getSearchSession( request, conn, searchType );
	            searchParams.put("query_id", query_id);
                
                searchSession.setSearchCriteria( query_id, searchParams );
	            searchCollection = searcher.search( conn, searchParams, scrollParams, true );
	
	            // else get requested slice of result set already stored in temp talble
            } else {
	            // get search data from session 
	            searchSession = SessionHandler.getSearchSession( request );
	
	            if ( searchSession != null && searchSession.searchInProgress( searchType ) ) {
	                query_id = (String) request.getParameter("query_id");
                    searchParams = searchSession.getSearchCriteria( query_id );
	                if (searchParams == null || query_id == null || query_id == "") { 
                        throw new SessionOutOfTimeException ("No marker search in progress");
                    }
                    
                    searchCollection = searcher.search( conn, searchParams, scrollParams, false );
	  
	                // check for any items selected for download and save in searchSession until download is selected action
	                if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
	                    Long[] ids = TextConverter.stringToLongArray( request.getParameterValues( "id" ) );
	                    searchSession.addDownload( query_id, ids );
	                }
	  
	            } else {
	                throw new SessionOutOfTimeException( "No genetic marker search in progress" );
	            }
            }
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


  // retrieve search params from request  
  private Map getSearchParams( HttpServletRequest request, DBconnection conn ) throws InvalidFormException, SQLException {  
    HashMap searchParams = new HashMap(); 
    HashMap errors = new HashMap();
   

    if ( !TextConverter.isEmpty( request.getParameter( "name" ) ) ) {
      searchParams.put( "name", request.getParameter( "name" ) );
      searchParams.put( "name_type", request.getParameter( "name_type" ) );
      searchParams.put( "method", request.getParameter( "method" ) );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "marker_type" ) ) ) {
      searchParams.put( "marker_type", request.getParameterValues( "marker_type" ) );

    }
	    	    	    
    boolean isPCR = ( request.getParameter( "is_PCR" ) != null && 
		      request.getParameter( "is_PCR" ).equals( "true" ) );
    searchParams.put( "is_PCR", new Boolean( isPCR ) );


    if ( request.getParameter( "map_element_type" ) != null ){
      searchParams.put( "map_element_type", "repeat" );
    }
	    
    if ( request.getParameter( "low_ecotype" ) != null ){
      searchParams.put( "low_ecotype", request.getParameter( "low_ecotype" ) );
    }

    if ( request.getParameter( "high_ecotype" ) != null ){
      searchParams.put( "high_ecotype", request.getParameter( "high_ecotype" ) );
    }

      
    if ( !TextConverter.isEmpty( request.getParameter( "limit_time" ) ) ) {
      GregorianCalendar now = new GregorianCalendar();
      now.add( Calendar.MONTH, -2 ); // set month back two months
      java.util.Date date = now.getTime();
      searchParams.put( "limit_time", date );
    }
     

    // If assembly unit info specified, search is coming from assembly unit detail page
    if ( !TextConverter.isEmpty( request.getParameter( "assembly_map_element_id" ) ) ) {
      try {
	Long id = new Long( request.getParameter( "assembly_map_element_id" ) );
	searchParams.put( "assembly_map_element_id", id );

	// get assembly unit name for display on results pages
	String name = TfcAssemblyUnit.retrieveMapElementName( conn, id );
	searchParams.put( "assembly_unit_name", name );

      } catch ( NumberFormatException nfe ) {
	errors.put( "assembly unit map element id", nfe.getMessage() );
      }
    }

 
    String order = null;
    if ( request.getParameter( "order" ) != null ){
      order = request.getParameter( "order" );
      searchParams.put( "order", order );
    }
      
    String chromosome = null; 
    if ( !TextConverter.isEmpty( request.getParameter( "chromosome" ) ) ) {
      chromosome = request.getParameter( "chromosome" );
      searchParams.put( "chromosome", chromosome );
    }
      
    String map_type = null;
    if ( !TextConverter.isEmpty( request.getParameter( "map_type" ) ) ) {
      map_type = request.getParameter( "map_type" );
      searchParams.put( "map_type", map_type );
    }
      
    String low_range = null;
    String high_range = null;
    if ( !TextConverter.isEmpty( request.getParameter( "low_range" ) ) ) {
      low_range = request.getParameter( "low_range" );
      searchParams.put( "range_type", request.getParameter( "range_type" ) );
      searchParams.put( "low_unit", request.getParameter( "low_unit" ) );
      searchParams.put( "low_range",low_range );
    }	    

    if ( !TextConverter.isEmpty( request.getParameter( "high_range" ) ) && !( request.getParameter( "high_range" ) ).trim().equals( "--unused--" ) ) {
      high_range =request.getParameter( "high_range" );
      searchParams.put( "range_type",request.getParameter( "range_type" ) );
      searchParams.put( "high_unit",request.getParameter( "high_unit" ) );
      searchParams.put( "high_range",high_range );
    }
    
    if ( ( low_range != null || high_range != null ) && map_type == null ) {
      errors.put( "map type", "Map type must be specified to search by map location range" );
    }

    // translate assignments from input to searchable assignment values 
    // if searching by map location
    if ( Units.validMapType( (String) searchParams.get( "map_type" ) ) ) {
      Units units = new Units( conn, searchParams );
      searchParams.put( "units", units );
    } 

    if ( ( order != null && order.equalsIgnoreCase( "position" ) ) && map_type == null ) {
      errors.put( "map type", "Map type must be specified when ordering by position" );
    }

    if ( errors != null && !errors.isEmpty() ) {
      throw new InvalidFormException( errors, "Errors on form submission" );
    }

    return searchParams;
  } 


  // collect information for each selected genetic marker and create tab-delimited export string for download
  private RequestHandlerResponse download( HttpServletRequest request ) throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
    Long[] formIDs;
    StringBuffer export = null;
    GeneticMarkerSummary[] markers = null;
    GeneticMarkerSearcher searcher = null;
    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    RequestHandlerResponse response = null;
    SearchSession searchSession = null;
    Map searchParams = null;
    Vector ids = null;

    // get search data from session -- needed for restricting Assignments by map type and/or chromosome
    searchSession = SessionHandler.getSearchSession( request );
    String query_id = (String) request.getParameter("query_id");
    
    if ( searchSession != null && searchSession.searchInProgress( searchType ) ) {
      searchParams = searchSession.getSearchCriteria( query_id );
      ids = searchSession.getDownload( searchType ); // get any markers selected on previous pages
      if ( ids == null ) {
	ids = new Vector();
      }
    } else {
      throw new SessionOutOfTimeException( "No genetic marker search in progress" );
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
      throw new InvalidFormException( "No genetic markers selected for download" );
    }
    
    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();
      searcher = new GeneticMarkerSearcher();
      markers = searcher.getSelected( conn, ids, searchParams, query_id );
      export = new StringBuffer();
      
      if ( markers != null && markers.length > 0 ) {
	export.append( markers[ 0 ].getExportHeader() ); // get header from first element in results
	for ( int i = 0; i < markers.length; i++ ) {
	  export.append( markers[ i ].createExport() );
	}
      }
      
      response = new RequestHandlerResponse();
      response.setPage( "/jsp/common/download.jsp" );
      response.setAttribute( "downloadText", export.toString() );

    } catch ( NumberFormatException nfe ) {
      throw new InvalidParameterException( "Invalid genetic marker id: " + nfe.getMessage() );

    } finally {
      if ( conn != null ) {
	connectionPool.return_connection( conn );
      }

    }
    return response;
  }

}
