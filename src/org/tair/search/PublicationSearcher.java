//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.29 $
// $Date: 2005/03/10 17:07:01 $
//------------------------------------------------------------------------------
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.querytools.AnnotationCountPopulator;
import org.tair.querytools.GeneModelCollection;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcKeywordType;
import org.tair.utilities.DataConstants;
import org.tair.utilities.Debugger;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * PublicationSearcher retrieves publications according to submitted 
 * search parameters. Search results are stored in a temp table created 
 * for a particular user, and are then returned one page at a time. 
 * PublicationSearcher only inserts and selects from temp table; creating, 
 * deleting and dropping table is done by <code>SearchSession</code>.  
 * PublicationSearcher retrieves the relevant table name to use by querying 
 * <code>MasterTableInfo</code>.
 *
 * <p>
 * PublicationSearcher receives search parameters as retrieved from web 
 * submission by <code>PublicationSearchHandler</code>. Results are returned
 * as <code>SearchResultsCollection</code> object containing an array of 
 * <code>PublicationSummary</code> objects.
 *
 * <p>
 * PublicationSearcher implements AnnotationTypeSearcher interface so that it
 * can be used by GeneralSearchHandler to carry out publication searches as a
 * link off associated data count display fields on various pages such as 
 * keyword_summary.jsp, tree_viewer_kw.jsp, and keyword_detail.jsp. 
 */

public class PublicationSearcher implements AnnotationTypeSearcher {
  
    private String searchType = "pub";
    private String keywordSearchString = null;
    private String query_id = ""; // this is the query_id unique to the search
    private boolean isExact = false;

    // flags to track if PubSourceAlias and URL tables have been
    // included in main search query
    private boolean addedPubSourceAlias = false;
    private boolean addedURL = false;


    // search type literal 
    public String getSearchType() { 
	return searchType; 
    }

    // set search string input on search form in order to highlight the string
    // in the keyword list 
    private void setKeywordSearchString( String keywordSearchString ) { 
	this.keywordSearchString = keywordSearchString; 
    }

    // return the keyword search string in order to highlight the string in 
    // the keyword list 
    private String getKeywordSearchString() { 
	return keywordSearchString; 
    }

    // retrieve boolean flag to indicate if the method for the keyword 
    // search is "exact"
    private boolean isExactKeywordSearch() { 
	return isExact; 
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
     * containing an array of PublicationSummary objects and data on the 
     * complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection search( DBconnection conn, 
					   Map searchParams, 
					   ScrollParams scrollParams, 
					   boolean firstSearch ) 
	throws SQLException {

        SearchResultsCollection searchResults = null;
        String order =  (String) searchParams.get( "sort" );
        String query_id = "";
    
        // to highlight in the keyword list on the result page
        if ( searchParams.get( "keyword_term" ) != null ) {
            setKeywordSearchString( 
		(String) searchParams.get( "keyword_term" ) );

	    String keywordMethod = (String) searchParams.get( "keyword_method" );
            if ( keywordMethod.equals( DataConstants.SEARCH_EXACT ) ) {
		isExact = true;
	    }
        }
   
	    // if first search, populate temp. table with initial results
        if ( firstSearch ) {
            query_id = (String) searchParams.get("query_id");
	        populateTempTable( conn, searchParams, query_id );
        } else {
            query_id = (String) searchParams.get("query_id");
        }
        System.out.println("GETTNG TO THE QUERY ID : " + query_id);
        searchResults = getResultSlice( conn, scrollParams, order, query_id );

        // get text version of how search results were created
        if ( searchResults != null ) {
	    String criteria = 
		getFormatSearchCriteria( conn, searchParams,
					 searchResults.getResultSize() );

            searchResults.setSearchCriteria( criteria );
        }

        return searchResults;
    }
    
    /**
     * Executes a publication search as an annotation type search - meaning the
     * sql for the searcher will be built based on params that came from a url,
     * typically a link off a displayed count field on a page that shows 
     * associated data counts for a particular keyword.  The value of the count
     * field and consequently the sql needed to return results that match that 
     * count, would have been determined based on a scope such as 'term, 
     * 'children' or 'combo' meaning counts of associated data (in this case 
     * genes) to a keyword term or a keyword's children or both.  There may be 
     * new "scope" values in the future. "scope" is therefore, a required 
     * parameter sent in the map along with the "kw_id", keyword id, and the 
     * "table" parameter is used to access annotation type info from the 
     * AnnotationType table which the <code>AnnotationCountPopulator</code> 
     * object uses to construct the search sql. Searching will insert results 
     * into user's temp table, and redirect user to normal publication summary
     * page to display results. Subsequent requests for additional pages of 
     * results will be handled by search() method. Results are always returned 
     * as a SearchResultsCollection;the collection will contain an array of 
     * PublicationSummary objects & other search info exactly as if search()
     * were called
     *
     * @param searchParams Map containing search parameters
     * @return SearchResultsCollection containing first page
     * of results
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection doAnnotationTypeSearch( Map searchParams,
                                                           boolean firstSearch) 
	throws SQLException {

        DBconnection conn = null;
        DBWriteManager connectionPool = null;
        SearchResultsCollection searchResults = null;
        Long keyword_id = (Long) searchParams.get( "kw_id" );
        String child_table_name = ( String )searchParams.get( "table" );
        String scope = (String) searchParams.get( "scope" );
        String queryID = (String) searchParams.get( "query_id" );
        ScrollParams scrollParams = null;
        AnnotationCountPopulator acp = new AnnotationCountPopulator();
        StringBuffer query = new StringBuffer();

        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // get the sql needed to generate the required result set based on
	    // params. pass in 'false' so the count attribute of the 
	    // AnnotationCount object is not populated 
            acp.setAnnotationCount( conn, 
				    keyword_id, 
				    child_table_name, 
				    scope, 
				    false );

            searchParams.put( "keyword_name", 
			      acp.getAnnotationCount().getKeywordName() );

            // to highlight in the keyword list on the result page
            setKeywordSearchString( acp.getAnnotationCount().getKeywordName() );
            isExact = true;
            searchParams.put( "is_ann_type", new Boolean( true ) );        
         if (firstSearch ) { 
            if ( acp.getAnnotationCount().getSearchSql() != null ) {
                query.append( getInsert() + 
                              getBaseSelect(queryID) +
                              getBaseFrom() +
                              getBaseWhere() +
                              " AND p.reference_id IN ( " + 
                              acp.getAnnotationCount().getSearchSql() +
                              " ) " );


		    // execute search & insert results into temp table
            conn.setQuery( query.toString() );
            conn.setQueryVariable( keyword_id );
            conn.executeUpdate(); 
            conn.releaseResources();
            }                         
       }
            // get first page of results from temp table sort by date
            scrollParams = ScrollCalculator.getDefaultScrollParams();
            searchResults = getResultSlice( conn, scrollParams, 
		                                        "date", queryID);
        } finally {
            if ( conn != null ) {
                conn.releaseResources();
                connectionPool.return_connection( conn );
            }
        }
        // get plain text version of search parameters
        if ( searchResults != null ) {
	    String criteria = 
		getFormatSearchCriteria( conn, searchParams, 
					 searchResults.getResultSize() );
            searchResults.setSearchCriteria( criteria );
        }    
        return searchResults;
    }


    /**
     * Populate temp table with complete result set
     */
    public String generateInsertLine( DBconnection conn,
                    Map searchParams, String type )
    throws SQLException { 
        
        if (type.equalsIgnoreCase("form") ) {
            String insert_query = generate_query( searchParams, false, conn, "" );
            insert_query = insert_query + generate_query(searchParams, true, conn, "" );
            return insert_query;
        } else {
            String insert_query = generate_query( searchParams, false, conn, "" );
            insert_query = insert_query + generate_query(searchParams, true, conn, "" );
            return insert_query;
        }
    }

    private void populateTempTable( DBconnection conn, 
				    Map searchParams, 
            String query_id) 
	throws SQLException {

        //do preliminary table drops first. should never get here, but just in case
        String del_query = "DELETE FROM RESULT_PUBLICATION WHERE QUERY_ID = '" + query_id + "' ";
        System.out.println("dropping query : " + del_query);
        conn.setQuery( del_query );
        conn.executeUpdate();
        conn.releaseResources();
        
        // populate temp table w/results w/out using alias
        String insert_query = generate_query( searchParams, false, conn, "");
        String query = getInsert() + generate_query(searchParams, false, conn, query_id);
        System.out.println("PublicationSearcher.populateTempTable query : " + query + "query_ID : " + query_id );
        conn.setQuery( query );
        conn.executeUpdate();
        conn.releaseResources();
    
        //  populate temp table w/alias results
        if ( alias( searchParams ) ) {
            query_id = MasterTableInfo.getQueryID( insert_query, conn, getSearchType() );
            query = getInsert() + generate_query(searchParams, false, conn, query_id);
            System.out.println("PublicationSearcher.populateTempTable with alias query : " + query + "query_ID : " + query_id );
            conn.setQuery(query);
            conn.executeUpdate();
            conn.releaseResources();
        }
    }

    /**
     * Retrieves requested slice of total result set as defined by scrollParams
     */
    private SearchResultsCollection getResultSlice( DBconnection conn, 
						    ScrollParams scrollParams, 
						    String orderBy,
                String query_id) 
	throws SQLException {    

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;

        ArrayList found = null;

        SearchResultsCollection searchCollection = 
	    new SearchResultsCollection();

        PublicationSummary[] searchResults = null;
        PublicationSummary publication = null;
    
        StringBuffer query = new StringBuffer();
        query.append(   "SELECT DISTINCT " + getTableColumns() + " " +
                        "FROM RESULT_PUBLICATION " + 
		                "WHERE query_id = '" + query_id + "' ");
        
        if ( orderBy != null && !orderBy.equals( "date" ) ) {
            if ( orderBy.equals( "author" ) ) {
                query.append( "ORDER BY authors_uc " );
            } 
        } else {
            query.append( "ORDER BY publication_year DESC, title " );
        }

        System.out.println("query in resultslice: " + query.toString() );

        conn.setQuery( query.toString() );
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                publication = getPublicationRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }
                found.add( publication );
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

            // get links for scrolling through multiple results pages,
	    String links = 
		ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
						      scrollParams.getPage(), 
						      searchCollection,
                              query_id); 
            searchCollection.setScrollLinks( links );
        }
    
        // set page for displaying results
        searchCollection.setResultsPage( getSummaryPage() );
	
        return searchCollection;
    }
  


    /**
     * Retrieve publications using selected reference ids from search results.
     * Used for creating downloads for items in search results.
     *
     * @param conn  An active connection to the database
     * @param referenceIDs Selected reference ids to retrieve data for
     * individual results.
     */
    public PublicationSummary[] getSelected( DBconnection conn,
					     List referenceIDs,
               String queryID ) 
	throws SQLException {

        ArrayList found = null;
        PublicationSummary[] pubs = null;

        String query = 
            "SELECT " + getTableColumns() + " " +
            "FROM RESULT_PUBLICATION WHERE QUERY_ID = '" + queryID + "' AND reference_id = ?";

        conn.setQuery( query );

	ResultSet results = null;
	PublicationSummary publication = null;

        Iterator iter = referenceIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                publication = getPublicationRow( results );
        
                if ( found == null ) {
                    found = new ArrayList(); 
                }
                found.add( publication );
            }
        }
        conn.releaseResources();    
        if ( found != null && !found.isEmpty() ) {
            pubs = makeArray( conn, found );
        }
        return pubs;
    }

    /**
     * Create PublicationSummary object out of single row of result set
     */
    private PublicationSummary getPublicationRow( ResultSet results ) 
	throws SQLException {

        PublicationSummary publication = new PublicationSummary();

        publication.set_reference_id( 
	   results.getBigDecimal( "reference_id" ).toBigInteger() );

        int i = results.getInt( "publication_year" );
        if ( !results.wasNull() ) {
            publication.set_year( new Integer( i ) );
        }
	
	publication.set_title( results.getString( "title" ) );
        publication.set_volume( results.getString( "volume" ) );
        publication.set_page_start( results.getString( "page_start" ) );
        publication.set_pub_source_name( 
	    results.getString( "pub_source_name" ) );

        return publication;
    }

    /**
     * Create array of PublicationSummary objects from list of found objects;
     * populate extra info needed for display of current slice (authors, 
     * title, keywords etc.)
     */
    private PublicationSummary[] makeArray( DBconnection conn, List found ) 
	throws SQLException {

        PublicationSummary[] searchResults = null;

        searchResults = new PublicationSummary[ found.size() ];
        searchResults = (PublicationSummary[]) found.toArray( searchResults );
    
        for ( int i = 0; i < searchResults.length; i++ ) {
            searchResults[ i ].populate( conn );

            // set the keywords for each publication object 
	    searchResults[ i ].setHighlightedKeywordList( conn, 
							  getKeywordSearchString(),
							  isExact );
        }

        return searchResults;
    }

    /**
     * Retrieves JSP URL to use for displaying publication search results
     *
     * @return JSP URL to use for displaying publication search results
     */
    public String getSummaryPage() {
        return "/jsp/search/publication_summary.jsp";
    }


    /**
     * Retrieve list of temp table columns in form that can be included directly
     * in SQL statement
     */
    private String getTableColumns() {
        String columns =
            "reference_id, " +
            "publication_year, " +
	        "title, " +
            "authors_uc, " +
            "volume, " +
            "page_start, " +
            "pub_source_name, " + 
            "query_id, " + 
            "date_last_queried ";
        return columns;
    }
  
    /**
     * Get select used in all full searches
     */
    private String getBaseSelect( String query_id ) {
        String select =
            "SELECT p.reference_id, " +
            "p.publication_year, " +
	        "p.title, " +
            "p.authors_uc, " +
            "p.volume, " +
            "p.page_start, " +
            "s.name";
        if ( query_id != null && query_id != ""){
            select = select + 
                ", '" + query_id + "', CURRENT_DATE ";
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
        return "FROM Publication p, PubSource s ";
    }

    /**
     * Get basic where clause for all full searches
     */
    private String getBaseWhere() {
        return "WHERE p.pub_source_id = s.pub_source_id ";
    }

    /**
     * Get insert statement to insert rows into temp table
     */
    private String getInsert() {
        String insert = 
            "INSERT INTO RESULT_PUBLICATION "+ 
	        " ( " + getTableColumns() + " ) ";
	
        return insert;
    }
    
  
    /**
     * Generate search SQL query
     */
    private String generate_query( Map searchParams, 
				   boolean alias, 
				   DBconnection conn,
           String query_id) 
	throws SQLException {
    System.out.println("WE ARE GENERATING A QUERY");

	// create initial query for publications
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();

        from.append( getBaseSelect( query_id ) +
                     getBaseFrom() );
        where.append( getBaseWhere() );


	// publication search can be called from gene or locus detail
	// page to show full list of associated publications. Append
	// criteria using methods for type specific logic
	Long gene_tair_object_id = 
	    (Long) searchParams.get( "gene_tair_object_id" );

	if ( gene_tair_object_id != null ) {
	    appendGeneCriteria( from, where, gene_tair_object_id );
	}

	Long locus_tair_object_id = 
	    (Long) searchParams.get( "locus_tair_object_id" );

	if ( locus_tair_object_id != null ) {
	    appendLocusCriteria( conn, from, where, locus_tair_object_id );
	}

	
	//
	// otherwise, append search criteria entered from publication
	// search form
	//

	// add search criteria for 3 main search boxes on form
	appendTextBoxes( from, where, searchParams, alias );
	

	// append publication year and type criteria
        Integer year_from = (Integer) searchParams.get( "from" );
        Integer year_end = (Integer) searchParams.get( "to" );

        String publication_type = 
	    (String) searchParams.get( "publication_type" );
  

        if ( year_from != null ) {
            where.append( "AND p.publication_year >= " + year_from + " " ); 
        }
    
        if ( year_end != null ) {
            where.append( "AND p.publication_year <= " + year_end + " " );
        }
    
        if ( publication_type != null && !publication_type.equals( "all" ) ) {
            where.append( "AND ( s.pubsource_type = " + 
			  TextConverter.dbQuote( publication_type ) + 
                          " OR p.publication_type = " + 
			  TextConverter.dbQuote( publication_type ) + ") " );
        }

        // add in keyword search criteria, if there are any
        KeywordSearchHelper helper = new KeywordSearchHelper();
        String keywordSQL = helper.getIncludeSql( conn, 
						  "Publication", 
						  searchParams );
        if ( keywordSQL != null ) {
            where.append( " AND p.reference_id IN " + keywordSQL );
        }


	    String query = from.toString() + where.toString();
        Debugger.println( "test is this printing : " + query );

        return query;
    }

    /**
     * Append criteria for getting publications associated to gene
     * with submitted tair object id.  This handles the function of
     * showing a full list of publications for a gene.  Gene detail
     * page will link to publication search to show this full list
     * if number of publications associated to gene is too large to
     * display all of them on the gene detail page.
     *
     * @param from SELECT and FROM clause of query
     * @param where WHERE clause of query
     * @param gene_tair_object_id Tair object id of gene to retrieve
     * publications for
     */
    private void appendGeneCriteria( StringBuffer from,
				     StringBuffer where,
				     Long gene_tair_object_id )
    {
	from.append( ", TairObj_Ref tr " );
	where.append( " AND tr.reference_id = p.reference_id " +
		      " AND tr.tair_object_id = " + 
		      gene_tair_object_id.toString() );
    }


    /**
     * Appends criteria for getting publications associated to locus with
     * submitted tair object id. This is done by getting publications 
     * linked to the locus directly as well as to any gene models associated
     * with the locus.  Locus detail page will link to the publication 
     * search for showing a complete list of all publications when the
     * number of associated pubs is too large for display on the detail page.
     *
     * @param conn An active connection to the database
     * @param from FROM clause of SQL query
     * @param where WHERE clause of SQL query
     * @param locus_tair_object_id Tair object id of locus to retrieve
     * publications for
     * @throws SQLException if a database error occurs when retrieving
     * tair object ids of locus's associated genes
     */
    private void appendLocusCriteria( DBconnection conn,
				      StringBuffer from,
				      StringBuffer where,
				      Long locus_tair_object_id ) 
	throws SQLException {

	// get tair object ids of all genes associated to locus
	Long[] geneTairObjectIDs = 
	    GeneModelCollection.getLocusGeneModels( conn,
						    locus_tair_object_id );


	// join to TairObj_Ref to get pubs associated to locus
	// or any of its gene models
	from.append( ", TairObj_Ref tr " );
	where.append( "AND p.reference_id = tr.reference_id " );
	where.append( "AND tr.tair_object_id IN (" + locus_tair_object_id );

	// append ids of any gene models found for locus
	if ( geneTairObjectIDs != null ) {
	    for ( int i = 0; i < geneTairObjectIDs.length; i++ ) {
		where.append( ", " + geneTairObjectIDs[ i ] );
	    }
	}
	where.append( ") " );
    }

    

    /**
     * Gateway method to append search criteria entered in three text
     * fields on search form.  Each row of criteria consists of the
     * search term entered in the text area, the selected name type to
     * search, and the selected search method (exact match, contains,
     * etc.).  This method retrieves data for all three text areas, then
     * passes off to appendTermCriteria to append the type specific
     * criteria for each row.
     *
     * @param from FROM clause of search query
     * @param where WHERE clause of search query
     * @param searchParams Map of field names and entered values
     * @param alias If <code>true</code>, search should be executed using
     * alias tables where appropriate; if <code>false</code> alias tables
     * should not be used
     */
    private void appendTextBoxes( StringBuffer from, 
				  StringBuffer where,
				  Map searchParams,
				  boolean alias ) 
    {
	// selected name type
	String type = null;
	
	// search term entered
	String term = null;
	
	// selected search method (exact, contains etc.)
	String method = null;
	

	// retrieve each row of data and call appendTermCriteria to
	// add specific criteria to query
	if ( searchParams.get( "term1" ) != null ) {
            type = (String) searchParams.get( "type1" );
            term = (String) searchParams.get( "term1" );
	    method = (String) searchParams.get( "method1" );
	    
	    appendTermCriteria( from, 
				where, 
				term, 
				type, 
				method,
				alias );
	    
        }


	if ( searchParams.get( "term2" ) != null ) {
            type = (String) searchParams.get( "type2" );
            term = (String) searchParams.get( "term2" );
	    method = (String) searchParams.get( "method2" );
	    
	    appendTermCriteria( from, 
				where, 
				term, 
				type, 
				method,
				alias );
	    
        }

	if ( searchParams.get( "term3" ) != null ) {
            type = (String) searchParams.get( "type3" );
            term = (String) searchParams.get( "term3" );
	    method = (String) searchParams.get( "method3" );

	    appendTermCriteria( from, 
				where, 
				term, 
				type, 
				method,
				alias );
	    
        }
    }
    
    /**
     * Appends type specific criteria received from one of three text
     * areas on search form to main search query.  This method uses
     * the member variables addedPubSourceAlias and addedURL to track
     * whether those tables have already been added to FROM clause of
     * query in a previous call of this method.
     *
     * @param from FROM clause of search query
     * @param where WHERE clause of search query
     * @param term Search term entered in text area on search form
     * @param type Selected name type of search term
     * @param method Selected search method (exact, contains etc.)
     * @param alias If <code>true</code>, search should be executed using
     * alias tables where appropriate; if <code>false</code> alias tables
     * should not be used
     */
    private void appendTermCriteria( StringBuffer from, 
				     StringBuffer where, 
				     String term, 
				     String type, 
				     String method,
				     boolean alias ) 
    {
	// if searching abstract (text), create case insensitive search by 
	// making char class for each character in search term
	if ( type.equals( "abstract" ) ) {
	    term = TextConverter.dbQuote( TextConverter.convertEnds( term,
								     method, 
								     true ) );

	    // otherwise do normal search method conversion - if searching 
	    // both abstract & title need both versions so do nothing here 
	    // & create below
	} else if ( !type.equals( "title_abstract" ) )  { 
	    term = TextConverter.dbQuote( 
		       TextConverter.convertEnds( term.toUpperCase(),
						  method, 
						  false ) );
	}
      
	if ( !TextConverter.isEmpty( term ) ) {
	    if ( type.equals( "abstract" ) ) {
		where.append( "AND p.abstract LIKE " + term + " ESCAPE '\\\' " );
		
	    } else if ( type.equalsIgnoreCase( "author" ) ) {
		where.append( "AND p.authors_uc LIKE " + term + " ESCAPE '\\\' " );
		
	    } else if ( type.equals( "journal" ) ) {
		if ( alias ) {
		    if ( !addedPubSourceAlias ) {
			from.append( ", PubSourceAlias a " );
			addedPubSourceAlias = true;
		    }
		    where.append( "AND a.pub_source_id = s.pub_source_id " );
		    where.append( "AND a.alias LIKE " + 
				  term + " ESCAPE '\\\' " );
		    where.append( "AND s.name NOT LIKE " + 
				  term + " ESCAPE '\\\' " );
		    
		} else {
		    where.append( "AND s.name LIKE " + term + " ESCAPE '\\\' " );
		}
		
	    } else if ( type.equals( "title" ) ) {
		where.append( "AND p.title_uc LIKE " + term + " ESCAPE '\\\' " );
		
		// if title_abstract, search title using uppercased search
		// term to take advantage of normallized field, then convert
		// term to char class version for searching abstract
	    } else if ( type.equals( "title_abstract" ) ) {
		String uCase = 
		    TextConverter.dbQuote( 
			TextConverter.convertEnds( term.toUpperCase(), 
						   method, 
						   false ) );

		String charClass = 
		    TextConverter.dbQuote( 
			TextConverter.convertEnds( term, 
						   method, 
						   true ) );
		
		where.append( "AND ( p.title_uc LIKE " + uCase + " ESCAPE '\\\' " );
		where.append( "OR p.abstract LIKE " + charClass  + "  ESCAPE '\\\') " );
		
	    } else if ( type.equals( "url" ) ) {
		if ( !addedURL ) {
		    from.append( ", Reference_URL r, URL u " );
		    addedURL = true;
		}
		where.append( "AND r.reference_id = p.reference_id " );
		where.append( "AND r.url_id = u.url_id " );
		where.append( "AND UPPER( u.url ) LIKE " + term + " ESCAPE '\\\' " );
	    }else if ( type.equals( "pubmed_id") ){
        where.append("AND p.pubmed_id LIKE " + term + " ESCAPE '\\\' ");
        }
	}
    }       
  
    /**
     * Test if alias table needs to be searched
     */
    private boolean alias( Map searchParams ) {
        boolean searchAlias = false;

        // iterate through search terms & check to see if alias search
        // needed -- use i to create search term key for retrieval
        String type = null;
        String term = null;
        for ( int i = 1; i <= 3; i++ ) {
            type = (String) searchParams.get( "type" + i );
            term = (String) searchParams.get( "term" + i );
            if ( term != null && type != null ) {
                if ( type.equals( "journal" ) ) {
                    searchAlias = true;
                    break;
                }
            }
        }
        return searchAlias;
    }


    /**
     * Return formatted version of form value for different term types
     */
    private String getFormatType( String type ) {
        String formatType = null;
   
        if ( type != null ) {
            if ( type.equals( "title_abstract" ) ) {
                formatType = "Title/Abstract";
        
            } else if ( type.equals( "url" ) ) {
                formatType = "URL";

            } else {
                formatType = type;
            }

        }
        return formatType;
    }
      
  

    /**
     * Returns description of search criteria used to create result set. This
     * is a convenience method to simplify life at the JSP search summary page.
     * Include information on total number of matches for complete description
     * of result set.
     *
     * @param searchParams Field names and values used to create search results
     * @param resultSize Total number of results
     * @return String describing search criteria used to create result set.
     */
    public String getFormatSearchCriteria( DBconnection conn, 
    		Map _searchParams, int resultSize ) throws SQLException {
        Map searchParams = TextConverter.scrub(_searchParams);
        StringBuffer buffer = null;
        String criteria = null;
        Boolean is_ann_type = null;
        boolean isKeywordCriteria = false;

        if ( searchParams != null ) {
            buffer = new StringBuffer();      
            is_ann_type = ( Boolean )searchParams.get( "is_ann_type" );

            // do annotation type search version of criteria
            if ( is_ann_type != null && is_ann_type.booleanValue() ) { 
                String keyword_name = 
                	(String) searchParams.get( "keyword_name" );

                String scope = (String) searchParams.get( "scope" );

                buffer.append( "Your query for publications where " );  
                if ( !TextConverter.isEmpty( keyword_name ) ) {
                    buffer.append( "associated to the " );
                    buffer.append( scope );
                    buffer.append( " of the keyword " +
				   "<font class=\"emphasis\">" + keyword_name + 
				   "</font> " );
                }

	        // otherwise show criteria for stand alone publication search
            } else { 
                Integer year_from = (Integer) searchParams.get( "from" );
                Integer year_end = (Integer) searchParams.get( "to" );

                boolean first = true; 
                buffer.append( "Your query for publications " );

                if ( searchParams.get( "publication_type" ) != null ) { 
                    buffer.append( "of type " + 
				   searchParams.get( "publication_type" ) + 
				   " " ); 
                }       
                buffer.append( "where " );

                if ( year_from != null && year_end != null ) {
                	buffer.append( "publication date is between " + 
                			year_from +	" and " + year_end + " " );
                }

                if ( searchParams.get( "term1" ) != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( getFormatType
                    	( (String) searchParams.get( "type1" ) ) + 
                    	" " );
		    
                    buffer.append( TextConverter.convertMethods( 
				       (String) searchParams.get( "method1" ) ) + 
				   		" " );

                    buffer.append( "the term <font class=\"emphasis\">" + 
				   (String) searchParams.get( "term1" ) + 
				   "</font> " );
                }

                if ( searchParams.get( "term2" ) != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( getFormatType( 
				       (String) searchParams.get( "type2" ) ) + 
				   " " );

                    buffer.append( TextConverter.convertMethods( 
				       (String) searchParams.get( "method2" ) ) + 
				   " " );

                    buffer.append( "the term <font class=\"emphasis\">" + 
				   (String) searchParams.get( "term2" ) + 
				   "</font> " );
                }
  
                if ( searchParams.get( "term3" ) != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( getFormatType( 
				       (String) searchParams.get( "type3" ) ) + 
				   " " );

                    buffer.append( TextConverter.convertMethods( 
				       (String) searchParams.get( "method3" ) ) + 
				   " " );

                    buffer.append( "the term <font class=\"emphasis\">" + 
				   (String) searchParams.get( "term3" ) + 
				   "</font> " );
                }
                String keyword_term = null;
                String keyword_method = null;
             
                
                if ( searchParams.get( "keyword_term" ) != null ) {
                    keyword_term = 
                    	(String) searchParams.get( "keyword_term" );
                    
                    keyword_method = 
                    	(String) searchParams.get( "keyword_method" );
                    isKeywordCriteria = true;
                } else {
                    keyword_term = "any";
                }  

                String keywordTypes = null;
                TfcKeywordType type = null;
               
		if ( searchParams.get( "keyword_type" ) != null ) {
                    String[] keywordTypeIDs = (String[]) 
			searchParams.get( "keyword_type" ); 
                    for ( int i = 0; i < keywordTypeIDs.length; i++ ) {
                	type = new TfcKeywordType( conn, keywordTypeIDs[i] );
                	keywordTypeIDs[i] = type.get_type();
		    }
               
                    keywordTypes = getMultipleFeatures( keywordTypeIDs );
                    if ( !keywordTypes.equalsIgnoreCase( " any" ) ) {
                        isKeywordCriteria = true;
                    }
                }

                /*if ( !keywordTypes.equalsIgnoreCase( " any" ) ) {
                	isKeywordCriteria = true;
                }*/
                if ( isKeywordCriteria ) {
                    if ( !keyword_term.equalsIgnoreCase( "any") ) {
                        buffer.append( " and keyword " );
                        buffer.append( 
			    TextConverter.convertMethods( keyword_method ) );

                        buffer.append( " the term <font class=\"emphasis\">" + 
				       keyword_term + "</font> " );
                    } else {
                        buffer.append( " and keyword term is " );
                        buffer.append( " <font class=\"emphasis\">" + 
				       keyword_term + "</font> " );
                    }
                    if ( !keywordTypes.equalsIgnoreCase( " any" ) ) {
			buffer.append( " and keyword types of " + 
				       keywordTypes );
		    }
                }

		// publication search can be called from gene or locus detail
		// page to show full list of associated publications. Name
		// should be included for display of criteria
		String geneName = 
		    (String) searchParams.get( "gene_name" );
		
		if ( geneName != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( " gene name is " +
				   geneName );
		}

		String locusName = 
		    (String) searchParams.get( "locus_name" );
		
		if ( locusName != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( " locus name is " +
				   locusName );
		}

            }



            if ( isKeywordCriteria ) {
                buffer.append( " resulted in <font class=\"emphasis\">" + 
			       resultSize + 
                               "</font> matches associated to the keyword " +
			       "or keyword children terms." );
            } else {
                buffer.append( " resulted in <font class=\"emphasis\">" + 
			       resultSize + "</font> matches." );
            }      
            criteria = buffer.toString();
        }
        return criteria;
    }

    private String getMultipleFeatures ( String[] features ) {
        StringBuffer f_buffer = new StringBuffer(" ");
        for ( int i = 0; i < features.length; i ++) {
            if ( i > 0 ) f_buffer.append(" , ");
            f_buffer.append(features[i]);
        }      
        return ( new String(f_buffer ) );
    }



    /** 
     * Utility method to decide whether to append comma for separating
     * search criteria based on whether current value is first in list or
     * not; returns new value of flag which tracks this.
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
