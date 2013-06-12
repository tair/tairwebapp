/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * KeywordTableInfo contains the type specific information
 * to create a temp table to hold results of the keyword search.
 * KeywordTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for keyword search is contained in table column
 * data returned by getTableColumns() method. Keyword table column names are returned by
 * getColumnNames() method. 
 */

public class KeywordTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] { "id","keyword","keyword_type","has_direct_links","has_child_links","row_id" };

    public KeywordTableInfo() {
        super();
    }

  /**
   * @return String defining keyword specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold keyword search results.
   */
    public String getTableColumns() {
    String columns =
        "id numeric(12) NOT NULL, " + 
        "keyword varchar(255) NOT NULL, " +
        "keyword_type varchar(32) NOT NULL, " +
        "has_direct_links char(1) NULL, " +
        "has_child_links char(1) NULL, " +
        "row_id numeric IDENTITY " ;
    return columns;
    }
  /**
   * @return String key to use when referencing keyword table info.
   */
    public String getType() { return "keyword"; }
  /**
   * @return String[] array of column names in keyword temp table.
   */
    public String[] getColumnNames() { return columnNames; }

}
