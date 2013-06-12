/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * FilterTableInfo contains the type specific information
 * to create a temp table to hold results of the filter search.
 * FilterTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for filter search is contained in table column
 * data returned by getTableColumns() method.
 */

public class FilterTableInfo extends TempTableInfo {

  public FilterTableInfo() {
    super();
  }

  /**
   * @return String defining filter specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold filter search results.
   */
  public String getTableColumns() {
    String columns = 
      "tair_object_id numeric(12) NOT NULL, " +
      "stock_id numeric(12) NOT NULL, " +
      "name varchar(50) NULL, " +
      "stock_availability_type_id numeric(12) NOT NULL, " +
      "stock_availability_type varchar(25) NOT NULL ";
     return columns;
  }

  /**
   * @return String key to use when referencing filter table info.
   */
  public String getType() { return "filter"; }
}
