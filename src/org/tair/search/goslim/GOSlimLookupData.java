/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.goslim;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;
import org.tair.querytools.*;

/**
   **/

public class GOSlimLookupData implements LookupDataModel {

  private String[] lookupColumnNames;
  private String searchType = "goslim";  
  private String[][] resultsTable;
  private int resultsLength;
  private String[] lookupData;  
  private String[] keywordType;// only one entry per row 
  private DBReadManager connectionPool;

  public GOSlimLookupData() {
    setLookupColumnNames( SearchType.getLookupColumns( this.getType() ) );
  } 
    // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBReadManager.getInstance();
    return connectionPool.get_connection();    
  }
    // releases a connection back to the database pool
  private void returnConnection( DBconnection conn ) throws SQLException { connectionPool.return_connection( conn ); }

    // sets the list of the lookup columns that contain ids for lookup 
  private void setLookupColumnNames( String[] lookupColumns ) { lookupColumnNames = lookupColumns; }

    // returns a list of the lookup columns that contain ids for lookup 
  private String[] getLookupColumnNames() { return lookupColumnNames; }

    // returns the correspnding index for a temp table column name -- to be used to access the lookup ID 
    // from the 'in memory' results table
  private int getIndex(String columnName) {
    int columnIndex = 0;
    for ( int i = 0; i < SearchType.getTempTableColumns( getType() ).length; i ++ ) {
       if ( SearchType.getTempTableColumns( getType() )[i].equals( columnName ) ) columnIndex = i;
    }
    return columnIndex;     
  }

    // returns length of results table
  private int getResultsLength() { return resultsTable.length; }

    // returns this search type 
  private String getType() { return searchType; }

  /**
   * provides to the object a subset (a page worth for display on the summary page) of the temp table results as a two 
   * dimensional string array.  The columns are the temp table columns and the rows are the result set rows - 
   * the rows for a particular pages display. Lookup keys can be accessed via the arrays contents for columns that 
   * have been identified as lookup columns.
   * @param summaryTable The table of one page of data from a summary page
   **/    
  public void setSummaryData( String[][] summaryTable ) throws SQLException {
      resultsTable = summaryTable;
      resultsLength = summaryTable.length;
      // set the data items that are for display to the summary page 
      DBconnection conn = null;
      try {
          conn = getConnection();
          setKeywordType( conn );  
      } finally {
          if ( conn != null ) returnConnection( conn ); 
      }
  }

  /**
   * provides to the object a subset (user-selected rows of data from the summary page) of the temp table results  
   * as a two dimensional string array.  The columns are the temp table columns and the rows are the user-selected 
   * rows from the summary page. Lookup keys can be accessed via the arrays contents for columns that 
   * have been identified as lookup columns.
   * @param downloadTable The table of user-selected rows from summary pages
   **/
    // currently no download page has been requested for this search -- default is the same as summary page   
    public void setDownloadData( String[][] downloadTable ) throws SQLException { 
        resultsTable = downloadTable;
        resultsLength = downloadTable.length;
        // set the data items that are needed for download page
        DBconnection conn = null;
        try {
            conn = getConnection(); 
            setKeywordType( conn );   
        } finally {
            if ( conn != null ) returnConnection( conn );  
        }     
    }

    // given the keyword type id get the keyword type
    private void setKeywordType( DBconnection conn ) throws SQLException {
        keywordType = new String[ getResultsLength() ];
        String query =  "SELECT display AS keyword_type " + 
                        "FROM KeywordType " + 
                        "WHERE keyword_type_id = ? ";
        conn.setQuery( query ); 
        for ( int i = 0; i < resultsTable.length; i ++ ) { 
            if ( ( resultsTable[ i ][ getIndex( "keyword_type_id" ) ] )!= null ) { 
                // check to make sure the key isn't spaces 
                conn.setQueryVariable( resultsTable[i][getIndex( "keyword_type_id" )] ); 
                ResultSet results = conn.getResultSet();
                if ( results.next() ) { 
                    keywordType[i] = results.getString( "keyword_type" );
                }
            }
        }
        conn.releaseResources();
    }

  private String getKeywordType( int row )  { return keywordType[row]; } 

  /**
   * @param columnName The column name of the temp table to be checked 
   * @return boolean representation of check for lookup column
   */
  public boolean isLookupColumn( String columnName ) {
    boolean isLookup = false;
      for ( int i = 0; i < getLookupColumnNames().length; i ++ ) {
        if ( columnName.equals( getLookupColumnNames()[i] ) ) isLookup = true;
      }
    return isLookup;
  }

  /**
   * @param row The integer representing the row of the table of data 
   * @param columnName The String representing the column name of the table of data
   * @param DBformat boolean representing whether we want data exactly how it is in the database (unused)
   * @return String representation of the compound data for the requested cell as a comma-delimited string
   */ 
  public String getDataAsString( int row, String columnName, boolean DBformat ) {
      StringBuffer dataString = new StringBuffer( " " );
      if ( columnName.equals( "keyword_type" ) ) {
          dataString.append( getKeywordType( row ) );
      }
      return new String( dataString );
  }

  /**
   * @param row The integer representing the row of the table of data 
   * @param columnName The String representing the column name of the table of data
   * @return String array of the compound data for the requested cell, row in sub-result set  
   */
  public String[] getDataAsArray( int row, String columnName ) {
      if ( columnName.equals( "keyword_type" ) ) {
        lookupData = new String[1];
        lookupData[0] = new String( " " ); 
        lookupData[0] = getKeywordType( row ); 
      }
    return lookupData;
  }

}
