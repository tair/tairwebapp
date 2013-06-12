/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * ExpressionTableInfo contains the type specific information
 * to create a temp table to hold results of the expression search.
 * ExpressionTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for expression search is contained in table column
 * data returned by getTableColumns() method. Expression table column names are returned by
 * getColumnNames() method. 
 */

public class ExpressionTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] { "id",
                                                  "map_element_id",
                                                  "array_element_id",
                                                  "tair_object_id",
                                                  "name",
                                                  "locus",
                                                  "locus_id",
                                                  "rep_genemodel_id",
					          "exp_tair_object_id",
                                                  "experiment_name", 
                                                  "hyb_desc_id",
                                                  "hyb_desc_name",
						  "repl_fold_change",
                                                  "repl_fold_change_stderr",
						  "sort_row_id",
                                                  "row_id" };


    public ExpressionTableInfo() {
        super();
    }

  /**
   * @return String defining expression specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold expression search results.
   */
    public String getTableColumns() {
    String columns =
        "id numeric(12) NOT NULL, " + 
        "map_element_id numeric(12) NOT NULL, " + 
        "array_element_id numeric(12) NOT NULL, " + 
        "tair_object_id numeric(12) NOT NULL, " + 
        "name varchar(50) NOT NULL, " +
        "locus varchar(50) NULL, " +
        "locus_id numeric(12) NULL, " + 
        "rep_genemodel_id numeric(12) NULL, " +
        "exp_tair_object_id numeric(12) NOT NULL, " + 
        "experiment_name varchar(255) NULL, " +
        "hyb_desc_id  numeric(12) NOT NULL, " +
        "hyb_desc_name varchar(50) NOT NULL, " + 
        "repl_fold_change float NULL, " +
        "repl_fold_change_stderr float NULL, "+
        "sort_row_id numeric(12) NOT NULL, " + 
        "row_id numeric IDENTITY " ;
    return columns;
    }
  /**
   * @return String key to use when referencing expression table info.
   */
    public String getType() { return "expression"; }
  /**
   * @return String[] array of column names in expression temp table.
   */
    public String[] getColumnNames() { return columnNames; }

}
