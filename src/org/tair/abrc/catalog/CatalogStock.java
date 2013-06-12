//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.24 $
// $Date: 2006/01/18 00:13:04 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog;

import java.sql.*;
import java.util.*;

import org.tair.querytools.*;
import org.tair.tfc.*;

/**
 * CatalogStock extends TfcStock so that it can be used to present data for
 * stocks as they're listed in the ABRC browsable stock catalog. In order to
 * meet the display requirements for all the different stock categories,
 * CatalogStock can potentially contain a wide array of data. The constructor
 * will only initialize basic stock info; all other data can be manually
 * populated using the populateXXX() methods. This allows for "a la carte"
 * object population that minimizes the overhead of object creation by only
 * retrieving data needed in a given context and leaving other data unpopulated.
 * 
 */

public class CatalogStock extends TfcStock {

    //
    // NOTE: Technically, the TairObject_Stock table means that a stock
    // could have multiple associated objects (such as germplasm, clone,
    // and library), however Debbie at ABRC says this should never happen,
    // so for simplicity's sake, catalog features assume there
    // will only be one "base object" for a stock.
    //

    // 
    // Seed stock info
    //

    // Associated germplasm for seed stock stored as a Germplasm object. This
    // object may contain species variant info, clones, and associated
    // polymorphisms (alleles) which themselves will contain associated loci.
    private Germplasm germplasm;

    // images for germplasm - stored as TfcImage
    private ImageCollection images;

    //
    // DNA stock info
    //

    // Associated library for dna library stock stored as a TfcLibrary object.
    private TfcLibrary library;

    // Associated clone for dna clone stock -- contains locus & NT seq
    // info for clone
    private Clone clone;

    // Vector info. for stock, or for library's stock
    private TfcVector vector;

    // Assignment data for stock's clone - stored as TfcGlobalAssignment objects
    private GlobalAssignmentCollection assignments;

    // Host Strain info. for stock
    private TfcHostStrain hostStrain;

    //
    // common info. for both seed & dna stock
    //

    // aliases for stock - stored as TfcAlias
    private AliasVector aliases;

    // donors for stock - stored as ListCommunity objects (donor stock #'s
    // stored as part of Donor record)
    private ListCommunityCollection donors;

    // species variant directly related to stock's associated data type
    // (i.e. germplasm, library etc.)
    private TfcSpeciesVariant speciesVariant;

    // taxon directly related to stock's associated data type
    private TfcTaxon taxon;

    /**
     * Creates an instance of CatalogStock that reflects the data referenced by
     * submitted stock_id. Only basic stock info. is populated through
     * constructor. Other data must be explicitly populated using the
     * populateXXX() methods. This is done to allow flexible yet efficient
     * creation of objects, since the data requirements of each catalog section
     * can be very different.
     * 
     * @param conn
     *            An active connection to the database
     * @param stock_id
     *            Stock id to retrieve data for
     * @throws SQLException
     *             if a database error occurs
     */
    public CatalogStock( DBconnection conn, Long stock_id ) throws SQLException {

        super( conn, stock_id );
    }

    /**
     * Populates stock's associated germplasm data. This data will only be
     * populated if stock's is_seed flag is set to "T".
     * 
     * @param conn
     *            An active connection to the database
     */
    public void populateGermplasm( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;
        Long germplasmTairObjectID = null;

	// if ( get_is_seed() != null && get_is_seed().booleanValue() ) {
            query = "SELECT ts.tair_object_id "
                    + "FROM TairObject_Stock ts, Germplasm g "
                    + "WHERE ts.tair_object_id = g.tair_object_id "
                    + "AND g.is_obsolete = 'F' "
  		    + "AND ts.stock_id = ? ";
            conn.setQuery( query );
	    conn.setQueryVariable( get_stock_id().toString() );

            results = conn.getResultSet();
            if ( results.next() ) {
                germplasmTairObjectID = new Long( results
                                                         .getLong( "tair_object_id" ) );
            }
            conn.releaseResources();
            this.germplasm = new Germplasm( conn, germplasmTairObjectID );
	    //}
    }

    /**
     * Populates polymorphism data for stock's germplasm. Polymorphism data
     * objects are created to contain associated loci data. This method must be
     * called after the populateGermplasm method.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmPolymorphisms( DBconnection conn )
        throws SQLException {

        germplasm.populatePolymorphisms( conn );
    }

    /**
     * Populates species variant/background info for stock's germplasm with
     * species variant info. associated to germplasm directly as well as through
     * germplasm's parentage as defined by Pedigree table. This method must be
     * called after the populateGermplasm method.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populatePedigreeSpeciesVariants( DBconnection conn )
        throws SQLException {

        germplasm.populatePedigreeSpeciesVariant( conn );
    }

    /**
     * Populates taxon data directly associated to stock's germplasm. This
     * method must be called after the populateGermplasm method.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmTaxon( DBconnection conn ) throws SQLException {

        if ( germplasm.get_taxon_id() != null ) {
            this.taxon = new TfcTaxon( conn, germplasm.get_taxon_id() );
        }
    }

    /**
     * Populates species variant data directly associated to stock's germplasm.
     * This is different than the populatePedigreeSpeciesVariants in that it
     * will only retrieve data for the single species variant associated to
     * germplasm through Germplasm.species_variant_id; this linking usually only
     * happens when germplasm record represents a natural variant.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmSpeciesVariant( DBconnection conn )
        throws SQLException {

        if ( germplasm.get_species_variant_id() != null ) {

            // Germplasm object also contains a TfcSpeciesVariant -- create
            // within Germplasm and set local reference to same object for
            // convenience & efficiency
            germplasm.populateSpeciesVariant( conn );
            this.speciesVariant = germplasm.getSpeciesVariant();
        }
    }

    /**
     * Populates associated clone data for stock's germplasm. This is different
     * than the clone population methods associated to stock directly in that
     * clone data is contained by germplasm, not an attribute of stock directly.
     * 
     * @parma conn An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmClone( DBconnection conn ) throws SQLException {

        germplasm.populateClones( conn );
    }

    /**
     * Determines if stock has associated germplasm
     * 
     * @return <code>true</code> if stock has associated germplasm, or
     *         <code>false</code> if no germplasm associated to stock
     */
    public boolean hasGermplasm() {
        return ( germplasm != null );
    }

    /**
     * Retrieves germplasm associated to stock
     * 
     * @return Germplasm associated to stock as a <code>Germplasm</code>
     *         object, or <code>null</code> if no germplasm associated to
     *         stock
     */
    public Germplasm getGermplasm() {
        return germplasm;
    }

    /**
     * Populates stock's collection of stock donors.
     * 
     * @param conn
     *            An active connection to the database
     */
    public void populateDonors( DBconnection conn ) throws SQLException {
        this.donors = new ListCommunityCollection( conn,
                                                   get_stock_id(),
                                                   "donor" );
    }

    /**
     * Determines if stock has associated stock donors
     * 
     * @return <code>true</code> if stock has associated donors, or
     *         <code>false</code> if no donors associated to stock
     */
    public boolean hasDonors() {
        return ( donors != null && !donors.isEmpty() );
    }

    /**
     * Retrieves stock donors associated to stock
     * 
     * @return Donors associated to stock as an <code>Iterator</code> of
     *         <code>ListCommunity</code> objects, or <code>null</code> if
     *         no stock donors associated to stock
     */
    public Iterator getDonors() {
        return hasDonors() ? donors.iterator() : null;
    }

    /**
     * Retrieves donor stock numbers
     * 
     * @return Donor stock numbers as an <code>Set</code> of
     *         <code>String</code> objects
     *
     */
    public Set<String> getDonorSockNumbers() {
	
	Set<String> stockNumbers = new HashSet();
	if ( hasDonors() ) {
	    
	    Iterator donorIter = getDonors();
	    while (donorIter.hasNext()) {
		Donor donor = (Donor) donorIter.next();
		if (donor.getDonorStockNumber() != null) {
		    stockNumbers.add(donor.getDonorStockNumber());
		}
	    }
	}

	return stockNumbers;
    }

    

    /**
     * Populates collection of parents for germplasm as defined through Pedigree
     * table. This method must be called after populateGermplasm has been called
     * to initialize germplasm data
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmParents( DBconnection conn )
        throws SQLException {

        germplasm.populateParents( conn );
    }

    /**
     * Populates collection of parents for germplasm as defined through
     * Pedigree table. Parents must be associated to germplasm with submitted
     * value for generative method. This is helpful for defining a specific set
     * of parents germplasms to retrieve.
     * 
     * This method must be called after populateGermplasm has been called to
     * initialize germplasm data
     * 
     * @param conn
     *            An active connection to the database
     * @param generativeMethod
     *            Generative method for parent germplasms
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmParents( DBconnection conn,
                                          String generativeMethod )
        throws SQLException {
        germplasm.populateParents( conn, generativeMethod );
    }

    /**
     * Populates collection of children for germplasm as defined through
     * Pedigree table. Children must be associated to germplasm with submitted
     * value for generative method. This is helpful for defining a specific set
     * of child germplasms to retrieve (such as single plant progeny for a
     * natural variant)
     * 
     * This method must be called after populateGermplasm has been called to
     * initialize germplasm data
     * 
     * @param conn
     *            An active connection to the database
     * @param generativeMethod
     *            Generative method for child germplasms
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmChildren( DBconnection conn,
                                          String generativeMethod )
        throws SQLException {
        germplasm.populateChildren( conn, generativeMethod );
    }

    /**
     * Populates collection of associated polymorphisms for each parent
     * germplasm associated to stock's germplasm. Germplasm and collection of
     * parents must have already been populated through populateGermplasm and
     * populateGermplasmParents methods before this method is called.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmParentPolymorphisms( DBconnection conn )
        throws SQLException {
        germplasm.populateParentPolymorphisms( conn );
    }

    /**
     * Populates species variant data for each parent germplasm associated to
     * stock's germplasm. Germplasm and collection of parents must have already
     * been populated through populateGermplasm and populateGermplasmParents
     * methods before this method is called.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateGermplasmParentSpeciesVariants( DBconnection conn )
        throws SQLException {
        germplasm.populateParentPedigreeSpeciesVariants( conn );
    }

    /**
     * Populates stock's collection of images
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateImages( DBconnection conn ) throws SQLException {
        this.images = new ImageCollection( conn, germplasm.get_tair_object_id() );
    }

    /**
     * Determines if stock (or associated seed stock's germplasm) has associated
     * images
     * 
     * @return <code>true</code> if stock has associated images, or
     *         <code>false</code> if no images associated with stock
     */
    public boolean hasImages() {
        return ( images != null && !images.isEmpty() );
    }

    /**
     * Retrieve images associated with stock (or stock's germplasm)
     * 
     * @return Images associated with stock as an <code>Iterator</code> of
     *         <code>TfcImage</code> objects, or <code>null</code> if no
     *         images for this stock
     */
    public Iterator getImages() {
        return hasImages() ? images.iterator() : null;
    }

    /**
     * Populates stock's associated library data. This data will only be
     * populated if stock's is_seed flag is set to "F". Vector and species
     * variant information will automatically be populated for library.
     * 
     * @param conn
     *            An active connection to the database
     */
    public void populateLibrary( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;
        Long libraryID = null;

        if ( get_is_seed() == null || !get_is_seed().booleanValue() ) {
            query = "SELECT l.library_id "
                    + "FROM TairObject_Stock ts, Library l "
                    + "WHERE ts.tair_object_id = l.tair_object_id "
                    + "AND l.is_obsolete = 'F' "
                    + "AND ts.stock_id = ?";
            conn.setQuery( query );
            conn.setQueryVariable( get_stock_id() );

            results = conn.getResultSet();
            if ( results.next() ) {
                libraryID = new Long( results.getLong( "library_id" ) );
            }
            conn.releaseResources();
            this.library = new TfcLibrary( conn, libraryID );
            if ( library.get_vector_id() != null ) {
                this.vector = new TfcVector( conn, library.get_vector_id() );
            }
            if ( library.get_species_variant_id() != null ) {
                this.speciesVariant = new TfcSpeciesVariant( conn,
                                                             library
                                                                    .get_species_variant_id() );
            }

        }
    }

    /**
     * Determines if stock has associated library info.
     * 
     * @return <code>true</code> if stock has associated library, or
     *         <code>false</code> if no library associated to stock
     */
    public boolean hasLibrary() {
        return ( library != null );
    }

    /**
     * Retrieves library associated to stock
     * 
     * @return Library associated to stock
     */
    public TfcLibrary getLibrary() {
        return library;
    }

    /**
     * Populates stock's associated vector data.
     * 
     * @param conn
     *            An active connection to the database
     */
    public void populateVector( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;
        Long vectorID = null;

        query = "SELECT v.vector_id "
                + "FROM TairObject_Stock ts, Vector v "
                + "WHERE ts.tair_object_id = v.tair_object_id "
                + "AND v.is_obsolete = 'F' "
                + "AND ts.stock_id = ?";
        conn.setQuery( query );
        conn.setQueryVariable( get_stock_id() );

        results = conn.getResultSet();
        if ( results.next() ) {
            vectorID = new Long( results.getLong( "vector_id" ) );
        }
        conn.releaseResources();

        this.vector = new TfcVector( conn, vectorID );
    }

    /**
     * Determines if stock has associated vector info.
     * 
     * @return <code>true</code> if stock has associated vector, or
     *         <code>false</code> if no vector associated to stock
     */
    public boolean hasVector() {
        return ( vector != null );
    }

    /**
     * Retrieves vector associated to stock
     * 
     * @return Vector associated to stock
     */
    public TfcVector getVector() {
        return vector;
    }

    /**
     * Populates stock's associated host strain data.
     * 
     * @param conn
     *            An active connection to the database
     */
    public void populateHostStrain( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;
        Long hostStrainID = null;

        query = "SELECT hs.host_strain_id "
                + "FROM TairObject_Stock ts, HostStrain hs "
                + "WHERE ts.tair_object_id = hs.tair_object_id "
	        + "AND hs.is_obsolete = 'F' "
                + "AND ts.stock_id = ?";
        conn.setQuery( query );
        conn.setQueryVariable( get_stock_id() );

        results = conn.getResultSet();
        if ( results.next() ) {
            hostStrainID = new Long( results.getLong( "host_strain_id" ) );
        }
        conn.releaseResources();

        this.hostStrain = new TfcHostStrain( conn, hostStrainID );
    
    }


    /**
     * Populates taxon data directly associated to stock's host strain. This
     * method must be called after the populateHostStrain method.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateHostStrainTaxon( DBconnection conn ) throws SQLException {

        if ( hostStrain.get_taxon_id() != null ) {
            this.taxon = new TfcTaxon( conn, hostStrain.get_taxon_id() );
        }
    }

    /**
     * Determines if stock has associated host strain info.
     * 
     * @return <code>true</code> if stock has associated host strain, or
     *         <code>false</code> if no vector associated to stock
     */
    public boolean hasHostStrain() {
        return ( hostStrain != null );
    }

    /**
     * Retrieves host strain associated to stock
     * 
     * @return Host Strain associated to stock
     */
    public TfcHostStrain getHostStrain() {
        return hostStrain;
    }

    /**
     * Determines if stock has associated species variant info.
     * 
     * @return <code>true</code> if stock has associated species variant, or
     *         <code>false</code> if no species variant associated to stock
     */
    public boolean hasSpeciesVariant() {
        return ( speciesVariant != null );
    }

    /**
     * Retrieves species variant associated to stock
     * 
     * @return Species variant associated to stock
     */
    public TfcSpeciesVariant getSpeciesVariant() {
        return speciesVariant;
    }

    /**
     * Determines if stock has associated taxon info.
     * 
     * @return <code>true</code> if stock has associated taxon, or
     *         <code>false</code> if no taxon associated to stock
     */
    public boolean hasTaxon() {
        return ( taxon != null );
    }

    /**
     * Retrieves taxon associated to stock
     * 
     * @return Taxon associated to stock
     */
    public TfcTaxon getTaxon() {
        return taxon;
    }

    /**
     * Populates stock's associated clone data.
     * 
     * @param conn
     *            An active connection to the database
     */
    public void populateClone( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;
        Long cloneID = null;

        query = "SELECT c.clone_id "
                + "FROM TairObject_Stock ts, Clone c "
                + "WHERE ts.tair_object_id = c.tair_object_id "
                + "AND c.is_obsolete = 'F' "
	        + "AND ts.stock_id = ? ";

        conn.setQuery( query );
        conn.setQueryVariable( get_stock_id() );

        results = conn.getResultSet();
        if ( results.next() ) {
            cloneID = new Long( results.getLong( "clone_id" ) );
        }
        conn.releaseResources();
        this.clone = new Clone( conn, cloneID );

        // Clone object also contains a TfcVector -- create
        // within Clone and set local reference to same object for
        // convenience & efficiency
        this.vector = clone.getVector();
    }

    /**
     * Determines if stock has associated clone info.
     * 
     * @return <code>true</code> if stock has associated clone, or
     *         <code>false</code> if no clone associated to stock
     */
    public boolean hasClone() {
        return ( clone != null );
    }

    /**
     * Retrieves clone associated to stock
     * 
     * @return Clone associated to stock
     */
    public Clone getClone() {
        return clone;
    }

    /**
     * Populates NT sequence data for stock's clone. All info. for sequence will
     * be retrieved except for sequence text itself. Clone data must be
     * initialized through the populateClone method before calling this method.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateCloneNTSequences( DBconnection conn )
        throws SQLException {

        clone.populateNTSequences( conn );
    }

    /**
     * Populates collection of loci for stock's associated clone. This method
     * must be called after clone data has been initialized using the
     * populateClone method.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateCloneLocus( DBconnection conn ) throws SQLException {
        clone.populateLocus( conn, "map_element" );
    }

    /**
     * Populates collection of aliases with aliases associated to clone
     * associated to stock. This method assumes clone data has already been
     * populated
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs.
     */
    public void populateCloneAliases( DBconnection conn ) throws SQLException {
        this.aliases = new AliasVector( conn, clone.get_tair_object_id() );
    }

    /**
     * Populates collection of aliases for stock.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs.
     */
    public void populateStockAliases( DBconnection conn ) throws SQLException {
        this.aliases = new AliasVector( conn, get_tair_object_id() );
    }

    /**
     * Populates collection of aliases with aliases associated to vector
     * associated to stock. This method assumes vector data has already been
     * populated
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs.
     */
    public void populateVectorAliases( DBconnection conn ) throws SQLException {
        this.aliases = new AliasVector( conn, vector.get_tair_object_id() );
    }

    /**
     * Determines if stock has associated aliases
     * 
     * @return <code>true</code> if stock has aliases <code>false</code> if
     *         no aliases associated to stock
     */
    public boolean hasAliases() {
        return ( aliases != null && !aliases.isEmpty() );
    }

    /**
     * Retrieves aliases associated to stock
     * 
     * @return Aliases associated to stock as an <code>Iterator</code> of
     *         <code>TfcAlias</code> objects, or <code>null</code> if no
     *         aliases associated to stock
     */
    public Iterator getAliases() {
        return hasAliases() ? aliases.iterator() : null;
    }

    /**
     * Populates assignment data for stock's clone. Clone data must be
     * initialized through the populateClone method before calling this method.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateCloneAssignments( DBconnection conn )
        throws SQLException {

        this.assignments = new GlobalAssignmentCollection( conn,
                                                           clone
                                                                .get_map_element_id() );
    }

    /**
     * Determines if stock's clone has associated assignments
     * 
     * @return <code>true</code> if stock's clone has assignments
     *         <code>false</code> if no assignments associated to clone
     */
    public boolean hasAssignments() {
        return ( assignments != null && !assignments.isEmpty() );
    }

    /**
     * Retrieves assignments for clone associated to stock
     * 
     * @return Assignments associated to stock's clone as an
     *         <code>Iterator</code> of <code>TfcGlobalAssignment</code>
     *         objects, or <code>null</code> if no assignments for clone
     */
    public Iterator getAssignments() {
        return hasAssignments() ? assignments.iterator() : null;
    }

    /**
     * Retrieves description as combination of germplasm and stock description
     * fields. A null value for one description or the other will simply be
     * displayed as an empty string; additionally, if this method is called when
     * CatalogStock represents a DNA stock, description returned will only
     * contain contents of stock description.
     * 
     * @return Combined values of germplasm and stock description fields (in
     *         that order), or <code>null</code> if neither element has a
     *         populated description field.
     */
    public String getGermplasmStockDescription() {
        String combinedStr = null;

        if ( ( hasGermplasm() && germplasm.get_description() != null )
             || get_description() != null ) {

            StringBuffer combinedBuffer = new StringBuffer();

            if ( germplasm.get_description() != null ) {
                combinedBuffer.append( germplasm.get_description() + " " );
            }

            if ( get_description() != null ) {
                combinedBuffer.append( get_description() );
            }

            combinedStr = combinedBuffer.toString();
        }

        return combinedStr;
    }

    /**
     * Determines if stock has combined germplasm/stock description text to
     * display. Will return true if either stock or germplasm has a non-null
     * value for description.
     * 
     * @return <code>true</code> if stock has combined germplasm/stock
     *         description text for display, or <code>false</code> if no
     *         combined description text exists
     */
    public boolean hasGermplasmStockDescription() {
        return ( ( hasGermplasm() && germplasm.get_description() != null ) || super
                                                                                   .get_description() != null );
    }

}
