//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/05/24 23:34:17 $
//------------------------------------------------------------------------------

package org.tair.search.table;

/**
 * StockTableInfo contains the type specific information to create
 * a temp table to hold results of the generic dna stock search.
 * StockTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific information
 * for generic dna stock search is contained in table column data 
 * returned by getTableColumns() method.
 */


public class HostStrainTableInfo extends TempTableInfo {

    /**
     * Retrieves SQL string that defines columns in temp table
     *
     * @return String defining type specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold generic DNA search results.
     */
    public String getTableColumns() {
        String columns = 
            "host_strain_id numeric(12) NOT NULL, " +
	    "tair_object_id numeric(12) NOT NULL, " +
	    "taxon_id numeric(12) NULL, " +
            "name varchar(50) NULL, " +
	    "original_name varchar(100) NULL";
        return columns;
    }

    /**
     * Retrieve string key literal value to use when referencing host
     * strain table info
     *
     * @return String key to use when referencing host strain table info.
     */
    public String getType() { 
        return "strain"; 
    }
}
