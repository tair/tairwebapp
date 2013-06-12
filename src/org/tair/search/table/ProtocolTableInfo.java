//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/06/02 19:39:46 $
//------------------------------------------------------------------------------ 
package org.tair.search.table;

public class ProtocolTableInfo extends TempTableInfo {

    /**
     * ProtocolTableInfo contains the type specific information
     * to create a temp table to hold results of the Protocol search.
     * ProtocolTableInfo uses default implementations of all methods
     * in <code>TempTableInfo</code> superclass. Type specific
     * information for Protocol search is contained in table column
     * data returned by getTableColumns() method.
     */
    public ProtocolTableInfo() {
	super();
    }

    /**
     * Return the columns to be used for create table sql command
     * @return String defining  temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold protocol search results.
     */
    public String getTableColumns() {
	String columns =
	    "title  varchar(500) NULL, " +
	    "authors varchar(1000) NULL, " +
	    "reference_id numeric(12) NOT NULL ";
	return columns;
    }

    /**
     * Get the Type of this temp table
     * @return String -- hold the temp table type
     */
    public String getType() { 
	return "protocol"; 
    }

}
