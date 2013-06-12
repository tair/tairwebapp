/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * GermplasmTableInfo contains the type specific information
 * to create a temp table to hold results of the germplasm search.
 * GermplasmTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for germplasm search is contained in table column
 * data returned by getTableColumns() method.
 */

public class GermplasmTableInfo extends TempTableInfo {

  public GermplasmTableInfo() {
    super();
  }

  /**
   * @return String defining germplasm specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold dna germplasm search results.
   */
  public String getTableColumns() {
    String columns = 
      "tair_object_id numeric(12) NOT NULL, " +
      "germplasm_id numeric(12) NOT NULL, " +
      "name varchar(100) NULL, " +
      "type varchar(20) NULL, " +
      "polymorphism_name varchar(50) NULL, " +
      "stock_number varchar(50) NULL, " +
      "stock_number_prefix varchar(20) NULL, " +
      "stock_number_suffix numeric NULL ";
    return columns;
  }

  /**
   * @return String key to use when referencing germplasm table info.
   */
  public String getType() { return "germplasm"; }
}
