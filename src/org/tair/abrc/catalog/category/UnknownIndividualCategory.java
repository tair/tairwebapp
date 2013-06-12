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
 * UnknownIndividualCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the transposase
 * individual lines stock category
 */

public class UnknownIndividualCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "unknown_individ" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "unknown_individ";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up transposon individual 
     * lines stock category.  SQL query will retrieve all stock ids that
     * are associated to germplasms of type "individual line", with mutagen 
     * of 'null' where taxon is Arabidopsis thaliana and have a link to a
     * clone with insertion_type that is NOT transposase or transposon
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {

	String germplasms = 
	    "SELECT g.* " + 
	    "FROM Germplasm g, " +
	    "Taxon t " +
	    "WHERE g.is_obsolete = 'F' " + 
	    "AND g.has_foreign_dna = 'T' " + 
	    "AND g.germplasm_type = 'individual_line' " + 
	    "AND (g.mutagen IS NULL OR g.mutagen = 'unknown') " +
            "AND g.taxon_id = t.taxon_id " +
            "AND t.scientific_name = 'Arabidopsis thaliana' ";

	String stocks = 
	    "SELECT * " +
	    "FROM Stock s " +
	    "WHERE s.is_obsolete = 'F' " +
	    "AND s.is_seed = 'T' ";

	String bad_clones =
	    "SELECT * " +
	    "FROM Clone " +
	    "WHERE insert_type IS NOT NULL " +
	    "AND is_obsolete = 'F' " +
	    "AND insert_type IN ('transposase', 'transposon') ";

	String bad_stocks =
	    "Select distinct(s.stock_id) " +
	    "FROM (" + stocks + ") s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "(" + germplasms + ") g, " +	    
	    "Germplasm_MapElement gme, " +
	    "MapElement me, " +
	    "(" + bad_clones + ") c " +
	    "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id=g.tair_object_id " +
	    "AND g.germplasm_id=gme.germplasm_id " +
	    "AND gme.map_element_id=me.map_element_id " +
	    "AND me.tair_object_id=c.tair_object_id ";
	    

	String query = 
	    "Select distinct(s.stock_id) " +
	    "FROM (" + stocks + ") s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "(" + germplasms + ") g " +	    
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
	    "AND s.stock_id NOT IN ( " + bad_stocks + " ) ";

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

        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );

        stock.populateGermplasmPolymorphisms( conn );        

        // clone & vector data associated to germplasm (not stock)
        stock.populateGermplasmClone( conn ); 
        
        stock.populateDonors( conn );

        stock.populateImages( conn );
    }

    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items first by gener name, then by donor name, then by 
     * associated clone name and finaly by stock. This is done through 
     * Comparator instead of in SQL query since multiple joins
     * to both donor and clone slow the query to a crawl (and it's easy to
     * sort w/comparator).
     *
     * @return Custom Comparator for sorting individual transposon stocks
     */
    protected Comparator getCustomComparator() {
        return new Comparator() {

	    public int compare( Object o1, Object o2 ) {
		int result = 0;

		CatalogStock stock_1 = (CatalogStock) o1;
		CatalogStock stock_2 = (CatalogStock) o2;
		
		// sort by gene name
		result = StockCompareUtils.compareCloneGeneNames( stock_1, stock_2 );
		
		// if items are still equal after gene name,
		// check donors.
		if ( result == 0 ) {
		    result = StockCompareUtils.compareDonors( stock_1, stock_2 );
		}

		// if items are still equal after donors,
		// check clones
		if ( result == 0 ) {
		    result = StockCompareUtils.compareClones( stock_1, stock_2 );
		}
		
		// if items are still equal after clones,
		// check stock names
		if ( result == 0 ) {
		    result = StockCompareUtils.compareStockNames( stock_1, stock_2 );
		}
		
		return result;
	    }
	};
    }
}



