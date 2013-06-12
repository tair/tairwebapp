//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$Revision: 1.3 $
//$Date: 2004/11/09 18:15:19 $
//------------------------------------------------------------------------------ 

package org.tair.search.table;

/**
 * SingleChannelTableInfo contains the type specific information
 * to create a temp table to hold results of the single channel expression 
 * search.
 * SingleChannelTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for single channel expression search is contained in 
 * table column
 * data returned by getTableColumns() method. SingleChannel table 
 * column names 
 * are returned by
 * getColumnNames() method. 
 */

public class SingleChannelTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] { 
        "id",
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
        "repl_detection",			
        "repl_detection_pvalue",
        "repl_detection_pvalue_stderr",
        "repl_signal_percentile",						
        "repl_signal",
        "repl_signal_percentile_stderr",
        "repl_signal_stderr",  
        "sort_row_id",
        "row_id" 
    };

    public SingleChannelTableInfo() {
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
            "hyb_desc_id numeric(12) NOT NULL, " + 
            "hyb_desc_name varchar(50) NOT NULL, " +			
            "repl_detection char(1) NULL, " +    
            "repl_detection_pvalue float NULL, " +
            "repl_detection_pvalue_stderr float NULL, " +
            "repl_signal_percentile float NULL, " +    	
            "repl_signal float NULL, " +    
            "repl_signal_percentile_stderr float NULL, " +
            "repl_signal_stderr float NULL, " +
            "sort_row_id numeric(12) NOT NULL, " + 
            "row_id numeric IDENTITY " ;
    	return columns;
    }
    /**
     * @return String key to use when referencing expression table info.
     */
    public String getType() { return "single_channel"; }
    /**
     * @return String[] array of column names in expression temp table.
     */
    public String[] getColumnNames() { return columnNames; }

}
