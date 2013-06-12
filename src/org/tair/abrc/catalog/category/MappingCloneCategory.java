//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/04/07 23:01:16 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * MappingCloneCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the mapping clone 
 * dna stock category
 */

public class MappingCloneCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "mapping_clone" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "mapping_clone";
    }
    

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up mapping clone 
     * stock category.  SQL query will retrieve all stock ids that 
     * have is_molecular_mapping flag set to true. Stocks are sorted 
     * alphabetically by clone name
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        String query =
            "SELECT s.stock_id, c.name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Clone c " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND c.tair_object_id = ts.tair_object_id " +
            "AND s.is_obsolete = 'F' " +
            "AND c.is_obsolete = 'F' " +
            "AND s.is_molecular_mapping = 'T' " +
            "ORDER BY c.name "; 

        return query;
    }
    

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on mapping clone 
     * catalog page.  Associated data includes clone, stock donors, clone 
     * aliases and clone assignments
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {

        stock.populateClone( conn );
        stock.populateDonors( conn );
        stock.populateCloneAliases( conn );
        stock.populateCloneAssignments( conn );
    }
    
}



