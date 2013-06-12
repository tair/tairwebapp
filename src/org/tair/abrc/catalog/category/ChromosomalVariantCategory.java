//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2005/09/14 16:21:09 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * ChromosomalVariantCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the chromosomal variant
 * seed stock category.
 */

public class ChromosomalVariantCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "chromosomal_variant" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "chromosomal_variant";
    }
    
    /**
     * Implements abstract method defined in superclass to return SQL 
     * query to retrieve stock ids that make up chromosomal variant stock
     * category.  SQL query will retrieve all stock ids that are associated 
     * to germplasms that have either the is_aneuploid flag set to true or
     * ploidy of 4. Stocks are sorted alphabetically by donor last name and 
     * stock number
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        

        String query = 
            "SELECT s.stock_id, " +
            "pe.last_name_uc, " +
            "s.stock_number_prefix, " +
            "s.stock_number_suffix, " +
            "s.name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
            "Donor d, " +
            "Community c, " +
            "Person pe " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND s.stock_id = d.stock_id " +
            "AND d.stock_id = ts.stock_id " +
            "AND d.community_id = c.community_id " +
            "AND c.community_id = pe.community_id " +
            "AND d.community_id = pe.community_id " +
            "AND c.is_obsolete = 'F' " +
            "AND c.status = " + 
            TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " " +
            "AND s.is_obsolete = 'F' " +
            "AND g.is_obsolete = 'F' " +
            "AND (g.is_aneuploid = 'T' OR g.ploidy = '4') " +
            "ORDER BY last_name_uc, " +
	    "stock_number_prefix, " +
	    "stock_number_suffix, name";

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on chromosomal 
     * variant catalog page.  Associated data for category includes germplasm,
     * taxon, images species variant (through pedigree), and stock donors
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock )
	throws SQLException {
        
        stock.populateGermplasm( conn );
        stock.populateGermplasmTaxon( conn );
        stock.populateDonors( conn );

        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );

        stock.populateImages( conn );        
    }


}



