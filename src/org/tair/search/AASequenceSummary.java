//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.10 $
// $Date: 2004/09/08 21:00:29 $
//------------------------------------------------------------------------------ 

package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.bs.community.BsAttribution;
import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;
 

/**
 * AASequenceSummary represents the information needed to display 
 * one AA sequence record as part of the protein search results. 
 * AASequenceSummary contains all fields from the temp table used 
 * to hold search results (defined in AASequenceTableInfo) as well 
 * as collections of additional information (such as annotations, 
 * attributions and associated genes/loci)
 *
 * <p>
 * AASequenceSummary implements Accessible interface to facilitate 
 * creation of the object's TAIR accession number through 
 * <code>AccessionManager</code>
 */

public class AASequenceSummary implements Accessible {
  

    // basic info on AA sequence
    private Long tairObjectID;
    private Long aaSequenceID;
    private String name;
    private Float calc_MW;
    private Float calc_pI;
    private Integer length;
    private java.util.Date dateLastModified;


    // genes associated to AA sequence - stored as GeneModelLite 
    // (which contain gene's loci)
    private GeneModelLiteCollection genes;

    // attributions of type "submitted_by" - stored as BsAttribution;
    // this data in only used in downloads, so will only be populated
    // when populateAttributions is called explicitly
    private AttributionObjectCollection attributions;

    /**
     * Creates an empty instance of AASequenceSummary
     */
    public AASequenceSummary() {  }


    public void setTairObjectID( Long id ) { 
        this.tairObjectID = id; 
    }

    public Long getTairObjectID() { 
        return tairObjectID; 
    }

    public void setAASequenceID( Long id ) { 
        this.aaSequenceID = id; 
    }

    public Long getAASequenceID() { 
        return aaSequenceID; 
    }

    public void setName( String name ) { 
        this.name = name; 
    }

    public String getName() { 
        return name; 
    }

    public void setDateLastModified( java.util.Date date ) { 
        this.dateLastModified = date; 
    }

    public java.util.Date getDateLastModified() {
        return dateLastModified; 
    }

    public void setCalcMW( Float calc_MW ) {
        this.calc_MW = calc_MW;
    }

    public Float getCalcMW() {
        return calc_MW;
    }

    public void setCalcPI( Float calc_pI ) {
        this.calc_pI = calc_pI;
    }

    public Float getCalcPI() {
        return calc_pI;
    }
  
    public void setLength( Integer length ) {
        this.length = length;
    }

    public Integer getLength() {
        return length;
    }

                             
    /**
     * Retrieves associated data for AA sequence including associated genes.
     * This method assumes tair object and basic AA sequence info has already
     * been populated for the object
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public void populate( DBconnection conn ) throws SQLException {
	genes = new GeneModelLiteCollection( conn, 
					     getAASequenceID(), 
					     "aa_sequence" );
    }
  

    /**
     * Determines if AA sequence has associated genes
     *
     * @return <code>true</code> if AA sequence has associated genes, 
     * or <code>false</code> if AA sequence has no associated genes
     */
    public boolean hasGenes() {
        return ( genes != null && !genes.isEmpty() );
    }
  
    /**
     * Retrieve genes associated to AA sequence
     *
     * @return Genes associated to AA sequence as an <code>Iterator</code>
     * of <code>GeneModelLite</code> objects or <code>null</code> if sequence
     * has no genes
     */
    public Iterator getGenes() { 
        return hasGenes() ? genes.iterator() : null;
    }

    /**
     * Populates collection of attributions for AA sequence to contain 
     * attributions of type "submitted_by".  This collection must be populated
     * explicitly through this method. This data is only used for downloads.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateAttributions( DBconnection conn ) throws SQLException {
        attributions =  new AttributionObjectCollection( conn, 
							 getTairObjectID(), 
							 "submitted_by" );
    }

    /**
     * Determines if AA sequence has associated attributions
     *
     * @return <code>true</code> if AA sequence has associated attributions, 
     * or <code>false</code> if AA sequence has no associated attributions
     */
    public boolean hasAttributions() {
        return ( attributions != null && !attributions.isEmpty() );
    }


    /**
     * Retrieves attributions for AA sequence
     *
     * @return Attributions for sequence as an <code>Iterator</code> of 
     * <code>BsAttribution</code> objects, or <code>null</code> if AA
     * sequence has no associated attributions
     */
    public List<BsAttribution> getAttributions() {
        return hasAttributions() ? attributions.getAttributions() : null;
    }


    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public String getAccession() { 
        return AccessionManager.getAccession( this ); 
    }

    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (aa_sequence) for use in creating TAIR 
     * accession
     */
    public String getElementType() { 
        return "aa_sequence"; 
    }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR 
     * accession number. Implemented here to satisfy the <code>Accessible</code>
     * interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public Long getSuperID() { 
        return getTairObjectID(); 
    }



    /**
     * Creates a tab-delimited string of this AA sequence's data for 
     * downloading. The data is returned in the following column order:
     *
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Source</li>
     * <li>Last Updated</li>
     * <li>calc MW</li>
     * <li>calc pI</li>
     * <li>length</li>
     * <li>Gene</li>
     * <li>Description</li>
     * <li>Locus</li>
     * </ul>
     *
     * @return Tab-delimited string of clone end data
     * @throws SQLException when can't lazily load community for attribution
     */     
    public String createExport() throws SQLException {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( getName() + "\t" );

	String attribs = attributions.get_attribution_source_string();
	export.append( EmptyTextConverter.convert( attribs ) + "\t" );

        java.util.Date modDate = getDateLastModified();
        export.append( EmptyTextConverter.convert( modDate ) + "\t" );
        export.append( EmptyTextConverter.convert( getCalcMW() ) + "\t" );
        export.append( EmptyTextConverter.convert( getCalcPI() ) + "\t" );
        export.append( EmptyTextConverter.convert( getLength() ) + "\t" );

	// add gene name, description & loci in same action
        appendGeneInfo( export ); 
	
        return export.toString();
    }

    /**
     * Add gene name, description and associated loci to export string for 
     * downloads
     *
     * @param export Export string to append gene data to
     */
    private void appendGeneInfo( StringBuffer export ) {
        Iterator locusIter = null;
        GeneModelLite gene = null;
        TfcLocus locus = null;

        boolean firstGene = true;
        boolean firstDescription = true;
        boolean firstLocus = true;

        StringBuffer geneNames = new StringBuffer();
        StringBuffer geneDescriptions = new StringBuffer();
        StringBuffer locusNames = new StringBuffer();
      
        if ( hasGenes() ) {
            Iterator iter = getGenes();

            // save up multiple gene names, descriptions and loci for appending
            // after iteration -- allows us to just traverse collection once &
            // get everything we need 
            while ( iter.hasNext() ) {
                gene = (GeneModelLite) iter.next();
                if ( !firstGene ) {
                    geneNames.append( "; " );
                }
                geneNames.append( gene.getName() );
                firstGene = false;

                if ( gene.getDescription() != null ) {
                    if ( !firstDescription ) {
                        geneDescriptions.append( "; " );
                    }
                    geneDescriptions.append( gene.getDescription() );
                    firstDescription = false;
                }

                if ( gene.hasLocus() ) {
                    firstLocus = true;
                    locusIter = gene.getLocus();
                    while ( locusIter.hasNext() ) {
                        locus = (TfcLocus) locusIter.next();
                        if ( !firstLocus ) {
                            locusNames.append( "; " );
                        }
                        locusNames.append( locus.get_name() );
                        firstLocus = false;
                    }
                }
            }
        }
        export.append( geneNames.toString() + "\t" );
        export.append( geneDescriptions.toString() + "\t" );
        export.append( locusNames.toString() + "\n" );
    }


    /**
     * Retrieves column order of tab delimited export
     *
     * @return Column order used when creating export as a tab-delimited string
     */ 
    public String getExportHeader() {
        String header = 
            "TAIR Accession\t" +
            "Name\t" +
            "Source\t" +
            "Last Updated\t" +
            "Calc MW\t" +
            "Calc pI\t" +
            "Length\t" +
            "Gene\t" +
            "Description\t" +
            "Locus\n";

        return header;
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** AASequenceSummary content test ******" );
        System.out.println( "tair object id: " + getTairObjectID() );
        System.out.println( "AA sequence id: " + getAASequenceID() );
        System.out.println( "name: " + getName() );
        System.out.println( "date last modified: " + getDateLastModified() );
        System.out.println( "calc MW: " + getCalcMW() );
        System.out.println( "calc pI: " + getCalcPI() );
        System.out.println( "length: " + getLength() );
    
        if ( hasAttributions() ) {
            // attributions.test();
        }

        if ( hasGenes() ) {
            genes.test();
        }

        System.out.println( "**** AASequenceSummary content test end ****" );
    }

}
