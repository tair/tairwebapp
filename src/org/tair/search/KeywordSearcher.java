//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.25 $
// $Date: 2005/07/12 02:11:06 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
   * KeywordSearcher retrieves keywords according to submitted search 
   * parrameters. Search results are
   * stored in a temp table <code>KeywordTableInfo</code> which is created 
   * for a particular user based on session id 
   * and search type (keyword). For temp table definition see 
   * <code>KeywordTableInfo</code>. KeywordSearcher 
   *  only inserts into temp table; creating, deleting and dropping table 
   * is done by <code>SearchSession</code>. Selecting 
   * from temp table is done by <code>ResultsFetcher</code> via the summary 
   * jsp for search results. KeywordSearcher
   * retrieves the relevant table name to use by querying 
   * <code>MasterTableInfo</code>.
 */

public class KeywordSearcher implements GeneralSearcher {
  
    private String tempTblName;
    private final String searchType = "keyword";
    private final String resultsPage = "/jsp/search/keyword_summary.jsp";    
    private HashMap params;
    private DBWriteManager connectionPool;
    private boolean isGeneral;
    private boolean countsOnly;
    private String searchCriteria;
    private String searchTerm;
    private String extdb_id;
    private String searchMethod;
    private String queryID;
    private String mode;
    private int resultSize;  

    // constructor for keyword search summary pages 
    public KeywordSearcher() {}

    /**
     * Creates SQL query using submitted search parameters and stores keywords 
     * that match criteria
     * in temp table.  Each row in the temp table represents a unique keyword 
     * used for display on the summary page. 
     * Each column is populated with a keyword attribute cooresponding to the 
     * the row's keyword id (column name = ID).  Where compound information is 
     * associated with one keyword, a unique id
     * is stored to be used for lookup into the appropriate table at the time 
     * the complete row's data is requested for display
     * via <code>ResultsFetcher</code>.  For example, where many annotation types
     * and counts are associated to one keyword id, the 
     * the keyword_id will be used as the lookup key
     * when the data is requested for display, one page at a time. 
     *
     * @param searchParams Search criteria submitted through the web search form,
     * stored as field name
     * as a <code>String</code> key referencing the search value.
     * @param queryID User's query id. Used to access temp table for 
     * user's individual results.
     * @exception SQLException thrown if a database error occurs.
     */  
    
    public void search( HashMap searchParams) 
        throws SQLException {
        // invoked from GeneralSearchHandler
        setParams( searchParams );
        String queryID = (String) searchParams.get( "query_id" );
        setQueryID( queryID );
        
        //setTempTblName();
        processSearch();
    }
    
    
    // implements required method for GeneralSearcher interface - 
    // quick search uses this
    public SearchResultsCollection doGeneralSearch ( Map generalParams, 
                                                     boolean getCounts, 
                                                     boolean firstSearch) 
    throws SQLException {
        SearchResultsCollection searchResults = new SearchResultsCollection();
        searchResults.setResultsPage( getResultsPage() );
        isGeneral = true;
        setParams( ( HashMap )generalParams );
        String queryID = (String) getParams().get("query_id");
        setQueryID( queryID );
        if ( getCounts ) {
            countsOnly = true;
        } else {
            countsOnly = false;
        }
        if ( firstSearch ){
            processSearch();
        }
        searchResults.setResultSize( getResultSize() );
        searchResults.setSearchCriteria( getSearchCriteria() );
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
        setParams( (HashMap) searchParams );
        if (type.equalsIgnoreCase( "form" )){
            insert_query = createSearchSQL();
        }else if (type.equalsIgnoreCase( "general" )){
            String searchTerm = (String) getParams().get("searchTerm");
            insert_query = "KEYWORD_QUICKSEARCH_" + searchTerm.toUpperCase();
            //insert_query = createGeneralSearchSQL(); 
        }else{
            insert_query = createSearchSQL();
        }
        return insert_query;                                                                
    }
    
    // returns the search type
    private final String getSearchType() { return searchType; }  
    
    // returns the results page name, needed for the general search
    private final String getResultsPage() { return resultsPage; }  
    
    private final String getTableColumns() {
        String columns = 
            "ID, " + 
            "KEYWORD, " + 
            "KEYWORD_TYPE, " + 
            "HAS_DIRECT_LINKS, " + 
            "HAS_CHILD_LINKS, " + 
            "QUERY_ID, " + 
            "DATE_LAST_QUERIED ";
        return columns;
    }

        
    // returns the select clause used for general and keyword search
    private final String getSelectClause() { 
        String queryID = getQueryID();
        String select = 
            " SELECT DISTINCT k.keyword_id AS id, k.keyword AS keyword, " + 
            " kt.display AS keyword_type, " + 
            " k.has_direct_links AS has_direct_links, " + 
            " k.has_child_links AS has_child_links "; 
        if ( queryID != null && queryID != ""){
            select = select +
            ", '" + queryID + "', CURRENT_DATE ";
        }else{
            select = select +
            ", '', '' ";
        }
        return select;
    }  
    
    // returns the from and where clause used for the general search, the 
    // quick search counts and the quick search results
    private String getFromWhereClause() { 
        StringBuffer from_where_clause = new StringBuffer
            ( " FROM Keyword k, KeywordSynonym_wrk ks, KeywordType kt " + 
              " WHERE k.keyword_type_id = kt.keyword_type_id AND " + 
              " k.keyword_id = ks.keyword_id AND " + 
              " kt.keyword_type_id <> 'root' " ) ;

        //search by keyword term
        if ( getSearchTerm() != null && getSearchMethod() != null ) {
	    from_where_clause.append( " AND ( ks.keyword like " );  
	    from_where_clause.append
		( TextConverter.dbQuote
		  ( TextConverter.convertEnds
		    ( getSearchTerm().toUpperCase(), getSearchMethod() ) ) );

	    from_where_clause.append( " OR k.extdb_id like " );
	    from_where_clause.append
		( TextConverter.dbQuote
		  ( TextConverter.convertEnds
		    ( getSearchTerm().toUpperCase(), getSearchMethod() ) ) );
	    from_where_clause.append( ") " );
        }
        
        //search by extdb_id
        if ( getExtdb_id() != null) {
            from_where_clause.append(" AND extdb_id = ").append(TextConverter.dbQuote(getExtdb_id())).append(" ");
        }
        
        if ( ( String[] )getParams().get( "category" ) != null ) {
            List<String> categories = Arrays.asList(( String[] ) getParams().get( "category" ));
            StringBuffer inList = new StringBuffer(" IN (  ");
            String sep = ""; // no separator first time through
            for (String category : categories) {
                inList.append(sep);
                inList.append( TextConverter.dbQuote( category ) );
                sep = " , "; // separate with commas after first category
            }
            inList.append(" ) ");
            from_where_clause.append( " AND kt.keyword_type_id " ); 
            from_where_clause.append( inList.toString() ); 
        }
        if ( getSearchMode() == null || 
             !getSearchMode().equalsIgnoreCase( "curator" ) ){
            from_where_clause.append
                ( " AND kt.keyword_type_id <> 'user' " );  
        }
        System.out.println("clause : " + from_where_clause.toString() );
        return from_where_clause.toString();
    }  
    
    // returns the insert clause used for general and keyword search
    private final String getInsertClause() { 
        String insert =    
            "INSERT /*+ APPEND */ INTO RESULT_KEYWORD ";
        return insert;
    }  
   
    private final String getDelete() {
        String del = 
            "DELETE FROM RESULT_KEYWORD WHERE QUERY_ID = '" + getQueryID() + "'";
        return del;  
    }
    // returns whether the searcher has been invoked from the 
    // general search handler or the type specific search handler
    private boolean isGeneral() { 
        return isGeneral; 
    }  
    
    // returns whether only a count on the results is needed or the 
    // results should be written to temp table
    private boolean countsOnly() { 
        return countsOnly; 
    }  
    
    // sets the result size
    private void setResultSize( int hits ) { 
        resultSize = hits; 
    }  
    
    // returns the result size
    private int getResultSize() { 
        return resultSize; 
    }   
    
    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBWriteManager.getInstance();
        return connectionPool.getSearchConnection();    
    }
    // releases a connection back to the database pool
    private void returnConnection( DBconnection conn ) 
        throws SQLException { 
        connectionPool.return_connection( conn ); 
    }
   
    /*
    // sets the temp table name
    private void setTempTblName() { 
        if ( getSessionID() != null ) {   
            tempTblName = MasterTableInfo.getFullTableName
                ( getSearchType(), getSessionID() );
        }
    } 
    // returns the temp table name
    private String getTempTblName() { 
        return tempTblName; 
    }  
    */

    // sets the parameters that user specified on search form - 
    // general_form.jsp, or on the general search by name
    private void setParams( HashMap searchParams  ) { 
        params = searchParams; 
    }
    
    // returns the map object of search params the user entered
    private HashMap getParams() { 
        return params; 
    } 
    
    // sets the query id
    private void setQueryID( String queryID ) { 
        this.queryID = queryID; 
    }

    // returns the session id
    private String getQueryID() { 
        return queryID; 
    } 

    // sets the search term
    private void setSearchTerm( String searchTerm ) { 
        this.searchTerm = searchTerm; 
    }

    // returns the search term
    private String getSearchTerm() { 
        return searchTerm; 
    }  

    //sets extdb_id
    private void setExtdb_id(String extdb_id) {
        this.extdb_id = extdb_id;
    }

    //gets extdb_id
    private String getExtdb_id() {
        return extdb_id;
    }
    
    // sets the search method
    private void setSearchMethod( String searchMethod ) { 
        this.searchMethod = searchMethod; 
    } 
    
    // returns the search method
    private String getSearchMethod() { 
        return searchMethod; 
    } 

    // sets the search mode -- right now its eithe not provided or
    // is "curator"
    private void setSearchMode( String mode ) { 
        this.mode = mode; 
    }

    // returns the search mode
    private String getSearchMode() { 
        return mode; 
    }   

    // sets the search criteria - textual representation of the general 
    // search params
    private void setSearchCriteria() { 
        if ( getSearchTerm() != null && getSearchMethod() != null ) {
            StringBuffer buffer = new StringBuffer();      
            buffer.append( "Your query for keywords where " );	
            if ( !TextConverter.isEmpty( getSearchTerm() ) ) {
                buffer.append
                    ( "keyword or external accession " + 
                      TextConverter.convertMethods( getSearchMethod() ) +
                      " the term <font class=\"emphasis\">"+ getSearchTerm() + 
                      "</font> " );
            }
            if (!TextConverter.isEmpty( getExtdb_id() ) ){
                buffer.append
                    ( " and external accesssion " + 
                    TextConverter.convertMethods( getSearchMethod() ) + 
                    " the term <font class=\"emphasis\">" + getExtdb_id() + 
                    "</font> ");
            }
            buffer.append( " resulted in" );
            searchCriteria = buffer.toString();
        }
    } 

    // returns the textual description of the search params
    private String getSearchCriteria() { return searchCriteria; }  

    // turns the search parameter entries into a sql search string that 
    // will be used for the search
    private String createSearchSQL() throws SQLException { 
        // check params from general_form 
        applyGeneralKeywordSearch();
        return ( getSelectClause() + getFromWhereClause() );
    }
    // convert user designated options (parameters from general_form jsp) into additions to 
    // the 'from where' clause in the search sql
    // params from general_form.jsp are: "name", "method" 
    private void applyGeneralKeywordSearch() {
        if ( ( String )getParams().get( "name" ) != null ) 
            setSearchTerm( ( String )getParams().get( "name" ) );
        if ( ( String )getParams().get( "method" ) != null ) 
            setSearchMethod( ( String )getParams().get( "method" ) );
        if ( (String)getParams().get("extdb_id") != null ) {
            setExtdb_id( (String)getParams().get("extdb_id") );
        }
    }

    // invokes a method to write the results of the search sql to the temp table  
    private void processSearch() throws SQLException {
        if ( ( String )getParams().get( "mode" ) != null ) {
            setSearchMode( ( String )getParams().get( "mode" ) );
        }
        if ( isGeneral() && countsOnly() ) {
            executeQuery( createCountSQL() );
        } else if ( isGeneral() ) {
            writeToTempTbl( createGeneralSearchSQL() );
        } else {
            writeToTempTbl( createSearchSQL());  
        }   
    }

    // convert user specified search criteria into additions to the 'where' 
    // clause for the general search sql -- both counts and temp 
    // table sql, used in quick search option
    private void applyGeneralSearchParams() {
      if ( ( String )getParams().get( "searchTerm" ) != null ) 
          setSearchTerm( ( String )getParams().get( "searchTerm" ) );
      if ( ( String )getParams().get( "method" ) != null ) 
          setSearchMethod( ( String )getParams().get( "method" ) );
      if ( (String)getParams().get("extdb_id") != null ) 
        setExtdb_id( (String)getParams().get("extdb_id") );
    }
    
    // turns the search parameter entries into a sql search string that 
    // will be used for the search
    // this is sql generated for a search initiated through 
    // GeneralSearchHandler and uses a temp table for results
    // also uses a union to obtain search results against name and ic_accession
    private String createGeneralSearchSQL() throws SQLException {
        applyGeneralSearchParams();
        setSearchCriteria();
        return ( getSelectClause() + getFromWhereClause() );
    }
    
    // turns the search parameter entries into a sql count string that will 
    // be used for the search
    // this is sql generated for a search initiated through GeneralSearchHandler
  private String createCountSQL() throws SQLException { 
      String count_select_clause = 
          " SELECT DISTINCT k.keyword_id AS keyword_id ";
      applyGeneralSearchParams();
      setSearchCriteria();
      return ( count_select_clause + getFromWhereClause() );
  }
    
    // writes search results to temp table 
    private void writeToTempTbl( String stmt ) throws SQLException {
        Debugger.println( Debugger.logMsg
                          ( this, "writeToTempTbl, SQL = " + stmt ) );
        DBconnection conn = null;
        try {
            conn = getConnection();  
            
            //do preliminary table drops first. should never get here but just in case
            String del_query = getDelete();
            conn.setQuery( del_query );
            conn.executeUpdate();
            conn.releaseResources();

            //populate temp table w/ results
            String insert_query = getInsertClause() + "(" + getTableColumns() + ") " + stmt;
            System.out.println("insert query : " + insert_query );
            conn.setQuery( insert_query );
            conn.executeUpdate();
        } finally {
            if ( conn != null ) returnConnection( conn ); 
        } 
    }   

    // executes count sql, tallies up the count 
    private void executeQuery( String stmt ) throws SQLException {
        Debugger.println( Debugger.logMsg
                          ( this, "executeQuery, SQL = " + stmt ) );
        int resultsCount = 0;
        DBconnection conn = null;
        try {
            conn = getConnection(); 
            conn.setQuery( stmt ); 
            ResultSet results = conn.getResultSet();
            while ( results.next() ) {
                resultsCount ++;
            }
        } finally {
            if ( conn != null ) returnConnection( conn ); 
        } 
        setResultSize( resultsCount );
    }       

    /*     main method for stand alone test
     */
    public static void main(String[] args){
    }	
    
}
    
  
