//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2005/04/11 20:31:48 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.DynamicData;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * ProtocolSearcher retrieves protocols according to submitted
 * search parameters. Search results are stored in a temp table created
 * for a particular user, and are then returned one page at a time.
 * ProtocolSearcher only inserts and selects from temp table; creating,
 * deleting and dropping table is done by <code>SearchSession</code>.
 * ProtocolSearcher retrieves the relevant table name to use by querying
 * <code>MasterTableInfo</code>.
 *
 * <p>
 * ProtocolSearcher receives search parameters as retrieved from web
 * submission by <code>ProtocolSearchHandler</code>. Results are returned
 * as <code>SearchResultsCollection</code> object containing an array of
 * <code>ProtocolSummary</code> objects.
 * <p>
 */

public class ProtocolSearcher {

    private String searchType = "protocol";

    private static final String keywordSQL =
	" reference_id IN ( SELECT r.reference_id FROM " +
	" Reference_Keyword r, Keyword y, AnnotationType a " +
	" WHERE  r.keyword_id = y.keyword_id " +
	" AND a.annotation_type_id = r.annotation_type_id ";

    private static final String kwSQL = keywordSQL + " AND y.keyword ";
    
    private static final String kwsSQL = keywordSQL + " AND y.keyword_id ";

  
    /** 
     * Retrieve search type literal
     *
     * @return searchType
     */ 
    private String getSearchType() {
	return searchType;
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
        String insert_query = "";
        if (type.equalsIgnoreCase( "form" )){
            insert_query = createQuery ( searchParams, conn, "" );
        } else if (type.equalsIgnoreCase( "general" )) {
            String searchTerm = (String) searchParams.get( "searchTerm" );
            insert_query = "PROTOCOL_QUICKSEARCH_" + searchTerm;
            //String insert_query = createGeneralQuery ( conn, searchParams, ""); 
        } else {
            insert_query = createQuery ( searchParams, conn, "" );
        }
        return insert_query;
    }


    /**
     * Executes search using submitted search parameters and returns slice of
     * resultset according to parameters defined in scrollParams. When initially
     * searching, results are stored in a person specific temp table.
     * Subsequent calls will then retrieve from temp table to show current page
     * of result set
     *
     * @param conn An active connection to the database
     * @param searchParams Search params to use for retrieving result set
     * @param scrollParams ScrollParams object containing data 
     * defining floor and ceiling of result set
     * @param firstSearch If <code>true</code> this is the first time this 
     * search  has been executed, so full search should be executed 
     * with results being stored  in a temp table for later retrieval. 
     * If <code>false</code>, temp table has already been populated, so can
     * simply retrieve requested slice of result set.
     * @return Search results as an <code>SearchResultsCollection</code> 
     * containing  an array of ProtocolSummary objects and data on 
     * the complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection search(DBconnection conn, 
					  Map searchParams,
					  ScrollParams scrollParams,
					  boolean firstSearch) 
   	throws SQLException {

	String order = (String) searchParams.get("order");
    String queryID = (String) searchParams.get("query_id");

	// populate temp table with results if first time searching
	if (firstSearch) {
	    String query = createQuery(searchParams, conn, queryID);
	    conn.setQuery( getInsert() + query);
	    conn.executeUpdate();
	    conn.releaseResources();
	}
   
	SearchResultsCollection searchResults = 
	    getResultSlice(conn, scrollParams, order, queryID);
   
	// get text version of how search results were created
	if (searchResults != null) {
	    searchResults.setSearchCriteria(
	        getFormatSearchCriteria(searchParams,
				        searchResults.getResultSize()));
	}
   
	return searchResults;
    }
    
    /**
     * Retrieves requested slice of total result set as defined by scrollParams
     *
     * @param conn -- DB connection
     * @param scrollParams -- parameter for scroll display
     * @param sessionID -- search session ID
     * @param orderBy -- sort order
     */
    private SearchResultsCollection getResultSlice(DBconnection conn,
                                                   ScrollParams scrollParams,
                                                   String orderBy,
                                                   String queryID) 
  	throws SQLException {
  
	int floor = scrollParams.getFloor();
	int ceiling = scrollParams.getCeiling();
	int rowCounter = 0;

	SearchResultsCollection searchCollection = 
	                            new SearchResultsCollection();
  
	StringBuffer query = new StringBuffer();
	query.append("SELECT " + getTableColumns( "result" ) + " " +
		     "FROM RESULT_PROTOCOL WHERE QUERY_ID = '" + queryID + "' ");
  
	if (orderBy != null) {
	    query.append("ORDER BY " + orderBy);
	}
  
	conn.setQuery(query.toString());

	ProtocolSummary protocol_list = null;
	ArrayList found = null;

	ResultSet results = conn.getResultSet();
	while (results.next()) {
	    if (rowCounter >= floor && rowCounter <= ceiling) {
		protocol_list = getProtocolRow(results);
		if (found == null) {
		    found = new ArrayList();
		}
		found.add(protocol_list);
	    }
	    rowCounter++;
	}
	conn.releaseResources();
  
	if (found != null && !found.isEmpty()) {
	    searchCollection.setResults(makeArray(conn, found));
	    searchCollection.setResultSize(rowCounter);
	    searchCollection.setFloor(floor + 1);
	    searchCollection.setCeiling(floor + found.size());
	    
	    // get links for scrolling through multiple results pages,
	    String links =
		ScrollCalculator.getTableScrollLinks(scrollParams.getSize(),
						     scrollParams.getPage(),
						     searchCollection,
                             queryID);
	    searchCollection.setScrollLinks(links);
	}
  
	// set page for displaying results
	searchCollection.setResultsPage(getSummaryPage());
  
	return searchCollection;
    }
  
    /**
     * Retrieve protocols using selected reference ids from search results.
     * Used for creating downloads for items in search results.
     *
     * @param conn  An active connection to the database
     * @param referenceIDs Selected reference ids to retrieve data for
     * @param sessionID User's session id. Used to access temp table
     * for user's individual results.
     * @return ProtocolSummary  results of the search
     */
    public ProtocolSummary[] getSelected( DBconnection conn, 
					                      List referenceIDs,
                                          String queryID) 
  	throws SQLException {

  
	String query =
	    "SELECT " + getTableColumns( "result" ) + " " +
	    "FROM RESULT_PROTOCOL WHERE QUERY_ID = '" + queryID + "' " + 
	    "AND reference_id = ?";
  
	conn.setQuery(query);

	ProtocolSummary protocol_list = null;
	ArrayList found = null;
	ResultSet results = null;

	Iterator iter = referenceIDs.iterator();
	while (iter.hasNext()) {
	    conn.setQueryVariable( (Long) iter.next());
	    results = conn.getResultSet();
	    while (results.next()) {
		protocol_list = getProtocolRow(results);
  
		if (found == null) {
		    found = new ArrayList();
		}
		found.add(protocol_list);
	    }
	}
	conn.releaseResources();

	ProtocolSummary[] pubs = null;
	if (found != null && !found.isEmpty()) {
	    pubs = makeArray(conn, found);
	}
	return pubs;
    }
 
    /**
     * create ProtocolSummary object out of single row of result set
     */
    private ProtocolSummary getProtocolRow(ResultSet results) 
 	throws SQLException {

     	ProtocolSummary protocol = new ProtocolSummary();

	Long id = new Long(results.getLong("reference_id"));
        protocol.set_reference_id(id);
        protocol.set_title(results.getString("title"));
        protocol.set_authors(results.getString("authors"));
 
        return protocol;
    }
 
    /**
     * create array of ProtocolSummary objects from list of found objects;
     * populate extra info needed for display of current slice 
     * (description etc.)
     *
     * @param conn -- DB connection
     * @param found -- found objects
     * @return ProtocolSummary -- array of results to be displayed
     */
    private ProtocolSummary[] makeArray(DBconnection conn, List found) 
 	throws SQLException {

	ProtocolSummary[] searchResults = null;
	searchResults = new ProtocolSummary[found.size()];
	searchResults = (ProtocolSummary[]) found.toArray(searchResults);
 
	for (int i = 0; i < searchResults.length; i++) {
	    searchResults[i].populate(conn);
	    searchResults[i].setHighlightedKeywordList(conn, null, true);
            searchResults[i].set_pdf_links (conn);
	}
 
	return searchResults;
    }
 
    /**
     * Retrieves JSP URL to use for displaying protocol_list search results
     *
     * @return JSP URL to use for displaying protocol_list search results
     */
    public String getSummaryPage() {
     	return "/jsp/search/protocol_summary.jsp";
    }
 
    /**
     * Get select used in all full searches
     *
     * @return String -- sql statement of select part
     */
    private String getBaseSelect(String queryID) {
     	String select = 
	    "SELECT p.title, " +
	    "p.authors, " +
	    "p.reference_id ";
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
     * get basic from clause for all full searches
     * @return string -- FROM clause of the sql statement
     */	
    private String getBaseFrom() {
     	return "FROM Protocol p ";
    }
 
    /**
     * get basic where clause for all full searches
     * @return string -- WHERE clause of the sql statement
     */
    private String getBaseWhere() {
     	return " WHERE p.status = 'active' ";
    }

    /** 
     * Retrieve the columns used by Protocol Search temp table
     *
     * @return column name separated by comma as <code>String</code>
     */
    private String getTableColumns( String type ) {
	String columns = 
	    "title, " +
	    "authors, " +
	    "reference_id, " + 
        "query_id ";
    // need to check what kind of select it is. if it is result type (called in
    // getResultSlice, then we want to not return date_last_queried
    if (type.equalsIgnoreCase("all")){
        columns = columns + ", date_last_queried ";
    }
	return columns;
    }
 
    /**
     * get insert statement to insert rows into temp table
     * @return string -- INSERT part of the sql statement
     */
    private String getInsert() {
     	String insert =
	    "INSERT /*+ APPEND */ INTO RESULT_PROTOCOL " + 
        "( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }
 
    /**
     * private method to generate the sql statement for query
     * @param searchParams -- search parameters stored as Map
     * @param sessionID -- id used by SearchSession
     * @param conn -- DB connection
     */
    private String createQuery(Map searchParams, DBconnection conn, String queryID) 
 	throws SQLException {

	// retrieve search params
	String term_1 = (String) searchParams.get( "term_1" );
	String method_1 = (String) searchParams.get( "method_1" );
	String type_1 = (String) searchParams.get( "type_1" );

	String term_2 = (String) searchParams.get( "term_2" );
	String method_2 = (String) searchParams.get( "method_2" );
	String type_2 = (String) searchParams.get( "type_2" );
	
	String[] keywords = (String[]) searchParams.get( "keywords" );


	// initialize select, from and where clauses
     	StringBuffer from = new StringBuffer();
      	from.append(getBaseSelect( queryID ) +
		    getBaseFrom());

     	StringBuffer where = new StringBuffer();
	where.append(getBaseWhere());
 
	if ( term_1 != null ) {
	    appendNameCriteria( where, term_1, method_1, type_1 );
	}

	if ( term_2 != null ) {
	    appendNameCriteria( where, term_2, method_2, type_2 );
	}

	if ( keywords != null && keywords.length > 0 ) {
	    where.append( "AND " + kwsSQL + "IN (" );
	    for ( int i = 0; i < keywords.length; i++ ) {
		if ( i > 0 ) {
		    where.append( ", " );
		}
		where.append( keywords[ i ] );
	    }
	    where.append( ") )" );
	}
 
     	String query = from.toString() + where.toString();
 
	Debugger.println( query );

     	return query;
    }

    /**
     * Method to append criteria entered from one of name type search fields
     * on web form.
     *
     * @param where WHERE clause to append criteria to
     * @param term Search term entered in text field
     * @param method Search method selected (starts with, contains etc.)
     * @param type Name type selected
     */
    private void appendNameCriteria( StringBuffer where, 
				     String term,
				     String method,
				     String type ) 
    {

	// quote string, set to uppercase for case insensitive searching and 
	// add wildcard chars according to selected search method
	term = 
	    TextConverter.dbQuote( 
		TextConverter.convertEnds( term.toUpperCase(),
					   method ) );
	
	if ( type.equals( "title" ) ) {
	    where.append( "AND upper(p.title) LIKE " + term + " ESCAPE '\\\' " );
	    
	} else if ( type.equals( "authors" ) ) {
	    where.append( "AND upper(p.authors) LIKE " + term + " ESCAPE '\\\' " );
	    
	} else if ( type.equals( "description" ) ) {
	    where.append( "AND upper(p.description) LIKE " + term + " ESCAPE '\\\' " );
	}
    }
		    
 
    /**
     * private method to get the format of data type
     * @return formatted version of form value for different term types
     */
    private String getFormatType(String type) {
     	String formatType = "";
 
     	if (type != null) {
	    formatType = type;
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
     *
     * @return String describing search criteria used to create result set.
     * @throws SQLException thrown if a database error occurs
     */
    public String getFormatSearchCriteria(Map _searchParams, int resultSize) 
 	throws SQLException {
 
	Map searchParams = TextConverter.scrub(_searchParams);
	// retrieve search params
	String term_1 = (String) searchParams.get( "term_1" );
	String method_1 = (String) searchParams.get( "method_1" );
	String type_1 = (String) searchParams.get( "type_1" );

	String term_2 = (String) searchParams.get( "term_2" );
	String method_2 = (String) searchParams.get( "method_2" );
	String type_2 = (String) searchParams.get( "type_2" );
	
	String[] keywords = (String[]) searchParams.get( "keywords" );

     	StringBuffer buffer = new StringBuffer("Your query for protocols " +
					       "where " );
	
	boolean first = true;

	if ( term_1 != null ) {
	    first = appendComma( buffer, first );
	    buffer.append( type_1 + " " +
			   TextConverter.convertMethods( method_1 ) + " " );
	    buffer.append( "the term <font class=\"emphasis\">" +
			   term_1 +  "</font> ");
     	}
 

	if ( term_2 != null ) {
	    first = appendComma( buffer, first );
	    buffer.append( type_2 + " " +
			   TextConverter.convertMethods( method_2 ) + " " );
	    buffer.append( "the term <font class=\"emphasis\">" +
			   term_2 +  "</font> ");
     	}


	if ( keywords != null && keywords.length > 0  ) {
	    first = appendComma( buffer, first );
	    
	    buffer.append( "keyword is ");
	    
	    // use map to translate keyword ids to display values
	    Map<String, String> keywordMap = DynamicData.getProtocolKeywords();
	    String keyword = null;
	    for ( int i = 0; i < keywords.length; i++ ) {
		if ( i > 0 ) {
		    buffer.append( " or " );
		}
		
		keyword = (String) keywordMap.get( keywords[ i ] );
		buffer.append( "<font class='emphasis'>" +
			       keyword + "</font>" );
	    }
      	} 
 

	buffer.append( " resulted in <font class=\"emphasis\">" + resultSize + "</font> " );
	if ( resultSize == 1 ) {
	    buffer.append( "match." );
	} else {
	    buffer.append( "matches." );
	}

     	return buffer.toString();
    }

    /**
     * Helper method to decide whether to append comma for separating search 
     * criteria based on whether current value is first in list or not; returns
     * new value of flag which tracks this
     *
     * @param buffer Criteria buffer
     * @param first If <code>true</code> this is the first time criteria is 
     * being appended, so no comma is added; if <code>false</code> this is
     * at least the second time criteria is being added, so add a comma
     * @return Will always return a false value since after this method is called,
     * first can no longer be true
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
