//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.23 $
// $Date: 2006/03/03 17:31:39 $
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
 * CloneSearcher is a concrete implementation of DNASearcher that handles type
 * specific searches for clones. CloneSearcher creates search SQL to retrieve 
 * clones given search parameters, and returns search results as arrays of 
 * <code>CloneSummary</code> objects.  CloneSearcher also handles validation
 * of search parameters for a clone search, and retrieval of selected clones 
 * from total result set for downloading.
 *
 * <p>
 * CloneSearcher implements GeneralSearcher interface so that it can be used by 
 * GeneralSearchHandler to carry out clone searches as part of the general 
 * search.
 */

public class CloneSearcher extends DNASearcher implements GeneralSearcher {
    
    /**
     * Creates an instance of CloneSearcher
     */
    public CloneSearcher() { }
    
    
    /**
     * Executes a clone search as part of the general search.  Search can be 
     * done to just return number of matching clone records, or to give the 
     * first page of clone search results according to the submitted value of
     * doCounts.  This method should only be called by GeneralSearchHandler as 
     * part of the general search.  If requesting actual search results, 
     * searching will insert results into user's temp table, and redirect user
     * to normal clone summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search
     * info is requested, collection will contain an array of CloneSummary 
     * objects & other search info exactly as if search() were called; if counts
     * are requested, only the result size parameter of the collection will be 
     * populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching clones will
     * be returned, if <code>false</code> first page of matching clones will be 
     * returned
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
        ScrollParams scrollParams = null;
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
                
                // else need to insert result set into temp table 
                // and get first page
            } else {
                queryID = (String) searchParams.get("query_id");
                
                if (firstSearch) {
                    doFullGeneralSearch( conn, searchTerm, queryID);
                }
                
                // get first page of results from temp table, sort by clone name
                scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = getResultSlice( conn, scrollParams, "name", queryID );
                
                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
                    String links =
                        ScrollCalculator.getTableScrollLinks( scrollParams.getSize(),
                        scrollParams.getPage(),
                        searchResults,
                        queryID );
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
            String insert_query = "CLONE_QUICKSEARCH_" + searchTerm;
            super.clearTables();
            return insert_query;
        } else {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        }
    }
    
    /**
     * Retrieve distinct number of clone ids where name or GenBank accession 
     * number equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
                                                     String searchTerm ) 
    throws SQLException {
        
        SearchResultsCollection searchResults = null;
        ResultSet results = null;
        int count = 0;
        StringBuffer query = new StringBuffer();    
        
        query.append( "SELECT DISTINCT c.clone_id " +
                      getBaseFrom() + ", CloneNameAlias a " +
                      getBaseWhere() +
                      "AND c.clone_id = a.clone_id " +
                      "AND a.name LIKE " + 
                      TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\' " +
                      "UNION " +
                      "SELECT DISTINCT c.clone_id " +
                      getBaseFrom() + 
                      
                      ", GenBankAccession_wrk gba " +
                      getBaseWhere() +
                      "AND c.map_element_id = gba.map_element_id " +
                      "AND gba.map_element_type = 'clone' " +
                      "AND gba.ic_accession LIKE " +
                      TextConverter.dbQuote( searchTerm ) +
                      " ESCAPE '\\\' "
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
     * Retrieve all clones whose name or GenBank accession number matches 
     * search term; insert results into temp table, retrieve first page of
     * results, and get descriptive version of search criteria for display
     * on summary page
     */
    private void doFullGeneralSearch( DBconnection conn, String searchTerm, 
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
                      ", CloneNameAlias a " +
                      getBaseWhere() +
                      "AND c.clone_id = a.clone_id " +
                      "AND a.name LIKE " + 
                      TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\' " +
                      "UNION " +
                      getBaseSelect( "NULL", queryID ) +
                      getBaseFrom() + 
                      ", GenBankAccession_wrk gba " +
                      getBaseWhere() +
                      "AND c.map_element_id = gba.map_element_id " +
                      "AND gba.map_element_type = 'clone' " +
                      "AND gba.ic_accession LIKE " +
                      TextConverter.dbQuote( searchTerm ) +
                      " ESCAPE '\\\' "
        );
        
        // execute search & insert results into temp table
        conn.setQuery( query.toString() );
        conn.executeUpdate(); 
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
     * @return clone search results as an <code>SearchResultsCollection</code>
     * containing an array of <code>CloneSummary</code> objects and data on 
     * the complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn, 
                                                   ScrollParams scrollParams, 
                                                   String orderBy,
                                                   String query_id)
    throws SQLException {
        
        CloneSummary[] searchResults = null;
        CloneSummary clone = null;
        ArrayList found = null;
        SearchResultsCollection searchCollection = new SearchResultsCollection();
        StringBuffer query = new StringBuffer();
        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;
        
        
        // create query to select results from temp table in requested order
        query.append( "SELECT DISTINCT " + getTableColumns( "result" ) + " " +
                      "FROM RESULT_CLONE WHERE QUERY_ID = '" + query_id + "' ");
        
        if ( orderBy != null && orderBy.equalsIgnoreCase( "name" ) ) {
            query.append( " ORDER BY name " );
            
        } else if ( orderBy != null && 
                orderBy.equalsIgnoreCase( "position" ) ) {
            
            query.append( " ORDER BY chromosome, position " );
            
        } else if ( orderBy != null && orderBy.equalsIgnoreCase( "type" ) ) {
            query.append( " ORDER BY vector_type" );
            
        } else {
            query.append( " ORDER BY name " );
        }
        
        conn.setQuery( query.toString() );
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                clone = getCloneRow( results );
                
                if ( found == null ) {
                    found = new ArrayList();
                }
                
                found.add( clone );
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
     * Retrieves selected clones as <code>CloneSummary</code> objects, which 
     * implement the <code>DNASummary</code> interface, from result set using
     * supplied ids. This method is used for downloading information for 
     * selected objects.
     *
     * @param conn An active connection to the database
     * @param cloneIDs Selected clone ids to retrieve from total result set
     * @param sessionID User's session id. Used to retrieve data from person 
     * specific temp table
     * @return Array of <code>CloneSummary</code> objects
     * @throws SQLException thrown if a database error occurs 
     */
    public DNASummary[] getSelected( DBconnection conn, 
                                     List cloneIDs, 
                                     String queryID ) 
    throws SQLException {
        
        ArrayList found = null;
        CloneSummary[] clones = null;
        CloneSummary clone = null;
        ResultSet results = null;
        
        String query = 
            "SELECT " + getTableColumns( "result" ) + " " +
            "FROM RESULT_CLONE WHERE QUERY_ID = '" + queryID + "' " + 
            " AND clone_id = ?";
        
        conn.setQuery( query );
        Iterator iter = cloneIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                clone = getCloneRow( results );
                
                if ( found == null ) {
                    found = new ArrayList();
                }
                
                found.add( clone );
            }
        }
        conn.releaseResources();
        
        
        if ( found != null && !found.isEmpty() ) {
            clones = makeArray( conn, found );
        }
        return clones;
    }
    
    
    /**
     * Create a clone summary object from a row of search results
     */
    private CloneSummary getCloneRow( ResultSet results ) throws SQLException {
        CloneSummary clone = new CloneSummary();
        clone.set_map_element_id( 
                                 new Long( results.getLong( "map_element_id" ) ) );
        
        clone.set_tair_object_id( 
                                 new Long( results.getLong( "tair_object_id" ) ) );
        
        clone.set_name( results.getString( "name" ) );
        clone.set_vector_type( results.getString( "vector_type" ) );
        clone.set_units( results.getString( "units" ) );
        clone.set_chromosome( results.getString( "chromosome" ) );
        clone.set_clone_id( new Long( results.getLong( "clone_id" ) ) );
        
        return clone;
    }
    
    /**
     * Translate search results into type-specific array of results - 
     * populate extra data needed for displaying each search result on 
     * summary page
     */
    private CloneSummary[] makeArray( DBconnection conn, List found ) 
    throws SQLException {
        
        CloneSummary[] searchResults = null;
        
        if ( found != null && !found.isEmpty() ) {
            searchResults = new CloneSummary[ found.size() ];
            searchResults = (CloneSummary[]) found.toArray( searchResults );
            for ( int i = 0; i < searchResults.length; i++ ) {
                
                // get assignments, loci & aliases for each clone
                searchResults[ i ].get_information( conn );
            }
        }
        return searchResults;
    }
    
    
    /**
     * Adds a join to the Stock table that is valid for a clone search
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Join portion of WHERE clause to add table joins to
     */
    protected void addStock( StringBuffer from, StringBuffer where, 
                             StringBuffer joins ) 
    {
        if ( !super.hasTable( "Stock" ) ) {
            from.append( ", TairObject_Stock ts, Stock s " );
            joins.append( "AND c.tair_object_id = ts.tair_object_id " +
            "AND ts.stock_id = s.stock_id " );
            where.append( "AND s.is_obsolete = 'F' " );
            super.addTable( "Stock" );
        }
    }
    
    
    /**
     * Adds a join to the Vector table that is valid for a clone search
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
     * Adds criteria to search clones by clone name.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone names for 
     */
    protected void searchClone( StringBuffer where, String term ) { 
        where.append( "AND EXISTS ( " +
                      "SELECT 'X' " +
                      "FROM CloneNameAlias cna " +
                      "WHERE cna.clone_id = c.clone_id " +
                      "AND cna.name LIKE " + term + 
                      " ESCAPE '\\\') " 
        );
    }
    
    
    
    /**
     * Adds criteria to search clones by clone end name.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone end names for 
     */
    protected void searchCloneEndName( StringBuffer where, String term ) { 
        where.append( "AND EXISTS ( " +
                      "SELECT 'X' " +
                      "FROM CloneEnd ce, CloneEndNameAlias cna " +
                      "WHERE ce.clone_id = c.clone_id " +
                      "AND ce.clone_end_id = cna.clone_end_id " +
                      "AND cna.name LIKE " + term +
                      " ESCAPE '\\\') "
        );
    }
    
    /**
     * Adds criteria to search clones by library name
     * Overridden from adapter method in DNASearcher superclass
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search library names for
     */
    protected void searchLibrary( StringBuffer where, String term ) {
        where.append( "AND EXISTS (" +
                      "SELECT 'X' " +
                      "FROM LibraryNameAlias lna " +
                      "WHERE c.library_id = lna.library_id " +
                      "AND lna.name LIKE " + term +
                      " ESCAPE '\\\') " 
        );
    }
    
    
    /**
     * Adds criteria to search clones by clone end type.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param clone_end_type List of clone end types to search for
     */
    protected void searchCloneEndType( StringBuffer where, 
                                       String[] clone_end_type ) 
    {
        where.append( "AND EXISTS ( " +
                      "SELECT 'X' " +
                      "FROM CloneEnd ce " +
                      "WHERE ce.clone_id = c.clone_id " 
        );
        super.appendMultiple( where, "ce.cloneend_type", clone_end_type, true );
        where.append( ") " );
    }
    
    /**
     * Adds criteria to search clones by insert type
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
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display clone search results
     */
    public String getSummaryPage() { 
        return "/jsp/search/dna/clone_summary.jsp"; 
    }
    
    
    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() { 
        return "clone"; 
    }
    
    
    /**
     * Get select statement common to all searches
     */
    private String getBaseSelect( String position, String queryID ) {
        String select = null;
        
        if ( position == null ) {
            position = "NULL";
        }
        
        select = 
            "SELECT c.tair_object_id, " +
            "c.map_element_id, " +
            "c.name, " +
            "c.vector_type, " +
            "c.units, " +
            "c.chromosome, " + 
            "c.clone_id, " +
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
     * Get from clause common to all searches
     */
    private String getBaseFrom() {
        return "FROM Clone c ";
    }
    
    /**
     * Get where clause common to all searches
     */
    private String getBaseWhere() {
        return "WHERE c.is_obsolete = 'F' ";
    }
    
    /**
     * Get list of table columns in temp table as string that can be
     * directly included in SQL statements
     */
    private String getTableColumns( String type ) {
        String columns = 
            "tair_object_id, " +
            "map_element_id, " +
            "name, " +
            "vector_type, " +
            "units, " +
            "chromosome, " +
            "clone_id, " +
            "position, " + 
            "query_id";
        // need to check what kind of select it is. if it is result type (called in
        // getResultSlice, then we want to not return date_last_queried
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }
    
    
    /**
    * Get query to insert table columns into temp table
    */
    public String getInsert() {
        String insert = 
            "INSERT INTO RESULT_CLONE " + 
            " ( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }
    
    public String getDelete(String query_id){
        String del = 
            "DELETE FROM RESULT_CLONE WHERE QUERY_ID = '" + query_id + "' ";
        return del;
    }
   
    /**
     * Creates SQL to retrieve clones given search parameters, and insert into
     * temp table created for user with sessionID.  Query creation is handled 
     * by adding clone specific data to query here, and then using createQuery()
     * in <code>DNASearcher</code> superclass to add all other search criteria 
     * to query
     *
     * @param searchParams Search criteria to use when retrieving result set
     * @param sessionID User's session id to use when creating temp table to 
     * hold user's search results
     * @return SQL query to retrieve clones given searchParams and insert into
     * temp table
     */
    public String createQuery( Map searchParams, String queryID ) {
        String map_type = (String) searchParams.get( "map_type" );
        String order = (String) searchParams.get( "order" );
        String position = null;
        
        // determine whether we need to select map position so it can be 
        // included in query passed to super class for appending of search 
        // criteria
        if ( map_type != null && order != null && order.equals( "position" ) ) {
            position = "a.start_position";
        }
        
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();
        
        // create basic query for all searches
        from.append( getBaseSelect( position, queryID ) + getBaseFrom() );
        joins.append( getBaseWhere() );
        
        String subQuery = super.createQuery( searchParams, 
                                             "c", 
                                             from, 
                                             where, 
                                             joins );
        
        return subQuery;
    }
    
    
    /**
     * Validates search parameters for a clone search. Any errors encountered
     * are stored in errors Map with field name as <code>String</code> key
     * referencing a <code>String</code> error message
     *
     * @param searchParams Search parameters to validate
     * @param errors Map to hold all errors encountered while validating
     */    
    public void validateParams( Map searchParams, Map errors ) {
        
        String term_1 = (String) searchParams.get( "term_1" );
        String type_1 = (String) searchParams.get( "type_1" );
        
        String term_2 = (String) searchParams.get( "term_2" );
        String type_2 = (String) searchParams.get( "type_2" );
        
        String term_3 = (String) searchParams.get( "term_3" );
        String type_3 = (String) searchParams.get( "type_3" );
        
        if ( !validTermType( term_1, type_1 ) ) {
            errors.put( "term 1", "Clones cannot be searched by " + type_1 );
        }
        
        if ( !validTermType( term_2, type_2 ) ) {
            errors.put( "term 2", "Clones cannot be searched by " + type_2 );
        }
        
        if ( !validTermType( term_3, type_3 ) ) {
            errors.put( "term 3", "Clones cannot be searched by " + type_3 );
        }
        
    }
    
    
    /**
     * Determine if selected search term type is valid for clone search
     */
    private boolean validTermType( String term, String type ) {
        boolean valid = true;
        
        if ( term != null && type != null ) {
            if ( type.equals( "strain_name" ) ) {
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
            buffer.append( "Your query for clones where " );
            
            if ( !TextConverter.isEmpty( searchTerm ) ) {
                buffer.append( "name or GenBank accession " + 
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
