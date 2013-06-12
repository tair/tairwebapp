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
 * GenomicLibraryCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the genomic library
 * dna stock category
 */

public class GenomicLibraryCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "genomic_library" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "genomic_library";
    }
    

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up genomic library stock
     * category.  SQL query will retrieve all stock ids that are associated
     * to libraries with insert type of "genomic". Stocks are sorted
     * alphabetically by stock number
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        String query =
            "SELECT s.stock_id, s.name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Library l " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = l.tair_object_id " +
            "AND s.is_obsolete = 'F' " +
            "AND l.is_obsolete = 'F' " +
            "AND l.insert_type = 'genomic'" +
            "ORDER BY s.name "; 

        return query;
    }
        

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on genomic library
     * catalog page.  Associated data for genomic libraries includes library
     * and stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
	throws SQLException {

        stock.populateLibrary( conn );
        stock.populateDonors( conn );
    }
}



