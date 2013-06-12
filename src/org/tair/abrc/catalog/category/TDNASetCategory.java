//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2005/09/14 16:21:09 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;
import java.util.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * TDNASetCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the TDNA
 * sets of pools and lines stock category
 */

public class TDNASetCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "tdna_set" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "tdna_set";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up TDNA sets of pools
     * and lines stock category.  SQL query will retrieve all stock ids that
     * are associated to germplasms of type "set_of_lines", with mutagen of 
     * "TDNA insertion". Stocks are sorted
     * alphabetically by donor name, number in set, and stock number
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {
        
        String query =
            "SELECT distinct (s.stock_id) " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
	    "Taxon t " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND s.is_obsolete = 'F' " +
            "AND s.is_seed = 'T' " +
            "AND g.is_obsolete = 'F' " +
            "AND g.germplasm_type = 'set_of_lines' " +
            "AND g.mutagen = 'T-DNA insertion' " +
	    "AND g.taxon_id = t.taxon_id " +    
            "AND t.scientific_name = 'Arabidopsis thaliana' ";

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on TDNA sets 
     * catalog page.  Associated data for TDNA sets includes germplasm,
     * species variants, clones for germplams and stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
	throws SQLException {

        stock.populateGermplasm( conn );

        // clone & vector data associated to germplasm (not stock)
        stock.populateGermplasmClone( conn ); 
        
        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );
      
        stock.populateDonors( conn );
    }

    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items first by donor name, then by associated clone name.  This
     * is done through Comparator instead of in SQL query since multiple joins
     * to both donor and clone slow the query to a crawl (and it's easy to
     * sort w/comparator).
     *
     * @return Custom Comparator for sorting individual transposon stocks
     */
    protected Comparator getCustomComparator() {
        return new TransposonIndividualComparator();
    }
}



