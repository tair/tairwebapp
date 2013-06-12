//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/04/26 21:31:08 $
//------------------------------------------------------------------------------

package org.tair.search.table;

/**
 * PublicationTableInfo contains the type specific information
 * to create a temp table to hold results of the publication search.
 * PublicationTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for publication search is contained in table column
 * data returned by getTableColumns() method.
 */

public class PublicationTableInfo extends TempTableInfo {

    public PublicationTableInfo() {
	super();
    }

    /**
     * @return String defining publication specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold publication search results.
     */
    public String getTableColumns() {
	String columns = 
	    "reference_id numeric(12) NOT NULL, " +
	    "authors_uc varchar(1296) NULL, " +
	    "year smallint NULL, " +
	    "title varchar(1024) NULL, " +
	    "volume varchar(20) NULL, " +
	    "page_start char(6) NULL, " +
	    "pub_source_name varchar(255) NULL";
	return columns;
    }


    /**
     * @return String key to use when referencing publication table info.
     */
    public String getType() { 
	return "pub"; 
    }
}
