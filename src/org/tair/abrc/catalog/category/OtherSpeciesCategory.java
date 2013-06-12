//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/09/16 22:08:38 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * OtherSpeciesCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the other species
 * seed stock category.
 */

public class OtherSpeciesCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "other_species" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "other_species";
    }
    

    /**
     * Implements abstract method defined in superclass to return SQL query 
     * to retrieve stock ids that make up other species stock category.  SQL 
     * query will retrieve all stock ids that are associated to germplasms that 
     * are natural variants (germplasms for species variants, where taxon is NOT 
     * A. thaliana or Brassica. Stocks are sorted alphabetically by taxon 
     * scientific name and species variant accession
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        String query = 
            "SELECT s.stock_id, sv.accession_number, t.scientific_name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
            "SpeciesVariant sv, " +
            "Taxon t " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND g.species_variant_id = sv.species_variant_id " +
            "AND g.taxon_id = t.taxon_id " +
            "AND s.is_obsolete = 'F' " +
            "AND g.is_obsolete = 'F' " +
	    //redundant w/table join to SpeciesVariant, but just in case...
            "AND g.is_natural_variant = 'T' " + 
            "AND t.scientific_name != 'Arabidopsis thaliana' " +
            "AND t.scientific_name NOT LIKE 'Brassica%' " +
            "ORDER BY t.scientific_name, sv.accession_number ";
        return query;
    }
    
    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on other species
     * catalog page.  Associated data for natural variants includes germplasm,
     * species variant directly linked to germplasm, images, stock donors
     * and taxon.
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
        
        stock.populateDonors( conn );
        stock.populateGermplasmTaxon( conn );
        stock.populateImages( conn );         
    }

}
