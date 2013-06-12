//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2005/09/14 16:21:08 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;
import java.util.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * UnknownIndividualTransposaseCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the transposase
 * individual lines stock category
 */

public class UnknownIndividualTransposaseCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "unknown_individ_transposase" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "unknown_individ_transposase";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up transposon individual 
     * lines stock category.  SQL query will retrieve all stock ids that
     * are associated to germplasms of type "individual line", with mutagen 
     * of 'null' where taxon is Arabidopsis thaliana and have a link to a
     * clone with insertion_type of transposase
     * Stocks are sorted manually by TransposonIndividualComparator by donor
     * last name and clone name
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {
        String query =
            "SELECT distinct(s.stock_id) " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
            "Taxon t, " +
	    "Germplasm_MapElement gme, " +
            "MapElement me, " +
            "Clone c " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND g.taxon_id = t.taxon_id " +
            "AND t.scientific_name = 'Arabidopsis thaliana' " +
            "AND s.is_obsolete = 'F' " +
            "AND s.is_seed = 'T' " +
            "AND g.is_obsolete = 'F' " +
            "AND g.germplasm_type = 'individual_line' " +
            "AND (g.mutagen IS NULL OR g.mutagen = 'unknown') " +
            "AND g.germplasm_id = gme.germplasm_id " +
            "AND gme.map_element_id = me.map_element_id " +
            "AND me.tair_object_id = c.tair_object_id " +
            "AND c.insert_type='transposase' ";

         return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on transposon 
     * individual lines catalog page.  Associated data for transposon lines 
     * includes germplasm, stock donors,images,  species variant (through 
     * pedigree), associated clone and vector info.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
	throws SQLException {

        stock.populateGermplasm( conn );

        stock.populateDonors( conn );

        // clone & vector data associated to germplasm (not stock)
        stock.populateGermplasmClone( conn ); 
        
        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );

        stock.populateImages( conn );
    }

    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items first by donor name, then by associated clone name then
     * by the donor stock number.
     *
     * @return Custom Comparator for sorting individual transposon stocks
     */
    protected Comparator getCustomComparator() {
        return new Comparator () {
	    public int compare( Object o1, Object o2 ) {
		CatalogStock stock_1 = (CatalogStock) o1;
		CatalogStock stock_2 = (CatalogStock) o2;   
		
		int result = 0;

		// sort by donor names
		result = StockCompareUtils.compareDonors(stock_1, stock_2);
		
		// then sort by clone names
		if (result == 0) {
		    result = StockCompareUtils.compareClones(stock_1, stock_2);
		}

		// then sort by the donor stock number
		if (result == 0) {
		    result = StockCompareUtils.compareDonorStockNumber(stock_1, stock_2);
		}
		
		return result;
	    }
	};
    }
}



