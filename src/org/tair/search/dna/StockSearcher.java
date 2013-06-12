//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.16 $
// $Date: 2006/01/11 22:53:40 $
//------------------------------------------------------------------------------

package org.tair.search.dna;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.search.GeneralSearcher;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * StockSearcher is a concrete implementation of DNASearcher that handles type
 * specific searches for dna stocks. StockSearcher creates search SQL to
 * retrieve stocks given search parameters, and returns search results as arrays
 * of <code>StockSummary</code> objects. StockSearcher also handles validation
 * of search parameters for a dna stock search, and retrieval of selected dna
 * stock items from total result set for downloading.
 * 
 * StockSearcher is almost identical to PooledGenomicSearcher; it differs only
 * in that it searches all dna stocks regardless of type, whereas
 * PooledGenomicSearcher searches only dna stocks where type = 'pool'. When
 * creating search results pages, StockSearcher will populate each
 * StockSummary's collection of stock donors for display
 * 
 * <p>
 * StockSearcher implements GeneralSearcher interface so that it can be used by
 * GeneralSearchHandler to carry out dna stock searches as part of the general
 * search.
 */

public class StockSearcher extends DNASearcher implements GeneralSearcher {

    /**
     * Retrieves URL to use for displaying search results
     * 
     * @return URL of JSP to display dna stock search results
     */
    public String getSummaryPage() {
        return "/jsp/search/dna/stock_summary.jsp";
    }

    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() {
        return "stock";
    }

    /**
     * Executes a dna stock search as part of the general search. Search can be
     * done to just return number of matching dna stock records, or to give the
     * first page of stock search results according to the submitted value of
     * doCounts. This method should only be called by GeneralSearchHandler as
     * part of the general search. If requesting actual search results,
     * searching will insert results into user's temp table, and redirect user
     * to normal DNA stock summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search
     * info is requested, collection will contain an array of StockSummary
     * objects & other search info exactly as if search() were called; if counts
     * are requested, only the result size parameter of the collection will be
     * populated
     * 
     * @param searchParams
     *            Map containing search parameters
     * @param doCounts
     *            If <code>true</code>, only counts of matching DNA stocks
     *            will be returned, if <code>false</code> first page of
     *            matching DNA stocks will be returned
     * @return SearchResultsCollection containing either number of matches, or
     *         first page of results
     * @throws SQLException
     *             thrown if a database error occurs
     */
    public SearchResultsCollection doGeneralSearch( Map searchParams,
                                                   boolean doCounts,
                                                   boolean firstSearch )
        throws SQLException {

        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        SearchResultsCollection searchResults = null;
        ScrollParams scrollParams = null;

        String searchTerm = (String) searchParams.get( "searchTerm" );
        String method = (String) searchParams.get( "method" );
        String queryID = "";

        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(),
                                                    method );

            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // if getting counts, just need number of distinct stock ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

                // else need to insert result set into temp table and
                // get first page
            } else {
                queryID = (String) searchParams.get("query_id");
                if (firstSearch) { 
                    doFullGeneralSearch( conn,searchTerm,queryID );

                }
                // get first page of results from temp table, sort by stock name
                scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = getResultSlice( conn, scrollParams, "name", queryID );

                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
                    searchResults.setScrollLinks( ScrollCalculator.getTableScrollLinks( scrollParams.getSize(),
                                                                                scrollParams.getPage(),
                                                                                searchResults,
                                                                                queryID ) );
                }
                
                // get plain text version of search parameters
                if ( searchResults != null && !searchResults.isEmpty() ) {
                    searchResults.setSearchCriteria( getFormatSearchCriteria( searchParams,
                                                            searchResults.getResultSize() ) );
                }

            }

        } finally {
            connectionPool.return_connection( conn );
        }

        return searchResults;
    }

    /**
     * Retrieve distinct number of dna stock ids where name equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn,
                                                    String searchTerm )
        throws SQLException {

        SearchResultsCollection searchResults = null;
        ResultSet results = null;
        int count = 0;
        StringBuffer query = new StringBuffer();

        query.append( "SELECT DISTINCT s.stock_id "
                      + getBaseFrom()
                      + ", StockNameAlias sna "
                      + getBaseWhere()
                      + "AND s.stock_id = sna.stock_id "
                      + "AND sna.name LIKE "
                      + TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\' " );

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
    * get the unique identifier query line of this search
    * quick search will never have multiple parameters, 
    * so instead of generating the query, we can just return 
    * a unique identifier based on the thing searched
    */
    public String generateInsertLine( DBconnection conn, 
                                    Map searchParams, String type )
    throws SQLException {
        if (type.equalsIgnoreCase("form") ) {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        } else if (type.equalsIgnoreCase("general")) {
            String searchTerm = (String) searchParams.get("searchTerm");
            String insert_query = "STOCK_QUICKSEARCH_" + searchTerm;
            super.clearTables();
            return insert_query;
        } else {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        }
    }
    
    /**
     * Retrieve all dna stocks whose name matches search term; insert results
     * into temp table, retrieve first page of results, and get descriptive
     * version of search criteria for display on summary page
     */
    private void doFullGeneralSearch( DBconnection conn, String searchTerm,
                                                         String queryID )
        throws SQLException {

        StringBuffer query = null;
        ScrollParams scrollParams = null;
        SearchResultsCollection searchResults = null;

        query = new StringBuffer();
        query.append( getInsert()
                      + getBaseSelect( queryID )
                      + getBaseFrom()
                      + ", StockNameAlias a "
                      + getBaseWhere()
                      + "AND s.stock_id = a.stock_id "
                      + "AND a.name LIKE "
                      + TextConverter.dbQuote( searchTerm ) + 
                      " ESCAPE '\\\' " );

        conn.setQuery( query.toString() );
        conn.executeUpdate(); // execute search & insert results into temp
                                // table
        conn.releaseResources();

    }

    /**
     * Retrieves requested slice of total result set
     * 
     * @param conn
     *            An active connection to the database
     * @param scrollParams
     *            ScrollParams object containing data defining floor and ceiling
     *            of result set
     * @param sessionID
     *            User's session id. Used to retrieve data from person specific
     *            temp table
     * @param String
     *            orderBy Field to order search results by
     * @return DNA stock search results as an
     *         <code>SearchResultsCollection</code> containing an array of
     *         <code>StockSummary</code> objects and data on the complete
     *         result set
     * @throws SQLException
     *             thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn,
                                                  ScrollParams scrollParams,
                                                  String orderBy,
                                                  String queryID)
        throws SQLException {

        StockSummary[] searchResults = null;
        StockSummary stock = null;
        ArrayList found = null;

        SearchResultsCollection searchCollection = new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;

        // create select query to retrieve data from temp table holding full
        // result set stocks can only be ordered by name
        StringBuffer query = new StringBuffer();
        query.append( "SELECT DISTINCT "
                      + getTableColumns( "result" )
                      + " FROM RESULT_STOCK WHERE QUERY_ID = '" + queryID + "' "
                      + " ORDER BY name " );

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
     * Retrieves selected dna stock items as <code>StockSummary</code>
     * objects, which implement the <code>DNASummary</code> interface, from
     * result set using supplied ids. This method is used for downloading
     * information for selected objects.
     * 
     * @param conn
     *            An active connection to the database
     * @param stockIDs
     *            Selected stock ids to retrieve from total result set
     * @param sessionID
     *            User's session id. Used to retrieve data from person specific
     *            temp table
     * @return Array of <code>StockSummary</code> objects
     * @throws SQLException
     *             thrown if a database error occurs
     */
    public DNASummary[] getSelected( DBconnection conn,
                                    List stockIDs,
                                    String queryID ) throws SQLException {

        ArrayList found = null;
        StockSummary[] stocks = null;
        StockSummary stock = null;
        ResultSet results = null;

        String query = "SELECT "
                       + getTableColumns( "result" )
                       + " "
                       + "FROM RESULT_STOCK WHERE QUERY_ID = '" + queryID + "' "
                       + "AND stock_id = ?";

        conn.setQuery( query );
        Iterator iter = stockIDs.iterator();
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
        stock
             .set_tair_object_id( new Long( results.getLong( "tair_object_id" ) ) );

        stock.set_stock_id( new Long( results.getLong( "stock_id" ) ) );
        stock.set_name( results.getString( "name" ) );
        stock
             .set_stock_availability_type_id( new Long( results
                                                               .getLong( "stock_availability_type_id" ) ) );

        stock
             .set_stock_availability_type( results
                                                  .getString( "stock_availability_type" ) );

        stock
             .set_stock_type_id( new Long( results.getLong( "stock_type_id" ) ) );

        stock.set_stock_type( results.getString( "stock_type" ) );

        return stock;
    }

    /**
     * Translate collection of search results into type specific array; get
     * stock description and donors for each element in array
     */
    private StockSummary[] makeArray( DBconnection conn, List found )
        throws SQLException {

        StockSummary[] stocks = null;

        if ( found != null && !found.isEmpty() ) {
            stocks = new StockSummary[found.size()];
            stocks = (StockSummary[]) found.toArray( stocks );
            for ( int i = 0; i < stocks.length; i++ ) {
                // get stock descriptions for each result for display
                stocks[i].populate( conn );
                stocks[i].populateDonors( conn ); // get stock donors
            }
        }

        return stocks;
    }

    /**
     * Get temp table columns as string that can be inserted into SQL query
     */
    private String getTableColumns( String type ) {
        String columns = "stock_id, "
                         + "tair_object_id, "
                         + "name, "
                         + "stock_availability_type, "
                         + "stock_availability_type_id, "
                         + "stock_type, "
                         + "stock_type_id, " 
                         + "query_id ";
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
        String select = "SELECT s.stock_id, "
                        + "s.tair_object_id, "
                        + "s.name, "
                        + "sat.stock_availability_type, "
                        + "s.stock_availability_type_id, "
                        + "st.stock_type, "
                        + "s.stock_type_id ";
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
        where.append( "WHERE s.stock_availability_type_id = "
                      + "sat.stock_availability_type_id "
                      + "AND s.stock_type_id = st.stock_type_id "
                      + "AND s.is_obsolete = 'F' "
                      + "AND s.is_seed = 'F' " );
        return where.toString();
    }

    /**
     * Get statement to insert into temp table
     */
    public String getInsert() {
        String insert = "INSERT INTO RESULT_STOCK "
                        + " ( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }
    
    public String getDelete(String query_id){
        String del =
            "DELETE FROM RESULT_STOCK WHERE QUERY_ID = '" + query_id + "' ";
            return del;
        }



    /**
     * Adds criteria to search dna stock by donor name. Overridden from
     * superclass since we don't need to sub-select on Stock when it's our
     * starting point
     * 
     * <p>
     * Search will search for donor Person or Organization according to the
     * value of personSearch param.
     * 
     * @param where
     *            WHERE clause to add criteria to
     * @param term
     *            Term to search donor names for
     * @param prefix
     *            Table prefix to use when joining to donor criteria (ignored in
     *            this implementation, but need to keep it in param list so
     *            searching can still be done through polymorphic implementation
     *            of this method)
     * @param personSearch
     *            If <code>true</code> donor person last name will be
     *            searched, if <code>false</code> donor organization name will
     *            be searched
     */
    protected void searchDonorName( StringBuffer where,
                                   String term,
                                   String prefix,
                                   boolean personSearch ) {
        // use same table alias for simplicity
        String table = personSearch ? "Person p" : "Organization p";
        String searchColumn = personSearch ? "p.last_name_uc" : "p.name_uc";

        where.append( "AND EXISTS ( "
                      + "SELECT 'X' "
                      + "FROM Donor d, Community cm, "
                      + table
                      + " "
                      + "WHERE d.stock_id = s.stock_id "
                      + "AND d.community_id = cm.community_id "
                      + "AND cm.community_id = p.community_id "
                      + "AND d.community_id = p.community_id "
                      + "AND cm.is_obsolete = 'F' "
                      + "AND cm.status = "
                      + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                      + " "
                      + "AND "
                      + searchColumn
                      + " LIKE "
                      + term
                      + " ESCAPE '\\\') " );
    }

    /**
     * Adds criteria to search dna stocks by donor stock number. Overridden from
     * superclass since we don't need to sub-select on Stock when it's our
     * starting point
     * 
     * @param where
     *            WHERE clause to add criteria to
     * @param term
     *            Term to search donor stock numbers for
     * @param prefix
     *            Table prefix to use when joining to donor criteria (ignored in
     *            this implementation, but need to keep it in param list so
     *            searching can still be done through polymorphic implementation
     *            of this method)
     */
    protected void searchDonorStockNumber( StringBuffer where,
                                          String term,
                                          String prefix ) {
        where.append( "AND EXISTS ( "
                      + "SELECT 'X' "
                      + "FROM Donor d "
                      + "WHERE d.stock_id = s.stock_id "
                      + "AND d.donor_stock_number_uc LIKE "
                      + term
                      + " ESCAPE '\\\') " );
    }

    /**
     * Adds criteria to search dna stock by stock number. Overridden from
     * superclass since we don't need to sub-select on Stock when it's our
     * starting point
     * 
     * @param where
     *            WHERE clause to add criteria to
     * @param term
     *            Term to search donor names for
     * @param prefix
     *            Table prefix to use when joining to donor criteria (ignored in
     *            this implementation, but need to keep it in param list so
     *            searching can still be done through polymorphic implementation
     *            of this method)
     * @param filter
     *            If <code>true</code> then stock number must be for stock
     *            where type is "filter" (ignored in this implementations since
     *            search by filter name is never done when searching for dna
     *            stock)
     */
    protected void searchStockNumber( StringBuffer where,
                                     String term,
                                     String prefix,
                                     boolean filter ) {
        where.append( "AND EXISTS ( "
                      + "SELECT 'X' "
                      + "FROM StockNameAlias sna "
                      + "WHERE sna.stock_id = s.stock_id "
                      + "AND sna.name LIKE "
                      + term
                      + " ESCAPE '\\\') " );
    }

    /**
     * Adds criteria to search dna stock by stock description. Overridden from
     * superclass since we don't need to sub-select on Stock when it's our
     * starting point
     * 
     * <p>
     * Description searching is done using description_uc specialized search
     * field
     * 
     * @param where
     *            WHERE clause to add criteria to
     * @param term
     *            Term to search donor names for
     * @param prefix
     *            Table prefix to use when joining to donor criteria (ignored in
     *            this implementation, but need to keep it in param list so
     *            searching can still be done through polymorphic implementation
     *            of this method)
     */
    protected void searchStockDescription( StringBuffer where,
                                          String term,
                                          String prefix ) {
        where.append( "AND s.description_uc LIKE " + term + " ESCAPE '\\\' " );
    }

    /**
     * Creates SQL to retrieve dna stock given search parameters, and insert
     * into temp table created for user with sessionID. Query creation is
     * handled by adding dna stock specific data to query here, and then using
     * createQuery() in <code>DNASearcher</code> superclass to add all other
     * search criteria to query
     * 
     * @param searchParams
     *            Search criteria to use when retrieving result set
     * @param sessionID
     *            User's session id to use when creating temp table to hold
     *            user's search results
     * @return SQL query to retrieve dna stock given searchParams and insert
     *         into temp table
     */
    public String createQuery( Map searchParams, String queryID) {
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();

        // create base query
        from.append( getBaseSelect( queryID ) + getBaseFrom() );
        joins.append( getBaseWhere() );
        super.addTable( "Stock" );

        String subQuery = super.createQuery( searchParams,
                                             "s",
                                             from,
                                             where,
                                             joins );

        return subQuery;
    }

    /**
     * Validates search parameters for a dna stock search. Any errors
     * encountered are stored in errors Map with field name as
     * <code>String</code> key referencing a <code>String</code> error
     * message
     * 
     * @param searchParams
     *            Search parameters to validate
     * @param errors
     *            Map to hold all errors encountered while validating
     */
    public void validateParams( Map searchParams, Map errors ) {

        String term_1 = (String) searchParams.get( "term_1" );
        String type_1 = (String) searchParams.get( "type_1" );

        String term_2 = (String) searchParams.get( "term_2" );
        String type_2 = (String) searchParams.get( "type_2" );

        String term_3 = (String) searchParams.get( "term_3" );
        String type_3 = (String) searchParams.get( "type_3" );

        String[] vector_type = (String[]) searchParams.get( "vector_type" );
        String[] insert_type = (String[]) searchParams.get( "insert_type" );

        String[] clone_end_type = (String[]) searchParams
                                                         .get( "clone_end_type" );

        Boolean is_sequenced = (Boolean) searchParams.get( "is_sequenced" );

        Boolean is_genetic_marker = (Boolean) searchParams
                                                          .get( "is_genetic_marker" );

        Boolean is_on_a_map = (Boolean) searchParams.get( "is_on_a_map" );

        Boolean is_full_length_cds = (Boolean) searchParams
                                                           .get( "is_full_length_cds" );

        String chromosome = (String) searchParams.get( "chromosome" );
        String map_type = (String) searchParams.get( "map_type" );
        String order = (String) searchParams.get( "order" );

        // DNA stocks aren't map elements, so all map/sequence params as
        // well as join to GeneticMarker are invalid
        if ( is_sequenced != null && is_sequenced.booleanValue() ) {
            errors.put( "is sequenced", "DNA stocks cannot be sequenced" );
        }

        if ( ( is_on_a_map != null && is_on_a_map.booleanValue() )
             || !TextConverter.isEmpty( chromosome )
             || !TextConverter.isEmpty( map_type )
             || ( order != null && order.equals( "position" ) ) ) {
            errors.put( "Map position", "DNA stocks cannot be searched or "
                                        + "sorted by map position" );
        }

        if ( is_genetic_marker != null && is_genetic_marker.booleanValue() ) {
            errors.put( "is genetic marker",
                        "DNA stocks cannot be genetic markers" );
        }

        if ( is_full_length_cds != null && is_full_length_cds.booleanValue() ) {
            errors.put( "is full length cDNA",
                        "DNA stocks cannot be full length cDNA" );
        }

        // if searching by vector type, insert type or clone end type...
        if ( ( vector_type != null && vector_type.length > 0 )
             && !vector_type[0].equalsIgnoreCase( "any" ) ) {
            errors.put( "Vector type",
                        "DNA stocks cannot be searched by vector type" );
        }

        if ( ( insert_type != null && insert_type.length > 0 )
             && !insert_type[0].equalsIgnoreCase( "any" ) ) {
            errors.put( "Insert type",
                        "DNA stocks cannot be searched by insert type" );
        }

        if ( ( clone_end_type != null && clone_end_type.length > 0 )
             && !clone_end_type[0].equalsIgnoreCase( "any" ) ) {
            errors.put( "Clone end type",
                        "DNA stocks cannot be searched by clone end type" );
        }

        if ( !validTermType( term_1, type_1 ) ) {
            errors.put( "term 1", "DNA stocks cannot be searched by " + type_1 );
        }

        if ( !validTermType( term_2, type_2 ) ) {
            errors.put( "term 2", "DNA stocks cannot be searched by " + type_2 );
        }

        if ( !validTermType( term_3, type_3 ) ) {
            errors.put( "term 3", "DNA stocks cannot be searched by " + type_3 );
        }

    }

    /**
     * Determine if selected search term type is valid for dna stock search
     */
    private boolean validTermType( String term, String type ) {
        boolean valid = true;

        if ( term != null && type != null ) {
            if ( type.equals( "clone" ) ) {
                valid = false;

            } else if ( type.equals( "clone_end" ) ) {
                valid = false;

            } else if ( type.equals( "library" ) ) {
                valid = false;

            } else if ( type.equals( "vector" ) ) {
                valid = false;

            } else if ( type.equals( "accession" ) ) {
                valid = false;

            } else if ( type.equals( "genbank_gi" ) ) {
                valid = false;

            } else if ( type.equals( "filter" ) ) {
                valid = false;

            } else if ( type.equals( "locus" ) ) {
                valid = false;

            } else if ( type.equals( "gene" ) ) {
                valid = false;

            } else if ( type.equals( "strain_name" ) ) {
                valid = false;

            } else if ( type.equals( "strain_description" ) ) {
                valid = false;
            }

        }

        return valid;
    }

    /*
     * Returns description of search criteria used to create result set when
     * searching using general search. This method is defined as an adapter
     * method in DNASearcher superclass, and must be implemented in each
     * sub-class to allow for type-specific definition of search criteria.
     */
    protected String getGeneralSearchCriteria( Map searchParams, int resultSize ) {
        StringBuffer buffer = null;
        String criteria = null;

        if ( searchParams != null ) {
            buffer = new StringBuffer();

            String searchTerm = (String) searchParams.get( "searchTerm" );
            String method = (String) searchParams.get( "method" );
            buffer.append( "Your query for stocks where " );

            if ( !TextConverter.isEmpty( searchTerm ) ) {
                buffer.append( "name "
                               + TextConverter.convertMethods( method )
                               + " the term <font class=\"emphasis\">"
                               + searchTerm
                               + "</font> " );
            }

            if ( resultSize == 1 ) {
                buffer.append( " resulted in <font class=\"emphasis\">"
                               + resultSize
                               + "</font> match." );
            } else {
                buffer.append( " resulted in <font class=\"emphasis\">"
                               + resultSize
                               + "</font> matches." );
            }
            criteria = buffer.toString();
        }
        return criteria;
    }

}
