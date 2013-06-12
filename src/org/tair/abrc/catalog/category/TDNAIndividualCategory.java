//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2005/09/14 16:21:09 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.SQLException;
import java.util.Comparator;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.TextConverter;

/**
 * TDNAIndividualCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the individual TDNA
 * lines stock category
 */

public class TDNAIndividualCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "tdna_individ" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "tdna_individ";
    }
    

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up individual TDNA
     * lines stock category.  SQL query will retrieve all stock ids that
     * are associated to germplasms of type "individual_line", with mutagen 
     * of "TDNA insertion", taxon of Arabidopsis thaliana, without a link
     * to polymorphism, that are not SALK stocks, not SAIL germplasms
     * and that are not members of sets or follow up stocks. Stocks are 
     * sorted manually be TDNAIndividualComparator by donor name, associated
     * clone name and germplasm description.
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {


        String criteria = 
            "CONFIRMED LINE ISOLATED FROM ORIGINAL";
   
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
	    "AND g.taxon_id = t.taxon_id " +    
            "AND t.scientific_name = 'Arabidopsis thaliana' " + 
            "AND g.germplasm_type = 'individual_line' " +
            "AND s.is_obsolete = 'F' " +
            "AND s.is_seed = 'T' " +
            "AND g.mutagen = 'T-DNA insertion' " +
            "AND (g.has_polymorphisms IS NULL OR g.has_polymorphisms = 'F') " +

            "AND UPPER(s.name) NOT LIKE 'SALK%' " +
	    "AND UPPER(g.name) NOT LIKE 'SAIL%' " +
	    "AND UPPER(g.name) NOT LIKE 'WISCDSLOX%' " +

	    "AND (g.description IS NULL OR UPPER(g.description) NOT LIKE '%" + criteria + "%' ESCAPE '\\\') " +
            "AND g.is_obsolete = 'F' " +

            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
	    "AND d.stock_id = s.stock_id " +
	    "AND d.community_id != 6272 " +
	    
            "AND s.stock_id NOT IN ( " +
                "SELECT ts.stock_id " +
                "FROM TairObject_Stock ts " +
                "WHERE ts.stock_id = s.stock_id " +
                "AND ( ts.relationship_type = 'member_of_set' " +
                      "OR ts.relationship_type = 'follow_up' ) " +
		      ") "; 

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on individual TDNA
     * lines catalog page.  Associated data includes germplasm, species variants, 
     * clones for germplams, images and stock donors
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

        stock.populateImages( conn );
    }

    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items first by donor name, then by associated clone name then
     * by donor stock number.
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



