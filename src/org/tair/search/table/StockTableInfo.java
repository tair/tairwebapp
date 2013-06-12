//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/01/28 18:10:47 $
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

public class StockTableInfo extends TempTableInfo {

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
            "stock_type varchar(25) NOT NULL";
        return columns;
    }

    /**
     * Retrieve string key literal value to use when referencing generic
     * dna stock table info
     *
     * @return String key to use when referencing generic dna stock table info.
     */
    public String getType() { 
        return "stock"; 
    }
}
