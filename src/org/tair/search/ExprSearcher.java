//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.23 $
// $Date: 2004/11/02 20:13:56 $
//------------------------------------------------------------------------------
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.querytools.AnnotationCount;
import org.tair.querytools.AnnotationCountPopulator;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.Debugger;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * ExprSearcher retrieves expression sets according to submitted search 
 * parameters. Search results are stored in a temp table 
 * <code>ExprTableInfo</code> which is created for a particular user based 
 * on query id and search type (array_experiment). For temp table definition
 * see <code>ExprTableInfo</code>.
 */

public class ExprSearcher implements GeneralSearcher, AnnotationTypeSearcher {

    // keep track of tables when creating search query
    private ArrayList tables; 

    
    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display search results
     */
    public String getSummaryPage() { 
	return "/jsp/search/expr_summary.jsp"; 
    }
  
    /**
     * Get literal value for referring to temp table
     */
    public String getSearchType() {
	return "expr"; 
    }


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
     * containing an array of ExprSummary objects and data on the complete 
     * result set
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
    String queryID = (String) searchParams.get("query_id");

	// do first search to populate temp table with full result set 
	if ( firstSearch ) {
	    
        //do preliminary table drops first. should never get here, but just in case
        String del_query = getDelete( queryID );
        conn.setQuery( del_query );
        conn.executeUpdate();
        conn.releaseResources();

        //populate temp table with results
        query = getInsert() + createQuery( conn, searchParams, queryID );
	    conn.setQuery( query );
	    conn.executeUpdate();
	    conn.releaseResources();
	}


    
	// get requested subset, links for scrolling through multiple results
	// pages, and plain text version of search parameters
	searchResults = getResultSlice( conn, scrollParams, order, queryID ); 
	if ( searchResults != null ) { 
	    if ( !searchResults.isEmpty() ) {
		String links = 
		    ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
							  scrollParams.getPage(), 
							  searchResults, 
                              queryID );
		searchResults.setScrollLinks( links );
	    }
	    String criteria = 
		getFormatSearchCriteria( searchParams, 
					 searchResults.getResultSize() );
	    searchResults.setSearchCriteria( criteria );
	}
	return searchResults;
    }

    /**
     * This version of the search method has been added to leverage the 
     * experment search function as an add-on to the expressin search. The 
     * expression search will take advantage of the fact that this search 
     * knows how to do the experiment search (assembles and executes the 
     * (search sql ) and capitalizes on the contents of the temp table that
     * this populates by having the expression search join to this searches 
     * resulting temp table. The expression search looks to see if experiment
     * search criteria have been entered and if so invokes this search method
     * upon which the expression search will search creates SQL that utilizes
     * the contents of the resulting temp table. No paging logic is needed so
     * this simplified method was added to the software. 
     *
     * @param conn An active connection to the database
     * @param searchParams Search params to use for retrieving result set
     * @exception SQLException thrown if a database error occurs
     */
    public void search( Map searchParams, boolean firstSearch )
	throws SQLException {

	DBWriteManager connectionPool = null;
	DBconnection conn = null;
	String query = null;
    
    try {
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.getSearchConnection();
	    String queryID = (String) searchParams.get( "aux_query_id" );
        if ( firstSearch ) { 
            query = getInsert() + createQuery( conn, searchParams, queryID );
	        conn.setQuery( query );
	        conn.executeUpdate();
	        conn.releaseResources();
	    }
    } finally {
	    if ( conn != null ) {
		    connectionPool.return_connection( conn );
	    }
	}
    }

    /**
     * Executes an experiment search as part of the general search.  Search can
     * be done to just return number of matching experiments, or to give the 
     * first page of expression set search results according to the submitted
     * value of doCounts.  This method should only be called by 
     * GeneralSearchHandler as part of the general search.  If requesting actual 
     * search results, searching will insert results into user's temp table, and
     * redirect user to normal summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method. Results
     * are always returned as a SearchResultsCollection; if full search info is
     * requested, collection will contain an array of ExprSummary objects & other
     * search info exactly as if search() were called; if counts are requested,
     * only the result size parameter of the collection will be populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching records 
     * will be returned, if <code>false</code> first page of matching records 
     * will be returned
     * @return SearchResultsCollection containing either number of matches, or 
     * first page of results
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
	    searchTerm = 
		TextConverter.convertEnds( searchTerm.toUpperCase(), 
					   method );

	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.getSearchConnection();

	    // if getting counts, just need number of distinct expression set ids
	    if ( doCounts ) {
		searchResults = doGeneralCounts( conn, searchTerm );

		// else need to insert result set into temp table & get first page
	    } else { 
		searchResults = doFullGeneralSearch( conn, 
						     searchTerm, 
						     queryID );
        
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
            insert_query = createQuery ( conn, searchParams, "" );
        } else if (type.equalsIgnoreCase( "general" )) {
            String searchTerm = (String) searchParams.get( "searchTerm" );
            insert_query = "GENE_QUICKSEARCH_" + searchTerm;
            //String insert_query = createGeneralQuery ( conn, searchParams, ""); 
        } else if (type.equalsIgnoreCase( "annotation" )){
            insert_query = createAnnotationQuery(searchParams);
        } else {
            insert_query = createQuery ( conn, searchParams, "" );
        }
        return insert_query;
    }
    
    /**
     * Retrieve distinct number of expression set ids where name 
     * equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
						     String searchTerm ) 
	throws SQLException {

	SearchResultsCollection searchResults = null;
	ResultSet results = null;
	int count = 0;
	String query = null;

	query = 
	    "SELECT DISTINCT e.expression_set_id " +
	    getBaseFrom() +
	    getBaseWhere() +
	    "AND e.name LIKE " + TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\'";

	conn.setQuery( query );
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
     * Retrieve all experiments whose name matches search term; insert results
     * into temp table, retrieve first page of results, and get descriptive 
     * version of search criteria for display on summary page
     */
    private SearchResultsCollection doFullGeneralSearch( DBconnection conn, 
							 String searchTerm, 
							 String queryID ) 
	throws SQLException {

	ScrollParams scrollParams = null;
	SearchResultsCollection searchResults = null;
	String query = null;
    
	query =
	    getInsert() +
	    getBaseSelect( "NULL", queryID  ) +
	    getBaseFrom() + 
	    getBaseWhere() +
	    "AND e.name LIKE " + TextConverter.dbQuote( searchTerm ) + 
	    " ESCAPE '\\\'";

	// execute search & insert results into temp table
	conn.executeUpdate();
	conn.releaseResources();
    
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

	return searchResults;
    }


    /**
     * Retrieves requested slice of total result set as defined by
     * scroll params
     */
    private SearchResultsCollection getResultSlice( DBconnection conn, 
						    ScrollParams scrollParams,
						    String order,
                            String queryID ) 
	throws SQLException {
	
	ExprSummary[] experiments = null;
	ArrayList found = null;
	ExprSummary experiment = null;
	ResultSet results = null;
	SearchResultsCollection searchCollection = new SearchResultsCollection();
	int floor = scrollParams.getFloor();
	int ceiling = scrollParams.getCeiling();
	int rowCounter = 0;
	StringBuffer query = new StringBuffer();
    
	query.append( "SELECT " + getTableColumns( "result" ) +
		      "FROM RESULT_EXPR WHERE QUERY_ID = '" + queryID + "' "); 
    
	if ( order != null ) {
	    if ( order.equals( "name" ) ) {
		query.append( "ORDER BY name" );

		// experimenter name and keyword selections stored as 
		// "order_column"; use GROUP BY and MIN to handle sorting 
		// experiments w/multiple records by minimum value
	    } else if ( order.equals( "experimenter" ) ||
			order.equals( "category" ) ||
			order.equals( "goal" ) ||
			order.equals( "factor" ) ) {
		query.append( "GROUP BY expression_set_id, " +
                    getTableColumns( "result" ) + 
			      " ORDER BY MIN( order_column ), " +
			      "expression_set_id " );
	    }
	} else {
	    query.append( "ORDER BY name " );
	}
    
	long lastID = 0;
	System.out.println("query : " + query.toString() );
    conn.setQuery( query.toString() );
        results = conn.getResultSet();
	while ( results.next() ) {
	    if ( lastID != results.getLong( "expression_set_id" ) ) {
		if ( rowCounter >= floor && rowCounter <= ceiling ) {
	  	    experiment = saveRow( results );
                     	     if ( found == null ) {
			found = new ArrayList();
		    }
          
		    found.add( experiment );
		}
		rowCounter++;
	    }
	    lastID = results.getLong( "expression_set_id" );
	}
	conn.releaseResources();
    
	if ( found != null && !found.isEmpty() ) {
	    experiments = makeArray( conn, found, false );
	    searchCollection.setResults( experiments );
	    searchCollection.setResultSize( rowCounter );
	    searchCollection.setFloor( floor + 1 );
	    searchCollection.setCeiling( floor + experiments.length );
	}

	// set JSP URL for displaying results
	searchCollection.setResultsPage( getSummaryPage() );

	return searchCollection;
    }

    /**
     * Executes an expression search as an annotation type search - meaning the
     * sql for the searcher will be built based on params that came from a url,
     * typically a link off a displayed count field on a page that shows 
     * associated data counts for a particular keyword.  The value of the count
     * field and consequently the sql needed to return results that match that
     * count, would have been determined based on a scope such as 'term, 
     * 'children' or 'combo' meaning counts of associated data (in this case 
     * expressionSet rpws ) to a keyword term or a keyword's children or both.
     * There may be new "scope" values in the future. "scope" is therefore, 
     * a required parameter sent in the map along with the "kw_id", keyword id,
     * and the "table" parameter is used to access annotation type info from 
     * the AnnotationType table which the <code>AnnotationCountPopulator</code>
     * object uses to construct the search sql. Searching will insert results 
     * into user's temp table, and redirect user to normal expr summary page to
     * display results. Subsequent requests for additional pages of results will
     * be handled by search() method. Results are always returned as a 
     * SearchResultsCollection; collection will contain an array of ExprSummary
     * objects & other search info exactly as if search() were called
     *
     * @param searchParams Map containing search parameters
     * if <code>false</code> first page of matching experiments will be returned
     * @return SearchResultsCollection containing either number of matches, or 
     * first page of results
     * @exception SQLException thrown if a database error occurs
     */
    public SearchResultsCollection doAnnotationTypeSearch( Map searchParams,
                                                           boolean firstSearch) 
	throws SQLException {

	DBconnection conn = null;
	DBWriteManager connectionPool = null;
	SearchResultsCollection searchResults = null;
	Long keyword_id = ( Long )searchParams.get( "kw_id" );
	String child_table_name = ( String )searchParams.get( "table" );
	String scope = ( String )searchParams.get( "scope" );
    String queryID = (String) searchParams.get("query_id");
	ScrollParams scrollParams = null;
	AnnotationCountPopulator acp = new AnnotationCountPopulator();
	StringBuffer query = new StringBuffer();
	System.out.println("microarray seach query id : " + queryID);
	try {
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.getSearchConnection();

	    // get the sql needed to generate the required result set based 
	    // on params. Pass in 'false' so the count attribute of the
	    // AnnotationCount object is not populated 
	    acp.setAnnotationCount( conn, keyword_id, child_table_name, scope, false );
	    searchParams.put( "keyword_name", ( ( AnnotationCount )acp.getAnnotationCount() ).getKeywordName() );   
	    searchParams.put( "is_ann_type", new Boolean( true ) );     
        
        
        if ( firstSearch ) { 
	        if ( ( ( AnnotationCount )acp.getAnnotationCount() ).getSearchSql() != null ) {
		        query.append( getInsert() +
			        getBaseSelect( "NULL", queryID ) +
			        getBaseFrom() +
			        getBaseWhere() +
			        " AND e.tair_object_id IN ( " + 
			        ( ( AnnotationCount )acp.getAnnotationCount() ).getSearchSql() +
			        " ) " );
		    Debugger.println( Debugger.logMsg( this, "sql for basic count link = " + query ) );
        System.out.println("query : " + query.toString() );
		    conn.setQuery( query.toString() );
		    conn.setQueryVariable( keyword_id );
		    conn.executeUpdate(); // execute search & insert results into temp table
		    conn.releaseResources();

		    // now add in results from BioSample_Keyword -- need to add in scope stuff also
		    query.delete( 0, query.length() -1 );
		    if ( scope.equalsIgnoreCase( "term" ) ) { 
		        query.append( getInsert() +
				  getBaseSelect( "NULL", queryID ) +
				  getBaseFrom() +
				  getBaseWhere() +
				  " AND e.tair_object_id IN ( " +
				  " SELECT es.tair_object_id FROM " +
				  " ExpressionSet es, " +
				  " BioSample bs, " +
				  " BioSample_Keyword bsk " +
				  " WHERE es.expression_set_id = bs.expression_set_id " +
				  " AND bs.bio_sample_id = bsk.bio_sample_id " +
				  " AND bsk.keyword_id = " + keyword_id.toString() +
				  " ) " );
		    } else if ( scope.equalsIgnoreCase( "children" ) ) { 
		        query.append( getInsert() +
				  getBaseSelect( "NULL", queryID ) +
				  getBaseFrom() +
				  getBaseWhere() +
				  " AND e.tair_object_id IN ( " +
				  " SELECT es.tair_object_id FROM " +
				  " ExpressionSet es, " +
				  " BioSample bs, " +
				  " BioSample_Keyword bsk, " +
				  " ShortestPath sp " +
				  " WHERE es.expression_set_id = bs.expression_set_id " +
				  " AND bs.bio_sample_id = bsk.bio_sample_id " +
				  " AND bsk.keyword_id = sp.child_term_id " + 
				  " AND sp.parent_term_id = " + keyword_id.toString() +
				  " AND sp.parent_term_id <> sp.child_term_id " +
				  " ) " );
		    } else if ( scope.equalsIgnoreCase( "combo" ) ) { 
		        query.append( getInsert() +
				  getBaseSelect( "NULL", queryID ) +
				  getBaseFrom() +
				  getBaseWhere() +
				  " AND e.tair_object_id IN ( " +
				  " SELECT es.tair_object_id FROM " +
				  " ExpressionSet es, " +
				  " BioSample bs, " +
				  " BioSample_Keyword bsk, " +
				  " ShortestPath sp " +
				  " WHERE es.expression_set_id = bs.expression_set_id " +
				  " AND bs.bio_sample_id = bsk.bio_sample_id " +
				  " AND bsk.keyword_id = sp.child_term_id " + 
				  " AND sp.parent_term_id = " + keyword_id.toString() +
				  " ) " );
		    }
		    Debugger.println( Debugger.logMsg( this, "sql for additional count link = " + query ) );
        System.out.println("query2 : " + query.toString() );
		    conn.setQuery( query.toString() );
		    conn.executeUpdate(); // execute search & insert results into temp table
		    conn.releaseResources(); 
		    // get first page of results from temp table, sort by locus, gene name
		}
        scrollParams = ScrollCalculator.getDefaultScrollParams();
		searchResults = getResultSlice( conn, scrollParams, "name", queryID );
	    }                         
	} finally {
	    if ( conn != null ) {
		conn.releaseResources();
		connectionPool.return_connection( conn );
	    }
	}
	// get plain text version of search parameters
	// get links for scrolling through results
	if ( searchResults != null ) {
	    String links = 
		ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
						      scrollParams.getPage(), 
						      searchResults,
                              queryID );
	    searchResults.setScrollLinks( links );

	    String criteria = 
		getFormatSearchCriteria( searchParams,
					 searchResults.getResultSize() );
	    searchResults.setSearchCriteria( criteria );
	}    
	return searchResults;
    }
   
    /** 
    * get the string of the annotation query so we can assign it as
    * a unique identifier to this annotationQuery search.
    * @param Map searchParams of the filters that we are searching by
    * @return String query of the unique string identifier
    */
    public String createAnnotationQuery ( Map searchParams )
    throws SQLException {

	DBconnection conn = null;
	DBWriteManager connectionPool = null;
	SearchResultsCollection searchResults = null;
	Long keyword_id = ( Long )searchParams.get( "kw_id" );
	String child_table_name = ( String )searchParams.get( "table" );
	String scope = ( String )searchParams.get( "scope" );
	ScrollParams scrollParams = null;
	AnnotationCountPopulator acp = new AnnotationCountPopulator();
	StringBuffer query = new StringBuffer();

	try {
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.getSearchConnection();

	    // get the sql needed to generate the required result set based 
	    // on params. Pass in 'false' so the count attribute of the
	    // AnnotationCount object is not populated 
	    acp.setAnnotationCount( conn, keyword_id, child_table_name, scope, false );
	    searchParams.put( "keyword_name", ( ( AnnotationCount )acp.getAnnotationCount() ).getKeywordName() );   
	    searchParams.put( "is_ann_type", new Boolean( true ) );     
        
	    if ( ( ( AnnotationCount )acp.getAnnotationCount() ).getSearchSql() != null ) {
		    query.append( getBaseSelect( "NULL", "" ) +
			    getBaseFrom() +
			    getBaseWhere() +
			    " AND e.tair_object_id IN ( " + 
			    ( ( AnnotationCount )acp.getAnnotationCount() ).getSearchSql() +
			    " ) " );
		    
            if ( scope.equalsIgnoreCase( "term" ) ) { 
		        query.append( getBaseSelect( "NULL", "" ) +
				  getBaseFrom() +
				  getBaseWhere() +
				  " AND e.tair_object_id IN ( " +
				  " SELECT es.tair_object_id FROM " +
				  " ExpressionSet es, " +
				  " BioSample bs, " +
				  " BioSample_Keyword bsk " +
				  " WHERE es.expression_set_id = bs.expression_set_id " +
				  " AND bs.bio_sample_id = bsk.bio_sample_id " +
				  " AND bsk.keyword_id = " + keyword_id.toString() +
				  " ) " );
		    } else if ( scope.equalsIgnoreCase( "children" ) ) { 
		        query.append( getBaseSelect( "NULL", "" ) +
				  getBaseFrom() +
				  getBaseWhere() +
				  " AND e.tair_object_id IN ( " +
				  " SELECT es.tair_object_id FROM " +
				  " ExpressionSet es, " +
				  " BioSample bs, " +
				  " BioSample_Keyword bsk, " +
				  " ShortestPath sp " +
				  " WHERE es.expression_set_id = bs.expression_set_id " +
				  " AND bs.bio_sample_id = bsk.bio_sample_id " +
				  " AND bsk.keyword_id = sp.child_term_id " + 
				  " AND sp.parent_term_id = " + keyword_id.toString() +
				  " AND sp.parent_term_id <> sp.child_term_id " +
				  " ) " );
		    } else if ( scope.equalsIgnoreCase( "combo" ) ) { 
		        query.append( getBaseSelect( "NULL", "" ) +
				  getBaseFrom() +
				  getBaseWhere() +
				  " AND e.tair_object_id IN ( " +
				  " SELECT es.tair_object_id FROM " +
				  " ExpressionSet es, " +
				  " BioSample bs, " +
				  " BioSample_Keyword bsk, " +
				  " ShortestPath sp " +
				  " WHERE es.expression_set_id = bs.expression_set_id " +
				  " AND bs.bio_sample_id = bsk.bio_sample_id " +
				  " AND bsk.keyword_id = sp.child_term_id " + 
				  " AND sp.parent_term_id = " + keyword_id.toString() +
				  " ) " );
		    }
		}
	} finally {
	    if ( conn != null ) {
		conn.releaseResources();
		connectionPool.return_connection( conn );
	    }
	}
    return query.toString();
    }

    /**
     * Retrieve expression sets using selected tair object ids from search results. 
     * Used for creating downloads for items in search results.
     *
     * @param conn  An active connection to the database
     * @param tairObjectIDs Selected expression set tair_object_ids to retrieve data for
     * @param queryID User's query id. Used to access temp table for user's 
     * individual results.
     */
    public ExprSummary[] getSelected( DBconnection conn, 
				      List tairObjectIDs, 
				      String queryID ) 
	throws SQLException {

	ExprSummary[] experiments = null;
	ExprSummary experiment = null;
	ResultSet results = null;
	ArrayList found = null;
	String query = null;
	Iterator iter = null;

	query = 
	    "SELECT " + getTableColumns( "result" ) + 
	    "FROM RESULT_EXPR WHERE QUERY_ID = '" + queryID + "' " +
	    "AND tair_object_id = ?";

	conn.setQuery( query );

	iter = tairObjectIDs.iterator();
	while ( iter.hasNext() ) {
            Long tair_object_id  = (Long) iter.next();
	    conn.setQueryVariable( tair_object_id );
	    results = conn.getResultSet();
	    if ( results.next() ) {
		experiment = saveRow( results );
		 if ( found == null ) {
		    found = new ArrayList();
		}
        
		found.add( experiment );
	    }
	    results.close();
	}
	conn.releaseResources();

	if ( found != null && !found.isEmpty() ) {
	    experiments = makeArray( conn, found, true );
	}
	return experiments;
    }

  

    /**
     * Retrieve temp table columns for use in any one of larger queries
     */
    private String getTableColumns( String type ) {
	String columns = 
	    "tair_object_id, " +
	    "expression_set_id, " +
	    "name, " +
	    "original_name, " +
	    "submission_number, " +
	    "order_column, " + 
        "query_id ";// may be either keyword or experiment last name
	if (type.equalsIgnoreCase("all")){
        columns = columns + ", date_last_queried ";
    }
    return columns;
    }

    /**
     * Get base select for full search - orderColumn will be 
     * literal string "NULL" unless sorting result set by keywords, 
     * or experimenter name
     */
    private String getBaseSelect( String orderColumn, String queryID ) {
	String select =
	    "SELECT distinct e.tair_object_id, " +
	    "e.expression_set_id, " +
	    "e.name, " +
	    "e.original_name, " +
	    "e.submission_number, " +
	    orderColumn + " ";
    if ( queryID != null && queryID != ""){
        select = select +
        ", '" + queryID + "', CURRENT_DATE ";
    }else{
        select = select +
        ", '', '' ";
    }
	return select;
    }
  
    // get base from clause for full search
    private String getBaseFrom() {
	return "FROM ExpressionSet e ";
    }

    /**
     *	 get base where clause for full search. status is used by
     *	 microarray curation tool, experiment set under curation is
     *	 not visible to outside viewer until the status is null or active
     */	 
    private String getBaseWhere() {
	return "WHERE e.is_obsolete = 'F' AND (e.status = 'active' OR e.status IS NULL) ";
    }
    
    //get statement to delete results from that temp table
    private String getDelete( String queryID ) {
        String delete = 
            " DELETE FROM RESULT_EXPR WHERE QUERY_ID = '" + queryID + "' ";
        return delete;
    }

    // get statement to insert into temp table
    private String getInsert() {
	String insert = 
	    "INSERT /*+ APPEND */ INTO RESULT_EXPR " + 
	    "( " + getTableColumns( "all" ) + ") ";
	return insert;
    }


    /**
     * Save single row of result set as ExprSummary object
     */
    private ExprSummary saveRow( ResultSet results ) throws SQLException {
	ExprSummary experiment = new ExprSummary();
	experiment.setTairObjectID( new Long( results.getLong( "tair_object_id" ) ) );
	experiment.setExpressionSetID( new Long( results.getLong( "expression_set_id" ) ) );
	experiment.setName( results.getString( "name" ) );
	experiment.setSubmissionNumber( results.getString( "submission_number" ) );
	experiment.setOriginalName( results.getString( "original_name" ) );
	return experiment;
    }

    /**
     * Translate list of search results into array of ExprSummary objects. 
     * getFullInfo flag is used by ExprSummary to determine whether all possible 
     * data for summary record is needed - this is only done when creating 
     * objects for download
     */
    private ExprSummary[] makeArray( DBconnection conn, 
				     ArrayList found, 
				     boolean getFullInfo )
	throws SQLException {

	ExprSummary[] experiments = new ExprSummary[ found.size() ];
	experiments = (ExprSummary[]) found.toArray( experiments );

	// get associated data not in temp table
	for ( int i = 0; i < experiments.length; i++ ) {
	    experiments[ i ].populate( conn, getFullInfo );
	}
	return experiments;
    }

    /**
     * Create SQL to retrieve records according to searchParams
     */
    private String createQuery( DBconnection conn, 
				Map searchParams, 
				String queryID ) 
	throws SQLException {

	String name_type_1 = (String) searchParams.get( "name_type_1" );
	String term_1 = (String) searchParams.get( "term_1" );
	String method_1 = (String) searchParams.get( "method_1" );

	String name_type_2 = (String) searchParams.get( "name_type_2" );
	String term_2 = (String) searchParams.get( "term_2" );
	String method_2 = (String) searchParams.get( "method_2" );

	String name_type_3 = (String) searchParams.get( "name_type_3" );
	String term_3 = (String) searchParams.get( "term_3" );
	String method_3 = (String) searchParams.get( "method_3" );
      
        String array_name = (String) searchParams.get( "array_name" );
	
	Long[] experiment_category_id = 
	    (Long[]) searchParams.get( "experiment_category_id" );

	String experiment_goal = (String) searchParams.get( "experiment_goal" );
	String goal_method = (String) searchParams.get( "goal_method" );

	String experimental_factor = (String) searchParams.get( "experimental_factor" );
	String factor_method = (String) searchParams.get( "factor_method" );

	String bio_sample = (String) searchParams.get( "bio_sample" );
	String bio_sample_method = (String) searchParams.get( "bio_sample_method" );

	String order = (String) searchParams.get( "order" );

	StringBuffer from = new StringBuffer();
	StringBuffer joins = new StringBuffer();
	StringBuffer where = new StringBuffer();

	// populate extra field in select used for sorting
	String orderColumn = null;
	if ( order != null ) {
	    if ( order.equals( "experimenter" ) ) {
		orderColumn = "p.last_name_uc";

		// all keyword sorting can be done through one join to keyword
		// w/specific relationship criteria added below when table join
		// is appended to query
	    } else if ( order.equals( "category" ) ||
			order.equals( "goal" ) ||
			order.equals( "factor" ) ) {
		orderColumn = "k.keyword_uc";
	    }
	}

	if ( orderColumn == null ) {
	    orderColumn = "NULL";
	}

   
	tables = new ArrayList();// keep track of tables added to query

	from.append( getBaseSelect( orderColumn, queryID ) + 
		     getBaseFrom() 
		     );
	joins.append( getBaseWhere() );
   
	// add joins according to sort criteria
	if ( order != null ) {
	    if ( order.equals( "experimenter" ) ) {
		addExperimenter( from, joins, where );
	    } else if ( order.equals( "category" ) ) {
		addKeywordRelationship( from, 
					joins, 
					where, 
					"experiment category" );
	    } else if ( order.equals( "goal" ) ) {
		addKeywordRelationship( from, joins, where, "experiment goal" );
	    } else if ( order.equals( "factor" ) ) {
		addKeywordRelationship( from, joins, where, "experimental factor" );
	    }
	}
      
        // add joins for array_name: arraydesing manufacturer
       	if ( array_name != null && ! array_name.equals( "any" )  ) {
	    addArrayManufacturer( from, joins, where, array_name );
        }

	if ( term_1 != null ) {
	    appendNameCriteria( from, joins, where, name_type_1, term_1, method_1 );
	}
   
	if ( term_2 != null ) {
	    appendNameCriteria( from, joins, where, name_type_2, term_2, method_2 );
	}

	if ( term_3 != null ) {
	    appendNameCriteria( from, joins, where, name_type_3, term_3, method_3 );
	}

	// use KeywordSearchHelper to generically produce SQL sub-selects for searching
	// by keyword and relationship type
	KeywordSearchHelper keywordSearcher = null;
	if ( experiment_category_id != null && experiment_category_id.length > 0 ) {
	    keywordSearcher = new KeywordSearchHelper();
	    where.append( "AND e.tair_object_id IN " + 
			  keywordSearcher.getRelationshipTypeEmbeddedSql( conn, 
									  "experiment category",
									  "ExpressionSet",
									  experiment_category_id ) + " " 
			  );
	}
   
	if ( experiment_goal != null ) {
	    if ( keywordSearcher == null ) {
		keywordSearcher = new KeywordSearchHelper();
	    }
	    where.append( "AND e.tair_object_id IN " +
			  keywordSearcher.getRelationshipTypeEmbeddedSql( conn,
									  "experiment goal",
									  "ExpressionSet",
									  experiment_goal,
									  goal_method ) + " " 
			  );
	}

	if ( experimental_factor != null ) {
	    if ( keywordSearcher == null ) {
		keywordSearcher = new KeywordSearchHelper();
	    }
	    where.append( "AND e.tair_object_id IN " +
			  keywordSearcher.getRelationshipTypeEmbeddedSql( conn, 
									  "experimental factor",
									  "ExpressionSet",
									  experimental_factor,
									  factor_method
									  ) + " " 
			  );
	}


	if ( bio_sample != null ) {
	    if ( keywordSearcher == null ) {
		keywordSearcher = new KeywordSearchHelper();
	    }
     
	    addBioSample( from, joins );

	    where.append( "AND b.bio_sample_id IN " +
			  keywordSearcher.getUnqualifiedKeywordSql( conn,
								    "BioSample",
								    bio_sample,
								    bio_sample_method
								    ) + " " 
			  );
	}

	String query = 
	    from.toString() +
	    joins.toString() +
	    where.toString();
   
	Debugger.println( query );
   
	return query;
    }
  

    /**
     * Add bio sample to main query - used for searching plant 
     * tissue/biosample keywords
     */
    private void addBioSample( StringBuffer from, StringBuffer joins ) {
	if ( !tables.contains( "BioSample" ) ) {
	    from.append( ", BioSample b " );
	    joins.append( "AND e.expression_set_id = b.expression_set_id " );
	    tables.add( "BioSample" );
	}
    }

       

    /**
     * Add experimenter data to main query - join to person 
     * through Attribution
     */
    private void addExperimenter( StringBuffer from, 
				  StringBuffer joins, 
				  StringBuffer where ) {

	if ( !tables.contains( "Experimenter" ) ) {
	    from.append( ", Attribution att, " +
			 "AttributionType aty, " +
			 "Community c, " +
			 "Person p " );

	    joins.append( "AND e.tair_object_id = att.tair_object_id " +
			  "AND att.attribution_type_id = aty.attribution_type_id " +
			  "AND att.community_id = c.community_id " +
			  "AND c.community_id = p.community_id " +
			  "AND p.community_id = att.community_id " 
			  );
	    where.append( "AND c.is_obsolete = 'F' " +
			  "AND c.status = " + 
			  TextConverter.dbQuote( DataConstants.getActiveStatus() ) + 
			  " " +
			  "AND aty.attribution_type = 'experiment_done_by' " 
			  );
	    tables.add( "Experimenter" );
	}
    } 
    /**
     * Add submitter as type of organization to main query - join to Organzation 
     * through Attribution
     */
    private void addSubmitOrganization( StringBuffer from, 
				        StringBuffer joins, 
				        StringBuffer where ) {

	if ( !tables.contains( "Organization" ) ) {
	    from.append( ", Attribution att1, " +
			 "AttributionType aty1, " +
			 "Community c1, " +
			 "Organization org " );

	    joins.append( "AND e.tair_object_id = att1.tair_object_id " +
			  "AND att1.attribution_type_id = aty1.attribution_type_id " +
			  "AND att1.community_id = c1.community_id " +
			  "AND c1.community_id = org.community_id " +
			  "AND org.community_id = att1.community_id " +
                          "AND c1.community_type =  'organization' " 
			  );
	    where.append( "AND c1.is_obsolete = 'F' " +
			  "AND c1.status = " + 
			  TextConverter.dbQuote( DataConstants.getActiveStatus() ) + 
			  " " +
			  "AND aty1.attribution_type = 'experiment_done_by' " 
			  );
	    tables.add( "Organization" );
	}
    }

    /**
     * Add table join to retrieve keyword fields by relationship type - used
     * in main query so keywords can by used as ORDER BY when displaying results
     */
    private void addKeywordRelationship( StringBuffer from, 
					 StringBuffer joins, 
					 StringBuffer where, 
					 String relationshipType ) 
    {
	from.append( ", TairObject_Keyword tk, RelationshipType rt, Keyword k " );
	joins.append( "AND e.tair_object_id = tk.tair_object_id " +
		      "AND tk.relationship_type_id = rt.relationship_type_id " +
		      "AND tk.keyword_id = k.keyword_id " );
	where.append( "AND rt.relationshiptype_type = " + 
		      TextConverter.dbQuote( relationshipType ) );
    }

    // add table join to retrieve arraydesign manufacturer   
    private void addArrayManufacturer( StringBuffer from, 
				     StringBuffer joins, 
	    StringBuffer where, String array_name ){
	from.append( ", HybDescription hd, ArrayDesign ad " );
	joins.append( "AND e.expression_set_id = hd.expression_set_id " +
		      "AND hd.array_design_id = ad.array_design_id " );
	where.append( "AND ad.manufacturer = " + 
		      TextConverter.dbQuote( array_name ) + " ");

    }
 
    /**
     * Add criteria entered for one of name form fields
     */
    private void appendNameCriteria( StringBuffer from, 
				     StringBuffer joins, 
				     StringBuffer where, 
				     String type, 
				     String term, 
				     String method ) {

	if ( type != null && term != null ) {

	    // add wildcards and db quotes
	    String searchTerm = 
		TextConverter.dbQuote( 
		    TextConverter.convertEnds( term.toUpperCase(), 
					       method ) );

	    if ( type.equals( "name" ) ) { // search experiment name
		where.append( "AND e.name LIKE " + searchTerm + " ESCAPE '\\\' " );

	    } else if ( type.equals( "experimenter" ) ) {
		addExperimenter( from, joins, where );
		where.append( "AND p.last_name_uc " +
			      "LIKE " + searchTerm + " ESCAPE '\\\' " );

	    } else if ( type.equals( "organization" ) ) {
                addSubmitOrganization( from, joins, where );
		where.append( "AND org.name_uc " +
			      "LIKE " + searchTerm + " ESCAPE '\\\' " );
            }else if ( type.equals( "description" ) ) {
		where.append( "AND UPPER( e.description ) " +
			      "LIKE " + searchTerm + " ESCAPE '\\\' " );

	    } else if ( type.equals( "submission_number" ) ) {
		where.append( "AND UPPER( e.submission_number ) " +
			      "LIKE " + searchTerm + " ESCAPE '\\\' " );
	    } 
           
	}
    } 

    /**
     * Returns description of search criteria used to create result set. 
     * This is a convenience method to simplify life at the JSP search 
     * summary page. Include information on total number of matches for
     * complete description of result set. Interpretation of search params
     * is slightly different if doing general search versus a stand-alone 
     * gene search; use isGeneral flag in searchParams to determine which
     * type of search was done.
     *
     * @param searchParams Field names and values used to create search results
     * @param resultSize Total number of results
     * @return String describing search criteria used to create result set.
     */
    public String getFormatSearchCriteria( Map _searchParams, 
					   int resultSize ) 
    {
	String criteria = null;
	Boolean isGeneral = null;
	Map searchParams = TextConverter.scrub(_searchParams);

	if ( searchParams != null ) {

	    String name_type_1 = (String) searchParams.get( "name_type_1" );
	    String term_1 = (String) searchParams.get( "term_1" );
	    String method_1 = (String) searchParams.get( "method_1" );
      
	    String name_type_2 = (String) searchParams.get( "name_type_2" );
	    String term_2 = (String) searchParams.get( "term_2" );
	    String method_2 = (String) searchParams.get( "method_2" );
      
	    String name_type_3 = (String) searchParams.get( "name_type_3" );
	    String term_3 = (String) searchParams.get( "term_3" );
	    String method_3 = (String) searchParams.get( "method_3" );

	    String[] experiment_category = 
		(String[]) searchParams.get( "experiment_category" );

	    String experiment_goal = (String) searchParams.get( "experiment_goal" );
	    String goal_method = (String) searchParams.get( "goal_method" );

	    String experimental_factor = 
		(String) searchParams.get( "experimental_factor" );

	    String factor_method = (String) searchParams.get( "factor_method" );

	    String bio_sample = (String) searchParams.get( "bio_sample" );
	    String bio_sample_method = 
		(String) searchParams.get( "bio_sample_method" );

	    StringBuffer buffer = new StringBuffer();
    
	    // do general search version of criteria
	    isGeneral =(Boolean) searchParams.get( "isGeneral" );
	    if ( isGeneral != null && isGeneral.booleanValue() ) {
		String searchTerm = (String) searchParams.get( "searchTerm" );
		String method = (String) searchParams.get( "method" );

		buffer.append( "Your query for experiments where " );
        
		if ( !TextConverter.isEmpty( searchTerm ) ) {
		    buffer.append( "name " );
		    buffer.append( TextConverter.convertMethods( method ) );
		    buffer.append( " the term <font class=\"emphasis\">" + 
				   searchTerm + "</font> " );
		}

		// otherwise show criteria for stand alone experiment search
	    } else { 
        
		boolean first = true;
		buffer.append( "Your query for experiments " );

		if ( !TextConverter.isEmpty( term_1 ) ) {
		    first = appendComma( buffer, first );
		    buffer.append( translateTermType( name_type_1 ) + " " + 
				   TextConverter.convertMethods( method_1 ) );
		    buffer.append( " the term <font class=\"emphasis\">" + 
				   term_1 + 
				   "</font>" );
		} 

		if ( !TextConverter.isEmpty( term_2 ) ) {
		    first = appendComma( buffer, first );
		    buffer.append( translateTermType( name_type_2 ) + " " + 
				   TextConverter.convertMethods( method_2 ) );
		    buffer.append( " the term <font class=\"emphasis\">" + 
				   term_2 + "</font>" );
		} 

		if ( !TextConverter.isEmpty( term_3 ) ) {
		    first = appendComma( buffer, first );
		    buffer.append( translateTermType( name_type_3 ) + " " + 
				   TextConverter.convertMethods( method_3 ) );
		    buffer.append( " the term <font class=\"emphasis\">" + 
				   term_3 + "</font>" );
		} 
        
		if ( experiment_category != null && 
		     experiment_category.length > 0 ) {

		    first = appendComma( buffer, first );
		    appendMultipleCriteria( buffer, "experiment category", 
					    experiment_category );
		}

		if ( experiment_goal != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "experiment goal " + 
				   TextConverter.convertMethods( goal_method ) +
				   " the term <font class=\"emphasis\">" + 
				   experiment_goal + "</font>" );
		}
        
		if ( experimental_factor != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "experimental factor/parameter " + 
				   TextConverter.convertMethods( factor_method ) +
				   " the term <font class=\"emphasis\">" + 
				   experimental_factor + "</font>" );
		}

		if ( bio_sample != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "plant tissue " + 
				   TextConverter.convertMethods( bio_sample_method ) +
				   " the term <font class=\"emphasis\">" +
				   bio_sample + "</font>" );
		}
	    }
      
	    buffer.append( " resulted in <font class=\"emphasis\">" + 
			   resultSize + 
			   "</font> " );

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
     * Utility method to translate search form values for search term type to
     * formatted descriptive versions for explaining search criteria
     */
    private String translateTermType( String type ) {
	String translated = null;

	if ( type != null ) {
	    if ( type.equals( "name" ) ) {
		translated = "experiment name";
	    } else if ( type.equals( "description" ) ) {
		translated = "experiment description";
	    } else if ( type.equals( "experimenter" ) ) {
		translated = "experimenter name";
	    } else if ( type.equals( "submission_number" ) ) {
		translated = "submission number";

		// default to entered term
	    } else {
		translated = type;
	    }
	}
	return translated;
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
	    buffer.append( "where " );
	    first = false;
	}
	return first;
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
	    buffer.append( "<font class=\"emphasis\">" + values[ i ] + 
			   "</font>" );
	    first = false;
	}
    }

}
    
  
