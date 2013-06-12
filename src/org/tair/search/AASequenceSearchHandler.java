//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2003/10/01 21:05:05 $
//------------------------------------------------------------------------------ 


package org.tair.search;

import java.sql.SQLException;
import java.util.ArrayList;
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
import org.tair.tfc.TfcStructuralClassType;
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
  * AASequenceSearchHandler handles all search functions for proteins. When searching,
  * AASequenceSearchHandler uses the <code>SearchSession</code> object to create
  * a temp table to hold an individual user's protein search results. With these
  * stored results, user can easily scroll through a large result set through
  * subsequent requests to AASequenceSearchHandler.
  *
  * <p>
  * AASequenceSearchHandler uses <code>AASequenceSearcher</code> to perform initial search,
  * to retrieve pages of results when scrolling through results, and to retrieve
  * protein info. when download option is selected.
  */

public class AASequenceSearchHandler implements RequestHandler {   
    private static String searchType = "protein";
    private AASequenceSearcher searcher; // handles all interaction w/database

    /**
     * Creates an instance of AASequenceSearchHandler
     */
    public AASequenceSearchHandler() {  
        this.searcher = new AASequenceSearcher();
    }
 

    /**
     * Processes servlet request to perform requested action.  Method  uses the 
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of action are:
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to AASequenceSearcher for searching</li>
     * <li>re_search - Requested page number of multiple page result set is
     * retrieved from request and passed to AASequenceSearcher to receive requested
     * page of results</li>
     * <li>download - Marked search results are retrieved from request and information
     * is collected into tab-delimited format for download
     * </ul>
     * 
     * <p>Results of search and re_search are returned as a <code>SearchResultsCollection</code>
     * containing an array of <code>AASequenceSummary</code> objects, as well as scrolling 
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
    public RequestHandlerResponse process( HttpServletRequest request ) 
        throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {

        RequestHandlerResponse response = null;

        // action might be in "action" or "search_action"  - summary pages use
        // search action because of conflicts with form.action attribute in javascript in Mac IE 4.5
        String action = request.getParameter( "action" );
        if ( action == null ) {
            action = request.getParameter( "search_action" );
        }
    
        if ( action != null &&  action.equals( "search" ) ) {
            response = search( request, true );
      
        } else if ( action != null &&  action.equals( "re_search" ) ) {
            response = search( request, false );
      
        } else if ( action != null &&  action.equals( "download" ) ) {
            response = download( request );
        
        } else {
            throw new InvalidParameterException( "Invalid search action requested: " + action );
        }
    
        return response;
    }


    // retrieve search and scroll parameters to execute search and return selected slice of result set
    private RequestHandlerResponse search( HttpServletRequest request, boolean firstSearch ) 
        throws SQLException, SessionOutOfTimeException, InvalidParameterException, InvalidFormException {

        RequestHandlerResponse response = null;
        Map searchParams = null;
        SearchSession searchSession = null;
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        ScrollParams scrollParams = null;
        SearchResultsCollection searchCollection = null;
        String query_id = "";

        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            scrollParams = ScrollCalculator.getScrollParams( request );
      
            /*
              If first time searching, retrieve search params from request and store
              in SearchSession object for reference later. Register search w/SearchSession
              to create temp table for caching results
        
              If not first time searching, get search params from SearchSession for
              creating formatted version explaining search results
            */
            if ( firstSearch ) {

                searchParams = getSearchParams( request, conn );
                
                String insert_query = searcher.generateInsertLine( conn, searchParams, "form");
                if (MasterTableInfo.queryIDExists( insert_query, conn) ){
                    firstSearch = false;
                } 
                query_id = MasterTableInfo.getQueryID (insert_query, conn, searchType);
                
                // SessionHandler will automatically register search with 
                // SearchSession if not done already
                searchSession = SessionHandler.getSearchSession( request, conn, searchType );
                searchParams.put ("query_id", query_id);

                // add session id to search params for retrieval later
                searchSession.setSearchCriteria( query_id, searchParams );

            } else {
                searchSession = SessionHandler.getSearchSession( request );
                query_id = (String) request.getParameter("query_id");

                if ( searchSession != null && searchSession.searchInProgress( searchType ) ) {
                    searchParams = searchSession.getSearchCriteria( query_id );
                    if (searchParams == null ) {
                        throw new SessionOutOfTimeException( "No protein search in progress" );
                    }

                    // check for any items selected for download and save in searchSession 
                    // until download is selected action
                    if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
                        Long[] ids = TextConverter.stringToLongArray( request.getParameterValues( "id" ) );
                        searchSession.addDownload( query_id, ids );
                    }
                } else {
                    throw new SessionOutOfTimeException( "No protein search in progress" );
                }
            }

            // execute search & get results - passing firstSearch to searcher will determine
            // whether temp table needs populating, or if we're paging through results
            searchCollection = searcher.search( conn, searchParams, scrollParams, firstSearch );
            response = new RequestHandlerResponse();
            response.setAttribute( "searchCollection", searchCollection );
            response.setAttribute( "query_id", query_id );
            response.setPage( "/jsp/search/aa_sequence_summary.jsp" );
      
        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }
        return response;
    }
  



    // retrieve search params from request
    private Map getSearchParams( HttpServletRequest request, DBconnection conn ) 
        throws InvalidFormException, SQLException {

        HashMap searchParams = new HashMap();
        HashMap errors = new HashMap(); // save any errors to notify user all at once
    
        if ( !TextConverter.isEmpty( request.getParameter( "name" ) ) ) {
            searchParams.put( "name", request.getParameter( "name" ).trim() );
            searchParams.put( "name_method", request.getParameter( "name_method" ) );
            searchParams.put( "name_type", request.getParameter( "name_type" ) );
        }
    

        // if searching by structural class type, create Tfc objects since both
        // id and description will be needed for search and display
        //
        // use getStructuralClassTypes method to translate mutliple ids into array of objects
        if ( !TextConverter.isEmpty( request.getParameter( "structural_class_type_id" ) ) ) {
            searchParams.put( "structural_class_type", getStructuralClassTypes( request, conn ) );
        }

        // transform to int
        try {
            if ( !TextConverter.isEmpty( request.getParameter( "search_length" ) ) && 
                 request.getParameter( "search_length" ).equals( "true" ) ) {

                searchParams.put( "search_length", new Boolean( true ) );
                searchParams.put( "length_from", new Integer( request.getParameter( "length_from" ) ) );
                searchParams.put( "length_to", new Integer( request.getParameter( "length_to" ) ) );
            }
        } catch ( NumberFormatException nfe ) {
            errors.put( "length", "Invalid length value etntered: " + nfe.getMessage() );
        }
    
        // transform to float
        try {
            if ( !TextConverter.isEmpty( request.getParameter( "search_MW" ) ) && 
                 request.getParameter( "search_MW" ).equals( "true" ) ) {

                searchParams.put( "search_MW", new Boolean( true ) );
                searchParams.put( "calc_MW_from", new Float( request.getParameter( "calc_MW_from" ) ) );
                searchParams.put( "calc_MW_to", new Float( request.getParameter( "calc_MW_to" ) ) );
            }
        } catch ( NumberFormatException nfe ) {
            errors.put( "calc MW", "Invalid calculated MW value: " + nfe.getMessage() );
        }


        // transform to float
        try {
            if ( !TextConverter.isEmpty( request.getParameter( "search_pI" ) ) ) {
                searchParams.put( "search_pI", new Boolean( true ) );
                searchParams.put( "calc_pI_from", new Float( request.getParameter( "calc_pI_from" ) ) );
                searchParams.put( "calc_pI_to", new Float( request.getParameter( "calc_pI_to" ) ) );
            }
        } catch ( NumberFormatException nfe ) {
            errors.put( "calc pI", "Invalid calculated pI value: " + nfe.getMessage() );
        }
    
    
    
        if ( !TextConverter.isEmpty( request.getParameter( "domain_name_1" ) ) ) {
            searchParams.put( "domain_name_1", request.getParameter( "domain_name_1" ).trim() );
            searchParams.put( "domain_type_1", request.getParameter( "domain_type_1" ) );
            searchParams.put( "domain_element_1", request.getParameter( "domain_element_1" ) );
            searchParams.put( "domain_method_1", request.getParameter( "domain_method_1" ) );
        }
    
        try { // translate domain match number to integer
            if ( !TextConverter.isEmpty( request.getParameter( "domain_match_1" ) ) ) {
                searchParams.put( "domain_match_1", 
                                  new Integer( request.getParameter( "domain_match_1" ) ) );

                searchParams.put( "domain_match_method_1", request.getParameter( "domain_match_method_1" ) );

                // make sure to include type since counts can be entered w/out name param 
                searchParams.put( "domain_type_1", request.getParameter( "domain_type_1" ) );
            }
        } catch ( NumberFormatException nfe ) {
            errors.put( "domain matches", "Invalid number of domain matches: " + nfe.getMessage() );
        }
    
    
    
        if ( !TextConverter.isEmpty( request.getParameter( "domain_name_2" ) ) ) {
            searchParams.put( "domain_name_2", request.getParameter( "domain_name_2" ).trim() );
            searchParams.put( "domain_type_2", request.getParameter( "domain_type_2" ) );
            searchParams.put( "domain_element_2", request.getParameter( "domain_element_2" ) );
            searchParams.put( "domain_method_2", request.getParameter( "domain_method_2" ) );
        }
    
        try { // translate domain match number to integer
            if ( !TextConverter.isEmpty ( request.getParameter( "domain_match_2" ) ) ) {
                searchParams.put( "domain_match_2", 
                                  new Integer( request.getParameter( "domain_match_2" ) ) );

                searchParams.put( "domain_match_method_2", 
                                  request.getParameter( "domain_match_method_2" ) );

                // make sure to include type since counts can be entered w/out name param 
                searchParams.put( "domain_type_2", request.getParameter( "domain_type_2" ) );

            }
        } catch ( NumberFormatException nfe ) {
            errors.put( "domain matches", "Invalid number of domain matches: " + nfe.getMessage() );
        }
    
        if ( !TextConverter.isEmpty( request.getParameter( "domain_name_3" ) ) ) {
            searchParams.put( "domain_name_3", request.getParameter( "domain_name_3" ).trim() );
            searchParams.put( "domain_type_3", request.getParameter( "domain_type_3" ) );
            searchParams.put( "domain_element_3", request.getParameter( "domain_element_3" ) );
            searchParams.put( "domain_method_3", request.getParameter( "domain_method_3" ) );
      
        }

        try { // translate domain match number to integer
            if ( !TextConverter.isEmpty ( request.getParameter( "domain_match_3" ) ) ) {
                searchParams.put( "domain_match_3", 
                                  new Integer( request.getParameter( "domain_match_3" ) ) );

                searchParams.put( "domain_match_method_3", 
                                  request.getParameter( "domain_match_method_3" ) );

                // make sure to include type since counts can be entered w/out name param 
                searchParams.put( "domain_type_3", request.getParameter( "domain_type_3" ) );

            }
        } catch ( NumberFormatException nfe ) {
            errors.put( "domain matches", "Invalid number of domain matches: " + nfe.getMessage() );
        }
    
        try {

            // Translate submitted date from form in mm/dd/yyyy format to java.util.Date value
            // suitable for searching - easily done using DateWebFormField. 
            if ( !TextConverter.isEmpty( request.getParameter( "restrict_date_from" ) ) ) {
                DateWebFormField formField = new DateWebFormField( "restrict_date_from", false );
                java.util.Date fromDate = (java.util.Date) formField.validate( request );
                searchParams.put( "restrict_date_from", fromDate );
            }

            /*
              If submitted to date is not today's date, manually set time to last second of the
              day (23:59:59) so that when searching      // for items altered before that date, items
              altered on that date will get caught. A little awkward, but necessary because vanilla 
              translation of string value to simple date format will set time as midnight *beginning* 
              the day, when we need it for ending the day
            */
            if ( !TextConverter.isEmpty( request.getParameter( "restrict_date_to" ) ) ) {
                DateWebFormField formToDate = new DateWebFormField( "restrict_date_to", false );
                GregorianCalendar now = new GregorianCalendar();
                now.set( Calendar.HOUR_OF_DAY, 0 );
                now.set( Calendar.MINUTE, 0 );
                now.set( Calendar.SECOND, 0 );
                now.set( Calendar.MILLISECOND, 0 );
                java.util.Date compareNow = now.getTime();
                java.util.Date toDate = (java.util.Date) formToDate.validate( request );

                if ( toDate.before( compareNow ) ) {
                    now.setTime( toDate );
                    now.set( Calendar.HOUR_OF_DAY, 23 );
                    now.set( Calendar.MINUTE, 59 );
                    now.set( Calendar.SECOND, 59 );
                    toDate = now.getTime();
                    searchParams.put( "restrict_date_to", toDate );
                }
            }
        } catch ( InvalidParameterException ipe ) {
            errors.put( "Time Restriction", ipe.getMessage() );
        }
    
        String order = null;
        if ( !TextConverter.isEmpty( request.getParameter( "order" ) ) ) {
            order = request.getParameter( "order" );
            searchParams.put( "order", order );
        }
    
        String chromosome = null;
        if ( !TextConverter.isEmpty( request.getParameter( "chromosome" ) ) ) {
            chromosome =  request.getParameter( "chromosome" );
            searchParams.put( "chromosome", chromosome );
        }
    
        String map_type = null;
        if ( !TextConverter.isEmpty( request.getParameter( "map_type" ) ) ) {
            map_type = request.getParameter( "map_type" );
            searchParams.put( "map_type", map_type );
        }
    
        String low_range = null;
        if ( !TextConverter.isEmpty( request.getParameter( "low_range" ) ) ) {
            low_range = request.getParameter( "low_range" ).trim();
            searchParams.put( "range_type", request.getParameter( "range_type" ) );
            searchParams.put( "low_unit", request.getParameter( "low_unit" ) );
            searchParams.put( "low_range", low_range );
        }       
    
        String high_range = null;
        if ( !TextConverter.isEmpty( request.getParameter( "high_range" ) ) && 
             !( request.getParameter( "high_range" ) ).trim().equals( "--unused--" ) ) {

            high_range =  request.getParameter( "high_range" ).trim();
            searchParams.put( "range_type", request.getParameter( "range_type" ) );
            searchParams.put( "high_unit", request.getParameter( "high_unit" ) );
            searchParams.put( "high_range", high_range );
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

    /**
     * Translates structural class type ids in request into TfcStructuralClassType
     * objects that can be used both for searching as well as for creating
     * formatted description of search values. If class type "any" is received, it 
     * will be skipped - the absence of any restricting parameters will cause all/any
     * to be retrieved.  UI scripting should prevent the submission of "any" along
     * with any other selected types
     *
     * @return Array of structural class type objects for received structural class
     * type ids, or <code>null</code> if no ids are found besides the "any" id.
     */
    private TfcStructuralClassType[] getStructuralClassTypes( HttpServletRequest request,
                                                              DBconnection conn )
        throws SQLException {
        
        ArrayList tmpList = null;
        TfcStructuralClassType[] classTypes = null;
        String[] classTypeIDs = request.getParameterValues( "structural_class_type_id" ); 

        
        if ( classTypeIDs != null && classTypeIDs.length > 0 ) {
            for ( int i = 0; i < classTypeIDs.length; i++ ) {
                if ( !classTypeIDs[ i ].equals( "any" ) ) { // skip "any" option
                    TfcStructuralClassType classType = new TfcStructuralClassType( conn,
                                                                                   classTypeIDs[ i ] );
                    if ( tmpList == null ) {
                        tmpList = new ArrayList();
                    }
                    tmpList.add( classType );
                }
            }
        }
        
        if ( tmpList != null && !tmpList.isEmpty() ) {
            classTypes = new TfcStructuralClassType[ tmpList.size() ];
            classTypes = (TfcStructuralClassType[]) tmpList.toArray( classTypes );
        }

        return classTypes;
    }
                                            

    // collect information for each selected aa sequence and create tab-delimited export string for download
    private RequestHandlerResponse download( HttpServletRequest request ) 
        throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {

        Long[] formIDs; 
        StringBuffer export = null;
        AASequenceSummary[] sequences = null;
        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        RequestHandlerResponse response = null;
        String sessionID = null;
        SearchSession searchSession = null;
        Vector ids = null;

        // make sure search is still in session
        searchSession = SessionHandler.getSearchSession( request );
        String query_id = (String) request.getParameter("query_id");
        if ( searchSession == null || !searchSession.searchInProgress( searchType ) || query_id == null) {
            throw new SessionOutOfTimeException( "No protein search in progress" );
        } else {
            ids = searchSession.getDownload( query_id ); // get any items selected on previous pages
            if ( ids == null ) {
                ids = new Vector();
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
            throw new InvalidFormException( "No proteins selected for download" );
        }
    
        // get collection of aa sequences from search results using selected aa sequence ids
        try {
            sessionID = request.getSession().getId();
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            sequences = searcher.getSelected( conn, ids, query_id );
            export = new StringBuffer();
      
            if ( sequences != null && sequences.length > 0 ) {
                export.append( sequences[ 0 ].getExportHeader() );// get header from first element in results
                for ( int i = 0; i < sequences.length; i++ ) {
                    export.append( sequences[ i ].createExport() );
                }
            }
            response = new RequestHandlerResponse();
            response.setAttribute( "downloadText", export.toString() );
            response.setPage( "/jsp/common/download.jsp" );

        } catch ( NumberFormatException nfe ) {
            throw new InvalidParameterException( "Invalid AA sequence id: " + nfe.getMessage() );
      
        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }
        return response;
    }

}
