//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/01/30 18:58:01 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.search.dna.StockSummary;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;


/**
 * SeedSearcher handles type specific searches for seed stocks as part
 * of the general search, or to allow users to view member stocks of
 * a stock set or pool. Even though there is no stand alone search, 
 * it's helpful to package functions here using the standard 
 * Handler/Searcher/Summary form since so many of the other actions are 
 * needed.
 *
 * SeedSearcher returns search results as arrays of <code>StockSummary</code>
 * objects, a shared summary object also used by org.tair.search.dna.StockSearcher
 */

public class SeedSearcher implements GeneralSearcher {


    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display seed stock search results
     */  
    public String getSummaryPage() { 
        return "/jsp/search/seed_summary.jsp"; 
    }

    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() { 
        return "seed"; 
    }


    /**
     * Retrieves slice of result set according to parameters defined in scrollParams.
     * Since there is no stand alone seed search, the only time this method will be 
     * called with firstSearch = true is when user requests a full view of all member
     * stocks in a stock pool or set.  When coming from the general search, population
     * of temp table will occur in general search methods
     * 
     * @param conn An active connection to the database
     * @param searchParams Search params to use for retrieving result set
     * @param scrollParams ScrollParams object containing data defining floor and 
     * ceiling of result set
     * @param firstSearch Determines if this is the first time search has been executed,
     * or if this is a request for a next page of search results. This should only be
     * true when user requests list of member stocks for a stock set or pool
     * @return Search results as an <code>SearchResultsCollection</code> containing 
     * an array of StockSummary objects and data on the complete result set
     * @exception SQLException thrown if a database error occurs
     */
    public SearchResultsCollection search( DBconnection conn, 
                                           Map searchParams, 
                                           ScrollParams scrollParams,
                                           boolean firstSearch ) 
        throws SQLException {

        SearchResultsCollection searchResults = null;
        String query = null;
        String order = (String) searchParams.get( "order" );
        String queryID = (String) searchParams.get( "query_id" );

        if ( firstSearch ) { // do first search to populate temp table with full result set 
            String del_query = "DELETE FROM RESULT_SEED WHERE QUERY_ID = '" + queryID + "' ";
            conn.setQuery(del_query);
            conn.executeUpdate();
            conn.releaseResources();
            
            query = createQuery( searchParams, queryID );
            conn.setQuery( getInsert() + query );
            conn.executeUpdate();
            conn.releaseResources();
        }
    
        // get requested subset, links for scrolling through multiple results pages,
        // and plain text version of search parameters
        searchResults = getResultSlice( conn, scrollParams, order, queryID ); 
        if ( searchResults != null ) { 
            if ( !searchResults.isEmpty() ) {
                searchResults.setScrollLinks( ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
                                                                                    scrollParams.getPage(), 
                                                                                    searchResults,
                                                                                    queryID) 
                                              );
            }
            searchResults.setSearchCriteria( getFormatSearchCriteria( searchParams, 
                                                                      searchResults.getResultSize() ) );
        }
        return searchResults;
    }



    /**
     * Executes a seed stock search as part of the general search.  Search can be done to 
     * just return number of matching stock records, or to give the first page of stock
     * search results according to the submitted value of doCounts.  This method should
     * only be called by GeneralSearchHandler as part of the general search.  If requesting
     * actual search results, searching will insert results into user's temp table, and
     * redirect user to seed stock summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search info is
     * requested, collection will contain an array of StockSummary objects & other search
     * info exactly as if search() were called; if counts are requested, only the
     * result size parameter of the collection will be populated
     *
     * <p>
     * NOTE: since there is no stand alone seed search, population of temp table w/full search
     * info can only be done through this method.
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching seed stocks will be returned,
     * if <code>false</code> first page of matching seed stocks will be returned
     * @return SearchResultsCollection containing either number of matches, or first page
     * of results
     * @exception SQLException thrown if a database error occurs
     */
    public SearchResultsCollection doGeneralSearch( Map searchParams, 
                                                    boolean doCounts, boolean firstSearch ) 
        throws SQLException {

        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        SearchResultsCollection searchResults = null;
        String searchTerm = (String) searchParams.get( "searchTerm" );
        String method = (String) searchParams.get( "method" );
        String queryID = (String) searchParams.get( "query_id" );
        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(), method );
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // if getting counts, just need number of distinct stock ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

            } else { // else need to insert result set into temp table & get first page
                if (firstSearch){
                    doFullGeneralSearch( conn, searchTerm, queryID );
                } 
                
                // get first page of results from temp table, sort by stock name
                ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = getResultSlice( conn, scrollParams, "name", queryID );
    
                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
                    searchResults.setScrollLinks( 
                    ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
                                                       scrollParams.getPage(), 
                                                       searchResults,
                                                       queryID ));
                }

                // get plain text version of search parameters
                if ( searchResults != null && !searchResults.isEmpty() ) {
                    searchResults.setSearchCriteria( getFormatSearchCriteria( searchParams, 
                                                                              searchResults.getResultSize() ) );
                }
            }
      
        } finally {
            if ( conn != null ) {
                conn.releaseResources();
                connectionPool.return_connection( conn );
            }
        }

        return searchResults;
    }
 
    /**
    * get the unique identifier query line of this search
    * quick search will never have multiple parameters, 
    * so instead of generating the query, we can just return 
    * a unique identifier based on the thing searched
    */
    public String generateInsertLine( DBconnection conn, Map searchParams, String type )
    throws SQLException {                                                      
        String insert_query = "";                                                   
        if (type.equalsIgnoreCase("form") ) { 
            insert_query = createQuery( searchParams, "" );
        } else if (type.equalsIgnoreCase("general") ){ 
            String searchTerm = (String) searchParams.get( "searchTerm" );
            insert_query = "SEED_QUICKSEARCH_" + searchTerm;
        } else { 
            insert_query = createQuery( searchParams, "" );
        } 
        return insert_query;                                                                
    }
    
    /**
     * Retrieve distinct number of seed stock ids where name equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
                                                     String searchTerm ) 
        throws SQLException {

        SearchResultsCollection searchResults = null;
        ResultSet results = null;
        int count = 0;
        StringBuffer query = new StringBuffer();    
    
        query.append( "SELECT DISTINCT s.stock_id " +
                      getBaseFrom() + ", StockNameAlias sna " +
                      getBaseWhere() +
                      "AND s.stock_id = sna.stock_id " +
                      "AND sna.name LIKE " + TextConverter.dbQuote( searchTerm ) + 
                      " ESCAPE '\\\'"
                      );
    
        conn.setQuery( query.toString() );
        results = conn.getResultSet();
    
        while ( results.next() ) {
            count++;
        }
        conn.releaseResources();
        searchResults = new SearchResultsCollection();
        searchResults.setResultSize( count );
    
        return searchResults;
    }
  
    /**
     * Retrieve all seed stocks whose name matches search term; insert results 
     * into temp table, retrieve first page of results, and get descriptive version 
     * of search criteria for display on summary page
     */
    private void doFullGeneralSearch (DBconnection conn, String searchTerm, String queryID) 
    throws SQLException {

        StringBuffer query = null;
        ScrollParams scrollParams = null;
        SearchResultsCollection searchResults = null;
    
        query = new StringBuffer();
        query.append( getInsert() +
                      getBaseSelect( queryID ) +
                      getBaseFrom() +
                      ", StockNameAlias a " +
                      getBaseWhere() + 
                      "AND s.stock_id = a.stock_id " +
                      "AND a.name LIKE " + TextConverter.dbQuote( searchTerm ) +
                      " ESCAPE '\\\'"
                      );
    
        conn.setQuery( query.toString() );
        conn.executeUpdate(); // execute search & insert results into temp table
        conn.releaseResources();
    
    }
  
  
    /**
     * Retrieves requested slice of total result set
     */
    private SearchResultsCollection getResultSlice( DBconnection conn, 
                                                    ScrollParams scrollParams, 
                                                    String orderBy,
                                                    String queryID ) 
        throws SQLException {

        StockSummary[] searchResults = null;
        StockSummary stock = null;
        ArrayList found = null;
        SearchResultsCollection searchCollection = new SearchResultsCollection();
        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;
    
        // create select query to retrieve data from temp table holding full result set   
        // stocks can only be ordered by name
        StringBuffer query = new StringBuffer();
        query.append( "SELECT " + getTableColumns( "result" ) + " " +
                      "FROM RESULT_SEED WHERE QUERY_ID = '" + queryID + "' " + 
                      "ORDER BY name " 
                      );
    
        conn.setQuery( query.toString() );    
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                stock = getRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }
        
                found.add( stock );
            } 
      
            rowCounter++;
        }
        conn.releaseResources();
    
        if ( found != null && !found.isEmpty() ) {
            searchResults = makeArray( conn, found );
            searchCollection.setResults( searchResults );
            searchCollection.setResultSize( rowCounter );
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + found.size() );
        }
    
        // set JSP URL for displaying results
        searchCollection.setResultsPage( getSummaryPage() );
    
        return searchCollection;
    }
  
  
    /**
     * Retrieves selected seed stock items as <code>StockSummary</code> objects
     * from result set using supplied ids. This method is used for downloading 
     * information for selected objects.
     *
     * @param conn An active connection to the database
     * @param stockIDs Selected stock ids to retrieve from total result set
     * @param sessionID User's session id. Used to retrieve data from person specific temp table
     * @return Array of <code>PooledGenomicSummary</code> objects
     * @exception SQLException thrown if a database error occurs 
     */
    public StockSummary[] getSelected( DBconnection conn, 
                                       List stockIDs, 
                                       String queryID ) 
        throws SQLException {

        ArrayList found = null;
        StockSummary[] stocks = null;
        StockSummary stock = null;
        String query = null;
        ResultSet results = null;
        Iterator iter = null;
    
        query = 
            "SELECT " + getTableColumns( "result" ) + " "+
            "FROM RESULT_SEED WHERE QUERY_ID = '" + queryID + "' " + 
            "AND stock_id = ?";
    
        conn.setQuery( query );
        iter = stockIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                stock = getRow( results );
        
                if ( found == null ) {
                    found = new ArrayList();
                }
        
                found.add( stock );
            }
        }
        conn.releaseResources();
    
        if ( found != null && !found.isEmpty() ) {
            stocks = makeArray( conn, found );
        }
        return stocks;
    }
  
    /**
     * Save row of results as a StockSummary object
     */
    private StockSummary getRow( ResultSet results ) throws SQLException {
        StockSummary stock = new StockSummary();
        stock.set_tair_object_id( new Long( results.getLong( "tair_object_id" ) ) );
        stock.set_stock_id( new Long( results.getLong( "stock_id" ) ) );
        stock.set_name( results.getString( "name" ) );
        stock.set_stock_availability_type_id( new Long( results.getLong( "stock_availability_type_id" ) ) );
        stock.set_stock_availability_type( results.getString( "stock_availability_type" ) );
        stock.set_stock_type_id( new Long( results.getLong( "stock_type_id" ) ) );
        stock.set_stock_type( results.getString( "stock_type" ) );
    
        return stock;
    }
  
    /**
     * Translate collection of search results into type specific array;  get
     * stock description and donors for each element in array
     */
    private StockSummary[] makeArray( DBconnection conn, List found ) 
        throws SQLException {

        StockSummary[] stocks = null;
    
        if ( found != null && !found.isEmpty() ) {
            stocks = new StockSummary[ found.size() ];
            stocks = (StockSummary[]) found.toArray( stocks );
            for ( int i = 0; i < stocks.length; i++ ) {
                stocks[ i ].populate( conn ); // get other info. for each result for display
                stocks[ i ].populateDonors( conn ); // get stock donors
            }
        }
    
        return stocks;
    }
  
  
    /**
     * Get temp table columns as string that can be inserted into SQL query
     */
    private String getTableColumns( String type ) {
        String columns =
            "stock_id, " +
            "tair_object_id, " +
            "name, " +
            "stock_availability_type, " +
            "stock_availability_type_id, " +
            "stock_type, " +
            "stock_type_id, " + 
            "query_id ";
        // need to check what kind of select it is. if it is result type (called in
        // getResultSlice, then we want to not return date_last_queried
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }
  
    /**
     * Get base select for full search
     */
    private String getBaseSelect( String queryID ) {
        String select =
            "SELECT s.stock_id, " +
            "s.tair_object_id, " +
            "s.name, " +
            "sat.stock_availability_type, " +
            "s.stock_availability_type_id, " +
            "st.stock_type, " +
            "s.stock_type_id ";
        if ( queryID != null && queryID != ""){
            select = select +
            ", '" + queryID + "', CURRENT_DATE ";
        }else{
            select = select +
            ", '', '' ";
        }
        return select;
    }
  
    /**
     * Get base from clause for full search
     */
    private String getBaseFrom() {
        return "FROM Stock s, StockAvailabilityType sat, StockType st ";
    }
  
    /**
     * Get base where clause for full search
     */
    private String getBaseWhere() {
        StringBuffer where = new StringBuffer();
        where.append( "WHERE s.stock_availability_type_id = sat.stock_availability_type_id " +
                      "AND s.stock_type_id = st.stock_type_id " +
                      "AND s.is_obsolete = 'F' " +
                      "AND s.is_seed = 'T' " 
                      );
        return where.toString();
    }
  
    /**
     * Get statement to insert into temp table
     */
    private String getInsert() {
        String insert =
            "INSERT INTO RESULT_SEED " +  
            "(" + getTableColumns( "all" ) + ") ";
        return insert;
    }
    private String getDelete( String queryID ) { 
        String del = 
            "DELETE FROM RESULT_SEED WHERE QUERY_ID = '" + queryID + "' ";
        return del;
    }

    /**
     * Create SQL query to retrieve seed stocks -- should only be called
     * to retrieve member stocks of a stock set or pool
     */
    private String createQuery( Map searchParams, String queryID) {

        // create basic query
        StringBuffer from = new StringBuffer();
        StringBuffer joins = new StringBuffer();
        StringBuffer where = new StringBuffer();

        from.append( getBaseSelect( queryID ) + 
                     getBaseFrom() );
        joins.append( getBaseWhere() );
    

        // use tair object id of parent set/pool stock to retrieve member stocks
        Long parentTairObjectID = (Long) searchParams.get( "parent_id" );
   
        if ( parentTairObjectID != null ) { // should never be null if we got this far
            from.append( ", TairObject_Stock ts " );
            joins.append( "AND s.stock_id = ts.stock_id " );
            where.append( "AND ts.tair_object_id = " + parentTairObjectID.toString() );
        }

        // combine buffers to create single query
        StringBuffer query = new StringBuffer();
        query.append( from.toString() + 
                      joins.toString() +
                      where.toString() );

        Debugger.println( query.toString() );

        return query.toString();
    }
  
    /**
     * Returns description of search criteria used to create result set.
     */
    private String getFormatSearchCriteria( Map searchParams, int resultSize ) {
        StringBuffer buffer = null;
        String criteria = null;
        Boolean isGeneral = null;
    
        if ( searchParams != null ) {
            buffer = new StringBuffer();

            // do general search version of criteria
            isGeneral =(Boolean) searchParams.get( "isGeneral" );
            if ( isGeneral != null && isGeneral.booleanValue() ) {

                String searchTerm = (String) searchParams.get( "searchTerm" );
                String method = (String) searchParams.get( "method" );
                buffer.append( "Your query for stocks where " );
        
                if ( !TextConverter.isEmpty( searchTerm ) ) {
                    buffer.append( "name " + TextConverter.convertMethods( method ) +
                                   " the term <font class=\"emphasis\">" +
                                   searchTerm + "</font> " );
                }
            } else { // show criteria for stock pool or set
                String parentName = (String) searchParams.get( "parent_name" );

                buffer.append( "Your query for seed stocks that are members of the stock " +
                               "set or pool: <a href=\"TairObject?type=stock&name=" +
                               URLEncoder.encode( parentName ) + "\"> " +  
                               parentName + "</a> " );
            }

            if ( resultSize == 1 ) {
                buffer.append( " resulted in <font class=\"emphasis\">" + 
                               resultSize + "</font> match." );
            } else {
                buffer.append( " resulted in <font class=\"emphasis\">" + 
                               resultSize + "</font> matches." );
            }
            criteria = buffer.toString();
        }
        return criteria;
    } 
  
}
