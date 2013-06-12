/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;
/**
 * TreeTableInfo contains the type specific information
 * to create a temp table to hold generic tree nodes, a row for each node.
 * type specific display data is stored in display_data_1 and display_data_2 columns, if needed   
 * TreeTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Tree table columns definitions
 * are returned by getTableColumns() method. Tree table column names are returned by
 * getColumnNames() method.
 */
public class TreeTableInfo extends TempTableInfo {

    private String[] columnNames = new String[] { "node_id","parent_id","sib_order","tot_sibs","tot_children", "children_loaded","depth","hide_children","node_icon","display_data_1","display_data_2","parent_row_id","query_identifier","date_last_queried","row_id" };
    /**
     * @return String defining tree table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold tree nodes.
     */
    public TreeTableInfo() {
        super();
    }

    public String getTableColumns() {
        String columns =
        "node_id numeric(12) NOT NULL, " + 
        "parent_id numeric(12) NOT NULL, " + 
        "sib_order smallint NOT NULL, " +
        "tot_sibs smallint NOT NULL, " +  
        "tot_children smallint NOT NULL, " + 
        "children_loaded char(1) NOT NULL, " + 
        "depth smallint NOT NULL, " + 
        "hide_children char(1) NOT NULL, " + 
        "node_icon char(30) NULL, " + 
        "display_data_1 char(50) NULL, " + 
        "display_data_2 char(500) NULL, " +
        "parent_row_id numeric(12) NOT NULL, " +  
        "row_id numeric IDENTITY " ;
        return columns;
    }
    /**
     * @return String key to use when referencing tree table info.
     */
    public String getType() { return "tree"; }
    /**
     * @return String[] array of column names in tree temp table.
     */
    public String[] getColumnNames() { return columnNames; }

}
