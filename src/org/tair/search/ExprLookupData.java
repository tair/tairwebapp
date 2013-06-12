/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.search.*;
import org.tair.tfc.*;
import org.tair.querytools.*;

/**
   * ExprLookupData is used by <code>ResultsFetcher</code> through expression set as a <code>LookupDataModel</code> object.
   * ExprLookupData implements the methods defined by <code>LookupDataModel</code> in a search type specific manner.
   * ExprLookupData uses <code>SearchType</code> to identify columns for lookup for this particular search type.    
   * ExprLookupData retieves the cell's description since it is a large data item and is best retieved as needed, also
   * special formatting for description is done here for the download option
   * ExprLookupData retrieves the experimenter last name since it involves multi-join and if it isn't used as the sort
   * column it is done here for efficiency -- only retrieves for a subset of the result set -- if experimenter is
   * chosen as the sort column, the retrievel for the column is done in the Searcher class where the whole result 
   * set is generated.
   **/

public class ExprLookupData implements LookupDataModel {

  private String search_type = "expr";  
  private String[][] results_table;
  private int results_length;
  private String[] lookup_data;  
  private DBReadManager connectionPool;
  private String[][] experimenter;// experimenter associated with a given entry [row num][0]
  private String[][] description;// only one entry per row - potentially long string in [row num][0], truncated for a download request 

/**
   * constructor invoked from SearchType for use from the <code>ResultsFetcher</code> for the requested search type
   **/    
  public ExprLookupData() { } 
 
    // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBReadManager.getInstance();
    return ( connectionPool.get_connection() );    
  }

    // releases a connection back to the database pool
  private void returnConnection( DBconnection conn ) throws SQLException {
    connectionPool.return_connection( conn );
  }

    // returns a list of column names that require a db lookup -- db lookup functionality provided by this class 
  private String[] getLookupColumns() { return SearchType.getLookupColumns( this.getType() ); }

    // returns the correspnding index for a temp table column name -- to be used to access the lookup ID 
    // from the in memory results table
  private int getIndex( String column_name ) {
    int column_index = 0;
    for ( int i = 0; i < SearchType.getTempTableColumns( getType() ).length; i ++ ) {
       if ( SearchType.getTempTableColumns( getType() )[i].equals( column_name ) ) column_index = i;
    }
    return column_index;     
  }

    // returns this search type 
  private String getType() { return search_type; }

  /**
   * provides to the object a subset (a page worth for display on the summary page) of the temp table results as a two 
   * dimensional string array.  The columns are the temp table columns and the rows are the result set rows - 
   * the rows for a particular pages display. Lookup keys can be accessed via the arrays contents for columns that 
   * have been identified as lookup columns.
   * @param summary_table The table of one page of data from a summary page
   **/    
  public void setSummaryData( String[][] summary_table ) throws SQLException {
      results_table = summary_table;
      results_length = summary_table.length;
      boolean download_flag = false;
      // set the data items that are for display to the summary page
      setExperimenter();
      setDescription( download_flag );
  }

  /**
   * provides to the object a subset (user-selected rows of data from the summary page) of the temp table results  
   * as a two dimensional string array.  The columns are the temp table columns and the rows are the user-selected 
   * rows from the summary page. Lookup keys can be accessed via the arrays contents for columns that 
   * have been identified as lookup columns.
   * @param download_table The table of user-selected rows from summary pages
   **/    
  public void setDownloadData( String[][] download_table ) throws SQLException { 
      results_table = download_table;
      results_length = download_table.length;
      boolean download_flag = true;
      // set the data items that are needed for download page
      setExperimenter();
      setDescription( download_flag );
  }

    // populates an array of string arrays that contain the experimenter, experimenter[row in results ][ experimenter ] 
    private void setExperimenter() throws SQLException { 
      // first check to see if experimenter was requested as a sort column
      // if it was, pass the value that is in experimenter_requested back for display
      // otherwise do the retrieval of the experimenter here -- for only a subset of the result set to optimize performance.
      // if experimenter was not requested as a sort column, all rows in this column will be populated with "none" so only 
      // the first row needs to be checked
      experimenter = new String[results_length][1];    
      if ( results_table[0][getIndex( "experimenter_requested" )].equals( "none" ) ) { 
        DBconnection conn = getConnection();       
        String query =  "select pe.last_name AS experimenter from Person pe, Attribution att, AttributionType aty " +
	              "where pe.community_id = att.community_id " + 
	              "AND att.attribution_type_id = aty.attribution_type_id " +
	              "AND aty.attribution_type = 'experiment_done_by' " + 
	              "AND att.tair_object_id = ? ";
        conn.setQuery( query );
        for ( int i = 0; i < results_table.length; i ++ ) {
	  if ( ( results_table[i][getIndex( "id" )] ) !=null ) {
	    conn.setQueryVariable( new Long( results_table[i][getIndex( "tair_object_id" )] ) );
            ResultSet results = conn.getResultSet();
	    if ( results.next() ) {
	      experimenter[i][0] = results.getString( "experimenter" );       
	    } else {
	      experimenter[i][0] = " ";
	    }
	  }	  
        }
        returnConnection( conn );
      } else {
      // experimenter was requested as the sort column -- so the retrieval of all experimenter names is a part of the 
      // whole result set, simply assign those values to experimenter
        for ( int i = 0; i < results_table.length; i ++ ) {
	  if ( ( results_table[i][getIndex( "id" )] ) !=null ) {
	    experimenter[i][0] = results_table[i][getIndex( "experimenter_requested" )];       
	  }	  
        }
      }
  }

  private String[] getExperimenter( int row )  { return experimenter[row]; } 

    // populates an array of string arrays that contain the desctription,
    // description[row in results ][ only one description ]
    // retirving description as a lookup because it is potntially so big, elimitaes retrieving them all
    // but rather retreives them based on page request 
  private void setDescription( boolean download ) throws SQLException {
      description = new String[results_length][1];
      DBconnection conn = getConnection();       
      String query =  "select description from ExpressionSet where expression_set_id = ? ";
      conn.setQuery( query );
      for ( int i = 0; i < results_table.length; i ++ ) {
	if ( ( results_table[i][getIndex( "id" )] )!=null ) {
	  conn.setQueryVariable( new Long(results_table[i][getIndex( "id" )] ) );
          ResultSet results = conn.getResultSet();
	  if ( results.next() ) {
	    if ( results.getString( "description" ) == null ) {
	      description[i][0] = " ";
	    } else {
	      if ( download ) {
		if ( results.getString( "description" ).length() > 40 ) {
		  // truncate if its longer than 40 characters
	      	  description[i][0] = results.getString( "description" ).substring( 0, 40 );
		} else {
		  description[i][0] = results.getString( "description" );
	        }
	      } else {
		description[i][0] = ( results.getString( "description" ) ).trim();
	      }
	    }
	  }           
	}	  
      }
      returnConnection( conn );
  }
  private String[] getDescription( int row )  { return description[row]; }   
    
  /**
   * @param column_name The column name of the temp table to be checked 
   * @return boolean representation of check for lookup column
   */
  public boolean isLookupColumn( String column_name ) {
    boolean is_lookup = false;
      for ( int i = 0; i < getLookupColumns().length; i ++ ) {
        if ( column_name.equals( getLookupColumns()[i] ) ) is_lookup = true;
      }
    return is_lookup;
  }

  /**
   * @param row The integer representing the row of the table of data 
   * @param column_name The String representing the column name of the table of data
   * @param DBformat boolean representing whether we want data exactly how it is in the database (unused)
   * @return String representation of the compound data for the requested cell as a comma-delimited string
   */ 
  public String getDataAsString( int row, String column_name, boolean DBformat) {
    StringBuffer data_string = new StringBuffer();
    if ( column_name.equals( "experimenter" ) ) {
	for ( int i = 0; i < getExperimenter(row).length; i ++ ) {
	    if ( i > 0 ) data_string.append( ", " );
	    data_string.append( getExperimenter( row )[i] );
	}
    }
    if ( column_name.equals( "description" ) ) {
	for ( int i = 0; i < getDescription( row ).length; i ++ ) {
	    if ( i > 0 ) data_string.append( ", " );
	    data_string.append( getDescription( row )[i] );
	}
    }
    return ( new String( data_string ) );

  }

  /**
   * @param row The integer representing the row of the table of data 
   * @param column_name The String representing the column name of the table of data
   * @return String array of the compound data for the requested cell, row in sub-result set  
   */
  public String[] getDataAsArray( int row, String column_name ) {
    if ( column_name.equals( "experimenter" ) ) {
	lookup_data = getExperimenter( row );
    }
    if ( column_name.equals( "description" ) ) {
	lookup_data = getDescription( row );
    }
    return lookup_data;
  }

}
