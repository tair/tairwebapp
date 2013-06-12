//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$Revision: 1.16 $
//$Date: 2005/01/07 23:46:06 $
//------------------------------------------------------------------------------ 

package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;
import org.tair.querytools.*;
import org.tair.community.*;

/**
 * The purpose of this class is to provide a "get as needed" function for
 * display of row data on summary pages for a type specific search - in this
 * case expression search. It retrieves the required data for a page's worth of
 * rows using ids for lookup of the data. The ids are stored in the internal
 * table which is populated by ResultsFetcher which retrieved the page's worth
 * of data from the search's temp table. The lookup data is retrieved ( often
 * multiple rows per id ) and stored as an array in the table's cell that
 * corresponds to that lookup data.
 * 
 * ExpressionLookupData is used by <code>ResultsFetcher</code> through
 * expression as a <code>LookupDataModel</code> object. ExpressionLookupData
 * implements the methods defined by <code>LookupDataModel</code> in a search
 * type specific manner. ExpressionLookupData uses <code>SearchType</code> to
 * identify columns for lookup for this particular search type.
 *  
 */

public class ExpressionLookupData implements LookupDataModel {

    private String[] lookupColumnNames;
    private String searchType = "expression";
    private String[][] resultsTable;
    private int resultsLength;
    private boolean download = false;
    private String[] lookupData ;
    // multiples possible per row
    private String[][] hybDataID;
    private String[][] hybDataName;
    private String[][] fold_change ; 
    private String[][] fold_change_stderr ;
    private String[][] repl_ch1_signal ;
    private String[][] repl_ch1_signal_stderr ;  
    private String[][] repl_ch2_signal ;
    private String[][] repl_ch2_signal_stderr ;
    private String[][] ch1_signal ;
    private String[][] ch2_signal ;
    
    private String[] external_id ; 

    private String[][] environmental_variables; 
    
    private DBReadManager connectionPool;

    public ExpressionLookupData() {
        setLookupColumnNames(SearchType.getLookupColumns(this.getType()));
    }
    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBReadManager.getInstance();
        return connectionPool.get_connection();
    }
    // releases a connection back to the database pool
    private void returnConnection(DBconnection conn) throws SQLException {
        connectionPool.return_connection(conn);
    }

    // sets the list of the lookup columns that contain ids for lookup
    private void setLookupColumnNames(String[] lookupColumns) {
        lookupColumnNames = lookupColumns;
    }

    // returns a list of the lookup columns that contain ids for lookup
    private String[] getLookupColumnNames() {
        return lookupColumnNames;
    }

    // returns the correspnding index for a temp table column name -- to be used
    // to access the lookup ID
    // from the 'in memory' results table
    private int getIndex(String columnName) {
        int columnIndex = 0;
        for (int i = 0; i < SearchType.getTempTableColumns(getType()).length; i++) {
            if (SearchType.getTempTableColumns(getType())[i].equals(columnName))
                columnIndex = i;
        }
        return columnIndex;
    }

    // returns length of results table
    private int getResultsLength() {
        return resultsTable.length;
    }

    // returns this search type
    private String getType() {
        return searchType;
    }

    /**
     * provides to the object a subset (a page worth for display on the summary
     * page) of the temp table results as a two dimensional string array. The
     * columns are the temp table columns and the rows are the result set rows -
     * the rows for a particular pages display. Lookup keys can be accessed via
     * the arrays contents for columns that have been identified as lookup
     * columns.
     * 
     * @param summaryTable
     *            The table of one page of data from a summary page
     */
    public void setSummaryData(String[][] summaryTable) throws SQLException {
        resultsTable = summaryTable;
        resultsLength = summaryTable.length;
        DBconnection conn = null;
        try {
            conn = getConnection();
            // set the data items that are for display to the summary page
	    // setDescription(conn);  
            setSlideInfo( conn );
            setSlideExternalId ( conn);
	    setEnvironmentalVariables(conn);
        } finally {
            if (conn != null)
                returnConnection(conn);
        }
	
    }

    /**
     * provides to the object a subset (user-selected rows of data from the
     * summary page) of the temp table results as a two dimensional string
     * array. The columns are the temp table columns and the rows are the
     * user-selected rows from the summary page. Lookup keys can be accessed via
     * the arrays contents for columns that have been identified as lookup
     * columns.
     * 
     * @param downloadTable
     *            The table of user-selected rows from summary pages
     */
    // default is the same as summary page - data for download - and formatting
    // may be different from summary page
    public void setDownloadData(String[][] downloadTable) throws SQLException {
        resultsTable = downloadTable;
        resultsLength = downloadTable.length;
        download = true;
        DBconnection conn = null;
        try {
            conn = getConnection();
            // set the data items that are needed for download page
	    setSlideInfo( conn );
            setSlideExternalId ( conn);
            setEnvironmentalVariables(conn);
        } finally {
            if (conn != null)
                returnConnection(conn);
        }
       
    }

    // populates an array of strings that contain the desctription,
    // retirving description as a lookup because it is potntially so big,
    // elimitaes retrieving them all
    // but rather retreives them based on page request
    //
    // ran some tests and using the tfc to get description adds ~ 3 seconds to
    // the page processing and since
    // this search is performance sensitive ( queries go against min 6 million
    // row table ) I'm trying to squeak out
    // as many seconds as I can
    private void setSlideExternalId(DBconnection conn) throws SQLException {
	external_id = new String[resultsLength];
	String query = "SELECT external_id, manufacturer FROM ArrayElement WHERE array_element_id = ? ";
	conn.setQuery(query);
	for (int i = 0; i < resultsTable.length; i++) {
	    external_id[i] = " "; //default to spaces if no value obtained
	    if ( !TextConverter.isEmpty
                 ( resultsTable[i][getIndex("array_element_id")] ) ) {
                // check to make sure the key isn't empty
		conn.setQueryVariable(new Long(
                                               resultsTable[i][getIndex("array_element_id")]));
                ResultSet results = conn.getResultSet();
                if (results.next()) {
                    
		    external_id[i] = results.getString("manufacturer") + ":" +results.getString("external_id") ;
                       
                } //if next
            } //if empty
        } // for loop        
        conn.releaseResources();

    }

    private String getExternalId(int row) {
           return external_id[row];
    }

    // populates an array of string arrays that contain 
    // the slide info
    private void setSlideInfo( DBconnection conn ) throws 
	SQLException {
        hybDataName = new String[resultsLength][];
        hybDataID = new String[resultsLength][];
        fold_change = new String[resultsLength][];
        fold_change_stderr = new String[resultsLength][];
        repl_ch1_signal = new String[resultsLength][];
        repl_ch1_signal_stderr = new String[resultsLength][];  
        repl_ch2_signal = new String[resultsLength][];
        repl_ch2_signal_stderr = new String[resultsLength][];
        ch1_signal = new String[resultsLength][];
        ch2_signal = new String[resultsLength][];

        int j = 0;
        String query = "SELECT dchd.hyb_data_id AS hyb_data_id"
        	+ ", hdes.hyb_data_name AS hyb_data_name " 
        	+ ", dchd.fold_change AS fold_change " 
		+ ", dchd.fold_change_stderr AS fold_change_stderr "
               	+ ", dchd.repl_ch1_signal AS repl_ch1_signal" 
		+ ", dchd.repl_ch1_signal_stderr AS repl_ch1_signal_stderr "
        	+ ", dchd.repl_ch2_signal AS repl_ch2_signal" 
		+ ", dchd.repl_ch2_signal_stderr AS repl_ch2_signal_stderr "
        	+ ", dchd.ch1_signal AS ch1_signal "
                + ", dchd.ch2_signal AS ch2_signal "
	        + " FROM DualChannelHybData dchd " 
		+ ", HybDataDescExprSet_wrk hdes "
                + " WHERE dchd.hyb_data_id = hdes.hyb_data_id " 
		+ " AND hdes.hyb_desc_id = ? AND "
		+ " dchd.array_element_id = ? ";
        String countQuery = "SELECT count(*) AS hybDataCount"
            + " FROM HybDataDescExprSet_wrk hdes "
            + " WHERE hdes.hyb_desc_id = ? ";
        conn.setQuery( countQuery );
        for ( int i = 0; i < resultsTable.length; i++ ) {
        	// for each row in table get the count of hyb datas for a given 
        	// hyb description in order to set the j component of the array
            if ( !TextConverter.isEmpty
                 ( resultsTable[i][getIndex( "hyb_desc_id" )] ) ) {			
                // retreive hyb data count
            	// for each hyb description
                conn.setQueryVariable
                    ( new Long( resultsTable[i][getIndex( "hyb_desc_id" )] ) );
                ResultSet results = conn.getResultSet();
                if ( results.next() ) {
                    int hybDataCount = results.getInt( "hybDataCount" ) ;
                    hybDataName[i] = new String[ hybDataCount ];
                    hybDataID[i] = new String[ hybDataCount ];
                    fold_change[i] = new String[ hybDataCount ];
                    fold_change_stderr[i] = new String[ hybDataCount ];
                    repl_ch1_signal[i] = new String[ hybDataCount ];
                    repl_ch1_signal_stderr [i]= new String[ hybDataCount ];
                    repl_ch2_signal[i] = new String[ hybDataCount ];
                    repl_ch2_signal_stderr[i] = new String[ hybDataCount ];
                    ch1_signal[i] = new String[ hybDataCount ]; 
                    ch2_signal[i] = new String[ hybDataCount ];
                } // end if
            }  // if empty
        } // for loop */
      
        conn.setQuery( query );
	
        for ( int i = 0; i < resultsTable.length; i++ ) {
        	// for each row in table 
         	j = 0;
            if ( !TextConverter.isEmpty
                 ( resultsTable[i][getIndex( "hyb_desc_id" )] ) ) {			
                // retreive hyb data info 
            	// for each hyb description
                conn.setQueryVariable
                    ( 1, new Long( resultsTable[i][getIndex( "hyb_desc_id" )] ) );
                conn.setQueryVariable
                   ( 2, new Long( resultsTable[i][getIndex( "array_element_id" )] ) );
	
                ResultSet results = conn.getResultSet();
                while ( results.next() ) {
                	// for each row retreived populate the j component
                	hybDataName[i][j] = results.getString( "hyb_data_name" );
                 	hybDataID[i][j] = results.getString( "hyb_data_id" );
                	fold_change[i][j] = results.getString( "fold_change" );
                        fold_change_stderr [i][j] = results.getString( "fold_change_stderr" );
                        repl_ch1_signal [i][j] = results.getString("repl_ch1_signal");
                        repl_ch1_signal_stderr [i][j] = results.getString("repl_ch1_signal_stderr");
                        repl_ch2_signal [i][j] = results.getString("repl_ch2_signal");
                        repl_ch2_signal_stderr [i][j] = results.getString("repl_ch2_signal_stderr");
                        ch1_signal [i][j] = results.getString("ch1_signal");
                        ch2_signal [i][j] = results.getString("ch2_signal");

                        j ++;			   
                } // while
            }  // if empty
        } // for loop */
    }
	
    private String[] getHybDataName(int row) {
        return hybDataName[row];
    }
    
    private String[] getHybDataID(int row) {
        return hybDataID[row];
    }

    private String[] getFoldChange(int row) {
        return fold_change[row];
    }
    private String[] getFoldChangeStderr(int row) {
        return fold_change_stderr[row];
    }
    private String[] getReplCh1Signal(int row ){
        return repl_ch1_signal[row];
    }
    private String[]  getReplCh1SignalStderr(int row ){
        return  repl_ch1_signal_stderr[row];
    }
    private String[] getReplCh2Signal(int row ){
        return repl_ch2_signal[row];
    }
    private String[]  getReplCh2SignalStderr(int row ){
        return  repl_ch2_signal_stderr[row];
    }
    private String[] getCh1Signal(int row ){
        return  ch1_signal[row];
    }
    private String[] getCh2Signal(int row ){
        return  ch2_signal[row];
    }
        
    // populate environmental_variables
    private void setEnvironmentalVariables(DBconnection conn) throws SQLException {
        // every single entry has always two  environmental_variables, first is Cy5 , second is Cy3
        environmental_variables = new String[resultsLength][2];
       
	String query = "SELECT condition_name, condition_duration, duration_units, " + 
            " condition_value, label, series_type " +
	    "FROM LabeledSample lam,  BioSample_EnvCond bsec, " + 
	    "EnvironmentalCondition ec, ExpressionSet exs , BioSample bsam " + 
	    "WHERE  bsec.bio_sample_id = lam.bio_sample_id " +
	    "AND ec.environmental_condition_id  = bsec. environmental_condition_id " + 
	    "AND bsec.is_experimental_variable = 'T' "+
            "AND bsam.bio_sample_id =lam.bio_sample_id  " +
            "AND bsam.expression_set_id = exs. expression_set_id " + 
 	    "AND  lam.hyb_description_id = ? " ;   
       
	conn.setQuery( query );
	for ( int i = 0; i < resultsTable.length; i++ ) {
            HashMap one_env = new HashMap();
            String hyb_description_id =  resultsTable[i][getIndex( "hyb_desc_id" )] ;
            if ( !TextConverter.isEmpty( hyb_description_id)){
		conn.setQueryVariable( new Long(hyb_description_id));

                ResultSet results = conn.getResultSet();
                while ( results.next() ) {
                    String display_condition =  results.getString("condition_name");
                    String label =  results.getString("label"); 
                    String type = results.getString("series_type");
                    if ( type!= null && type.equals( "dose_response") && results.getString("condition_value") != null){
			display_condition += " ("+results.getString("condition_value") + ")";
                    }  
                    if ( type!= null && type.equals( "time_course") && results.getString("condition_duration") != null){
			display_condition += " ("+results.getString("condition_duration") + " " ;
                        if ( results.getString("duration_units") != null ){
			    display_condition +=  results.getString("duration_units")  +")";
                        }
                    } 
                    if ( one_env.containsKey(label)){
                        String condition  =  (String)one_env.get(label);
			one_env.put(label, condition + " ; " + display_condition);
                    }else {
                	one_env.put(label, display_condition );
                    } 
                }
                environmental_variables[i][0] = one_env.get("Cy5") != null ? (String) one_env.get("Cy5") : "control" ;
                environmental_variables[i][1] = one_env.get("Cy3") != null ? (String) one_env.get("Cy3") : "control" ;
	    }
	}
       
    }

    private String[] getEnvironmentalVariables(int row) {
        return environmental_variables[row];
    }


    public boolean isLookupColumn(String columnName) {
        boolean isLookup = false;
        for (int i = 0; i < getLookupColumnNames().length; i++) {
            if (columnName.equals(getLookupColumnNames()[i]))
                isLookup = true;
        }
        return isLookup;
    }

    /**
     * @param row
     *            The integer representing the row of the table of data
     * @param columnName
     *            The String representing the column name of the table of data
     * @param DBformat boolean representing whether we want data exactly how it is 
     *         in the database
     * @return String representation of the compound data for the requested cell
     *         as a comma-delimited string
     */
    public String getDataAsString(int row, String columnName, boolean DBformat) {
        StringBuffer dataString = new StringBuffer();
	if ( isLookupColumn( columnName )  ){
	   dataString.append(getStringFromArray( row,columnName )); 
        }
        return dataString.toString();
    }

    // this is a private helper function to get string representation of the lookupcells
    private String getStringFromArray (int row, String columnName ){
        String []  data = getDataAsArray( row, columnName);
        ArrayList dataList  = new ArrayList( Arrays.asList( data ));
        return TextConverter.join ( ", ", dataList );
   }

    /**
     * @param row
     *            The integer representing the row of the table of data
     * @param columnName
     *            The String representing the column name of the table of data
     * @return String array of the compound data for the requested cell, row in
     *         sub-result set
     */
    public String[] getDataAsArray(int row, String columnName) {
        if (columnName.equals("hyb_data_name")) {
            lookupData = getHybDataName(row);
        }
        if (columnName.equals("hyb_data_id")) {
            lookupData = getHybDataID(row);
        }
        if (columnName.equals("environmental_variables")) {
            lookupData = getEnvironmentalVariables(row);
        } 
        if (columnName.equals( "fold_change")){
            lookupData = getFoldChange(row);
        }
        if (columnName.equals( "fold_change_stderr")){
            lookupData = getFoldChangeStderr(row);  
        }
        if (columnName.equals( "repl_ch1_signal")){
            lookupData = getReplCh1Signal( row) ;
        } 
        if (columnName.equals( "repl_ch2_signal")){
            lookupData = getReplCh2Signal( row) ;
        } 
        if (columnName.equals( "repl_ch1_signal_stderr")){
            lookupData = getReplCh1SignalStderr( row) ;
        } 
        if (columnName.equals( "repl_ch2_signal_stderr")){
            lookupData = getReplCh2SignalStderr( row) ;
        } 
        if (columnName.equals( "ch1_signal")){
            lookupData = getCh1Signal( row ) ; 
        }
        if (columnName.equals( "ch2_signal")){
            lookupData = getCh2Signal( row ) ; 
        }
        if (columnName.equals( "external_id")){
            lookupData = new String[1];
            lookupData[0] = getExternalId( row ) ; 
        } 
        return  lookupData;
    }
   
   
}
