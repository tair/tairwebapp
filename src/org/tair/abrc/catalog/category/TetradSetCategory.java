//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2005/09/14 16:21:08 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * TetradSetCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the sets of tetrad
 * lines stock category
 */

public class TetradSetCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "tetrad_set" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "tetrad_set";
    }
    


    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up the sets of tetrad
     * lines stock category.  SQL query will retrieve only stock id
     * for CS8994
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {
        String query =
            "SELECT s.stock_id " +
            "FROM Stock s, StockAvailabilityType sa " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.is_obsolete = 'F' " +
            "AND s.name = 'CS8994' ";

        return query;
    }



    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on sets of tetrad
     * lines catalog page.  Associated data for sets includes germplasm
     * and stock donors as well as parent germplasm data (including polymorphism
     * and species variant info. for parent).
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {

        stock.populateGermplasm( conn );

        stock.populateDonors( conn );

        // get germplasm's parent germplasm info including associated
        // polymorphisms and species variant data
        stock.populateGermplasmParents( conn );
        stock.populateGermplasmParentPolymorphisms( conn );
        stock.populateGermplasmParentSpeciesVariants( conn );
    }
}



