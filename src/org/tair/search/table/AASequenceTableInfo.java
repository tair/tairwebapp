//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2004/09/08 21:00:30 $
//------------------------------------------------------------------------------ 

package org.tair.search.table;

/**
 * AASequenceTableInfo contains the type specific information
 * to create a temp table to hold results of the protein search.
 * AASequenceTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for protein search is contained in table column
 * data returned by getTableColumns() method.
 */

public class AASequenceTableInfo extends TempTableInfo {

    public AASequenceTableInfo() {
        super();
    }

    /**
     * Retrieves table column definitions for this search type
     *
     * @return String defining protein specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold aa sequence search results.
     */
    public String getTableColumns() {
        String columns = 
            "tair_object_id numeric(12) NULL, " +
            "aa_sequence_id numeric(12) NOT NULL, " +
            "name varchar(50) NULL, " +
            "position float NULL, " +
            "locus_name varchar(50) NULL, " +
            "calc_MW float NULL, " +
            "calc_pI float NULL, " +
            "length int NULL, " +
            "date_last_modified smalldatetime NULL ";
        return columns;
    }

    /**
     * Retrieves literal key to use for referencing aa sequence table info.
     *
     * @return String key to use when referencing aa sequence table info.
     */
    public String getType() { 
        return "protein"; 
    }
}
