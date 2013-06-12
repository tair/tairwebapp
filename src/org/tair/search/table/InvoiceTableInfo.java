//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$Revision: 1.1 $
//$Date: 2005/05/27 17:28:22 $
//------------------------------------------------------------------------------
package org.tair.search.table;

/**
 * InvoiceTableInfo contains the type specific information
 * to create a temp table to hold results of the invoice search.
 * InvoiceTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for keyword search is contained in table column
 * data returned by getTableColumns() method. Invoice table column 
 * names are returned by
 * getColumnNames() method. 
 */

public class InvoiceTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] 
        { "id", 
          "organization_id", "date_invoice_created", "invoice_status", "orders_id" 
          , "order_number"
          , "invoice_total", "invoice_type"
          , "sort_row_id", "row_id"};

    public InvoiceTableInfo() {
        super();
    }

    /**
     * @return String defining invoice specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold invoice search results.
     */
    public String getTableColumns() {
        String columns =
            "id numeric(12) NOT NULL, " + 
            "organization_id numeric(12) NOT NULL, " + 
            "date_invoice_created char(10) NULL, " +
            "invoice_status varchar(20) NOT NULL, " +
            "orders_id numeric(12) NOT NULL, " +
            "order_number numeric(12) NOT NULL, " +
            "invoice_total numeric(15,2) NOT NULL, " +
            "invoice_type char(20) NULL, " +
            "sort_row_id numeric(12) NOT NULL, " + 
            "row_id numeric IDENTITY " ;
        return columns;
    }
    /**
     * @return String key to use when referencing invoice table info.
     */
    public String getType() { return "invoice"; }
    /**
     * @return String[] array of column names in invoice temp table.
     */
    public String[] getColumnNames() { return columnNames; }

}
