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
 * SetOfPoolsCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the sets of forward 
 * pools stock category
 */

public class SetOfPoolsCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "set_of_pools" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "set_of_pools";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up sets of pools
     * stock category. SQL query will retrieve all stock ids that
     * are associated to germplasms of type "set_of_pools".
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
	    "Donor d " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND s.is_obsolete = 'F' " +
            "AND s.is_seed = 'T' " +
	    "AND d.stock_id = s.stock_id " +
	    "AND d.community_id = 1501426537 " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND g.is_obsolete = 'F' " +
            "AND g.germplasm_type = 'set_of_pools' " +
	    "AND g.taxon_id = t.taxon_id " +    
            "AND t.scientific_name = 'Arabidopsis thaliana' ";

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on TDNA sets 
     * catalog page.  Associated data for sets of pools includes germplasm,
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
     * will sort items by stock name.
     *
     * @return Custom Comparator for sorting individual transposon stocks
     */
    protected Comparator getCustomComparator() {
        return new Comparator() {

	        public int compare( Object o1, Object o2 ) {

		    CatalogStock stock_1 = (CatalogStock) o1;
		    CatalogStock stock_2 = (CatalogStock) o2;
		    
		    int result = StockCompareUtils.compareStockNames(stock_1, stock_2);

		    return result;
		}

	};
    }

}



