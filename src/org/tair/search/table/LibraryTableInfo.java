/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * LibraryTableInfo contains the type specific information
 * to create a temp table to hold results of the dna library search.
 * LibraryTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for library search is contained in table column
 * data returned by getTableColumns() method.
 */

public class LibraryTableInfo extends TempTableInfo {

  public LibraryTableInfo() {
    super();
  }

  /**
   * @return String defining library specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold dna library search results.
   */
  public String getTableColumns() {
    String columns = 
      "tair_object_id numeric(12) NOT NULL, " +
      "library_id numeric(12) NOT NULL, " +
      "name varchar(50) NULL, " +
      "description varchar(255) NULL ";
    return columns;
  }

  /**
   * @return String key to use when referencing library table info.
   */
  public String getType() { return "library"; }
}
