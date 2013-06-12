// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc.catalog.category;

import java.util.Comparator;
import java.util.Iterator;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.community.ListCommunity;
import org.tair.querytools.*;

/**
 * TransposonIndividualComparator is a custom comparator for sorting 
 * CatalogStock elements within the transposon_individ category. This
 * comparator is used to manually sort stocks in this category by donor
 * last name and by name of clone associated to stock's germplasm.  This
 * comparator is used instead of an ORDER BY in the category's SQL query
 * since joining to donor and clone slows retrieval of items greatly.
 */

public class TransposonIndividualComparator implements Comparator {

    /**
     * Compares two CatalogStock objects to sort them by donor name, then
     * by associated clone name (for clones associated to stock's germplasm).
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

        ListCommunity donor_1 = null;
        ListCommunity donor_2 = null;

        Iterator iter = null;

        // if both stocks have donors, return result
        // of string comparison between donor names
        if ( stock_1.hasDonors() && stock_2.hasDonors() ) {
            iter = stock_1.getDonors();
            donor_1 = (ListCommunity) iter.next();
            
            iter = stock_2.getDonors();
            donor_2 = (ListCommunity) iter.next();

            result = donor_1.getSortName().compareTo( donor_2.getSortName() );
            
            
            // else, sort stock w/out donors ahead of stock with donors
        } else if ( stock_1.hasDonors() && !stock_2.hasDonors() ) {
            result = 1;
            
        } else if ( !stock_1.hasDonors() && stock_2.hasDonors() ) {
            result = -1;
            
        } // if neither has donors, leave result as 0 (equal)
        
        
        // if items are still equal after donor comparison, check clone name.
        if ( result == 0 ) {
            Germplasm germplasm_1 = stock_1.getGermplasm();
            Germplasm germplasm_2 = stock_2.getGermplasm();

            Clone clone_1 = null;
            Clone clone_2 = null;
            
            // if both germplasms have clones, return result of string
            // comparison between clone names
            if ( germplasm_1.hasClones() && germplasm_2.hasClones() ) {
                iter = germplasm_1.getClones();
                clone_1 = (Clone) iter.next();
                
                iter = germplasm_2.getClones();
                clone_2 = (Clone) iter.next();
                
                result = clone_1.get_name().compareTo( clone_2.get_name() );
                
                // else sort stock w/out clones ahead of stock with clones
            } else if ( germplasm_1.hasClones() && !germplasm_2.hasClones() ) {
                result = 1;
                
            } else if ( !germplasm_1.hasClones() && germplasm_2.hasClones() ) {
                result = -1;

            } // if neither has clones, leave result as zero (equal)
        }
        
        return result;
    }
    
}
