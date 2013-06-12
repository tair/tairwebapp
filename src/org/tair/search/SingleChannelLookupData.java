//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$Revision: 1.10 $
//$Date: 2005/05/03 21:52:58 $
//------------------------------------------------------------------------------ 

package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;
import org.tair.querytools.*;

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
 * SingleChannelLookupData is used by <code>ResultsFetcher</code> through
 * expression as a <code>LookupDataModel</code> object. SingleChannelLookupData
 * implements the methods defined by <code>LookupDataModel</code> in a search
 * type specific manner. SingleChannelLookupData uses <code>SearchType</code> to
 * identify columns for lookup for this particular search type.
 *  
 */

public class SingleChannelLookupData implements LookupDataModel {

    private String[] lookupColumnNames;
    private String searchType = "single_channel";
    private String[][] resultsTable;
    private int resultsLength;
    private String[] lookupData;
    private boolean download = false;
    private String[][] genBankAccessions;
    // multiples possible per row - can be
    // accessed as indv elements or as
    // delimited string
    private String[][] aliases;
    // multiples possible per row
    private String[][] hybDataID;
    // multiples possible per row
    private String[][] hybDataName;
    // multiples possible per row
    private String[][] signal;
    // multiples possible per row
    private String[][] signalPercentile;
    // multiples possible per row
    private String[][] detection;
    // multiples possible per row
    private String[][] detectionPValue;
    // multiples possible per row
    private String[][] environmentalVariables; 
    
    private DBReadManager connectionPool;

    public SingleChannelLookupData() {
        setLookupColumnNames
            ( SearchType.getLookupColumns( this.getType() ) );
    }
    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBReadManager.getInstance();
        return connectionPool.get_connection();
    }
    // releases a connection back to the database pool
    private void returnConnection(DBconnection conn) throws 
	SQLException {
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

    // returns the correspnding index for a temp table 
    // column name -- to be used
    // to access the lookup ID
    // from the 'in memory' results table
    private int getIndex( String columnName ) {
        int columnIndex = 0;
        for ( int i = 0; 
              i < SearchType.getTempTableColumns(getType() ).length; 
              i++ ) {
            if ( SearchType.getTempTableColumns( getType() )[i].
                 equals( columnName ) )
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
     *   The table of one page of data from a summary page
     */
    public void setSummaryData( String[][] summaryTable ) throws 
	SQLException {
        resultsTable = summaryTable;
        resultsLength = summaryTable.length;
        DBconnection conn = null;
        try {
            conn = getConnection();
            // set the data items that are for display 
            // to the summary page
            setSlideInfo( conn );
            setGenBankAccessions( conn );
            setAliases( conn );
            setEnvironmentalVariables( conn );
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
    // default is the same as summary page - data for download - 
    // and formatting
    // may be different from summary page
    public void setDownloadData( String[][] downloadTable ) throws 
	SQLException {
        resultsTable = downloadTable;
        resultsLength = downloadTable.length;
        download = true;
        DBconnection conn = null;
        try {
            conn = getConnection();
            // set the data items that are needed for download page
            setSlideInfo( conn );
            setGenBankAccessions( conn );
            setAliases( conn );
            setEnvironmentalVariables( conn );
        } finally {
            if (conn != null)
                returnConnection(conn);
        }
    }
    
    // populates an array of string arrays that contain 
    // the slide info
    private void setSlideInfo( DBconnection conn ) throws 
	SQLException {
        hybDataName = new String[resultsLength][];
        hybDataID = new String[resultsLength][];
        detection = new String[resultsLength][];
        detectionPValue = new String[resultsLength][];
        signal = new String[resultsLength][];
        signalPercentile = new String[resultsLength][];
        int j = 0;
        String query = "SELECT schd.hyb_data_id AS hyb_data_id"
        	+ ", hybd.original_name AS hyb_data_name " 
        	+ ", schd.detection AS detection " 
		+ ", schd.detection_pvalue AS detection_pvalue " 
		+ ", schd.signal AS signal " 
		+ ", schd.signal_percentile AS signal_percentile "
                + " FROM SingleChannelHybData schd " 
		+ ", HybDataDescExprSet_wrk hdes "
                + ", HybData hybd "
                + " WHERE schd.hyb_data_id = hdes.hyb_data_id " 
		+ " AND hdes.hyb_desc_id = ? "
                + " AND schd.hyb_data_id = hybd.hyb_data_id "
		+ " AND schd.array_element_id = ? ";
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
                    hybDataName[i] = new String[results.getInt( "hybDataCount" )];
                    hybDataID[i] = new String[results.getInt( "hybDataCount" )];
                    detection[i] = new String[results.getInt( "hybDataCount" )];
                    detectionPValue[i] = new String[results.getInt( "hybDataCount" )];
                    signal[i] = new String[results.getInt( "hybDataCount" )];
                    signalPercentile[i] = new String[results.getInt( "hybDataCount" )];
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
                	detection[i][j] = results.getString( "detection" );
                 	detectionPValue[i][j] = results.getString( "detection_pvalue" );
                	signal[i][j] = results.getString( "signal" );
                	signalPercentile[i][j] = results.getString( "signal_percentile" );
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
    
    private String[] getDetection(int row) {
        return detection[row];
    }
    
    private String[] getDetectionPValue(int row) {
        return detectionPValue[row];
    }
    
    private String[] getSignal(int row) {
        return signal[row];
    }
    
    private String[] getSignalPercentile(int row) {
        return signalPercentile[row];
    }

    // populates an array of string arrays that contain 
    // the gen bank accessions,
    // genBankAccessions[row in results ][ element for 
    // each gen bank accession ]
    private void setGenBankAccessions( DBconnection conn ) throws 
	SQLException {
        genBankAccessions = new String[resultsLength][];
        String query = "SELECT gen_bank_accession "
            + "FROM ArrayElementGenBankAcc_wrk "
            + "WHERE array_element_id = ? ";
        ArrayList list = new ArrayList();
        conn.setQuery( query );
        for ( int i = 0; i < resultsTable.length; i++ ) {
            // clear elements from arraylist
            list.clear();
            if ( !TextConverter.isEmpty
                 ( resultsTable[i][getIndex( "array_element_id" )] ) ) {			
                // populate a list of gen bank accession 
            	// for each array element
                conn.setQueryVariable
                    ( new Long( resultsTable[i][getIndex( "array_element_id" )] ) );
                ResultSet results = conn.getResultSet();
                while ( results.next() ) {
                    list.add( results.getString( "gen_bank_accession" ) );
                } // while
            }  // if empty
            genBankAccessions[i] = new String[list.size()];
            for ( int j = 0; j < list.size(); j++ ) {
                genBankAccessions[i][j] = (String) list.get(j);
            } // for loop 
        } // for loop 
    }	
    
    private String[] getGenBankAccessions(int row) {
        return genBankAccessions[row];
    }

    // populates an array of string arrays that 
    // contain the aliases, aliases[row
    // in results ][ list of aliases ]
    private void setAliases(DBconnection conn) throws 
	SQLException {
        aliases = new String[resultsLength][];
        for (int i = 0; i < resultsTable.length; i++) {
            if ( ( !TextConverter.isEmpty
                   ( resultsTable[i][getIndex("tair_object_id")] ) ) ) {
                AliasVector alias_vector = new AliasVector
                    ( conn, new Long
                      ( resultsTable[i][getIndex( "tair_object_id" )] ) );
                aliases[i] = new String[alias_vector.size()];
                for (int j = 0; j < alias_vector.size(); j++) {
                    aliases[i][j] = ( ( TfcAlias ) alias_vector.
                                      elementAt(j) ).get_original_alias();
                }
            }
        }
    }

    private String[] getAliases(int row) {
        return aliases[row];
    }

    // populate environmental_variables
    private void setEnvironmentalVariables(DBconnection conn) throws 
	SQLException {
    	environmentalVariables = new String[resultsLength][];
        String query = 
       	"SELECT DISTINCT condition_name, condition_duration, duration_units, " + 
        " condition_value, series_type " + 
        "FROM LabeledSample lam,  BioSample_EnvCond bsec, " + 
        "EnvironmentalCondition ec, ExpressionSet exs , BioSample bsam " + 
        "WHERE  bsec.bio_sample_id = lam.bio_sample_id " +
        "AND ec.environmental_condition_id  = bsec. environmental_condition_id " + 
        "AND bsec.is_experimental_variable = 'T' "+
        "AND bsam.bio_sample_id =lam.bio_sample_id  " +
        "AND bsam.expression_set_id = exs. expression_set_id " + 
        "AND lam.hyb_description_id = ? " ;  
        
        ArrayList list = new ArrayList();
        conn.setQuery( query );

        for ( int i = 0; i < resultsTable.length; i++ ) { 
            // clear elements from arraylist
            list.clear();
            if ( !TextConverter.isEmpty
                 ( resultsTable[i][getIndex( "hyb_desc_id" )] ) ) {			
                // populate a list of environmental variables 
            	// for each hyb desc
                conn.setQueryVariable
                    ( new Long( resultsTable[i][getIndex( "hyb_desc_id" )] ) );
	

                ResultSet results = conn.getResultSet();

                while ( results.next() ) {  
                    String display_condition =  results.getString("condition_name");
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
                    list.add ( display_condition );
                    
                } // while
            
            }  // if empty 
         
            environmentalVariables[i] = new String[list.size()];
            for ( int j = 0; j < list.size(); j++ ) {
            	environmentalVariables[i][j] = (String) list.get(j);
            } // for loop 
         
        } // for loop 
    }

    private String[] getEnvironmentalVariables(int row) {
        return environmentalVariables[row];
    }

    /**
     * @param columnName
     *            The column name of the temp table to be checked
     * @return boolean representation of check for lookup column
     */
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
     * @param DBformat boolean representing whether we want data exactly how it is in the database 
     * @return String representation of the compound data for the requested cell
     *         as a comma-delimited string
     */
    public String getDataAsString(int row, String columnName, boolean DBformat) {
        StringBuffer dataString = new StringBuffer();
        if (columnName.equals("aliases")) {
            for (int i = 0; i < getAliases(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getAliases(row)[i]);
            }
        }
        if (columnName.equals("gen_bank_accessions")) {
            for (int i = 0; i < getGenBankAccessions(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getGenBankAccessions(row)[i]);
            }
        }
        if (columnName.equals("hyb_data_name")) {
            for (int i = 0; i < getHybDataName(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getHybDataName(row)[i]);
            }
        }
        if (columnName.equals("hyb_data_id")) {
            for (int i = 0; i < getHybDataID(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getHybDataID(row)[i]);
            }
        }
        if (columnName.equals("detection")) {
            for (int i = 0; i < getDetection(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getDetection(row)[i]);
            }
        }
        if (columnName.equals("detection_pvalue")) {
            for (int i = 0; i < getDetectionPValue(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getDetectionPValue(row)[i]);
            }
        }
        if (columnName.equals("signal")) {
            for (int i = 0; i < getSignal(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getSignal(row)[i]);
            }
        }
        if (columnName.equals("signal_percentile")) {
            for (int i = 0; i < getSignalPercentile(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getSignalPercentile(row)[i]);
            }
        }
        if (columnName.equals("environmental_variables")) {
            for (int i = 0; i < getEnvironmentalVariables(row).length; i++) {
                if (i > 0)
                    dataString.append(", ");
                dataString.append(getEnvironmentalVariables(row)[i]);
            }
        }
        return dataString.toString();
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
       
        if (columnName.equals("aliases")) {
            lookupData = getAliases(row);
        }
        if (columnName.equals("gen_bank_accessions")) {
            lookupData = getGenBankAccessions(row);
        }
        if (columnName.equals("hyb_data_name")) {
            lookupData = getHybDataName(row);
        }
        if (columnName.equals("hyb_data_id")) {
            lookupData = getHybDataID(row);
        }
        if (columnName.equals("detection")) {
            lookupData = getDetection(row);
        }
        if (columnName.equals("detection_pvalue")) {
            lookupData = getDetectionPValue(row);
        }
        if (columnName.equals("signal")) {
            lookupData = getSignal(row);
        }
        if (columnName.equals("signal_percentile")) {
            lookupData = getSignalPercentile(row);
        }
        if (columnName.equals("environmental_variables")) {
            lookupData = getEnvironmentalVariables(row);
        } 
        return lookupData;
    }

}
