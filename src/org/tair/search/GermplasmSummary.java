//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.20 $
// $Date: 2006/02/06 19:49:43 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.community.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * GermplasmSummary represents the information needed to display one germplasm record
 * as part of the germplasm search results. GermplasmSummary contains all fields from
 * the temp table used to hold germplasm search results as well as collections of
 * additional information (such as stocks, polymorphisms & species variant data)
 * associated w/germplasm
 * <p>
 * GermplasmSummary implements Accessible interface to facilitate creation of the object's
 * TAIR accession number through <code>AccessionManager</code>
 */

// TODO: figure out how to refactor this with org.tair.querytools.Germplasm.

public class GermplasmSummary implements Accessible {
    private Long tairObjectID;
    private Long germplasmID;
    private String germplasmName;
    private String germplasmType;
    private String description;
    private String locusCode;
    private String phenotype;

    // donors of stocks associated to germplasm - stored as ListCommunity
    private ListCommunityCollection donors;

    // species variant (background) info. for species variants
    // associated to germplasm directly as well as through Pedigree table
    private PedigreeSpeciesVariantCollection speciesVariants;

    // stocks associated w/germplasm - stored as StockObject
    private StockCollection stocks;

    // polymorphisms associated w/germplasm - stored as PolymorphismLite
    private PolymorphismLiteCollection polymorphisms;

    // images associated w/germplasm - stored as TfcImage
    private ImageCollection images;


    /**
     * Creates an empty instance of GermplasmSummary
     */
    public GermplasmSummary() {  }


    /**
     * Creates an instance of GermplasmSummary that reflects data for the
     * germplasm with submitted tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Germplasm tair_object_id to retrieve information for
     * @exception SQLException in the case of an invalid operation or database error, or
     * if no row can be found for tair_object_id
     */
    public GermplasmSummary( DBconnection conn, Long tair_object_id ) throws SQLException {
        if ( tair_object_id != null ) {
            populateGermplasm( conn, tair_object_id );
            populate( conn );
        }
    }

    public Long getTairObjectID() { return tairObjectID; }
    public Long getGermplasmID() { return germplasmID; }
    public String getGermplasmName() { return germplasmName; }
    public String getGermplasmType() { return germplasmType; }
    public String getDescription() { return description; }
    public String getPhenotype() { return phenotype; }
    public String getLocusCode() { return locusCode; }

    public void setTairObjectID( Long id ) { this.tairObjectID = id; }
    public void setGermplasmID( Long id ) { this.germplasmID = id; }
    public void setGermplasmName( String name ) { this.germplasmName = name; }
    public void setGermplasmType( String type ) { this.germplasmType = type; }
    public void setDescription( String description ) { this.description = description; }
    public void setPhenotype( String phenotype ) { this.phenotype = phenotype; }

    // populate basic germplasm info. - if summary object is created through GermplasmSearcher
    // (which it almost always is), this info is populated by Searcher directly
    private void populateGermplasm( DBconnection conn, Long tair_object_id ) throws SQLException {
        String query = null;
        ResultSet results = null;
        boolean found = false;

        query =
            "SELECT germplasm_id, " +
            "name, " +
            "type " +
            "FROM Germplasm " +
            "WHERE tair_object_id = " + tair_object_id.toString();
        conn.setQuery( query );
        results = conn.getResultSet();
        if ( results.next() ) {
            found = true;
            this.tairObjectID = tair_object_id;
            this.germplasmID = new Long( results.getLong( "germplasm_id" ) );
            this.germplasmName = results.getString( "name" );
            this.germplasmType = results.getString( "type" );
        }
        conn.releaseResources();

        if ( !found ) {
            throw new RecordNotFoundException( "No germplasm found with tair object id: " + tair_object_id );
        }
    }



    /**
     * Retrieves associated data for germplasm including germplasm description, donor,
     * stock and polymorphism data.  This method assumes tair object and basic germplasm
     * info has already been populated for the object
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public void populate( DBconnection conn ) throws SQLException {
        if ( getTairObjectID() != null && getGermplasmID() != null ) {
            donors = new ListCommunityCollection( conn, getTairObjectID(), "germplasm_donor" );
            stocks = new StockCollection( conn, getTairObjectID() );
            polymorphisms = new PolymorphismLiteCollection( conn, getGermplasmID(), "germplasm" );
            images = new ImageCollection( conn, getTairObjectID() );
            populateDescription( conn );// get description separately to speed retrieval of initial results
            populateLocusCode( conn );
            populatePhenotype( conn );// get description separately to speed retrieval of initial results
            populateSpeciesVariant( conn );
        }
    }

    private void populateDescription( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;

        if ( getGermplasmID() != null ) {
            query = "SELECT description FROM Germplasm WHERE germplasm_id = " + getGermplasmID().toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            if ( results.next() ) {
                this.description = results.getString( "description" );
            }
            conn.releaseResources();
        }
    }

    private void populateLocusCode( DBconnection conn) throws SQLException {
         String query = null;
        ResultSet results = null;
        this.locusCode = "";
        String separator = "";
        if ( getGermplasmID() != null ) {
            query = "SELECT lna.name " +
                              "FROM Germplasm_Locus_wrk gl, " +
                     "LocusNameAlias lna " +
                              "WHERE " + getGermplasmID().toString() + " = gl.germplasm_id " +
                              "AND gl.locus_id = lna.locus_id ";
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                this.locusCode += separator + results.getString( "name" );
                separator = "|";
            }
            conn.releaseResources();
        }


    }

    /**
     * Load phenotype text related to this germplasm. Note that there
     * can be multiple phenotypes for a given germplasm
     * however this 'summary' object only contains one for
     * web display purposes.
     */
    private void populatePhenotype( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;
         this.phenotype = "";
        String separator = "";
        if ( getGermplasmID() != null ) {
            query =
                "SELECT pt.phenotype AS phenotype_result_alias" +
                " FROM Germplasm g, Germplasm_Phenotype gppt, Phenotype pt" +
                " WHERE g.germplasm_id = " + getGermplasmID().toString() +
                " AND gppt.germplasm_id = g.germplasm_id" +
                " AND gppt.phenotype_id = pt.phenotype_id";
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                this.phenotype += separator + results.getString( "phenotype_result_alias" );
                separator = "|";
            }
            conn.releaseResources();
        }
    }

    // get species variant (background) info. from work table that flattens
    // out Pedigree table to create direct joins between germplasm id & all
    // species variants associated through parentage -- retrieval logic
    // encapsulated in collection so it can be used elsewhere
    private void populateSpeciesVariant( DBconnection conn ) throws SQLException {
        if ( getGermplasmID() != null ) {
            this.speciesVariants = new PedigreeSpeciesVariantCollection( conn, getGermplasmID() );
        }
    }


    /**
     * Determines if germplasm has associated stocks
     *
     * @return <code>true</code> if germplasm has associated stocks
     * or <code>false</code> if no stocks associated to germplasm
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }

    /**
     * Retrieve stocks associated to germplasm.
     *
     * @return Stocks associated with germplasm
     * as an <code>Iterator</code> of <code>StockObject</code> objects
     * or <code>null</code> if germplasm has no stocks
     */
    public Iterator getStocks() {
        return hasStocks() ? stocks.iterator() : null;
    }

    /**
     * Determines if germplasm has associated polymorphisms
     *
     * @return <code>true</code> if germplasm has associated polymorphisms
     * or <code>false</code> if no polymorphisms associated to germplasm
     */
    public boolean hasPolymorphisms() {
        return ( polymorphisms != null && !polymorphisms.isEmpty() );
    }

    /**
     * Retrieve polymorphisms associated to germplasm
     *
     * @return Polymorphisms as an <code>Iterator</code> of
     * <code>PolymorphismLite</code> objects, or <code>null</code>
     * if germplasm has no polymorphisms
     */
    public Iterator getPolymorphisms() {
        return hasPolymorphisms() ? polymorphisms.iterator() : null;
    }

    /**
     * Determines if germplasm has associated stock donors
     *
     * @return <code>true</code> if germplasm has associated stock donors
     * or <code>false</code> if no stock donors associated to germplasm
     */
    public boolean hasDonors() {
        return ( donors != null && !donors.isEmpty() );
    }

    /**
     * Retrieve donor(s) for stocks associated to germplasm
     *
     * @return Donors for germplasm's stocks as an <code>Iterator</code> of
     * <code>ListCommunity</code> objects, or <code>null</code> if germplasm
     * has no donors for its associated stocks
     */
    public Iterator getDonors() {
        return hasDonors() ? donors.iterator() : null;
    }

    /**
     * Determines if germplasm has associated stock images
     *
     * @return <code>true</code> if germplasm has associated stock images
     * or <code>false</code> if no stock images associated to germplasm
     */
    public boolean hasImages() {
        return ( images != null && !images.isEmpty() );
    }

    /**
     * Retrieve images associated to germplasm
     *
     * @return Images for germplasm as an <code>Iterator</code> of
     * <code>TfcImage</code> objects, or <code>null</code> if germplasm
     * has no images
     */
    public Iterator getImages() {
        return hasImages() ? images.iterator() : null;
    }


    /**
     * Determines if germplasm is associated to a species variant (background),
     * either directly, or through lineage in Pedigree
     *
     * @return <code>true</code> if germplasm has background info.,
     * or <code>false</code> if germplasm has no associated background info.
     */
    public boolean hasSpeciesVariants() {
        return ( speciesVariants != null && !speciesVariants.isEmpty() );
    }

    /**
     * Retrieve background base names for germplasm as string keys that
     * can be then used to get species variant ids through getSpeciesVariantID()
     *
     * @return Species variant base names associated to germplasm as an <code>
     * <code>Iterator</code> of Strings, or <code>null</code> if no speciesVariants associated
     * to germplasm
     */
    public Iterator getSpeciesVariants() {
        return ( hasSpeciesVariants() ) ? speciesVariants.getAbbreviatedNames() : null;
    }

    /**
     * Retrieves species variant ID for submitted base name, assuming base name
     * is associated with germplasm
     *
     * @param baseName Base name to find species variant id for
     * @return Long value of species variant id, or <code>null</code>
     * if base name not found in internal collection of background names
     */
    public Long getSpeciesVariantID( String baseName ) {
        return hasSpeciesVariants() ? speciesVariants.get( baseName ) : null;
    }


    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     *
     * @return TAIR accession number for this object
     */
    public String getAccession() { return AccessionManager.getAccession( this ); }

    /**
     * Retrieves element type of this object for use in creating TAIR accession
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (germplasm) for use in creating TAIR accession
     */
    public String getElementType() { return "germplasm"; }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR accession
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public Long getSuperID() { return getTairObjectID(); }



    /**
     * Creates a tab-delimited string of data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Type</li>
     * <li>Background</li>
     * <li>Stocks</li>
     * <li>Polymorphisms</li>
     * <li>Donors</li>
     * <li>Description</li>
     * <li>AGI Locus Code(s)
     * <li>TODO: Phenotype (requires updating other scripts?)</li>
     * </ul>
     *
     * @return Tab-delimited string of germplasm data
     */
    public String createExport() {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( getGermplasmName() + "\t" );
        export.append( getGermplasmType() + "\t" );
        export.append( EmptyTextConverter.convert( getSpeciesVariantNameString() ) + "\t" );
        export.append( getStockString() + "\t" );
        export.append( getPolymorphismString() + "\t" );
        export.append( getDonorString() + "\t" );
        export.append( EmptyTextConverter.convert( getDescription() ) + "\t" );
        export.append( getLocusCode() + "\t" );
        export.append( EmptyTextConverter.convert( getPhenotype() ) + "\n" );
        // TODO: export.append( EmptyTextConverter.convert( getPhenotype() ) + "\n" );
        return export.toString();
    }


    // return associated stock numbers as semi-colon delimited string -
    // for use in creating tab-delimited downloads
    private String getStockString() {
        Iterator iter = null;
        StockObject stock = null;
        boolean first = true;
        StringBuffer numbers = new StringBuffer();

        if ( hasStocks() ) {
            iter = getStocks();
            while ( iter.hasNext() ) {
                if ( !first ) {
                    numbers.append( "; " );
                }
                stock = (StockObject) iter.next();
                numbers.append( stock.get_name() );
                first = false;
            }
        }
        return numbers.toString(); // will return empty string if no stocks
    }

    // return associated polymorphism names as semi-colon delimited string -
    // for use in creating tab-delimited downloads
    private String getPolymorphismString() {
        Iterator iter = null;
        PolymorphismLite polymorphism = null;
        boolean first = true;
        StringBuffer names = new StringBuffer();

        if ( hasPolymorphisms() ) {
            iter = getPolymorphisms();
            while ( iter.hasNext() ) {
                if ( !first ) {
                    names.append( "; " );
                }
                polymorphism = (PolymorphismLite) iter.next();
                names.append( polymorphism.getOriginalName() );
                first = false;
            }
        }
        return names.toString(); // will return empty string if no polymorphisms
    }



    // return associated donor names as semi-colon delimited string -
    // for use in creating tab-delimited downloads
    private String getDonorString() {
        Iterator iter = null;
        ListCommunity donor = null;
        boolean first = true;
        StringBuffer names = new StringBuffer();

        if ( hasDonors() ) {
            iter = getDonors();
            while ( iter.hasNext() ) {
                if ( !first ) {
                    names.append( "; " );
                }
                donor = (ListCommunity) iter.next();
                names.append( donor.getDisplayName() );
                first = false;
            }
        }
        return names.toString(); // will return empty string if no donors
    }


    // return associated species variant base names as semi-colon delimited string -
    // for use in creating tab-delimited downloads
    private String getSpeciesVariantNameString() {
        Iterator iter = null;
        boolean first = true;
        StringBuffer names = new StringBuffer();

        if ( hasSpeciesVariants() ) {
            iter = getSpeciesVariants();
            while ( iter.hasNext() ) {
                if ( !first ) {
                    names.append( "; " );
                }
                names.append( (String) iter.next() );
                first = false;
            }
        }
        return names.toString(); // will return empty string if no donors
    }



    /**
     * Retrieves column order for downloads
     *
     * @return Column order used when creating export as a tab-delimited string
     */
    public String getExportHeader() {
        String header =
            "TAIR Accession\t" +
            "Name\t" +
            "Type\t" +
            "Background\t" +
            "Stocks\t" +
            "Polymorphisms\t" +
            "Donors\t" +
            "Description\t" +
            "AGI Locus Code(s)\t" +
            "Phenotype\n" ;
        // TODO: "Phenotype\n";
        return header;
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GermplasmSummary content test ******" );
        if ( hasStocks() ) {
            stocks.test();
        }

        if ( hasPolymorphisms() ) {
            polymorphisms.test();
        }

        if ( hasSpeciesVariants() ) {
            speciesVariants.test();
        }

        System.out.println( "**** GermplasmSummary content test end ****" );

    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            GermplasmSummary germplasm = new GermplasmSummary( conn, new Long( 4472019 ) );
            germplasm.test();

        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}
