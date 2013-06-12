//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2006/01/18 00:12:17 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.SQLException;
import java.util.Comparator;
import java.util.Iterator;

import org.tair.abrc.catalog.category.MutantSeedGeneAliasComparator;
import org.tair.search.GeneModelLiteCollection;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGermplasmMapElement;

/**
 * GermplasmPolymorphism extends PolymorphismObject to contain data on a given
 * polymorphism in the context of its relationship to a given germplasm.
 * Specific join information, stored in the Germplasm_MapElement table is made
 * available in addition to all information in the super class
 * 
 * <p>
 * GermplasmPolymorphism also contains collections of polymorphism's associated
 * loci and gene models
 */

public class GermplasmPolymorphism extends PolymorphismObject {

    private TfcGermplasmMapElement germplasmMapElement;

    // loci for polymorphism - stored as Locus
    private LocusCollection loci;

    // genes for polymorphism - stored as GeneModelLite
    private GeneModelLiteCollection genes;

    /**
     * Creates an empty instance of GermplasmPolymorphism
     */
    public GermplasmPolymorphism() {
        germplasmMapElement = new TfcGermplasmMapElement();
    }

    /**
     * Creates an instance of GermplasmPolymorphism that reflects data for
     * submitted polymorphism_id in its relationship to submitted germplasm_id
     * as well as any loci associated to polymorphism
     * 
     * @param conn
     *            An active connection to the database
     * @param germplasm_id
     *            Germplasm id to retrieve data for
     * @param polymorphism_id
     *            Polymorphism id to retrieve data for
     * @throws SQLException
     *             thrown if a database error occurs, or if no record(s) found
     *             for submitted ids
     */
    public GermplasmPolymorphism( DBconnection conn,
                                 Long germplasm_id,
                                 Long polymorphism_id ) throws SQLException {

        super( conn, polymorphism_id );
        germplasmMapElement = new TfcGermplasmMapElement( conn,
                                                          germplasm_id,
                                                          get_map_element_id() );
        loci = new LocusCollection( conn, get_map_element_id() );

        // get genes for polymorphism -- get full name gene aliases for display
        // of gene on germplasm detail page
        genes = new GeneModelLiteCollection( conn,
                                             get_map_element_id(),
                                             "map_element" );
        genes.populateSymbols( conn );

        // sort symbols using custom comparator that sorts all "full name"
        // aliases before "alt full name" aliases - comparator written for
        // mutant seed category should already do this
        Comparator comparator = new SymbolComparator();
        genes.sortSymbols( comparator );
    }

    public Long get_germplasm_id() {
        return germplasmMapElement.get_germplasm_id();
    }

    public String get_genotype() {
        return germplasmMapElement.get_genotype();
    }

    public String get_segregation_ratio() {
        return germplasmMapElement.get_segregation_ratio();
    }

    /**
     * Determines if polymorphism has associated loci.
     * 
     * @return <code>true</code> if polymorphism has associated loci, or
     *         <code>false</code> if no loci associated to polymorphism
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves all loci associated to polymorphism
     * 
     * @return Loci associated to polymorphism as an <code>Iterator</code> of
     *         <code>Locus</code> objects, or <code>null</code> if no loci
     *         associated to polymorphism
     */
    public Iterator getLocus() {
        return hasLocus() ? loci.iterator() : null;
    }

    /**
     * Determines if polymorphism has associated genes.
     * 
     * @return <code>true</code> if polymorphism has associated genes, or
     *         <code>false</code> if no loci associated to polymorphism
     */
    public boolean hasGenes() {
        return ( genes != null && !genes.isEmpty() );
    }

    /**
     * Retrieves all genes associated to polymorphism
     * 
     * @return Genes associated to polymorphism as an <code>Iterator</code> of
     *         <code>GeneModelLite</code> objects, or <code>null</code> if
     *         no genes associated to polymorphism
     */
    public Iterator getGenes() {
        return hasGenes() ? genes.iterator() : null;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        if ( germplasmMapElement != null ) {
            germplasmMapElement.test();
        }

        if ( hasLocus() ) {
            loci.test();
        }

        if ( hasGenes() ) {
            genes.test();
        }

    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long germplasm_id = new Long( 3487 );
            Long polymorphism_id = new Long( 102586 );
            GermplasmPolymorphism germPoly = new GermplasmPolymorphism( conn,
                                                                        germplasm_id,
                                                                        polymorphism_id );
            germPoly.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
