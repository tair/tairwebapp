//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$RCSfile: LociGoslimTableInfo.java,v $ 
//$Revision: 1.1 $
//$Date: 2004/07/23 21:36:41 $ 
//------------------------------------------------------------------------------

package org.tair.search.table;

/**
 * LociGoslimTableInfo contains the loci names used as input into the
 * goslim search which is also needed as input into the gene search when linking
 * from the goslim results page.  This temp table allows for sharing of the bulk 
 * input ( which comes from a user provided list or file ) 
 * used in one search and is then available for another search
 */

public class LociGoslimTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] { "locus_name" };

    public LociGoslimTableInfo() {
        super();
    }

    /**
     * @return String defining locigoslim specific temp table columns
     * that can be used as part of CREATE TABLE SQL command 
     */
    public String getTableColumns() {
        String columns =
            "locus_name varchar(50) NOT NULL";
        return columns;
    }
    /**
     * @return String key to use when referencing locigoslim table info.
     */
    public String getType() { return "locigoslim"; }
    /**
     * @return String[] array of column names in locigoslim temp table.
     */
    public String[] getColumnNames() { return columnNames; }

}
