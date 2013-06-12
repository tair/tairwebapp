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
 * OtherMutantCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the other mutant
 * lines stock category
 */

public class OtherMutantCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "other_mutant" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "other_mutant";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up other mutant lines
     * stock category.  SQL query will retrieve all stock ids that
     * are associated to germplasms that do not have associated polymorphisms,
     * with taxon of Arabidopsis thaliana, with germplasm type of
     * individual_line, ploidy of 2, with germplasm is_mutant flag set to
     * true, and is_mapping flag set to false. Stocks cannot be linked
     * to another stock with relationship type of "member_of_set", and
     * must not have been donated by Kranz or Redei.
     * 
     * <p>
     * Stocks are sorted by germplasm description
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {

        String query =
            "SELECT s.stock_id, g.description " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
            "Taxon t, " +
            "Donor d, " +
            "Community c, " +
            "Person pe " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND g.taxon_id = t.taxon_id " +
            "AND s.stock_id = d.stock_id " +
            "AND ts.stock_id = d.stock_id " +
            "AND d.community_id = c.community_id " +
            "AND c.community_id = pe.community_id " +
            "AND d.community_id = pe.community_id " +
            "AND c.is_obsolete = 'F' " +
            "AND c.status = " +
            TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " " +
            "AND s.is_seed = 'T' " +
            "AND s.is_obsolete = 'F' " +
            "AND g.is_obsolete = 'F' " +
            "AND (g.is_mapping_strain = 'F' OR g.is_mapping_strain IS NULL) " +
            "AND g.is_mutant = 'T' " +
            "AND (g.has_polymorphisms = 'F' OR g.has_polymorphisms IS NULL)" +
            "AND g.ploidy = '2' " +
            "AND g.germplasm_type = 'individual_line' " +
            "AND pe.last_name_uc != 'KRANZ' " +
            "AND pe.last_name_uc != 'REDEI' " +
            "AND s.stock_id NOT IN ( " +
            "SELECT ts.stock_id " +
            "FROM TairObject_Stock ts " +
            "WHERE ts.stock_id = s.stock_id " +
            "AND ts.relationship_type = 'member_of_set' " +
            ") " +
            "ORDER BY g.description ";

        return query;
    }


    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on other mutant 
     * catalog page.  Associated data for other mutants includes germplasm,
     * species variants, images and stock donors
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

        stock.populateImages( conn );
    }

    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items first by donor name, then by stock name.  
     *
     * @return Custom Comparator for sorting individual transposon stocks
     */
    protected Comparator getCustomComparator() {
	return new Comparator  () {
	    
	    public int compare( Object o1, Object o2 ) {
		int result = 0;
		
		CatalogStock stock_1 = (CatalogStock) o1;
		CatalogStock stock_2 = (CatalogStock) o2;
		
		// sort by donor
		result = StockCompareUtils.compareDonors( stock_1, stock_2 );
				
		// if items are still equal after clone
		// check donor stock number.
		if ( result == 0 ) {
		    result = StockCompareUtils.compareDonorStockNumber( stock_1, stock_2 );
		}
		
		return result;
	    }
	};
    }

}



