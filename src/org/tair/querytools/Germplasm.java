//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.19 $
// $Date: 2006/02/06 19:49:43 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.util.Iterator;
import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGermplasm;
import org.tair.tfc.TfcSpeciesVariant;
import org.tair.tfc.TfcTaxon;

import org.tair.search.PedigreeSpeciesVariantCollection;

/**
 * Germplasm extends <code>TfcGermplasm</code> to include detailed information
 * about a germplasm. In addition to all data contained in the super class,
 * Germplasm contains data on the germplasm's taxon and phenotypes.
 */

// TODO: figure out how to refactor this with org.tair.search.GermplasmSummary.

public class Germplasm extends TfcGermplasm {

    // taxon associated to germplasm; this object must
    // be explicitly populated through the populateTaxon
    // method
    private TfcTaxon taxon;

    // species variant directly associated to germplasm (through
    // Germplasm.species_variant_id; this object must be explicitly
    // populated using the populateSpeciesVariant method
    private TfcSpeciesVariant speciesVariant;

    // basic info (abbrev name and species variant id) on species
    // variants associated to germplasm either directly or through
    // parentage as defined by Pedigree table. This collection must
    // be explicitly populated through the populatePedigreeSpeciesVariants
    // method
    private PedigreeSpeciesVariantCollection pedigreeSpeciesVariants;

    // polymorphisms for germplasm - stored as GermplasmPolymorphism (sub-class
    // of PolymorphismObject) objects - this collection must be populated
    // explicitly through populatePolymorphisms() method
    private PolymorphismObjectCollection polymorphisms;

    // stocks for germplasm - stored as StockObject objects -
    // this collection must be populated explicitly through populateStocks()
    // method
    private StockCollection stocks;

    // clones associated to germplasm - stored as Clone objects.
    // This collection must be populated explicitly through populateClones
    // method.
    private CloneCollection clones;

    // parent germplasms associated to germplasm through Pedigree table -
    // stored as Pedigree objects. This collection must be populated
    // explicitly through populateParents method
    private PedigreeCollection parents;

    // child germplasms associated to germplasm through Pedigree table -
    // stored as Pedigree objects. This collection must be populated
    // explicitly through populateChildren method
    private PedigreeCollection children;

    // Phenotypes for a given germplasm (the relationship is many-to-many).
    // Note that we will be storing Phenotype 'band' objects which derive
    // from the 'core' TfcPhenotype class.
    // When there are no phenotypes we have an empty collection
    // rather than a null one (just like e.g. stocks).
    private PhenotypeCollection phenotypes;

    // Germplasms can have images, and we want the polyallele_detail
    // page to indicate that to the user via icons.
    private ImageCollection images;

    /**
     * Creates an empty instance of Germplasm
     */
    public Germplasm() {
        super();
    }

    /**
     * Creates an instance of Germplasm that reflects the data referenced by
     * submitted tair_object_id
     *
     * @param conn
     *            An active connection to the database
     * @param tair_object_id
     *            Germplasm tair_object_id to retrieve data for
     * @exception SQLException
     *                thrown if a database error occurs, or if no row found for
     *                submitted tair_object_id
     */
    public Germplasm( DBconnection conn, Long tair_object_id ) throws SQLException {
        super( conn, tair_object_id );

        this.phenotypes = new PhenotypeCollection( conn, get_germplasm_id() );
        this.images = new ImageCollection( conn, get_tair_object_id() );
    }

    /**
     * @return null when the default constructor is used, otherwise a
     * PhenotypeCollection which contains zero or more Phenotype objects
     * associated to this Germplasm.
     */
    public PhenotypeCollection get_phenotypes()
    {
        return( this.phenotypes );
    }

    /**
     * Determines if germplasm has associated stock images
     * @return <code>true</code> if germplasm has associated stock images
     * or <code>false</code> if no stock images associated to germplasm
     */
    public boolean hasImages() {
        return ( images != null && !images.isEmpty() );
    }

    /**
     * Retrieve images associated to germplasm
     * @return non-null, but possibly empty, Images for germplasm
     * as an <code>Iterator</code> of
     * <code>TfcImage</code> objects, or <code>null</code> if germplasm
     * has no images
     */
    public Iterator getImages() {
        return hasImages() ? images.iterator() : null;
    }

    /**
     * Populates data for germplasm's associated taxon, if it has one.
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateTaxon( DBconnection conn ) throws SQLException {
        if ( get_taxon_id() != null ) {
            taxon = new TfcTaxon( conn, get_taxon_id() );
        }
    }

    //
    // TfcTaxon wrappers
    //

    public void set_genus( String genus ) {
        initTaxon();
        taxon.set_genus( genus );
    }

    // overridden from set_taxon_id in TfcGermplasm to keep two ids in synch
    public void set_taxon_id( Long id ) {
        initTaxon();
        taxon.set_taxon_id( id );
        super.set_taxon_id( id );
    }

    public void set_species( String species ) {
        initTaxon();
        taxon.set_species( species );
    }

    public void set_division_code( String code ) {
        initTaxon();
        taxon.set_division_code( code );
    }

    public void set_scientific_name( String name ) {
        initTaxon();
        taxon.set_scientific_name( name );
    }

    public void set_common_name( String name ) {
        initTaxon();
        taxon.set_common_name( name );
    }

    public void set_taxonomy( String taxonomy ) {
        initTaxon();
        taxon.set_taxonomy( taxonomy );
    }

    public void set_genbank_taxonomy_id( String id ) {
        initTaxon();
        taxon.set_genbank_taxonomy_id( id );
    }

    // utility method to avoid null pointers when setting taxon attributes
    // by checking taxon & initializing if instance is null
    private void initTaxon() {
        if ( taxon == null ) {
            taxon = new TfcTaxon();
        }
    }

    public String get_genus() {
        return taxon != null ? taxon.get_genus() : null;
    }

    public String get_species() {
        return taxon != null ? taxon.get_species() : null;
    }

    public String get_division_code() {
        return taxon != null ? taxon.get_division_code() : null;
    }

    public String get_scientific_name() {
        return taxon != null ? taxon.get_scientific_name() : null;
    }

    public String get_common_name() {
        return taxon != null ? taxon.get_common_name() : null;
    }

    public String get_taxonomy() {
        return taxon != null ? taxon.get_taxonomy() : null;
    }

    public String get_genbank_taxonomy_id() {
        return taxon != null ? taxon.get_genbank_taxonomy_id() : null;
    }

    /**
     * Populates data for species variant directly associated to germplasm, if
     * one exists. This is different from list of species variants associated to
     * germplasm through the Pedigree table
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateSpeciesVariant( DBconnection conn ) throws SQLException {
        if ( get_species_variant_id() != null ) {
            speciesVariant = new TfcSpeciesVariant( conn,
                                                    get_species_variant_id() );
        }
    }

    //
    // TfcSpeciesVariant wrappers
    //

    public String get_species_variant_type() {
        return speciesVariant != null ? speciesVariant.get_speciesvariant_type() : null;
    }

    public String get_species_variant_name() {
        return speciesVariant != null ? speciesVariant.get_name() : null;
    }

    public String get_species_variant_abbrev_name() {
        return speciesVariant != null ? speciesVariant.get_abbrev_name() : null;
    }

    public String get_base_name() {
        return speciesVariant != null ? speciesVariant.get_base_name() : null;
    }

    public String get_location() {
        return speciesVariant != null ? speciesVariant.get_location() : null;
    }

    public String get_country() {
        return speciesVariant != null ? speciesVariant.get_country() : null;
    }

    public String get_habitat() {
        return speciesVariant != null ? speciesVariant.get_habitat() : null;
    }

    public String get_min_altitude() {
        return speciesVariant != null ? speciesVariant.get_min_altitude()
                                     : null;
    }

    public String get_max_altitude() {
        return speciesVariant != null ? speciesVariant.get_max_altitude()
                                     : null;
    }

    public String get_min_longitude() {
        return speciesVariant != null ? speciesVariant.get_min_longitude()
                                     : null;
    }

    public String get_max_longitude() {
        return speciesVariant != null ? speciesVariant.get_max_longitude()
                                     : null;
    }

    public String get_min_latitude() {
        return speciesVariant != null ? speciesVariant.get_min_latitude()
                                     : null;
    }

    public String get_max_latitude() {
        return speciesVariant != null ? speciesVariant.get_max_latitude()
                                     : null;
    }

    public java.util.Date get_date_collected() {
        return speciesVariant != null ? speciesVariant.get_date_collected()
                                     : null;
    }

    public String get_monthly_precipitation() {
        return speciesVariant != null ?
            speciesVariant.get_monthly_precipitation() : null;
    }

    public String get_daily_temperature() {
        return speciesVariant != null ? speciesVariant.get_daily_temperature()
                                     : null;
    }

    public String get_num_plants() {
        return speciesVariant != null ? speciesVariant.get_num_plants() : null;
    }

    /**
     * Convenience method that returns species variant data directly linked to
     * germplasm as a TfcSpeciesVariant object
     *
     * @return species variant directly linked to germplasm
     */
    public TfcSpeciesVariant getSpeciesVariant() {
        return speciesVariant;
    }

    /**
     * Populates collection of species variants that are associated to germplasm
     * both directly as well as indirectly through parentage as defined by
     * Pedigree table.
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populatePedigreeSpeciesVariant( DBconnection conn )
        throws SQLException {
        this.pedigreeSpeciesVariants =
            new PedigreeSpeciesVariantCollection( conn, get_germplasm_id() );
    }

    /**
     * Determines if germplasm has species variants associated either directly
     * or through parentage in Pedigree table
     *
     * @return <code>true</code> if germplasm has species variants associated
     *         through pedigree, or <code>false</code> if no pedigree species
     *         variants associated to germplasm
     */
    public boolean hasPedigreeSpeciesVariants() {
        return ( pedigreeSpeciesVariants != null &&
                !pedigreeSpeciesVariants.isEmpty() );
    }

    /**
     * Retrieve abbreviated names for species variants associated to germplasm
     * both directly and through Pedigree table as string keys that can be then
     * used to get corresponding species variant ids through
     * getPedigreeSpeciesVariantID()
     *
     * @return Species variant base names associated to germplasm directly or
     *         through Pedigree as an <code>Iterator</code> of Strings, or
     *         <code>null</code> if no species variants associated to
     *         germplasm
     */
    public Iterator getPedigreeSpeciesVariants() {
        return hasPedigreeSpeciesVariants() ?
            pedigreeSpeciesVariants.getAbbreviatedNames() : null;
    }

    /**
     * Retrieves species variant ID for species variant with submitted
     * abbreviated name, assuming species variant is associated to germplasm
     * directly or through Pedigree table. This method should never return null
     * if names returned by getSpeciesVariants are submittted
     *
     * @param name
     *            Abbreviated name to find species variant id for
     * @return Long value of species variant id, or <code>null</code> if
     *         species variant not associated to germplasm either directly or
     *         through Pedigree table.
     */
    public Long getPedigreeSpeciesVariantID( String name ) {
        return hasPedigreeSpeciesVariants() ?
            pedigreeSpeciesVariants.get( name ) : null;
    }

    /**
     * Determines if germplasm has associated polymorphisms
     *
     * @return <code>true</code> if germplasm has associated polymorphisms or
     *         <code>false</code> if no polymorphisms associated to germplasm
     */
    public boolean hasPolymorphisms() {
        return ( polymorphisms != null && !polymorphisms.isEmpty() );
    }

    /**
     * Retrieve polymorphisms associated to germplasm
     *
     * @return Polymorphisms as an <code>Iterator</code> of
     *         <code>PolymorphismLite</code> objects, or <code>null</code>
     *         if germplasm has no polymorphisms
     */
    public Iterator getPolymorphisms() {
        return hasPolymorphisms() ? polymorphisms.iterator() : null;
    }

    /**
     * Retrieve polymorphismNames associated to germplasm
     *
     * @return PolymorphismNames as a ";" delimited string for jsp pages 's easy
     *         display if germplasm has no polymorphisms, return empty string
     */

    public String getPolymorphismsNameString() {
        StringBuffer polyNames = new StringBuffer();
        if ( hasPolymorphisms() ) {
            Iterator polyIter = getPolymorphisms();
            GermplasmPolymorphism poly = null;
            boolean first = true;
            while ( polyIter.hasNext() ) {
                poly = (GermplasmPolymorphism) polyIter.next();
                if ( !first ) {
                    polyNames.append( "; " );
                } else {
                    first = false;
                }
                polyNames.append( poly.get_original_name() );
            }
        }
        return polyNames.toString();
    }

    /**
     * Retrieve number of polymorphism associated to germplasm
     *
     * @return number of polymorphism as int if germplasm has no polymorphisms,
     *         return 0
     */

    public int getPolymorphismSize() {
        return hasPolymorphisms() ? polymorphisms.size() : 0;
    }

    /**
     * Populate this germplasm's associated polymorphisms. This is done
     * explicitly to avoid retrieving data when it's not needed for display.
     * Polymorphism data objects will be created to contain each polymorphism's
     * collection of associated loci
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populatePolymorphisms( DBconnection conn ) throws SQLException {
        polymorphisms = new PolymorphismObjectCollection( conn,
                                                          get_germplasm_id(),
                                                         "germplasm" );
    }


    /**
     * Determines if germplasm has associated stocks
     *
     * @return <code>true</code> if germplasm has associated stocks or
     *         <code>false</code> if no stocks associated to germplasm
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }

    /**
     * Retrieve stocks associated to germplasm
     *
     * @return Stocks as an <code>Iterator</code> of <code>StockObject</code>
     *         objects, or <code>null</code> if germplasm has no stocks
     */
    public Iterator getStocks() {
        return hasStocks() ? stocks.iterator() : null;
    }

    /**
     * Populate this germplasm's collection of parents as defined through
     * Pedigree table. This is done explicitly to avoid retrieving data when
     * it's not needed for display
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateParents( DBconnection conn ) throws SQLException {
        boolean getParents = true;
        parents = new PedigreeCollection( conn, get_germplasm_id(), getParents );
    }

    /**
     * Populates this germplasm's collection of parents as defined through
     * Pedigree table. Parents must be associated to germplasm with submitted
     * value for generative method. This is helpful for defining a specific set
     * of parent germplasms to retrieve.
     *
     * @param conn
     *            An active connection to the database
     * @param generativeMethod
     *            Generative method for parent germplasms
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateParents( DBconnection conn, String generativeMethod )
        throws SQLException {
        boolean getParents = true;
        parents = new PedigreeCollection( conn,
                                          get_germplasm_id(),
                                          getParents,
                                          generativeMethod );
    }

    /**
     * Populates collection of associated polymorphisms for each parent
     * germplasm associated to this germplasm. Collection of parents must be
     * populated through populateParents method before calling this method.
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateParentPolymorphisms( DBconnection conn )
        throws SQLException {
        parents.populatePolymorphisms( conn );
    }

    /**
     * Populates species variant data for each parent germplasm associated to
     * this germplasm. Collection of parents must be populated through
     * populateParents method before calling this method. Species variant data
     * may be directly related to parent germplasms, or related to parent
     * through its own pedigree data
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateParentPedigreeSpeciesVariants( DBconnection conn )
        throws SQLException {
        parents.populatePedigreeSpeciesVariants( conn );
    }

    /**
     * Determines if germplasm has associated parent germplasms
     *
     * @return <code>true</code> if germplasm has associated parent germplasms
     *         or <code>false</code> if no stocks associated to germplasm
     */
    public boolean hasParents() {
        return ( parents != null && !parents.isEmpty() );
    }

    /**
     * Retrieve parent germplasms associated to germplasm
     *
     * @return Parents of germplasm as an <code>Iterator</code> of
     *         <code>Pedigree</code> objects, or <code>null</code> if
     *         germplasm has no parents
     */
    public Iterator getParents() {
        return hasParents() ? parents.iterator() : null;
    }

    /**
     * Populates this germplasm's collection of children as defined through
     * Pedigree table. Children must be associated to germplasm with submitted
     * value for generative method. This is helpful for defining a specific set
     * of child germplasms to retrieve (such as single plant progeny for a
     * natural variant)
     *
     * @param conn
     *            An active connection to the database
     * @param generativeMethod
     *            Generative method for child germplasms
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateChildren( DBconnection conn, String generativeMethod )
        throws SQLException {
        boolean getParents = false;
        children = new PedigreeCollection( conn,
                                           get_germplasm_id(),
                                           getParents,
                                           generativeMethod );
    }

    /**
     * Determines if germplasm has any child germplasms associated through
     * Pedigree.
     *
     * @return <code>true</code> if germplasm has child germplasms or
     *         <code>false</code> if no child germplasms associated to
     *         germplasm
     */
    public boolean hasChildren() {
        return ( children != null && !children.isEmpty() );
    }

    /**
     * Retrieves child germplasms associated to germplasm
     *
     * @return Child germplasms for this germplasm as an <code>Iterator</code>
     *         of <code>Pedigree</code> objects or <code>null</code> if no
     *         children exist for germplasm
     */
    public Iterator getChildren() {
        return hasChildren() ? children.iterator() : null;
    }

    /**
     * Populate this germplasm's associated stocks. This is done explicitly to
     * avoid retrieving data when it's not needed for display
     *
     * @param conn
     *            An active connection to the database
     */
    public void populateStocks( DBconnection conn ) throws SQLException {
        if ( get_tair_object_id() != null ) {
            stocks = new StockCollection( conn, get_tair_object_id() );
        }
    }

    /**
     * Populates collection of clones associated to germplasm
     *
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateClones( DBconnection conn ) throws SQLException {
        this.clones = new CloneCollection( conn,
                                           get_germplasm_id(),
                                           "germplasm" );

	Iterator clones = getClones();
	while (clones != null && clones.hasNext()) {
	    Clone clone = (Clone) clones.next();
	    clone.populateGenes(conn);
	}
    }

    /**
     * Determines if germplasm has associated clones
     *
     * @return <code>true</code> if germplasm has associated clones, or
     *         <code>false</code> if no clones associated to germplasm
     */
    public boolean hasClones() {
        return ( clones != null && !clones.isEmpty() );
    }

    /**
     * Retrieves clones associated to germplasm
     *
     * @return Clones associated to germplasm as an <code>Iterator</code> of
     *         <code>Clone</code> objects, or <code>null</code> if no clones
     *         associated to germplasm.
     */
    public Iterator getClones() {
        return hasClones() ? clones.iterator() : null;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();

	System.out.println( "****** Germplasm content test ******" );
	System.out.println( "germplasm_id: " + get_germplasm_id() );
        if ( taxon != null ) {
            taxon.test();
        }

        if ( hasPolymorphisms() ) {
            System.out.println( "polysize" + getPolymorphismSize() );
            System.out.println( "polynames " + getPolymorphismsNameString() );
        }

        if ( hasStocks() ) {
            stocks.test();
        }

	if ( hasClones() ) {
	    clones.test();
	}
	System.out.println( "****** Germplasm content test END ******" );

    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long id = new Long( 1005211832 );
            Germplasm germplasm = new Germplasm( conn, id );
	    germplasm.populateClones(conn);
            germplasm.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }

}
