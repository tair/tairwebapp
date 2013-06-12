/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * PooledGenomicTableInfo contains the type specific information
 * to create a temp table to hold results of the pooled genomic dna search.
 * PooledGenomicTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for pooled genomic dna search is contained in table column
 * data returned by getTableColumns() method.
 */

public class PooledGenomicTableInfo extends TempTableInfo {

  public PooledGenomicTableInfo() {
    super();
  }

  /**
   * @return String defining clone specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold pooled genomic dna search results.
   */
  public String getTableColumns() {
    String columns = 
      "tair_object_id numeric(12) NOT NULL, " +
      "stock_id numeric(12) NOT NULL, " +
      "name varchar(50) NULL, " +
      "stock_availability_type_id numeric(12) NOT NULL, " +
      "stock_availability_type varchar(25) NOT NULL";
    return columns;
  }

  /**
   * @return String key to use when referencing pooled genomic dna table info.
   */
  public String getType() { return "pool"; }
}
