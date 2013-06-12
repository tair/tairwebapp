//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/04/05 22:44:23 $
//------------------------------------------------------------------------------
package org.tair.search.table;

/**
 * EcotypeTableInfo contains the type specific information
 * to create a temp table to hold results of the ecotype search.
 * EcotypeTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for ecotype search is contained in table column
 * data returned by getTableColumns() method.
 */

public class EcotypeTableInfo extends TempTableInfo {

    /**
     * Retrieves list of columns in ecotype temp table
     *
     * @return String defining ecotype specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold ecotype search results.
     */
    public String getTableColumns() {
	String columns = 
	    "tair_object_id numeric(12) NOT NULL, " +
	    "species_variant_id numeric(12) NOT NULL, " +
	    "name varchar(255) NULL, " +
	    "abbrev_name varchar(50) NULL, " +
	    "base_name varchar(50) NULL, " +
	    "original_name varchar(50) NULL, " +
	    "type varchar(50) NULL, " +
	    "location varchar(60) NULL, " +
	    "country varchar(100) NULL ";
	return columns;
    }

    /**
     * Retrieves key to use for referencing ecotype table info
     *
     * @return String key to use when referencing ecotype table info.
     */
    public String getType() { 
	return "ecotype"; 
    }
}
