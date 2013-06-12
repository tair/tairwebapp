/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * VectorTableInfo contains the type specific information
 * to create a temp table to hold results of the dna vector search.
 * VectorTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for vector search is contained in table column
 * data returned by getTableColumns() method.
 */

public class VectorTableInfo extends TempTableInfo {

  public VectorTableInfo() {
    super();
  }

  /**
   * @return String defining vector specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold dna vector search results.
   */
  public String getTableColumns() {
    String columns = 
      "tair_object_id numeric(12) NOT NULL, " +
      "vector_id numeric(12) NOT NULL, " +
      "name varchar(50) NULL, " +
      "type varchar(10) NULL ";
    return columns;
  }

  /**
   * @return String key to use when referencing vector table info.
   */
  public String getType() { return "vector"; }
}
