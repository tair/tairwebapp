//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.23 $
// $Date: 2006/02/15 01:57:07 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * CommunityFullSearcher retrieves person and organization records according to
 * submitted search parameters. Search results are stored in a temp table
 * created for a particular user, and are then returned one page at a time.
 * CommunityFullSearcher only inserts and selects from temp table; creating,
 * deleting and dropping table is done by <code>SearchSession</code>.
 * CommunityFullSearcher retrieves the relevant table name to use by querying
 * <code>MasterTableInfo</code>.
 * 
 * <p>
 * CommunityFullSearcher receives search parameters as retrieved from web
 * submission by <code>CommunitySearchHandler</code>. Results are returned as
 * <code>SearchResultsCollection</code> object containing an array of
 * <code>CommunitySummary</code> objects.
 * 
 * <p>
 * Called CommunityFullSearcher so as to avoid confusion with pre-existing
 * org.tair.community.CommunitySearcher, which mostly handles affiliation searches,
 * but is harder to rename since it's been around longer.
 * 
 * <p>
 * CommunityFullSearcher implements GeneralSearcher interface so that it can be
 * used by GeneralSearchHandler to carry out community searches as part of the
 * general search.
 */

public class CommunityFullSearcher implements GeneralSearcher {

    /**
     * Searches community records and returns a collection of items for display
     * on the community summary page. If this is the first search (i.e. if
     * firstSearch is true), a SQL query is created to retrieve records
     * according to submitted search parameters and stores them in a temp table
     * before returning the intial page of results as defined by scroll
     * parameters. On subsequent requests (when firstSearch is false), results
     * are assumed to already be in temp table and the requested slice of the
     * result set, as defined by scroll parameters, is returned.
     * 
     * @param conn
     *            An active connection to the database
     * @param searchParams
     *            Search criteria submitted through the web search form, stored
     *            as field name as a <code>String</code> key referencing the
     *            search value.
     * @param scrollParams
     *            Scroll parameters to use when scrolling through multiple pages
     *            of results
     * @param firstSearch
     *            If <code>true</code>, execute full search and save results
     *            in temp table; if <code>false</code> assume results are
     *            already in temp table and return requested page of result set.
     * @return Community search results as a
     *         <code>SearchResultsCollection</code> containing an array of
     *         <code>CommunitySummary</code> objects.
     * @throws SQLException
     *             if a database error occurs.
     */
    public SearchResultsCollection search( DBconnection conn,
                                          Map searchParams,
                                          ScrollParams scrollParams,
                                          boolean firstSearch )
        throws SQLException {

        String orderBy = (String) searchParams.get( "order" );
        String query_id = (String) searchParams.get( "query_id" );

        if ( firstSearch ) {
            
            //do preliminary table drops first. should never get here but just in case
            String del_query = getDelete( query_id );
            conn.setQuery( del_query );
            conn.executeUpdate();
            conn.releaseResources();
            
            //populate temp table w/results
            populateTempTable( conn, searchParams, query_id );
        }

        // get requested subset of results from temp table
        SearchResultsCollection searchResults = getResultSlice( conn,
                                                                scrollParams,
                                                                orderBy,
                                                                query_id );

        // get plain text version of search parameters
        if ( searchResults != null ) {
            String criteria = 
                getFormatSearchCriteria( searchParams,
                                         searchResults.getResultSize() );
            searchResults.setSearchCriteria( criteria );
        }

        return searchResults;

    }

    /**
     * Executes a community search as part of the general search. Search can be
     * done to just return number of matching community records, or to give the
     * first page of search results according to the submitted value of
     * doCounts. This method should only be called by GeneralSearchHandler as
     * part of the general search. If requesting actual search results,
     * searching will insert results into user's temp table, and redirect user
     * to normal community summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search
     * info is requested, collection will contain an array of CommunitySummary
     * objects & other search info exactly as if search() were called; if counts
     * are requested, only the result size parameter of the collection will be
     * populated
     * 
     * @param searchParams
     *            Map containing search parameters
     * @param doCounts
     *            If <code>true</code>, only counts of matching community
     *            records will be returned, if <code>false</code> first page
     *            of matching genes will be returned
     * @return SearchResultsCollection containing either number of matches, or
     *         first page of results
     * @throws SQLException
     *             thrown if a database error occurs
     */
    public SearchResultsCollection doGeneralSearch( Map searchParams,
                                                   boolean doCounts,
                                                   boolean firstSearch)
        throws SQLException {

        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        SearchResultsCollection searchResults = null;

        try {
            String searchTerm = (String) searchParams.get( "searchTerm" );
            String method = (String) searchParams.get( "method" );
            String queryID = (String) searchParams.get( "query_id" );

            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(),
                                                    method );

            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // if getting counts, just need number of distinct community ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

                // else insert result set into temp table & get first page
            } else {
                if (firstSearch) { 
                    doFullGeneralSearch( conn, searchTerm, queryID );
                } 
                
                // get first page of results from temp table, sort by name
                ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();

                searchResults = getResultSlice( conn, scrollParams, "name", queryID );

                // get plain text version of search parameters
                if ( searchResults != null ) {
                    String criteria = 
                        getFormatSearchCriteria( searchParams,
                                                 searchResults.getResultSize() );

                    searchResults.setSearchCriteria( criteria );
                }
            }

        } finally {
            if ( conn != null ) {
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
        
        if (type.equalsIgnoreCase( "form" )){
            insert_query = getTempTableQuery(conn, searchParams, "");
            //insert_query = createQuery ( conn, searchParams, "" );
        } else if (type.equalsIgnoreCase( "general" )) {
            String searchTerm = (String) searchParams.get( "searchTerm" );
            insert_query = "COMMUNITY_QUICKSEARCH_" + searchTerm;
            //String insert_query = createGeneralQuery ( conn, searchParams, ""); 
        } else {
            insert_query = getTempTableQuery( conn, searchParams, "" );
        }
        return insert_query;
    }
    
    /**
     * Retrieve distinct number of community ids where person or org name equals
     * search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn,
                                                    String searchTerm )
        throws SQLException {

        int count = 0;

        // search organization name
        String query = "SELECT COUNT( distinct op.organization_id ) "
                       + "AS community_count "
                       + getBaseFrom( true )
                       + getBaseWhere()
                       + "AND c.status = "
                       + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                       + " "
                       + "AND c.is_obsolete = 'F' "
                       + "AND op.name_uc LIKE "
                       + TextConverter.dbQuote( searchTerm )
                       + " ESCAPE '\\\' ";

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            count += results.getLong( "community_count" );
        }
        conn.releaseResources();

        // search organization aliases
        query = "SELECT count( distinct op.community_id ) AS community_count "
                + getBaseFrom( true )
                + ", CommunityAlias a "
                + getBaseWhere()
                + "AND c.status = "
                + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                + " "
                + "AND c.is_obsolete = 'F' "
                + "AND op.community_id = a.community_id "
                + "AND op.name_uc NOT LIKE "
                + TextConverter.dbQuote( searchTerm )
                + " ESCAPE '\\\' "
                + "AND a.alias_uc LIKE "
                + TextConverter.dbQuote( searchTerm )
                + " ESCAPE '\\\' ";
        conn.setQuery( query );
        results = conn.getResultSet();
        if ( results.next() ) {
            count += results.getLong( "community_count" );
        }
        conn.releaseResources();

        // search persons by last name
        query = "SELECT count( distinct op.community_id ) AS community_count "
                + getBaseFrom( false )
                + getBaseWhere()
                + "AND c.status = "
                + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                + " "
                + "AND c.is_obsolete = 'F' "
                + "AND op.last_name_uc LIKE "
                + TextConverter.dbQuote( searchTerm )
                + " ESCAPE '\\\' ";
        conn.setQuery( query );
        results = conn.getResultSet();
        if ( results.next() ) {
            count += results.getLong( "community_count" );
        }
        conn.releaseResources();

        SearchResultsCollection searchResults = new SearchResultsCollection();

        searchResults.setResultSize( count );

        return searchResults;
    }

    /**
     * Retrieve all persons and organizations whose name (last name) search
     * term; insert results into temp table, retrieve first page of results, and
     * get descriptive version of search criteria for display on summary pages
     */
    private void doFullGeneralSearch( DBconnection conn, String searchTerm,
        String queryID ) throws SQLException {

        // search organization name
        String query = getInsert()
                       + getBaseSelect( true, "NULL", "NULL", queryID )
                       + getBaseFrom( true )
                       + getBaseWhere()
                       + "AND c.status = "
                       + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                       + " "
                       + "AND c.is_obsolete = 'F' "
                       + "AND op.name_uc LIKE "
                       + TextConverter.dbQuote( searchTerm )
                       + " ESCAPE '\\\' ";

        conn.setQuery( query );
        conn.executeUpdate();
        conn.releaseResources();

        // search organization aliases
        query = getInsert()
                + getBaseSelect( true, "NULL", "NULL", queryID )
                + getBaseFrom( true )
                + ", CommunityAlias a "
                + getBaseWhere()
                + "AND op.community_id = a.community_id "
                + "AND c.status = "
                + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                + " "
                + "AND c.is_obsolete = 'F' "
                + "AND op.name_uc NOT LIKE "
                + TextConverter.dbQuote( searchTerm )
                + " ESCAPE '\\\' "
                + "AND a.alias_uc LIKE "
                + TextConverter.dbQuote( searchTerm )
                + " ESCAPE '\\\' ";

        conn.setQuery( query );
        conn.executeUpdate();
        conn.releaseResources();

        // search persons by last name
        query = getInsert()
                + getBaseSelect( false, "NULL", "NULL", queryID )
                + getBaseFrom( false )
                + getBaseWhere()
                + "AND c.status = "
                + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                + " "
                + "AND c.is_obsolete = 'F' "
                + "AND op.last_name_uc LIKE "
                + TextConverter.dbQuote( searchTerm )
                + " ESCAPE '\\\' ";

        conn.setQuery( query );
        conn.executeUpdate();
        conn.releaseResources();

    }
    
    private String getTempTableQuery( DBconnection conn,
                                    Map searchParams,
                                    String queryID ){
        String query = "";
        String search_type = (String) searchParams.get( "search_type" );
        String last_org_name = (String) searchParams.get( "last_org_name" );
        String first_name = (String) searchParams.get( "first_name" );
        String org_type = (String) searchParams.get( "org_type" );

        String primary_job_title = 
            (String) searchParams.get( "primary_job_title" );

        Long person_id_from = (Long) searchParams.get( "person_id_from" );
        Long person_id_to = (Long) searchParams.get( "person_id_to" );

        Long organization_id_from = 
            (Long) searchParams.get( "organization_id_from" );

        Long organization_id_to = 
            (Long) searchParams.get( "organization_id_to" );

        Boolean ABRC_fees_waived = 
            (Boolean) searchParams.get( "ABRC_fees_waived" );

        Boolean commercial = (Boolean) searchParams.get( "commercial" );

        // set default for calling from general result
        if ( search_type == null ) {
            search_type = "any";
        }

        // since some params are exclusive to either person or org., determine
        // if we can skip searching for one type or the other
        boolean excludeOrg = ( person_id_from != null
                               || person_id_to != null
                               || first_name != null || primary_job_title != null );

        boolean excludePerson = ( organization_id_from != null
                                  || organization_id_to != null
                                  || org_type != null
                                  || ( ABRC_fees_waived != null && 
                                  ABRC_fees_waived.booleanValue() ) || 
                                  ( commercial != null && commercial.booleanValue() ) );

        if ( ( search_type.equalsIgnoreCase( "any" ) || 
                search_type.equalsIgnoreCase( "person" ) )
             && !excludePerson ) {

            // search without aliases first
            query = query + createQuery( searchParams, false, false, queryID );

            // if name fields submitted, do search again using aliases
            if ( first_name != null || last_org_name != null ) {
                query = query + createQuery( searchParams, false, true, queryID );
            }
        }

        if ( ( search_type.equalsIgnoreCase( "any" ) || 
                search_type.equalsIgnoreCase( "organization" ) )
             && !excludeOrg ) {

            // search without aliases first
            query = query + createQuery( searchParams, true, false, queryID );

            // if org. name submitted, do search again using aliases
            if ( last_org_name != null ) {
                query = query + createQuery( searchParams, true, true, queryID );
            }
        }
        return query;
    }

    /**

    /**
     * Populate temp table with complete result set. This is done by creating
     * multiple SQL queries and storing all results in temp table. Separate
     * queries are done for persons, organizations as well as for alias searches
     * if name fields have been entered.
     */
    private void populateTempTable( DBconnection conn,
                                   Map searchParams,
                                   String queryID ) throws SQLException {

        String query = null;

        String search_type = (String) searchParams.get( "search_type" );
        String last_org_name = (String) searchParams.get( "last_org_name" );
        String first_name = (String) searchParams.get( "first_name" );
        String org_type = (String) searchParams.get( "org_type" );

        String primary_job_title = 
            (String) searchParams.get( "primary_job_title" );

        Long person_id_from = (Long) searchParams.get( "person_id_from" );
        Long person_id_to = (Long) searchParams.get( "person_id_to" );

        Long organization_id_from = 
            (Long) searchParams.get( "organization_id_from" );

        Long organization_id_to = 
            (Long) searchParams.get( "organization_id_to" );

        Boolean ABRC_fees_waived = 
            (Boolean) searchParams.get( "ABRC_fees_waived" );

        Boolean commercial = (Boolean) searchParams.get( "commercial" );

        // set default for calling from general result
        if ( search_type == null ) {
            search_type = "any";
        }

        // since some params are exclusive to either person or org., determine
        // if we can skip searching for one type or the other
        boolean excludeOrg = ( person_id_from != null
                               || person_id_to != null
                               || first_name != null || primary_job_title != null );

        boolean excludePerson = ( organization_id_from != null
                                  || organization_id_to != null
                                  || org_type != null
                                  || ( ABRC_fees_waived != null && 
                                  ABRC_fees_waived.booleanValue() ) || 
                                  ( commercial != null && commercial.booleanValue() ) );

        if ( ( search_type.equalsIgnoreCase( "any" ) || 
                search_type.equalsIgnoreCase( "person" ) )
             && !excludePerson ) {

            // search without aliases first
            query = createQuery( searchParams, false, false, queryID );
            conn.setQuery( getInsert() + query );
            conn.executeUpdate();
            conn.releaseResources();

            // if name fields submitted, do search again using aliases
            if ( first_name != null || last_org_name != null ) {
                query = createQuery( searchParams, false, true, queryID );
                conn.setQuery( getInsert() + query );
                conn.executeUpdate();
                conn.releaseResources();
            }
        }

        if ( ( search_type.equalsIgnoreCase( "any" ) || 
                search_type.equalsIgnoreCase( "organization" ) )
             && !excludeOrg ) {

            // search without aliases first
            query = createQuery( searchParams, true, false, queryID );
            conn.setQuery( getInsert() + query );
            conn.executeUpdate();

            // if org. name submitted, do search again using aliases
            if ( last_org_name != null ) {
                query = createQuery( searchParams, true, true, queryID );
                conn.setQuery( getInsert() + query );
                conn.executeUpdate();
                conn.releaseResources();
            }
        }

    }

    /**
     * Retrieve subset of total result set as defined by scrollParams
     */
    private SearchResultsCollection getResultSlice( DBconnection conn,
                                                   ScrollParams scrollParams,
                                                   String orderBy,
                                                   String queryID )
        throws SQLException {

        SearchResultsCollection searchCollection = new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;

        StringBuffer query = new StringBuffer();
        query.append( "SELECT distinct "
                      + getTableColumns( "result" )
                      + "FROM RESULT_COMMUNITY WHERE QUERY_ID = '" + queryID + "' ");

        if ( orderBy != null && !orderBy.equals( "name" ) ) {
            if ( orderBy.equals( "table_id" ) ) {
                query.append( "ORDER BY type, table_id " );

            } else if ( orderBy.equals( "type" ) ) {
                query.append( "ORDER BY sub_type, "
                              + "last_name_uc, "
                              + "first_name_uc " );

            } else if ( orderBy.equals( "location" ) ) {
                query.append( "ORDER BY country, region " );

            }
        } else {
            query.append( "ORDER BY community_type, last_name_uc, first_name_uc " );
        }

        conn.setQuery( query.toString() );

        CommunitySummary community = null;
        ArrayList found = null;

        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                if ( found == null ) {
                    found = new ArrayList();
                }
                community = getCommunityRow( results );
                found.add( community );
            }
            rowCounter++;
        }
        conn.releaseResources();

        // add to search collection
        if ( found != null && !found.isEmpty() ) {
            CommunitySummary[] searchResults = makeArray( conn, found );
            searchCollection.setResults( searchResults );
            searchCollection.setResultSize( rowCounter );
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + found.size() );

            // get links for scrolling through multiple results pages,
            String links = 
                ScrollCalculator.getTableScrollLinks( scrollParams.getSize(),
                                                      scrollParams.getPage(),
                                                      searchCollection,
                                                      queryID );
            searchCollection.setScrollLinks( links );
        }

        // set page for displaying results
        searchCollection.setResultsPage( getSummaryPage() );

        return searchCollection;
    }

    /**
     * Save data in row of result set as CommunitySummary object
     */
    private CommunitySummary getCommunityRow( ResultSet results )
        throws SQLException {

        CommunitySummary community = new CommunitySummary();
        Long id = new Long( results.getLong( "community_id" ) );
        community.set_community_id( id );
        community.set_type( results.getString( "community_type" ) );
        community.set_email( results.getString( "email" ) );
        community.set_last_name( results.getString( "last_name" ) );
        community.set_first_name( results.getString( "first_name" ) );
        community.set_sub_type( results.getString( "sub_type" ) );
        community.set_table_id( new Long( results.getLong( "table_id" ) ) );

        return community;
    }

    /**
     * Translate collection of search results to type-specific array; populate
     * extra display info. for each search result object (addresss, affiliated
     * orgs)
     */
    private CommunitySummary[] makeArray( DBconnection conn, List found )
        throws SQLException {

        CommunitySummary[] communities = null;

        if ( found != null && !found.isEmpty() ) {
            communities = new CommunitySummary[found.size()];
            communities = (CommunitySummary[]) found.toArray( communities );
            for ( int i = 0; i < communities.length; i++ ) {
                communities[i].populate( conn );
            }
        }
        return communities;
    }

    /**
     * Retrieve community data using selected community ids from search results.
     * Used for creating user downloads for items in search results. Curator
     * downloads are created using more complete <code>BsCommunity</code>
     * objects
     * 
     * @param conn
     *            An active connection to the database
     * @param communityIDs
     *            Selected community ids to retrieve data for
     * @param queryID 
     *            User's query id. Used to access temp table for user's
     *            individual results.
     */
    public CommunitySummary[] getSelected( DBconnection conn,
                                          List communityIDs,
                                          String queryID )
        throws SQLException {

        CommunitySummary[] communities = null;

        String query = "SELECT "
                       + getTableColumns("result")
                       + " FROM RESULT_COMMUNITY "
                       + " WHERE QUERY_ID = '" + queryID + "' "
                       + " AND community_id = ?";

        conn.setQuery( query );

        CommunitySummary community = null;
        ResultSet results = null;
        ArrayList found = null;

        Iterator iter = communityIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                community = getCommunityRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }
                found.add( community );
            }
        }
        conn.releaseResources();

        if ( found != null && !found.isEmpty() ) {
            communities = makeArray( conn, found );
        }
        return communities;
    }

    /**
     * Retrieves JSP URL to use for displaying gene search results
     * 
     * @return JSP URL to use for displaying gene search results
     */
    public String getSummaryPage() {
        return "/jsp/search/community_summary.jsp";
    }

    /**
     * Literal value to use when referencing temp table
     */
    private String getSearchType() {
        return "community";
    }

    /**
     * Columns in temp table as string that can be directly included in SQL
     * queries
     */
    private String getTableColumns( String type ) {
        String columns = "community_id, "
                         + "community_type, "
                         + "email, "
                         + "last_name, "
                         + "last_name_uc, "
                         + "first_name, "
                         + "first_name_uc, "
                         + "sub_type, "
                         + "table_id, "
                         + "region, "
                         + "country, "
                         + "query_id ";
        if (type.equalsIgnoreCase("all") ){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }

    /**
     * Create select clause for all searches - column list is slightly different
     * for organizations and persons; region & country will only have values if
     * user has chosen to sort result set by that value
     */
    private String getBaseSelect( boolean isOrganization,
                                 String region,
                                 String country,
                                 String queryID) {
        String select = null;

        if ( region == null ) {
            region = "NULL";
        }

        if ( country == null ) {
            country = "NULL";
        }

        if ( isOrganization ) {
            select = "SELECT distinct c.community_id, "
                     + "c.community_type, "
                     + "c.email, "
                     + "op.name, "
                     + "op.name_uc, "
                     + "NULL, "
                     + "NULL, "
                     + "op.organization_type AS sub_type, "
                     + "op.organization_id AS table_id, "
                     + region
                     + ", "
                     + country
                     + " ";

        } else {

            select = "SELECT distinct c.community_id, "
                     + "c.community_type, "
                     + "c.email, "
                     + "op.last_name, "
                     + "op.last_name_uc, "
                     + "op.first_name, "
                     + "op.first_name_uc, "
                     + "op.primary_job_title AS sub_type, "
                     + "op.person_id AS table_id, "
                     + region
                     + ", "
                     + country
                     + " ";
        }
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
     * Get from clause for all searches - slightly different for searching
     * organizations or persons
     */
    private String getBaseFrom( boolean isOrganization ) {
        String from = null;

        if ( isOrganization ) {
            from = "FROM Community c, Organization op ";
        } else {
            from = "FROM Community c, Person op ";
        }

        return from;
    }

    /**
     * Get where clause for all searches
     */
    private String getBaseWhere() {
        return "WHERE op.community_id = c.community_id ";
    }
    
    /**
    * Create delete statement for storing results in temp table
    */
    private String getDelete( String queryID ) {
        return  "DELETE FROM RESULT_COMMUNITY WHERE QUERY_ID = '" + queryID + "' ";
    }
    
    /**
     * Create insert statement for storing results in temp table
     */
    private String getInsert() {
        String insert = "INSERT /*+ APPEND */ INTO RESULT_COMMUNITY "
                        + " ( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }

    /**
     * Create SQL query from search parameters
     */
    private String createQuery( Map searchParams,
                                  boolean isOrganization,
                                  boolean alias,
                                  String queryID ) {
        String query = null;

        Boolean curatorSearch = (Boolean) searchParams.get( "curator" );

        String last_org_name = (String) searchParams.get( "last_org_name" );
        String last_org_name_method = 
            (String) searchParams.get( "last_org_name_method" );

        String first_name = (String) searchParams.get( "first_name" );
        String first_name_method = 
            (String) searchParams.get( "first_name_method" );

        String email = (String) searchParams.get( "email" );
        String email_method = (String) searchParams.get( "email_method" );

        String city = (String) searchParams.get( "city" );
        String city_method = (String) searchParams.get( "city_method" );

        String us_state = (String) searchParams.get( "us_state" );
        String other_state = (String) searchParams.get( "other_state" );

        String other_state_method = 
            (String) searchParams.get( "other_state_method" );

        String country = (String) searchParams.get( "country" );
        String url = (String) searchParams.get( "url" );
        String url_method = (String) searchParams.get( "url_method" );
        String keyword = (String) searchParams.get( "keyword" );
        String keyword_method = (String) searchParams.get( "keyword_method" );

        String primary_job_title = 
            (String) searchParams.get( "primary_job_title" );

        String org_type = (String) searchParams.get( "org_type" );
        String order_by = (String) searchParams.get( "order_by" );

        // curator search fields
        java.util.Date date_from = 
            (java.util.Date) searchParams.get( "date_from" );

        java.util.Date date_to = (java.util.Date) searchParams.get( "date_to" );

        Long person_id_from = (Long) searchParams.get( "person_id_from" );
        Long person_id_to = (Long) searchParams.get( "person_id_to" );

        Long organization_id_from = 
            (Long) searchParams.get( "organization_id_from" );

        Long organization_id_to = 
            (Long) searchParams.get( "organization_id_to" );

        String status = (String) searchParams.get( "status" );
        Boolean is_obsolete = (Boolean) searchParams.get( "is_obsolete" );

        Boolean ABRC_fees_waived = 
            (Boolean) searchParams.get( "ABRC_fees_waived" );

        Boolean commercial = (Boolean) searchParams.get( "commercial" );

        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();

        boolean addAddress = ( city != null
                               || us_state != null
                               || other_state != null
                               || country != null || 
                               ( order_by != null && order_by.equals( "location" ) ) );

        String queryRegion = ( addAddress ) ? "a.region" : null;
        String queryCountry = ( addAddress ) ? "ct.name AS country" : null;

        String what = getBaseSelect( isOrganization, queryRegion, queryCountry, queryID );
        from.append( getBaseFrom( isOrganization ) );
        where.append( getBaseWhere() );

        //
        // Add community parameters common to both types of search (person &
        // org)
        //

        if ( addAddress ) {
            from.append( ", Address a, Country ct " );
            where.append( " AND a.community_id = c.community_id " );
            where.append( " AND a.country_id = ct.country_id " );
        }

        // If doing curator search, only restrict by status & is_obsolete if
        // requested as search parameters. If doing user search, only show
        // active, non-obsolete entries
        if ( curatorSearch != null && curatorSearch.booleanValue() ) {
            if ( status != null) {
                where.append( "AND c.status = "
                              + TextConverter.dbQuote( status )
                              + " " );
            } else {
              // exclude "incomplete" status
              where.append( "AND c.status <> 'incomplete' ");
            }
            if ( is_obsolete != null && is_obsolete.booleanValue() ) {
                where.append( "AND c.is_obsolete = 'T' " );
            }
        } else {
            where.append( "AND c.status = "
                          + TextConverter.dbQuote( DataConstants.getActiveStatus() )
                          + " "
                          + "AND c.is_obsolete = 'F' " );
        }

        // restrict by last modified date
        if ( date_from != null ) {
            where.append( "AND c.last_updated >= "
                          + TextConverter.dbQuote( date_from, "mm/dd/yyyy" )
                          + " " );
        }

        if ( date_to != null ) {
            where.append( "AND c.last_updated <= "
                          + TextConverter.dbQuote( date_to, "mm/dd/yyyy" )
                          + " " );
        }

        if ( !TextConverter.isEmpty( email ) ) {
            email = TextConverter.convertEnds( email.toLowerCase(),
                                               email_method );
            where.append( "AND LOWER( c.email ) LIKE "
                          + TextConverter.dbQuote( email )
                          + " ESCAPE '\\\' " );
        }

        if ( city != null
             || us_state != null
             || other_state != null
             || country != null ) {

            if ( !TextConverter.isEmpty( city ) ) {
                city = TextConverter.convertEnds( city.toUpperCase(),
                                                  city_method );

                where.append( "AND UPPER( a.city ) LIKE "
                              + TextConverter.dbQuote( city )
                              + " ESCAPE '\\\' " );
            }

            if ( !TextConverter.isEmpty( us_state )
                 && !us_state.equalsIgnoreCase( "any" ) ) {

                where.append( "AND UPPER( a.region ) = "
                              + TextConverter.dbQuote( us_state.toUpperCase() )
                              + " " );

            } else if ( ( us_state == null || 
                            ( us_state != null && us_state.equalsIgnoreCase( "any" ) ) )
                        && other_state != null
                        && !other_state.equalsIgnoreCase( "any" ) ) {

                other_state = TextConverter.convertEnds( other_state,
                                                         other_state_method );

                where
                     .append( "AND UPPER( a.region ) LIKE "
                              + TextConverter.dbQuote( other_state.toUpperCase() )
                              + " ESCAPE '\\\' " );
            }

            if ( !TextConverter.isEmpty( country )
                 && !country.equalsIgnoreCase( "any" ) ) {

                where.append( "AND UPPER( ct.name ) LIKE "
                              + TextConverter.dbQuote( country.toUpperCase() )
                              + " ESCAPE '\\\' " );
            }
        }

        if ( !TextConverter.isEmpty( url ) ) {
            url = TextConverter.convertEnds( url, url_method );
            from.append( ", Community_URL cu, URL u " );
            where.append( "AND cu.community_id= c.community_id "
                          + "AND cu.url_id = u.url_id " );
            where.append( "AND LOWER( u.url ) LIKE "
                          + TextConverter.dbQuote( url.toLowerCase() )
                          + " ESCAPE '\\\' " );
        }

        if ( !TextConverter.isEmpty( keyword ) ) {
            keyword = TextConverter.convertEnds( keyword, keyword_method );
            from.append( ", CommunityKeyword ck " );
            where.append( "AND ck.community_id = c.community_id "
                          + "AND UPPER( ck.keyword ) LIKE "
                          + TextConverter.dbQuote( keyword.toUpperCase() )
                          + " ESCAPE '\\\' " );
        }

        if ( isOrganization ) { // add organization specific criteria

            if ( !TextConverter.isEmpty( last_org_name ) ) {
                last_org_name = 
                    TextConverter.convertEnds( last_org_name.toUpperCase(),
                                               last_org_name_method );

                // search alias table if creating alias query
                if ( alias ) {
                    from.append( ", CommunityAlias ca " );
                    where.append( "AND ca.community_id = c.community_id " );
                    where.append( "AND op.name_uc NOT LIKE "
                                  + TextConverter.dbQuote( last_org_name )
                                  + " ESCAPE '\\\' "
                                  + "AND ca.alias_uc LIKE "
                                  + TextConverter.dbQuote( last_org_name )
                                  + " ESCAPE '\\\' " );

                    // otherwise search organization name directly
                } else {
                    where.append( "AND op.name_uc LIKE "
                                  + TextConverter.dbQuote( last_org_name )
                                  + " ESCAPE '\\\' " );
                }
            }

            // restrict by org_type if present
            if ( !TextConverter.isEmpty( org_type ) ) {
                where.append( "AND op.organization_type = "
                              + TextConverter.dbQuote( org_type )
                              + " " );
            }

            // if both ids present, search range between - otherwise if only
            // one id look for exact match
            if ( organization_id_from != null && organization_id_to != null ) {
                where.append( "AND op.organization_id >= "
                              + organization_id_from.toString()
                              + " " );
                where.append( "AND op.organization_id <= "
                              + organization_id_to.toString()
                              + " " );

            } else if ( organization_id_from != null ) {
                where.append( "AND op.organization_id = "
                              + organization_id_from.toString()
                              + " " );

            } else if ( organization_id_to != null ) {
                where.append( "AND op.organization_id = "
                              + organization_id_to.toString()
                              + " " );
            }

            if ( ABRC_fees_waived != null && ABRC_fees_waived.booleanValue() ) {
                where.append( "AND op.ABRC_fees_waived = 'T' " );
            }

            if ( commercial != null && commercial.booleanValue() ) {
                where.append( "AND op.commercial = 'T' " );
            }

        } else { // add person specific criteria

            // restrict by primary job title (treated as person type)
            if ( primary_job_title != null ) {
                where.append( "AND op.primary_job_title LIKE "
                              + TextConverter.dbQuote( primary_job_title )
                              + " ESCAPE '\\\' " );
            }

            // search alias table if creating alias query
            if ( alias ) {
                from.append( ", CommunityAlias ca " );
                where.append( "AND ca.community_id = c.community_id " );

                if ( last_org_name != null && first_name != null ) {
                    last_org_name = 
                        TextConverter.convertEnds( last_org_name.toUpperCase(),
                                                   last_org_name_method );

                    first_name = 
                        TextConverter.convertEnds( first_name.toUpperCase(),
                                                   first_name_method );

                    where.append( "AND op.last_name_uc NOT LIKE "
                                  + TextConverter.dbQuote( last_org_name )
                                  + " ESCAPE '\\\' "
                                  + "AND op.first_name_uc NOT LIKE "
                                  + TextConverter.dbQuote( first_name )
                                  + " ESCAPE '\\\' "
                                  + "AND ca.alias_uc LIKE "
                                  + TextConverter.dbQuote( last_org_name )
                                  + " ESCAPE '\\\' "
                                  + "AND ca.alias_uc LIKE "
                                  + TextConverter.dbQuote( ", " + first_name )
                                  + " ESCAPE '\\\' " );

                } else if ( last_org_name != null || first_name != null ) {
                    if ( last_org_name != null ) {
                        last_org_name = 
                            TextConverter.convertEnds( last_org_name.toUpperCase(),
                                                       last_org_name_method );

                        where.append( "AND op.last_name_uc NOT LIKE "
                                      + TextConverter.dbQuote( last_org_name )
                                      + " ESCAPE '\\\' "
                                      + "AND ca.alias_uc LIKE "
                                      + TextConverter.dbQuote( last_org_name )
                                      + " ESCAPE '\\\' " );
                    }
                    if ( first_name != null ) {
                        first_name = 
                            TextConverter.convertEnds( first_name.toUpperCase(),
                                                       first_name_method );
                        where.append( "AND op.first_name_uc NOT LIKE "
                                      + TextConverter.dbQuote( first_name )
                                      + " ESCAPE '\\\' "
                                      + "AND ca.alias_uc LIKE "
                                      + TextConverter.dbQuote( ", "
                                                               + first_name )
                                      + " ESCAPE '\\\' " );
                    }
                }

                // if not doing alias query, search person first &
                // last name directly
            } else {
                if ( !TextConverter.isEmpty( last_org_name ) ) {
                    last_org_name = 
                        TextConverter.convertEnds( last_org_name.toUpperCase(),
                                                   last_org_name_method );

                    where.append( "AND op.last_name_uc LIKE "
                                  + TextConverter.dbQuote( last_org_name )
                                  + " ESCAPE '\\\' " );
                }

                if ( !TextConverter.isEmpty( first_name ) ) {
                    first_name = 
                        TextConverter.convertEnds( first_name.toUpperCase(),
                                                   first_name_method );

                    where.append( "AND op.first_name_uc LIKE "
                                  + TextConverter.dbQuote( first_name )
                                  + " ESCAPE '\\\' " );
                }
            }

            // if both ids present, search range between - otherwise if only one
            // id look for exact match
            if ( person_id_from != null && person_id_to != null ) {
                where.append( "AND op.person_id >= "
                              + person_id_from.toString()
                              + " " );
                where.append( "AND op.person_id <= "
                              + person_id_to.toString()
                              + " " );

            } else if ( person_id_from != null ) {
                where.append( "AND op.person_id = "
                              + person_id_from.toString()
                              + " " );

            } else if ( person_id_to != null ) {
                where.append( "AND op.person_id = "
                              + person_id_to.toString()
                              + " " );
            }
        }

        query = what
                + from.toString()
                + where.toString();

        Debugger.println( query );

        return query;
    }

    /**
     * Delete any existing results for a specified query already searched. This
     * special-purpose removal gets rid of existing search results for any new
     * search rather than reusing old results, as community members tend to change
     * much faster than other objects in the Search system. The community search
     * handler should call this method once it has retrieved a valid query id. The
     * method assumes the connection has autocommit set on.
     * 
     * @param connection the JDBC connection wrapper
     * @param queryId the unique identifier for the search
     * @throws SQLException when there is a database problem
     * @throws InvalidParameterException when the connection or query id is null
     */
    public void deleteSearch(DBconnection connection, String queryId)
        throws SQLException, InvalidParameterException {
      if (connection == null) {
        throw new InvalidParameterException("No connection for community member search result removal");
      }
      if (queryId == null) {
        throw new InvalidParameterException("No query id for community member search result removal");
      }
      try {
        connection.setQuery("DELETE FROM RESULT_COMMUNITY WHERE query_id = ?");
        connection.setQueryVariable(queryId);
        connection.executeUpdate();
      } finally {
        if (connection != null) {
          connection.releaseResources();
        }
      }
    }

    /*
     * Returns description of search criteria used to create result set. This is
     * a convenience method to simplify life at the JSP search summary page.
     * Include information on total number of matches for complete description
     * of result set. Interpretation of search params is slightly different if
     * doing general search versus a stand-alone gene search; use isGeneral flag
     * in searchParams to determine which type of search was done.
     */
    private String getFormatSearchCriteria( Map _searchParams, int resultSize ) {
        StringBuffer buffer = null;
        String criteria = null;
        Boolean isGeneral = null;
        Map searchParams = TextConverter.scrub(_searchParams);

        if ( searchParams != null ) {
            buffer = new StringBuffer();
            isGeneral = (Boolean) searchParams.get( "isGeneral" );

            // add criteria for general search
            if ( isGeneral != null && isGeneral.booleanValue() ) {
                String searchTerm = (String) searchParams.get( "searchTerm" );
                String method = (String) searchParams.get( "method" );

                buffer.append( "Your query for community records where " );

                if ( !TextConverter.isEmpty( searchTerm ) ) {
                    buffer.append( "last/org name "
                                   + TextConverter.convertMethods( method )
                                   + " <font class=\"emphasis\">"
                                   + searchTerm
                                   + "</font> " );
                }

            } else { // otherwise add criteria for stand-alone search

                String search_type = (String) searchParams.get( "search_type" );
                String last_org_name = (String) searchParams
                                                            .get( "last_org_name" );

                String last_org_name_method = 
                    TextConverter.convertMethods( (String) searchParams.get( "last_org_name_method" ) );

                String first_name = (String) searchParams.get( "first_name" );
                String first_name_method = 
                    TextConverter.convertMethods( (String) searchParams.get( "first_name_method" ) );

                String email = (String) searchParams.get( "email" );
                String email_method = 
                    TextConverter.convertMethods( (String) searchParams.get( "email_method" ) );

                String city = (String) searchParams.get( "city" );
                String city_method = 
                    TextConverter.convertMethods( (String) searchParams.get( "city_method" ) );

                String us_state = (String) searchParams.get( "us_state" );
                String other_state = (String) searchParams.get( "other_state" );

                String country = (String) searchParams.get( "country" );

                String url = (String) searchParams.get( "url" );
                String url_method = 
                    TextConverter.convertMethods( (String) searchParams.get( "url_method" ) );

                String keyword = (String) searchParams.get( "keyword" );
                String keyword_method = 
                    TextConverter.convertMethods( (String) searchParams.get( "keyword_method" ) );

                Boolean curator = (Boolean) searchParams.get( "curator" );
                String org_type = (String) searchParams.get( "org_type" );

                String primary_job_title = 
                    (String) searchParams.get( "primary_job_title" );

                String status = (String) searchParams.get( "statue" );

                Boolean is_obsolete = 
                    (Boolean) searchParams.get( "is_obsolete" );

                Boolean ABRC_fees_waived = 
                    (Boolean) searchParams.get( "ABRC_fees_waived" );

                Boolean commercial = (Boolean) searchParams.get( "commercial" );

                String date_from = 
                    TextConverter.dateToString( (java.util.Date) searchParams.get( "date_from" ) );

                String date_to = 
                    TextConverter.dateToString( (java.util.Date) searchParams.get( "date_to" ) );

                Long person_id_from = 
                    (Long) searchParams.get( "person_id_from" );

                Long person_id_to = (Long) searchParams.get( "person_id_to" );

                Long organization_id_from = 
                    (Long) searchParams.get( "organization_id_from" );

                Long organization_id_to = 
                    (Long) searchParams.get( "organization_id_to" );

                boolean first = true;
                buffer.append( "Your query for " );

                if ( search_type != null && search_type.equals( "organization" ) ) {

                    buffer.append( "organizations " );

                } else if ( search_type != null
                            && search_type.equals( "person" ) ) {

                    buffer.append( "persons " );

                } else {
                    buffer.append( "any community records " );
                }

                buffer.append( "where " );

                if ( !TextConverter.isEmpty( last_org_name ) ) {
                    buffer.append( "last/org name "
                                   + last_org_name_method
                                   + " <font class=\"emphasis\">"
                                   + last_org_name
                                   + "</font> " );
                    first = false;
                }

                if ( !TextConverter.isEmpty( first_name ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "first name "
                                   + first_name_method
                                   + " <font class=\"emphasis\">"
                                   + first_name
                                   + "</font> " );
                }

                if ( !TextConverter.isEmpty( email ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "email " + email_method + " " + email + " " );
                }

                if ( !TextConverter.isEmpty( city ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "city " + city_method + " " + city + " " );
                }

                if ( !TextConverter.isEmpty( us_state ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "state is " + us_state + " " );

                } else if ( !TextConverter.isEmpty( other_state ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "state is " + other_state + " " );
                }

                if ( !TextConverter.isEmpty( country ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "country is " + country + " " );
                }

                if ( !TextConverter.isEmpty( url ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "url " + url_method + " " + url + " " );
                }

                if ( !TextConverter.isEmpty( keyword ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "keyword "
                                   + keyword_method
                                   + " "
                                   + keyword
                                   + " " );

                }

                if ( !TextConverter.isEmpty( org_type ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "organization type is " + org_type + " " );
                }

                if ( !TextConverter.isEmpty( primary_job_title ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "person's job title is "
                                   + primary_job_title
                                   + " " );
                }

                if ( curator != null && curator.booleanValue() ) {

                    if ( !TextConverter.isEmpty( status ) ) {
                        first = appendComma( buffer, first );
                        buffer.append( "status is" + status + " " );
                    }

                    if ( is_obsolete != null && is_obsolete.booleanValue() ) {
                        first = appendComma( buffer, first );
                        buffer.append( "is obsolete is true " );
                    }

                    if ( ABRC_fees_waived != null
                         && ABRC_fees_waived.booleanValue() ) {
                        first = appendComma( buffer, first );
                        buffer.append( "ABRC stock charges waived is true " );
                    }

                    if ( commercial != null && commercial.booleanValue() ) {
                        first = appendComma( buffer, first );
                        buffer.append( "commercial organization is true " );
                    }

                    if ( !TextConverter.isEmpty( date_from ) ) {
                        first = appendComma( buffer, first );
                        buffer.append( "last updated from " + date_from + " " );
                    }

                    if ( !TextConverter.isEmpty( date_to ) ) {
                        first = appendComma( buffer, first );
                        buffer.append( "last updated to " + date_to + " " );
                    }

                    if ( person_id_from != null ) {
                        first = appendComma( buffer, first );
                        buffer
                              .append( "person id from " + person_id_from + " " );
                    }

                    if ( person_id_to != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "person id to " + person_id_to + " " );
                    }

                    if ( organization_id_from != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "organization id from "
                                       + organization_id_from
                                       + " " );
                    }

                    if ( organization_id_to != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "organization id to "
                                       + organization_id_to
                                       + "; " );
                    }
                }
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

    /**
     * Method to decide whether to append comma for separating search criteria
     * based on whether current value is first in list or not; returns new value
     * of flag which tracks this
     */
    private final boolean appendComma( StringBuffer buffer, boolean first ) {
        if ( !first ) {
            buffer.append( ", " );
        } else {
            first = false;
        }
        return first;
    }
}
