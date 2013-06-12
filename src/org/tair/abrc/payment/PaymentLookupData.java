//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
//$Revision: 1.3 $
//$Date: 2006/02/02 23:04:36 $
//------------------------------------------------------------------------------
package org.tair.abrc.payment;

import java.sql.SQLException;

import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.LookupDataModel;
import org.tair.utilities.SearchType;
import org.tair.utilities.TextConverter;

/**
 * The purpose of this class is to provide a "get as needed" function for 
 * display of row data on summary pages
 * for a type specific search - in this case annotation search.  It retrieves 
 * the required data for a page's worth of rows
 * using ids for lookup of the data.  The ids are stored in the internal table 
 * which is populated by ResultsFetcher which  
 * retrieved the page's worth of data from the search's temp table. The lookup 
 * data is retrieved ( often multiple rows per 
 * id ) and stored as an array in the table's cell that corresponds to that 
 * lookup data. 
 *
 * PaymentLookupData is used by <code>ResultsFetcher</code>  
 * as a <code>LookupDataModel</code> object.
 * PaymentLookupData implements the methods defined by 
 * <code>LookupDataModel</code> in a search type specific manner.
 * PaymentLookupData uses <code>SearchType</code> to identify columns 
 * for lookup for this particular search type.    
 **/

public class PaymentLookupData implements LookupDataModel {

    private String[] lookupColumnNames;
    private String searchType = "payment";  
    private String[][] resultsTable;
    private int resultsLength;
    private String[] type;// only one entry per row
    private String[] lookupData;  

    private DBReadManager connectionPool;

    public PaymentLookupData() {
        setLookupColumnNames( SearchType.getLookupColumns( this.getType() ) );
    } 
    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBReadManager.getInstance();
        return connectionPool.get_connection();    
    }
    // releases a connection back to the database pool
    private void returnConnection( DBconnection conn ) throws SQLException { 
    	connectionPool.return_connection( conn ); }

    // sets the list of the lookup columns that contain ids for lookup 
    private void setLookupColumnNames( String[] lookupColumns ) { 
    	lookupColumnNames = lookupColumns; }

    // returns a list of the lookup columns that contain ids for lookup 
    private String[] getLookupColumnNames() { return lookupColumnNames; }

    // returns the correspnding index for a temp table column name -- 
    // to be used to access the lookup ID 
    // from the 'in memory' results table
    private int getIndex(String columnName) {
        int columnIndex = 0;
        for ( int i = 0; i < SearchType.getTempTableColumns( getType() ).length; 
              i ++ ) {
            if ( SearchType.getTempTableColumns( getType() )[i].
                 equals( columnName ) ) columnIndex = i;
        }
        return columnIndex;     
    }

    // returns length of results table
    private int getResultsLength() { return resultsTable.length; }

    // returns this search type 
    private String getType() { return searchType; }

    /**
     * provides to the object a subset (a page worth for display on 
     * the summary page) of the temp table results as a two 
     * dimensional string array.  The columns are the temp table columns 
     * and the rows are the result set rows - 
     * the rows for a particular pages display. Lookup keys can be accessed 
     * via the arrays contents for columns that 
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

        } finally {
            if ( conn != null ) returnConnection( conn ); 
        }
        setInvoiceType();
    }

    /**
     * provides to the object a subset (user-selected rows of data from the 
     * summary page) of the temp table results  
     * as a two dimensional string array.  The columns are the temp table 
     * columns and the rows are the user-selected 
     * rows from the summary page. Lookup keys can be accessed via the 
     * arrays contents for columns that 
     * have been identified as lookup columns.
     * @param downloadTable The table of user-selected rows from summary pages
     **/
    // currently no download page has been requested for this search -- 
    // default is the same as summary page   
    public void setDownloadData( String[][] downloadTable ) throws SQLException { 
        resultsTable = downloadTable;
        resultsLength = downloadTable.length;
        // set the data items that are needed for download page
        DBconnection conn = null;
        try {
            conn = getConnection();
        } finally {
            if ( conn != null ) returnConnection( conn ); 
        }
    }

//  format payment method for display purposes
    private void setInvoiceType() {
        type = new String[ getResultsLength() ];
        for ( int i = 0; i < getResultsLength(); i ++ ) {
            if ( !TextConverter.isEmpty
                 ( resultsTable[i][getIndex( "type" )] ) ) {
                if ( resultsTable[i][getIndex( "type" )].equalsIgnoreCase("online_credit_card") || 
                		resultsTable[i][getIndex( "type" )].equalsIgnoreCase("credit_card")) {
                	type[i] = "credit card";
                } else {
                	type[i] = "check";
                }
            }
        }
    }
    
    private String getInvoiceType( int row )  { return type[row]; } 
          
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
     * @param DBformat boolean representing whether we want data exactly how it is in the database 
     * @return String representation of the compound data for the requested cell as a comma-delimited string
     */ 
    public String getDataAsString( int row, String columnName, boolean DBformat) {
        StringBuffer dataString = new StringBuffer();
        
        if ( columnName.equals( "type" ) ) {
            dataString.append( getInvoiceType( row ) );
        }
        return new String( dataString );
        
    }

    /**
     * @param row The integer representing the row of the table of data 
     * @param columnName The String representing the column name of the table of data
     * @return String array of the compound data for the requested cell, row in sub-result set  
     */
    public String[] getDataAsArray( int row, String columnName ) {
        if ( columnName.equals( "type" ) ) {
            lookupData = new String[1];
            lookupData[0] = getInvoiceType( row ); 
        }
        return lookupData;
    }

}
