/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;
import org.tair.querytools.*;

/**
   * The purpose of this class is to provide a "get as needed" function for display of row data on summary pages
   * for a type specific search - in this case keyword search.  It retrieves the required data for a page's worth of rows
   * using ids for lookup of the data.  The ids are stored in the internal table which is populated by ResultsFetcher which  
   * retrieved the page's worth of data from the search's temp table. The lookup data is retrieved ( often multiple rows per 
   * id ) and stored as an array in the table's cell that corresponds to that lookup data.  For example, for the Keyword 
   * search's summary page there is a column of data that needs to be displayed for each keyword row displayed called 
   * 'Associated Data'.  Instead of getting all the associated data types and their counts for each keyword retrieved 
   * in the search, an id for the row ( keyword id, in this case ) will be used as a key to get the types and counts, 
   * later as the pages display - this is the class that does that lookup and puts the data into an internal table which
   * requests are made against by ResultsFetcher.            
   *
   * KeywordLookupData is used by <code>ResultsFetcher</code> through keyword as a <code>LookupDataModel</code> object.
   * KeywordLookupData implements the methods defined by <code>LookupDataModel</code> in a search type specific manner.
   * KeywordLookupData uses <code>SearchType</code> to identify columns for lookup for this particular search type.    
   * KeywordLookupData uses <code>AnnotationCountPopulator</code> to get annotation types and associated counts for the keyword
   **/

public class KeywordLookupData implements LookupDataModel {

  private String[] lookupColumnNames;
  private String searchType = "keyword";  
  private String[][] resultsTable;
  private int resultsLength;
  private String[] lookupData;  
  private String[] annotationCounts;// only one entry per row - represented as a comma-delimited string 
  private DBReadManager connectionPool;

  public KeywordLookupData() {
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
      setCounts( conn );  
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
  }

    // pass a string back that lists the types and counts, use AnnotationCountPopulator   
  private void setCounts( DBconnection conn ) throws SQLException {
    annotationCounts = new String[ getResultsLength() ];
    // initialize to  spaces in the event that no counts are found, an empty string is passed back
    StringBuffer countBuffer = new StringBuffer(" ");
    AnnotationCountPopulator acp = new AnnotationCountPopulator();
    AnnotationCount ac = new AnnotationCount();
    boolean firstTime = true;  
    Iterator annCountIter = null;
    for ( int i = 0; i < getResultsLength(); i ++ ) {
      // clean out countBuffer for each node
      countBuffer.delete( 1, countBuffer.length() );
      // check to see if this is a valid row for getting data for   
      if ( resultsTable[i][getIndex( "id" )] !=null && ( resultsTable[i][getIndex( "has_direct_links" )].equalsIgnoreCase( "T" ) || resultsTable[i][getIndex( "has_child_links" )].equalsIgnoreCase( "T" ) ) ) {
	firstTime = true;
        acp.setAnnotationCounts( conn, new Long( resultsTable[i][getIndex( "id" )] ), "combo", true );
	acp.sortAnnotationCounts(new AnnotationCountDisplayComparator());
	annCountIter = acp.getAnnotationCounts();
	if ( annCountIter != null ) {
	  while ( annCountIter.hasNext() ) {
	    ac = ( AnnotationCount )annCountIter.next();
	    if ( !ac.getChildTableName().equalsIgnoreCase(TfcAnnotationType.GENE) &&  ac.getCount() > 0 ) {
	      if ( !firstTime ) countBuffer.append( ", " );  
	      countBuffer.append( ac.getHyperlink_withoutObs() );
	      firstTime = false;
	    }
	  } // end while 
	} // end if null 
      }// null check on node_id
      annotationCounts[i] = new String( countBuffer );
    } // looping through nodes
  }

  private String getCounts( int row )  { return annotationCounts[row]; } 

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
  public String getDataAsString( int row, String columnName, boolean DBformat) {
    StringBuffer dataString = new StringBuffer( " " );
    if ( columnName.equals( "annotation_counts" ) ) {
	dataString.append( getCounts( row ) );
    }
    return new String( dataString );
  }

  /**
   * @param row The integer representing the row of the table of data 
   * @param columnName The String representing the column name of the table of data
   * @return String array of the compound data for the requested cell, row in sub-result set  
   */
  public String[] getDataAsArray( int row, String columnName ) {
    if ( columnName.equals( "annotation_counts" ) ) {
        lookupData = new String[1];
        lookupData[0] = getCounts( row ); 
    }
    return lookupData;
  }

}
