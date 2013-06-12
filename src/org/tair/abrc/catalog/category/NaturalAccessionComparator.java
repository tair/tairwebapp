// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc.catalog.category;

import java.util.Comparator;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.TfcSpeciesVariant;

/**
 * NaturalAccessionComparator is a custom comparator for sorting CatalogStock 
 * elements within the natural_accession category.  This comparator is used 
 * in combination with the ORDER BY statement of the SQL statement that 
 * retrieves stock ids for the category.  SQL statement will order elements
 * by their associated species variant base name and accession, however because
 * this sorting is done alphanumerically, variants with numeric base names
 * like "9354" will sort before Aa.  This comparator will manually sort
 * all numeric names after the all character names. It will only sort in
 * the case where one element has a numeric name and other has a character
 * name.  If both are numeric or both character, compare method will return
 * 0, or that the two elements are equal, which will leave them in the
 * same order in the collection, as determined by the original SQL statement
 */

public class NaturalAccessionComparator implements Comparator {

    /**
     * Compares two CatalogStock objects to sort them by species variant
     * abbreviated name.  This method will only change the sort order
     * of submitted elements if one has an abbreviated name that begins
     * with a number, while the other has a character.  In this case,
     * the numeric entry will always sort after the character entry.
     * If two elements are the same type, (i.e. both numeric or both
     * character), method will return 0, or that elements are equal.
     * This has the effect of leaving elements in the original order
     * that they were sorted in from the database
     *
     * @return -1 if o1 should sort before o2, 1 if o2 should
     * sort before o1, or 0 if items are equal
     */
    public int compare( Object o1, Object o2 ) {
        CatalogStock stock_1 = (CatalogStock) o1;
        CatalogStock stock_2 = (CatalogStock) o2;
        
        TfcSpeciesVariant specVar = stock_1.getSpeciesVariant();
        String variantName_1 = specVar.get_abbrev_name();
        
        specVar = stock_2.getSpeciesVariant();
        String variantName_2 = specVar.get_abbrev_name();
        
        int result = 0;
        if ( variantName_1 != null && variantName_2 != null ) {
            char firstChar_1 = variantName_1.charAt( 0 );
            char firstChar_2 = variantName_2.charAt( 0 );
            
            boolean isDigit_1 = Character.isDigit( firstChar_1 );
            boolean isDigit_2 = Character.isDigit( firstChar_2 );
            
            // if one element has numeric name and other has character
            // name, make sure to sort character first (opposite of what db 
	    // will do)
            if ( isDigit_1 && !isDigit_2 ) {
                result = 1;
                
            }  else if ( !isDigit_1 && isDigit_2 ) {
                result = -1;
            }
        }
        return result;
    }
    
}
