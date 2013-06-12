//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.22 $
// $Date: 2004/09/16 22:33:36 $
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
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * CloneEndSearcher is a concrete implementation of DNASearcher that handles
 * type specific searches for clone ends. CloneEndSearcher creates search SQL
 * to retrieve clone ends given search parameters, and returns search results
 * as arrays of <code>CloneEndSummary</code> objects.  CloneEndSearcher also 
 * handles validation of search parameters for a clone end search, and retrieval
 * of selected clone ends from total result set for downloading.
 *
 * <p>
 * CloneEndSearcher implements GeneralSearcher interface so that it can be used
 * by GeneralSearchHandler to carry out clone end searches as part of the 
 * general search.
 */

public class CloneEndSearcher extends DNASearcher implements GeneralSearcher {


    /**
     * Executes a clone end search as part of the general search.  Search can 
     * be done to just return number of matching clone end records, or to give
     * the first page of clone end search results according to the submitted 
     * value of doCounts.  This method should only be called by 
     * GeneralSearchHandler as part of the general search.  If requesting actual
     * search results, searching will insert results into user's temp table, and
     * redirect user to normal clone end summary page to display results. 
     * Subsequent requests for additional pages of results will be handled by 
     * search() method.
     *
     * <p>
     * Results are always returned as a SearchResultsCollection; if full search 
     * info is requested, collection will contain an array of CloneEndSummary 
     * objects & other search info exactly as if search() were called; if counts
     * are requested, only the result size parameter of the collection will be 
     * populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching clone ends 
     * will be returned, if <code>false</code> first page of matching clone ends 
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
        String sessionID = (String) searchParams.get( "sessionID" );
        String queryID = "";

        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(),
						    method );
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // if getting counts, just need number of distinct clone ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

		// else need to insert result set into temp 
		// table & get first page
            } else { 
                queryID = (String) searchParams.get("query_id");
                
                if (firstSearch){
                    doFullGeneralSearch( conn, searchTerm, queryID );
        
                }

                // get first page of results from temp table, sort by clone end name
                ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = 
	                getResultSlice( conn, scrollParams, "name", queryID );

                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
                    searchResults.setScrollLinks( 
		                ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
						scrollParams.getPage(), 
						searchResults,
                        queryID));
                }
                // get plain text version of search parameters
                if ( searchResults != null && !searchResults.isEmpty() ) {
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
    public String generateInsertLine( DBconnection conn, 
                                    Map searchParams, String type )
    throws SQLException {
        if (type.equalsIgnoreCase("form") ) {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        } else if (type.equalsIgnoreCase("general")) {
            String searchTerm = (String) searchParams.get("searchTerm");
            String insert_query = "CLONE_END_QUICKSEARCH_" + searchTerm;
            super.clearTables();
            return insert_query;
        } else {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        }
    }

    /**
     * Retrieve distinct number of clone end ids where name equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
						     String searchTerm ) 
        throws SQLException {

        StringBuffer query = new StringBuffer();    
        query.append( "SELECT DISTINCT ce.clone_id " +
                      getBaseFrom() + ", CloneEndNameAlias a " +
                      getBaseWhere() +
                      "AND ce.clone_end_id = a.clone_end_id " +
                      "AND a.name LIKE " + TextConverter.dbQuote( searchTerm )
                      + " ESCAPE '\\\' "
                      );
    
        conn.setQuery( query.toString() );

        ResultSet results = conn.getResultSet();
        int count = 0;
        while ( results.next() ) {
            count++;
        }

        conn.releaseResources();
        SearchResultsCollection searchResults = new SearchResultsCollection();
        searchResults.setResultSize( count );

        return searchResults;
    }

    /**
     * Retrieve all clone ends whose name matches search term; insert results 
     * into temp table, retrieve first page of results, and get descriptive 
     * version of search criteria for display on summary page
     */
    private void  doFullGeneralSearch( DBconnection conn, String searchTerm, 
                                                          String queryID ) 
        throws SQLException {
        
        // do preliminary delete, should never need this, but just in case
        String del_query = getDelete(queryID);
        conn.setQuery( del_query );
        conn.executeUpdate();
        conn.releaseResources();

        StringBuffer query = new StringBuffer();
        query.append( getInsert() +
                      getBaseSelect( "NULL", queryID ) +
                      getBaseFrom() +
                      ", CloneEndNameAlias a " +
                      getBaseWhere() +
                      "AND ce.clone_end_id = a.clone_end_id " +
                      "AND a.name LIKE " + TextConverter.dbQuote( searchTerm ) + 
                      " ESCAPE '\\\' "
                      );
    
        conn.setQuery( query.toString() );
        conn.executeUpdate(); // execute search & insert results into temp table
        conn.releaseResources();
    }


    /**
     * Retrieves requested slice of total result set
     *
     * @param conn An active connection to the database
     * @param scrollParams ScrollParams object containing data defining floor 
     * and ceiling of result set
     * @param sessionID User's session id. Used to retrieve data from person 
     * specific temp table
     * @param String orderBy Field to order search results by
     * @return Clone end search results as an 
     * <code>SearchResultsCollection</code> containing an array of
     * <code>CloneSummary</code> objects and data on the complete result set
     * @exception SQLException thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn, 
                                                   ScrollParams scrollParams, 
                                                   String orderBy,
                                                   String query_id) 
	throws SQLException {

        CloneEndSummary[] searchResults = null;
        CloneEndSummary cloneEnd = null;
        ArrayList found = null;

        SearchResultsCollection searchCollection = 
	    new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;

        // create select query to retrieve data from temp table holding full
	// result set
        StringBuffer query = new StringBuffer();
        query.append( "SELECT distinct " + getTableColumns( "result" ) +
                      "FROM RESULT_CLONE_END WHERE QUERY_ID = '" + query_id + "' "); 
    
        if ( orderBy != null && orderBy.equalsIgnoreCase( "name" ) ) {
            query.append( " ORDER BY name " );
      
        } else if ( orderBy != null && 
		    orderBy.equalsIgnoreCase( "position" ) ) {

            query.append( " ORDER BY chromosome, position " );
      
        } else if ( orderBy != null && orderBy.equalsIgnoreCase( "type" ) ) {
            query.append( " ORDER BY cloneend_type" );
      
        } else {
            query.append( " ORDER BY name " );
        }
    
        conn.setQuery( query.toString() );    
    
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                cloneEnd = getCloneEndRow( results );
        
                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( cloneEnd );
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
     * Retrieves selected clone ends as <code>CloneEndSummary</code> objects,
     * which implement the <code>DNASummary</code> interface, from result set
     * using supplied ids. This method is used for downloading information for 
     * selected objects.
     *
     * @param conn An active connection to the database
     * @param cloneEndIDs Selected clone end ids to retrieve from total 
     * result set
     * @param sessionID User's session id. Used to retrieve data from person
     * specific temp table
     * @return Array of <code>CloneEndSummary</code> objects
     * @throws SQLException thrown if a database error occurs 
     */
    public DNASummary[] getSelected( DBconnection conn, 
				     List cloneEndIDs, 
				     String queryID ) 
        throws SQLException {

        ArrayList found = null;
        CloneEndSummary[] cloneEnds = null;
        CloneEndSummary cloneEnd = null;
        ResultSet results = null;

        String query = 
            "SELECT " + getTableColumns( "result" ) + " " +
            "FROM RESULT_CLONE_END WHERE QUERY_ID = '" + queryID + "' " + 
            "AND clone_end_id = ?";

        conn.setQuery( query );
        Iterator iter = cloneEndIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                cloneEnd = getCloneEndRow( results );

                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( cloneEnd );
            }
        }
        conn.releaseResources();

    
        if ( found != null && !found.isEmpty() ) {
            cloneEnds = makeArray( conn, found );
        }
        return cloneEnds;
    }

    /**
     * Store a single row of result set as a CloneEndSummary object
     */
    private CloneEndSummary getCloneEndRow( ResultSet results ) 
	throws SQLException {

        CloneEndSummary cloneEnd = new CloneEndSummary();

        cloneEnd.set_map_element_id( 
	     new Long( results.getLong( "map_element_id" ) ) );

        cloneEnd.set_tair_object_id( 
	     new Long( results.getLong( "tair_object_id" ) ) );

        cloneEnd.set_clone_end_id( 
	     new Long( results.getLong( "clone_end_id" ) ) );

        cloneEnd.set_name( results.getString( "name" ) );
        cloneEnd.set_type( results.getString( "cloneend_type" ) );
        cloneEnd.set_chromosome( results.getString( "chromosome" ) );

        cloneEnd.set_clone_id( 
	     new Long( results.getLong( "clone_id" ) ) );

        cloneEnd.set_clone_tair_object_id( 
	     new Long( results.getLong( "clone_tair_object_id" ) ) );

        cloneEnd.set_clone_name( results.getString( "clone_name" ) );

        return cloneEnd;
    }

  
    /** 
     * Translate collection of search results into type-specific array; 
     * populate each search result w/extra data for display.
     */
    private CloneEndSummary[] makeArray( DBconnection conn, List found ) 
	throws SQLException {

        CloneEndSummary[] searchResults = null;

        if ( found != null && !found.isEmpty() ) {
            searchResults = new CloneEndSummary[ found.size() ];
            searchResults = (CloneEndSummary[]) found.toArray( searchResults );

            // get assignments, aliases, loci & stocks for each clone end
            for ( int i = 0; i < searchResults.length; i++ ) {
                searchResults[ i ].get_information( conn ); 
            }
        }
        return searchResults;
    }


    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display clone end search results
     */
    public String getSummaryPage() { 
	return "/jsp/search/dna/clone_end_summary.jsp"; 
    }

    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() { 
	return "clone_end"; 
    }

    /**
     * Get temp table columns as string that can be inserted 
     * into SQL query
     */
    private String getTableColumns( String type ) {
        String columns = 
            "clone_end_id, " +
            "map_element_id, " +
            "tair_object_id, " +
            "name, " +
            "cloneend_type, " +
            "chromosome, " +
            "clone_id, " +
            "clone_tair_object_id, " +
            "clone_name, " +
            "position, " + 
            "query_id ";
        // need to check what kind of select it is. if it is result type (called in
        // getResultSlice, then we want to not return date_last_queried
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }

    /**
     * Get base select for full search - position will be 
     * null unless sorting result set by map location
     */
    private String getBaseSelect( String position, String queryID ) {
        String select = 
            "SELECT ce.clone_end_id, " +
            "ce.map_element_id, " +
            "ce.tair_object_id, " +
            "ce.name, " +
            "ce.cloneend_type, " +
            "ce.chromosome, " +
            "ce.clone_id, " +
            "c.tair_object_id, " +
            "c.name, " +
            position + " ";
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
        return "FROM CloneEnd ce, Clone c ";
    }

    /**
     * Get base where clause for full search
     */
    private String getBaseWhere() {
        String where = 
            "WHERE ce.clone_id = c.clone_id " +
            "AND ce.is_obsolete = 'F' " +
            "AND c.is_obsolete = 'F' ";
        return where;
    }

    /**
     * Get statement to insert into temp table
    */
    public String getInsert() {
        String insert =
            "INSERT INTO RESULT_CLONE_END " +
            " ( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }

    public String getDelete(String query_id){
        String del =
            "DELETE FROM RESULT_CLONE_END WHERE QUERY_ID = '" + query_id + "' ";
        return del;
    }


    /**
     * Adds a join to the Stock table that is valid for a clone end search.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Join portion of WHERE clause to add table joins to
     */
    protected void addStock( StringBuffer from, 
			     StringBuffer where, 
			     StringBuffer joins ) 
    {
        from.append( ", TairObject_Stock ts, Stock s " );
        joins.append( "AND c.tair_object_id = ts.tair_object_id " +
                      "AND ts.stock_id = s.stock_id " );
        where.append( "AND s.is_obsolete ='F' " );
        super.addTable( "Stock" );
    }

  
    /**
     * Adds a join to the Vector table that is valid for a clone end search
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Join portion of WHERE clause to add table joins to
     */
    protected void addVector( StringBuffer from, 
			      StringBuffer where, 
			      StringBuffer joins ) 
    {
        if ( !super.hasTable( "Vector" ) ) {
            from.append( ", Vector v " );
            joins.append( "AND c.vector_id = v.vector_id " );
            where.append( "AND v.is_obsolete = 'F' " );
            super.addTable( "Vector" );
        }
    }

    /**
     * Adds criteria to search clone ends by clone name.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone names for 
     */
    protected void searchClone( StringBuffer where, String term ) { 
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM CloneNameAlias cna " +
		      "WHERE cna.clone_id = ce.clone_id " +
		      "AND cna.clone_id = c.clone_id " +
		      "AND cna.name LIKE " + term + 
                      " ESCAPE '\\\') " 
                      );
    }

    /**
     * Adds criteria to search clone ends by clone end name.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone end names for 
     */
    protected void searchCloneEndName( StringBuffer where, String term ) {
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM CloneEndNameAlias cena " +
		      "WHERE cena.clone_end_id = ce.clone_end_id " +
		      "AND cena.name LIKE " + term +
                      ")  ESCAPE '\\\'"
                      );
    }

    /**
     * Adds criteria to search clone ends by clone end type.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param clone_end_type List of clone end types to search for
     */
    protected void searchCloneEndType( StringBuffer where, 
				       String[] clone_end_type ) 
    {
        super.appendMultiple( where, "ce.cloneend_type", clone_end_type, true );
    }

    /**
     * Adds criteria to search clone ends by clone insert type
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param insert_type List of insert types to search for
     */
    protected void searchInsertType( StringBuffer where, 
				     String[] insert_type ) 
    {
        super.appendMultiple( where, "c.insert_type", insert_type, true );
    }

    /**
     * Adds criteria to search by vector type; overridden from super class
     * implementation to search vector type in clone instead of Vector.type
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Table join statements of WHERE clause
     * @param vector_type List of vector types to search for
     */
    protected void searchVectorType( StringBuffer from, 
                                     StringBuffer where, 
                                     StringBuffer joins, 
                                     String[] vector_type ) 
    {
        super.appendMultiple( where, "c.vector_type", vector_type, true );
    }


    /**
     * Adds criteria to search clone ends by library name
     * Overridden from adapter method in DNASearcher superclass
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search library names for
     */
    protected void searchLibrary( StringBuffer where, String term ) { 
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM LibraryNameAlias lna " +
		      "WHERE lna.library_id = c.library_id " +
		      "AND lna.name LIKE " + term +
                      " ESCAPE '\\\') " 
                      );
    }  

    /**
     * Adds criteria to search clone ends by stock number. Overridden from
     * superclass since clone ends are only related to stock through their
     * related clones. Method uses superclass implementation, but substitutes in
     * Clone table prefix instead of CloneEnd
     * 
     * @param where WHERE clause to add criteria to 
     * @param term Term to search stock numbers for
     * @param prefix Table alias/prefix in use in larger query to join stock 
     * criteria to
     * @param filter If <code>true</code> stock number being searched is for 
     * stocks of type "filter"
     */
    protected void searchStockNumber( StringBuffer where, 
				      String term, 
				      String prefix, 
				      boolean filter ) 
    { 
        super.searchStockNumber( where, term, "c", filter );
    }


    /**
     * Adds criteria to search clone ends by stock description. Overridden from
     * superclass since clone ends are only related to stock through their
     * related clones. Method uses superclass implementation, but substitutes in
     * Clone table prefix instead of CloneEnd
     * 
     * @param where WHERE clause to add criteria to 
     * @param term Term to search stock numbers for
     * @param prefix Table alias/prefix in use in larger query to join stock 
     * criteria to
     */
    protected void searchStockDescription( StringBuffer where, 
					   String term, 
					   String prefix ) 
    { 
        super.searchStockDescription( where, term, "c" );
    }

    /**
     * Adds criteria to search clone ends by stock donor name. Overridden from
     * superclass since clone ends are only related to stock through their
     * related clones. Method uses superclass implementation, but substitutes 
     * in Clone table prefix instead of CloneEnd
     * 
     * @param where WHERE clause to add criteria to 
     * @param term Term to search stock numbers for
     * @param prefix Table alias/prefix in use in larger query to join stock 
     * criteria to
     * @param personSearch If <code>true</code> donor person last name will 
     * be searched, if <code>false</code> donor organization name will be 
     * searched
     */
    protected void searchDonorName( StringBuffer where, 
				    String term, 
				    String prefix, 
				    boolean personSearch ) 
    { 
        super.searchDonorName( where, term, "c", personSearch );
    }


    /**
     * Adds criteria to search clone ends by stock donor number. Overridden from
     * superclass since clone ends are only related to stock through their
     * related clones. Method uses superclass implementation, but substitutes 
     * in Clone table prefix instead of CloneEnd
     * 
     * @param where WHERE clause to add criteria to 
     * @param term Term to search donor stock numbers for
     * @param prefix Table alias/prefix in use in larger query to join stock 
     * criteria to
     */
    protected void searchDonorStockNumber( StringBuffer where, 
					   String term, 
					   String prefix ) 
    { 
        super.searchDonorStockNumber( where, term, "c" );
    }

    /**
     * Creates SQL to retrieve clone ends given search parameters, and insert 
     * into temp table created for user with sessionID.  Query creation is 
     * handled by adding clone end specific data to query here, and then using
     * createQuery() in <code>DNASearcher</code> superclass to add all other 
     * search criteria to query
     *
     * @param searchParams Search criteria to use when retrieving result set
     * @param sessionID User's session id to use when creating temp table to 
     * hold user's search results
     * @return SQL query to retrieve clone ends given searchParams and insert
     * into temp table
     */
    public String createQuery( Map searchParams, String queryID) {
        String map_type = (String) searchParams.get( "map_type" );
        String order = (String) searchParams.get( "order" );
        String position = null;
    
        // determine whether we need to select map position for ordering so 
	// it can be included in query passed to super class for appending of 
	// search criteria
        if ( map_type != null && order != null && order.equals( "position" ) ) {
            position = "a.start_position";
        }

        StringBuffer from = new StringBuffer();
        StringBuffer joins = new StringBuffer();
        StringBuffer where = new StringBuffer();

        // create basic search query for clone ends
        from.append( getBaseSelect( position, queryID ) +
                     getBaseFrom() );
        joins.append( getBaseWhere() );

        String searchQuery =  super.createQuery( searchParams, 
						 "ce", 
						 from, 
						 where, 
						 joins );

        return searchQuery;
    }


    /**
     * Validates search parameters for a clone end search. Any errors 
     * encountered are stored in errors Map with field name as 
     * <code>String</code> key referencing a <code>String</code> error 
     * message
     *
     * @param searchParams Search parameters to validate
     * @param errors Map to hold all errors encountered while validating
     */
    public void validateParams( Map searchParams, Map errors ) {

        String term_1 = (String) searchParams.get( "term_1" );
        String type_1 = (String) searchParams.get( "type_1" );
        String method_1 = (String) searchParams.get( "method_1" );

        String term_2 = (String) searchParams.get( "term_2" );
        String type_2 = (String) searchParams.get( "type_2" );
        String method_2 = (String) searchParams.get( "method_2" );

        String term_3 = (String) searchParams.get( "term_3" );
        String type_3 = (String) searchParams.get( "type_3" );
        String method_3 = (String) searchParams.get( "method_1" );
    
        Boolean is_full_length_cds = 
	    (Boolean) searchParams.get( "is_full_length_cds" );

        if ( is_full_length_cds != null && is_full_length_cds.booleanValue() ) {
            errors.put( "is full length cDNA", 
			"Clone ends cannot be full length cDNA" );
        }

        if ( !validTermType( term_1, type_1 ) ) {
            errors.put( "term 1", 
			"Clone ends cannot be searched by " + type_1 );
        }

        if ( !validTermType( term_2, type_2 ) ) {
            errors.put( "term 2", 
			"Clone ends cannot be searched by " + type_2 );
        }

        if ( !validTermType( term_3, type_3 ) ) {
            errors.put( "term 3", 
			"Clone ends cannot be searched by " + type_3 );
        }
    }

    /**
     * Determine if selected search term type is valid for clone end search
     */
    private boolean validTermType( String term, String type ) {
        boolean valid = true;

        if ( term != null && type != null ) {
            if ( type.equals( "filter" ) ) {
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
     * searching using general search.  This method is defined as an adapter 
     * method in DNASearcher superclass, and must be implemented in each 
     * sub-class to allow for type-specific definition of search criteria.
     */
    protected String getGeneralSearchCriteria( Map searchParams, 
					       int resultSize ) 
    {
        StringBuffer buffer = null;
        String criteria = null;

        if ( searchParams != null ) {
            buffer = new StringBuffer();

            String searchTerm = (String) searchParams.get( "searchTerm" );
            String method = (String) searchParams.get( "method" );
            buffer.append( "Your query for clone ends where " );
        
            if ( !TextConverter.isEmpty( searchTerm ) ) {
                buffer.append( "name " + 
			       TextConverter.convertMethods( method ) +
                               " the term <font class=\"emphasis\">" + 
			       searchTerm + "</font> " );
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
