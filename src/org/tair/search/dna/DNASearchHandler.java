//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.17 $
// $Date: 2004/05/24 23:34:14 $
//------------------------------------------------------------------------------ 
package org.tair.search.dna;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.SearchSession;
import org.tair.search.Units;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAssemblyUnit;
import org.tair.tfc.TfcLocus;
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
 * DNASearchHandler handles requests for DNA searches. DNA searches can be one 
 * of eight distinct types, each with their own data validation rules & relevant
 * search parameters. To handle the different search types transparently, 
 * DNASearchHandler dynamically creates an object derived from the abstract 
 * class <code>DNASearcher</code> to handle all type specific processing. 
 * Data validation & searching is handled by this searcher class.  DNASearcher
 * objects will return search results as a type specific summary class that 
 * implement the <code>DNASummary</code> interface so downloading of results
 * can be handled here generically.
 * 
 * When searching, DNASearchHandler uses the <code>SearchSession</code> object 
 * to create a temp table to hold an individual users type specific search 
 * results. With these stored results, user can easily scroll through a large 
 * result set through subsequent requests to DNASearchHandler.
 *
 * The types of DNA searches are: 
 * <ul>
 * <li>clone</li>
 * <li>clone end</li>
 * <li>library</li>
 * <li>vector</li>
 * <li>filter (stored in Stock table)</li>
 * <li>pooled genomic DNA (stored in Stock table)</li>
 * <li>generic DNA stocks (all stocks in Stock table regardless of type)</li>
 * <li>host strain</li>
 * </ul>
 */


public class DNASearchHandler implements RequestHandler {   

    // collection of DNASearcher class names to instantiate for type specific 
    // searches keep as static collection to speed up retrieval when creating 
    // searchers
    private static Map searchers = new Hashtable();

    static {
	searchers.put( "clone", "org.tair.search.dna.CloneSearcher" );
	searchers.put( "clone_end", "org.tair.search.dna.CloneEndSearcher" );
	searchers.put( "library", "org.tair.search.dna.LibrarySearcher" );
	searchers.put( "vector", "org.tair.search.dna.VectorSearcher" );
	searchers.put( "pool", "org.tair.search.dna.PooledGenomicSearcher" );
	searchers.put( "filter", "org.tair.search.dna.FilterSearcher" );
	searchers.put( "stock", "org.tair.search.dna.StockSearcher" );
	searchers.put( "strain", "org.tair.search.dna.HostStrainSearcher" );
    }

  
    /**
     * Processes servlet request to perform requested action.  Method  uses the 
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of action 
     * are:
     *
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to relevant DNASearcher for searching</li>
     * <li>re_search - Requested page number of multiple page result set is
     * retrieved from request and passed to relevant DNASearcher to receive 
     * requested page of results</li>
     * <li>download - Marked dna items are retrieved from request and 
     * &amp; information is collected into tab-delimited format for download
     * <li>order - Redirects user to OrderServlet for processing of stock order
     * </ul>
     * 
     * Method also depends on the "dna_type" parameter in the HttpServletRequest 
     * to determine what specific type of dna search is being performed (i.e. 
     * clone, clone end, library etc.).  This parameter is used to create a type
     * specific DNASearcher object which handles all type specific processing.
     *
     * <p>
     * Results of search and re_search are returned as a 
     * <code>SearchResultsCollection</code> containing an array of type specific
     * summary objects that implement the <code>DNASummary</code> interface, 
     * objects as well as scrolling params, links and plain text explanation of
     *  search parameters used to construct result set
     *
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing URL of JSP to forward to, and 
     * any search results objects that may have resulted from request
     * @throws SQLException thrown if a database error occurs while searching
     * @throws InvalidParameterException thrown if an invalid search action is 
     * requested, or an invalid dna item id is submitted for download
     * @throws InvalidFormException thrown if no dna items selected for download
     * @throws SessionOutOfTimeException thrown when re_searching if no dna 
     * search of requested sub-type is in progress
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


	    // let order servlet take care of everything if ordering stocks
	    // from results pages
	} else if ( action != null && action.equals( "order" ) ) { 
	    response = new RequestHandlerResponse();
	    response.setPage( "/servlets/Order?state=addStock" );
     
	} else {
	    throw new InvalidParameterException( "Invalid search action " +
						 "requested: " + action );
	}
	return response;
    }


    /**
     * Retrieve search and scroll parameters to execute search and return 
     * selected slice of result set
     *
     * @param request Servlet request
     * @param firstSearch If <code>true</code>, this is the first time search
     * has been requested; if <code>false</code> request has been made to see
     * a different page of results from a search that has already been executed
     * @return RequestHandlerResponse containing JSP URL to redirect to for
     * displaying results along with a SearchResultsCollection containing all
     * data needed for displaying results
     * @throws InvalidFormException if invalid input received from form
     * @throws SQLException if a database error occurs
     * @throws SessionOutOfTimeException If no dna search found in progress 
     * when expected
     * @throws InvalidParameterException if invalid scrolling params received
     */
    private RequestHandlerResponse search( HttpServletRequest request, 
					   boolean firstSearch ) 
	throws SQLException, InvalidFormException, SessionOutOfTimeException,
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

	    String session_id = request.getSession( true ).getId();

	    // get DNASearcher for type specific searches/operations
	    String dnaSearchType = request.getParameter( "dna_type" );
	    DNASearcher searcher = getSearcher( dnaSearchType  );

	    SearchSession searchSession = null;
	    Map searchParams = null;

	    // if first time through this search, populate temp table & get 
	    // first page of results      
	    if ( firstSearch ) {

		// retrieve & validate search params
		searchParams = getSearchParams( request, conn, searcher );
		
		// register search w/SearchSession
		String insert_query = searcher.generateInsertLine( conn, searchParams, "form");
        if (MasterTableInfo.queryIDExists (insert_query, conn) ){
            firstSearch = false;
        }
        query_id = MasterTableInfo.getQueryID( insert_query, conn, dnaSearchType );
        
        searchSession = SessionHandler.getSearchSession( request, 
						     conn, dnaSearchType );
        searchParams.put ("query_id", query_id );
		// save search params for future reference
		searchSession.setSearchCriteria( query_id, searchParams );
        
		// else get requested slice of result set already stored 
		// in temp table
	    } else {
		// get search data from session 
		searchSession = SessionHandler.getSearchSession( request );
		if ( searchSession != null && 
		     searchSession.searchInProgress( dnaSearchType ) ) {
            
            if ( !TextConverter.isEmpty (request.getParameter("query_id") ) ){
                query_id = (String) request.getParameter("query_id");
                searchParams = searchSession.getSearchCriteria( query_id );
                if (searchParams == null ) {
                    throw new SessionOutOfTimeException( "No " + dnaSearchType +" " +
                    "search in progress" );
                }    
            } else {
                throw new SessionOutOfTimeException( "No " + dnaSearchType +" " +
                "search in progress" );
            }
		    //searchParams = searchSession.getSearchCriteria( query_id );

		    // check for any items selected for download and save in 
		    // searchSession until download is selected action
		    if ( !TextConverter.isEmpty( 
			     request.getParameter( "id" ) ) ) {
			
			Long[] ids = 
			    TextConverter.stringToLongArray( 
				request.getParameterValues( "id" ) );

			searchSession.addDownload( dnaSearchType, ids );
		    }

		} else {
		    throw new SessionOutOfTimeException( "No dna search " +
							 "in progress" );
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
        response.setPage( searcher.getSummaryPage() );
      
	} finally {
	    connectionPool.return_connection( conn );
	}
	return response;
    }

  
    /**
     * Retrieve search params from request -- after retrieval, pass to searcher
     * for type specific validation of search criteria.  DNA search form may 
     * allow users to enter search criteria not valid for searches of requested
     * sub-type. Scripting of UI should help exclude this criteria, but is not 
     * 100% reliable so each DNASearcher object implements a validateParams()
     * method to enforce restrictions
     *
     * @param request Servlet request
     * @param conn An active connection to the database - used for retrieving
     * display names for ids submitted for searching
     * @param searcher Type specific searcher to handle validation tasks
     * @return Map containing search parameters with form field nams as String
     * key referencing type specific value (i.e. Date, String, Long etc.)
     * submitted for that field
     * @throws InvalidFormException if invalid search parameter data received
     * @throws SQLException if a database error occurs
     */
    private Map getSearchParams( HttpServletRequest request, 
				 DBconnection conn, 
				 DNASearcher searcher ) 
	throws InvalidFormException, SQLException { 

	HashMap searchParams = new HashMap();

	// save up all errors & throw at once
	HashMap errors = new HashMap();
   
	// get values from 3 name search text fields
	getNameSearchFields( request, searchParams );

    //taxon stuff 
	try { 
    
        String formTaxon = request.getParameter( "taxon" );
        if (!TextConverter.isEmpty(formTaxon) ) {
            Long id =  new Long( formTaxon );
            searchParams.put( "taxon_id", id );
            searchParams.put( "taxon_name", TfcTaxon.get_scientific_name( conn, id ) );
        }
    } catch (NumberFormatException nfe ) {
        errors.put( "taxon", "Invalid taxon id: " + nfe.getMessage() );
    }

    // use adjustVectorType to adjust search form values into literal search
	// types store form values in searchParams for translation when creating
	// format version of search values
	if ( !TextConverter.isEmpty( request.getParameter( "vector_type" ) ) ) { 
	    String[] vector_display_type = 
		request.getParameterValues( "vector_type" );

	    String[] vector_type = adjustVectorType( vector_display_type );
	    searchParams.put( "vector_type", vector_type );
	    searchParams.put( "vector_display_type", vector_display_type );
	}

	if ( !TextConverter.isEmpty( request.getParameter( "insert_type" ) ) ) {
	    searchParams.put( "insert_type", 
			      request.getParameterValues( "insert_type" ) );
	}

	if ( !TextConverter.isEmpty( 
		  request.getParameter( "clone_end_type" ) ) ) {

	    searchParams.put( "clone_end_type", 
			      request.getParameterValues( "clone_end_type" ) );
	}

	// separate params grouped under otherFeatures for UI reasons into 
	// separate fields for searching
	if ( !TextConverter.isEmpty( 
		  request.getParameter( "other_features" ) ) ) {
	    
	    getOtherFeatures( request, searchParams );
	}
    

	
	// If assembly unit info specified, search is coming from assembly unit
	// detail page
	if ( !TextConverter.isEmpty( 
		  request.getParameter( "assembly_map_element_id" ) ) ) {
	    
	    try {
		Long id =
		    new Long( request.getParameter( 
				   "assembly_map_element_id" ) );

		searchParams.put( "assembly_map_element_id", id );

		// get assembly unit name for display on results pages
		String name = 
		    TfcAssemblyUnit.retrieveMapElementName( conn, id );
		searchParams.put( "assembly_unit_name", name );

	    } catch ( NumberFormatException nfe ) {
		errors.put( "assembly unit map element id", nfe.getMessage() );
	    }
	}

	// If locus info specified, search is coming from locus detail page
	if ( !TextConverter.isEmpty( request.getParameter( "locus_id" ) ) ) {
	    try {
		Long id = new Long( request.getParameter( "locus_id" ) );
		searchParams.put( "locus_id", id );

		// get locus name for display on results pages
		String name = TfcLocus.retrieveLocusName( conn, id );
		searchParams.put( "locus_name", name );

	    } catch ( NumberFormatException nfe ) {
		errors.put( "assembly unit map element id", nfe.getMessage() );
	    }
	}


	// if parent stock set/pool info specified, search must be coming from 
	// stock/clone detail page - this should only apply to StockSearcher 
	// sub-type
	try {
	    if ( !TextConverter.isEmpty(
		      request.getParameter( "parent_id" ) ) ) {


		Long id = new Long( request.getParameter( "parent_id" ) );
		searchParams.put( "parent_id", id );
		searchParams.put( "parent_name",
				  request.getParameter( "parent_name" ) );
	    }
	} catch ( NumberFormatException nfe ) {
	    errors.put( "parent tair object id", 
			"Invalid parent tair object id: " + nfe.getMessage() );
	}    

	// get "restrict date by" field values
	getRestrictByDates( request, searchParams, errors );

	String order = null;
	if ( request.getParameter( "order" ) != null ) {
	    order = request.getParameter( "order" );
	    searchParams.put( "order", order );
	}

	// get map location search params (chromosome, map etc.)
	// pass order by selection to ensure map location info
	// is included if sorting by position
	getMapLocationInfo( request, conn, searchParams, errors, order );


	// do type specific validation with submitted DNASearcher
	searcher.validateParams( searchParams, errors ); 
	searchParams.put( "dna_type", request.getParameter( "dna_type" ) ); 

	if ( errors != null && !errors.isEmpty() ) {
	    throw new InvalidFormException( errors, 
					    "Errors on form submission" );
	}

	return searchParams;
    }


    /**
     * Retrieves input from name search text fields. Each field has three
     * components to retrieve - search term entered, name type selected,
     * and search method (contains, exact match etc.) selected
     *
     * @param request Servlet request containing search params
     * @param searchParams Map of search params to add retrieved data to
     */
    private void getNameSearchFields( HttpServletRequest request, 
				      Map searchParams ) 
    {

	if ( !TextConverter.isEmpty( request.getParameter( "term_1" ) ) ) {
	    searchParams.put( "type_1", request.getParameter( "type_1" ) );

	    searchParams.put( "term_1", 
			      request.getParameter( "term_1" ).trim() );

	    searchParams.put( "method_1", request.getParameter( "method_1" ) );
	}
    
	if ( !TextConverter.isEmpty( request.getParameter( "term_2" ) ) ) {
	    searchParams.put( "type_2", request.getParameter( "type_2" ) );

	    searchParams.put( "term_2", 
			      request.getParameter( "term_2" ).trim() );

	    searchParams.put( "method_2", request.getParameter( "method_2" ) );
	}

	if ( !TextConverter.isEmpty( request.getParameter( "term_3" ) ) ) {
	    searchParams.put( "type_3", request.getParameter( "type_3" ) );

	    searchParams.put( "term_3", 
			      request.getParameter( "term_3" ).trim() );

	    searchParams.put( "method_3", request.getParameter( "method_3" ) );
	}
    }


    /**
     * Retrieves to/from values entered for the "restrict date by" form
     * field. Submitted dates from form are translated from mm/dd/yyyy 
     * String format to java.util.Date value suitable for searching using 
     * DateWebFormField. 
     *
     * @param request Servlet request
     * @param searchParams Map of search parameters to add date fields to
     * @param errors Map containing form errors. Error entries will be 
     * added to this map if invalid dates are received
     */
    private void getRestrictByDates( HttpServletRequest request, 
				     Map searchParams, 
				     Map errors ) 
    {
	try {
	    
	    if ( !TextConverter.isEmpty(
		     request.getParameter( "restrict_date_from" ) ) ) {
		
		// create DateWebFormField to handle translation from
		// String to Date
		DateWebFormField formField = 
		    new DateWebFormField( "restrict_date_from", false );

		// will throw InvalidParameterException if invalid date
		// string received
		java.util.Date fromDate = 
		    (java.util.Date) formField.validate( request );

		searchParams.put( "restrict_date_from", fromDate );
	    }

	    //
	    // If submitted to date is not today's date, manually set time to 
	    // last second of the day (23:59:59) so that when searching for 
	    // items altered before that date, items altered on that date will 
	    // get caught.
	    //
	    // A little awkward, but necessary because vanilla translation of 
	    // string value to simple date format will set time as midnight 
	    // *beginning* the day, when we need it for ending the day
	    //
	    if ( !TextConverter.isEmpty( 
		      request.getParameter( "restrict_date_to" ) ) ) {
		
		DateWebFormField formToDate = 
		    new DateWebFormField( "restrict_date_to", false );

		GregorianCalendar now = new GregorianCalendar();
		now.set( Calendar.HOUR_OF_DAY, 0 );
		now.set( Calendar.MINUTE, 0 );
		now.set( Calendar.SECOND, 0 );
		now.set( Calendar.MILLISECOND, 0 );
		java.util.Date compareNow = now.getTime();
		java.util.Date toDate = 
		    (java.util.Date) formToDate.validate( request );

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
    }
	
    /**
     * Separate params grouped under "other_features" request name for UI 
     * reasons into separate fields for searching. All fields here will
     * be added to search params map as Boolean true values if found
     * in request
     *
     * @param request Servlet request
     * @param searchParams Map of search params to add specific other
     * features entries to
     */
    private void getOtherFeatures( HttpServletRequest request,
				   Map searchParams ) 
    {

	String[] otherFeatures = 
	    request.getParameterValues( "other_features" ); 

	for ( int i = 0; i < otherFeatures.length; i++ ) {
	    if ( otherFeatures[ i ] != null ) {

		if (otherFeatures[ i ].equals( "is_sequenced" )) {
		    searchParams.put( "is_sequenced", 
				      new Boolean( true ) );
			
		} else if (otherFeatures[ i ].equals( "is_genetic_marker" )) {
		    searchParams.put( "is_genetic_marker", 
				      new Boolean( true ) );
		    
		} else if (otherFeatures[ i ].equals( "is_on_a_map" )) {
		    searchParams.put( "is_on_a_map", new Boolean( true ) );
		    
		} else if ( otherFeatures[ i ].equals( "is_abrc_stock" )) {
		    searchParams.put( "is_abrc_stock", new Boolean( true ) );
		    
		} else if (otherFeatures[ i ].equals( "is_full_length_cds" )) {
		    searchParams.put( "is_full_length_cds", new Boolean( true ) );
		}
	    }
	}
    }

    /**
     * Retrieve map location search params (chromosome, map etc.) from
     * request and add to searchParams by.  If user has selected "position"
     * as the criteria to sort search results by, a check is made to ensure
     * that map type is selected. If no map type is selected, an error
     * message is added to submitted errors Map.
     *
     * <p>
     * Retrieved values are translated into numeric coordinates for searching
     * by Units class.
     *
     * @param request Servlet request containing form submission
     * @param conn An active connection to the database; needed for translating
     * form submissions into map coordinates for searching
     * @param searchParams Map of search params to add map location params to
     * @param errors Map to add validation error messages to
     * @param order Selected sort order criteria.
     * @throws SQLException if a database error occurs while translating
     * form submission into map coordinates
     * @throws InvalidFormException if invalid map data received by Units
     * class when translating form submission
     */
    private void getMapLocationInfo( HttpServletRequest request, 
				     DBconnection conn,
				     Map searchParams, 
				     Map errors, 
				     String order ) 
	throws SQLException, InvalidFormException {
	
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
	    low_range = request.getParameter( "low_range" ).trim();
	    searchParams.put( "range_type", 
			      request.getParameter( "range_type" ) );
	    searchParams.put( "low_unit", request.getParameter( "low_unit" ) );
	    searchParams.put( "low_range",low_range );
	}       

	
	String highFormStr = request.getParameter( "high_range" );
	if ( !TextConverter.isEmpty( highFormStr ) && 
	     !highFormStr.trim().equals( "--unused--" ) ) {
	    
	    high_range = highFormStr.trim();
	    searchParams.put( "range_type", 
			      request.getParameter( "range_type" ) );

	    searchParams.put( "high_unit", 
			      request.getParameter( "high_unit" ) );

	    searchParams.put( "high_range", high_range );
	}
	

	if ( ( low_range != null || high_range != null ) && map_type == null ) {
	    String message = 
		"Map type must be specified to " +
		"search by map location range";
	    errors.put( "search by location", message );
	}

	// translate assignments from input to searchable assignment values 
	// if searching by map location
	if ( Units.validMapType( (String) searchParams.get( "map_type" ) ) ) {
	    Units units = new Units( conn, searchParams );
	    searchParams.put( "units", units );
	} 
    
	if ( ( order != null && 
	       order.equalsIgnoreCase( "position" ) ) && 
	     map_type == null ) {

	    String message = 
		"Map type must be specified when " +
		"ordering by position";
	    errors.put( "sort by position", message );
	}
	
    }


    /**
     * Adjust search values of vector type to allow for "virtual" options on 
     * search form
     *
     * - "BAC_ALL" is translated to be BAC, TAC, P1 and BiBAC
     * - "BAC" is translsated to be BAC and BiBAC
     *
     * Return list of literal types to search for - form values will be 
     * translated again when creating format version of search criteria 
     * (see DNASearcher.getFormatCriteria() )
     *
     * @param formTypes List of selected values from web form
     * @return Adjusted list of vector types that contains all types contained
     * by "virtual" types
     */
    private String[] adjustVectorType( String[] formTypes ) {
	ArrayList types = null;
	String[] adjusted = null;
	boolean hasAll = false;
	boolean hasBAC = false;

	if ( formTypes != null & formTypes.length > 0 ) {
	    types = new ArrayList();
	    for ( int i = 0; i < formTypes.length; i++ ) {
		if ( formTypes[ i ] != null ) {
		    if ( formTypes[ i ].equals( "BAC_ALL" ) ) {
			hasAll = true;
		    } else if ( formTypes[ i ].equals( "BAC" ) ) {
			hasBAC = true;
		    } else { // add literal types w/out translation
			types.add( formTypes[ i ] );
		    }
		} 
	    }
        
	    if ( hasAll ) {
		if ( !types.contains( "BAC" ) ) {
		    types.add( "BAC" );
		}
                                         
		if ( !types.contains( "P1" ) ) {
		    types.add( "P1" );
		}

		if ( !types.contains( "TAC" ) ) {
		    types.add( "TAC" );
		}
        
		types.add( "BiBAC" );
	    }
      
	    if ( hasBAC ) {
		if ( !types.contains( "BAC" ) ) {
		    types.add( "BAC" );
		}

		if ( !types.contains( "BiBAC" ) ) {
		    types.add( "BiBAC" );
		}
	    }

	    adjusted = new String[ types.size() ];
	    adjusted = (String[]) types.toArray( adjusted );
	}
    
	return adjusted;

    }


  
    /**
     * Factory method for creating type specific DNASearcher objects to handle 
     * different types of dna searches
     * 
     * @param dnaSearchType Specific type of DNASearcher to create
     * @return DNASearcher to handle type specific tasks while searching
     *
     * @throws InvalidParameterException if any errors occur while trying
     * instantiate DNASearcher class for dnaSearchType
     * @throws InvalidFormException if invalid or missing dnaSearchType
     * received
     */
    private DNASearcher getSearcher( String dnaSearchType ) 
	throws InvalidParameterException, InvalidFormException {

	DNASearcher searcher = null;

	if ( TextConverter.isEmpty( dnaSearchType ) || 
	     !searchers.containsKey( dnaSearchType ) ) {
	    
	    throw new InvalidFormException( "Missing or invalid dna " +
					    "search type submitted" );
	} 
    
	try {
	    String searcherClass = (String) searchers.get( dnaSearchType );
	    Class c = Class.forName( searcherClass );
	    searcher = (DNASearcher) c.newInstance();
	} catch ( ClassNotFoundException cnfe ) {
	    throw new InvalidParameterException( cnfe.getMessage() );
	} catch ( InstantiationException ise ) {
	    throw new InvalidParameterException( ise.getMessage() );
	} catch ( IllegalAccessException iae ) {
	    throw new InvalidParameterException( iae.getMessage() );
	}
	
	return searcher;
    }


    /**
     * Collects information for each selected dna item and create tab-delimited
     * export string for download. All DNASearcher objects return results as 
     * type specific summary objects that implement the DNASummary interface. 
     * This allows us to download generically here by passing along the value 
     * of dna_id to the Searcher for retrieval.  Which id dna_id refers to 
     * depends on the dna sub type (clones use clone_id, libraries use 
     * library_id etc.)
     *
     * @param request Servlet request
     * @return RequestHandlerResponse containing JSP URL to redirect user to
     * for downloading data along with tab-delimited download text as a single
     * String
     * @throws SQLException if a database error occurs
     * @throws InvalidFormException If no ids found to download
     * @throws InvalidParameterException if an invalid id is submitted
     * @throws SessionOutOfTimeException if no dna search in progress for
     * specific dna sub type requested
     */
    private RequestHandlerResponse download( HttpServletRequest request ) 
	throws SQLException, InvalidFormException, InvalidParameterException, 
	       SessionOutOfTimeException {

	RequestHandlerResponse response = null;
	DBReadManager connectionPool = null;
	DBconnection conn = null;

	String dnaSearchType = request.getParameter( "dna_type" );

	// get consolidated list of ids selected across multiple pages
	List ids = getSelectedIDs( request, dnaSearchType );
	
	try {
	    // get type specific DNASearcher for handling download
	    DNASearcher searcher = getSearcher( dnaSearchType ); 
        String query_id = (String) request.getParameter("query_id");
        connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

	    DNASummary[] records = searcher.getSelected( conn, 
							 ids, 
							 query_id );
	    
	    String downloadText = null;
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
    
    /**
     * Retrieves consolidated list of ids to download from current request
     * as well as from any previous requests.  This is to allow users to
     * select items across multiple pages of results
     *
     * @param request Servlet request
     * @param dnaSearchType DNA search sub type currently in progress
     * @return List of ids from current and previous requests as Long objects
     * @throws SessionOutOfTimeException if no search found in progress for
     * dnaSearchType
     * @throws InvalidFormException if no ids selected for download either
     * in current request or from previous requests
     */
    private List getSelectedIDs( HttpServletRequest request, 
				 String dnaSearchType ) 
	
	throws SessionOutOfTimeException, InvalidFormException {

	SearchSession searchSession = 
	    SessionHandler.getSearchSession( request );
	
	if ( searchSession == null || 
	     !searchSession.searchInProgress( dnaSearchType ) ) {

	    throw new SessionOutOfTimeException( "No dna search of type" +
						 dnaSearchType + 
						 " in progress" );
	} 

	// get any items selected on previous pages
	Vector ids = searchSession.getDownload( dnaSearchType ); 
	if ( ids == null ) {
	    ids = new Vector();
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
	    throw new InvalidFormException( "No items selected for download" );
	}

	return ids;
    }
    
}
