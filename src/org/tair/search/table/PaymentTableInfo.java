//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$Revision: 1.3 $
//$Date: 2006/02/02 23:05:22 $
//------------------------------------------------------------------------------
package org.tair.search.table;

/**
 * PaymentTableInfo contains the type specific information
 * to create a temp table to hold results of the payment search.
 * PaymentTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for keyword search is contained in table column
 * data returned by getTableColumns() method. Payment table column 
 * names are returned by
 * getColumnNames() method. 
 */

public class PaymentTableInfo extends TempTableInfo {
    private String[] columnNames = new String[] 
        { "payment_date", "payment_amount", "invoice_id", 
    		"type", 
    		"verification_code", 
    		"name_on_check", 
    		"check_number", 
    		"check_date", 
    		"payment_ref_id",
    		"order_number",
            "payment_id",
            "sort_row_id", "row_id"};

    public PaymentTableInfo() {
        super();
    }

    /**
     * @return String defining payment specific temp table columns
     * that can be used as part of CREATE TABLE SQL command when
     * creating a table to hold payment search results.
     */
    public String getTableColumns() {
        String columns =
            "payment_date char(11) NOT NULL, " +
            "payment_amount numeric(15,2) NOT NULL, " +
            "invoice_id numeric(12) NOT NULL, " +
            "type varchar(20) NOT NULL, " +
            "verification_code varchar(40) NULL, " + 
            "name_on_check char(100) NULL, " +
	        "check_number char(20) NULL, " +
	        "check_date char(11) NULL, " +
            "payment_ref_id char(20) NULL, " +
            "order_number numeric(12) NULL, " + 
            "payment_id numeric(12) NOT NULL, " +
            "sort_row_id numeric(12) NOT NULL, " + 
            "row_id numeric IDENTITY " ;
        return columns;
    }
    /**
     * @return String key to use when referencing invoice table info.
     */
    public String getType() { return "payment"; }
    /**
     * @return String[] array of column names in payment temp table.
     */
    public String[] getColumnNames() { return columnNames; }

}
