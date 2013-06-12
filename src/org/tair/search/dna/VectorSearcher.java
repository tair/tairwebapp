//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.15 $
// $Date: 2004/05/24 23:34:16 $
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
 * VectorSearcher is a concrete implementation of DNASearcher that
 * handles type specific searches for vectors. VectorSearcher creates
 * search SQL to retrieve vectors given search parameters, and returns
 * search results as arrays of <code>VectorSummary</code> objects.  
 * VectorSearcher also handles validation of search parameters for a 
 * vector search, and retrieval of selected vectors from total result 
 * set for downloading.
 *
 * <p>
 * VectorSearcher implements GeneralSearcher interface so that it can be used
 * by GeneralSearchHandler to carry out vector searches as part of the general
 * search.
 */

public class VectorSearcher extends DNASearcher implements GeneralSearcher {

    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display vector search results
     */  
    public String getSummaryPage() {
	return "/jsp/search/dna/vector_summary.jsp"; 
    }

    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() { 
	return "vector"; 
    }

    /**
     * Executes a vector search as part of the general search.  Search can be
     * done to just return number of matching vector records, or to give the 
     * first page of vector search results according to the submitted value of
     * doCounts.  This method should only be called by GeneralSearchHandler as
     * part of the general search.  If requesting actual search results, 
     * searching will insert results into user's temp table, and redirect user
     * to normal vector summary page to display results. Subsequent requests
     * for additional pages of results will be handled by search() method.
     * Results are always returned as a SearchResultsCollection; if full search
     * info is requested, collection will contain an array of VectorSummary 
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
        String queryID = "";

        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(), 
						    method );

            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // if getting counts, just need number of distinct vector ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

		// else need to insert result set into temp table
		// and get first page
            } else {
                queryID = (String) searchParams.get("query_id");

                if (firstSearch){
                    doFullGeneralSearch( conn, searchTerm, queryID );
                }

                // get first page of results from temp table, sort by vector name
                ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();

	            searchResults = 
	                getResultSlice( conn, scrollParams, "name", queryID );

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
    public String generateInsertLine( DBconnection conn, Map searchParams, String type )
    throws SQLException {                                           
        if (type.equalsIgnoreCase("form") ) {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        } else if (type.equalsIgnoreCase("general")) {
            String searchTerm = (String) searchParams.get("searchTerm");
            String insert_query = "VECTOR_QUICKSEARCH_" + searchTerm;
            super.clearTables();
            return insert_query;
        } else {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        }
    }  
    
    /**
     * Retrieve distinct number of vector ids where name equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
						     String searchTerm ) 
	throws SQLException {

        int count = 0;

        StringBuffer query = new StringBuffer();    
        query.append( "SELECT DISTINCT v.vector_id " +
                      getBaseFrom() + ", VectorNameAlias a " +
                      getBaseWhere() +
                      "AND v.vector_id = a.vector_id " +
                      "AND a.name LIKE " + 
		      TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\' "
                      );
    
        conn.setQuery( query.toString() );
        ResultSet results = conn.getResultSet();

        while ( results.next() ) {
            count++;
        }
        conn.releaseResources();

        SearchResultsCollection searchResults = 
	    new SearchResultsCollection();

        searchResults.setResultSize( count );

        return searchResults;
    }

    /**
     * Retrieve all libraries whose name matches search term; insert results 
     * into temp table, retrieve first page of results, and get descriptive 
     * version of search criteria for display on summary page
     */
    private void  doFullGeneralSearch( DBconnection conn, String searchTerm, 
	    String queryID ) throws SQLException {
    
        StringBuffer query = new StringBuffer();
        query.append( getInsert() +
                      getBaseSelect( queryID ) +
                      getBaseFrom() +
                      ", VectorNameAlias a " +
                      getBaseWhere() +
                      "AND v.vector_id = a.vector_id " +
                      "AND a.name LIKE " + TextConverter.dbQuote( searchTerm ) + 
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
     * @return vector search results as an <code>SearchResultsCollection</code>
     * containing an array of <code>VectorSummary</code> objects and data on the
     * complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn, 
						   ScrollParams scrollParams,
						   String orderBy, 
                           String queryID) 
	throws SQLException {

        VectorSummary[] searchResults = null;
        VectorSummary vector = null;
        ArrayList found = null;

        SearchResultsCollection searchCollection = 
	    new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;

        // create select query to retrieve data from temp table holding 
	// full result set    
        StringBuffer query = new StringBuffer();
        query.append( "SELECT distinct " + getTableColumns( "result" ) +
                      "FROM RESULT_VECTOR WHERE QUERY_ID = '" + queryID + "' ");
    
        if ( orderBy != null && orderBy.equalsIgnoreCase( "name" ) ) {
            query.append( "ORDER BY name " );
      
        } else if ( orderBy != null && orderBy.equalsIgnoreCase( "type" ) ) {
            query.append( "ORDER BY vector_type " );
        } else {
            query.append( "ORDER BY name " );
        }
    
        conn.setQuery( query.toString() );    
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                vector = getVectorRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }
                found.add( vector );
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
     * Retrieves selected vectors as <code>VectorSummary</code> objects, 
     * which implement the <code>DNASummary</code> interface, from result
     * set using supplied ids. This method is used for downloading 
     * information for selected objects.
     *
     * @param conn An active connection to the database
     * @param stockIDs Selected stock ids to retrieve from total result set
     * @param sessionID User's session id. Used to retrieve data from person
     * specific temp table
     * @return Array of <code>VectorSummary</code> objects
     * @throws SQLException thrown if a database error occurs 
     */
    public DNASummary[] getSelected( DBconnection conn,
				     List vectorIDs, 
				     String queryID ) 
	throws SQLException {

        ArrayList found = null;
        VectorSummary[] vectors = null;
        VectorSummary vector = null;
        ResultSet results = null;

        String query = 
            "SELECT " + getTableColumns( "result" ) + " " +
            "FROM RESULT_VECTOR WHERE QUERY_ID = '" + queryID + "' " +  
            "AND vector_id = ?";
    
        conn.setQuery( query );

        Iterator iter = vectorIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                vector = getVectorRow( results );
        
                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( vector );
            }
        }
        conn.releaseResources();
    
    
        if ( found != null && !found.isEmpty() ) {
            vectors = makeArray( conn, found );
        }
        return vectors;
    }

    /**
     * Save row of result set as a VectorSummary object
     */
    private VectorSummary getVectorRow( ResultSet results )
	throws SQLException {

        VectorSummary vector = new VectorSummary();
        vector.set_tair_object_id( 
	    new Long( results.getLong( "tair_object_id" ) ) );
	
        vector.set_vector_id( new Long( results.getLong( "vector_id" ) ) );
        vector.set_name( results.getString( "name" ) );
        vector.set_type( results.getString( "vector_type" ) );

        return vector;
    }

    /**
     * Translate collection of search results into type-specific array; 
     * get additional data needed for display for each element of array
     */
    private VectorSummary[] makeArray( DBconnection conn, List found ) 
	throws SQLException {

        VectorSummary[] vectors = null;
    
        if ( found != null && !found.isEmpty() ) {
            vectors = new VectorSummary[ found.size() ];
            vectors = (VectorSummary[]) found.toArray( vectors );

	    // populate aliases for each vector in search results
            for ( int i = 0; i < vectors.length; i++ ) {
                vectors[ i ].get_information( conn );  
            }
        }
        return vectors;
    }
  
    /**
     * Get temp table columns as string that can be inserted into SQL query
     */
    private String getTableColumns( String type ) {
        String columns =
            "vector_id, " +
            "tair_object_id, " +
            "name, " +
            "vector_type, " + 
            "query_id ";
        // need to check what kind of select it is. if it is result type (called in
        // getResultSlice, then we want to not return date_last_queried
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return  columns;
    }

    /**
     * Get base select for full search
     */
    private String getBaseSelect( String queryID ) {
        String select = 
            "SELECT v.vector_id, " +
            "v.tair_object_id, " +
            "v.name, " +
            "v.vector_type ";
        
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
        return "FROM Vector v ";
    }

    /**
     * Get base where clause for full search
     */
    private String getBaseWhere() {
        return "WHERE v.is_obsolete = 'F' ";
    }   

    /**
     * Get statement to insert into temp table
    */
    public String getInsert() {
        String insert =
            "INSERT INTO RESULT_VECTOR " +
            " ( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }

    public String getDelete(String query_id){
        String del =
            "DELETE FROM RESULT_VECTOR WHERE QUERY_ID = '" + query_id + "' ";
        return del;
    }

    /**
     * Adds a join to the Stock table that is valid for a vector search
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
        if ( !super.hasTable( "Stock" ) ) {
            from.append( ", TairObject_Stock ts, Stock s " );
            joins.append( "AND v.tair_object_id = ts.tair_object_id " +
                          "AND ts.stock_id = s.stock_id " );
            where.append( "AND s.is_obsolete = 'F' " );
            super.addTable( "Stock" );
        }
    }

    /**
     * Adds criteria to search vectors by clone name.
     * Overridden from adapter method in DNASearcher superclass.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone names for 
     */
    protected void searchClone( StringBuffer where, String term ) { 
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM Clone c, CloneNameAlias cna " +
                          "WHERE v.vector_id = c.vector_id " +
                          "AND c.clone_id = cna.clone_id " +
                          "AND cna.name LIKE " + term + 
                      " ESCAPE '\\\') " 
                      );
    }


    /**
     * Adds criteria to search vectors by library name
     * Overridden from adapter method in DNASearcher superclass
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search library names for
     */
    protected void searchLibrary( StringBuffer where, String term ) { 

        // append library names as a sub-select to account for 
        // multiple libraries to each vector
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM Library l, LibraryNameAlias lna " +
                          "WHERE l.vector_id = v.vector_id " +
                          "AND l.library_id = lna.library_id " +
                          "AND lna.name LIKE " + term +
                      " ESCAPE '\\\') "
                      );
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
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM Clone c " +
                          "WHERE c.vector_id = v.vector_id "
                      );
        super.appendMultiple( where, "insert_type", insert_type, true );
        where.append( ") " );
    }



    /**
     * Adds criteria to search vectors by GenBank accession. 
     * Overridden from superclass to search accession in Vector table instead
     * of NucleotideSequence like all other sub-types
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search GenBank accessions for 
     * @param prefix Table prefix to use when joining to accession criteria 
     * (ignored in this implementation, but need to keep it in param list so 
     * searching can still be done through polymorphic implementation of this
     * method)
     */
    protected void searchGenBankAccession( StringBuffer where, 
					   String term, 
					   String prefix ) 
    { 
        where.append( "AND v.ic_accession LIKE " + term + " ESCAPE '\\\' " );
    }



    /**
     * Creates SQL to retrieve vectors given search parameters, and insert into
     * temp table created for user with sessionID.  Query creation is handled by
     * adding vector specific data to query here, and then using createQuery() 
     * in <code>DNASearcher</code> superclass to add all other search criteria
     * to query
     *
     * @param searchParams Search criteria to use when retrieving result set
     * @param sessionID User's session id to use when creating temp table to 
     * hold user's search results
     * @return SQL query to retrieve vectors given searchParams and insert into 
     * temp table
     */
    public String createQuery( Map searchParams, String queryID) {
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();

        from.append( getBaseSelect( queryID ) + getBaseFrom() );
        joins.append( getBaseWhere() );
        super.addTable( getSearchType() );
   
        String subQuery = super.createQuery( searchParams, 
					     "v", 
					     from, 
					     where, 
					     joins );

        return subQuery;
    }


    /**
     * Validates search parameters for a vector search. Any errors encountered
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


        // vectors aren't map elements, so all map/sequence params as 
	// well as join to GeneticMarker are invalid
        if ( is_sequenced != null && is_sequenced.booleanValue() ) {
            errors.put( "is sequenced", "Vectors cannot be sequenced" );
        }

        if ( ( is_on_a_map != null && is_on_a_map.booleanValue() ) ||
             !TextConverter.isEmpty( chromosome ) ||
             !TextConverter.isEmpty( map_type ) ||
             ( order != null && order.equals( "position" ) ) ) {
            errors.put( "Map position", 
			"Vectors cannot be searched or sorted by " +
			"map position" );
        }

        if ( is_genetic_marker != null && is_genetic_marker.booleanValue() ) {
            errors.put( "is genetic marker", 
			"Vectors cannot be genetic markers" );
        }

        if ( is_full_length_cds != null && is_full_length_cds.booleanValue() ) {
            errors.put( "is full length cDNA", 
			"Vectors cannot be full length cDNA" );
        }

        // if searching by clone end type...
        if ( ( clone_end_type != null && 
	       clone_end_type.length > 0 ) && 
	     !clone_end_type[ 0 ].equalsIgnoreCase( "any" ) ) {

            errors.put( "Clone end type", 
			"Vectors cannot be searched by clone end type" );
        }
    
        if ( !validTermType( term_1, type_1 ) ) {
            errors.put( "term 1", "Vectors cannot be searched by " + type_1 );
        }

        if ( !validTermType( term_2, type_2 ) ) {
            errors.put( "term 2", "Vectors cannot be searched by " + type_2 );
        }

        if ( !validTermType( term_3, type_3 ) ) {
            errors.put( "term 3", "Vectors cannot be searched by " + type_3 );
        }
    
    }

    /**
     * Determine if selected search term type is valid for vector search 
     */
    private boolean validTermType( String term, String type ) {
        boolean valid = true;

        if ( term != null && type != null ) {
            if ( type.equals( "clone_end" ) ) {
                valid = false; 
            } else if ( type.equals( "filter" ) ) {
                valid = false;

            } else if ( type.equals( "locus" ) ) {
                valid = false;

            } else if ( type.equals( "gene" ) ) {
                valid = false;

            } else if ( type.equals( "genbank_gi" ) ) {
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
     * Returns description of search criteria used to create result set 
     * when searching using general search.  This method is defined as an
     * adapter method in DNASearcher superclass, and must be implemented
     * in each sub-class to allow for type-specific definition of search
     * criteria.
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
            buffer.append( "Your query for vectors where " );
        
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
