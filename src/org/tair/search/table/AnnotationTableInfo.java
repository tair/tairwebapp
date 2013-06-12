/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * AnnotationTableInfo contains the type specific information
 * to create a temp table to hold results of the keyword search.
 * AnnotationTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for keyword search is contained in table column
 * data returned by getTableColumns() method. Annotation table column names 
 * are returned by
 * getColumnNames() method. 
 */

public class AnnotationTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] { "id","keyword_category",
                                                  "keyword_id","keyword",
                                                  "tair_object_id","relationship_type_id",
                                                  "evidence_description_id","reference_id",
                                                  "is_parent_keyword","sort_row_id","row_id" };

    public AnnotationTableInfo() {
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
        "keyword_category varchar(32) NOT NULL, " +
        "keyword_id numeric(12) NOT NULL, " + 
        "keyword varchar(255) NOT NULL, " +
        "tair_object_id numeric(12) NOT NULL, " + 
        "relationship_type_id numeric(12) NOT NULL, " + 
        "evidence_description_id numeric(12) NOT NULL, " + 
        "reference_id numeric(12) NOT NULL, " +
        "is_parent_keyword char(1) NULL, " +
        "sort_row_id numeric(12) NOT NULL, " +  
        "row_id numeric IDENTITY " ;
    return columns;
    }
  /**
   * @return String key to use when referencing annotation table info.
   */
    public String getType() { return "annotation"; }
  /**
   * @return String[] array of column names in annotation temp table.
   */
    public String[] getColumnNames() { return columnNames; }

}
