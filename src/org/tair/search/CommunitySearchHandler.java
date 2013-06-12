//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.16 $
// $Date: 2004/09/13 18:29:37 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
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
 * CommunitySearchHandler handles all search functions for persons or 
 * organizations. When searching, CommunitySearchHandler uses the 
 * <code>SearchSession</code> object to create a temp table to hold an 
 * individual users community search results. With these stored results, user
 * can easily scroll through a large result set through subsequent requests to
 * CommunitySearchHandler.
 *
 * <p>
 * CommunitySearchHandler uses <code>CommunityFullSearcher</code> to perform 
 * initial search, to retrieve pages of results when scrolling through results, 
 * and to retrieve community info. when download option is selected.
 *
 * <p>
 * Community search functions can occur in either "user" or "curator" mode.  
 * Curator mode allows logged in curator to search using additional search 
 * fields, and has a more complex format for downloading.  
 */


public  class CommunitySearchHandler implements RequestHandler {   

    private final String downloadURL = 
	"/servlets/Search?" +
	"type=download&" +
	"download_type=community&" +
	"curator=";

    private String searchType = "community";


    /**
     * Processes servlet request to perform requested action.  Method  uses the 
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of action
     * are:
     *
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to CommunityFullSearcher for searching</li>
     * <li>re_search - Requested page number of multiple page result set is
     * retrieved from request and passed to CommunityFullSearcher to receive 
     * requested page of results</li>
     * <li>download - Request is forwarded to DownloadHandler for curator or 
     * user specific version of community download
     * </ul>
     * 
     * <p>
     * Results of search and re_search are returned as a 
     * <code>SearchResultsCollection</code> containing an array of 
     * <code>CommunitySummary</code> objects as well as scrolling params, links
     * and plain text explanation of search parameters used to construct result
     * set
     *
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing URL of JSP to forward to, and 
     * any search results objects that may have resulted from request
     * @throws SQLException thrown if a database error occurs while searching
     * @throws InvalidParameterException thrown if invalid search action is 
     * requested
     * @throws InvalidFormException thrown if no communities selected for 
     * download
     * @throws SessionOutOfTimeException thrown when re_searching if no 
     * community search is in progress
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
	    response = new RequestHandlerResponse();
	    boolean curatorSearch = 
		( request.getParameter( "curator" ) != null && 
		  request.getParameter( "curator" ).equals( "true" ) );

	    response.setPage( downloadURL  + curatorSearch );

	} else {
	    throw new InvalidParameterException( "Invalid search action " +
						 "requested: " + action );
	}
	return response;

    }

    /**
     * Retrieve search and scroll parameters to execute search and return 
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

	    CommunityFullSearcher searcher = new CommunityFullSearcher();
      
	    Map searchParams = null;
	    SearchSession searchSession = null;
	    SearchResultsCollection searchCollection = null;
	    
	    // if first time through this search, populate temp table & get 
	    // 1st page of results
	    if ( firstSearch ) {

		    // create search data that persists in session
		    searchParams = getSearchParams( request );
		    
            //register with searchSession
            String insert_query = searcher.generateInsertLine(conn, searchParams, "form" );
            query_id = MasterTableInfo.getQueryID( insert_query, conn, searchType );

            // SessionHandler will automatically register search with 
		    // SearchSession if not done already
		    searchSession = SessionHandler.getSearchSession( request, 
								 conn, 
								 searchType );
	        
            searchParams.put( "query_id", query_id);
		    searchSession.setSearchCriteria( query_id, searchParams );
		    
		    // Remove any existing results, then re-search using same id.
		    searcher.deleteSearch(conn, query_id);

		    searchCollection = 
		        searcher.search( conn, searchParams, scrollParams, firstSearch );
        
		// else get requested slice of result set already stored in 
		// temp table
	    } else {
		searchSession = SessionHandler.getSearchSession( request );
        
		if ( searchSession != null && 
		     searchSession.searchInProgress( searchType ) ) {
            
            if ( !TextConverter.isEmpty( request.getParameter("query_id") ) ){
                query_id = (String) request.getParameter("query_id");
		        searchParams = searchSession.getSearchCriteria( query_id );
                if (searchParams == null ) {
                    throw new SessionOutOfTimeException( "No community search in progress");
                }
            } else {
                throw new SessionOutOfTimeException( "No community search in progress");
            }
            
            searchParams.put ("query_id", query_id );
		    
            searchCollection = 
			searcher.search( conn, searchParams, scrollParams, false );

		    // check for any items selected for download and save in 
		    // searchSession until download is selected action
		    if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
			Long[] ids = 
			    TextConverter.stringToLongArray( 
				request.getParameterValues( "id" ) );

			searchSession.addDownload( query_id, ids );
		    }

		} else {
		    throw new SessionOutOfTimeException( "No community " +
							 "search in progress" );
		}
	    }
      
	    response = new RequestHandlerResponse();
	    response.setAttribute("query_id", query_id);
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
     * Retrieve search params from request.
     *
     * @param request Servlet request containing input from web form
     * @return Search params retrieved from web form as a Map with form
     * field name as String key referencing submitted value for field.
     * Value will be converted from String to other data type (Long, Date)
     * as needed.
     * @throws InvalidFormException if invalid input received.
     */
    private Map getSearchParams( HttpServletRequest request ) 
	throws InvalidFormException {

	HashMap searchParams = new HashMap();
	TreeMap errors = new TreeMap();

	if ( !TextConverter.isEmpty( request.getParameter( "search_type" ) ) ) {
	    searchParams.put( "search_type", 
			      request.getParameter( "search_type" ) );
	}

	if ( !TextConverter.isEmpty( request.getParameter( "keyword" ) ) ) {
	    searchParams.put( "keyword", 
			      request.getParameter( "keyword" ) );

	    searchParams.put( "keyword_method", 
			      request.getParameter( "keyword_method" ) );
	}
	
	
	if ( !TextConverter.isEmpty( request.getParameter( "org_type" ) ) ) {
	    searchParams.put( "org_type", request.getParameter( "org_type" ) );
	}
	
	String title = request.getParameter( "primary_job_title" );
	if ( !TextConverter.isEmpty( title  ) ) {
	    searchParams.put( "primary_job_title", title );
	}
	
	if ( !TextConverter.isEmpty( request.getParameter( "order_by" ) ) ) {
	    searchParams.put( "order_by", request.getParameter( "order_by" ) );
	}

	// get person/organization name input
	getNameParams( request, searchParams );

	// get contact info. related params (address, email, URL etc.)
	getContactInfoParams( request, searchParams );

	// get params submitted for curator searches only
	boolean curatorSearch = 
	    ( request.getParameter( "curator" ) != null && 
	      request.getParameter( "curator" ).equals( "true" ) );
	
	searchParams.put( "curator", new Boolean( curatorSearch ) );
	if ( curatorSearch ) {
	    getCuratorSearchParams( request, searchParams, errors );
	}
   	
	// throw exception if any validation errors encountered (should only 
	// happen in curator mode)
	if ( errors != null && !errors.isEmpty() ) {
	    throw new InvalidFormException( errors, "Invalid Form Submission" );
	}                                         
	
	return searchParams;
    }


    /**
     * Retrieve contact info. related search params such as email,
     * street address and URL and add to searchParams map
     *
     * @param request Servlet request containing input from web form
     * @return Search params retrieved from web form as a Map with form
     * field name as String key referencing submitted value for field.
     */
    private void getContactInfoParams( HttpServletRequest request,
				       Map searchParams )
    {
	if ( !TextConverter.isEmpty( request.getParameter( "email" ) ) ) {
	    searchParams.put( "email", request.getParameter( "email" ) );
	    searchParams.put( "email_method", 
			      request.getParameter( "email_method" ) );
	}
    
	if ( !TextConverter.isEmpty( request.getParameter( "city" ) ) ) {
	    searchParams.put( "city", request.getParameter( "city" ) );
	    searchParams.put( "city_method", 
			      request.getParameter( "city_method" ) );
	}
    
	if ( !TextConverter.isEmpty( request.getParameter( "us_state" ) ) ) {
	    searchParams.put( "us_state", 
			      request.getParameter( "us_state" ) );
	}
    
	if ( !TextConverter.isEmpty( request.getParameter( "other_state" ) ) ) {
	    searchParams.put( "other_state", 
			      request.getParameter( "other_state" ) );
	    searchParams.put( "other_state_method", 
			      DataConstants.SEARCH_EXACT );
	}
    
	if ( !TextConverter.isEmpty( request.getParameter( "country" ) ) ) {
	    searchParams.put( "country", 
			      request.getParameter( "country" ) );
	}
    
	if ( !TextConverter.isEmpty( request.getParameter( "url" ) ) ) {
	    searchParams.put( "url", request.getParameter( "url" ) );
	    searchParams.put( "url_method", 
			      request.getParameter( "url_method" ) );
	}
    }
    

    /**
     * Retrieve person/organization name search params and add to 
     * searchParams map
     *
     * @param request Servlet request containing input from web form
     * @return Search params retrieved from web form as a Map with form
     * field name as String key referencing submitted value for field.
     */
    private void getNameParams( HttpServletRequest request,
				Map searchParams )
    {

	String formInput = request.getParameter( "last_org_name" );
	if ( !TextConverter.isEmpty( formInput ) ) { 
	    searchParams.put( "last_org_name", formInput ); 
	    searchParams.put( "last_org_name_method", 
			      request.getParameter( "last_org_name_method" ) );
	}
    
	formInput = request.getParameter( "first_name" );
	if ( !TextConverter.isEmpty( formInput  ) ) {
	    searchParams.put( "first_name", formInput );

	    searchParams.put( "first_name_method", 
			      request.getParameter( "first_name_method" ) );
	}
    
    }


    /**
     * Retrieve search params for curator only searches and add to 
     * searchParams map.
     *
     * @param request Servlet request containing input from web form
     * @param errors Map to contain any validation errors
     * @return Search params retrieved from web form as a Map with form
     * field name as String key referencing submitted value for field.
     */
    private void getCuratorSearchParams( HttpServletRequest request,
					 Map searchParams,
					 Map errors )
    {
	// get date params and store as Date, saving parse errors
	getDateParams( request, searchParams, errors );
	
	// get id params and store as Long, saving parse errors
	getIDParams( request, searchParams, errors );
	
	if ( !TextConverter.isEmpty( request.getParameter( "status" ) ) ) {
	    searchParams.put( "status", request.getParameter( "status" ) );
	}
	
	// translate checkbox form fields to Boolean values 
	// (true if submitted value = 'T')
	String formInput = request.getParameter( "ABRC_fees_waived" );
	searchParams.put( "ABRC_fees_waived", translateCheckbox( formInput ) );

	formInput = request.getParameter( "commercial" );
	searchParams.put( "commercial", translateCheckbox( formInput ) );

	formInput = request.getParameter( "is_obsolete" );
	searchParams.put( "is_obsolete", translateCheckbox( formInput ) );
    }


    /**
     * Quick utility method to translate checkbox value into Boolean
     * value.  Returned Boolean will be true if submitted string
     * is equal to "T".  Web form fields should use this value for
     * checkboxes to get a true value here.
     *
     * @param value Submitted value from web submission.
     * @return Boolean value to represent checkbox.  Will be true
     * if value = 'T'
     */
    private Boolean translateCheckbox( String value ) {
	Boolean result = new Boolean( !TextConverter.isEmpty( value ) &&
				      value.equals( "T" ) );
	return result;
    }
				     

    /**
     * Retrieve date search params and translate values into appropriate
     * java.util.Date objects.
     *
     * @param request Servlet request containing input from web form
     * @param errors Map to contain any validation errors
     * @return Search params retrieved from web form as a Map with form
     * field name as String key referencing submitted value for field.
     */
    private void getDateParams( HttpServletRequest request,
				Map searchParams,
				Map errors )
    {
	
	try {
	    
	    // Translate submitted date from form in mm/dd/yyyy format to 
	    // java.util.Date value suitable for searching - easily done 
	    // using DateWebFormField. 
	    String formInput = request.getParameter( "date_from" );
	    if ( !TextConverter.isEmpty( formInput ) ) {
		DateWebFormField formField = 
		    new DateWebFormField( "date_from", false );
		
		java.util.Date fromDate = 
		    (java.util.Date) formField.validate( request );
		searchParams.put( "date_from", fromDate );
	    }
	    
	    //
	    // manually set time to last second of the day (23:59:59) so that 
	    // when searching for items altered before that date, items altered
	    // on that date will get caught. A little awkward, but necessary
	    // because vanilla translation of string value to simple date format
	    // will set time as midnight *beginning*  the day, when we need it 
	    // for ending the day
	    //
	    formInput = request.getParameter( "date_to" );
	    if ( !TextConverter.isEmpty( formInput ) ) {
		DateWebFormField formToDate =
		    new DateWebFormField( "date_to", false );
		
		GregorianCalendar now = new GregorianCalendar();
		java.util.Date toDate = 
		    (java.util.Date) formToDate.validate( request );
		
		now.setTime( toDate );
		now.set( Calendar.HOUR_OF_DAY, 23 );
		now.set( Calendar.MINUTE, 59 );
		now.set( Calendar.SECOND, 59 );
		toDate = now.getTime();
		searchParams.put( "date_to", toDate );
	    }
	} catch ( InvalidParameterException ipe ) {
	    errors.put( "Time Restriction", ipe.getMessage() );
	}
    }

    /**
     * Retrieve person and organization ID search params and translate values
     * into Long objects
     *
     * @param request Servlet request containing input from web form
     * @param errors Map to contain any validation errors
     * @return Search params retrieved from web form as a Map with form
     * field name as String key referencing submitted value for field.
     */
    private void getIDParams( HttpServletRequest request,
			      Map searchParams,
			      Map errors )
    {
	
	String[] idFields = 
	    new String[] { "person_id_from", 
			   "person_id_to", 
			   "organization_id_from", 
			   "organization_id_to" 
	    };
	
	String formInput = null;
	for ( int i = 0; i < idFields.length; i++ ) {
	    try {
		
		formInput = request.getParameter( idFields[ i ] );
		if ( !TextConverter.isEmpty( formInput ) ) {
		    searchParams.put( idFields[ i ], 
				      new Long( formInput ) );
		}
	    } catch ( NumberFormatException nfe ) {
		errors.put( idFields[ i ], 
			    "Invalid id: " + idFields[ i ] );
	    }
	}
    }
}
