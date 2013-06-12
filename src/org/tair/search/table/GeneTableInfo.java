//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$Revision: 1.6 $
//$Date: 2004/06/21 21:52:16 $
//------------------------------------------------------------------------------ 

package org.tair.search.table;

/**
 * GeneTableInfo contains the type specific information to create a temp table
 * to hold results of the gene search. GeneTableInfo uses default
 * implementations of all methods in <code>TempTableInfo</code> superclass.
 * Type specific information for gene search is contained in table column data
 * returned by getTableColumns() method.
 */

public class GeneTableInfo extends TempTableInfo {

    public GeneTableInfo() {
        super();
    }

    /**
     * @return String defining gene specific temp table columns that can be used
     *         as part of CREATE TABLE SQL command when creating a table to hold
     *         gene search results.
     */
    public String getTableColumns() {
        String columns = "tair_object_id numeric(12) NOT NULL, "
            + "map_element_id numeric(12) NOT NULL, "
            + "gene_id numeric(12) NOT NULL, " + "name varchar(50) NULL, "
            + "locus_id numeric(12) NULL, " + "locus_is_obsolete char(1) NULL, " 
			+ "locus varchar(50) NULL, "
            + "gene_model_type_id numeric(12) NULL, "
            + "is_obsolete char(1) NULL, "
            + "is_exp_verified char(1) NULL, " + "units char(2) NULL, "
            + "position float NULL, " 
            + "order_priority numeric(12) NULL";
        return columns;
    }

    /**
     * @return String key to use when referencing gene table info.
     */
    public String getType() {
        return "gene";
    }
}
