//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.57 $
// $Date: 2006/03/15 19:42:11 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.jboss.logging.Logger;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.DataPopulatorThread;
import org.tair.utilities.Debugger;
import org.tair.utilities.DynamicData;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;


/**
 * GermplasmSearcher retrieves germplasm records according to submitted
 * search parameters. Search results are stored in a temp table created
 * for a particular user, and are then returned one page at a time.
 * GermplasmSearcher only inserts and selects from temp table; creating,
 * deleting and dropping table is done by <code>SearchSession</code>.
 * GermplasmSearcher retrieves the relevant table name to use by querying
 * <code>MasterTableInfo</code>.
 *
 * <p>
 * GermplasmSearcher receives search parameters as retrieved from web
 * submission by <code>GermplasmSearchHandler</code>.
 *
 * <p>
 * GermplasmSearcher implements GeneralSearcher interface so that it can be
 * used by GeneralSearchHandler to carry out germplasm searches as part of
 * the general search.
 */

public class GermplasmSearcher implements GeneralSearcher {
	private static final Logger logger = Logger.getLogger(GermplasmSearcher.class);
    private String searchType = "germplasm";

    // list of tables included in query - used to keep track of joins
    // already created
    private ArrayList tables;

    /**
     * Executes search using submitted search parameters and returns slice of
     * result set according to parameters defined in scrollParams. When
     * initially searching, results are stored in a person specific temp table.
     * Subsequent calls will then retrieve from temp table to show current page
     * of result set
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
     * containing an array of GermplasmSummary objects and data on the complete
     * result set
     * @throws SQLException thrown if a database error occurs
     * @throws InvalidParameterException when the search parameters are null
     */
    public SearchResultsCollection search( DBconnection conn,
                                           Map searchParams,
                                           ScrollParams scrollParams,
                                           boolean firstSearch )
        throws SQLException, InvalidParameterException {
      
        if (searchParams == null) {
          throw new InvalidParameterException("Invalid search parameters - null map");
        }

        String orderBy = (String) searchParams.get( "order" );
	    String queryID = (String) searchParams.get("query_id");
        
        // do first search to populate temp table with full result set
        if ( firstSearch ) {
            String query = createQuery( searchParams, queryID );
            conn.setQuery( getInsert() + query );
            conn.executeUpdate();
            conn.releaseResources();
        }

        // get requested subset of results from temp table
        SearchResultsCollection searchResults =
         getResultSlice( conn, scrollParams, orderBy, queryID );

        // get plain text version of search parameters
        if ( searchResults != null ) {
            searchResults.setSearchCriteria(
            getFormatSearchCriteria( searchParams,
                            searchResults.getResultSize() ) );
        }
        return searchResults;
    }

    /**
     * Executes a germplasm search as part of the general search.  Search can be
     * done to just return number of matching germplasm records, or to give the
     * first page of germplasm search results according to the submitted value
     * of doCounts.  This method should only be called by GeneralSearchHandler
     * as part of the general search.  If requesting actual search results,
     * searching will insert results into user's temp table, and redirect user
     * to normal germplasm summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search
     * info is requested, collection will contain an array of GermplasmSummary
     * objects & other search info exactly as if search() were called; if counts
     * are requested, only the result size parameter of the collection will be
     * populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching germplasms
     * will be returned, if <code>false</code> first page of matching germplasms
     * will be returned
     * @return SearchResultsCollection containing either number of matches, or
     * first page of results
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection doGeneralSearch( Map searchParams,
                                  boolean doCounts, boolean firstSearch )
        throws SQLException {

        DBconnection conn = null;
        DBWriteManager connectionPool = null;

     SearchResultsCollection searchResults = null;
        String searchTerm = (String) searchParams.get( "searchTerm" );
        String method = (String) searchParams.get( "method" );
        String queryID = (String) searchParams.get ( "query_id" );
        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(),
                                  method );
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // if getting counts, just need number of distinct germplasm ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

          // else need to insert result set into temp table
          // and get first page
            } else {
                searchResults = doFullGeneralSearch( conn,
                                   searchTerm,
                                   queryID);

                // get plain text version of search parameters
                if ( searchResults != null  ) {
                    searchResults.setSearchCriteria(
                 getFormatSearchCriteria( searchParams,
                                 searchResults.getResultSize() ) );
                }
            }

        } finally {
         connectionPool.return_connection( conn );
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
        
	if (type.equalsIgnoreCase( "form" ) ){
		insert_query = createQuery( searchParams, "");
	} else if (type.equalsIgnoreCase( "general") ){
		String searchTerm = (String) searchParams.get("searchTerm");
		insert_query = "GERMPLASM_QUICKSEARCH_" + searchTerm;
	} else {
		insert_query = createQuery( searchParams, "" );
	} 
	return insert_query;                                                                
    }
    
    /**
     * Retrieve distinct number of germplasm ids where name matches search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn,
                                   String searchTerm )
        throws SQLException {

     ArrayList countIds = new ArrayList();

        String query =
         "SELECT DISTINCT g.germplasm_id " +
         getBaseFrom() + ", GermplasmNameAlias gna " +
         getBaseWhere() +
         "AND g.germplasm_id = gna.germplasm_id " +
         "AND gna.name LIKE " +
         TextConverter.dbQuote( searchTerm ) + 
         " ESCAPE '\\\'";

        conn.setQuery( query );
	Debugger.println( query );
        ResultSet results = conn.getResultSet();

        while ( results.next() ) {
         countIds.add( new Long( results.getLong( "germplasm_id" ) ) );
        }
        conn.releaseResources();

        SearchResultsCollection searchResults = new SearchResultsCollection();
        searchResults.setResultSize( countIds.size() );

        return searchResults;
    }


    /**
     * Retrieve all germplasms whose name or description matches search term;
     * insert results into temp table, retrieve first page of results, and get
     * descriptive version of search criteria for display on summary page
     */
    private SearchResultsCollection doFullGeneralSearch( DBconnection conn,
                                                         String searchTerm,
                                                         String queryID )
        throws SQLException {

        StringBuffer query = new StringBuffer();
        query.append( getInsert() +
                      getBaseSelect( "NULL", queryID ) +
                      getBaseFrom() + ", GermplasmNameAlias gna " +
                      getBaseWhere() +
                      "AND g.germplasm_id = gna.germplasm_id " +
                      "AND gna.name LIKE " +
                TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\'" );

        conn.setQuery( query.toString() );
        conn.executeUpdate(); // execute search & insert results into temp table
        conn.releaseResources();

        // get first page of results from temp table, sort by germplasm name
        ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();

        SearchResultsCollection searchResults =
         getResultSlice( conn,
                   scrollParams,
                   "germplasm_name",
                   queryID );

        // get links for scrolling through results
        if ( !searchResults.isEmpty() ) {
            searchResults.setScrollLinks(
            ScrollCalculator.getTableScrollLinks( scrollParams.getSize(),
                                   scrollParams.getPage(),
                                   searchResults ));
        }

        return searchResults;
    }


    /**
     * Retrieves requested slice of total result set as defined by scrollParams
     */
    private SearchResultsCollection getResultSlice( DBconnection conn,
                                                    ScrollParams scrollParams,
                                                    String orderBy,
 						                            String queryID )
        throws SQLException {

        GermplasmSummary[] searchResults = null;
        GermplasmSummary germplasm = null;
        ArrayList found = null;

        SearchResultsCollection searchCollection =
         new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;

        StringBuffer query = new StringBuffer();
        query.append( "SELECT " + getTableColumns("result") + " " +
                      "FROM RESULT_GERMPLASM WHERE QUERY_ID = '" + queryID + "' ");

        if ( orderBy != null ) {
            if ( orderBy.equals( "germplasm_name" ) ) {
                query.append( "ORDER BY name" );

            } else if ( orderBy.equals( "polymorphism_name" ) ) {
                query.append( "GROUP BY germplasm_id " +
                     "ORDER BY min( polymorphism_name ), " +
                     "germplasm_id" );

            } else if ( orderBy.equals( "germplasm_type" ) ) {
                query.append( "ORDER BY germplasm_type" );

            } else if ( orderBy.equals( "stock_number" ) ) {

                // order by specialized sort fields to get closer to numeric
                // sorting (so CS20 precedes CS100 which it won't as string
          // sort)
                query.append( "ORDER BY stock_number_prefix, " +
                     "stock_number_suffix, " +
                     "stock_number" );
            }

        } else { // default to germplasm name
            query.append( "ORDER BY name" );
        }

        long lastID = 0;
        conn.setQuery( query.toString() );

        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( lastID != results.getLong( "germplasm_id" ) ) {
                if ( rowCounter >= floor && rowCounter <= ceiling ) {
                    germplasm = getGermplasmRow( results );

                    if ( found == null ) {
                        found = new ArrayList();
                    }

                    found.add( germplasm );
                }
                rowCounter++;
            }
            lastID = results.getLong( "germplasm_id" );
        }
        conn.releaseResources();

        if ( found != null && !found.isEmpty() ) {
            searchResults = makeArray( conn, found );
            searchCollection.setResults( searchResults );
            searchCollection.setResultSize( rowCounter );
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + found.size() );

            // get links for scrolling through multiple results pages,
            searchCollection.setScrollLinks(
           ScrollCalculator.getTableScrollLinks( scrollParams.getSize(),
                                     scrollParams.getPage(),
                                     searchCollection,
                                     queryID ));
        }

        // set page for displaying results
        searchCollection.setResultsPage( getSummaryPage() );

        return searchCollection;
    }

    /**
     * Retrieve germplasms using selected germplasm ids from search results.
     * Used for  creating downloads for items in search results.
     *
     * @param conn  An active connection to the database
     * @param germplasmIDs Selected germplasm ids to retrieve data for
     * @param sessionID User's session id. Used to access temp table for user's
     * individual results.
     */
    public GermplasmSummary[] getSelected( DBconnection conn,
                                           List germplasmIDs,
                                           String queryID)
        throws SQLException {

        ArrayList found = null;
        GermplasmSummary[] germplasms = null;
        GermplasmSummary germplasm = null;
        ResultSet results = null;

        String query =
            "SELECT " + getTableColumns( "result" ) + " " +
            "FROM RESULT_GERMPLASM WHERE QUERY_ID = '" + queryID + "' " + 
            "AND germplasm_id = ?";
        conn.setQuery( query );

        Iterator iter = germplasmIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            if ( results.next() ) {
                germplasm = getGermplasmRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( germplasm );
            }
            results.close();
        }
        conn.releaseResources();

        if ( found != null && !found.isEmpty() ) {
            germplasms = makeArray( conn, found );
        }
        return germplasms;
    }


    /**
     * Save row of result set as GermplasmSummary object
     */
    private GermplasmSummary getGermplasmRow( ResultSet results )
     throws SQLException {

        GermplasmSummary germplasm = new GermplasmSummary();
        germplasm.setTairObjectID(
         new Long( results.getLong( "tair_object_id" ) ) );

        germplasm.setGermplasmID(
         new Long( results.getLong( "germplasm_id" ) ) );

        germplasm.setGermplasmName( results.getString( "name" ) );
        germplasm.setGermplasmType( results.getString( "germplasm_type" ) );
        return germplasm;
    }

    /**
     * Translate collection of search results into type-specific array; retrieve
     * any info not contained in temp table needed for display (associated
     * polymorphisms, donors, stocks & description)
     */
    private GermplasmSummary[] makeArray( DBconnection conn, List found )
     throws SQLException {

        GermplasmSummary[] germplasms = null;

        if ( found != null && !found.isEmpty() ) {
            germplasms = new GermplasmSummary[ found.size() ];
            germplasms = (GermplasmSummary[]) found.toArray( germplasms );
            for ( int i = 0; i < germplasms.length; i++ ) {
                germplasms[ i ].populate( conn );
            }
        }
        return germplasms;
    }



    /**
     * Retrieves JSP URL to use for displaying germplasm search results
     *
     * @return JSP URL to use for displaying germplasm search results
     */
    public String getSummaryPage() {
        return "/jsp/search/germplasm_summary.jsp";
    }

    /**
     * Retrieve list of temp table columns in form that can be included directly
     * in SQL statement
     */
    private String getTableColumns( String type ) {
        String columns =
            "tair_object_id, " +
            "germplasm_id, " +
            "name, " +
            "germplasm_type, " +
            "polymorphism_name, " +
            "stock_number, " +
            "stock_number_prefix, " +
            "stock_number_suffix, " + 
            "query_id ";
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }

    /**
     * Get basic select clause - stock number or gene name criteria will be
     * included in select depending on sort value (order) otherwise "NULL" is
     * used as a placeholder - this is done to handle the possibility of
     * multiple stocks or genes for each germplasm which will cause multiple
     * search result rows. Avoid this if possible by not joining to other
     * tables unless we need values to sort result set by
    */
    private String getBaseSelect( String order, String queryID ) {
        StringBuffer select = new StringBuffer();

        select.append( "SELECT g.tair_object_id, " +
                       "g.germplasm_id, " +
                       "g.name, " +
                       "g.germplasm_type, "
                       );

        if ( order != null && order.equals( "polymorphism_name" ) ) {
            select.append( "p.name, " );
        } else {
            select.append( "NULL, " );
        }

        if ( order != null && order.equals( "stock_number" ) ) {
            select.append( "s.name, " +
                           "s.stock_number_prefix, " +
                           "s.stock_number_suffix "
                           );
        } else {
            select.append( "NULL, " +
                           "NULL, " +
                           "NULL "
                           );
        }
        
	if ( queryID != null && queryID != ""){
	    select.append(", '" + queryID + "', CURRENT_DATE ");
        }else{
            select.append(", '', '' ");
        }
	return select.toString();
    }

    /**
     * Get basic from clause for all full searches
     */
    private String getBaseFrom() {
        return "FROM Germplasm g ";
    }


    /**
     * Get basic where clause for all full searches
     */
    private String getBaseWhere() {
        return "WHERE g.is_obsolete = 'F' ";
    }

    /**
     * Get insert statement to insert rows into temp table
     */
    private String getInsert() {
        String insert =
            "INSERT /*+ APPEND */ INTO RESULT_GERMPLASM " +
            "( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }
    
    private String getDelete( String queryID ){
	String del_query = 	
	    " DELETE FROM RESULT_GERMPLASM WHERE QUERY_ID = '" + queryID + "' ";
	return del_query;
    }

    /**
     * Create SQL to retrieve records according to searchParams.  Many search
     * parameters search fields in tables that are associated to Germplasm;
     * most of these searches are implemented in short methods that add criteria
     * on by doing an inner join to relevant table, or by doing a sub-select.
     * This decision is made according to search parameters - if user has
     * submitted more than one search value of the same type (two gene names,
     * for instance), the searches will be executed as sub-selects to account
     * for the multiple associations of germplasm to gene; if only one value of
     * that type is submitted, search will be done as an inner join.  This is
     * done since an inner join will usually be a quicker search, but
     * sub-selects are flexible and allow for multiple criteria types.
     *
     * Whether a criteria type is multiple or not is determined by helper methods
     * down below. Criteria may be called multiple if two params are submitted
     * that search the same table, without necessarily being the same field
     * (clone construct type & promoter, for example).
     */
    private String createQuery( Map searchParams, String queryID ) {
        // create list of tables in query
        this.tables = new ArrayList();

        // get submitted search params
        String germplasm_type = (String) searchParams.get( "germplasm_type" );

        String name_type_1 = (String) searchParams.get( "name_type_1" );
        String name_1 = (String) searchParams.get( "name_1" );
        String method_1 = (String) searchParams.get( "method_1" );

        String name_type_2 = (String) searchParams.get( "name_type_2" );
        String name_2 = (String) searchParams.get( "name_2" );
        String method_2 = (String) searchParams.get( "method_2" );

        String name_type_3 = (String) searchParams.get( "name_type_3" );
        String name_3 = (String) searchParams.get( "name_3" );
        String method_3 = (String) searchParams.get( "method_3" );

        String taxon = (String) searchParams.get( "taxon" );
        Long arabidopsisID = (Long) searchParams.get( "arabidopsisID" );

        // for locus_detail.jsp, gene_detail.jsp; doesn't appear on germplasm_form.jsp.
        String allele_id_1 = (String) searchParams.get( "allele_id_1" );

        String allele_name_1 = (String) searchParams.get( "allele_name_1" );
        String allele_method_1 = (String) searchParams.get( "allele_method_1" );
        String genotype_1 = (String) searchParams.get( "genotype_1" );

        String allele_name_2 = (String) searchParams.get( "allele_name_2" );
        String allele_method_2 = (String) searchParams.get( "allele_method_2" );
        String genotype_2 = (String) searchParams.get( "genotype_2" );

        String allele_name_3 = (String) searchParams.get( "allele_name_3" );
        String allele_method_3 = (String) searchParams.get( "allele_method_3" );
        String genotype_3 = (String) searchParams.get( "genotype_3" );

        Boolean is_abrc_stock = (Boolean) searchParams.get( "is_abrc_stock" );

        Boolean has_observable_phenotype =
         (Boolean) searchParams.get( "has_observable_phenotype" );

        Boolean has_foreign_dna =
         (Boolean) searchParams.get( "has_foreign_dna" );

        Boolean is_natural_variant =
         (Boolean) searchParams.get( "is_natural_variant" );

        Boolean has_polymorphisms =
         (Boolean) searchParams.get( "has_polymorphisms" );

        Boolean is_mapping_strain =
         (Boolean) searchParams.get( "is_mapping_strain" );

        // for locus_detail.jsp, gene_detail.jsp; doesn't appear on germplasm_form.jsp.
        Boolean has_phenotype =
         (Boolean) searchParams.get( "has_phenotype" );

        Boolean has_images = (Boolean) searchParams.get( "has_images" );

        String ploidy = (String) searchParams.get( "ploidy" );
        Boolean is_aneuploid = (Boolean) searchParams.get( "is_aneuploid" );

        Integer aneuploid_chromosome =
         (Integer) searchParams.get( "aneuploid_chromosome" );

        String[] background = (String[]) searchParams.get( "background" );
        String[] mutagen = (String[]) searchParams.get(  "mutagen" );

        String[] insertion_type =
         (String[]) searchParams.get(  "insertion_type" );

        String[] construct_type =
         (String[])  searchParams.get(  "construct_type" );

        java.util.Date restrict_date_from =
         (java.util.Date) searchParams.get( "restrict_date_from" );

        java.util.Date restrict_date_to =
         (java.util.Date) searchParams.get( "restrict_date_to" );

        String order = (String) searchParams.get( "order" );
        String chromosome = (String) searchParams.get( "chromosome" );
        String map_type = (String) searchParams.get( "map_type" );
        Units units = (Units) searchParams.get( "units"  );

        // parent germplasm info. will only be in params if linking
        // from germplasm detail page to display full list of children
        String parent_germplasm_name =
         (String) searchParams.get( "parent_germplasm_name" );

        Long parent_germplasm_id =
         (Long) searchParams.get( "parent_germplasm_id" );

        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();

	StringBuffer filterFrom = new StringBuffer();
	StringBuffer filterWhere = new StringBuffer();

        // append basic select & from clauses
        from.append( getBaseSelect( order, queryID ) +
                     getBaseFrom()
                     );

        // append  basic where clause
        joins.append( getBaseWhere() );


        // if parent germplasm data in search parameters, simply need
        // to select all children for parent through pedigree
        if ( parent_germplasm_id != null ) {
            searchForChildren( from, where, joins, parent_germplasm_id );
        }


        // determine if join to Stock is required by sort criteria or by
        // is_abrc_stock criteria (which is fulfilled by join alone)
        if ( ( order != null && order.equals( "stock_number" ) ) ||
             ( is_abrc_stock != null && is_abrc_stock.booleanValue() )
             ) {
            addStock( from, where, joins );
        }

        // determine if join to Polymorphism is required by sort params
        if ( order != null && order.equals( "polymorphism_name" ) ) {
            addPolymorphism( from, where, joins );
        }

        // determine if more than one search value is done through
     // polymorphism -- if only one value, can join directly to polymorphism
     // (hopefully improving query performance); if multiple, have to do
     // searches as sub-selects
        boolean multiplePoly = isMultiplePolymorphism( mutagen,
                                                       insertion_type ,
                                                       allele_id_1,
                                                       allele_name_1,
                                                       allele_name_2,
                                                       allele_name_3,
                                                       has_observable_phenotype,
                                                       units,
                                                       map_type,
                                                       chromosome );

        // do similar thing for clone criteria
        boolean multipleClone = isMultipleClone( name_type_1,
                               name_type_2,
                               name_type_3,
                               construct_type );


        //  add name criteria

        // use multiple to flag whether more than one search field submitted
     // searches the same value or table

        // if searching Clone.reporter or Clone.promoter, have to use
     // multipleClone value from above since it accounts for construct type
     // search as well

        boolean multiple = false;

        if ( name_1 != null ) {
            if ( name_type_1 != null &&
                 ( name_type_1.equals( "promoter" ) ||
             name_type_1.equals( "reporter" ) ) ) {

                multiple = multipleClone;

            } else {
                multiple = isMultipleCriteria( name_type_1,
                                name_type_2,
                                name_type_3 );
            }

            appendTerm( from,
               where,
               joins,
	       filterFrom,
	       filterWhere,
               name_1,
               name_type_1,
               method_1,
	       multiple);
        }

        if ( name_2 != null ) {
            if ( name_type_2 != null &&
                 ( name_type_2.equals( "promoter" ) ||
             name_type_2.equals( "reporter" ) ) ) {

                multiple = multipleClone;

            } else {
                multiple = isMultipleCriteria( name_type_2,
                                name_type_1,
                                name_type_3 );
            }

            appendTerm( from,
               where,
               joins,
	       filterFrom,
	       filterWhere,
               name_2,
               name_type_2,
               method_2,
	       multiple);
        }

        if ( name_3 != null ) {
            if ( name_type_3 != null &&
                 ( name_type_3.equals( "promoter" ) ||
             name_type_3.equals( "reporter" ) ) ) {

                multiple = multipleClone;
            } else {
                multiple = isMultipleCriteria( name_type_3,
                                name_type_1,
                                name_type_2 );
            }

            appendTerm( from,
               where,
               joins,
	       filterFrom,
	       filterWhere,
               name_3,
               name_type_3,
               method_3,
	       multiple);
        }

	if (filterFrom.length() > 0) {
	    if (from.length() > 0) {
		from.append(", ");
	    }

	    from.append(" (SELECT t0.germplasm_id FROM " + filterFrom);
	    if (filterWhere.length() > 0) {
		from.append(" WHERE " + filterWhere);
	    }
	    from.append(") filter ");
	    where.append(" AND g.germplasm_id = filter.germplasm_id ");
	}

        // search taxon using Germplasm_Pedigree_wrk table that allows
        // children to be found by their parent's taxon values
        if ( taxon != null && arabidopsisID != null ) {
          
          // Handle A. thaliana first, most common search; the other options
          // come below in the same order as in the user interface select menu
            if ( taxon.equals( arabidopsisID.toString() ) ) {
                addPedigreeWork( from, where, joins, false );
                where.append( "AND gp.taxon_id = " +
                     arabidopsisID.toString() + " " );

                // if not A. thaliana, could mean that taxon id is null (and not
                // in work table) so can't do inner join to work table
            } else if ( taxon.equals( "not_a_thaliana" ) ) {
                where.append( "AND g.germplasm_id NOT IN ( " +
                              "SELECT germplasm_id " +
                              "FROM Germplasm_Pedigree_wrk " +
                              "WHERE taxon_id = " + arabidopsisID.toString() +
                     " ) "
                              );

                // find hybrids by joining to work table 2x and returning
                // entries that have a non-null taxon id that is not the same
                // (meaning 2 parents are different taxons)
            } else if ( taxon.equals( "hybrid" ) ) {

          // add join that may already be there from background
                addPedigreeWork( from, where, joins, true );

          // add 2nd join that will never be there already
                addPedigreeWork( from, where, joins, false );

          // add redundant join to help optimizer
                joins.append( "AND gp.germplasm_id = gp_2.germplasm_id " );
                where.append( "AND gp.taxon_id IS NOT NULL " +
                              "AND gp_2.taxon_id IS NOT NULL " +

                     // use less than instead of != to minimize
                     // comparison
                              "AND gp.taxon_id < gp_2.taxon_id "
                              );
                
                // A taxon id for something other than A. thaliana, just
                // use the taxon as the id
            } else {
              addPedigreeWork( from, where, joins, false );
              where.append( "AND gp.taxon_id = " + taxon + " " );
            }
        }

        // add germplasm specific criteria
        if ( germplasm_type != null && !germplasm_type.equals( "any" ) ) {
            where.append( "AND g.germplasm_type = " +
                 TextConverter.dbQuote( germplasm_type ) + " " );
        }

        if ( has_foreign_dna != null && has_foreign_dna.booleanValue() ) {
            where.append( "AND g.has_foreign_dna = 'T' " );
        }

        if ( is_natural_variant != null &&
          is_natural_variant.booleanValue() ) {

            where.append( "AND g.is_natural_variant = 'T' " );
        }

        if ( has_polymorphisms != null && has_polymorphisms.booleanValue() ) {
            where.append( "AND g.has_polymorphisms = 'T' " );
        }

        if ( is_mapping_strain != null && is_mapping_strain.booleanValue() ) {
            where.append( "AND g.is_mapping_strain = 'T' " );
        }

        // define has images through TairObject_Image table
        if ( has_images != null && has_images.booleanValue() ) {
            from.append( ", TairObject_Image ti " );
            joins.append( "AND ti.tair_object_id = g.tair_object_id " );
        }

        if ( ploidy != null ) {
            if ( ploidy.equals( "2n" ) ) {
                where.append( "AND g.ploidy = '2' " );
            } else if ( ploidy.equals( "not_2n" ) ) {
                where.append( "AND ( g.ploidy IS NULL OR g.ploidy != '2' ) " );
            }
        }

        if ( is_aneuploid != null && is_aneuploid.booleanValue() ) {
            where.append( "AND g.is_aneuploid = 'T' " );
            if ( aneuploid_chromosome != null ) {
                where.append( "AND g.aneuploid_chromosome = " +
                     aneuploid_chromosome.toString() + " " );
            }
        }


        // search mutagen through both Germplasm & Polymorphism
        if ( mutagen != null &&
          mutagen.length > 0 &&
          !mutagen[ 0 ].equals( "any" ) ) {

            searchMutagen( from, where, joins, mutagen, multiplePoly );
        }


        // search date last modified through Germplasm (see HLP-6150) for the rationale for the change -- if "to date" is today's date,
     // value is set to null by GermplasmSearchHandler to avoid adding
     // criteria unless it really restricts results (which today's date
     // won't do).
        if ( restrict_date_from != null ) {
            //addStock( from, where, joins );
            where.append( "AND g.date_last_modified >= " +
                 TextConverter.dbQuote( restrict_date_from, "mm/dd/yyyy" ) + " " );
        }

        if ( restrict_date_to != null ) {
            //addStock( from, where, joins );
            where.append( "AND g.date_last_modified <= " +
                 TextConverter.dbQuote( restrict_date_to, "mm/dd/yyyy" ) +
                 " " );
        }

        // for locus_detail.jsp, gene_detail.jsp; doesn't appear on germplasm_form.jsp.
        if( allele_id_1 != null  && false == allele_id_1.equals("") )
        {
            searchAlleleByID( from, where, joins, allele_id_1, multiplePoly );
        }

        // add combo allele name/inheritance searches
        if ( allele_name_1 != null ) {
            searchAllele( from,
                 where,
                 joins,
                 allele_name_1,
                 allele_method_1,
                 genotype_1,
                 multiplePoly );
        }

        if ( allele_name_2 != null ) {
            searchAllele( from,
                 where,
                 joins,
                 allele_name_2,
                 allele_method_2,
                 genotype_2,
                 multiplePoly );
        }

        if ( allele_name_3 != null ) {
            searchAllele( from,
                 where,
                 joins,
                 allele_name_3,
                 allele_method_3,
                 genotype_3,
                 multiplePoly );
        }

        // find germplasms associated to polymorphisms of type "visible"
        if ( has_observable_phenotype != null &&
          has_observable_phenotype.booleanValue() ) {

            searchObservablePhenotype( from, where, joins, multiplePoly );
        }

        // for locus_detail.jsp, gene_detail.jsp; doesn't appear on germplasm_form.jsp.
        if( has_phenotype != null && has_phenotype.booleanValue() )
        {
            requirePhenotype( from, where );
        }

        // find germplasms associated to polymorphisms with selected
     // insert type(s)
        if ( insertion_type != null &&
          insertion_type.length > 0 &&
          !insertion_type[ 0 ].equals( "any" ) ) {

            searchInsertionType( from,
                     where,
                     joins,
                     insertion_type,
                     multiplePoly );
        }

        // search construct type as sub-select/join against Clone
        if ( ( construct_type != null &&
            construct_type.length > 0 &&
            !construct_type[ 0 ].equals( "any" ) ) ) {

            searchConstructType( from,
                     where,
                     joins,
                     construct_type,
                     multipleClone );
        }

        // search background through Germplasm_Pedigree_wrk work table which
     // flattens out relationships in Pedigree so that each germplasm has
     // a row in work table for all backgrounds a parent is associated to
        if ( background != null &&
          background.length > 0 &&
          !background[ 0 ].equals( "any" ) ) {

            addPedigreeWork( from, where, joins, false );
            appendMultiple( where, "gp.base_name", background, true );
        }


        // do map location searches as sub-select or join to GlobalAssignment
     // & Map through Polymorphism depending on whether multiple polymorphism
     // criteria were submitted
        if ( chromosome != null && !chromosome.equals( "any" ) ) {

            // if also doing a map location search, combine sub-select on
         // global assignment into one sub query
            if ( multiplePoly ) {
                if ( units != null || map_type != null ) {
                    where.append( "AND EXISTS (" +
                      getPolymorphismSelect( true, false ) );

                } else {
                    where.append( "AND EXISTS (" +
                      getPolymorphismSelect( false, false ) );
                }
            } else {
                addAssignment( from, where, joins );
            }


            // if entered, use search form chromosome value
            //
            // if no chromosome entered, check to see if one is implied
            // by the search by map location element search
            if ( !TextConverter.isEmpty( chromosome ) &&
           !chromosome.equals( "any" ) ) {

                where.append( "AND p.chromosome LIKE " +
                     TextConverter.dbQuote( "%" +
                                   chromosome +
                                   "%" ) + " ESCAPE '\\\' " );

            } else if ( units != null && units.useAssignmentChromosome() ) {
                where.append( "AND p.chromosome LIKE " +
                     TextConverter.dbQuote( "%" +
                                   units.getAssignmentChromosome() +
                                   "%" ) + " ESCAPE '\\\' " );
            }
        }

        // restrict by map location
        if ( units != null && map_type != null ) {
            Double start = units.get_start();
            Double end = units.get_end();
            String low_unit = units.get_low_unit();
            String high_unit = units.get_high_unit();

            //  only need to add sub-select if chromosome was not included
         // in query above
            if ( chromosome == null || chromosome.equals( "any" ) ) {
                if ( multiplePoly ) {
                    where.append( "AND EXISTS (" +
                                  getPolymorphismSelect( true, false ) );
                } else {
                    addAssignment( from, where, joins );
                }
            }

            if ( start != null && low_unit != null ) {
                if ( low_unit.equalsIgnoreCase( "cm" ) ) {
                    where.append( "AND ( a.start_position >= " +
                      start + " " +
                                  "OR a.end_position >= " + start +
                      " ) AND a.units = 'cM' " );


                } else if ( low_unit.equalsIgnoreCase( "kb" ) ) {
                    where.append( "AND ( " +
                                  "( ( a.start_position >= " + start +
                                  " OR a.end_position >= " + start +" ) " +
                                  "AND a.units = " +
                      TextConverter.dbQuote( low_unit ) + " ) " +
                                  "OR ( (a.start_position >=" +
                      start.doubleValue() * 1000 + " " +
                                  "OR a.end_position >= " +
                      start.doubleValue() * 1000+ " ) " +
                                  "AND ( a.units = 'bp' OR " +
                      "a.units IS NULL ) ) ) "
                                  );
                }
            }

            if ( end != null && high_unit != null ) {
                if ( high_unit.equalsIgnoreCase( "cm" ) ) {
                    where.append( "AND ( a.end_position <= " + end + " " +
                                  "OR a.start_position <= " + end + " ) " +
                                  "AND a.units = 'cM' " );

                } else if ( high_unit.equalsIgnoreCase( "kb" ) ) {
                    where.append( "AND ( ( ( a.end_position <= " +
                      end + " " +
                                  "OR a.start_position <= " +
                      end + " ) " +
                                  "AND a.units = " +
                      TextConverter.dbQuote( high_unit ) + " ) OR "+
                                  "( ( a.end_position <=" +
                      end.doubleValue() * 1000 + " " +
                                  "OR a.start_position <=" +
                      end.doubleValue() * 1000 + " ) " +
                                  "AND ( a.units = 'bp' OR " +
                      "a.units IS NULL ) ) ) " );
                }
            }

            if ( map_type != null ) {
                where.append( "AND mp.name LIKE " +
                     TextConverter.dbQuote( map_type.toUpperCase() +
                                   "%" ) + " ESCAPE '\\\'" );
            }
        }

        // make sure to close parens if doing sub-select on Assignment
        if ( multiplePoly && ( ( chromosome != null &&
                     !chromosome.equals( "any" ) ) ||
                               map_type != null ||
                               units != null )
             ) {
            where.append( " ) " );
        }


        Debugger.println( from.toString() +
                 joins.toString() +
                 where.toString() );

        String query =
         from.toString() +
         joins.toString() +
         where.toString();

        return query;
    }

    /**
     * Add criteria for retrieving all child germplasms associated to submitted
     * parent's germplasm id.  This should only be done when linking from
     * germplasm detail page to view full list of germplasm's children
     *
     * @param from From clause of SELECT statement
     * @param where Where clause of SELECT statement
     * @param joins Joins of SELECT statement
     * @param parent_germplasm_id Parent id to retrieve children for
     */
    private void searchForChildren( StringBuffer from,
                                    StringBuffer where,
                                    StringBuffer joins,
                                    Long parent_germplasm_id )
    {
        from.append( ", Pedigree p " );
        tables.add( "Pedigree" );
        joins.append( "AND g.germplasm_id = p.child_germplasm_id " );
        where.append( "AND p.parent_germplasm_id = " +
                parent_germplasm_id.toString() );

    }


    /**
     * Utility method to compare submitted search name type against values from
     * two other type menus to determine if same table is searched multiple
     * times; this value is used to determine best search strategy for search
     * terms (i.e. inner join or sub-select)
     */
    private boolean isMultipleCriteria( String type,
                                        String compareType_1,
                                        String compareType_2 )
    {
        boolean isMultiple = false;

        if ( type != null ) {

            // if more than one entry for either gene full name or symbol
            if ( compareType_1 != null &&
           isMultipleGene( type, compareType_1 ) ) {
                isMultiple = true;

            } else if ( compareType_2 != null &&
               isMultipleGene( type, compareType_2 ) ) {

                isMultiple = true;

                // if more than one entry for either donor or donor lab name
            } else if ( compareType_1 != null &&
               isMultipleDonor( type, compareType_1 ) ) {
                isMultiple = true;
            } else if ( compareType_2 != null &&
               isMultipleDonor( type, compareType_2 ) ) {
               isMultiple = true;

               // if types exactly equal
            } else if ( type.equals( compareType_1 ) ||
               type.equals( compareType_2 ) ) {
                isMultiple = true;
            }
        }

        return isMultiple;
    }


    /**
     * Determines if two submitted search name types both search Gene table
     */
    private boolean isMultipleGene( String type, String compareType ) {
        boolean multipleGeneType = false;

        if ( compareType != null ) {
            if ( type.equals( "gene_name" ) && 
		 compareType.equals( "gene_name" ) ) {
                multipleGeneType = true;
            }
        }
        return multipleGeneType;
    }

    /**
     * Determines if two submitted search name types both search stock
     * Donor table
     */
    private boolean isMultipleDonor( String type, String compareType ) {
        boolean multipleDonorType = false;

        if ( compareType != null ) {
            if ( ( type.equals( "donor" ) ||
             type.equals( "germplasm_stock_name" ) ) &&

                 ( compareType.equals( "donor" ) ||
             compareType.equals( "germplasm_stock_number" ) ) ) {

                multipleDonorType = true;
            }
        }

        return multipleDonorType;
    }



    /**
     * Determines if submitted criteria searches Polymorphism table more
     * than once
     */
    private boolean isMultiplePolymorphism( String[] mutagen,
                                            String[] insertion_type ,
                                            String allele_id_1,
                                            String allele_name_1,
                                            String allele_name_2,
                                            String allele_name_3,
                                            Boolean has_observable_phenotype,
                                            Units units,
                                            String map_type,
                                            String chromosome )
    {
        int criteriaCount = 0;
        // bail out as soon as we know we have multiple poly criteria
        while ( criteriaCount <= 1 ) {
            if ( mutagen != null && !mutagen[ 0 ].equals( "any" ) ) {
                criteriaCount++;
            }

            if ( insertion_type != null &&
           !insertion_type[ 0 ].equals( "any" ) ) {

                criteriaCount++;
            }

            if ( allele_id_1 != null ) {
                criteriaCount++;
            }

            if ( allele_name_1 != null ) {
                criteriaCount++;
            }

            if ( allele_name_2 != null ) {
                criteriaCount++;
            }

            if ( allele_name_3 != null ) {
                criteriaCount++;
            }

            if ( has_observable_phenotype != null &&
           has_observable_phenotype.booleanValue() ) {

                criteriaCount++;
            }

            if ( units != null || map_type != null || chromosome != null ) {
                criteriaCount++;
            }
            break;
        }

        return ( criteriaCount > 1 );
    }

    /**
     * Determines if submitted criteria searches Clone table more than once
     */
    private boolean isMultipleClone( String name_type_1,
                                     String name_type_2,
                                     String name_type_3,
                                     String[] construct_type )
    {
        boolean multipleClone = false;

        int criteriaCount = 0;
        while ( criteriaCount <= 1 ) {

            if ( name_type_1 != null &&
                 ( name_type_1.equals( "promoter" ) ||
             name_type_1.equals( "reporter" ) ) ) {

                criteriaCount++;
            }

            if ( name_type_2 != null &&
                 ( name_type_2.equals( "promoter" ) ||
             name_type_2.equals( "reporter" ) ) ) {

                criteriaCount++;
            }

            if ( name_type_3 != null &&
                 ( name_type_3.equals( "promoter" ) ||
             name_type_3.equals( "reporter" ) ) ) {

                criteriaCount++;
            }

            if ( construct_type != null &&
                 construct_type.length > 0 &&
                 !construct_type[ 0 ].equals( "any" ) ) {

                criteriaCount++;
            }
            break;
        }
        return ( criteriaCount > 1 );
    }


    /**
     * Append search term from any of three select menus - add customized search
     * clause depending on type of name selected
     */
    private void appendTerm( StringBuffer from,
                             StringBuffer where,
                             StringBuffer joins,
			     StringBuffer filterFrom,
			     StringBuffer filterWhere,
                             String origName,
                             String type,
                             String method,
                             boolean isMultiple)
    {
        // properly quote string for searching and convert search method
        // into db wildcard values (%).
        String upName = origName.toUpperCase();
        String name = TextConverter.dbQuote( TextConverter.convertEnds( upName, method ) );

        if (  type.equals( "gene_name" ) ) {
            searchGeneLocusName( filterFrom, filterWhere, name, type, isMultiple );

	} else if ( type.equals("germplasm_all") ) {
	    searchAll( filterFrom, filterWhere, upName, method );

        } else if ( type.equals( "germplasm_phenotype" ) ) {
	    searchGermplasmPhenotype( filterFrom, filterWhere, upName, method );

        } else if ( type.equals( "germplasm_stock_name" ) ) {
	    searchGermplasmStockName( filterFrom, filterWhere, name, isMultiple );

        } else if ( type.equals( "donor" ) ) {
            searchDonors( filterFrom, filterWhere, name, isMultiple );

            // search clone promoter name
        } else if ( type.equals( "promoter" ) ) {
	    searchPromoter(filterFrom, filterWhere, name );

            // search clone reporter name
        } else if ( type.equals( "reporter" ) ) {
	    searchReporter(filterFrom, filterWhere, name );

        }
    }


    /**
     * Add joins to global assignment & map through polymorphism
     */
    private void addAssignment( StringBuffer from,
                    StringBuffer where,
                    StringBuffer joins )
    {
        addPolymorphism( from, where, joins );
        if ( !tables.contains( "GlobalAssignment" ) ) {
            from.append( ", GlobalAssignment a, Map mp " );
            joins.append( "AND p.map_element_id = a.map_element_id " +
                          "AND a.map_element_id = gm.map_element_id " +
                          "AND a.map_id = mp.map_id " );
            where.append( "AND a.is_obsolete = 'F' " );
            tables.add( "Assignment" );
        }
    }


    /**
     * Add join to stock table
     */
    private void addStock( StringBuffer from,
                  StringBuffer where,
                  StringBuffer joins )
    {
        if ( !tables.contains( "Stock" ) ) {
            from.append( ", TairObject_Stock ts, Stock s " );
            joins.append( "AND g.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = s.stock_id " );
            where.append( "AND s.is_seed = 'T' " +
                          "AND s.is_obsolete = 'F' " );

            tables.add( "Stock" );
        }
    }

    /**
     * Add join to Clone table
     */
    private void addClone( StringBuffer from,
                  StringBuffer where,
                  StringBuffer joins )
    {
        if ( !tables.contains( "Clone" ) ) {
            from.append( ", Germplasm_MapElement gmc, Clone c " );
            joins.append( "AND g.germplasm_id = gmc.germplasm_id " +
                          "AND gmc.map_element_id = c.map_element_id " );
            where.append( "AND c.is_obsolete = 'F' " );
            tables.add( "Clone" );
        }
    }


    /**
     * Add join to Gene table
     */
    private void addGene( StringBuffer from,
                 StringBuffer where,
                 StringBuffer joins )
    {
        if ( !tables.contains( "Gene" ) ) {
            from.append( ", Germplasm_Gene_wrk gg, Gene gn " );
            joins.append( "AND g.germplasm_id = gg.germplasm_id " +
                          "AND gg.gene_id = gn.gene_id " );
            where.append( "AND gn.is_obsolete = 'F' " );
            tables.add( "Gene" );
        }
    }

    /**
     * Add join to Polymorphism
     */
    private void addPolymorphism( StringBuffer from,
                      StringBuffer where,
                      StringBuffer joins )
    {
        if ( !tables.contains( "Polymorphism" ) ) {
            from.append( ", Germplasm_MapElement gm, Polymorphism p " );
            joins.append( "AND g.germplasm_id = gm.germplasm_id " +
                          "AND gm.map_element_id = p.map_element_id " );
            joins.append( "AND p.is_obsolete = 'F' " );
            tables.add( "Polymorphism" );
        }
    }


    /**
     * Add join to Donor. Join to Stock will be added if not already done.
     */
    private void addDonor( StringBuffer from,
                  StringBuffer where,
                  StringBuffer joins )
    {
     addStock( from, where, joins );

     if ( !tables.contains( "Donor" ) ) {
         from.append( ", Donor d " );
         joins.append( "AND s.stock_id = d.stock_id " );
         tables.add( "Donor" );
     }
    }


    /**
     * Add join to work table that flattens out relationships in Pedigree table
     * to allow germplasms to be searched by species variant base name or taxon
     * entries that they are related to directly, or through parental
     * relationship
     *
     * If searching for hybrids (where child is from parents w/different
     * taxons), have to join to work table 2x (with different table aliases);
     * this will only happen when searching taxon, so it's easy to flag when
     * this is second join to the table (submitted as secondJoin param)
     */
    private void addPedigreeWork( StringBuffer from,
                                  StringBuffer where,
                                  StringBuffer joins,
                                  boolean secondJoin )
    {

        if ( secondJoin ) {
            from.append( ", Germplasm_Pedigree_wrk gp_2 " );
            joins.append( "AND g.germplasm_id = gp_2.germplasm_id " );

        } else if ( !tables.contains( "Pedigree" ) ) {
            from.append( ", Germplasm_Pedigree_wrk gp " );
            joins.append( "AND g.germplasm_id = gp.germplasm_id " );
            tables.add( "Pedigree" );
        }
    }


    /**
     * Get sub-select for searching clones -- sub-select is always assumed to
     * be part of an  EXISTS() clause and so doesn't SELECT any usable value
     */
    private String getCloneSelect() {
        String select =
            "SELECT 'X' " +
            "FROM Germplasm_MapElement gm, Clone c " +
            "WHERE gm.germplasm_id = g.germplasm_id " +
            "AND gm.map_element_id = c.map_element_id " +
            "AND c.is_obsolete = 'F' ";

        return select;
    }


    /**
     * Get a select clause for all germplasm phenotype
     */
    private String getPhenotypeSelect() {
	String phenotypeSelect = 
	    " SELECT Germplasm_Phenotype.germplasm_id, Phenotype.phenotype_uc as name " +
	    " FROM Germplasm_Phenotype, Phenotype " +
	    " WHERE Germplasm_Phenotype.phenotype_id = Phenotype.phenotype_id ";

	return phenotypeSelect;
    }


    /**
     * Get a select clause for all germplasm promoters
     */
    private String getPromoterSelect() {
	String promoterSelect = 
	    " SELECT Germplasm_MapElement.germplasm_id, Clone.promoter_uc " + 
	    " FROM Germplasm_MapElement, Clone " +
	    " WHERE Germplasm_MapElement.map_element_id = Clone.map_element_id " +
	    " AND Clone.is_obsolete = 'F'";

	return promoterSelect;
    }

    /**
     * Get a select claus for all germplasm reporters
     */
    private String getReporterSelect() {
	String reporterSelect = 
	    " SELECT Germplasm_MapElement.germplasm_id, Clone.reporter_uc " + 
	    " FROM Germplasm_MapElement, Clone " +
	    " WHERE Germplasm_MapElement.map_element_id = Clone.map_element_id " +
	    " AND Clone.is_obsolete = 'F'";

	return reporterSelect;
    }

    /**
     * Get sub-select for searching polymorphisms - optionally include
     * GlobalAssignment and Map in clause for searching by map location or
     * PolymorphismNameAlias for name searching
     *
     * Sub-select is always assumed to be part of an EXISTS clause only
     * and so does not actually SELECT any usable values
     */
    private String getPolymorphismSelect( boolean addAssignment,
                           boolean addNameAlias )
    {
        StringBuffer select = new StringBuffer();
        StringBuffer where = new StringBuffer();

        select.append( "SELECT 'X' " +
                       "FROM Germplasm_MapElement gm, Polymorphism p " );
        where.append( "WHERE g.germplasm_id = gm.germplasm_id " +
                      "AND gm.map_element_id = p.map_element_id " +
                      "AND p.is_obsolete = 'F' " );

        if ( addAssignment ) {
            select.append( ", GlobalAssignment a, Map mp " );
            where.append( "AND p.map_element_id = a.map_element_id " +
                          "AND gm.map_element_id = a.map_element_id " +
                          "AND a.map_id = mp.map_id " +
                          "AND a.is_obsolete = 'F' "
                          );
        }

        if ( addNameAlias ) {
            select.append( ", PolymorphismNameAlias pna " );
            where.append( "AND p.polymorphism_id = pna.polymorphism_id " );
        }

        return select.toString() + where.toString();
    }

    /**
     * Search allele by ID; either through a direct join to Polymorphism,
     * or as a sub-select depending on if multiple polymorphism search criteria
     * were entered.
     */
    private void searchAlleleByID( StringBuffer from,
                                   StringBuffer where,
                                   StringBuffer joins,
                                   String allele_id,
                                   boolean multiplePoly )
    {
        if ( multiplePoly ) {
            where.append( "AND EXISTS (" +
                          getPolymorphismSelect( false, true ) );

        } else {
            addPolymorphism( from, where, joins );
        }

        where.append( "AND p.is_allele = 'T' " +
                      "AND p.polymorphism_id = " +
                      allele_id +
                      " "
                      );

        if ( multiplePoly ) { // close sub-select
            where.append( ") " );
        }
    }

    /**
     * Search allele criteria either through a direct join to Polymorphism,
     * or as a sub-select depending on if multiple polymorphism search criteria
     * were entered
     */
    private void searchAllele( StringBuffer from,
                               StringBuffer where,
                               StringBuffer joins,
                               String allele_name,
                               String method,
                               String genotype,
                               boolean multiplePoly )
    {
        if ( multiplePoly ) {
            where.append( "AND EXISTS (" +
                 getPolymorphismSelect( false, true ) );

        } else {
            addPolymorphism( from, where, joins );
            from.append( ", PolymorphismNameAlias pna " );
            joins.append( "AND p.polymorphism_id = pna.polymorphism_id " );
        }

        where.append( "AND p.is_allele = 'T' " +
                      "AND pna.name LIKE " +
                      TextConverter.dbQuote(
                 TextConverter.convertEnds( allele_name.toUpperCase(),
                                   method ) ) + " ESCAPE '\\\' "
                      );

        if ( genotype != null && !genotype.equals( "any" ) ) {
            where.append( "AND gm.genotype = " +
                 TextConverter.dbQuote( genotype ) + " " );
        }

        if ( multiplePoly ) { // close sub-select
            where.append( ") " );
        }

    }

    /**
     * Mutagen has a "virtual" mutagen value - if "ionizing radiation" is
     * selected, must make sure to include HZE C, HZE Kr, HZE Ne & HZE U as
     * well; use adjustMutagen() method to check our list & add any values
     * needed
     *
     * mutagen must search both Germplasm.mutagen & Polymorphism.mutagen as
     * an OR
     *
     * search polymorphism as join, or sub-select depending on whether
     * multiple polymorphism criteria was submitted
     */
    private void searchMutagen( StringBuffer from,
                                StringBuffer where,
                                StringBuffer joins,
                                String[] mutagen,
                                boolean multiplePoly )
    {
        where.append( "AND ( " );
        appendMultiple( where, "g.mutagen", adjustMutagen( mutagen ), false );
        where.append( "OR " );

        if ( multiplePoly ) {
            where.append( "EXISTS (" + getPolymorphismSelect( false, false ) );
            appendMultiple( where,
                   "p.mutagen",
                   adjustMutagen( mutagen ), true );
            where.append( " ) " );
        } else {
            addPolymorphism( from, where, joins );
            appendMultiple( where,
                   "p.mutagen",
                   adjustMutagen( mutagen ),
                   false );
        }
        where.append( ") " );
    }


    /**
     * If mutagen value of "ionizing radiation" is selected, must make sure to
     * include HZE C, HZE Kr, HZE Ne & HZE U as well
     */
    private String[] adjustMutagen( String[] formTypes ) {
        Vector types = null;
        String[] adjusted = null;
        boolean hasAll = false;

        if ( formTypes != null & formTypes.length > 0 ) {
            types = new Vector();
            for ( int i = 0; i < formTypes.length; i++ ) {
                if ( formTypes[ i ] != null ) {
                    if ( formTypes[ i ].equals( "ionizing radiation" ) ) {
                        hasAll = true;
                    }
                    types.add( formTypes[ i ] );
                }
            }

            if ( hasAll ) {
                if ( !types.contains( "HZE C" ) ) {
                    types.addElement( "HZE C" );
                }

                if ( !types.contains( "HZE Kr" ) ) {
                    types.addElement( "HZE Kr" );
                }

                if ( !types.contains( "HZE Ne" ) ) {
                    types.addElement( "HZE Ne" );
                }

                if ( !types.contains( "HZE U" ) ) {
                    types.addElement( "HZE U" );
                }

            }
            adjusted = new String[ types.size() ];
            types.copyInto( adjusted );
        }
        return adjusted;
    }


    /**
     * Find germplasms associated to polymorphisms of type "visible" - search
     * polymorphism as join or sub-select depending on multiplePoly
     */
    private void searchObservablePhenotype( StringBuffer from,
                                            StringBuffer where,
                                            StringBuffer joins,
                                            boolean multiplePoly )
    {
        if ( multiplePoly ) {
            where.append( "AND EXISTS (" +
                 getPolymorphismSelect( false, false ) + " " );
        } else {
            addPolymorphism( from, where, joins );
        }

        where.append( "AND p.has_observable_phenotype = 'T' " );

        if ( multiplePoly ) { // close sub-select
            where.append( ") " );
        }
    }

    /** For locus_detail.jsp, gene_detail.jsp; doesn't appear on germplasm_form.jsp.
     * Enforces that the returned germplasms have at least one associated phenotype.
     * Since the Germplasm_Phenotype entry would have to have both germplasm_id and
     * phenotype_id, it suffices to require that an associated Germplasm_Phenotype.
     */
    private void requirePhenotype( StringBuffer from, StringBuffer where )
    {
        from.append( ", Germplasm_Phenotype gpptReq " );
        where.append( "AND gpptReq.germplasm_id = g.germplasm_id " );
    }

    /**
     * Search Polymorphism.insert type as sub-select or join depending on
     * multiplePoly
     */
    private void searchInsertionType( StringBuffer from,
                                      StringBuffer where,
                                      StringBuffer joins,
                                      String[] insertion_type,
                                      boolean multiplePoly )
    {
        if ( multiplePoly ) {
            where.append( "AND EXISTS ( " +
                 getPolymorphismSelect( false, false ) + " " );
        } else {
            addPolymorphism( from, where, joins );
        }

        appendMultiple( where,
               "p.insertion_type",
               insertion_type,
               true );

        if ( multiplePoly ) {
            where.append( ") " );
        }
    }


    /**
     * Search gene symbol, full name and locus as join or sub-select depending on
     * isMultiple.
     */
    private void searchGeneLocusName( StringBuffer filterFrom,
				      StringBuffer filterWhere,
				      String name,
				      String type,
				      boolean isMultiple )
    {

	String table = addFilterTable(filterFrom, filterWhere);
	filterFrom.append(" (SELECT * FROM GermplasmGeneNameSearch_wrk WHERE name LIKE " + name + " ESCAPE '\\\') " + table);
    }


    /**
     * Search germplasm phenotype
     * This is inconsistent with other usage...
     */
    private void searchGermplasmPhenotype( StringBuffer filterFrom,
					   StringBuffer filterWhere,
					   String upName,
					   String method )
    {

        String name = TextConverter.dbQuote( TextConverter.convertEnds( upName, method ) );
	String constraints = TextConverter.convertEndsFreeText(method, upName, "Phenotype.phenotype_uc");

	String table = addFilterTable(filterFrom, filterWhere);
	//	filterFrom.append(" (" + getPhenotypeSelect() + " AND " + constraints +") " + table);

	filterFrom.append(" ( " + getPhenotypeSelect() + " AND " + constraints +
			  "   UNION " +
			  "   SELECT germplasm_id, description_uc AS name FROM Germplasm WHERE description_uc LIKE " + name +
			  "    ESCAPE '\\\'  AND is_obsolete = 'F' " +
			  "  ) " + table);
    }


    /**
     * Search promoter
     */
    private void searchPromoter( StringBuffer filterFrom,
				 StringBuffer filterWhere,
				 String name)
    {

	String table = addFilterTable(filterFrom, filterWhere);
	filterFrom.append(" (" + getPromoterSelect() + " AND Clone.promoter_uc LIKE " + name + " ESCAPE '\\\') " + table);

    }

    /**
     * Search reporter
     */
    private void searchReporter( StringBuffer filterFrom,
				 StringBuffer filterWhere,
				 String name)
    {

	String table = addFilterTable(filterFrom, filterWhere);
	filterFrom.append(" (" + getReporterSelect() + " AND Clone.reporter_uc LIKE " + name + " ESCAPE '\\\') " + table);

    }


    /**
     * Search all the germplasm fields.
     */
    private void searchAll( StringBuffer filterFrom,
			    StringBuffer filterWhere,
			    String upName,
			    String method )
    {

        String name = TextConverter.dbQuote( TextConverter.convertEnds( upName, method ) );
	String constraints = TextConverter.convertEndsFreeText(method, upName, "Phenotype.phenotype_uc");

	String table = addFilterTable(filterFrom, filterWhere);
	filterFrom.append(" ( SELECT * FROM GermplasmStockNameSearch_wrk WHERE name LIKE " + name +
			  " ESCAPE '\\\'   UNION " +
			  "   SELECT * FROM GermplasmGeneNameSearch_wrk WHERE name LIKE " + name +
			  " ESCAPE '\\\'   UNION " +
			  "   SELECT * FROM GermplasmDonorNameSearch_wrk WHERE name LIKE " + name +
			  " ESCAPE '\\\'   UNION " +
			  getPhenotypeSelect() + " AND " + constraints +
			  "   UNION " +
			  getPromoterSelect() + " AND Clone.promoter_uc LIKE " + name + 
			  " ESCAPE '\\\'   UNION " +
			  getReporterSelect() + " AND Clone.reporter_uc LIKE " + name +
			  " ESCAPE '\\\'   UNION " +
			  "   SELECT * FROM GermplasmPolySearch_wrk WHERE name LIKE " + name +
			  " ESCAPE '\\\'   UNION " +
			  "   SELECT germplasm_id, description_uc AS name FROM Germplasm WHERE description_uc LIKE " + name + 
			  "    ESCAPE '\\\'  AND is_obsolete = 'F' " +
			  "  ) " + table);
    }


    private String addFilterTable(StringBuffer filterFrom, StringBuffer filterWhere) {

	int num = 0;
	String base = "t";
	String table = base + num;
	
	while (filterFrom.toString().contains(table)) {
	    num++;
	    table = base + num;
	}
	
	if (num > 0) {
	    filterFrom.append(", ");
	    if (num > 1) {
		filterWhere.append(" AND ");
	    }

	    filterWhere.append(table + ".germplasm_id = " + base + (num-1) + ".germplasm_id " );
	}

	return table;
    }




    /**
     * Search gene symbol or full name as join or sub-select depending on
     * isMultiple. Gene full name search will actually also include
     * "alt_full_name" as well.
     */
    private void searchGeneName( StringBuffer from,
                                 StringBuffer where,
                                 StringBuffer joins,
                                 String name,
                                 String type,
                                 boolean isMultiple )
    {
        if ( isMultiple ) {
            where.append( "AND EXISTS ( " +
                              "SELECT 'X' " +
                              "FROM Germplasm_Gene_wrk gg, " +
                     "GeneNameAlias gnna " +
                              "WHERE gg.germplasm_id = g.germplasm_id " +
                              "AND gg.gene_id = gnna.gene_id " );

        } else {
            addGene( from, where, joins );
            from.append( ", GeneNameAlias gnna " );
            joins.append( "AND gn.gene_id = gnna.gene_id " +
                          "AND gg.gene_id = gnna.gene_id " );
        }

        where.append( "AND gnna.name LIKE " + name + " ESCAPE '\\\' " );

        // include both full name and alt. full name if full name selected
        if ( type.equals( "gene_full_name" ) ) {
            where.append( "AND (gnna.name_type = 'full_name' " +
                          "OR gnna.name_type = 'alt_fullname') " );

        } else if ( type.equals( "gene_symbol" ) ) {
            where.append( "AND gnna.name_type = 'symbol' " );
        }

        if ( isMultiple ) {
            where.append( ") " );
        }
    }


    /**
     * Search germplasm name as a join or sub-select depending on isMultiple --
     * conceivably, this should always be a join, but just to allow for the
     * possibility of a person entering 2 names that theoretically should return
     * the same germplasm, implement multiple selection
     */
    private void searchGermplasmStockName( StringBuffer filterFrom,
					   StringBuffer filterWhere,
					   String name,
					   boolean isMultiple )
    {


	String table = addFilterTable(filterFrom, filterWhere);
	// Use LIKE with backslash escape
    filterFrom.append(" (SELECT * FROM GermplasmStockNameSearch_wrk WHERE name LIKE " + name + " ESCAPE '\\\') " + table);
	//filterFrom.append(" (SELECT GermplasmStockNameSearch_wrk.germplasm_id, GermplasmStockNameSearch_wrk.name FROM GermplasmStockNameSearch_wrk WHERE name LIKE " + name + " ESCAPE '\\\') " + table);
    }



    /**
     * Search germplasm name as a join or sub-select depending on isMultiple --
     * conceivably, this should always be a join, but just to allow for the
     * possibility of a person entering 2 names that theoretically should return
     * the same germplasm, implement multiple selection
     */
    private void searchGermplasmName( StringBuffer from,
                                      StringBuffer where,
                                      StringBuffer joins,
                                      String name,
                                      boolean isMultiple )
    {
        if ( isMultiple ) {
            where.append( "AND EXISTS (" +
                              "SELECT 'X' " +
                              "FROM GermplasmNameAlias gna " +
                              "WHERE gna.germplasm_id = g.germplasm_id " +
                              "AND gna.name LIKE " + name +
                          " ESCAPE '\\\') " );
        } else {
            from.append( ", GermplasmNameAlias gna " );
            joins.append( "AND g.germplasm_id = gna.germplasm_id " );
            where.append( "AND gna.name LIKE " + name + " ESCAPE '\\\' " );
        }
    }


    /**
     * Search locus name as join or sub-select depending on isMultiple;
     * locus joins are done through clones & polymorphisms associated to
     * germplasm - these are pre-selected in Germplasm_Locus_wrk table
     */
    private void searchLocusName( StringBuffer from,
                                  StringBuffer where,
                                  StringBuffer joins,
                                  String name,
                                  boolean isMultiple )
    {
        if ( isMultiple ) {
            where.append( "AND EXISTS (" +
                              "SELECT 'X' " +
                              "FROM Germplasm_Locus_wrk gl, " +
                     "LocusNameAlias lna " +
                              "WHERE g.germplasm_id = gl.germplasm_id " +
                              "AND gl.locus_id = lna.locus_id " +
                              "AND lna.name LIKE " + name +
                          " ESCAPE '\\\') " );
        } else {
            from.append( ", Germplasm_Locus_wrk gl, LocusNameAlias lna " );
            joins.append( "AND g.germplasm_id = gl.germplasm_id " +
                          "AND gl.locus_id = lna.locus_id " );
            where.append( "AND lna.name LIKE " + name + " ESCAPE '\\\' " );
        }
    }

    /**
     * Search clone reporter or promoter name as join or sub-select depending
     * on isMultiple
     */
    private void searchClone( StringBuffer from,
                              StringBuffer where,
                              StringBuffer joins,
                              String name,
                              boolean isMultiple,
                              String columnName )
    {
        if ( isMultiple ) {
            where.append( "AND EXISTS (" +
                               getCloneSelect() + " " +
                              "AND " + columnName + " LIKE " + name +
                          " ESCAPE '\\\') " );
        } else {
            addClone( from, where, joins );
            where.append( "AND " + columnName + " LIKE " + name + " ESCAPE '\\\' " );
        }
    }

    /**
     * Search clone construct type as join or sub-select depending on isMultiple
     */
    private void searchConstructType( StringBuffer from,
                                      StringBuffer where,
                                      StringBuffer joins,
                                      String[] construct_type,
                                      boolean multipleClone )
    {
        if ( multipleClone ) {
            where.append( "AND EXISTS ( " + getCloneSelect() + " " );
            appendMultiple( where, "c.construct_type", construct_type, true );
            where.append( ") " );
        } else {
            addClone( from, where, joins );
            appendMultiple( where, "c.construct_type", construct_type, true );
        }
    }


    /**
     * Search donor stock number as join or sub-select depending on
     * isMultiple
     */
    private void searchDonorStockNumber( StringBuffer from,
                          StringBuffer where,
                          StringBuffer joins,
                          String number,
                          boolean isMultiple )
    {
     if ( isMultiple ) {
         addStock( from, where, joins );
         where.append( "AND EXISTS (" +
                     "SELECT 'X' " +
                     "FROM Donor d " +
                     "WHERE d.stock_id = s.stock_id " +
                     "AND d.donor_stock_number_uc LIKE " +
                     number +
                 " ESCAPE '\\\') "
                 );
     } else {
         addDonor( from, where, joins );
         where.append( "AND d.donor_stock_number_uc LIKE " +
                 number + " ESCAPE '\\\' " );
     }
    }


    private void searchDonors( StringBuffer filterFrom,
			       StringBuffer filterWhere,
			       String name,
			       boolean isMultiple)
    {
	String table = addFilterTable(filterFrom, filterWhere);
	filterFrom.append(" (SELECT * FROM GermplasmDonorNameSearch_wrk WHERE name LIKE " + name + " ESCAPE '\\\') " + table);
	//filterFrom.append(" (SELECT GermplasmDonorNameSearch_wrk.germplasm_id, GermplasmDonorNameSearch_wrk.name FROM GermplasmDonorNameSearch_wrk WHERE name LIKE " + name + " ESCAPE '\\\') " + table);
    }


    /**
     * Search stock donor person or organization as join or sub-select
     * depending on isMultiple
     */
    private void searchDonorName( StringBuffer from,
                      StringBuffer where,
                      StringBuffer joins,
                      String name,
                      boolean isMultiple,
                      boolean isPerson )
    {
        String nameColumn = ( isPerson ) ? "pe.last_name_uc" : "pe.name_uc";
        String subTable = ( isPerson ) ? "Person pe" : "Organization pe";

        if ( isMultiple ) {
         addStock( from, where, joins );
            where.append( "AND EXISTS (" +
                              "SELECT 'X' " +
                              "FROM Donor d, Community cm, " + subTable + " " +
                              "WHERE d.stock_id = s.stock_id " +
                              "AND d.community_id = cm.community_id " +
                              "AND cm.community_id = pe.community_id " +
                              "AND d.community_id = pe.community_id " +
                              "AND cm.status = " +
                              TextConverter.dbQuote(
                      DataConstants.getActiveStatus() ) +
                     " " +
                              "AND cm.is_obsolete = 'F' " +
                              "AND " + nameColumn + " LIKE " + name +
                          " ESCAPE '\\\') "
                          );

        } else {
         addDonor( from, where, joins );

            from.append( ", Community cm, " + subTable + " " );
            joins.append( "AND d.community_id = cm.community_id " +
                          "AND cm.community_id = pe.community_id " +
                          "AND d.community_id = pe.community_id " );
            where.append( "AND cm.status = " +
                          TextConverter.dbQuote(
                     DataConstants.getActiveStatus() ) + " " +
                          "AND cm.is_obsolete = 'F' " +
                          "AND " + nameColumn + " LIKE " + name + " ESCAPE '\\\' " );
        }
    }


    /**
     * Utility method to add array of search values for fieldName as an
     * IN (...) clause; use addAnd to determine if an AND needs to be inserted
     * in SQL or not
     */
    private void appendMultiple( StringBuffer where,
                     String fieldName,
                     String[] values,
                     boolean addAnd )
    {
        if ( values != null && values.length > 0 ) {
            if ( addAnd ) {
                where.append( "AND " );
            }
            boolean first = true;
            where.append( fieldName + " IN ( " );
            for ( int i = 0; i < values.length; i++ ) {
                if ( !first ) {
                    where.append( ", " );
                } else {
                    first = false;
                }
                where.append( TextConverter.dbQuote( values[ i ] ) );
            }
            where.append( " ) " );
        }
    }


    /**
     * Returns description of search criteria used to create result set. This
     * is a convenience method to simplify life at the JSP search summary page.
     * Include information on total number of matches for complete description
     * of result set. Interpretation of search params is slightly different if
     * doing general search versus a stand-alone germplasm search; use isGeneral
     * flag in searchParams to determine which type of search was done.
     *
     * @param searchParams Field names and values used to create search results
     * @param resultSize Total number of results
     * @return String describing search criteria used to create result set.
     */
    public String getFormatSearchCriteria( Map _searchParams, int resultSize ) {
        StringBuffer buffer = null;
        String criteria = null;
        Boolean isGeneral = null;

        Map searchParams = TextConverter.scrub(_searchParams);

        if ( searchParams != null ) {
            buffer = new StringBuffer();

            // do general search version of criteria
            isGeneral =(Boolean) searchParams.get( "isGeneral" );
            if ( isGeneral != null && isGeneral.booleanValue() ) {
                String searchTerm = (String) searchParams.get( "searchTerm" );
                String method = (String) searchParams.get( "method" );

                buffer.append( "Your query for any germplasms where " );

                if ( !TextConverter.isEmpty( searchTerm ) ) {
                    buffer.append( "germplasm name " );
              //buffer.append( "or description " );
                    buffer.append( TextConverter.convertMethods( method ) );
                    buffer.append( " the term <font class=\"emphasis\">" +
                       searchTerm + "</font> " );
                }

            } else { // otherwise show criteria for stand alone germplasm search
                String germplasm_type =
              (String) searchParams.get( "germplasm_type" );

                String name_type_1 = (String) searchParams.get( "name_type_1" );
                String name_1 = (String) searchParams.get( "name_1" );
                String method_1 = (String) searchParams.get( "method_1" );

                String name_type_2 = (String) searchParams.get( "name_type_2" );
                String name_2 = (String) searchParams.get( "name_2" );
                String method_2 = (String) searchParams.get( "method_2" );

                String name_type_3 = (String) searchParams.get( "name_type_3" );
                String name_3 = (String) searchParams.get( "name_3" );
                String method_3 = (String) searchParams.get( "method_3" );

                String taxon = (String) searchParams.get( "taxon" );
                String taxonName = "Arabidopsis thaliana";
                if (taxon != null) {
                  taxonName = taxon.equals("1") ? "Arabidopsis thaliana" : taxon;
        
                  try {
                    List<DataPopulatorThread.Taxon> taxons =
                      DynamicData.getGermplasmTaxons();
                    for (DataPopulatorThread.Taxon taxonData : taxons) {
                      if (taxonData.getTaxonId().equals(taxon)) {
                        taxonName = taxonData.getScientificName();
                        break;
                      }
                    }
                  } catch (SQLException e) {
                    // ignore exception, leave taxon name as taxon id
                  }
                }

                String allele_name_1 =
              (String) searchParams.get( "allele_name_1" );

                String allele_method_1 =
              (String) searchParams.get( "allele_method_1" );

                String genotype_1 = (String) searchParams.get( "genotype_1" );

                String allele_name_2 =
              (String) searchParams.get( "allele_name_2" );

                String allele_method_2 =
              (String) searchParams.get( "allele_method_2" );

                String genotype_2 = (String) searchParams.get( "genotype_2" );

                String allele_name_3 =
              (String) searchParams.get( "allele_name_3" );

                String allele_method_3 =
              (String) searchParams.get( "allele_method_3" );

                String genotype_3 = (String) searchParams.get( "genotype_3" );

                Boolean is_abrc_stock =
              (Boolean) searchParams.get( "is_abrc_stock" );

                Boolean has_observable_phenotype =
              (Boolean) searchParams.get( "has_observable_phenotype" );

                Boolean has_foreign_dna =
              (Boolean) searchParams.get( "has_foreign_dna" );

                Boolean is_natural_variant =
              (Boolean) searchParams.get( "is_natural_variant" );

                Boolean has_polymorphisms =
              (Boolean) searchParams.get( "has_polymorphisms" );

                Boolean is_mapping_strain =
              (Boolean) searchParams.get( "is_mapping_strain" );

                Boolean has_images = (Boolean) searchParams.get( "has_images" );

                String[] background =
              (String[]) searchParams.get( "background" );

                String[] mutagen = (String[]) searchParams.get(  "mutagen" );
                String[] insertion_type =
              (String[]) searchParams.get( "insertion_type" );

                String[] construct_type =
              (String[]) searchParams.get(  "construct_type" );

                String ploidy = (String) searchParams.get( "ploidy" );

                Boolean is_aneuploid =
              (Boolean) searchParams.get( "is_aneuploid" );

          Integer aneuploid_chromosome =
              (Integer) searchParams.get( "aneuploid_chromosome" );

                java.util.Date restrict_date_from =
              (java.util.Date) searchParams.get( "restrict_date_from" );

                java.util.Date restrict_date_to =
              (java.util.Date) searchParams.get( "restrict_date_to" );

                String high_unit = (String) searchParams.get( "high_unit" );
                String high_range = (String) searchParams.get( "high_range" );
                String low_unit = (String) searchParams.get( "low_unit" );
                String low_range = (String) searchParams.get( "low_range" );
                String range_type =(String) searchParams.get( "range_type" );
                String map_type =(String) searchParams.get( "map_type" );
                String chromosome = (String) searchParams.get( "chromosome" );
                Units units = (Units) searchParams.get( "units" );

                // parent germplasm data should only be in params if search is
                // called from germplasm detail page to display full list of child
                // germplasms
                String parent_germplasm_name =
              (String) searchParams.get( "parent_germplasm_name" );

                boolean first = true;
                buffer.append( "Your query for " );

                if ( germplasm_type == null ||
               germplasm_type.equals( "any" ) ) {

                    buffer.append( "any germplasms" );

                } else if ( germplasm_type.equals( "individual_line" ) ) {
                    buffer.append( "individual lines" );

                } else if ( germplasm_type.equals( "individual_pool" ) ) {
                    buffer.append( "individual pools" );

                } else if ( germplasm_type.equals( "set_of_lines" ) ) {
                    buffer.append( "sets of lines" );

                } else if ( germplasm_type.equals( "set_of_pools" ) ) {
                    buffer.append( "sets of pools" );
                }

                buffer.append( " where " );


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

                if ( parent_germplasm_name != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "parent germplasm is " +
                       parent_germplasm_name );
                }


                if ( taxon != null ) {
                    first = appendComma( buffer, first );
                    if ( taxon.equals( "1" ) ) {
                        buffer.append( "species is " +
                           "<i>Arabidopsis thaliana</i>" );
                    } else if ( taxon.equals( "not_a_thaliana" ) ) {
                        buffer.append( "species is not " +
                           "<i>Arabidopsis thaliana</i>" );
                    } else if ( taxon.equals("hybrid") ) {
                      buffer.append( "species is hybrid of " +
                      "<i>Arabidopsis thaliana</i>" );
                    } else {
                      buffer.append( "species is " +
                      "<i>" + taxonName + "</i>" );
                    }
                }

                // append allele name/inheritance criteria
                if ( !TextConverter.isEmpty( allele_name_1 ) ) {
                    if ( !first ) {
                        buffer.append( ", and " );
                    }
                    first = false;
                    buffer.append( "allele name " +
                       TextConverter.convertMethods(
                           allele_method_1 ) +
                       " " +
                                   allele_name_1 + " with " +
                       genotype_1 + " genotype" );
                }

                if ( !TextConverter.isEmpty( allele_name_2 ) ) {
                    if ( !first ) {
                        buffer.append( ", and " );
                    }
                    first = false;
                    buffer.append( "allele name " +
                       TextConverter.convertMethods(
                           allele_method_2 ) +
                       " " +
                                   allele_name_2 + " with " +
                       genotype_2 + " genotype" );
                }


                if ( !TextConverter.isEmpty( allele_name_3 ) ) {
                    if ( !first ) {
                        buffer.append( ", and " );
                    }
                    first = false;
                    buffer.append( "allele name " +
                       TextConverter.convertMethods(
                           allele_method_3 ) +
                       " " +
                                   allele_name_3 + " with " +
                       genotype_3 + " genotype" );
                }

                // append germplasm specific criteria
                if ( is_abrc_stock != null && is_abrc_stock.booleanValue() ) {
                    first = appendComma( buffer, first );
                    buffer.append( "is ABRC stock" );
                }


                if ( has_foreign_dna != null &&
               has_foreign_dna.booleanValue() ) {

                    first = appendComma( buffer, first );
                    buffer.append( "is transgenic" );
                }

                if ( is_natural_variant != null &&
               is_natural_variant.booleanValue() ) {

                    first = appendComma( buffer, first );
                    buffer.append( "is ecotype" );
                }

                if ( has_polymorphisms != null &&
               has_polymorphisms.booleanValue() ) {

                    first = appendComma( buffer, first );
                    buffer.append( "has polymorphisms" );
                }

                if ( has_observable_phenotype != null &&
               has_observable_phenotype.booleanValue() ) {

                    first = appendComma( buffer, first );
                    buffer.append( "has observable pheonotype" );
                }

                if ( is_mapping_strain != null &&
               is_mapping_strain.booleanValue() ) {

                    first = appendComma( buffer, first );
                    buffer.append( "is mapping strain" );
                }

                if ( has_images != null && has_images.booleanValue() ) {
                    first = appendComma( buffer, first );
                    buffer.append( "has images" );
                }

                if ( ploidy != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "ploidy: " + ploidy );
                }

                if ( is_aneuploid != null && is_aneuploid.booleanValue() ) {
                    first = appendComma( buffer, first );
                    buffer.append( "is aneuploid" );

                    if ( aneuploid_chromosome != null ) {
                        buffer.append( ", variant chrosome: " +
                           aneuploid_chromosome );
                    }
                }

                if ( mutagen != null &&
               mutagen.length > 0 &&
               !mutagen[ 0 ].equals( "any" ) ) {

                    first = appendComma( buffer, first );
                    appendMultipleCriteria( buffer, "mutagen", mutagen );
                }

                if ( insertion_type != null &&
                     insertion_type.length > 0 &&
                     !insertion_type[ 0 ].equals( "any" ) ) {

                    first = appendComma( buffer, first );
                    appendMultipleCriteria( buffer,
                             "insertion type",
                             insertion_type );
                }

                if ( construct_type != null &&
                     construct_type.length > 0 &&
                     !construct_type[ 0 ].equals( "any" ) ) {

                    first = appendComma( buffer, first );
                    appendMultipleCriteria( buffer,
                             "construct type",
                             construct_type );
                }

                if ( background != null &&
               background.length > 0 &&
               !background.equals( "any" ) ) {

                    first = appendComma( buffer, first );
                    appendMultipleCriteria( buffer,
                             "background ecotype",
                             background );
                }

                if ( restrict_date_from != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "last modified on or after: " +
                                   TextConverter.dateToString(
                           restrict_date_from ) );
                }

                if ( restrict_date_to != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "last modified on or before: " +
                                   TextConverter.dateToString(
                           restrict_date_to ) );
                }

                // search by map location criteria
                if ( map_type != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "map type is " + map_type );
                }

                if ( chromosome != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "chromosome is " +
                       Units.translateChromosome( chromosome ) );
                }


                // if searching by element, format is element_type name,
                // else if searching by raw position format is position units
                String formatLowRange = null;
                String formatHighRange = null;
                if ( low_range != null && low_unit != null &&
                     ( low_unit.equalsIgnoreCase( "kb" ) ||
                 low_unit.equalsIgnoreCase( "cm" ) ) ) {

                    formatLowRange = low_range + " " + low_unit;
                } else {
                    formatLowRange = low_unit + " " + low_range;
                }

                if ( high_range != null && high_unit != null &&
                     ( high_unit.equalsIgnoreCase( "kb" ) ||
                 high_unit.equalsIgnoreCase( "cm" ) ) ) {

                    formatHighRange = high_range + " " + high_unit;
                } else {
                    formatHighRange = high_unit + " " + high_range;
                }

                if ( range_type != null &&
               range_type.equalsIgnoreCase( "around" ) ) {

                    if ( units != null ) {
                        first = appendComma( buffer, first );
                        if ( low_range != null ) {
                            buffer.append( "around: " +
                            formatLowRange +
                            " within " );
                            buffer.append( units.getVariance() + " " +
                            units.get_low_unit() );
                        }
                    }

                } else if ( range_type != null &&
                   range_type.equalsIgnoreCase( "between" ) ) {

                    first = appendComma( buffer, first );
                    if ( low_range != null || high_range != null ) {
                        buffer.append( "range: " );
                    }

                    if ( low_range != null ) {
                        buffer.append( formatLowRange );
                    }

                    if ( low_range != null && high_range != null ) {
                        buffer.append( " to " );
                    }

                    if ( high_range != null ) {
                        buffer.append( formatHighRange + " " );
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
     * based on whether current value is first in list or not; returns new
     * value of flag which tracks this
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
            if ( type.equals( "gene_full_name" ) ) {
                translatedType = "gene full name";

            } else if ( type.equals( "gene_name" ) ) {
                translatedType = "gene or locus name";

            } else if ( type.equals( "germplasm_stock_name" ) ) {
                translatedType = "germplasm or stock name";

            } else if ( type.equals( "donor" ) ) {
                translatedType = "donor last name or organization";

            } else if ( type.equals( "gene_symbol" ) ) {
                translatedType = "gene symbol";

            } else if ( type.equals( "locus" ) ) {
                translatedType = "locus name";

            } else if ( type.equals( "germplasm_phenotype" ) ) {
                translatedType = "germplasm phenotype";

            } else if ( type.equals( "germplasm_name" ) ) {
                translatedType = "germplasm name";

            } else if ( type.equals( "stock_number" ) ) {
                translatedType = "stock number";

            } else if ( type.equals( "donor_stock_number" ) ) {
                translatedType = "donor stock number";

            } else if ( type.equals( "donor_person" ) ) {
                translatedType = "donor last name";

            } else if ( type.equals( "donor_organization" ) ) {
                translatedType = "donor organization name";

            } else if ( type.equals( "promoter" ) ) {
                translatedType = "construct promoter name";

            } else if ( type.equals( "reporter" ) ) {
                translatedType = "construct reporter name";

	    } else if ( type.equals( "germplasm_all" ) ) {
		translatedType = "some field";

            } else { // else display form value
                translatedType = type;
            }
        }
        return translatedType;
    }

    /**
     * Convenience method to append multiple values for single field in plain
     * text description of search values
     */
    private void appendMultipleCriteria( StringBuffer buffer,
                          String fieldName,
                          String[] values )
    {
        buffer.append( fieldName + " is " );

        boolean first = true;
        for ( int i = 0; i < values.length; i++ ) {
            if ( !first ) {
                buffer.append( " or " );
            }
            buffer.append( values[ i ] );
            first = false;
        }
    }


}
