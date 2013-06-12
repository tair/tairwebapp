/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

import org.tair.utilities.*;

/**
 * TempTableInfo is an abstract super class for all TempTableInfo objects.
 * TempTableInfo objects are used to supply various properties for temp
 * tables created in the database to hold a specific user's search results
 * for a specific type of search.  TempTableInfo objects are held in a collection
 * by <code>MasterTableInfo</code> and are referenced by a <code>String</code>
 * key.  This allows MasterTableInfo to act as a central interface to all 
 * TempTableInfo objects.
 *
 * <p>
 * Since most SQL commands for different temp tables are identical
 * with only details such as table name differing between search types, TempTableInfo
 * implements most operations substituting in type specific parameters where
 * necessary.  All classes inheriting from TempTableInfo must implement the
 * getTableColumns() method (which returns column specific information to create
 * each temp table) as well as the getType() method, which returns the <code>String</code>
 * key that should be used to reference all requests for a specific search type.
 *
 * <p>
 * If for any reason a sub-class needs to implement a SQL operation differently than
 * TempTableInfo does, the sub-class can simply override the method to fit the
 * desired behaviour.
 */


public abstract class TempTableInfo {
  private String tableColumns;
    
  public TempTableInfo() {}

  /**
   * Returns the table column definitions used in the CREATE TABLE
   * SQL statement.  This method must be implemented by all classes inheriting
   * from TempTableInfo to return type specific column information.
   *
   * @return String containing column definitions for specific search type.
   */
  public abstract String getTableColumns();

  /**
   * Returns the String key to use when referencing a specific search type.
   * This method must be implemented by all classes inheriting from TempTableInfo
   * to return a unique key to use when referencing a search type
   */
  public abstract String getType();


  /**
   * Retrieves SQL command use for creating temp table to hold search
   * results of submitted type for submitted user's session id. Default 
   * implementation here creates table in tempdb, using column definitions
   * supplied by inheriting sub-class. Returned String can be directly 
   * submitted to database for execution.
   *
   * @param type Search type requested
   * @param session_id Session id for specific user executing search
   * @return SQL to create appropriate temp table for specific user
   */
  public String getCreateSQL( String session_id ) {
    String createSQL = "CREATE TABLE " + getFullTableName( session_id ) + " (" + getTableColumns() + ")";
    return createSQL;
  }

  /**
   * Retrieves the fully qualified table name created for a specific
   * search type for a specific user w/submitted session_id. Default
   * implementation here includes the database name "tempdb.." as the
   * prefix for referencing table absolutely.
   *
   * @param type Search type requested
   * @param session_id Session id for specific user executing search
   * @return Full table name, including database name, to hold user's results 
   * for requested search type
   */
  public String getFullTableName( String session_id ) {
    return "tempdb.." + getType() + "_" + session_id;
  }

  /**
   * Retrieves the table name created to hold results of a specific
   * search type for a specific user w/submitted session_id. Default 
   * implementation here creates table name by appending session id
   * to table type (i.e. gene_123456 ), though inheriting classes may
   * override this to provide a different naming convention if desired
   *
   * @param type Search type requested
   * @param session_id Session id for specific user executing search
   * @return Table name to hold user's results for requested search type
   */
  public String getTableName( String session_id ) {
    return getType() + "_" + session_id; 
  }

  /**
   * Retrieves SQL command use for dropping temp table holding search
   * results of submitted type for submitted user's session id. Default
   * implementation here assumes table is in tempdb, and first ensures
   * that table exists before it is dropped. Returned String can be directly 
   * submitted to database for execution.
   *
   * @param type Search type requested
   * @param session_id Session id for specific user executing search
   * @return SQL to drop appropriate temp table for specific user
   */
  public String getDropSQL( String session_id ) {
    String dropSQL =
      "IF EXISTS ( SELECT * FROM tempdb..sysobjects " +
      "WHERE name = " + TextConverter.dbQuote( getTableName( session_id ) ) + ") " +
      "DROP TABLE " + getFullTableName( session_id );
    return dropSQL;
  }

  /**
   * Retrieves SQL command use for deleting all contents of temp table 
   * holding search results of submitted type for submitted user's 
   * session id. This command is used to clear any previous results
   * held in table for user. Default implementation here clears table
   * using a TRUNCATE command. Returned String can
   * be directly submitted to database for execution
   *
   * @param type Search type requested
   * @param session_id Session id for specific user executing search
   * @return SQL to delete all rows from appropriate temp table for specific user
   */
  public String getDeleteSQL( String session_id ) {
    String deleteSQL = "DELETE " + getFullTableName( session_id );
    return deleteSQL;
  }


}
