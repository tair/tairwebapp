/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * CloneEndTableInfo contains the type specific information
 * to create a temp table to hold results of the clone search.
 * CloneEndTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for clone search is contained in table column
 * data returned by getTableColumns() method.
 */

public class CloneEndTableInfo extends TempTableInfo {

  public CloneEndTableInfo() {
    super();
  }

  /**
   * @return String defining clone specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold clone search results.
   */
  public String getTableColumns() {
    String columns = 
      "tair_object_id numeric(12) NOT NULL, " +
      "map_element_id numeric(12) NOT NULL, " +
      "clone_end_id numeric(12) NOT NULL, " +
      "type varchar(10) NULL, " +
      "chromosome varchar(10) NULL, " +
      "name varchar(50) NULL, " +
      "clone_id numeric(12) NOT NULL, " +
      "clone_name varchar(50) NULL, " +
      "clone_tair_object_id numeric(12) NOT NULL, " +
      "position float NULL";
    return columns;
  }

  /**
   * @return String key to use when referencing clone table info.
   */
  public String getType() { return "clone_end"; }
}
