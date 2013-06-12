//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/04/07 23:01:16 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * GenomicLibraryCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the individually 
 * cloned genes dna stock category
 */

public class IndividualClonedGeneCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "individ_cloned_gene" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "individ_cloned_gene";
    }
    

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up the individually cloned
     * gene stock category.  SQL query will retrieve all stock ids associated
     * to clones where stock number begins with "CD3", and is_molecular_mapping
     * flag is false. Stocks are sorted alphabetically by stock number
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        

        String query =
            "SELECT s.stock_id, s.name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Clone c " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = c.tair_object_id " +
            "AND s.is_obsolete = 'F' " +
            "AND c.is_obsolete = 'F' " +
            "AND (s.is_molecular_mapping IS NULL OR " +
	    "s.is_molecular_mapping = 'F') " +
            "AND s.name LIKE 'CD3%' " +
            "ORDER BY s.name "; 

        return query;
    }
        

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on individually
     * cloned gene catalog page.  Associated data for individually cloned genes
     * includes clone, clone aliases, clone NT sequences, and stock donors
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    
    public void populateAssociatedData( DBconnection conn, CatalogStock stock )
	throws SQLException {

        stock.populateClone( conn );
        stock.populateCloneAliases( conn );
        stock.populateCloneNTSequences( conn );
        stock.populateDonors( conn );
    }
}



