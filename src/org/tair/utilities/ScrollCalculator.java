//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.17 $
// $Date: 2004/02/02 21:25:56 $
//------------------------------------------------------------------------------ 

package org.tair.utilities;

import java.net.*;
import java.util.*;
import javax.servlet.http.*;



/**
  * ScrollCalculator is a utility class that holds methods to calculate various 
  * parameters used to create hyperlinks to scroll through a multiple page result 
  * set. Common values used in these functions are:
  * <ul>
  * <li>size - The number of results to show on each page</li>
  * <li>page - The current page number being shown while scrolling through multiple
  * pages of results
  * <li>floor - The row number in the result set to start with while displaying a 
  * portion of the result set. In "Showing 25 to 50 of 100 results found", floor 
  * is equal to 25.</li>
  * <li>ceiling - The row number in the result set to end with while displaying a 
  * portion of the result set. In "Showing 25 to 50 of 100 results found", floor 
  * is equal to 50.</li>
  * <li>numResults - The total number of results in the current result set</li>
  * </ul>
  * These parameters are often submitted, or returned as members of a 
  * <code>ScrollParams</code> or <code>SearchResultsCollection</code> object
  * 
  * @see ScrollParams
  * @see HTMLFactory
  * @see SearchResultsCollection
  */


public class ScrollCalculator {


    /**
     * Calculates the total number of pages needed to display complete result set, 
     * given the total number of results and the number of results to show on each 
     * page. 
     *
     * @param size The number of results to show on each page
     * @param numResults The total number of results in the resultset
     * @return Number of pages needed to show the result set with the requested 
     * number of results on each page
     */
    public static int getTotalPages( int size, int numResults ) {
        int totalPages = 0;
        if ( numResults > size ) {
            if ( numResults % size > 0 ) {
                totalPages = numResults / size + 1;
            } else {
                totalPages = numResults / size;
            }
        } else {
            totalPages = 1;
        }
        return totalPages;
    }


    /**
     * Retrieves commonly used scrolling parameters from a user's request to 
     * determine which subset of results to show in the response.  getScrollParams
     * retrieves which page of a multiple page result set is being requested from
     * the parameter "pageNum"; the number of results to show on each page is contained
     * in the "size" parameter. If size is empty or null, the default page size stored
     * in <code>DataConstants</code> is used.  getScrollParams uses these values to 
     * determine the floor and ceiling values for the current request and stores the 
     * values in a <code>ScrollParams</code> object
     *
     * @param request <code>HttpServletRequest</code> passed in from calling servlet
     * @return ScrollParams object containg values for floor, ceiling, page number
     * and number of results to be shown on each page for use in retrieving the 
     * requested subset of the total result set.
     * @throws InvalidParameterException thrown if values for "pageNum" or "size" are 
     * not able to be converted to int.
     * @see ScrollParams
     */
    public static ScrollParams getScrollParams( HttpServletRequest request ) 
        throws InvalidParameterException {

        ScrollParams scrollParams = null;
        try {
      
            String pageNum = request.getParameter( "pageNum" );
            String pageSize = request.getParameter( "size" );
            int page = !TextConverter.isEmpty( pageNum ) ? Integer.parseInt( pageNum ) : 1;
            int size = !TextConverter.isEmpty( pageSize ) ? Integer.parseInt( pageSize ) : 
                DataConstants.getDefaultPageSize();

            scrollParams = getScrollParams( page, size );

        } catch ( NumberFormatException nfe ) {
            throw new InvalidParameterException( "Invalid parameter: " + nfe.getMessage() );
        }
        return scrollParams;
    }

    /**
     * Creates a ScrollParams object that defines subset of a larger result
     * set given the current page requested, and the number of items that
     * appears on each page.  Subset will be defined by floor and ceiling
     * values in ScrollParams.  ScrollParams object will contain current
     * page as well as number of results assumed to be on page (as defined by
     * submitted size).
     *
     * @param page Current page requested
     * @param size Number of items shown on each page
     * @return ScrollParams object containg values for floor, ceiling, page number
     * and number of results to be shown on each page for use in retrieving the 
     * requested subset of the total result set.
     */
    public static ScrollParams getScrollParams( int page, int size ) {
        ScrollParams scrollParams = null;
        
        if ( page < 1 ) {
            page = 1;
        }

        // first & last records on current page of results
        int floor = size * ( page - 1 );
        int ceiling = (size * page ) - 1;
        
        scrollParams = new ScrollParams();
        scrollParams.setPage( page );
        scrollParams.setSize( size );
        scrollParams.setFloor( floor );
        scrollParams.setCeiling( ceiling );

        return scrollParams;
    }


    /**
     * Creates a ScrollParams object with the default values for page size (retrieved 
     * from DataConstants by getDefaultPageSize() (probably 25 results) and page set
     * to 1.  This should match the values returned by getScrollParams() if any needed
     * params are not found in HttpServletRequest.  This method is helpful for quickly
     * creating a scroll params object that will show the first page of a result set
     * without forcing client code to supply a request object.  
     *
     * @return ScrollParams object with default values set to show first page of results
     */
    public static ScrollParams getDefaultScrollParams() {
        ScrollParams scrollParams = null;

        // should become page = 1, size = 25, floor = 0, ceiling = 24 to
        // show first page of 25 search results
        int page = 1;
        int size = DataConstants.getDefaultPageSize();
        int floor = size * ( page - 1 );
        int ceiling = (size * page ) - 1;
      
        scrollParams = new ScrollParams();
        scrollParams.setPage( page );
        scrollParams.setSize( size );
        scrollParams.setFloor( floor );
        scrollParams.setCeiling( ceiling );

        return scrollParams;
    }
    
    public static ScrollParams getDefaultScrollParams(String table) {
        ScrollParams scrollParams = null;

        // should become page = 1, size = 25, floor = 0, ceiling = 24 to
        // show first page of 25 search results
        int page = 1;
        int size = DataConstants.getDefaultPageSize();
        int floor = size * ( page - 1 );
        int ceiling = (size * page ) - 1;
      
        scrollParams = new ScrollParams();
        scrollParams.setPage( page );
        scrollParams.setSize( size );
        scrollParams.setFloor( floor );
        scrollParams.setCeiling( ceiling );

        return scrollParams;
    }



    /**
     * Assembles different scrolling and request parameters and creates HTML hyperlinks 
     * to scroll through multiple pages of result set. This method will calculate how
     * many pages are required to display results by using number of results in 
     * searchCollection along with size param that defines how many results to show on 
     * a single page. This method will return hyperlinks using the page number itself 
     * as the display text for each link.
     *
     * @param size Number of results to show on a single page
     *
     * @param page Current page number of results being requested - if submitted page
     * is greater than total number of pages possible for this result set, maxmimum
     * page will be substituted
     *
     * @param searchParams Map containing key/value pairs of parameters used as search
     * parameters to retrieve search resultset. These parameters are translated into a 
     * querystring that is appended to each hyperlink so that they are propagated to 
     * recreate resultset on next page
     *
     * @param searchCollection <code>SearchResultsCollection</code> containing total number
     * of results for this search
     *
     * @param href Base URL each hyperlink will use to for the href attribute of the HTML linkl
     *
     * @return String containing all HTML needed to create links to scroll through result set
     */
    public static String getScrollLinks( int size, 
                                         int page, 
                                         Map searchParams, 
                                         SearchResultsCollection searchCollection, 
                                         String href ) 
    {
        String scrollText = null;
        int numResults = searchCollection.getResultSize();
        int totalPages = getTotalPages( size, numResults );
        searchCollection.setTotalPages( totalPages );

        if ( page > totalPages ) {
            page = totalPages;
        }

        // if resultset bigger than page size, save params for easy return
        if ( numResults > size ) {   
            scrollText = createScrollLinks( size, 
                                            page, 
                                            totalPages, 
                                            HTMLFactory.mapToString( searchParams, "&", "=", true ), 
                                            href,
                                            getNumericLabels( totalPages ),
                                            true // include size param in querystring
                                            );
        } 
        return scrollText;
    }


    /**
     * Assembles different scrolling and request parameters and creates HTML hyperlinks 
     * to scroll through multiple pages of result set. This version allows client code
     * to submit custom labels to be used as display text for each page's hyperlink, if
     * default view of page numbers is not desired.
     *
     * @param size Number of results to show on a single page
     *
     * @param page Current page number of results being requested - if submitted page
     * is greater than total number of pages possible for this result set, maxmimum
     * page will be substituted
     *
     * @param labels Display text to use for each page's hyperlink text.  Map must contain
     * an Integer key for page number referencing the String display value to use for that
     * page's hyperlink.
     *
     * @param linkParams Map containing key/value pairs of parameters used as search
     * parameters to retrieve search resultset. These parameters are translated into a 
     * querystring that is appended to each hyperlink so that they are propagated to 
     * recreate resultset on next page
     *
     * @param searchCollection <code>SearchResultsCollection</code> containing total number
     * of results for this search
     *
     * @param href Base URL each hyperlink will use to for the href attribute of the HTML link
     *
     * @return String containing all HTML needed to create links to scroll through result set
     */
    public static String getScrollLinks( int size,
                                         int page, 
                                         Map labels, 
                                         Map linkParams, 
                                         String href, 
                                         boolean includeSize ) {

        String scrollText = null;

        int totalPages = labels.size();

        if ( page > totalPages ) {
            page = totalPages;
        }

        // only create links text if total number of pages for resultset 
        // is greater than 1
        if ( totalPages > 1 ) {
            scrollText = createScrollLinks( size, 
                                            page, 
                                            totalPages, 
                                            HTMLFactory.mapToString( linkParams, "&", "=", true ), 
                                            href,
                                            labels,
                                            includeSize
                                            );
        } 

        return scrollText;

    }


    /**
     * Assembles different scrolling and request parameters and creates HTML hyperlinks 
     * to scroll through multiple pages of result set. Method will determine how many
     * pages are required to display results using number of search results in searchCollection
     * and size param which defines how many items to show on each page. This method 
     * will return hyperlinks using the page number itself as the display text for each link.
     *
     * <p>
     * This version also will optionally include size param in querystring, based on
     * value of includeSize argument.  This is useful for cases where number of results
     * is known to client code and cannot change, making inclusion of param redundant.
     * In these cases, leaving param wouldn't hurt, but in the name of clarity, it's better
     * to only include params that are actually used.
     *
     * @param size Number of results to show on a single page
     *
     * @param page Current page number of results being requested - if submitted page
     * is greater than total number of pages possible for this result set, maxmimum
     * page will be substituted
     *
     * @param searchParams Map containing key/value pairs of parameters used as search
     * parameters to retrieve search resultset. These parameters are translated into a 
     * querystring that is appended to each hyperlink so that they are propagated to 
     * recreate resultset on next page
     *
     * @param searchCollection <code>SearchResultsCollection</code> containing total number
     * of results for this search
     *
     * @param href Base URL each hyperlink will use to for the href attribute of the HTML linkl
     *
     * @param includeSize If <code>true</code> size param will be included in querystring, if
     * <code>false</code>, size param is omitted from querystring.

     * @return String containing all HTML needed to create links to scroll through result set
     */
    public static String getScrollLinks( int size, 
                                         int page, 
                                         Map searchParams, 
                                         SearchResultsCollection searchCollection, 
                                         String href,
                                         boolean includeSize ) {

        String scrollText = null;
        int numResults = searchCollection.getResultSize();
        int totalPages = getTotalPages( size, numResults );
        searchCollection.setTotalPages( totalPages );

        if ( page > totalPages ) {
            page = totalPages;
        }

        // if resultset bigger than page size, save params for easy return
        if ( numResults > size ) {   
            scrollText = createScrollLinks( size, 
                                            page, 
                                            totalPages, 
                                            HTMLFactory.mapToString( searchParams, "&", "=", true ), 
                                            href,
                                            getNumericLabels( numResults ),
                                            includeSize
                                            );
        } 
        return scrollText;
    }



    /**
     * Assembles different scrolling and request parameters and creates links to scroll through
     * multiple pages of result set. getScrollLinks retrieves total number of search
     * results from searchCollection, then passes to getTotalPages to determine number
     * of pages needed to display resultset based on size of each page.  This version
     * adds the parameters in queryString to the parameters in searchParams for 
     * propagation of other params besides search parameters.
     *
     * @param size Number of results to show on a single page
     *
     * @param page Current page number of results being requested - if submitted page 
     * is greater than total number of pages possible for this result set, maxmimum
     * page will be substituted
     *
     * @param searchParams Map containing key/value pairs of parameters used as search
     * parameters to retrieve search resultset. These parameters are translated into a
     * querystring that is appended to each hyperlink so that they are propagated to 
     * recreate resultset on next page
     *
     * @param queryString Querystring of additional parameters to be propagated along
     * with searchParams
     *
     * @param searchCollection <code>SearchResultsCollection</code> containing total
     * number of results for this search
     *
     * @param href Base URL each hyperlink will use to for the href attribute of the HTML linkl
     * @return String containing all HTML needed to create links to scroll through result set
     * @see SearchResultsCollection
     */

    public static String getScrollLinks( int size, 
                                         int page, 
                                         Map searchParams, 
                                         String queryString, 
                                         SearchResultsCollection searchCollection, 
                                         String href ) {
        String scrollText = null;
        int numResults = searchCollection.getResultSize();
        int totalPages = getTotalPages( size, numResults );
        searchCollection.setTotalPages( totalPages );

        if ( page > totalPages ) {
            page = totalPages;
        }

        // parse up querystring & add to searchParams with URL encoding of values
        StringTokenizer t = new StringTokenizer( queryString, "&" );
        while ( t.hasMoreTokens() ) {
            String tmp = t.nextToken();
            String key = tmp.substring( 0, tmp.indexOf( "=" ) );
            String value = tmp.substring( tmp.indexOf( "=" ) + 1, tmp.length() );
            searchParams.put( key, value );
        }

        // if resultset bigger than page size, save params for easy return
        if ( numResults > size ) {   
            String paramList = HTMLFactory.mapToString( searchParams, "&", "=", true );
            

            scrollText = createScrollLinks( size, 
                                            page, 
                                            totalPages, 
                                            paramList, 
                                            href, 
                                            getNumericLabels( numResults ),
                                            true // include size param in querystring
                                            );
        } 
        return scrollText;
    }




  
    /**
     * Creates HTML links to scroll through multiple pages of result set that is stored
     * in a db temp table.  This version is for use with searches that use a javascript
     * function mySubmit( pageNum, search_action, pageSize ) to handle form submission, and
     * so does not require an href param or a list of search parameters.  Using this
     * version means that this javascript function must be implemented on the search summary
     * page or these links will not work.
     *
     * @param size Number of results to show on a single page
     * @param page Current page number of results being requested - if submitted page 
     * is greater than total number of pages possible for this result set, maxmimum
     * page will be substituted
     * @param searchCollection Search collection containing results and overall result size
     * @see SearchResultsCollection
     */
    public static String getTableScrollLinks( int size, 
                                              int page, 
                                              SearchResultsCollection searchCollection ) 
    {
        String scrollText = null;
        int resultSize = searchCollection.getResultSize();
        int totalPages = getTotalPages( size, resultSize );
        searchCollection.setTotalPages( totalPages );
    
        if ( page > totalPages ) {
            page = totalPages;
        }
    
        if ( resultSize > size ) {   
            scrollText = createTableScrollLinks( size, page, totalPages );
        } 
        return scrollText;
    }
    
    public static String getTableScrollLinks( int size, 
                                              int page, 
                                              SearchResultsCollection searchCollection,
                                              String table_name) 
    {
        String scrollText = null;
        int resultSize = searchCollection.getResultSize();
        int totalPages = getTotalPages( size, resultSize );
        searchCollection.setTotalPages( totalPages );
    
        if ( page > totalPages ) {
            page = totalPages;
        }
    
        if ( resultSize > size ) {   
            scrollText = createTableScrollLinks( size, page, totalPages, table_name );
        } 
        return scrollText;
    }

    /**
     * Creates HTML links to scroll through multiple pages of result set that is stored
     * in a db temp table.  This version is for use with searches that use a javascript
     * function mySubmit( pageNum, search_action, pageSize ) to handle form submission, and
     * so does not require an href param or a list of search parameters.  Using this
     * version means that this javascript function must be implemented on the search summary
     * page or these links will not work.
     *
     * @param size Number of results to show on a single page
     * @param page Current page number of results being requested - if submitted page 
     * is greater than total number of pages possible for this result set, maxmimum
     * page will be substituted
     * @param int total pages in result set
     */
    public static String getTableScrollLinks( int size, int page, int totalPages ) {
        String scrollText = null;
    
        if ( page > totalPages ) {
            page = totalPages;
        }
    
        if ( totalPages > 1 ) {   
            scrollText = createTableScrollLinks( size, page, totalPages );
        } 
        return scrollText;
    }
    
    public static String getTableScrollLinks( int size, int page, int totalPages, String tableName ) {
        String scrollText = null;
    
        if ( page > totalPages ) {
            page = totalPages;
        }
    
        if ( totalPages > 1 ) {   
            scrollText = createTableScrollLinks( size, page, totalPages, tableName );
        } 
        return scrollText;
    }
    /**
     * Creates HTML links to scroll through multiple pages of result set that is stored
     * in a db temp table.  This version is for use with searches that use a javascript
     * function mySubmit( pageNum, search_action, pageSize ) to handle form submission, and
     * so does not require an href param or a list of search parameters.  Using this
     * version means that this javascript function must be implemented on the search summary
     * page or these links will not work.  This version does not use a SearchResultsCollection 
     * and creates links that redirect to the servlet using action = 'results' rather than 
     * action = 're_search' and passes the search_criteria along to the handler through the
     * page links as a parameter
     * 
     * @param size Number of results to show on a single page
     * @param page Current page number of results being requested - if submitted page
     * is greater than total number of pages possible for this result set, maxmimum
     * page will be substituted 
     *
     * @param resultSize Number of rows in whole result set
     * @param totPages Total number of pages in result set 
     * @param searchCriteria Textual message of search criteria chosen by user 
     */
    public static String getTableScrollLinks( int size, 
                                              int page, 
                                              int resultSize, 
                                              int totPages, 
                                              String searchCriteria ) 
    {
        String scrollText = null;
    
        if ( page > totPages ) {
            page = totPages;
        }
    
        if ( resultSize > size ) {   
            scrollText = createSearchTableScrollLinks( size, page, totPages, searchCriteria );
        } 
        return scrollText;
    }
    
    public static String getTableScrollLinks( int size, 
                                              int page, 
                                              int resultSize, 
                                              int totPages, 
                                              String searchCriteria,
                                              String table_name) 
    {
        String scrollText = null;
    
        if ( page > totPages ) {
            page = totPages;
        }
    
        if ( resultSize > size ) {   
            scrollText = createSearchTableScrollLinks( size, page, totPages, searchCriteria, table_name );
        } 
        return scrollText;
    }

    /**
     * Get hyperlink labels as page numbers themselves.  This is the
     * default labeling scheme used by public methods that don't explicitly
     * take labels as a param.
     */
    private static Map getNumericLabels( int resultSize ) {
        HashMap labels = new HashMap();

        for ( int i = 1; i <= resultSize; i++ ) {
            labels.put( new Integer( i ), String.valueOf( i ) );
        }
        return labels;
    }


    /**
     * Creates HTML links to scroll through a result set. Current page of results will 
     * display as text only (not a link) while other pages will be represented as hyperlinks. 
     * If there are many pages of results, current page will display with links to the 10 
     * pages above and below the current page to avoid filling the results page with hyperlinks.
     *
     * This method allows for size param to be optionally included according to value of showSize. 
     * There are cases when only requested page number is needed - could leave size in, since its 
     * ultimately ignored, but better to keep only used info. in querystring.
     *
     * Display text for each hyperlink is defined in labels param, which should be a map 
     * of Integer page numbers referencing a string display label to use for that page.
    */
    private static String createScrollLinks( int size, 
                                             int pageNum, 
                                             int totalPages, 
                                             String paramList, 
                                             String href, 
                                             Map labels,
                                             boolean showSize ) {

        StringBuffer scrollLinks = new StringBuffer();    
        String params = "";
        if ( paramList != null && !paramList.equals( "" ) ) {
            params = "&" + paramList;
        }

        // if many pages, show 10 pages above & below current page
        // -- default to page 1 & maximum page if values don't make sense
        int start_page = pageNum - 10;
        if ( start_page <= 0 ) {
            start_page = 1;
        }
    
        int end_page = pageNum + 10;
        if ( end_page > totalPages ) {
            end_page = totalPages;
        }
    
        if ( pageNum > 1 ) {
            scrollLinks.append( "<a href=\"" + href + "?pageNum=" + (pageNum - 1 ) );

            if ( showSize ) {
                scrollLinks.append( "&size=" + size );
            }

            scrollLinks.append( params + "\">previous</a> | " );
        }

        
        for ( int j = start_page; j <= end_page; j++ ) {
            // use supplied labels for this page as display text in hyperlink
            // (will often be default labels of page numbers themselves)
            String displayLabel = (String) labels.get( new Integer( j ) );

            if ( j == pageNum ) { // write current page w/out hyperlink
                scrollLinks.append( displayLabel + " | " );
            } else {
                scrollLinks.append( "<a href=\"" + href + "?pageNum=" + j );
                if ( showSize ) {
                    scrollLinks.append( "&size=" + size );
                }
                
                scrollLinks.append( params + "\">" + displayLabel + "</a> | " );
            }
        }
    
        if ( ( pageNum + 1 ) <= totalPages ) {
            scrollLinks.append( "<a href=\"" + href + "?pageNum=" + (pageNum + 1 ) );
            if ( showSize ) {
                scrollLinks.append( "&size=" + size );
            }
            scrollLinks.append( params + "\">next</a> | " );
        } 
    
        return scrollLinks.toString();
    
    }
  
    /**
     * This version is used to create scroll links on search pages where scrolling is done
     * through a result set that has been stored in a temp table.  Since all these pages use
     * a particular javascript function [mySubmit( pageNumber, searchAction, pageSize)], this
     * version has this URL hardcoded in it for simplicity -- only params are dynamically created.
     * Using this version assumes that this javascript function is implemented on the search
     * summary page, or the links will not work.
    */
    private static String createTableScrollLinks( int size, int pageNum, int totalPages, String table_name) {
        StringBuffer scrollLinks = new StringBuffer();    

        // if many pages, show 10 pages above & below current page
        // -- default to page 1 & maximum page if values don't make sense
        int start_page = pageNum - 10;
        if ( start_page <= 0 ) {
            start_page = 1;
        }

        int end_page = pageNum + 10;
        if ( end_page > totalPages ) {
            end_page = totalPages;
        }


        if ( pageNum > 1 ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum - 1)  + ", " +
                                                                    "'re_search', " + 
                                                                    size + ", '" + table_name + "') " +
                                "\">previous</a> | " );
        }

        for ( int j = start_page; j <= end_page; j++ ) {
            if ( j == pageNum ) {
                scrollLinks.append( j + " | " );
            } else {
                scrollLinks.append( "<a href=\"javascript:mySubmit( " + j + ", " + 
                                                                      "'re_search', " + 
                                                                    size + ", '" + table_name + "') " +
                                    "\">" + j + "</a> | " );
            }
        }
        
        if ( ( pageNum + 1 ) <= totalPages ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum + 1) + ", " +
                                "'re_search', " + 
                                                                    size + ", '" + table_name + "') " +
                                "\">next</a> | " );
        } 
    
        return scrollLinks.toString();
    
    }
    private static String createTableScrollLinks( int size, int pageNum, int totalPages ) {
        StringBuffer scrollLinks = new StringBuffer();    

        // if many pages, show 10 pages above & below current page
        // -- default to page 1 & maximum page if values don't make sense
        int start_page = pageNum - 10;
        if ( start_page <= 0 ) {
            start_page = 1;
        }

        int end_page = pageNum + 10;
        if ( end_page > totalPages ) {
            end_page = totalPages;
        }


        if ( pageNum > 1 ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum - 1)  + ", " +
                                                                    "'re_search', " + 
                                                                    size + ") " +
                                "\">previous</a> | " );
        }

        for ( int j = start_page; j <= end_page; j++ ) {
            if ( j == pageNum ) {
                scrollLinks.append( j + " | " );
            } else {
                scrollLinks.append( "<a href=\"javascript:mySubmit( " + j + ", " + 
                                                                      "'re_search', " + 
                                                                      size + ") " +
                                    "\">" + j + "</a> | " );
            }
        }
        
        if ( ( pageNum + 1 ) <= totalPages ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum + 1) + ", " +
                                "'re_search', " + 
                                                                    size + ") " +
                                "\">next</a> | " );
        } 
    
        return scrollLinks.toString();
    
    }

    /**
     * This version is used to create scroll links on search pages where scrolling is done
     * through a result set that has been stored in a temp table.  Since all these pages use
     * a particular javascript function [mySubmit( pageNumber, searchAction, pageSize, 
     * searchCriteria)], this version has this URL hardcoded in it for simplicity -- only 
     * params are dynamically created. Using this version assumes that this javascript 
     * function is implemented on the search summary page, or the links will not work.
     *
     * This version passes 'results' through as a parameter to the handler and also passes 
     * the string representation of the search criteria along for presentation on each of 
     * the pages
    */
    private static String createSearchTableScrollLinks( int size, 
                                                  int pageNum, 
                                                  int totalPages, 
                                                  String searchCriteria,
                                                  String table_name) 
    {
        StringBuffer scrollLinks = new StringBuffer();    

        // if many pages, show 10 pages above & below current page
        // -- default to page 1 & maximum page if values don't make sense
        int startPage = pageNum - 10;
        if ( startPage <= 0 ) {
            startPage = 1;
        }

        int endPage = pageNum + 10;
        if ( endPage > totalPages ) {
            endPage = totalPages;
        }

        if ( pageNum > 1 ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum - 1)  + ", " +
                                                                    "'results', " + 
                                                                    size + ", " +
                                                                    "'" + searchCriteria + "', '" + table_name + "') " +
                                "\">previous</a> | " );
        }

        for ( int j = startPage; j <= endPage; j++ ) {
            if ( j == pageNum ) {
                scrollLinks.append( j + " | " );
            } else {
                scrollLinks.append( "<a href=\"javascript:mySubmit( " + j + ", " +
                                                                        "'results', " + 
                                                                        size + ", '" + 
                                                                        searchCriteria + "', '" + table_name + "') " +
                                    "\">" + j + "</a> | " );
            }
        }
    
        if ( ( pageNum + 1 ) <= totalPages ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum + 1) + ", " +
                                                                    "'results', " + 
                                                                    size + ", " + 
                                                                    "'" + searchCriteria + "', '" + table_name + "') " +
                                "\">next</a> | " );
        } 
    
        return scrollLinks.toString();
    
    }

    private static String createSearchTableScrollLinks( int size, 
                                                  int pageNum, 
                                                  int totalPages, 
                                                  String searchCriteria ) 
    {
        StringBuffer scrollLinks = new StringBuffer();    

        // if many pages, show 10 pages above & below current page
        // -- default to page 1 & maximum page if values don't make sense
        int startPage = pageNum - 10;
        if ( startPage <= 0 ) {
            startPage = 1;
        }

        int endPage = pageNum + 10;
        if ( endPage > totalPages ) {
            endPage = totalPages;
        }

        if ( pageNum > 1 ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum - 1)  + ", " +
                                                                    "'results', " + 
                                                                    size + ", " +
                                                                    "'" + searchCriteria + "'" + ") " +
                                "\">previous</a> | " );
        }

        for ( int j = startPage; j <= endPage; j++ ) {
            if ( j == pageNum ) {
                scrollLinks.append( j + " | " );
            } else {
                scrollLinks.append( "<a href=\"javascript:mySubmit( " + j + ", " +
                                                                        "'results', " + 
                                                                        size + ", '" + 
                                                                        searchCriteria + "'" + ") " +
                                    "\">" + j + "</a> | " );
            }
        }
    
        if ( ( pageNum + 1 ) <= totalPages ) {
            scrollLinks.append( "<a href=\"javascript:mySubmit( " + (pageNum + 1) + ", " +
                                                                    "'results', " + 
                                                                    size + ", " + 
                                                                    "'" + searchCriteria + "'" + ") " +
                                "\">next</a> | " );
        } 
    
        return scrollLinks.toString();
    
    }



    /**
     * Creates HTML links to scroll through a result set. Current page of results will 
     * display as text only (not a link) while other pages will be represented as hyperlinks. 
     * If there are many pages of results, current page will display with links to the 10 
     * pages above and below the current page to avoid filling the results page with hyperlinks.
     *
     * This is a specialized method that assumes all links will be made to pages where 
     * page name is submitted href + page number + submitted suffix like:
     *
     * href1.html
     *
     * <p> 
     * A null string will be returned if there is only one page of results, since
     * scrolling links will not be needed.
     * 
     * <p>
     * This is currently useful for creating links for ABRC stock catalog pages, which are
     * actually links to static pages where each page file is named 
     * [stock_category]_[page number].html.  Doubtful this is much use to anyone else 
     * right now, but this seems the best place for this function...
     *
     * @param pageNum Current page of results being processed
     * @param href Base URL for files to link to. Each page number will be appended to this
     *  base URL
     * @param suffix File suffix to use for each file (submit without a dot (.))
     * @param Labels Display labels to use for each page.  Page number should be an
     *  Integer key referencing the String label to use for that page's hyperlink
     * @return String containing all HTML for displaying scroll links on pageNum's page of
     *  results
     */
    public static String createStaticNumericScrollLinks( int pageNum, 
                                                         String href,
                                                         String suffix,
                                                         Map labels ) 
    {


        String linkStr = null;

        // infer total number of pages from size of display map
        int totalPages = labels.size();
        
        // only create links if more than one page in total result set
        if ( totalPages > 1 ) {
            StringBuffer scrollLinks = new StringBuffer();    
            
            
            // if many pages, show 10 pages above & below current page
            // -- default to page 1 & maximum page if values don't make sense
            int start_page = pageNum - 10;
            if ( start_page <= 0 ) {
                start_page = 1;
            }
            
            int end_page = pageNum + 10;
            if ( end_page > totalPages ) {
                end_page = totalPages;
            }
            
            if ( pageNum > 1 ) {
                scrollLinks.append( "<a href=\"" + href + (pageNum - 1 ) + "." + suffix + 
                                    "\">previous</a> | " );
            }
            
            for ( int j = start_page; j <= end_page; j++ ) {
                // use supplied labels for this page as display text in hyperlink
                // (will often be default labels of page numbers themselves)
                String displayLabel = (String) labels.get( new Integer( j ) );
                
                if ( j == pageNum ) { // write current page w/out hyperlink
                    scrollLinks.append( displayLabel + " | " );
                } else {
                    scrollLinks.append( "<a href=\"" + href + j + "." + suffix + "\">" + 
                                        displayLabel + "</a> | " );
                }
            }
            
            if ( ( pageNum + 1 ) <= totalPages ) {
                scrollLinks.append( "<a href=\"" + href + (pageNum + 1 ) + "." + suffix +
                                    "\">next</a> | " );
            } 
    
            linkStr = scrollLinks.toString();
        }

        return linkStr;
    
    }

	public static Map<String,String> createPageLinks(int pageNum, String href, String suffix, Map labels) 
	{
		Map<String,String> pages = new LinkedHashMap<String,String>();
		int totalPages = labels.size();
		if ( totalPages < 2 ) return pages;

		if(pageNum > 1)
			pages.put("previous", href + (pageNum - 1 ) + "." + suffix); 

		int start_page = (pageNum < 11) ? 1 : (pageNum - 10);
		int end_page = (pageNum > totalPages - 10) ? totalPages : (pageNum + 10);
		for(int j = start_page; j <= end_page; j++ )
			pages.put((String)labels.get(new Integer(j)), (j == pageNum) ? null : href+j+"."+suffix);

		if(pageNum < totalPages)
			pages.put("next", href + (pageNum + 1 ) + "." + suffix); 

		return pages;
	}
}
