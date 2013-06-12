/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.DateWebFormField;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;

/**
  * EcotypeSearchHandler handles all search functions for ecotypes. When searching,
  * EcotypeSearchHandler uses the <code>SearchSession</code> object to create
  * a temp table to hold an individual user's ecotype search results. With these
  * stored results, user can easily scroll through a large result set through
  * subsequent requests to EcotypeSearchHandler.
  *
  * <p>
  * EcotypeSearchHandler uses <code>EcotypeSearcher</code> to perform initial search,
  * to retrieve pages of results when scrolling through results, and to retrieve
  * ecotype info. when download option is selected.
  */

public class EcotypeSearchHandler implements RequestHandler {   
  private String searchType = "ecotype";
  

  /**
   * Creates an instance of EcotypeSearchHandler
   */
  public EcotypeSearchHandler() { }


  /**
   * Processes servlet request to perform requested action.  Method  uses the 
   * "action" parameter in the submitted <code>HttpServletRequest</code>
   * to determine what action is appropriate.  The possible values of action are:
   * <ul>
   * <li>search - Search parameters are retrieved from request and passed
   * to EcotypeSearcher for searching</li>
   * <li>re_search - Requested page number of multiple page result set is
   * retrieved from request and passed to EcotypeSearcher to receive requested
   * page of results</li>
   * <li>download - Marked search results are retrieved from request and information
   * is collected into tab-delimited format for download</li>
   * </ul>
   * 
   * <p>Results of search and re_search are returned as a <code>SearchResultsCollection</code>
   * containing an array of <code>EcotypeSummary</code> objects, as well as scrolling 
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
    private RequestHandlerResponse search( HttpServletRequest request, boolean firstSearch ) 
    throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
        RequestHandlerResponse response = null;
        SearchSession searchSession = null;
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        ScrollParams scrollParams = null;
        SearchResultsCollection searchCollection = null;
        EcotypeSearcher searcher = null;
        Map searchParams = null;
        String query_id = "";

        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            scrollParams = ScrollCalculator.getScrollParams( request );
            searcher = new EcotypeSearcher();

            // if first time through this search, populate temp table & get 1st page of results      
            if ( firstSearch ) {
	            searchParams = getSearchParams( request, conn ); 
	            searchParams.put( "sessionID", request.getSession( true ).getId() );
	            
                String insert_query = searcher.generateInsertLine( conn, searchParams, "form");
                if (MasterTableInfo.queryIDExists (insert_query, conn ) ){
                    firstSearch = false;
                }
                query_id = MasterTableInfo.getQueryID (insert_query, conn, searchType );

                searchSession = SessionHandler.getSearchSession( request, conn, searchType ); // register search w/SearchSession
	            searchParams.put("query_id", query_id );
                searchSession.setSearchCriteria( query_id, searchParams );
	
            } else {	// else get requested slice of result set already stored in temp table
	            searchSession = SessionHandler.getSearchSession( request ); // get search data from session 
	            if ( searchSession != null && searchSession.searchInProgress( searchType ) ){
	                if ( !TextConverter.isEmpty (request.getParameter("query_id") ) ){
                        query_id = (String) request.getParameter("query_id");
                        searchParams = searchSession.getSearchCriteria( query_id );
                        if (searchParams == null ) {
                            throw new SessionOutOfTimeException( "No ecotype search in progress ");
                        }
                    }else{
                        throw new SessionOutOfTimeException( "No ecotype ssarch in progress ");
                    }
                                                                            
	                // check for any items selected for download and save in searchSession until download is selected action
	                if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
	                    Long[] ids = TextConverter.stringToLongArray( request.getParameterValues( "id" ) );
	                    searchSession.addDownload( searchType, ids );
	                }

	            } else {
	                throw new SessionOutOfTimeException( "No ecotype search in progress" );
	            }
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



  // Translate single form field to boolean value
  private void checkBoolean( HttpServletRequest request, Map searchParams, String fieldName ) {
    if ( !TextConverter.isEmpty( request.getParameter( fieldName ) ) && request.getParameter( fieldName ).equals( "true" ) ) {
      searchParams.put( fieldName, new Boolean( true ) );
    } else {
      searchParams.put( fieldName, new Boolean( false ) );
    }
  }
  
  
  // retrieve search params from request
  private Map getSearchParams( HttpServletRequest request, DBconnection conn ) throws SQLException, InvalidFormException { 
    HashMap searchParams = new HashMap();
    HashMap errors = new HashMap();
    
    try {

      // taxon value may be "hybrid", which isn't an actual taxon name --
      // if hybrid is selected, populate boolean value to flag EcotypeSearcher
      // and set "hybrid" as display value for taxon; if hybrid not selected,
      // taxon_id was submitted - create value as Long & retrieve taxon name
      // for display
      //
      // UPDATE 3.6.2003 -- Long story, but Hybrid is now an entry in Taxon table, so
      // disregard logic for hybridTaxon and just blindly search for submitted taxon id
      String formTaxon = request.getParameter( "taxon" );
      if ( !TextConverter.isEmpty( formTaxon ) ) {
	//Boolean hybridTaxon = new Boolean( ( formTaxon.equals( "hybrid" ) ) );
	//searchParams.put( "hybridTaxon", hybridTaxon );
	
	//if ( !hybridTaxon.booleanValue() ) {
	  Long id =  new Long( formTaxon );
	  searchParams.put( "taxon_id", id );
	  searchParams.put( "taxon_name", TfcTaxon.get_scientific_name( conn, id ) );
	  //} else {
	  //searchParams.put( "taxon_name", "hybrid" );
	  //	}
	  
      }
    } catch ( NumberFormatException nfe ) {
      errors.put( "taxon", "Invalid taxon id: " + nfe.getMessage() );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "name_1" ) ) ) {
      searchParams.put( "name_type_1", request.getParameter( "name_type_1" ) );
      searchParams.put( "name_1", request.getParameter( "name_1" ).trim() );
      searchParams.put( "method_1", request.getParameter( "method_1" ) );
    }
       
    if ( !TextConverter.isEmpty( request.getParameter( "name_2" ) ) ) {
      searchParams.put( "name_type_2", request.getParameter( "name_type_2" ) );
      searchParams.put( "name_2", request.getParameter( "name_2" ).trim() );
      searchParams.put( "method_2", request.getParameter( "method_2" ) );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "name_3" ) ) ) {
      searchParams.put( "name_type_3", request.getParameter( "name_type_3" ) );
      searchParams.put( "name_3", request.getParameter( "name_3" ).trim() );
      searchParams.put( "method_3", request.getParameter( "method_3" ) );
    }

    // translate checkbox submission into Boolean object
    checkBoolean( request, searchParams, "is_abrc_stock" );
    
    
    if ( !TextConverter.isEmpty( request.getParameter( "collector" ) ) ) {
      searchParams.put( "collector", request.getParameter( "collector" ).trim() );
      searchParams.put( "collector_method", request.getParameter( "collector_method" ) );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "country" ) ) ) {
      searchParams.put( "country", request.getParameter( "country" ) );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "location" ) ) ) {
      searchParams.put( "location", request.getParameter( "location" ).trim() );
      searchParams.put( "location_method", request.getParameter( "location_method" ) );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "habitat" ) ) ) {
      searchParams.put( "habitat", request.getParameter( "habitat" ).trim() );
      searchParams.put( "habitat_method", request.getParameter( "habitat_method" ) );
    }

    try {

      // Translate collection date params into java.util.Date values of
      // 1/1/[submitted_year] and 12/31/[submitted_year] suitable for searching - 
      // easily done using DateWebFormField. 
      if ( !TextConverter.isEmpty( request.getParameter( "year_collected_from" ) ) ) {
	String fromDate =  "1/1/" + request.getParameter( "year_collected_from" );
	searchParams.put( "year_collected_from", DateWebFormField.parseDate( fromDate ) );
      }
      
      /*
	Manually set to date param time to last second (23:59:59) of last day of 
	submitted year so that when searching for items altered before that date,
	items altered on that date will get caught. A little awkward, but necessary 
	because vanilla translation of string value (by Sybase) to simple date format
	will set time as midnight *beginning* the day, when we need it for ending the day
      */
      if ( !TextConverter.isEmpty( request.getParameter( "year_collected_to" ) ) ) {
	String toDate = "12/31/" + request.getParameter( "year_collected_to" );
	java.util.Date toDateObj = DateWebFormField.parseDate( toDate );
	GregorianCalendar now = new GregorianCalendar();
	now.setTime( toDateObj );
	now.set( Calendar.HOUR_OF_DAY, 23 );
	now.set( Calendar.MINUTE, 59 );
	now.set( Calendar.SECOND, 59 );
	toDateObj = now.getTime();
	searchParams.put( "year_collected_to", toDateObj );
      }

      searchParams.put( "year_collected_method", request.getParameter( "year_collected_method" ) );

    } catch ( InvalidParameterException ipe ) {
      errors.put( "Time Restriction", ipe.getMessage() );
    }

    if ( request.getParameter( "order" ) != null ) {
      searchParams.put( "order", request.getParameter( "order" ) );
    }

    /*
      Range parameters will require a db re-design to accomodate numeric comparison -
      comment out & save for now

    if ( !TextConverter.isEmpty( request.getParameter( "altitude_from" ) ) || 
	 !TextConverter.isEmpty( request.getParameter( "altitude_to" ) ) ) {
      searchParams.put( "altitude_method", request.getParameter( "altitude_method" ) );
      searchParams.put( "altitude_from", request.getParameter( "altitude_from" ) );
      searchParams.put( "altitude_to", request.getParameter( "altitude_to" ) );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "latitude_from" ) ) || 
	 !TextConverter.isEmpty( request.getParameter( "latitude_to" ) ) ) {
      searchParams.put( "latitude_method", request.getParameter( "latitude_method" ) );
      searchParams.put( "latitude_from", request.getParameter( "latitude_from" ) );
      searchParams.put( "latitude_to", request.getParameter( "latitude_to" ) );
    }

    if ( !TextConverter.isEmpty( request.getParameter( "longitude_from" ) ) || 
	 !TextConverter.isEmpty( request.getParameter( "longitude_to" ) ) ) {
      searchParams.put( "longitude_method", request.getParameter( "longitude_method" ) );
      searchParams.put( "longitude_from", request.getParameter( "longitude_from" ) );
      searchParams.put( "longitude_to", request.getParameter( "longitude_to" ) );
    }
    */

    if ( errors != null && !errors.isEmpty() ) {
      throw new InvalidFormException( errors, "Errors on form submission" );
    }
    
    return searchParams;
  }


  private RequestHandlerResponse download( HttpServletRequest request ) throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
    Long[] formIDs;
    StringBuffer export = null;
    String downloadText = null;
    EcotypeSummary[] records = null;
    EcotypeSearcher searcher = null;
    DBReadManager connectionPool = null;
    DBconnection conn = null;
    String sessionID = null;
    RequestHandlerResponse response = null;
    List ids = null;
    SearchSession searchSession = null;

    searchSession = SessionHandler.getSearchSession( request );
    String query_id = (String) request.getParameter("query_id");

    if ( searchSession == null || !searchSession.searchInProgress( searchType ) || query_id == null ) {
      throw new SessionOutOfTimeException( "No ecotype search in progress" );
    } else {
      ids = searchSession.getDownload( searchType ); // get any items selected on previous pages
      if ( ids == null ) {
	ids = new ArrayList();
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
      sessionID = request.getSession().getId();
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      searcher = new EcotypeSearcher();
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
