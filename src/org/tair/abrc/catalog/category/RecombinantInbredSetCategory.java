//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2005/09/14 16:21:09 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * RecombinantInbredSetCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the sets of recombinant
 * inbred lines stock category
 */

public class RecombinantInbredSetCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "recombinant_inbred_set" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "recombinant_inbred_set";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up sets of recombinant 
     * inbred lines stock category.  SQL query will retrieve all stock ids 
     * that are associated to germplasms of type "set%", where is mapping
     * strain is true, and where germplasm name is not CS8994.
     * Stocks are sorted alphabetically by donor name and stock number
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
            "AND ts.stock_id = d.stock_id " +
            "AND d.community_id = c.community_id " +
            "AND c.community_id = pe.community_id " +
            "AND d.community_id = pe.community_id " +
            "AND c.is_obsolete = 'F' " +
            "AND c.status = " + 
            TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " " +
            "AND s.is_obsolete = 'F' " +
            "AND s.is_seed = 'T' " +
            "AND g.is_obsolete = 'F' " +
            "AND g.germplasm_type LIKE 'set%' " +
            "AND g.is_mapping_strain = 'T' " +
            "AND g.name != 'CS8994' " +
            "ORDER BY pe.last_name_uc, " +
	    "s.stock_number_prefix, " +
	    "s.stock_number_suffix, " +
	    "s.name "; 

        return query;
    }


    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on sets of 
     * recombinant inbred lines catalog page.  Associated data for sets includes
     * germplasm, species variants through pedigree, stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {

        stock.populateGermplasm( conn );

        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );
      
        stock.populateDonors( conn );
    }
}



