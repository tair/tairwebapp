/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;

/**
 *  ResultsFetcher is a utility class that fetches data from a populated temp table for access by a presentation layer
 *  such as XXX_summary.jsp which presents summary results from an online search form, typically XXX_form.jsp (where
 *  XXX is the search type). The temp table must have id as a column.  The id serves as a unique, sequential
 *  row identifier for paging through the result set.  ResultsFetcher provides
 *  methods that return information about the complete contents of the temp table it is acting on and also
 *  information about a requested segment of the temp table.  The segments requested can be for sequential page of a
 *  user-defined size or for a set of selected rows passed in as a vector of IDs that uniquely identify the rows, typically
 *  used for download selection.  Other methods help with paging and download formatting.  ResultsFetcher uses
 *  <code>MasterTableInfo</code> to get the temp table name based on the session_id and search type.  It also uses
 *  <code>SearchType</code> to get download column information and a helper <code>LookupDataModel</code> object for the
 *  search type.  The <code>LookupDataModel</code> object provides a type specific way to lookup compound information
 *  associated
 *  with a column of the temp table. For instance, if many aliases are associated with a row in the temp table then a
 *  lookup key (id) is stored in the aliases column and when the rows are requested the <code>LookupDataModel</code>
 *  object for the
 *  search type will lookup the aliases and pass back either a delimited string or an array of the aliases for that row.
 *
 */

public class ResultsFetcher {

    //private String tempTblName;
    private String queryID;
    private String IDColumn;
    private String[][] workTable;
    private LookupDataModel lookupData;
    private int totRows;
    private int rowsPerPage;
    private int startRow;
    private int endRow;
    private int startRowID;
    private String downloadInClause;
    private String searchType;
    private boolean lookupObjectExists = false;
    //private boolean useSortID = false;
    private DBReadManager connectionPool;
    private String sortColumnName = "id";
    /**
     * Search must be registered through the <code>SearchSession</code> before this constructor can be used because
     * it will take the supplied search type and session id and get the temp table name from <code>MasterTableInfo</code>
     * <code>SearchSession</code> will have created the temp table based on the search type in <code>MasterTableInfo</code>
     * @param queryID the query id of the query in progress; used to access results table
     * @param searchType the type of the search in progress; used to access results table
     * @exception SQLException thrown if a database error occurs.
     */
    public ResultsFetcher( String queryID, String searchType ) throws SQLException {
        
        setSearchType( searchType );
        setQueryID ( queryID );
        setIDColumn( "id" );
        //setTempTblName( sessionID );
        setDefaultInfo();
    }
   
    public ResultsFetcher( String queryID, String searchType, String id_column ) throws SQLException { 
      setSearchType ( searchType );
      setQueryID ( queryID ); 
      setIDColumn( id_column );
      this.sortColumnName = id_column;
      setDefaultInfo ();
    }

    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBReadManager.getInstance();
        return connectionPool.get_connection();
    }

    // releases a connection back to the database pool
    private void returnConnection( DBconnection conn ) throws SQLException { connectionPool.return_connection( conn ); }


/*
    // sets the temp table name
    private void setTempTblName( String sessionID ) {
        tempTblName = MasterTableInfo.getFullTableName( getSearchType(), sessionID );
    }

    // returns the temp table name
    private String getTempTblName() { return tempTblName; }
*/

    // sets the search type supplied through constructor
    private void setSearchType( String searchType ) { this.searchType = searchType; }
    
    private void setQueryID( String queryID ) { this.queryID = queryID; }
    private String getQueryID() { return queryID; }
    
    private void setIDColumn( String IDColumn ) { this.IDColumn = IDColumn; }
    private String getIDColumn() { return IDColumn; }

    /**
     * @return String the search type
     */
    public String getSearchType() { return searchType; }

    // sets some default information about the result set, such as total rows, start row-id, column names, download columns
    private void setDefaultInfo() throws SQLException {
        String query = null;
        DBconnection conn = null;
        if ( isValidTTColumn( "sort_row_id" ) ) {
            query = " SELECT COUNT(*) AS total_rows, min( " + getIDColumn() + " ) AS min_id FROM " +
                "RESULT_" + getSearchType() + " WHERE QUERY_ID = '" + getQueryID() + "' ";
            try {
                conn = getConnection();
                conn.setQuery( query );
                ResultSet results = conn.getResultSet();
                if ( results.next() ) {
                    setResultSetSize( results.getInt( "total_rows" ) );
                    setOffset( results.getInt( "min_id" ) );
                }
                conn.releaseResources();
            } finally {
                if ( conn != null ) returnConnection( conn );
            }

        } else {
            query = " SELECT COUNT(*) AS total_rows, min(" + getIDColumn() +") AS min_id FROM RESULT_" + getSearchType() + " WHERE QUERY_ID = '" + getQueryID() + "'";
            try {
                conn = getConnection();
                conn.setQuery( query );
                ResultSet results = conn.getResultSet();
                if ( results.next() ) {
                    setResultSetSize( results.getInt( "total_rows" ) );
                    setOffset( results.getInt( "min_id" ) );
                }
                conn.releaseResources();
            } finally {
                if ( conn != null ) returnConnection( conn );
            }

        }
        if ( !lookupObjectExists ) {
            if ( SearchType.getLookupClassname( getSearchType() ) != null ) {
                try {
                    Class c = Class.forName( SearchType.getLookupClassname( getSearchType() ) );
                    setLookupData( ( LookupDataModel )c.newInstance() );
                } catch ( ClassNotFoundException cnfe ) {
                    throw new SQLException( "Class not found: " + cnfe.getMessage() );
                } catch ( InstantiationException ise ) {
                    throw new SQLException( "Instantiation exception: " + ise.getMessage() );
                } catch ( IllegalAccessException iae ) {
                    throw new SQLException( "Illegal Access: " + iae.getMessage() );
                }
                lookupObjectExists = true;
            } else {
                lookupObjectExists = false;
            }
        }
    }

    // checks to see if a lookup object for this search has been created
    private boolean hasLookupObject() { return lookupObjectExists; }

    // sets up a handle to the lookup info for this type (ie, keyword,etc) of search
    private void setLookupData(LookupDataModel lookupData) { this.lookupData = lookupData; }

    // returns a handle to the lookup object for this search type
    private LookupDataModel getLookupData() { return lookupData; }


    /**
     * @param columnName The name of the column in the temp table to validate
     * @return boolean representation of check to see if supplied column name is a valid column name
     */
    public boolean isValidColumn( String columnName ) {
        return isValidUIColumn(columnName) || isValidLookupColumn(columnName) 
	    || isValidTTColumn(columnName);
    }


    /**
     * @return String array whose elements contain all the column names requested by the ui including download columns
     */
    public String[] getUIColumns() { return SearchType.getUIColumns( getSearchType() ); }

    /**
     * @param columnName The name of the column in the temp table to validate
     * @return boolean representation of check to see if supplied column name is a valid ui column name
     */
    public boolean isValidUIColumn( String columnName ) {
        boolean isValid = false;
        for ( int i = 0; i < getUIColumns().length ; i ++ ) {
            if ( columnName.equals( getUIColumns()[i] ) ) isValid = true;
        }
        return isValid;
    }

    /**
     * @return String array whose elements contain all the column names that can be looked up
     */
    public String[] getLookupColumns() { return SearchType.getLookupColumns( getSearchType() ); }

    /**
     * @param columnName The name of the column in the temp table to validate
     * @return boolean representation of check to see if supplied column name is a valid lookup column name
     */
    public boolean isValidLookupColumn( String columnName ) {
        boolean isValid = false;
        for ( int i = 0; i < getLookupColumns().length ; i ++ ) {
            if ( columnName.equals( getLookupColumns()[i] ) ) isValid = true;
        }
        return isValid;
    }

    // returns array of columns in temp table
    private String[] getTTColumns() { return SearchType.getTempTableColumns( getSearchType() ); }

    // checks the supplied column name against the array of temp table colmun names, returns true if it is a
    // temp table column name
    private boolean isValidTTColumn( String columnName ) {
        boolean isValid = false;;
        for ( int i = 0; i < getTTColumns().length ; i ++ ) {
            if ( columnName.equals( getTTColumns()[i] ) ) isValid = true;
        }
        return isValid;
    }

    /**
     * @return String array whose elements contain all the column names in the temp table
     */
    public String[] getTempTableColumns() { return SearchType.getTempTableColumns( getSearchType() ); }

    /**
     * @return String array of the download column names
     */
    public String[] getDownloadColumns() { return SearchType.getDownloadColumns( getSearchType() ); }

    /**
     * @return String array of the display names for the UI columns
     */
    public String[] getDisplayNames() { return SearchType.getDisplayNames( getSearchType() ); }

    /**
     * @param columnName The column name from the temp table to lookup for a display name
     * @return String representation of the display name for the supplied column name
     */
    public String getDisplayName( String columnName ) { return getDisplayNames()[ getUIColumnIndex( columnName ) ]; }

    /**
     * @return integer representation of the number of columns in the temp table
     */
    public int getTempTableColumnCount() { return( getTempTableColumns().length ); }

    // returns the index of the ui column name
    private int getUIColumnIndex(String colName) {
        int colIdx = 0;
        for (int i = 0; i < getUIColumns().length ; i ++) {
            if (colName.equals(getUIColumns()[i])) colIdx = i;
        }
        return colIdx;
    }

    // returns the index of the temp table column name
    private int getTTColumnIndex(String colName) {
        int colIdx = 0;
        for ( int i = 0; i < getTempTableColumns().length ; i ++ ) {
            if ( colName.equals( getTempTableColumns()[i] ) ) colIdx = i;
        }
        return colIdx;
    }

    // sets the rowID offset  -- rowIDs are sequential but depending on previous searches could start at any number
    private void setOffset(int minID) { startRowID = minID - 1; }

    // returns the rowID offset used for fetching from the table
    private int getOffset() { return startRowID; }

    // sets total rows to the number of rows in the temp table
    private void setResultSetSize(int totRows) { this.totRows = totRows; }

    /**
     * @return integer representation of the total number of rows in the temp table
     */
    public int getResultSetSize() { return totRows; }

    /**
     * sets the number of rows per page -- user-defined, usually from the request parameters sent with the jsp
     * @param rows_per_page The integer representation of the number of rows on a page
     */
    public void setPageSize(int rowsPerPage) { this.rowsPerPage = rowsPerPage; }

    /**
     * @return integer representation of the number of rows per page
     */
    public int getPageSize() { return rowsPerPage; }

    // sets the starting row number for this page number
    private void setStartRow(int pageNumber) { startRow = ( ( pageNumber - 1 ) * getPageSize() ) + 1; }

    /**
     * @return integer representation of the starting row number for this page number
     */
    public int getStartRow() { return startRow; }

    // sets the ending row number for this page number
    private void setEndRow( int pageNumber ) {
        endRow = ( getStartRow() + getPageSize() ) - 1;
        if ( endRow > getResultSetSize() ) endRow = getResultSetSize();
    }

    /**
     * @return integer representation of the ending row number for this page number
     */
    public int getEndRow() { return endRow; }

    // sets the in clause for the download query
    private void setInClause( Vector selectedIDs ) {
        StringBuffer inBuffer = new StringBuffer(" ");
        if (selectedIDs.size() > 0) {
            inBuffer.append(" ( ");
            for ( int i = 0; i < selectedIDs.size(); i ++) {
                if ( i > 0 ) inBuffer.append(" , ");
                inBuffer.append( selectedIDs.elementAt(i).toString() );
            }
            inBuffer.append(" ) ");
        }
        downloadInClause = inBuffer.toString();
    }

    // returns the inclause for the download query
    private String getInClause() { return downloadInClause; }

    /**
     * @return integer representation of the total number of pages in the results set
     */
    public int getTotPages() {
        int totPages = 0;
        if ( ( getResultSetSize() % getPageSize() ) == 0 ) {
            totPages = getResultSetSize() / getPageSize();
        } else {
            totPages = ( getResultSetSize() / getPageSize() ) + 1;
        }
        return totPages;
    }

    /**
     * @return Arraylist containing all ids in the temp table
     */
    public ArrayList getAllIDsInTempTable() throws SQLException {
        ArrayList ids = new ArrayList();
        String query = " SELECT " + getIDColumn() + " from RESULT_" + getSearchType() + 
            " WHERE QUERY_ID = '" + getQueryID() + "' ";
        DBconnection conn = null;
        ResultSet results = null;
        try {
            conn = getConnection();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                ids.add( new Long( results.getLong( "id" ) ) );
            }
            conn.releaseResources();
        } finally {
            if ( conn != null ) returnConnection( conn );
        }
        return ids;
    }

    /**
     * sortable column name to sort on
     */
    public void setSort( String columnName) throws SQLException {
        this.sortColumnName = columnName;
        /*
        if ( columnName != null ) {
            // resort the results table by reordering the table and setting the sort_row_id to an incremental number
            String query = " SELECT row_id from RESULT_" + getSearchType() + " WHERE QUERY_ID = '" 
                + getQueryID() + "' ORDER BY " + columnName;
            DBconnection conn = null;
            ResultSet results = null;
            try {
                conn = getConnection();
                Debugger.println( Debugger.logMsg( this, " sort =  " + query ) );
                conn.setQuery( query );
                results = conn.getResultSet();
                ArrayList sortIDs = new ArrayList();
                while ( results.next() ) {
                    sortIDs.add( new Long( results.getLong( "row_id" ) ) );
                }
                //conn.releaseResources();
                for ( int i = 0; i < sortIDs.size(); i ++ ) {
                    query = " UPDATE " + getTempTblName() +
                        " SET sort_row_id = " +  new Long( i + 1 ) +
                        " WHERE row_id = " + ( ( Long )sortIDs.get(i) ).toString();
                    Debugger.println( Debugger.logMsg( this, " update =  " + query ) );
                    conn.setQuery( query );
                    conn.executeUpdate();
                }
                conn.releaseResources();
            } finally {
                if ( conn != null ) returnConnection( conn );
            }
            setDefaultInfo();
        }

        */
    }
   /* 
    public void setKeywordSort( String columnName, String tableName, String queryID) throws SQLException {
        if ( columnName != null ) {
            // resort the results table by reordering the table and setting the sort_row_id to an incremental number
            String query = " SELECT row_id, CASE WHEN keyword_category = 'molecular function' THEN 'GO' WHEN keyword_category = 'cellular component' THEN 'GO' ";
            query +=" WHEN keyword_category = 'biological process' THEN 'GO' ELSE 'OTHER' END as annotype ";
            query += "from " + tableName + " WHERE query_id = '" + queryID + "' ORDER BY " + columnName;
            DBconnection conn = null;
            ResultSet results = null;
            try {
                conn = getConnection();
                Debugger.println( Debugger.logMsg( this, " sort =  " + query ) );
                conn.setQuery( query );
                results = conn.getResultSet();
                ArrayList sortIDs = new ArrayList();
                while ( results.next() ) {
                    sortIDs.add( new Long( results.getLong( "row_id" ) ) );
                }
                //conn.releaseResources();
                for ( int i = 0; i < sortIDs.size(); i ++ ) {
                    query = " UPDATE " + tableName + 
                        " SET sort_row_id = " +  new Long( i + 1 ) +
                        " WHERE QUERY_ID = '" + queryID + "' AND row_id = " + ( ( Long )sortIDs.get(i) ).toString();
                    Debugger.println( Debugger.logMsg( this, " update =  " + query ) );
                    conn.setQuery( query );
                    conn.executeUpdate();
                }
                conn.releaseResources();
            } finally {
                if ( conn != null ) returnConnection( conn );
            }
            setDefaultInfo();
        }

    }
   */ 
    /* 
    public void setSort( String columnName, int start, int end) throws SQLException {
        if ( columnName != null ) {
            // resort the results table by reordering the table and setting the sort_row_id to an incremental number
            String query = " SELECT row_id from " + getTempTblName() + " ORDER BY " + columnName;
            DBconnection conn = null;
            ResultSet results = null;
            try {
                conn = getConnection();
                Debugger.println( Debugger.logMsg( this, " sort =  " + query ) );
                conn.setQuery( query );
                results = conn.getResultSet();
                ArrayList sortIDs = new ArrayList();
                while ( results.next() ) {
                    sortIDs.add( new Long( results.getLong( "row_id" ) ) );
                }
                //conn.releaseResources();
                if (sortIDs.size() <= end ){
                    end = sortIDs.size() -1;
                }
                System.out.println("start : " + start + " and end : " + end);
                for ( int i = start; i <= end; i ++ ) {
                    query = " UPDATE " + getTempTblName() +
                        " SET sort_row_id = " +  new Long( i + 1 ) +
                        " WHERE row_id = " + ( ( Long )sortIDs.get(i) ).toString();
                    Debugger.println( Debugger.logMsg( this, " update =  " + query ) );
                    conn.setQuery( query );
                    conn.executeUpdate();
                }
                conn.releaseResources();
            } finally {
                if ( conn != null ) returnConnection( conn );
            }
            setDefaultInfo();
        }

    }
    */

    /**
     * sets the summary page, populates an internal work_table with values from the temp table based on
     * supplied page number, typically from the xxx_summary.jsp
     * @param page_num The integer representation of the requested page number of summary data to display
     */
    public void setSummaryPage( int pageNum ) throws SQLException {
      // TODO This "worktable" approach isn't really adequate because it locks
      // in the format as what rs.getString() returns from the database. The
      // VIEW should be in charge of formatting output, but since it just gets
      // a string representation it can't do that without making drastic,
      // hard-coded assumptions. We need to make each result type available as
      // a Java object, provide it to the view page, then let that page 
      // extract and format the view representation of the object. The only
      // way to control the format now is to put a string into the result
      // table instead of the "real" data type; that locks in the format in
      // the results database, even worse than locking it in here.
        workTable = new String[ getPageSize() ][ getTempTableColumnCount() ];
        setStartRow( pageNum );
        setEndRow( pageNum );
        //String columnName = null;
        //if ( useSortID ) {
        //    columnName = "sort_row_id";
        //} else {
        //    columnName = "id";
        //}
        System.out.println("getStartRow : " + getStartRow() + " and end row : " + getEndRow() );
        /*
        * build the query for oracle pagination
        */
        String inner = " SELECT * FROM RESULT_" + getSearchType() + " WHERE QUERY_ID = '" + getQueryID() 
            + "' ORDER BY " + sortColumnName;
        String second = "SELECT a.*, ROWNUM r FROM (" + inner + ") a WHERE ROWNUM <= " + getEndRow();
        String query = "SELECT * FROM (" + second + ") WHERE r BETWEEN " + getStartRow() + " AND " + getEndRow();
        DBconnection conn = null;
        try {
            conn = getConnection();
            Debugger.println( Debugger.logMsg( this, "summary page query =  " + query ) );
            conn.setQuery( query );
            ResultSet results = conn.getResultSet();
            int rowCount = 0;
            while ( results.next() ) {
                for ( int i = 1; i <= getTempTableColumnCount(); i++ ) {
                    if ( results.getString(i) != null ) {
                        workTable[ rowCount ][ i-1 ] = results.getString(i).trim();
                    } else {
                        workTable[ rowCount ][ i-1 ] = " ";
                    }
                }
                rowCount ++;
            }
            conn.releaseResources();
        } finally {
            if ( conn != null ) returnConnection( conn );
        }

        // retrieve lookup data by sending the the results table for this page to the lookup object, if one exists
        if ( getResultSetSize() > 0 && hasLookupObject() ) getLookupData().setSummaryData( workTable );
    }

    /**
     * sets the download page, populates an internal work_table with values from the temp table based on
     * supplied set of ids cheked by user on the xxx_summary.jsp
     * @param selected_ids The vector of ids selected by the user from the summary pages
     */
    public void setDownloadPage( Vector selectedIDs ) throws SQLException {
        setPageSize( selectedIDs.size() );
        workTable = new String[ getPageSize() ][ getTempTableColumnCount() ];
        System.out.println ("work table : " + getTempTableColumnCount() + " and page size : " + getPageSize());
        setInClause( selectedIDs );
        String query = " SELECT * from RESULT_" + getSearchType() + " WHERE QUERY_ID = '" + getQueryID() + "' AND " + getIDColumn() + " IN " + getInClause();
        System.out.println("query : " + query );
        DBconnection conn = null;
        try {
            conn = getConnection();
            conn.setQuery( query );
            ResultSet results = conn.getResultSet();
            int rowCount = 0;
            while ( results.next() ) {
                for ( int i = 1; i <= getTempTableColumnCount(); i++ ) {
                    if (results.getString(i) != null) {
                        workTable[ rowCount ][ i-1 ] = results.getString(i).trim();
                    } else {
                        workTable[ rowCount ][ i-1 ] = "";
                    }
                }
                rowCount ++;
            }
            conn.releaseResources();
        } finally {
            if ( conn != null ) returnConnection( conn );
        }
        // retieve lookup data by sending the results table for this page to the lookup object
        if ( getResultSetSize() > 0 && hasLookupObject() ) getLookupData().setDownloadData( workTable );
    }

    // returns the current workTable in memory for internal only processing
    private String[][] getPage() { return workTable; }

    
    /**
     * same as getCell excepts it calls getDBCell which is the cell as a data string but 
     * exactly how it is represented in the DB. Made for InvoiceLookupData.java
     * @param rowNum The integer representation of the requested cell's row number
     * @param columnName The column name of the requested cell
     * @return String representation of the requested cell's data
     */
     public String getDBCell( int rowNum, String columnName) throws SQLException { 
        // check to see if this is a valid column name
        // check to see if a lookup object exists
        // check to see if this column contains lookup data - if so, get the lookup data as a string
        String cell = null;
        
        if ( isValidColumn(columnName) ) {
            if ( hasLookupObject() ) {
                if ( getLookupData().isLookupColumn( columnName ) ) {
                    cell = getLookupData().getDataAsString( rowNum, columnName, true );
                } else {
                    cell = getPage()[ rowNum ][ getTTColumnIndex( columnName ) ];
                }
            } else {
                cell = getPage()[ rowNum ][ getTTColumnIndex( columnName ) ];
            }
        } else {
            cell = "Invalid Column Name \"" + columnName + "\", use getUIColumns() for a list of valid column names";
        }
        
        return cell;
     }
    
    /**
     * @param rowNum The integer representation of the requested cell's row number
     * @param columnName The column name of the requested cell
     * @return String representation of the requested cell's data
     */
    public String getCell( int rowNum, String columnName ) throws SQLException {
        // check to see if this is a valid column name
        // check to see if a lookup object exists
        // check to see if this column contains lookup data - if so, get the lookup data as a string
        String cell = null;
        if ( isValidColumn(columnName) ) {
            if ( hasLookupObject() ) {
                if ( getLookupData().isLookupColumn( columnName ) ) {
                    cell = getLookupData().getDataAsString( rowNum, columnName, false);
                } else {
                    cell = getPage()[ rowNum ][ getTTColumnIndex( columnName ) ];
                }
            } else {
                cell = getPage()[ rowNum ][ getTTColumnIndex( columnName ) ];
            }
        } else {
            cell = "Invalid Column Name \"" + columnName + "\", use getUIColumns() for a list of valid column names";
        }
        return cell;
    }

    /**
     * @param rowNum The integer representation of the requested cell's row number
     * @param columnName The column name of the requested cell
     * @return String array of the requested cell's data
     */
    public String[] getLookupCell( int rowNum, String columnName ) {
        // check to see if this is a valid column name
        // check to see if a lookup object exists
        // check to see if this column contains lookup data - if so, get the lookup data as an array
        String[] cellLookup = null;
        if ( isValidColumn( columnName ) ) {
            if ( hasLookupObject() ) {
                if ( getLookupData().isLookupColumn( columnName ) ) {
                    cellLookup = getLookupData().getDataAsArray( rowNum, columnName );
                } else {
                    cellLookup = new String[1];
                    cellLookup[0] = getPage()[ rowNum ][ getTTColumnIndex( columnName ) ];
                }
            } else {
                cellLookup = new String[1];
                cellLookup[0] = getPage()[ rowNum ][ getTTColumnIndex( columnName ) ];
            }
        } else {
            cellLookup = new String[1];
            cellLookup[0] = "Invalid Column Name \"" + columnName + "\", use getUIColumns() for a list of valid column names";
        }
        return cellLookup;
    }

    /**
     * @return Column order used when creating export as a tab-delimited string
     */
    public String getExportHeader() {
        StringBuffer headerBuffer = new StringBuffer( " " );
        for ( int i = 0; i < getDownloadColumns().length; i++ ) {
            if ( i > 0 ) headerBuffer.append( "\t " );
            headerBuffer.append( getDisplayName( getDownloadColumns()[i] ) );
        }
        headerBuffer.append( "\n " );
        return headerBuffer.toString();
    }
    
    /**                                                                                                                                                                                                      
     * Creates a real tab-delimited header used for downloading.                                                                                                                                    
     * Same as the one above, except there's no space after the tab                                                                                                                                     
     * originall made for ABRC invoice downloading, but did not want to mess                                                                                                                            
     * up the structure of other downloads in case the space was there for a                                                                                                                        
     * reason.                                                                                                                                                                                          
     */  
    public String getExportHeader_nospace() {                                                                                                                                                     
    StringBuffer headerBuffer = new StringBuffer( "" );                                                                                                            
    for ( int i = 0; i < getDownloadColumns().length; i++ ) {                                                                                                                                            
            if ( i > 0 ) headerBuffer.append( "\t" );                                                                                                                                                       
            headerBuffer.append( getDisplayName( getDownloadColumns()[i] ) );                                                                                                                         
        }                                                                                                                                                                                           
        headerBuffer.append( "\n" );                                                                                                                                                           
        return headerBuffer.toString();
    }
    
    /**
     * Creates a tab-delimited string of the data for downloading.
     * @return Tab-delimited string of selected rows data
     */
    public String createExport()  throws SQLException {
        StringBuffer dataBuffer = new StringBuffer( " " );
        for ( int i = 0; i < getPageSize(); i++ ) {
            for ( int j = 0; j < getDownloadColumns().length; j++ ) {
                if ( j > 0 ) dataBuffer.append( "\t " );
                dataBuffer.append( getCell( i, getDownloadColumns()[j] ) );
            }
            dataBuffer.append( "\n " );
        }
        return dataBuffer.toString();
    }
    
    /**
    * Creates a real tab-delimited string of the data for downloading.
    * Same as the one above, except there's no space after the tab
    * originall made for ABRC invoice downloading, but did not want to mess
    * up the structure of other downloads in case the space was there for a 
    * reason.
    */
    public String createExport_nospace()  throws SQLException {
        StringBuffer dataBuffer = new StringBuffer( "" );
        for ( int i = 0; i < getPageSize(); i++ ) {
            for ( int j = 0; j < getDownloadColumns().length; j++ ) {
                if ( j > 0 ) dataBuffer.append( "\t" );
                dataBuffer.append( getDBCell( i, getDownloadColumns()[j] ) );
            }
            dataBuffer.append( "\n" );
        }
        return dataBuffer.toString();
    }


    /*
     * main method for stand alone test
     */
    public static void main(String[] args){
    }

}


