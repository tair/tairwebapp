//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2004/05/24 23:34:15 $
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
 * LibrarySearcher is a concrete implementation of DNASearcher that
 * handles type specific searches for libraries. LibrarySearcher creates
 * search SQL to retrieve libraries given search parameters, and returns
 * search results as arrays of <code>LibrarySummary</code> objects.  
 * LibrarySearcher also handles validation of search parameters for a 
 * library search, and retrieval of selected libraries from total result 
 * set for downloading.
 *
 * <p>
 * LibrarySearcher implements GeneralSearcher interface so that it can be 
 * used by GeneralSearchHandler to carry out library searches as part of the 
 * general search.
 */
public class LibrarySearcher extends DNASearcher implements GeneralSearcher {

    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display library search results
     */  
    public String getSummaryPage() { 
	return "/jsp/search/dna/library_summary.jsp"; 
    }

    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() { 
	return "library"; 
    }

    /**
     * Executes a library search as part of the general search.  Search can be
     * done to just return number of matching library records, or to give the 
     * first page of library search results according to the submitted value
     * of doCounts.  This method should only be called by GeneralSearchHandler
     * as part of the general search.  If requesting actual search results, 
     * searching will insert results into user's temp table, and redirect user
     * to normal library summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search
     * info is requested, collection will contain an array of LibrarySummary 
     * objects & other search info exactly as if search() were called; if counts
     * are requested, only the result size parameter of the collection will be 
     * populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching libraries 
     * will be returned, if <code>false</code> first page of matching libraries 
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

            // if getting counts, just need number of distinct library ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

		// else need to insert result set into temp table 
		// and get first page
            } else {
                queryID = (String) searchParams.get("query_id");
                
                if (firstSearch){
                    doFullGeneralSearch( conn, searchTerm, queryID );
                }
        
                // get first page of results from temp table, sort by library name
                ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = getResultSlice( conn, scrollParams, "name", queryID );

                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
	                String links = ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
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
    public String generateInsertLine( DBconnection conn, Map searchParams, String type )
    throws SQLException {                                                      
        if (type.equalsIgnoreCase("form") ) {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        } else if (type.equalsIgnoreCase("general")) { 
            String searchTerm = (String) searchParams.get("searchTerm");
            String insert_query = "LIBRARY_QUICKSEARCH_" + searchTerm;
            super.clearTables();
            return insert_query;
        } else {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        }
    }

    /**
     * Retrieve distinct number of library ids where name equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn,
						     String searchTerm ) 
	throws SQLException {

        SearchResultsCollection searchResults = null;

        int count = 0;

        StringBuffer query = new StringBuffer();    
        query.append( "SELECT DISTINCT l.library_id " +
                      getBaseFrom() + ", LibraryNameAlias a " +
                      getBaseWhere() +
                      "AND l.library_id = a.library_id " +
                      "AND a.name LIKE " + TextConverter.dbQuote( searchTerm ) + 
                      " ESCAPE '\\\' "
                      );
    
        conn.setQuery( query.toString() );
        ResultSet results = conn.getResultSet();

        while ( results.next() ) {
            count++;
        }
        conn.releaseResources();
        searchResults = new SearchResultsCollection();
        searchResults.setResultSize( count );

        return searchResults;
    }

    /**
     * Retrieve all libraries whose name matches search term; insert results 
     * into temp table, retrieve first page of results, and get descriptive 
     * version of search criteria for display on summary page
     */
    private void doFullGeneralSearch( DBconnection conn, String searchTerm, 
							 String queryID ) 
	throws SQLException {


    
        StringBuffer query = new StringBuffer();
        query.append( getInsert() +
                      getBaseSelect( queryID ) +
                      getBaseFrom() +
                      ", LibraryNameAlias a " +
                      getBaseWhere() +
                      "AND l.library_id = a.library_id " +
                      "AND a.name LIKE " + TextConverter.dbQuote( searchTerm ) + 
                      " ESCAPE '\\\'"
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
     * @return library search results as an <code>SearchResultsCollection</code>
     * containing an array of <code>LibrarySummary</code> objects and data on 
     * the complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn, 
						   ScrollParams scrollParams, 
						   String orderBy,
                           String queryID ) 
	throws SQLException {
	
        LibrarySummary[] searchResults = null;
        LibrarySummary library = null;
        ArrayList found = null;
        SearchResultsCollection searchCollection = new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;
    
        // create select query to retrieve data from temp table holding full
	// result set libraries can only be ordered by name
        StringBuffer query = new StringBuffer();
        query.append( "SELECT distinct " + getTableColumns( "result" ) + 
            " FROM RESULT_LIBRARY WHERE QUERY_ID = '" + queryID + "' " + 
		    " " + "ORDER BY name " );

        conn.setQuery( query.toString() );    
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                library = getLibraryRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( library );
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
     * Retrieves selected libraries as <code>LibrarySummary</code> objects, 
     * which implement the <code>DNASummary</code> interface, from result set
     * using supplied ids. This method is used for downloading information
     * for selected objects.
     *
     * @param conn An active connection to the database
     * @param stockIDs Selected stock ids to retrieve from total result set
     * @param sessionID User's session id. Used to retrieve data from person
     * specific temp table
     * @return Array of <code>LibrarySummary</code> objects
     * @throws SQLException thrown if a database error occurs 
     */
    public DNASummary[] getSelected( DBconnection conn, 
				     List libraryIDs, 
				     String queryID ) 
	throws SQLException {

        ArrayList found = null;
        LibrarySummary[] libraries = null;
        LibrarySummary library = null;
        ResultSet results = null;

        String query = 
            "SELECT " + getTableColumns( "result" ) + " " +
            "FROM RESULT_LIBRARY WHERE QUERY_ID = '" + queryID + "' " + 
            "AND library_id = ?";

        conn.setQuery( query );

        Iterator iter = libraryIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                library = getLibraryRow( results );

                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( library );
            }
        }
        conn.releaseResources();

    
        if ( found != null && !found.isEmpty() ) {
            libraries = makeArray( conn, found );
        }
        return libraries;
    }


    /**
     * Save row of result set as a LibrarySummary object
     */
    private LibrarySummary getLibraryRow( ResultSet results ) 
	throws SQLException {

        LibrarySummary library = new LibrarySummary();
        library.set_tair_object_id( 
	     new Long( results.getLong( "tair_object_id" ) ) );

        library.set_library_id( new Long( results.getLong( "library_id" ) ) );
        library.set_name( results.getString( "name" ) );
        library.set_description( results.getString( "description" ) );

        return library;
    }

    /**
     * Translate collection of search results into type-specific array; 
     * retrieve stocks for each result row
     */
    private LibrarySummary[] makeArray( DBconnection conn, List found ) 
	throws SQLException {

        LibrarySummary[] libraries = null;

        if ( found != null && !found.isEmpty() ) {
            libraries = new LibrarySummary[ found.size() ];
            libraries = (LibrarySummary[]) found.toArray( libraries );

	    // get stocks for each row
            for ( int i = 0; i < libraries.length; i++ ) {
                libraries[ i ].get_information( conn ); 
            }
        }

        return libraries;
    }
  
    /**
     * Get temp table columns as string that can be inserted into SQL query
     */
    private String getTableColumns( String type ) {
        String columns =
            "library_id, " +
            "tair_object_id, " +
            "name, " +
            "description, " + 
            "query_id";
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
            "SELECT l.library_id, " +
            "l.tair_object_id, " +
            "l.name, " +
            "l.description ";
        if ( queryID != null && queryID != ""){
            select = select + ", '" + queryID + "', CURRENT_DATE ";
        }else{
            select = select + ", '', '' ";
        }
        return select;
    }

    /**
     * Get base from clause for full search
     */
    private String getBaseFrom() {
        return "FROM Library l ";
    }

    /**
     * Get base where clause for full search
     */
    private String getBaseWhere() {
        return "WHERE l.is_obsolete = 'F' ";
    }

    /**
     * Get statement to insert into temp table
     */
    public String getInsert() {
        String insert =
            "INSERT INTO RESULT_LIBRARY " +
            "( " + getTableColumns( "all" ) + ") ";
        return insert;
    }
    
    public String getDelete(String query_id){
        String del =
            "DELETE FROM RESULT_LIBRARY WHERE QUERY_ID = '" + query_id + "' ";
        return del;
    }


    /**
     * Adds a join to the Stock table that is valid for a library search
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Join portion of WHERE clause to add table joins to
     */
    protected void addStock( StringBuffer from, 
			     StringBuffer where, 
			     StringBuffer joins ) 
    {
        if ( !super.hasTable( "Stock" ) ) {
            from.append( ", TairObject_Stock ts, Stock s " );
            joins.append( "AND l.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = s.stock_id " );
            where.append( "AND s.is_obsolete = 'F' " );
            super.addTable( "Stock" );
        }
    }
  
  
    /**
     * Adds a join to the Vector table that is valid for a library search
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
            joins.append( "AND l.vector_id = v.vector_id " );
            where.append( "AND v.is_obsolete = 'F' " );
            super.addTable( "Vector" );
        }
    }
  
    /**
     * Adds criteria to search libraries by clone name.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone names for 
     */
    protected void searchClone( StringBuffer where, String term ) { 
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM Clone c, CloneNameAlias cna " +
                          "WHERE l.library_id = c.library_id " +
                          "AND c.clone_id = cna.clone_id " +
                          "AND cna.name LIKE " + term + 
                      " ESCAPE '\\\') " 
                      );
    }

    /**
     * Adds criteria to search libraries by insert type
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param insert_type List of insert types to search for
     */
    protected void searchInsertType( StringBuffer where, 
				     String[] insert_type ) 
    {
        super.appendMultiple( where, "l.insert_type", insert_type, true );
    }

    /**
     * Adds criteria to search libraries by library name
     * Overridden from adapter method in DNASearcher superclass
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search library names for
     */
    protected void searchLibrary( StringBuffer where, String term ) { 
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM LibraryNameAlias lna " +
                          "WHERE lna.library_id = l.library_id " +
                          "AND lna.name LIKE " + term +
                      " ESCAPE '\\\') "
                      );
    }
  

    /**
     * Creates SQL to retrieve libraries given search parameters, and insert
     * into temp table created for user with sessionID.  Query creation is 
     * handled by adding library specific data to query here, and then using 
     * createQuery() in <code>DNASearcher</code> superclass to add all other 
     * search criteria to query
     *
     * @param searchParams Search criteria to use when retrieving result set
     * @param sessionID User's session id to use when creating temp table to
     * hold user's search results
     * @return SQL query to retrieve libraries given searchParams and insert 
     * into temp table
     */
    public String createQuery( Map searchParams, String queryID) {
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();

        from.append( getBaseSelect( queryID ) + getBaseFrom() );
        joins.append( getBaseWhere() );

        String subQuery = super.createQuery( searchParams, 
					     "l", 
					     from, 
					     where, 
					     joins );

        return subQuery;
    }


    /**
     * Validates search parameters for a library search. Any errors encountered
     * are stored in errors Map with field name as <code>String</code> key
     * referencing a <code>String</code> error message
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

        String[] clone_end_type = 
	    (String[]) searchParams.get( "clone_end_type" );

        Boolean is_sequenced = (Boolean) searchParams.get( "is_sequenced" );

        Boolean is_genetic_marker = 
	    (Boolean) searchParams.get( "is_genetic_marker" );

        Boolean is_on_a_map = (Boolean) searchParams.get( "is_on_a_map" );

        Boolean is_full_length_cds = 
	    (Boolean) searchParams.get( "is_full_length_cds" );

        String chromosome = (String) searchParams.get( "chromosome" );
        String map_type = (String) searchParams.get( "map_type" );
        String order = (String) searchParams.get( "order" );

        // libraries aren't map elements, so all map/sequence params as 
	/// well as join to GeneticMarker are invalid
        if ( is_sequenced != null && is_sequenced.booleanValue() ) {
            errors.put( "is sequenced", "Libraries cannot be sequenced" );
        }

        if ( ( is_on_a_map != null && is_on_a_map.booleanValue() ) ||
             !TextConverter.isEmpty( chromosome ) ||
             !TextConverter.isEmpty( map_type ) ||
             ( order != null && order.equals( "position" ) ) ) {
            errors.put( "Map position",
			"Libraries cannot be searched or sorted by " +
			"map position" );
        }

        if ( is_genetic_marker != null && is_genetic_marker.booleanValue() ) {
            errors.put( "is genetic marker", 
			"Libraries cannot be genetic markers" );
        }

        if ( is_full_length_cds != null && is_full_length_cds.booleanValue() ) {
            errors.put( "is full length cDNA", 
			"Libraries cannot be full length cDNA" );
        }

        if ( ( clone_end_type != null && 
	       clone_end_type.length > 0 ) && 
	     !clone_end_type[ 0 ].equalsIgnoreCase( "any" ) ) {

            errors.put( "Clone end type", 
			"Libraries cannot be searched by clone end type" );
        }
    
        if ( !validTermType( term_1, type_1 ) ) {
            errors.put( "term 1", "Libraries cannot be searched by " + type_1 );
        }

        if ( !validTermType( term_2, type_2 ) ) {
            errors.put( "term 2", "Libraries cannot be searched by " + type_2 );
        }

        if ( !validTermType( term_3, type_3 ) ) {
            errors.put( "term 3", "Libraries cannot be searched by " + type_3 );
        }
    
    }

  
    /**
     * Determine if selected search term type is valid for library search
     */
    private boolean validTermType( String term, String type ) {
        boolean valid = true;

        if ( term != null && type != null ) {
            if ( type.equals( "clone_end" ) ) {
                valid = false; 

            } else if ( type.equals( "accession" ) ) {
                valid = false;

            } else if ( type.equals( "genbank_gi" ) ) {
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
            buffer.append( "Your query for libraries where " );
        
            if ( !TextConverter.isEmpty( searchTerm ) ) {
                buffer.append( "name " + TextConverter.convertMethods( method ) +
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
