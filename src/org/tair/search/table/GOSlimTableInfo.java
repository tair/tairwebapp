//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $RCSfile: GOSlimTableInfo.java,v $ 
// $Revision: 1.6 $
// $Date: 2005/08/03 19:38:12 $ 
//------------------------------------------------------------------------------

package org.tair.search.table;

/**
 * GOSlimTableInfo contains the type specific information
 * to create a temp table to hold results of the keyword search.
 * GOSlimTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for keyword search is contained in table column
 * data returned by getTableColumns() method. GOSlim table column names 
 * are returned by
 * getColumnNames() method. 
 */

public class GOSlimTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] { "id",
                                                  "slim_name",
                                                  "keyword_type_id",
                                                  "annotation_count",
                                                  "loci_count",
                                                  "locus_id",
                                                  "grouping",
                                                  "sub_group",
                                                  "sort_row_id",
                                                  "row_id" };

    public GOSlimTableInfo() {
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
        "slim_name varchar(100) NOT NULL, " +
        "keyword_type_id char(4) NOT NULL, " +
        "annotation_count smallint NOT NULL, " +
        "loci_count smallint NOT NULL, " +
        "locus_id numeric(12) NOT NULL, " +
        "grouping smallint NOT NULL, " +
        "sub_group smallint  NULL, " +
        "sort_row_id numeric(12) NOT NULL, " + 
        "row_id numeric IDENTITY " ;
    return columns;
    }
  /**
   * @return String key to use when referencing keyword table info.
   */
    public String getType() { return "goslim"; }
  /**
   * @return String[] array of column names in keyword temp table.
   */
    public String[] getColumnNames() { return columnNames; }

}
