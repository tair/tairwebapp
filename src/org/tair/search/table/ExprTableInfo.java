//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/04/05 22:44:23 $
//------------------------------------------------------------------------------
package org.tair.search.table;

/**
 * ExprTableInfo contains the type specific information to create a temp 
 * table to hold results of the microarray experiment search. EcotypeTableInfo 
 * uses default implementations of all methods in <code>TempTableInfo</code> 
 * superclass. Type specific information for experiment search is contained in 
 * table column data returned by getTableColumns() method.
 */

public class ExprTableInfo extends TempTableInfo {

    /**
     * Retrieves list of columns in experiment temp table
     *
     * @return String defining experiment specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold experiment search results.
     */
    public String getTableColumns() {
	String columns =
	    "tair_object_id numeric(12) NOT NULL, " +
	    "expression_set_id numeric(12) NOT NULL, " +
	    "name varchar(255) NULL, " +
	    "original_name varchar(50) NULL, " +
	    "submission_number varchar(64) NULL, " +
	    // may be either person.last_name or keyword
	    "order_column varchar(255) NULL ";
	return columns;
    }


    /**
     * Retrieves key to use for referencing experiment table info
     *
     * @return String key to use when referencing experiment table info.
     */
    
    public String getType() { 
	return "expr"; 
    }

}
