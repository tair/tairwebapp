//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/04/07 23:01:19 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * VectorCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the vector
 * dna stock category
 */

public class VectorCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "vector" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "vector";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up vector stock
     * category.  SQL query will retrieve all stock ids that are 
     * associated to a vector, and where stock type is "vector". 
     * Stocks are sorted alphabetically by vector name.
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        String query =
            "SELECT s.stock_id, v.name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "StockType st,  " +
            "TairObject_Stock ts, " +
            "Vector v " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_type_id = st.stock_type_id " +
            "AND st.stock_type = 'vector' " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = v.tair_object_id " +
            "AND v.is_obsolete = 'F' " +
            "AND s.is_obsolete = 'F' " +
            "ORDER BY v.name "; 
        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on vector
     * catalog page.  Associated data for vectors includes vector, vector aliases
     * and stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
	throws SQLException {

        stock.populateVector( conn );
        stock.populateVectorAliases( conn );
        stock.populateDonors( conn );
    }

}



