//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/01/30 18:58:01 $
//------------------------------------------------------------------------------

package org.tair.search.table;

/**
 * SeedTableInfo contains the type specific information to create
 * a temp table to hold results of the generic seed stock search.
 * SeedTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific information
 * for generic seed stock search is contained in table column data 
 * returned by getTableColumns() method.
 */

public class SeedTableInfo extends TempTableInfo {

    public SeedTableInfo() {
        super();
    }

    /**
     * Retrieves SQL string that defines columns in temp table
     *
     * @return String defining type specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold generic DNA search results.
     */
    public String getTableColumns() {
        String columns = 
            "tair_object_id numeric(12) NOT NULL, " +
            "stock_id numeric(12) NOT NULL, " +
            "name varchar(50) NULL, " +
            "stock_availability_type_id numeric(12) NOT NULL, " +
            "stock_availability_type varchar(25) NOT NULL, " +
            "stock_type_id numeric(12) NOT NULL, " +
            "stock_type varchar(25) ";
        return columns;
    }

    /**
     * Retrieve string key literal value to use when referencing generic
     * dna stock table info
     *
     * @return String key to use when referencing generic seed stock table info.
     */
    public String getType() { 
        return "seed"; 
    }
}
