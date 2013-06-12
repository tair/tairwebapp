// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc.catalog.category;

import java.util.Comparator;
import java.util.Iterator;
import java.util.TreeSet;
import java.util.Set;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.community.ListCommunity;
import org.tair.querytools.*;
import org.tair.search.*;
import org.tair.tfc.*;

/**
 * Static class to hold stock compare methods for
 * easy reuse.
 */
public class StockCompareUtils {


    /**
     * Compare names of stocks' germplasms and returns results of
     * string comparison.
     * 
     * @param stock_1 Stock to compare against stock_2
     * @param stock_2 Stock to compare against stock_1
     * @return -1 if stock_1 should sort before stock_2, 1 if stock_2 should
     * sort before stock_1, or 0 if items are equal
     */
    public static int compareGermplasmNames( CatalogStock stock_1,
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



    /**
     * Compare names of stock donors.  If both stocks have donors, returns
     * result of string comparison between donor names. Otherwise, if one
     * stock has donors while other does not, stock without donors will be
     * sorted first. If both stocks do not have donors, method will return
     * items as equal.
     */
    public static int compareDonors( CatalogStock stock_1, CatalogStock stock_2 ) {

        int result = 0;

        // if both stocks have donors, return result
        // of string comparison between donor names
        if ( stock_1.hasDonors() && stock_2.hasDonors() ) {
            Iterator iter = stock_1.getDonors();
            ListCommunity donor_1 = (ListCommunity) iter.next();
            
            iter = stock_2.getDonors();
            ListCommunity donor_2 = (ListCommunity) iter.next();

            result = donor_1.getSortName().compareTo( donor_2.getSortName() );
            
            
            // else, sort stock w/out donors ahead of stock with donors
        } else if ( stock_1.hasDonors() && !stock_2.hasDonors() ) {
            result = 1;
            
        } else if ( !stock_1.hasDonors() && stock_2.hasDonors() ) {
            result = -1;
            
        } // if neither has donors, leave result as 0 (equal)

        return result;
    }


    /**
     * Compare donor stock numbers.  If both stocks have donors, returns
     * result of string comparison between donor stock number. Otherwise, if one
     * stock has donors while other does not, stock without donors will be
     * sorted first. If both stocks do not have donors, method will return
     * items as equal.
     */
    public static int compareDonorStockNumber( CatalogStock stock_1, CatalogStock stock_2 ) {

        int result = 0;

        // if both stocks have donors, return result
        // of string comparison between donor stock numbers
        if ( stock_1.hasDonors() && stock_2.hasDonors() ) {
	    Comparator c = new CaseInsensitiveNumberValueStringComparator();
            TreeSet<String> numbers_1 = new TreeSet(c);
            TreeSet<String> numbers_2 = new TreeSet(c);

	    numbers_1.addAll(stock_1.getDonorSockNumbers());
	    numbers_2.addAll(stock_2.getDonorSockNumbers());

	    Iterator<String> i1 = numbers_1.iterator();
	    Iterator<String> i2 = numbers_2.iterator();

	    while (i1.hasNext() && i2.hasNext() && result == 0) {
		result = c.compare(i1.next(), i2.next());
	    }

	    // sort stock with fewer donor numbers first if all
	    // other are equal.
	    if (result == 0 && numbers_1.size() < numbers_2.size()) {
		result = 1;
	    } else if (result == 0 && numbers_1.size() > numbers_2.size()) {
		result = -1;
	    }

        // sort stock w/out donors ahead of stock with donors
        } else if ( stock_1.hasDonors() && !stock_2.hasDonors() ) {
            result = 1;
            
        } else if ( !stock_1.hasDonors() && stock_2.hasDonors() ) {
            result = -1;
        } // if neither has donors, leave result as 0 (equal)

        return result;
    }




    /**
     * Compares descriptions of stocks' germplasms.  If both descriptions are
     * not null, result of string comparison between two descriptions is 
     * returned. If one description is null while other is not, null item will
     * be sorted first. If both descriptions are null, method will return items
     * as equal.
     */
    public static int compareDescription( CatalogStock stock_1, 
				    CatalogStock stock_2 ) 
    {
        int result = 0;

        Germplasm germplasm_1 = stock_1.getGermplasm();
        Germplasm germplasm_2 = stock_2.getGermplasm();

        String desc_1 = germplasm_1.get_description();
        String desc_2 = germplasm_2.get_description();
        
        if ( desc_1 != null && desc_2 != null ) {
            result = desc_1.compareTo( desc_2 );
            
            // sort null entry before non-null value
        } else if ( desc_1 == null && desc_2 != null ) {
            result = -1;

        } else if ( desc_1 != null && desc_2 == null ) {
            result = 1;
            
        } // else if both items null, leave result as zero for equality
        
        return result;
    }


    /**
     * Compares the names of stocks. If both stocks have non null names,
     * the result is a string comparison between the two. If one stock has
     * a non null name while the other does not, the stock with the null
     * name will be sorted first.
     */
    public static int compareStockNames( CatalogStock stock_1, CatalogStock stock_2 ) {

	int result = 0;

	String name_1 = stock_1.get_name();
	String name_2 = stock_2.get_name();

	if ( name_1 != null && name_2 != null ) {
	    result = name_1.compareTo(name_2);
	} else if ( name_1 != null && name_2 == null ) {
	    result = 1;
	} else if ( name_1 == null && name_2 != null ) {
	    result = -1;
	}

	return result;
    }


    /**
     * Compares the names of a stocks polymorphisms. If both stocks have polymorphisms,
     * the result is a string comparison of the polymorphism names (will these always be
     * ordered correctly if two stocks have the same polymorphisms?). If one stock has
     * polymorphisms while the other does not the stock without the polymorphism will come
     * first.
     */
    public static int comparePolymorphismNames( CatalogStock stock_1, CatalogStock stock_2 ) {

	int result = 0;

	Germplasm germplasm_1 = stock_1.getGermplasm();
	Germplasm germplasm_2 = stock_2.getGermplasm();

	if ( germplasm_1.hasPolymorphisms() && germplasm_2.hasPolymorphisms() ) {
	    String name_1 = germplasm_1.getPolymorphismsNameString();
	    String name_2 = germplasm_2.getPolymorphismsNameString();
	    result = name_1.compareTo(name_2);
	} else if ( germplasm_1.hasPolymorphisms() && !germplasm_2.hasPolymorphisms() ) {
	    result = -1;
	} else if ( !germplasm_1.hasPolymorphisms() && germplasm_2.hasPolymorphisms() ) {
	    result = 1;
	}

	return result;
    }



    /**
     * Compare names of germplasms' associated clones. If both germplasms have 
     * clones, returns  result of string comparison between clone names. 
     * Otherwise, if one germplasm has clones while other does not, stock 
     * without clones will be sorted first. If both stocks do not have clones,
     * method will return items as equal.
     */
    public static int compareClones( CatalogStock stock_1, CatalogStock stock_2 ) {
        int result = 0;

        Germplasm germplasm_1 = stock_1.getGermplasm();
        Germplasm germplasm_2 = stock_2.getGermplasm();

        // if both germplasms have clones, return result of string
        // comparison between clone names
	if ( germplasm_1.hasClones() && germplasm_2.hasClones() ) {
            Iterator iter = germplasm_1.getClones();
            Clone clone_1 = (Clone) iter.next();
            
            iter = germplasm_2.getClones();
            Clone clone_2 = (Clone) iter.next();
            
            result = clone_1.get_name().compareTo( clone_2.get_name() );
            
            // else sort stock w/out clones ahead of stock with clones
        } else if ( germplasm_1.hasClones() && !germplasm_2.hasClones() ) {
            result = 1;
            
        } else if ( !germplasm_1.hasClones() && germplasm_2.hasClones() ) {
            result = -1;
            
        } // if neither has clones, leave result as zero (equal)
    
        return result;
    }


    public static int compareCloneGeneNames( CatalogStock stock_1, CatalogStock stock_2 ) {
	int result = 0;

        Germplasm germplasm_1 = stock_1.getGermplasm();
        Germplasm germplasm_2 = stock_2.getGermplasm();
 
	if (germplasm_1.hasClones() && germplasm_2.hasClones()) {
	    Iterator clones_1 = germplasm_1.getClones();
	    Iterator clones_2 = germplasm_2.getClones();

	    Comparator c = new CaseInsensitiveNumberValueStringComparator();
	    TreeSet<String> aliases_1 = new TreeSet(c);
	    TreeSet<String> aliases_2 = new TreeSet(c);

	    insertClonesAliases(aliases_1, clones_1);
	    insertClonesAliases(aliases_2, clones_2);

	    Iterator<String> i1 = aliases_1.iterator();
	    Iterator<String> i2 = aliases_2.iterator();

	    while (i1.hasNext() && i2.hasNext() && result == 0) {
		result = c.compare(i1.next(), i2.next());
	    }

	    // sort stock with fewer aliases first if all
	    // other are equal.
	    if (result == 0 && aliases_1.size() < aliases_2.size()) {
		result = 1;
	    } else if (result == 0 && aliases_1.size() > aliases_2.size()) {
		result = -1;
	    }

        // sort stock w/out clones behind stocks with clones
        } else if ( germplasm_1.hasClones() && !germplasm_2.hasClones() ) {
            result = -1;
            
        } else if ( !germplasm_1.hasClones() && germplasm_2.hasClones() ) {
            result = 1;
            
        } // if neither has clones, leave result as zero (equal)
    
        return result;
    }


    private static void insertClonesAliases(Set s, Iterator clones) {

	while (clones != null && clones.hasNext()) { 
	    Clone clone = (Clone) clones.next();
	    Iterator genes = clone.getGenes();

	    while (genes != null && genes.hasNext()) {
		GeneModelLite gene = (GeneModelLite) genes.next();
		Iterator aliases = gene.getGeneAliases();
		while (aliases != null && aliases.hasNext()) {
		    TfcGeneAlias alias = (TfcGeneAlias) aliases.next();
		    s.add(alias.get_alias());
		}
	    }
	}
    }



    private static void addAll(Set s, Iterator i) {
	while (i != null && i.hasNext()) {
	    s.add(i.next());
	}
    }

}
