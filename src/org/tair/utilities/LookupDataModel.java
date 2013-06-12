/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.*;

/**
   *  LookupDataModel is a utility interface that declares methods to be implemented by XXXLookupData classes 
   *  where XXX is the search type.  The purpose is to provide a standard and generically referenced mechanism
   *  for <code>ResultsFetcher</code> objects to retrieve type specific lookup data for display on XXX_summary.jsp 
   *  pages or download.jsp pages.  The methods provide an API to identify lookup columns, get data for a column in
   *  a temp table via a lookup key in either a delimited string format or as a string array of data items for that   
   *  column.  For example, a column in the temp table may hold an id that can be used to fetch aliases for display.
   *  If a column s defined as a lookup column, then the specific implementation of retrieving that data is coded
   *  in the XXXLookupData class for the search and can be accessed using methods defined in this interface.
   **/
public interface LookupDataModel {

  /**
   * @param column_name The column in the temp table to be checked
   * @return boolean representation of check for lookup column
   */
  public boolean isLookupColumn( String column_name );

  /**
   * provides to the object a subset (a page worth for display on the summary page) of the temp table results as a two 
   * dimensional string array.  The columns are the temp table columns and the rows are the result set rows - 
   * the rows for a particular pages display. Lookup keys can be accessed via the arrays contents for columns that 
   * have been identified as lookup columns.
   * @param summary_table The table of one page of data from a summary page
   **/    
  public void setSummaryData( String[][] summary_table ) throws SQLException;

  /**
   * provides to the object a subset (user-selected rows of data from the summary page) of the temp table results  
   * as a two dimensional string array.  The columns are the temp table columns and the rows are the user-selected 
   * rows from the summary page. Lookup keys can be accessed via the arrays contents for columns that 
   * have been identified as lookup columns.
   * @param download_table The table of user-selected rows from summary pages
   **/    
  public void setDownloadData( String[][] download_table ) throws SQLException;

  /**
   * @param row The integer representing the row of the table of data 
   * @param column_name The String representing the column name of the table of data
   * @param DBformat boolean representing whether we want data exactly how it is in the database (this field
   * is used if the two formats are the same)
   * @return String representation of the compound data for the requested cell as a comma-delimited string
   */
  public String getDataAsString( int row, String column_name, boolean DBformat );

  /**
   * @param row The integer representing the row of the table of data 
   * @param column_name The String representing the column name of the table of data
   * @return String array of the compound data for the requested cell 
   */
  public String[] getDataAsArray( int row, String column_name );
}
