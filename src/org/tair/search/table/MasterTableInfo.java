//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.15 $
// $Date: 2004/08/11 16:14:28 $
//------------------------------------------------------------------------------
package org.tair.search.table;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ObjectInfoCollection;

/**
 * MasterTableInfo acts as a central interface to retrieve properties of 
 * individual temp tables used to hold user search results.  MasterTableInfo
 * allows clients to retrieve data such as temp table name and SQL needed
 * for various table operations (create, drop, delete etc).  Table specific
 * information is contained by several objects which all inherit from 
 * <code>TempTableInfo</code>.  An inner collection of all search table
 * types is maintained as a map referenced by a <code>String</code>
 * key which much be used to retrieve the appropriate table info.  Since
 * all temp tables are created per user, using the user's session id
 * as a unique identifier, all methods require the user's session id
 * as a parameter.
 *
 * <p>
 * MasterTableInfo populates its collection of temp table info objects after
 * receiving a list of TempTableInfo class names through the populateTempTables
 * method.  This collection of types and class names should be supplied by 
 * SearchServlet, which gets the information from ObjectInfoCollection, which 
 * in turn gets the info from the search config file. This is done to simplify 
 * deployment of MasterTableInfo in multiple environments (test, production, 
 * stanford etc.) so that separate versions of MasterTableInfo (with differing 
 * lists of temp table classes) do not need to be compiled for each environment.
 * The location of the search config file is stored in the WebApp object
 * as the SEARCH_CONF_FILE property which should be $HOME/conf/search.conf.
 *
 * <p>
 * Main clients of MasterTableInfo are <code>SearchSession</code>, which
 * uses info to create and drop tables as user initiates and abandons searches,
 * and Searcher objects which use MasterTableInfo to get correct table name
 * to insert search results into.
 *
 * @see ObjectInfoCollection
 */
 
public class MasterTableInfo {
    private static HashMap<String, TempTableInfo> tables = new HashMap<String, TempTableInfo>();


    /**
     * Populates inner collection of TempTableInfo classes with instances of 
     * submitted class names. This method is called by SearchServlet as it 
     * initializes, but the list of classes should ultimately come from 
     * ObjectInfoCollection, which reads the search config file to get the 
     * class list.  The search config file should usually be at 
     & $HOME/conf/search.conf.
     * 
     * @param tableClasses Collection of search type keys referencing string 
     * values of class names to instantiate when creating collection of 
     * TempTableInfo classes used to cache search results
     * @throws InvalidParameterException thrown if any error occurs in class 
     * instantiation
     */
    public static void populateTempTables( Map<?, String> tableClasses ) 
	throws InvalidParameterException {
    
        try {
            Iterator<String> iter = tableClasses.values().iterator();
            while ( iter.hasNext() ) {
                Class<?> c = Class.forName( (String) iter.next() );
                TempTableInfo infoClass = (TempTableInfo) c.newInstance();
                tables.put( infoClass.getType(), infoClass );
            }
        } catch ( ClassNotFoundException cnfe ) {      
            throw new InvalidParameterException( "Class not found: " +
						 cnfe.getMessage() );
        } catch ( InstantiationException ise ) {
            throw new InvalidParameterException( "Instantiation exception: " + 
						 ise.getMessage() );
        } catch ( IllegalAccessException iae ) {
            throw new InvalidParameterException( "Illegal Access: " + 
						 iae.getMessage() );
        }      
    }
  
    /**
     * Retrieves all temp table prefixes as defined by TempTableInfo classes 
     * listed in submitted map of search types and prefixes. List of classes and
     * search types may come from SearchServlet, or KillTempTables housekeeping 
     * class, but should ultimately come from search.conf config file. 
     *
     * <p>
     * Prefixes are used as keys in local map of search types that reference 
     * TempTableInfo classes. If this collection is empty when this method is 
     * called, collection will be initialized by calling populateTempTables() 
     * method with submitted tableClasses
     *
     * @param tableClasses Collection of search type keys referencing string 
     * values of class names to instantiate when creating collection of 
     * TempTableInfo classes used to cache search results
     * @return All temp table prefixes as defined for all search types in 
     * search.conf as an <code>Iterator</code> of <code>String</code> objects
     * @throws InvalidParameterException thrown if any error occurs in class 
     * instantiation
     */
    public static Iterator<String> getTempTablePrefixes( Map<?, String> tableClasses ) 
	throws InvalidParameterException { 
        if ( tables.isEmpty() ) {
            populateTempTables( tableClasses );
        }
        return tables.keySet().iterator();
    }


    /**
     * Retrieves the table name created to hold results of a specific
     * search type for a specific user w/submitted session_id; exact
     * table naming convention is determined by individual TempTableInfo
     * objects, but default implementation appends session id to table 
     * type to create name (i.e. gene_123456 )
     *
     * @param type Search type requested
     * @param session_id Session id for specific user executing search
     * @return Table name to hold user's results for requested search type
     */
    public static String getTableName( String type, String session_id ) {
        String tableName = null;
        TempTableInfo tableInfo = null;
        if ( tables.containsKey( type ) ) {
            tableInfo = (TempTableInfo) tables.get( type );
            tableName = 
		tableInfo.getTableName( TableIDFactory.
					translateSessionID( session_id ) );
        }
        return tableName;
    }

    /**
     * Retrieves the fully qualified table name created to hold results of a
     * specific search type for a specific user w/submitted session_id. Exact
     * full name is determined by individual TempTableInfo objects, but default
     * version includes the database name as "tempdb.." for  referencing table 
     * absolutely.
     *
     * @param type Search type requested
     * @param session_id Session id for specific user executing search
     * @return Full table name, including database name,  to hold user's results 
     * for requested search type
     */
    public static String getFullTableName( String type, String session_id ) {
        String tableName = null;
        TempTableInfo tableInfo = null;

        if ( tables.containsKey( type ) ) {
            tableInfo = (TempTableInfo) tables.get( type );
            tableName = 
		tableInfo.getFullTableName( TableIDFactory.
					    translateSessionID( session_id ) );
        }
        return tableName;
    }
    
  /**
   * Get a query id, a sequence number from the Result_QueryID table that
   * corresponds to the input query string. The method returns an existing id if
   * there is one; otherwise, it inserts a new query into the database and
   * returns the id for that row.
   * 
   * @param query the query for which to get an existing id or a new id
   * @param conn the JDBC connection
   * @param type search type: not used anymore but remains for backward
   *          compatibility with earlier versions
   * @return a query id
   * @throws SQLException when there is a problem inserting a query or getting
   *           back an id
   */
    public static String getQueryID( String query, DBconnection conn, String type )
    throws SQLException {
        return QueryIDFactory.getQueryID( query, conn );
    }

    /**
     * Does an id exist for a given query?
     * 
     * @param query the query for which to check
     * @param conn the JDBC connection
     * @return true if the query exists in the database, false if not 
     * @throws SQLException when there is a database problem with the query
     */
    public static boolean queryIDExists( String query, DBconnection conn )
    throws SQLException {
        return QueryIDFactory.queryIDExists( query, conn );
    }
    
    /**
     * Retrieves SQL command use for creating temp table to hold search
     * results of submitted type for submitted user's session id. Exact
     * SQL command returned is determined by individual TempTableInfo
     * objects.
     *
     * @param type Search type requested
     * @param session_id Session id for specific user executing search
     * @return SQL to create appropriate temp table for specific user
     */
    public static String getCreateSQL( String type, String session_id ) {
        String createSQL = null;
        TempTableInfo tableInfo = null;
        if ( tables.containsKey( type ) ) {
            tableInfo = (TempTableInfo) tables.get( type );
            createSQL = 
		tableInfo.getCreateSQL( TableIDFactory.
					translateSessionID( session_id ) );
        }
        return createSQL;
    }


    /**
     * Retrieves SQL command use for dropping temp table holding search
     * results of submitted type for submitted user's session id. Exact
     * SQL command returned is determined by individual TempTableInfo
     * objects
     *
     * @param type Search type requested
     * @param session_id Session id for specific user executing search
     * @return SQL to drop appropriate temp table for specific user
     */
    public static String getDropSQL( String type, String session_id ) {
        String dropSQL = null;
        TempTableInfo tableInfo = null;
        if ( tables.containsKey( type ) ) {
            tableInfo = (TempTableInfo) tables.get( type );
            dropSQL = 
		tableInfo.getDropSQL( TableIDFactory.
				      translateSessionID( session_id ) );
        }
        return dropSQL;
    }
  
    /**
     * Retrieves SQL command use for deleting all contents of temp table 
     * holding search results of submitted type for submitted user's 
     * session id. This command is used to clear any previous results
     * held in table for user. Exact SQL command returned is determined
     * by individual TempTableInfo objects, but default implementation
     * deletes all records from table without qualification
     *
     * @param type Search type requested
     * @param session_id Session id for specific user executing search
     * @return SQL to delete all rows from appropriate temp table for specific
     * user
     */
    public static String getDeleteSQL( String type, String session_id ) {
        String deleteSQL = null;
        TempTableInfo tableInfo = null;
        if ( tables.containsKey( type ) ) {
            tableInfo = (TempTableInfo) tables.get( type );
            deleteSQL = 
		tableInfo.getDeleteSQL( TableIDFactory.
					translateSessionID( session_id ) );
        }
        return deleteSQL;
    }

}
