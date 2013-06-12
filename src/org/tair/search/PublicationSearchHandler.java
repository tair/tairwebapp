//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.20 $
// $Date: 2004/04/26 17:05:21 $
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
import org.tair.tfc.DBReadManager;
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
  * PublicationSearchHandler handles all search functions for publications. 
  * When searching, PublicationSearchHandler uses the <code>SearchSession</code> 
  * object to create a temp table to hold an individual users publication search 
  * results. With these stored results, user can easily scroll through a large 
  * result set through subsequent requests to PublicationSearchHandler.
  *
  * <p>
  * PublicationSearchHandler uses <code>PublicationSearcher</code> to perform 
  * initial search, to retrieve pages of results when scrolling through results, 
  * and to retrieve publication info. when download option is selected.
  */

public  class PublicationSearchHandler implements RequestHandler {   


    /**
     * Processes servlet request to perform requested action.  Method  uses the 
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of action 
     * are:
     *
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to PublicationSearcher for searching</li>
     * <li>re_search - Requested page number of multiple page result set is
     * retrieved from request and passed to PublicationSearcher to receive 
     * requested page of results</li>
     * <li>download - Marked publications are retrieved from request and 
     * information is collected into tab-delimited format for download
     * </ul>
     *
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing URL of JSP to forward to, and
     * any search results objects that may have resulted from request
     * @throws SQLException thrown if a database error occurs while searching
     * @throws InvalidParameterException thrown if an invalid search action is 
     * requested, or an invalid publication id is submitted for download
     * @throws InvalidFormException thrown if no publications selected for 
     * download
     * @throws SessionOutOfTimeException thrown when re_searching if no 
     * publication search is in progress
     */   
    public RequestHandlerResponse process( HttpServletRequest request ) 
        throws SQLException, InvalidParameterException, InvalidFormException,
               SessionOutOfTimeException {

        // action might be in "action" or "search_action"  - summary pages use
        // search action because of conflicts with form.action attribute in 
        // javascript in Mac IE 4.5
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
            throw new InvalidParameterException( "Invalid search action " +
						 "requested: " + action );
        }
        return response;
    }


    /**
     * Returns literal value of search type prefix used
     * for creating temp tables in publication search and
     * for registering and retrieving items from SearchSession
     *
     * @return literal value of publication search type prefix
     * (should be "pub")
     */
    public static String getSearchType() {
        return "pub";
    }


    /**
     * Retrieves search and scroll parameters to execute search and return 
     * selected slice of result set
     */
    private RequestHandlerResponse search( HttpServletRequest request, 
                                           boolean firstSearch ) 
        throws SQLException, InvalidFormException, InvalidParameterException, 
               SessionOutOfTimeException {

        RequestHandlerResponse response = null;
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        String query_id = "";

        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            ScrollParams scrollParams = 
		    ScrollCalculator.getScrollParams( request );
            PublicationSearcher searcher = new PublicationSearcher();

            // if first time through this search, populate temp table & get 1st 
            // page of results      

	        Map searchParams = null;
	        SearchSession searchSession = null;

            if ( firstSearch ) {
                searchParams = getSearchParams( request ); 
                searchParams.put( "sessionID", 
				  request.getSession( true ).getId() );

                // register search w/SearchSession
                String insert_query = searcher.generateInsertLine( conn, searchParams, "form");
                System.out.println("query exists : " + MasterTableInfo.queryIDExists( insert_query, conn ));
                if ( MasterTableInfo.queryIDExists (insert_query, conn) ){
                    firstSearch = false;
                }
                    
                query_id = MasterTableInfo.getQueryID( insert_query, conn, getSearchType() );

                searchSession = 
		            SessionHandler.getSearchSession( request, conn, getSearchType() ); 
                searchParams.put ("query_id", query_id );
                
                //setting the search criteria by query_id instead of by type
                searchSession.setSearchCriteria( query_id, searchParams );
        
            // else get requested slice of result set already stored in 
		    // temp table
            } else {
                // get search data from session 
                searchSession = SessionHandler.getSearchSession( request );

                if ( searchSession != null && 
		        searchSession.searchInProgress( getSearchType() ) ) {
                    
                    if ( !TextConverter.isEmpty (request.getParameter("query_id") ) ){
                        query_id = (String) request.getParameter("query_id");
                        searchParams = searchSession.getSearchCriteria( query_id );
                    } else {
                        throw new SessionOutOfTimeException( "No publication " + 
                            "search in progress" );
                    }
                    searchParams.put ("query_id", query_id );

                    // Check for any items selected for download and save 
		            // in searchSession
                    saveSelectedItems( request, searchSession );

                } else {
                    throw new SessionOutOfTimeException( "No publication " +
							 "search in progress" );
                }
            }
	    
            SearchResultsCollection searchCollection = 
		    searcher.search( conn, 
				 searchParams, 
				 scrollParams, 
				 firstSearch );
	    
            response = new RequestHandlerResponse();
            response.setAttribute("query_id", query_id );
            response.setAttribute( "searchCollection", searchCollection );
            response.setPage( searchCollection.getResultsPage() );

      
        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }
        return response;
    }


    /**
     * Saves any reference ids selected on search results page for 
     * future download or use in community publication association
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
    private void saveSelectedItems( HttpServletRequest request, 
                                    SearchSession searchSession ) 
        throws InvalidParameterException {
        
        if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {


            // transform submitted reference ids into Long and
            // save in search session until needed for download
            // or associating to community record
            String[] formIDs = request.getParameterValues( "id" );
            Long[] ids = TextConverter.stringToLongArray( formIDs );
            searchSession.addDownload( getSearchType(), ids );
        }        
    }



    /**
     * Retrieve search params from request    
     */
    private Map getSearchParams( HttpServletRequest request ) 
	throws InvalidParameterException {

        HashMap searchParams = new HashMap();
        KeywordSearchHelper ksh = new KeywordSearchHelper();

        if ( !TextConverter.isEmpty( request.getParameter( "term1" ) ) ) {
            searchParams.put( "type1", request.getParameter( "type1" ) );
            searchParams.put( "term1", request.getParameter( "term1" ).trim() );
            searchParams.put( "method1", request.getParameter( "method1" ) );
        }
    
        if ( !TextConverter.isEmpty( request.getParameter( "term2" ) ) ) {
            searchParams.put( "type2", request.getParameter( "type2" ) );
            searchParams.put( "term2", request.getParameter( "term2" ).trim() );
            searchParams.put( "method2", request.getParameter( "method2" ) );
        }
    
        if ( !TextConverter.isEmpty( request.getParameter( "term3" ) ) ) {
            searchParams.put( "type3", request.getParameter( "type3" ) );
            searchParams.put( "term3", request.getParameter( "term3" ).trim() );
            searchParams.put( "method3", request.getParameter( "method3" ) );
        }
    

	// convert submitted value for to/from year into Integer for searching
        String formValue = request.getParameter( "from" );
        if ( !TextConverter.isEmpty( formValue ) ) {
	    searchParams.put( "from", new Integer( formValue ) );
	}
    
        formValue = request.getParameter( "to" );
        if ( !TextConverter.isEmpty( formValue ) ) {
	    searchParams.put( "to", new Integer( formValue ) );
	}
    
        if ( request.getParameter( "publication_type" ) != null ) {
            searchParams.put( "publication_type", 
			      request.getParameter( "publication_type" ) );
        }
    
        if ( request.getParameter( "sort" ) != null ){
            searchParams.put( "sort", request.getParameter( "sort" ) );
        }


	// publication search can be called from gene or locus detail
	// page to show full list of associated publications 
	String reqID = null;
	try {
	    Long tairObjID = null;

	    reqID = request.getParameter( "gene_tair_object_id" );
	    if ( !TextConverter.isEmpty( reqID ) ) {
		
		tairObjID = new Long( reqID );
		searchParams.put( "gene_tair_object_id", tairObjID );
		
		// name should be included for display of search criteria
		searchParams.put( "gene_name", 
				  request.getParameter( "gene_name" ) );

	    }

	    reqID = request.getParameter( "locus_tair_object_id" );
	    if ( !TextConverter.isEmpty( reqID ) ) {
		tairObjID = new Long( reqID );
		searchParams.put( "locus_tair_object_id", tairObjID );
		searchParams.put( "locus_name",
				  request.getParameter( "locus_name" ) );
	    }

	} catch ( NumberFormatException nfe ) {
	    throw new InvalidParameterException( "Invalid tair " +
						 "object id: " + reqID );
	}


        // place the embedded keyword search params from the kw include jsp
	// into the map
        ksh.putKeywordIncludeParams( request, searchParams ); 

        return searchParams;
    }



    /**
     * Collect information for each selected publication and create 
     * tab-delimited export string for download
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
	     !searchSession.searchInProgress( getSearchType() ) || query_id == null ) {

            throw new SessionOutOfTimeException( "No publication search " +
						 "in progress" );
        } else {

            // get any publications selected on previous pages
            ids = searchSession.getDownload( getSearchType() );
            if ( ids == null ) {
                ids = new ArrayList();
            }
        }

        // combine previously selected with selections from current page
        if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
            Long[] formIDs = 
		TextConverter.stringToLongArray( 
		    request.getParameterValues( "id" ) );

            if ( formIDs != null && formIDs.length > 0 ) {
                for ( int i = 0; i < formIDs.length; i++ ) {
                    ids.add( formIDs[ i ] );
                }
            }
        }

        if ( ids == null || ids.isEmpty() ) {
            throw new InvalidFormException( "No publications selected " +
					    "for download" );
        }
    
        DBconnection conn = null;
        DBReadManager connectionPool = null;

        try {
	    
            String sessionID = request.getSession().getId();
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();

            PublicationSearcher searcher = new PublicationSearcher();
            PublicationSummary[] pubs = searcher.getSelected( conn, 
							      ids, 
							      query_id );
            StringBuffer export = new StringBuffer();
	    
            if ( pubs != null && pubs.length > 0 ) {
                // get header from first element in results
                export.append( pubs[ 0 ].getExportHeader() ); 
                for ( int i = 0; i < pubs.length; i++ ) {
                    export.append( pubs[ i ].createExport() );
                }
            }

            response = new RequestHandlerResponse();
            response.setAttribute( "downloadText", export.toString() );
            response.setPage( "/jsp/common/download.jsp" );

        } catch ( NumberFormatException nfe ) {
            throw new InvalidParameterException( "Invalid reference id: " + 
                                                 nfe.getMessage() );

        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }

        return response;
    }


}
