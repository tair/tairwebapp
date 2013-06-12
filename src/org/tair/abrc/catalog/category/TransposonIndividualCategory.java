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
 * TransposonIndividualCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the transposon
 * individual lines stock category
 */

public class TransposonIndividualCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "transposon_individ" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "transposon_individ";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up transposon individual 
     * lines stock category.  SQL query will retrieve all stock ids that
     * are associated to germplasms of type "individual line", with mutagen 
     * of "transposon insertion" where taxon is Arabidopsis thaliana and who
     * dont have a donor of 'Chromatin Charting Project' or 'John Innes Centre'. 
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
            "Taxon t " +
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
            "AND g.mutagen = 'transposon insertion' " +
	    "AND s.stock_id NOT IN ( " +
	        "SELECT d.stock_id " +
	        "FROM Donor d " +
	         "WHERE d.stock_id = s.stock_id " +
	         "AND d.community_id IN (1501425708, 10565) ) " +
            "AND s.stock_id NOT IN ( " +
                "SELECT ts.stock_id " +
                "FROM TairObject_Stock ts " +
                "WHERE ts.stock_id = s.stock_id " +
                "AND ts.relationship_type = 'member_of_set' " +
            ") ";

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

        stock.populateGermplasmPolymorphisms( conn );        

        // clone & vector data associated to germplasm (not stock)
        stock.populateGermplasmClone( conn ); 

        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );

        stock.populateImages( conn );
    }

    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items first by donor name, then by donor stock number. 
     *
     * @return Custom Comparator for sorting individual transposon stocks
     */
    protected Comparator getCustomComparator() {

	return new Comparator() {
	
	    public int compare( Object o1, Object o2 ) {
		int result = 0;
		
		CatalogStock stock_1 = (CatalogStock) o1;
		CatalogStock stock_2 = (CatalogStock) o2;

		// sort by donor
		result = StockCompareUtils.compareDonors( stock_1, stock_2 );

		// sort by donor stock number
		if (result == 0) {
		    result = StockCompareUtils.compareDonorStockNumber( stock_1, stock_2 );
		}

		return result;
	    }  
	};

    }

}



