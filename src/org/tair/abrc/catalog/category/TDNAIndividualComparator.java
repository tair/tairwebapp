//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//------------------------------------------------------------------------------
package org.tair.abrc.catalog.category;

import java.util.Comparator;
import java.util.Iterator;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.community.ListCommunity;
import org.tair.querytools.*;

/**
 * TDNAIndividualComparator is a custom comparator for sorting CatalogStock 
 * elements within the individual TDNA lines category. This comparator is used
 * to manually sort stocks in this category by donor last name, by name of
 * clone associated to stock's germplasm, then by germplasm description.  This 
 * comparator is used instead of an ORDER BY in the category's SQL query since 
 * joining to donor and clone slows retrieval of items greatly.
 */

public class TDNAIndividualComparator implements Comparator {

    /**
     * Compares two CatalogStock objects to sort them by donor name, then
     * by associated clone name (for clones associated to stock's germplasm),
     * then by germplasm description.
     *
     * <p>
     * Stocks may have multiple donors as well as associated clones. Since both
     * of those collections should be sorted alphabetically, this comparator 
     * will use the first element retrieved from each of these collections for 
     * sorting.
     *
     * @return -1 if o1 should sort before o2, 1 if o2 should
     * sort before o1, or 0 if items are equal
     */
    public int compare( Object o1, Object o2 ) {
        int result = 0;

        CatalogStock stock_1 = (CatalogStock) o1;
        CatalogStock stock_2 = (CatalogStock) o2;

        // sort by donor name
        result = StockCompareUtils.compareDonors( stock_1, stock_2 );

        // if items are still equal after donor comparison,
	// check clone name.
        if ( result == 0 ) {
            result = StockCompareUtils.compareClones( stock_1, stock_2 );
        }

        // if items still equal after clone comparison, check
	// germplasm description
        if ( result == 0 ) {
            result = StockCompareUtils.compareDescription( stock_1, stock_2 );
        }

        return result;
    }

    

}
