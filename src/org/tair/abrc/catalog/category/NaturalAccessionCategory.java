//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2004/09/16 22:08:38 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;
import java.util.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * NaturalAccessionCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the natural accession
 * seed stock category.
 */

public class NaturalAccessionCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "natural_accession" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "natural_accession";
    }
    
    /**
     * Implements abstract method defined in superclass to return SQL query
     * to retrieve stock ids that make up natural accession stock category.
     * SQL query will retrieve all stock ids that are associated to germplasms
     * that are natural variants (germplasms for species variants, where taxon
     * is A. thaliana and germplasm type is 'individual_line'. Stocks are 
     * sorted alphabetically by species variant base name, accession and donor
     * last name.
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        String query = 
            "SELECT s.stock_id, " +
	    "sv.base_name, "+
	    "sv.sort_accession, " +
	    "sv.abbrev_name, " +
	    "pe.last_name_uc " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
            "SpeciesVariant sv, " +
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
            "AND g.species_variant_id = sv.species_variant_id " +
            "AND g.taxon_id = t.taxon_id " +
	    "AND s.stock_id = d.stock_id " +
	    "AND d.community_id = c.community_id " +
	    "AND c.community_id = pe.community_id " +
	    "AND d.community_id = pe.community_id " +
	    "AND c.is_obsolete = 'F' " +
	    "AND c.status = " +
	    TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " " +
            "AND s.is_obsolete = 'F' " +
            "AND g.is_obsolete = 'F' " +
            "AND g.germplasm_type = 'individual_line' " +
            // redundant w/table join to SpeciesVariant, but just in case...
            "AND g.is_natural_variant = 'T' " + 
            "AND t.scientific_name = 'Arabidopsis thaliana' " +
            "ORDER BY " +
            "UPPER( sv.base_name ), " +
            "sv.sort_accession, " +
            "sv.abbrev_name, " +
	    "pe.last_name_uc ";

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on natural variant
     * catalog page.  Associated data for natural variants includes germplasm,
     * species variant directly linked to germplasm, images, stock donors and 
     * single plant progeny (child germplasms associated to germplasm through
     * Pedigree with single plant selection as generative method
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
        
	// get single plant progeny for natural variant by populating
	// child germplasm collection with single plant selection 
	// as generative method
	stock.populateGermplasmChildren( conn, "single_plant_selection" );

        stock.populateDonors( conn );

        stock.populateImages( conn );   


    }


    /**
     * Creates display values for hyperlinks that allow user to scroll through
     * catalog pages. This method overrides the superclass implementation to
     * return the species variant abbreviated names of the first and last stocks
     * shown on a given page. These values are displayed instead of simple page 
     * numbers, as in superclass implementation.
     *
     * @param stocks All stocks for category
     * @totalPages Total number of catalog pages needed to display stocks
     * @return Map containing each page number as an <code>Integer</code> key
     * referencing a <code>String</code> value to use when displaying scrolling 
     * hyperlinks
     */
    protected Map getPageLabels( CatalogStock[] stocks, int totalPages ) {
        HashMap labels = new HashMap();

        // Get subset of stocks shown on each page and get first and last values.
	// This retrieval of page subset results in a duplication of work, since
        // subsets are retrieved again as part of createPageCollection method in
        // superclass, however the operations can't be combined effectively 
	// (since labels need to have already been created by the time this 
	// subset is created in createPageCollection) - performance impact 
	// should be neglible and unimportant, since this happens only during 
	// catalog population and not during runtime retrieval
        for ( int i = 1; i <= totalPages; i++ ) {
            ScrollParams scrollParams = 
		ScrollCalculator.getScrollParams( i, getPageSize() ) ;
            CatalogStock[] pageStocks = getArraySlice( stocks, scrollParams );
            String startEnd = getStartEndNames( pageStocks );
            Integer pageNumber = new Integer( i );
            labels.put( pageNumber, startEnd );
        }
        return labels;
    }

    /**
     * Utility method to retrieve the species variant base names of the
     * first and last stocks on a given catalog page.  
     *
     * @param stocks Stocks to show on a single catalog page
     * @return String containing species variant base names for the first
     * and last stocks in stocks array; two names are separated by a "-"
     */
    private String getStartEndNames( CatalogStock[] stocks ) {
        StringBuffer names = new StringBuffer();

        TfcSpeciesVariant specVar = stocks[ 0 ].getSpeciesVariant();
        names.append( specVar.get_base_name() + "-" );

        int lastIndex = stocks.length - 1;
        specVar = stocks[ lastIndex ].getSpeciesVariant();
        names.append( specVar.get_base_name() );

        return names.toString();
    }


    /**
     * Retrieves an instance of the custom Comparator to use for sorting natural
     * accession stock entries.  This Comparator is used in combination with the
     * ORDER BY logic in SQL statement for stock category to ensure that species
     * variants with numeric abbreviated names (e.g. 9481) are sorted after all 
     * abbreviated names with alphabetic characters.   This is done to override 
     * the SQL sorting that lists these items first, before Aa.
     *
     * @return Comparator to further sort natural accession stocks after they 
     * have already been put into rough order by SQL query that retrieves stocks
     * in category.
     */
    protected Comparator getCustomComparator() {
        return new NaturalAccessionComparator();
    }
           



}



