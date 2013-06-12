//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/01/21 23:36:13 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.search.*;
import org.tair.tfc.*;


/**
 * Class to represent germplasm information in terms of how the germplasm
 * relates to another germplasm through the Pedigree table.  In addition the
 * join info between parent and child, Pedigree contains germplasm info for 
 * either the parent or child (though not both).  This is practical since 
 * this class will always be used to show data for a germplasm
 * in relation to a known other germplasm (such as the record in Germplasm detail),
 * making having both germplasms' data redundant.
 */

public class Pedigree extends TfcPedigree {

    private TfcGermplasm germplasm;
    private boolean isParent;

    // Basic info. on species variants associated to germplasm through
    // directly or indirectly through Pedigree. This collection must be 
    // explicitly populated using the populatePedigreeSpeciesVariant method
    private PedigreeSpeciesVariantCollection pedigreeSpeciesVariants;


    // Polymorphisms associated to germplasm - stored
    // as PolymorphismLite objects.  This collection must
    // be explicitly populated using the populatePolymorphisms
    // method
    private PolymorphismLiteCollection polymorphisms;


    // Collection of loci associated to polymorphisms associated to 
    // germplasm - stored as Locus objects. This collection must be
    // explicitly populated using the populateLocus method
    private LocusCollection loci;


    /**
     * Creates an instance of Pedigree that represents pedigree data for the
     * submitted germplasm ids as well as germplasm and species variant data
     * for either parent or child id, as flagged by isParent
     *
     * @param conn An active connection to the database
     * @param parent_germplasm_id Parent id to retrieve data for
     * @param child_germplasm_id Child id to retrieve data for
     * @param isParent If <code>true</code> germplasm and species variant info
     * is retrieved for parent_germplasm_id; if <code>false</code> data is retrieved
     * for child_germplasm_id
     * @throws SQLException thrown if a database error occurs, or if no record found 
     * for parent and child ids
     */
    public Pedigree( DBconnection conn,
                     Long parent_germplasm_id, 
                     Long child_germplasm_id, 
                     boolean isParent ) 
        throws SQLException {

        super( conn, parent_germplasm_id, child_germplasm_id ); 
        this.isParent = isParent;

        if ( isParent ) {
            populateGermplasm( conn, parent_germplasm_id );
        } else {
            populateGermplasm( conn, child_germplasm_id );
        }
    }

    /**
     * Retrieve germplasm data for either parent or child germplasm
     */
    private void populateGermplasm( DBconnection conn, Long germplasm_id ) throws SQLException {

        // need to translate germplasm id to tair object id for TfcGermplasm's constructor
        Long tairObjectID = TfcGermplasm.retrieveTairObjectID( conn, germplasm_id );
        germplasm = new TfcGermplasm( conn, tairObjectID );
    }


    /**
     * Determines if germplasm info is for parent or child in Pedigree relationship
     * 
     * @return <code>true</code> if germplasm data is for parent germplasm, 
     <code>false</code> if data is for child germplasm
     */
    public boolean isParent() { 
        return isParent; 
    }


    // TfcGermplasm wrappers
    public Long get_germplasm_tair_object_id() {
        return ( germplasm != null ) ? germplasm.get_tair_object_id() : null; 
    }

    public String get_germplasm_name() { 
        return ( germplasm != null ) ? germplasm.get_name() : null; 
    }

    public Boolean get_has_foreign_dna() { 
        return ( germplasm != null ) ? germplasm.get_has_foreign_dna() : null; 
    }

    public Boolean get_is_mutant() { 
        return ( germplasm != null ) ? germplasm.get_is_mutant() : null; 
    }

    public Boolean get_has_polymorphisms() { 
        return ( germplasm != null ) ? germplasm.get_has_polymorphisms() : null; 
    }

    public Boolean get_is_natural_variant() { 
        return ( germplasm != null ) ? germplasm.get_is_natural_variant() : null; 
    }

    public Boolean get_is_mapping_strain() { 
        return ( germplasm != null ) ? germplasm.get_is_mapping_strain() : null; 
    }

    public String get_special_growth_conditions() { 
        return ( germplasm != null ) ? germplasm.get_special_growth_conditions() : null; 
    }

    public String get_ploidy() { 
        return ( germplasm != null ) ? germplasm.get_ploidy() : null; 
    }

    public String get_mutagen() { 
        return ( germplasm != null ) ? germplasm.get_mutagen() : null; 
    }

    public String get_germplasm_description() { 
        return ( germplasm != null ) ? germplasm.get_description() : null; 
    }

    public Boolean get_is_aneuploid() { 
        return ( germplasm != null ) ? germplasm.get_is_aneuploid() : null; 
    }

    public Integer get_aneuploid_chromosome() { 
        return ( germplasm != null ) ? germplasm.get_aneuploid_chromosome() : null; 
    }

    public Long get_species_variant_id() {
        return ( germplasm != null ) ? germplasm.get_species_variant_id() : null;
    }
    

    /**
     * Populates collection of loci for parent or child germplasm represented by
     * this object.  Since germplasms are not directly linked to locus, this is 
     * done by retrieving distinct loci associated to polymorphisms associated 
     * to germplasm. Parent vs. child germplasm is decided according to the
     * value for isParent submitted in object's constructor.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateLocus( DBconnection conn ) throws SQLException {
        Long id = isParent ? get_parent_germplasm_id() : get_child_germplasm_id();
        this.loci = new LocusCollection( conn, id, "germplasm" );
    }


    /**
     * Determines if germplasm represented by this object has associated 
     * locus data.
     *
     * @return <code>true</code> if germplasm has associated loci, or <code>false</code>
     * if no loci associated to germplasm
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves loci associated to polymorphisms associated to germplasm
     *
     * @return Loci associated to germplasm as an <code>Iterator</code> of
     * <code>Locus</code> objects or <code>null</code> if no loci associated
     * to germplasm
     */
    public Iterator getLocus() {
        return hasLocus() ? loci.iterator() : null;
    }


    /**
     * Populates collection of polymorphisms for parent or child germplasm represented 
     * by this object. Parent vs. child germplasm is decided according to the value 
     * for isParent submitted in object's constructor.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populatePolymorphisms( DBconnection conn ) throws SQLException {
        Long id = isParent ? get_parent_germplasm_id() : get_child_germplasm_id();
        polymorphisms = new PolymorphismLiteCollection( conn, id, "germplasm" );
    }


    /**
     * Determines if germplasm represented by this object has associated 
     * polymorphism data.
     *
     * @return <code>true</code> if germplasm has associated polymorphisms or 
     * <code>false</code> if no polymorphisms associated to germplasm
     */
    public boolean hasPolymorphisms() {
        return ( polymorphisms != null && !polymorphisms.isEmpty() );
    }

    /**
     * Retrieves polymorphisms associated to germplasm
     *
     * @return Polymorphisms associated to germplasm as an <code>Iterator</code> of
     * <code>PolymorphismLite</code> objects or <code>null</code> if no polymorphisms 
     * associated to germplasm
     */
    public Iterator getPolymorphisms() {
        return hasPolymorphisms() ? polymorphisms.iterator() : null;
    }
    
    /**
     * Populates species variant info. associated to parent or child germplasm 
     * through Pedigree table.
     * 
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populatePedigreeSpeciesVariants( DBconnection conn ) 
        throws SQLException {
        Long id = isParent ? get_parent_germplasm_id() : get_child_germplasm_id();
        pedigreeSpeciesVariants = new PedigreeSpeciesVariantCollection( conn,
                                                                        id );
    }

    /**
     * Determines if species variant data exists for parent or child germplasm
     * record either through direct connection to germplasm or through pedigree
     * table
     *
     * @return <code>true</code> if germplasm has species variant data, or
     * <code>false</code> if no species variant data for germplasm
     */
    public boolean hasPedigreeSpeciesVariants() {
        return ( pedigreeSpeciesVariants != null && 
                 !pedigreeSpeciesVariants.isEmpty() );
    }
    
    
    /**
     * Retrieve abbreviated names for species variants associated to germplasm both directly
     * and through Pedigree table as string keys that can be then used to get corresponding 
     * species variant ids through getPedigreeSpeciesVariantID()
     *
     * @return Species variant base names associated to germplasm directly or through Pedigree
     * as an <code>Iterator</code> of Strings, or <code>null</code> if no species variants associated
     * to germplasm
     */
    public Iterator getPedigreeSpeciesVariants() { 
        return hasPedigreeSpeciesVariants() ? pedigreeSpeciesVariants.getAbbreviatedNames() : null;
    }

    /**
     * Retrieves species variant ID for species variant with submitted abbreviated name, assuming
     * species variant is associated to germplasm directly or through Pedigree table.  This method
     * should never return null if names returned by getSpeciesVariants are submittted
     *
     * @param name Abbreviated name to find species variant id for
     * @return Long value of species variant id, or <code>null</code>
     * if species variant not associated to germplasm either directly or through Pedigree table.
     */
    public Long getPedigreeSpeciesVariantID( String name ) {
        return hasPedigreeSpeciesVariants() ? pedigreeSpeciesVariants.get( name ) : null;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();

        System.out.println( "is parent: " + isParent() );
        if ( germplasm != null ) {
            germplasm.test();
        }

        if ( hasLocus() ) {
            Iterator iter = getLocus();
            while ( iter.hasNext() ) {
                Locus locus = (Locus) iter.next();
                locus.test();
            }
        }
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try {
            DBconnection conn = new DBconnection();
            Long parentID = new Long( 5700 );
            Long childID = new Long( 1445 );

            boolean isParent = false;
            Pedigree pedigree = new Pedigree( conn, parentID, childID, isParent );
      
            System.out.println( "Pedigree for parent..." );
            pedigree.test();

            isParent = true;
            pedigree = new Pedigree( conn, parentID, childID, isParent );

            System.out.println( "Pedigree for child..." );
            pedigree.test();

        } catch (Exception e ) {
            e.printStackTrace();
        }
    }

}

