//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.25 $
// $Date: 2005/11/21 23:32:40 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;

/**
 * GeneralSearchHandler handles all search functions for the general database
 * search. General searches look for matches in a variety of data types.
 * Searches can either search for matches in a single data type, or can first
 * search for counts of matches in all datatypes before presenting links for
 * user to see itemized results for a single type.
 * 
 * <p>
 * When searching all datatypes at once for counts, GeneralSearchHandler uses
 * <code>GeneralSummary</code> to display results on summary page.
 * 
 * <p>
 * Searches are handled by classes that implement the GeneralSearcher interface.
 * Most commonly, the main Searcher class that handles advanced searching for a
 * datatype will also implement this interface so that it can be used for
 * general searching. Datatypes and the classes to use for searching them are
 * defined in the general.conf file. 
 * 
 * <p>
 * GeneralSearchHandler additionally uses <code>KeywordSearcher</code> to
 * perform keyword searches.
 */

public class GeneralSearchHandler implements RequestHandler {

    private static Map searchers;

    /**
     * Processes servlet request to perform requested action. Method uses the
     * "action" parameter in the submitted <code>HttpServletRequest</code> to
     * determine what action is appropriate. The possible values of action are:
     * 
     * <ul>
     * <li>search - Executes a search for all datatypes that define a
     * GeneralSearcher class and returns results as counts of matches for each
     * type.</li>
     * <li>detail - Executes a search for a single selected datatype and
     * returns the results on that datatype's full search results page</li>
     * <li>new_search - Redirects user to main general search form.
     * </ul>
     * 
     * <p>
     * Results of "any" search for all datatypes are returned as a
     * <code>GeneralSummary</code> object that contains how many matches were
     * found for search term in different search types (gene, clone etc.)
     * 
     * <p>
     * radiobutton selection allows user to choose between a name search which
     * searches the listed specific searches and keywords or just keywords which
     * searches keywords and returns a keyword summary page.
     * 
     * <p>
     * This handler also handles invoking searchers that have been wired
     * (through implementation of AnnotationTypeSearcher) in order to display
     * those type specific searchers' results pages based on their associated
     * data to keywords.
     * 
     * @param request
     *            HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing URL of JSP to forward to, and
     *         any search results objects that may have resulted from request
     * @throws SQLException
     *             if a database error occurs while searching
     * @throws InvalidParameterException
     *             if an invalid search action is requested
     * @throws InvalidFormException
     *             if no search term entered
     */
    public RequestHandlerResponse process( HttpServletRequest request )
            throws SQLException, InvalidParameterException,
            InvalidFormException {

        RequestHandlerResponse response = null;
        String action = request.getParameter( "action" );

        if ( action == null ) {
            action = request.getParameter( "search_action" );
        }

        if ( action != null && action.equals( "new_search" ) ) {
            response = new RequestHandlerResponse();
            response.setPage( "/jsp/search/general_form.jsp" );

        } else if ( action != null && action.equals( "search" ) ) {
            // keyword searches handled through KeywordSearchHandler now
            response = searchAll( request );

        } else if ( action != null && action.equals( "detail" ) ) {
            response = searchDetail( request );

        } else {
            throw new InvalidParameterException( "Invalid search action "
                    + "requested: " + action );
        }

        return response;
    }

    /**
     * Retrieves counts for matches in all datatypes currently defined in
     * searchers collection. Results are presented on the general search summary
     * page which gives counts for each datatype along with a link for viewing
     * the results on the datatype's advanced search results page.
     * 
     * @param request
     *            Servlet request containing form input
     * @return Response containing JSP URL to redirect to along with a
     *         GeneralSummary object that contains results of search.
     * @throws SQLException
     *             if a database error occurs
     * @throws InvalidFormException
     *             if no search term is submitted
     * @throws InvalidParameterException
     *             if instantiation of GeneralSearcher class fails for any
     *             reason.
     */
    private RequestHandlerResponse searchAll( HttpServletRequest request )
            throws SQLException, InvalidFormException,
            InvalidParameterException {

        RequestHandlerResponse response = new RequestHandlerResponse();

        // create params map for passing to Searcher objects
        Map<String, Object> params = getSearchParams( request );
        // use general to hold collected results of all searches
        GeneralSummary general = new GeneralSummary();
        // keep search params for displaying on results page
        general.setSearchParams( params );

        //
        // execute count search for every type in searcher collection by
        // iterating through collection and creating GeneralSearcher objects
        // that get counts for each specific type
        //

        SearchResultsCollection searchResults = null;
        String searchType = null;
        GeneralSearcher searcher = null;
        boolean firstSearch = true;
        String query_id = "";
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        try { 
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            String searchTerm = (String) params.get("searchTerm");
            String insert_query = "GENERAL_QUICKSEARCH_" + searchTerm;

            if (MasterTableInfo.queryIDExists (insert_query, conn ) ){ 
                firstSearch = false;
            }
            
            query_id = MasterTableInfo.getQueryID( insert_query, conn, searchType );
            params.put( "query_id", query_id );
        } finally { 
            if (conn != null ) { 
                connectionPool.return_connection(conn);
            }
        }
        Iterator iter = searchers.keySet().iterator();
        while ( iter.hasNext() ) {
            searchType = (String) iter.next();
            searcher = getSearcher( searchType );
            searchResults = searcher.doGeneralSearch( params, true, firstSearch );
            general.setSearchResults( searchType, searchResults );
        }

        // set results, and redirect to general summary for showing counts &
        // hyperlinks to type specific results
        response.setAttribute( "searchResults", general );
        response.setAttribute( "query_id", query_id );
        response.setPage( "/jsp/search/general_summary.jsp" );


        // deactivate, but keep around for easy re-activating
        // NM 11.21.2005
        //    
        // log all searches and whether they were successful or not
        //  boolean successful = ( general.getTotalCount() > 0 );
        // logResults( params, successful, "all" );

        return response;
    }

    /**
     * Executes a search for a single requested data type and presents results
     * on the advanced search results page for that datatype.
     * 
     * @param request
     *            Servlet request containing form input
     * @return Response containing JSP URL to redirect to along with a
     *         SearchResultsCollection that contains results of search.
     * @throws SQLException
     *             if a database error occurs
     * @throws InvalidFormException
     *             if no search term is submitted
     * @throws InvalidParameterException
     *             if instantiation of GeneralSearcher class fails for any
     *             reason.
     */
    private RequestHandlerResponse searchDetail( HttpServletRequest request )
            throws SQLException, InvalidFormException,
            InvalidParameterException {

        RequestHandlerResponse response = new RequestHandlerResponse();
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        String query_id = "";
        Map<String, Object> params = getSearchParams( request );
        boolean firstSearch = true;

        try {
        
        connectionPool = DBWriteManager.getInstance();
        conn = connectionPool.getSearchConnection();


        // create GeneralSearcher object defined for requested data type
        // and execute search to populate temp table with full result set,
        // then redirect to type specific summary JSP as supplied by searcher.
        //
        String searchType = request.getParameter( "sub_type" );
        GeneralSearcher searcher = getSearcher( searchType );
    

        //register with searchSession
        String insert_query = searcher.generateInsertLine( conn, params, "general" );
        if (MasterTableInfo.queryIDExists ( insert_query, conn ) ){
            firstSearch = false;
        }
        query_id = MasterTableInfo.getQueryID( insert_query, conn, searchType  );
        // need to use searchSession to create temp table for sub type and
        // to store search criteria for displaying criteria on every
        // subsequent search results page
        SearchSession searchSession = 
            SessionHandler.getSearchSession( request,  searchType );
        
        params.put( "query_id", query_id);

        searchSession.setSearchCriteria( query_id, params );

        SearchResultsCollection searchResults =
            searcher.doGeneralSearch( params, false, firstSearch );

        // deactivate, but keep around for easy re-activating
        // NM 11.21.2005
        //    
        // log all searches and whether they were successful or not
        // boolean successful = ( searchResults.getResultSize() > 0 );
        // logResults( params, successful, searchType );
        
        response.setAttribute( "searchCollection", searchResults );
        response.setAttribute( "query_id", query_id );
        response.setPage( searchResults.getResultsPage() );
        } finally {
            if (conn != null ) {
                connectionPool.return_connection ( conn );
            }
        }
        return response;
    }

    /**
     * Creates a map of search parameters to be passed to all GeneralSearcher
     * objects for executing the search. In addition to the term to search for,
     * this map contains various params needed for searching and displaying the
     * results. Parameters defined here are:
     * 
     * <ul>
     * <li>searchTerm - Term to search for</li>
     * <li>method - Search method to use when searching (contains, exact etc.)</li>
     * <li>sessionID - User's session id -- needed for creating temp tables
     * that cache search results</li>
     * <li>isGeneral - Boolean flag set to "true" that lets Searchers know that
     * a general search is being executed. This is used especially when creating
     * text explanations of search criteria.</li>
     * </ul>
     * 
     * @param Request
     *            servlet request containing form input
     * @return Map containing params needed by GeneralSearchers for searching
     * @throws InvalidFormException
     *             if no search term submitted in request
     */
    private Map<String, Object> getSearchParams( HttpServletRequest request )
            throws InvalidFormException {

        if ( TextConverter.isEmpty( request.getParameter( "name" ) ) ) {
            throw new InvalidFormException( "No search term submitted" );
        }

        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put( "searchTerm", request.getParameter( "name" ).trim() );
        params.put( "method", request.getParameter( "method" ) );
        params.put( "sessionID", request.getSession( true ).getId() );
        params.put( "isGeneral", new Boolean( true ) );
        if ( !TextConverter.isEmpty (request.getParameter( "show_obsolete" ))){
            params.put( "show_obsolete", request.getParameter( "show_obsolete" ).trim() );
        }
        return params;
    }

    /**
     * Factory method for creating GeneralSearcher objects to handle different
     * types of general searches
     * 
     * @param type
     *            Data type to create searcher object for
     * @return GeneralSearcher object to handle seaches for submtited data type
     * @throws InvalidParameterException
     *             if GeneralSearcher object could not be instantiated for any
     *             reason
     */
    private GeneralSearcher getSearcher( String type )
            throws InvalidParameterException {

        GeneralSearcher searcher = null;

        if ( TextConverter.isEmpty( type ) || !searchers.containsKey( type ) ) {
            throw new InvalidParameterException( "Missing or invalid general "
                    + "search type submitted: " + type );
        }

        try {
            String searcherClass = (String) searchers.get( type );
            Class c = Class.forName( searcherClass );
            searcher = (GeneralSearcher) c.newInstance();
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
     * Populates GeneralSearchHandler's collection of data types and
     * corresponding GeneralSearcher class names to use for searching each data
     * type. This method is called by the SearchServlet as is initializes and
     * reads the data from the general.conf config file.
     * 
     * @param confFileSearchers
     *            Map containing String data types as keys referencing String
     *            class names of searcher class to use for doing general
     *            searches on that data type, as defined in the general.conf
     *            config file.
     */
    public static void populateSearchers( Map confFileSearchers ) {
        searchers = confFileSearchers;
    }

}
