//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2006/03/03 17:51:21 $
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
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * EcotypeSearcher retrieves ecotype records according to submitted 
 * search parameters. Search results are stored in a temp table created 
 * for a particular user, and are then returned one page at a time. 
 * EcotypeSearcher only inserts and selects from temp table; creating, 
 * deleting and dropping table is done by <code>SearchSession</code>.  
 * EcotypeSearcher retrieves the relevant table name to use by querying 
 * <code>MasterTableInfo</code>.
 *
 * <p>
 * EcotypeSearcher receives search parameters as retrieved from web 
 * submission by <code>EcotypeSearchHandler</code>. 
 *
 * <p>
 * EcotypeSearcher implements GeneralSearcher interface so that it can be 
 * used by GeneralSearchHandler to carry out ecotype searches as part of 
 * the general search.
 */

public class EcotypeSearcher implements GeneralSearcher {

    private String searchType = "ecotype";

    /**
     * Executes search using submitted search parameters and returns slice of 
     * result set according to parameters defined in scrollParams. When initially
     * searching, results are stored in a person specific temp table. Subsequent
     * calls will then retrieve from temp table to show current page of result 
     * set
     * 
     * @param conn An active connection to the database
     * @param searchParams Search params to use for retrieving result set
     * @param scrollParams ScrollParams object containing data defining floor 
     * and ceiling of result set
     * @param firstSearch If <code>true</code> this is the first time this 
     * search has been executed, so full search should be executed w/results 
     * being stored in a temp table for later retrieval. If <code>false</code>, 
     * temp table has already been populated, so can simply retrieve requested 
     * slice of result set
     * @return Search results as an <code>SearchResultsCollection</code> 
     * containing an array of EcotypeSummary objects and data on the complete 
     * result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection search( DBconnection conn, 
                                           Map searchParams, 
                                           ScrollParams scrollParams, 
                                           boolean firstSearch ) 
	    throws SQLException {

        SearchResultsCollection searchResults = null;
        String query = null;
        String orderBy = (String) searchParams.get( "order" );
        String queryID = (String) searchParams.get("query_id"); 
        
        // do first search to populate temp table with full result set 
        if ( firstSearch ) { 

            //do preliminary table drops first. should never get here but jsut in case
            String del_query = getDelete( queryID );
            conn.setQuery( del_query );
            conn.executeUpdate();
            conn.releaseResources();

            query = getInsert() + createQuery( searchParams, queryID );
            System.out.println("query : " + query);
            conn.setQuery( query );
            conn.executeUpdate();
            conn.releaseResources();
        }
        
        // get requested subset of results from temp table
        searchResults = getResultSlice( conn, 
                                        scrollParams, 
                                        orderBy,
                                        queryID ); 
        
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
     * Executes a ecotype search as part of the general search.  Search can be
     * done to just return number of matching ecotype records, or to give the 
     * first page of ecotype search results according to the submitted value of
     * doCounts.  This method should only be called by GeneralSearchHandler as
     * part of the general search.  If requesting actual search results, 
     * searching will insert results into user's temp table, and redirect user
     * to normal ecotype summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search 
     * info is requested, collection will contain an array of EcotypeSummary 
     * objects & other search info exactly as if search() were called; if 
     * counts are requested, only the result size parameter of the collection
     * will be populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching ecotypes 
     * will be returned, if <code>false</code> first page of matching ecotypes 
     * will be returned
     * @return SearchResultsCollection containing either number of matches, or 
     * first page of results
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection doGeneralSearch( Map searchParams, 
                                                    boolean doCounts,
                                                    boolean firstSearch) 
	    throws SQLException {
        
        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        SearchResultsCollection searchResults = null;
        String searchTerm = (String) searchParams.get( "searchTerm" );
        String method = (String) searchParams.get( "method" );
        String queryID = (String) searchParams.get("query_id");
        ScrollParams scrollParams = null;

        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(), 
                                                    method );
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.get_connection();
            
            // if getting counts, just need number of distinct species 
            // variant ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );
                
                // else need to insert result set into temp table & 
                // get first page
            } else { 
                if (firstSearch) { 
                    doFullGeneralSearch( conn, searchTerm, queryID );
                }
                
                // get first page of results from temp table, sort by name
                scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = getResultSlice( conn, scrollParams, "name", queryID );
        
                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
                    String links = 
                        ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
                                                        scrollParams.getPage(), 
                                                        searchResults );
                    searchResults.setScrollLinks( links );
                }
                
                // get plain text version of search parameters
                if ( searchResults != null && !searchResults.isEmpty() ) {
                    String criteria = 
                        getFormatSearchCriteria( searchParams, 
                                                 searchResults.getResultSize() );
                    searchResults.setSearchCriteria( criteria );
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
        
        if (type.equalsIgnoreCase( "form" )){
            insert_query = createQuery( searchParams, "" );
        }else if (type.equalsIgnoreCase( "general" ) ){
            String searchTerm = (String) searchParams.get( "searchTerm" );
            insert_query = "ECOTYPE_QUICKSEARCH_" + searchTerm;
        }else{
            insert_query = createQuery( searchParams, "" );
        }
        return insert_query;                                                                
    }
    
    /**
     * Retrieve distinct number of species variant ids where abbrev. name 
     * equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
                                                     String searchTerm ) 
	    throws SQLException {
        
        SearchResultsCollection searchResults = null;
        ResultSet results = null;
        int count = 0;
        StringBuffer query = new StringBuffer();    
        
        query.append( "SELECT DISTINCT s.species_variant_id " +
                      getBaseFrom() +
                      getBaseWhere() +
                      "AND ( UPPER( s.abbrev_name ) LIKE " + 
                      TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\' " +
                      "OR UPPER( s.name ) LIKE " + 
                      TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\') " );
        
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
     * Retrieve all species variants whose abbrev. name matches search term; 
     * insert results into temp table, retrieve first page of results, and get
     * descriptive version of search criteria for display on summary page
     */
    private void doFullGeneralSearch( DBconnection conn, String searchTerm, 
        String queryID ) throws SQLException {
        
        StringBuffer query = null;
        
        query = new StringBuffer();
        query.append( getInsert() +
                      getBaseSelect( queryID ) + 
                      getBaseFrom() +
                      getBaseWhere() +
                      "AND ( UPPER( s.abbrev_name ) LIKE " + 
                      TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\' " +
                      "OR UPPER( s.name ) LIKE " + 
                      TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\') " );
        
        // execute search & insert results into temp table
        conn.setQuery( query.toString() );
        conn.executeUpdate(); 
        conn.releaseResources();
        
    }



    /**
     * Retrieves requested slice of total result set as defined by scrollParams
     */
    private SearchResultsCollection getResultSlice( DBconnection conn, 
                                                    ScrollParams scrollParams, 
                                                    String orderBy,
                                                    String queryID) 
	    throws SQLException {
        
        EcotypeSummary[] searchResults = null;
        EcotypeSummary ecotype = null;
        ArrayList found = null;
        ResultSet results = null;
        SearchResultsCollection searchCollection = new SearchResultsCollection();
        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;
        
        StringBuffer query = new StringBuffer();
        query.append( "SELECT " + getTableColumns( "result" ) + " " +
                      "FROM RESULT_ECOTYPE WHERE QUERY_ID = '" + queryID + "' ");
        
        if ( orderBy != null ) {
            if ( orderBy.equals( "name" ) ) {
                query.append( "ORDER BY name, abbrev_name" );
                
            } else if ( orderBy.equals( "location" ) ) {
                query.append( "ORDER BY location, name, abbrev_name" );
                
            } else if (orderBy.equals( "country" ) ) {
                query.append( "ORDER BY country, name, abbrev_name" );
            }
            
        } else { // default to ecotype name 
            query.append( "ORDER BY name, abbrev_name" );
        }
        
        conn.setQuery( query.toString() );    
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                ecotype = getEcotypeRow( results );
                
                if ( found == null ) {
                    found = new ArrayList();
                }
                
                found.add( ecotype );
            }
            rowCounter++;
        }
        conn.releaseResources();
        
        if ( found != null && !found.isEmpty() ) {
            searchResults = makeArray( conn, found, false );
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
     * Retrieve ecotypes using selected species variant ids from search results. 
     * Used for creating downloads for items in search results.
     *
     * @param conn  An active connection to the database
     * @param ecotypeIDs Selected ecotype ids to retrieve data for
     * @param queryID User's query id. Used to access temp table for user's
     * individual results.
     */
    public EcotypeSummary[] getSelected( DBconnection conn, 
                                         List speciesVariantIDs, 
                                         String queryID ) 
	    throws SQLException {
        
        ArrayList found = null;
        EcotypeSummary[] ecotypes = null;
        EcotypeSummary ecotype = null;
        String query = null;
        ResultSet results = null;
        Iterator iter = null;
        
        query = 
            "SELECT " + getTableColumns( "result" ) + " " +
            "FROM RESULT_ECOTYPE WHERE QUERY_ID = '" + queryID + "' " + 
            "AND species_variant_id = ?";
        conn.setQuery( query );
        
        iter = speciesVariantIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            if ( results.next() ) {
                ecotype = getEcotypeRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }
                
                found.add( ecotype );
            }
            results.close();
        }
        conn.releaseResources();
        
        if ( found != null && !found.isEmpty() ) {
            ecotypes = makeArray( conn, found, true );
        }
        return ecotypes;
    }
  

    /**
     * Save row of result set as EcotypeSummary object
     */
    private EcotypeSummary getEcotypeRow( ResultSet results ) 
        throws SQLException {
        
        EcotypeSummary ecotype = new EcotypeSummary();
        ecotype.setTairObjectID( new Long( results.getLong( "tair_object_id" ) ) );
        ecotype.setSpeciesVariantID( new Long( results.getLong( "species_variant_id" ) ) );
        ecotype.setName( results.getString( "name" ) );
        ecotype.setAbbrevName( results.getString( "abbrev_name" ) );
        ecotype.setBaseName( results.getString( "base_name" ) );
        ecotype.setType( results.getString( "speciesvariant_type" ) );
        ecotype.setLocation( results.getString( "location" ) );
        ecotype.setCountry( results.getString( "country" ) );
        ecotype.setOriginalName( results.getString( "original_name" ) );
        return ecotype;
    }

    /**
     * Translate collection of search results into type-specific array; retrieve
     * any info not contained in temp table needed for display. Certain data 
     * needed when creating downloads (through getSelected()) but not needed 
     * for displaying search results - use getDownload flag to determine whether 
     * to separately populate download data for each element in found
     */
    private EcotypeSummary[] makeArray( DBconnection conn, 
                                        List found, 
                                        boolean getDownload ) 
	    throws SQLException {
        
        EcotypeSummary[] ecotypes = null;
        if ( found != null && !found.isEmpty() ) {
            ecotypes = new EcotypeSummary[ found.size() ];
            ecotypes = (EcotypeSummary[]) found.toArray( ecotypes );
            for ( int i = 0; i < ecotypes.length; i++ ) {
                ecotypes[ i ].populate( conn ); // get associated collectors
                if ( getDownload ) {
                    ecotypes[ i ].populateDownloadData( conn );
                }
            }
        }
        return ecotypes;
    }


    /**
     * Retrieves JSP URL to use for displaying ecotype search results
     *
     * @return JSP URL to use for displaying ecotype search results
     */
    public String getSummaryPage() {
        return "/jsp/search/ecotype_summary.jsp";
    }

    /**
     * Retrieve list of temp table columns in form that can be included 
     * directly in SQL statement
     */
    private String getTableColumns( String type ) {
        String columns =
            "tair_object_id, " +
            "species_variant_id, " +
            "name, " +
            "abbrev_name, " +
            "base_name, " +
            "original_name, " +
            "speciesvariant_type, " +
            "location, " +
            "country, " + 
            "query_id";
        // need to check what kind of select it is. if it is result type (called in
        // getResultSlice, then we want to not return date_last_queried
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }
    
    /**
     * Get select used in all full searches
     */
    private String getBaseSelect( String queryID ) {
        String select =
            "SELECT DISTINCT s.tair_object_id, " +
            "s.species_variant_id, " +
            "s.name, " +
            "s.abbrev_name, " +
            "s.base_name, " +
            "s.original_name, " +
            "s.speciesvariant_type, " +
            "s.location, " +
            "s.country ";

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
     * Get basic from clause for all full searches
     */
    private String getBaseFrom() {
        return "FROM SpeciesVariant s LEFT JOIN Alias a ";
    }
    
    
    /**
     * Get basic where clause for all full searches
     */
    private String getBaseWhere() {
        return " ON s.tair_object_id = a.tair_object_id WHERE s.is_obsolete = 'F' ";
    }
    
    /**
     * Get insert statement to insert rows into temp table
     */
    private String getInsert() {
        String insert = 
            "INSERT /*+ APPEND */ INTO RESULT_ECOTYPE "; 
        return insert;
    }
    
    private String getDelete( String queryID ) {
        String del = 
            "DELETE FROM RESULT_ECOTYPE WHERE QUERY_ID = '" + queryID + "' ";
        return del;
    }
    
    /**
     * Append search term from any of three select menus - add customized 
     * search clause depending on type of name selected
     */
    private void appendTerm( StringBuffer from, 
                             StringBuffer where, 
                             StringBuffer joins, 
                             String name, 
                             String type, 
                             String method ) 
    {
        
        
        // properly quote string for searching and convert wildcard method 
        // into db wildcard values (%).
        name = TextConverter.dbQuote( TextConverter.convertEnds( name.toUpperCase(), 
                                                                 method ) );
        if ( type.equals( "donor_person" ) ) {
            where.append( "AND s.species_variant_id IN (" +
                          "SELECT distinct g.species_variant_id " +
                          "FROM Germplasm g, " +
                          "TairObject_Stock ts, " +
                          "Donor d, " +
                          "Community c, " +
                          "Person p " +
                          "WHERE g.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = d.stock_id " +
                          "AND d.community_id = c.community_id " +
                          "AND c.community_id = p.community_id " +
                          "AND d.community_id = p.community_id " +
                          "AND c.is_obsolete = 'F' " +
                          "AND g.is_obsolete = 'F' " +
                          "AND c.status = " + 
                          TextConverter.dbQuote( DataConstants.getActiveStatus() ) + 
                          " " +
                          "AND p.last_name_uc LIKE " + name +
                          " ESCAPE '\\\') " 
            );
            
        } else if ( type.equals( "donor_organization" ) ) {
            where.append( "AND s.species_variant_id IN (" +
                          "SELECT distinct g.species_variant_id " +
                          "FROM Germplasm g, " +
                          "TairObject_Stock ts, " +
                          "Donor d, " +
                          "Community c," + 
                          "Organization o " +
                          "WHERE g.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = d.stock_id " +
                          "AND d.community_id = c.community_id " +
                          "AND c.community_id = o.community_id " +
                          "AND o.community_id = d.community_id " +
                          "AND c.is_obsolete = 'F' " +
                          "AND g.is_obsolete = 'F' " +
                          "AND c.status = " + 
                          TextConverter.dbQuote( DataConstants.getActiveStatus() ) +
                          "AND o.name_uc LIKE " + name +
                          " ESCAPE '\\\') "
            );
            
            
        } else if ( type.equals( "ecotype_abbrev" ) ) {
            where.append( "AND ( upper( s.abbrev_name ) LIKE " + 
                          name + " ESCAPE '\\\' OR upper(a.alias) LIKE " + name + " ESCAPE '\\\' ) " ); 
            
        } else if ( type.equals( "ecotype_full" ) ) {
            where.append( "AND ( upper( s.name ) LIKE " + name +  
                          " ESCAPE '\\\' OR upper(a.alias) LIKE " +name + " ESCAPE '\\\' ) " );
            
        } else if ( type.equals( "germplasm_description" ) ) {
            where.append( "AND s.species_variant_id IN (" +
                          "SELECT distinct species_variant_id " +
                          "FROM Germplasm " +
                          "WHERE species_variant_id IS NOT NULL " +
                          "AND is_obsolete = 'F' " +
                          "AND description_uc LIKE " + name +
                          " ESCAPE '\\\') " 
            );
            
        } else if ( type.equals( "stock_number" ) ) {
            where.append( "AND s.species_variant_id IN (" +
                          "SELECT distinct g.species_variant_id " +
                          "FROM Germplasm g, " +
                          "TairObject_Stock ts, " +
                          "StockNameAlias sna " +
                          "WHERE g.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = sna.stock_id " +
                          "AND g.is_obsolete = 'F' " +
                          "AND g.species_variant_id IS NOT NULL " +
                          "AND sna.name LIKE " + name + 
                          ") "
            );
        } else if ( type.equals( "donor_stock_number" ) ) {
            where.append( "AND s.species_variant_id IN (" +
                          "SELECT distinct g.species_variant_id " +
                          "FROM Germplasm g, " +
                          "TairObject_Stock ts, " +
                          "Donor d " +
                          "WHERE g.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = d.stock_id " +
                          "AND g.is_obsolete = 'F' " +
                          "AND g.species_variant_id IS NOT NULL " +
                          "AND d.donor_stock_number_uc LIKE " + name + 
            " ESCAPE '\\\') " );
        }
    }
    
    
    /**
     * Create SQL to retrieve records according to searchParams
     */
    private String createQuery( Map searchParams, String queryID ) {
        
        // get submitted search params
        Long taxon_id = (Long) searchParams.get( "taxon_id" );
        //Boolean hybridTaxon = (Boolean) searchParams.get( "hybridTaxon" );
        
        String name_type_1 = (String) searchParams.get( "name_type_1" );
        String name_1 = (String) searchParams.get( "name_1" );
        String method_1 = (String) searchParams.get( "method_1" );
        
        String name_type_2 = (String) searchParams.get( "name_type_2" );
        String name_2 = (String) searchParams.get( "name_2" );
        String method_2 = (String) searchParams.get( "method_2" );
        
        String name_type_3 = (String) searchParams.get( "name_type_3" );
        String name_3 = (String) searchParams.get( "name_3" );
        String method_3 = (String) searchParams.get( "method_3" );
        
        Boolean is_abrc_stock = (Boolean) searchParams.get( "is_abrc_stock" );
        
        String collector = (String) searchParams.get( "collector" );
        String collector_method = (String) searchParams.get( "collector_method" );
        
        String country = (String) searchParams.get( "country" );
        
        String location = (String) searchParams.get( "location" );
        String location_method = (String) searchParams.get( "location_method" );
        
        String habitat = (String) searchParams.get( "habitat" );
        String habitat_method = (String) searchParams.get( "habitat_method" );
        
        java.util.Date year_collected_from = 
            (java.util.Date) searchParams.get( "year_collected_from" );
        
        java.util.Date year_collected_to = 
            (java.util.Date) searchParams.get( "year_collected_to" );
        
        String year_collected_method = 
            (String) searchParams.get( "year_collected_method" );
        
        
        /*
         Range parameters will require a db re-design to accomodate numeric comparison -
         comment out & save for now
         
         String altitude_method = (String) searchParams.get( "altitude_method" );
         String altitude_from = (String) searchParams.get( "altitude_from" );
         String altitude_to = (String) searchParams.get( "altitude_to" );
         
         String latitude_method = (String) searchParams.get( "latitude_method" );
         String latitude_from = (String) searchParams.get( "latitude_from" );
         String latitude_to = (String) searchParams.get( "latitude_to" );
         
         String longitude_method = (String) searchParams.get( "longitude_method" );
         String longitude_from = (String) searchParams.get( "longitude_from" );
         String longitude_to = (String) searchParams.get( "longitude_to" );
         */
        
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();
        
        // append basic select & from clauses
        from.append( getBaseSelect( queryID ) +
                     getBaseFrom()
        );
        
        // append  basic where clause
        joins.append( getBaseWhere() );
        
        
        // add name criteria
        if ( name_1 != null ) {
            appendTerm( from, where, joins, name_1, name_type_1, method_1 );
        }
        
        if ( name_2 != null ) {
            appendTerm( from, where, joins, name_2, name_type_2, method_2 );
        }
        
        if ( name_3 != null ) {
            appendTerm( from, where, joins, name_3, name_type_3, method_3 );
        }
        
        // if searching for "hybrid" taxon, look for entries where taxon_id is null,
        // else look for literal value submitted
        //
        // update 3.6.2003 Hybrid is now a literal value in Taxon table - okay 
        // to blindly search for submitted taxon_id (this will change when we 
        // figure it all out....)
        // if ( hybridTaxon != null && hybridTaxon.booleanValue() ) {
        //  where.append( "AND s.taxon_id IS NULL " );
        if ( taxon_id != null ) {
            where.append( "AND s.taxon_id = " + taxon_id.toString() + " " );
        }
        
        
        // restrict results to variants with associated stocks -- only do this if no 
        // other joins to stock have been done through name searches for stock 
        // to avoid unnecessary duplication of work
        if ( ( is_abrc_stock != null && is_abrc_stock.booleanValue() ) &&
                ( name_1 == null || ( !name_type_1.equals( "stock_number" ) && !name_type_1.equals( "donor" ) ) ) &&
                ( name_2 == null || ( !name_type_2.equals( "stock_number" ) && !name_type_2.equals( "donor" ) ) ) &&
                ( name_3 == null || ( !name_type_3.equals( "stock_number" ) && !name_type_3.equals( "donor" ) ) )
        ) {
            where.append( "AND s.species_variant_id IN (" +
                          "SELECT DISTINCT g.species_variant_id " +
                          "FROM Germplasm g, TairObject_Stock ts, Stock s " +
                          "WHERE g.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = s.stock_id " +
                          "AND g.is_obsolete = 'F' " +
                          "AND s.is_obsolete = 'F' " +
                          "AND g.species_variant_id IS NOT NULL " +
                          ") " 
            );
            
        }
        
        
        if ( !TextConverter.isEmpty( collector ) ) {
            where.append( "AND s.species_variant_id IN (" +
                          "SELECT DISTINCT c.species_variant_id " +
                          "FROM Collector c, Community cm, Person p " +
                          "WHERE c.community_id = cm.community_id " +
                          "AND cm.community_id = p.community_id " +
                          "AND c.community_id = p.community_id " +
                          "AND cm.is_obsolete = 'F' " +
                          "AND c.status = " + 
                          TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " " +
                          "AND p.last_name_uc LIKE " + 
                          TextConverter.dbQuote( TextConverter.convertEnds( collector, 
                                                                            collector_method ) ) + " ESCAPE '\\\' " 
            );
        }
        
        if ( !TextConverter.isEmpty( country ) ) {
            where.append( "AND s.country = " + TextConverter.dbQuote( country ) + " " );
        }
        
        if ( !TextConverter.isEmpty( location ) ) {
            where.append( "AND upper( s.location ) LIKE " + 
                          TextConverter.dbQuote( TextConverter.convertEnds( location.toUpperCase(), 
                                                                            location_method ) ) + " ESCAPE '\\\' " );
        }
        
        
        if ( !TextConverter.isEmpty( habitat ) ) {
            where.append( "AND upper( s.habitat ) LIKE " + 
                          TextConverter.dbQuote( TextConverter.convertEnds( habitat.toUpperCase(), 
                                                                            habitat_method ) ) + " ESCAPE '\\\' " );
        }
        
        if ( year_collected_from != null ) {
            if ( year_collected_method != null && year_collected_method.equals( "between" ) ) {
                where.append( "AND s.date_collected >= " + 
                              TextConverter.dbQuote( year_collected_from, "mm/dd/yyyy" ) + " " +
                              "AND s.date_collected <= " + 
                              TextConverter.dbQuote( year_collected_to, "mm/dd/yyyy" ) + " " );
                
                // if method is before or after, only use from parameter
            } else if ( year_collected_method != null && 
                    year_collected_method.equals( "before" ) ) {
                
                where.append( "AND s.date_collected <= " + 
                              TextConverter.dbQuote( year_collected_from, "mm/dd/yyyy" ) + " " );
                
            } else { // default to after if null (shouldn't happen...)
                where.append( "AND s.date_collected >= " + 
                              TextConverter.dbQuote( year_collected_from, "mm/dd/yyyy" ) + " " );
            }
        }
        
        Debugger.println( from.toString() + joins.toString() + where.toString() );
        
        String query = 
            from.toString() + 
            joins.toString() + 
            where.toString();
        
        return query;
        
    }
    
    
    /**
     * Returns description of search criteria used to create result set. This
     * is a convenience method to simplify life at the JSP search summary page. 
     * Include information on total number of matches for complete description 
     * of result set. Interpretation of search params is slightly different if 
     * doing general search versus a stand-alone ecotype search; use isGeneral 
     * flag in searchParams to determine which type of search was done.
     *
     * @param searchParams Field names and values used to create search results
     * @param resultSize Total number of results
     *
     * @return String describing search criteria used to create result set.
     */
    public String getFormatSearchCriteria( Map _searchParams, int resultSize ) {
        
        // long hideous method that translates search fields into 
        // sort-of English. bleah....

		Map searchParams = TextConverter.scrub(_searchParams);

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
                
                buffer.append( "Your query for ecotypes where " );
                
                if ( !TextConverter.isEmpty( searchTerm ) ) {
                    buffer.append( "ecotype name or abbrev. name " );
                    buffer.append( TextConverter.convertMethods( method ) );
                    buffer.append( " the term <font class=\"emphasis\">" + 
                                   searchTerm + "</font> " );
                }
                
            } else { // otherwise show criteria for stand alone ecotype search
                
                String name_type_1 = (String) searchParams.get( "name_type_1" );
                String name_1 = (String) searchParams.get( "name_1" );
                String method_1 = (String) searchParams.get( "method_1" );
                
                String name_type_2 = (String) searchParams.get( "name_type_2" );
                String name_2 = (String) searchParams.get( "name_2" );
                String method_2 = (String) searchParams.get( "method_2" );
                
                String name_type_3 = (String) searchParams.get( "name_type_3" );
                String name_3 = (String) searchParams.get( "name_3" );
                String method_3 = (String) searchParams.get( "method_3" );
                
                // only taxon id is submitted from form, but taxon name is retrieved
                // in handler and stored in search params for display purposes
                Long taxon_id = (Long) searchParams.get( "taxon_id" );
                String taxon_name = (String) searchParams.get( "taxon_name" );
                
                Boolean is_abrc_stock = (Boolean) searchParams.get( "is_abrc_stock" );
                
                String collector = (String) searchParams.get( "collector" );
                String collector_method = (String) searchParams.get( "collector_method" );
                
                String country = (String) searchParams.get( "country" );
                
                String location = (String) searchParams.get( "location" );
                String location_method = (String) searchParams.get( "location_method" );
                
                String habitat = (String) searchParams.get( "habitat" );
                String habitat_method = (String) searchParams.get( "habitat_method" );
                
                java.util.Date year_collected_from = 
                    (java.util.Date) searchParams.get( "year_collected_from" );
                
                java.util.Date year_collected_to = 
                    (java.util.Date) searchParams.get( "year_collected_to" );
                
                String year_collected_method = 
                    (String) searchParams.get( "year_collected_method" );
                
                boolean first = true;
                buffer.append( "Your query for ecotypes where " );
                
                if ( !TextConverter.isEmpty( name_1 ) ) {
                    first = false;
                    buffer.append( translateTermType( name_type_1 ) + " " + 
                                   TextConverter.convertMethods( method_1 ) );
                    
                    buffer.append( " the term <font class=\"emphasis\">" + 
                                   name_1 + "</font>" );
                } 
                
                if ( !TextConverter.isEmpty( name_2 ) ) {
                    if ( !first ) {
                        buffer.append( ", and " );
                    }
                    first = false;
                    buffer.append( translateTermType( name_type_2 ) + " " + 
                                   TextConverter.convertMethods( method_2 ) );
                    buffer.append( " the term <font class=\"emphasis\">" + 
                                   name_2 + "</font>" );
                } 
                
                if ( !TextConverter.isEmpty( name_3 ) ) {
                    if ( !first ) {
                        buffer.append( ", and " );
                    }
                    first = false;
                    buffer.append( translateTermType( name_type_3 ) + " " + 
                                   TextConverter.convertMethods( method_3 ) );
                    buffer.append( " the term <font class=\"emphasis\">" + 
                                   name_3 + "</font>" );
                } 
                
                if ( taxon_id != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "species is <i>" + taxon_name + "</i>" );
                }
                
                
                if ( is_abrc_stock != null && is_abrc_stock.booleanValue() ) {
                    first = appendComma( buffer, first );
                    buffer.append( "is ABRC stock" );
                }
                
                if ( !TextConverter.isEmpty( collector ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "collector name " + 
                                   TextConverter.convertMethods( collector_method ) + 
                                   " " + collector );
                }
                
                if ( !TextConverter.isEmpty( country ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "country is " + country );
                }
                
                if ( !TextConverter.isEmpty( location ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "location/city/region " + 
                                   TextConverter.convertMethods( location_method ) + 
                                   " " + location );
                }
                
                if ( !TextConverter.isEmpty( habitat ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "habitat " + 
                                   TextConverter.convertMethods( habitat_method ) + 
                                   " " + habitat );
                }
                
                if ( year_collected_from != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "collected " + year_collected_method + " " +
                                   TextConverter.dateToString( year_collected_from ) );
                    
                    if ( year_collected_to != null ) {
                        buffer.append( " and " + 
                                       TextConverter.dateToString( year_collected_to ) );
                    }
                }
                
            }      
            
            buffer.append( " resulted in <font class=\"emphasis\">" + 
                           resultSize + "</font> " );
            
            if ( resultSize == 1 ) {
                buffer.append( "match." );
            } else {
                buffer.append( "matches." );
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
    
    /**
     * Translate form value of search term type to plain text formatted version 
     * for display
     */
    private String translateTermType( String type ) {
        String translatedType = null;
        
        if ( type != null ) {
            if ( type.equals( "donor" ) ) {
                translatedType = "donor last name";
                
            } else if ( type.equals( "ecotype_abbrev" ) ) {
                translatedType = "ecotype abbrev. name";
                
            } else if ( type.equals( "ecotype_full" ) ) {
                translatedType = "ecotype full name";
                
            } else if ( type.equals( "germplasm_description" ) ) {
                translatedType = "germplasm description";
                
            } else if ( type.equals( "stock_number" ) ) {
                translatedType = "stock number";
                
                
            } else { // else display form value
                translatedType = type;
            }
        }
        return translatedType;
    }
    
    
}
