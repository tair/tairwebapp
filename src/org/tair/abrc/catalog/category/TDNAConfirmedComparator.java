// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc.catalog.category;

import java.util.Comparator;
import java.util.Iterator;

import org.tair.abrc.catalog.CatalogStock;

import org.tair.querytools.Germplasm;
import org.tair.querytools.GermplasmPolymorphism;
import org.tair.querytools.Locus;

/**
 * TDNAConfirmedComparator is a custom comparator for sorting CatalogStock 
 * elements within the confirmed TDNA lines category. This comparator is used
 * to manually sort stocks in this category by lowest associated locus name,
 * then by germplasm name.
 */

public class TDNAConfirmedComparator implements Comparator {

    /**
     * Compares two CatalogStock objects to sort them by locus name, then
     * by germplasm name.
     *
     * @param o1 Object to compare against object 2
     * @param 02 Object to campare against object 1
     * @return -1 if o1 should sort before o2, 1 if o2 should
     * sort before o1, or 0 if items are equal
     */
    public int compare( Object o1, Object o2 ) {
        int result = 0;

        CatalogStock stock_1 = (CatalogStock) o1;
        CatalogStock stock_2 = (CatalogStock) o2;

        // sort by associated locus
        result = compareLoci( stock_1, stock_2 );

        // if items are still equal after locus comparison
        // check germplasm name
        if ( result == 0 ) {
            result = compareGermplasmNames( stock_1, stock_2 );
        }

        return result;
    }

    

    /**
     * Compare names of loci associated to stock. If both stocks have loci,
     * returns result of string comparison between "lowest" locus (i.e. first
     * alphabetically). Otherwise, if one stock has loci while other does not,
     * stock without loci will be sorted first. If both stocks do not have loci
     * method will return items as equal.
     *
     * @param stock_1 Stock to compare against stock_2
     * @param stock_2 Stock to compare against stock_1
     * @return -1 if stock_1 should sort before stock_2, 1 if stock_2 should
     * sort before stock_1, or 0 if items are equal
     */
    private int compareLoci( CatalogStock stock_1, CatalogStock stock_2 ) {

        int result = 0;

        // if both stocks have loci, return result
        // of string comparison between "lowest" locus name for each
        Locus locus_1 = getSortableLocus( stock_1 );
        Locus locus_2 = getSortableLocus( stock_2 );
        if ( locus_1 != null && locus_2 != null ) {
            result = locus_1.get_name().compareTo( locus_2.get_name() );
            
            // else, sort stock with loci ahead of stock with loci
        } else if ( locus_1 != null && locus_2 == null ) {
            result = -1;
            
        } else if ( locus_1 == null && locus_2 != null ) {
            result = 1;
            
        } // if neither has loci, leave result as 0 (equal)

        return result;
    }

    /**
     * Retrieves locus associated to stock that should be used for
     * sorting by locus name.  Locus for stock is actually retrieved
     * by getting loci assorted to polymorphisms assorted to germplasm
     * of stock. Since there may be multiple loci for stock, this method
     * will return the locus with the name that sorts lowest alphabetically.
     * 
     * @param stock Stock to retrieve sortable locus for
     * @return Locus to use for sorting stock by locus name or null if
     * stock has no associated loci
     */
    private Locus getSortableLocus( CatalogStock stock ) {
        Locus lowestLocus = null;
        
        Germplasm germplasm = stock.getGermplasm();
        
        if ( germplasm.hasPolymorphisms() ) {
            for ( Iterator iter = germplasm.getPolymorphisms();
                  iter.hasNext(); ) {
                GermplasmPolymorphism poly = (GermplasmPolymorphism) iter.next();
                if ( poly.hasLocus() ) {
                    for ( Iterator locusIter = poly.getLocus();
                          locusIter.hasNext(); ) {
                        Locus locus = (Locus) locusIter.next();
                        String name = locus.get_name();
                        
                        if ( lowestLocus == null ||
                             lowestLocus.get_name().compareTo( name ) == 1 ) {
                            lowestLocus = locus;
                        }
                    }
                }
            }
        }
        return lowestLocus;
    }
    

    /**
     * Compare names of stocks' germplasms and returns results of
     * string comparison.
     * 
     * @param stock_1 Stock to compare against stock_2
     * @param stock_2 Stock to compare against stock_1
     * @return -1 if stock_1 should sort before stock_2, 1 if stock_2 should
     * sort before stock_1, or 0 if items are equal
     */
    private int compareGermplasmNames( CatalogStock stock_1,
                                       CatalogStock stock_2 ) 
    {
        int result = 0;

        Germplasm germplasm_1 = stock_1.getGermplasm();
        Germplasm germplasm_2 = stock_2.getGermplasm();
        String name_1 = germplasm_1.get_name();
        String name_2 = germplasm_2.get_name();

        result = name_1.compareTo( name_2 );

        return result;
    }


}
