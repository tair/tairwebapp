//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2005/09/14 16:21:09 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * NaturalAccessionSetCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the sets of natural 
 * accessions seed stock category.
 */

public class NaturalAccessionSetCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "natural_accession_set" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "natural_accession_set";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up the sets of natural 
     * accessions stock category.  SQL query will retrieve all stock ids 
     * that are associated to germplasms of type "set%" that are natural 
     * variants (have is_natural_variant set to true" where taxon is A. 
     * thaliana. Stocks are sorted alphabetically by donor last name and
     * stock number and null donors come last.
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
            "FROM Stock s JOIN " +
            "StockAvailabilityType sa ON s.stock_availability_type_id = sa.stock_availability_type_id JOIN " +
            "TairObject_Stock ts ON s.stock_id = ts.stock_id JOIN " +
            "Germplasm g ON ts.tair_object_id = g.tair_object_id JOIN " +
            "Taxon t ON g.taxon_id = t.taxon_id LEFT JOIN " +
            "Donor d ON ts.stock_id = d.stock_id LEFT JOIN " +
            "Community c ON d.community_id = c.community_id LEFT JOIN " +
            "Person pe ON c.community_id = pe.community_id " +
            "WHERE sa.stock_availability_type = " + TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND (c.is_obsolete = 'F' OR c.community_id IS NULL) " +
            "AND (c.status = " + TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " OR c.community_id IS NULL) " +
            "AND s.is_obsolete = 'F' " +
            "AND g.is_obsolete = 'F' " +
            "AND g.germplasm_type LIKE 'set%' " +
            "AND g.is_natural_variant = 'T' " +
            "AND t.scientific_name = 'Arabidopsis thaliana' " +
            "ORDER BY COALESCE(pe.last_name_uc, 'ZZZZZZZZZ'), " +
            "s.stock_number_prefix, " +
            "s.stock_number_suffix, " +
            "s.name";
        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on natural variant
     * sets  catalog page.  Associated data for natural variant sets includes 
     * germplasm and stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {

        stock.populateGermplasm( conn );
        stock.populateDonors( conn );
    }

}



