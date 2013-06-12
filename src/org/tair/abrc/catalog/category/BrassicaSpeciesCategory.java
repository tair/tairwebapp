//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2005/09/14 16:21:08 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * BrassicaSpeciesCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the brassica species
 * seed stock category.
 */

public class BrassicaSpeciesCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "brassica_species" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "brassica_species";
    }
    
    /**
     * Implements abstract method defined in superclass to return SQL 
     * query to retrieve stock ids that make up brassica species stock
     * category.  SQL query will retrieve all stock ids that are associated 
     * to germplasms that are natural variants (germplasms for species
     * variants, where taxon begins with Brassica. Stocks are sorted 
     * alphabetically by taxon scientific name
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        String query = 
            "SELECT s.stock_id, t.scientific_name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
            "SpeciesVariant sv, " +
            "Taxon t " +
            "WHERE s.stock_availability_type_id = sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND g.species_variant_id = sv.species_variant_id " +
            "AND g.taxon_id = t.taxon_id " +
            "AND s.is_obsolete = 'F' " +
            "AND g.is_obsolete = 'F' " +
            "AND t.scientific_name LIKE 'Brassica%' " +
            "ORDER BY UPPER( t.scientific_name ) ";

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on brassica species
     * catalog page.  Associated data for category includes germplasm, taxon, 
     * species variant directly linked to germplasm, images, and stock donors
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
	throws SQLException {
        
        stock.populateGermplasm( conn );
        
        // get species variant info. for background directly
        // associated to germplasm (instead of using Pedigree table)
        stock.populateGermplasmSpeciesVariant( conn );
        
        stock.populateGermplasmTaxon( conn );

        stock.populateDonors( conn );

        stock.populateImages( conn );  
    }


}



