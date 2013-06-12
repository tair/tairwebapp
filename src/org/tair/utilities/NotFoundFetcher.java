/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.*;
import java.util.*;
import java.io.*;

import org.tair.tfc.*;
import org.tair.search.table.*;

/**
 * THIS NEEDS TO BE UPDATED!!!!!
   *  ResultsFetcher is a utility class that fetches data from a populated temp table for access by a presentation layer 
   *  such as XXX_summary.jsp which presents summary results from an online search form, typically XXX_form.jsp (where  
   *  XXX is the search type). The temp table must have row_id as a column.  The row_id serves as a unique, sequential 
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

public class NotFoundFetcher {
     
    private String tempTblName;
    private String poundTblName;
    private boolean poundTblExists;
    private String searchType;
    private String nameType;
    //private String ntfColumnName;
    private String namesList;
    private ArrayList nameListArray;
    private ArrayList ntfListArray;
    private File uploadedFile;
    private DBReadManager connectionPool;

    /**
     * Search must be registered through the <code>SearchSession</code> before this constructor can be used because
     * it will take the supplied search type and session id and get the temp table name from <code>MasterTableInfo</code>
     * <code>SearchSession</code> will have created the temp table based on the search type in <code>MasterTableInfo</code>
     * @param session_id User's session id. Used to access temp table for user's individual results.
     * @param search_type User's search type in progress. Used to access temp table for user's individual results.
     * @exception SQLException thrown if a database error occurs.
     */
    
    public NotFoundFetcher( String sessionID, String searchType, File uploadedFile ) throws SQLException {
        setSearchType( searchType );  
        setTempTblName( sessionID );
        setUploadedFile( uploadedFile );	            
    }

    public NotFoundFetcher( String sessionID, String searchType, String namesList ) throws SQLException {
        setSearchType( searchType );  
        setTempTblName( sessionID );
        setNamesList( namesList );	            
    }

    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBReadManager.getInstance();
        return ( connectionPool.get_connection() );    
    }

    // releases a connection back to the database pool
    private void returnConnection( DBconnection conn ) throws SQLException { connectionPool.return_connection( conn ); }

    // sets the temp table name
    private void setTempTblName( String sessionID ) { 
        tempTblName = MasterTableInfo.getFullTableName( getSearchType(), sessionID );
    }  

    // returns the temp table name
    private String getTempTblName() { return tempTblName; } 

    // sets the pound table name
    private void setPoundTblName() { 
        Integer id = null;
        Random generator = new Random( System.currentTimeMillis() ); 
        id = new Integer( generator.nextInt( 999 ) ); 
        poundTblName = "#NTF" + id.toString();
    }
  
    // returns the pound table name
    private String getPoundTblName() { return poundTblName; }  

    // sets the uploaded file object
    private void setUploadedFile( File uploadedFile ) { 
        this.uploadedFile = uploadedFile;
    } 

    // returns the submitted names list
    private File getUploadedFile() { return uploadedFile; }   

    // sets the submitted names list
    private void setNamesList( String namesList ) { 
        this.namesList = namesList;
    }  

    // returns the uploaded file object
    private String getNamesList() { return namesList; }  
 
    // sets the search type supplied through constructor 
    private void setSearchType( String searchType ) { this.searchType = searchType; }
    
    /**
     * @return String the search type 
     */
    public String getSearchType() { return searchType; }

    // sets the name type supplied through constructor 
    private void setNameType( String nameType ) { 
        this.nameType = nameType;
    }
    
    /**
     * @return String the name type 
     */
    private String getNameType() { return nameType; }

    // returns the create SQL used to create a pound table used to store the loci or element names 
    // from a textarea or a file

    // !!  change to use ntfColumnName here for consistency
    private final String getCreateSQL() { return " CREATE TABLE " + getPoundTblName() +  
                                                 " ( name varchar(20) ) "; } 
 
    // returns the insert clause used to populate element names or loci into a pound temp table 
    // from a textarea or a file
    private final String getInsertSQL() { return " INSERT INTO " + getPoundTblName() +  
                                                 " VALUES "; }
 
    // returns the drop SQL used to drop a pound table used to store the loci or element names 
    // from a textarea or a file
    private final String getDropSQL() { return " DROP TABLE " + getPoundTblName(); }   

    // returns the query needed to retreive not founds for this search type and name type
    private String getQuery() { 
        String query = null;
        if ( getSearchType() != null && getNameType() != null ) {
            if ( getSearchType().equalsIgnoreCase( "expression" ) || 
            	 getSearchType().equalsIgnoreCase( "single_channel" ) ) {
                if ( getNameType().equalsIgnoreCase( "element" ) ) { 
                    // check for aliases also -- join to ArrayElementNameAlias to check if the name was found
                    query = "SELECT pt.name AS name FROM " + getPoundTblName() + 
                        " pt WHERE NOT EXISTS ( SELECT 'X' FROM " + getTempTblName() +  
                        " tt, ArrayElementNameAlias aen WHERE tt.name = aen.display_name AND aen.name  = pt.name )" ;
                } else if ( getNameType().equalsIgnoreCase( "locus" ) ) { // straight up
                    query = "SELECT pt.name AS name FROM " + getPoundTblName() + 
                        " pt WHERE NOT EXISTS ( SELECT 'X' FROM " + getTempTblName() +  
                        " tt WHERE tt.locus  = pt.name )" ;
                } 
            }
        }
        return query; 
    }   

    public void setNTFList( String nameType ) throws SQLException, InvalidFormException { 
        ntfListArray = new ArrayList();
        //String query = null;
        if ( nameType != null ) {
            DBconnection conn = null;
            try {
                conn = getConnection();   
                setNameType( nameType );
                // populate a pound table with the submitted names
                if ( ( getUploadedFile() != null ) || ( getNamesList() != null ) ) {
                    createPoundTbl( conn );
                    if ( getNamesList() != null ) { // get list of names from a textarea
                        // preferred if both supplied
                        setNameListArray( conn, getNamesList() );
                    } else { // get list of names from a file
                        if ( getUploadedFile() != null ) {
                            setNameListArray( conn, getUploadedFile() );
                        }
                    }
                    insertNames( conn );
                }

                // compare to results storedin temp table to get the not founds

                // notExists query against temp table and pound table to set this param - need to know name type, name or 
                // locus
                // query needs to be different if nameType = name -- it needs to include a join to ArrayElementNameAlias for 
                // the expression search -- could be different for different searches, deal with this case for now 
                Debugger.println( Debugger.logMsg( this, "ntf SQL = " + getQuery() ) ); 
                conn.setQuery( getQuery() );
                ResultSet results = conn.getResultSet();
                while ( results.next() ) { 
                    ntfListArray.add( results.getString( "name" ) );
                }
            } finally {
                if ( conn != null ) returnConnection( conn );  
            }
        } 
    }

    // returns the list of not found names 
    private ArrayList getNTFListArray() { return ntfListArray; }  

    // creates the pound table needed to hold the names from the textarea or file
    private void createPoundTbl( DBconnection conn ) throws SQLException { 
        if ( !poundTblExists ) {
            setPoundTblName();
            //Debugger.println( Debugger.logMsg( this, "create pound table, SQL = " + getCreateSQL() ) ); 
            conn.setQuery( getCreateSQL() );
            conn.executeUpdate();
            conn.releaseResources();
            poundTblExists = true;
        }
    }
        // insert names from nameListArray into pound table
    private void insertNames( DBconnection conn ) throws SQLException { 
        if ( !poundTblExists ) createPoundTbl( conn );
        // insert names
        String nameValue = null;
        for ( int i = 0; i < getNameListArray().size(); i ++ ) {
            if ( getNameListArray().get( i ) != null ) {
                nameValue = " ( " + TextConverter.dbQuote( ( String )getNameListArray().get( i ) ) + " ) ";
                //Debugger.println( Debugger.logMsg( this, "insert into pound table, SQL = " + getInsertSQL() + nameValue ) ); 
                conn.setQuery( getInsertSQL() + nameValue );
                conn.executeUpdate();
                conn.releaseResources();
            }
        } 

    }

    // drops the pound table needed to hold the names from the textarea or file
    private void dropPoundTbl( DBconnection conn ) throws SQLException { 
        if ( poundTblExists ) {
            //Debugger.println( Debugger.logMsg( this, "drop pound table, SQL = " + getDropSQL() ) ); 
            conn.setQuery( getDropSQL() );
            conn.executeUpdate();
            conn.releaseResources();
            poundTblExists = false;
        } 
    } 

    private void setNameListArray( DBconnection conn, File uploadedFile ) throws InvalidFormException, SQLException { 
        if ( uploadedFile != null ) {
            String nameList = new String();
            try { 
                FileReader fs = new FileReader( uploadedFile );
                BufferedReader in = new BufferedReader( fs );
                String s = new String();
                        
                while( ( s = in.readLine() )!= null ) {
                    nameList += s + "\n";
                }
                in.close();
            } catch ( FileNotFoundException fnfe ) {
                dropPoundTbl( conn );
                throw new InvalidFormException( "Uploaded file not found error: " + uploadedFile.toString());
            } catch ( IOException ioe ) {
                dropPoundTbl( conn );
                throw new InvalidFormException( "Uploaded file error: " + uploadedFile.toString() +
                                                "uploadedFile.exists(): " + uploadedFile.exists() + 
                                                "uploadedFile.length(): " + uploadedFile.length() );
            }
            setNameListArray( conn, nameList );
        }
    }

    private void setNameListArray( DBconnection conn, String nameList ) throws InvalidFormException, SQLException { 
        nameListArray = new ArrayList();
        if ( nameList != null ) {            
            StringTokenizer st = new StringTokenizer( nameList, " ,\t\n" );
            StringBuffer inList = new StringBuffer(" ");
            int ctr = 0;
            int maxNum = 100;
            //int periodIndex = 0;
            if ( st.countTokens() > maxNum ) {
                dropPoundTbl( conn );
                throw new InvalidFormException( "Exceeded maximum number of elements or loci which is set to : " + maxNum );
            }
            if ( st.countTokens() == 0 ) {
                dropPoundTbl( conn );
                throw new InvalidFormException( "No data provided in the file " );
            }
            while ( st.hasMoreTokens() ) {
                String name = st.nextToken().toUpperCase();
                // look for a period in the locus string, truncate from the period if it exists and use that as the locus
                //periodIndex = locus.indexOf( "." );
                //if ( periodIndex > 0 ) name = name.substring( 0, periodIndex );
                if ( !nameListArray.contains( name ) ) nameListArray.add( name );
            }
        }
    }

    // returns the list of names parsed from the textarea or a file
    private ArrayList getNameListArray() { return nameListArray; }  
  
    /**
     * @return integer representation of the total number of not found names
     */
    public int getResultSetSize() { return getNTFListArray().size(); }

    /**
     * @return iterator to not found names array
     */
    public Iterator getNTFNames() { return getNTFListArray().iterator(); }

    /*     
     * main method for stand alone test
     */
    public static void main(String[] args){
    }	

}
    
  
