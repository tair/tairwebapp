//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.34 $
// $Date: 2006/09/16 00:28:01 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;

import java.sql.*;
import java.util.*;
import java.io.*;

/**
 * PolyAlleleDetail is a composite class to represent all information
 * associated with an entry in the Polymorphism table for display
 * on the Polymorphism/Allele detail page which displays detail information 
 * about reference polymorphisms. PolyAlleleDetail contains instances of 
 * <code>TfcPolymorphism</code>, <code>TfcGeneticMarker</code> to reference 
 * the genetic marker associated with this polymorphism, and 
 * <code>TfcClone</code> to reference the clone information associated with 
 * this polymorphism.  
 *
 * <p>
 * Additionally, collections of: all associated polymorphisms via 
 * <code>PolymorphismObjectCollection</code>, associated gene models via 
 * <code>PolymorphismObjectCollection</code>, associated germplasm information
 * via <code>GermplasmObjectVector</code>.  Information up the hierachy is 
 * also available from <code>MapElementDetail</code> and 
 * <code>TairObjectDetail</code>  superclasses.
 */

public class PolyAlleleDetail extends MapElementDetail {

    private TfcPolymorphism polymorphism;

    // clone info from tfc_clone - construct type, promoter, reporter
    private TfcClone tfcClone;

    // genetic marker info from tfc_genetic_marker - name, type
    private TfcGeneticMarker tfcGeneticMarker;

    // a collection of polymorphisms associated to a reference polymorphism - 
    // stored as PolymorphismObjects
    private PolymorphismObjectCollection polymorphisms;

    // a collection of germplasm information associated to a polymorphism - 
    // stored as GermplasmObjects 
    private GermplasmCollection germplasms;

    // a collection of gene models associated to a polymorphism - stored as
    // GeneModel objects
    private GeneModelCollection geneModels;

    // collection of loci associated directly to polymorphism - 
    // stored as Locus
    private LocusCollection loci;

    // a collection of genetic markers associated to a ref polymorphism - 
    // stored as GeneticMarker 
    private GeneticMarkerCollection geneticMarkers;
    
    /**
     * Creates an empty instance of PolyAlleleDetail
     */
    public PolyAlleleDetail() {
	super();
    }


    /**
     * Creates an instance of PolyAlleleDetail that represents
     * all data referenced by submitted reference polymorphism id.
     *
     * @param conn An active connection to the database
     * @param polymorphismID polymorphism id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public PolyAlleleDetail( DBconnection conn, Long polymorphismID ) 
	throws SQLException {

	get_information( conn, polymorphismID );
    } 

    /**
     * Creates an instance of PolymorphismDetail that represents
     * all data referenced by submitted polymorphism name.
     *
     * @param conn An active connection to the database
     * @param name Polymorphism name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public PolyAlleleDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }
  

    /**
     * Sets the polymorphism
     * @param value the polymorphism <code>TfcPolymorphism</code> 
     */
    private void setPolymorphism( TfcPolymorphism value ) { 
	polymorphism = value; 
    }

    /**
     * retrieve the polymorphism tfc object
     * 
     */
    private TfcPolymorphism getPolymorphism() {
	return polymorphism; 
    }

    /**
     * Sets the clone info
     * @param value the clone <code>TfcClone</code> 
     */
    private void setClone( TfcClone value ) { 
	tfcClone = value; 
    }

    /**
     * retrieve the clone tfc object
     * 
     */
    private TfcClone getClone() {
	return tfcClone; 
    }

    /**
     * Sets the genetic marker info
     * @param value the genetic marker <code>TfcGeneticMarker</code> 
     */
    private void setGeneticMarker( TfcGeneticMarker value ) { 
	tfcGeneticMarker = value; 
    }

    /**
     * retrieve the genetic marker tfc object
     * 
     */
    private TfcGeneticMarker getGeneticMarker() { 
	return tfcGeneticMarker; 
    }

    /**
     * Sets the polymorphisms
     * @param value the polymorphisms <code>PolymorphismObjectCollection</code> 
     */
    private void setPolymorphismObjects( PolymorphismObjectCollection value ) { 
	polymorphisms = value;
    }

    /**
     * retrieve the PolymorphismObjectCollection
     * 
     */
    private PolymorphismObjectCollection getPolymorphismObjects() { 
	return polymorphisms; 
    }

    /**
     * Sets the geneModels
     * @param value the geneModels <code>GeneModelCollection</code> 
     */
    private void setGeneModels( GeneModelCollection value ) { 
	geneModels = value;
    }

    /**
     * retrieve the GeneModelCollection
     * 
     */
    private GeneModelCollection getGeneModels() { 
	return geneModels; 
    }

    /**
     * Sets the geneticMarkers
     * @param value the geneticMarkers <code>GeneticMarkerCollection</code> 
     */
    private void setGeneticMarkers( GeneticMarkerCollection value ) { 
	geneticMarkers = value;
    }

    /**
     * retrieve the GeneticMarkerCollection
     * 
     */
 
    private GeneticMarkerCollection getGeneticMarkers() { 
	return geneticMarkers; 
    }

    /**
     * Sets the germplasms - a collection of germplasms associated to this 
     * reference polymorphism, and sorted by the size of germplasm's related 
     * polymorphism 
     *
     * @param DBconnection  
     */
    private void setGermplasms( DBconnection conn ) throws SQLException {
        germplasms = new GermplasmCollection( conn, 
					      get_map_element_id(), 
					      "poly" );

        germplasms.populatePolymorphisms( conn );
        germplasms.populateSpeciesVariants( conn );
        germplasms.populateStocks( conn );
        germplasms.sort( new GermplasmComparator() );
    }

    /**
     * retrieve the GermplasmCollection
     * 
     */
    private GermplasmCollection getGermplasms() { 
	return germplasms; 
    }

    //
    // TfcPolymorphism wrappers
    //
    public Long get_polymorphism_id() { 
	return getPolymorphism().get_polymorphism_id(); 
    }

    public Long get_ref_polymorphism_id() { 
	return getPolymorphism().get_ref_polymorphism_id();
    }

    public Long get_taxon_id() { 
	return getPolymorphism().get_taxon_id();
    }

    public Long get_genetic_marker_id() {
	return getPolymorphism().get_genetic_marker_id();
    }

    public Long get_clone_id() {
	return getPolymorphism().get_clone_id();
    }  

    public Long get_vector_id() { 
	return getPolymorphism().get_vector_id();
    }  

    public Long get_caused_by_id() { 
	return getPolymorphism().get_caused_by_id();
    }  

    public String get_name() {
	return getPolymorphism().get_name();
    }

    public String get_chromosome() { 
	return getPolymorphism().get_chromosome();
    }

    public String get_lengths() { 
	return getPolymorphism().get_lengths();
    }

    public String get_units() { 
	return getPolymorphism().get_units(); 
    }

    public Boolean get_has_flank_sequence() { 
	return getPolymorphism().get_has_flank_sequence();
    }

    public Boolean get_is_induced() { 
	return getPolymorphism().get_is_induced();
    }

    public Boolean get_is_present() {
	return getPolymorphism().get_is_present(); 
    }

    public Boolean get_has_observable_phenotype() {
	return getPolymorphism().get_has_observable_phenotype();
    }

    public Boolean get_is_obsolete() { 
	return getPolymorphism().get_is_obsolete(); 
    }

    public String get_type() { 
	return getPolymorphism().get_polymorphism_type();
    }

    public Boolean get_is_allele() { 
	return getPolymorphism().get_is_allele(); 
    }

    public String get_allele_mode() {
	return getPolymorphism().get_allele_mode();
    } 

    public String get_mutation_site() {
	return getPolymorphism().get_mutation_site();
    }

    public String get_mutagen() {
	return getPolymorphism().get_mutagen();
    }  

    public String get_insertion_type() {
	return getPolymorphism().get_insertion_type();
    }

    public String get_deletion_type() {
	return getPolymorphism().get_deletion_type();
    }

    public String get_inheritance() { 
	return getPolymorphism().get_inheritance();
    }

    public String get_description() {
	return getPolymorphism().get_description();
    }  

    public String get_polymorphic_sequence() { 
	return getPolymorphism().get_polymorphic_sequence();
    } 

    public Integer get_state_number() {
	return getPolymorphism().get_state_number(); 
    }    

    public java.util.Date get_date_last_modified() { 
	return getPolymorphism().get_date_last_modified();
    }

    public java.util.Date get_date_entered() { 
        return getPolymorphism().get_date_entered();
    }
    
    public String get_original_name() { 
        return getPolymorphism().get_original_name();
    }

    //
    // TfcClone wrappers
    //
    public String get_construct_type() { 
	return ( getClone() != null ) ? getClone().get_construct_type() : null;
    }

    //
    // TfcGeneticMarker wrappers
    //
    public String get_genetic_marker_name() { 
	return ( getGeneticMarker() != null ) ?
	    getGeneticMarker().get_name() : null; 
    }
    
    public String get_genetic_marker_type() {
	return ( getGeneticMarker() != null ) ? 
	    getGeneticMarker().get_type() : null; 
    }

    /**
     * Gets the seqviewer_type as a <code>String</code>
     *
     * @return a <code>String</code>
     * representing the type needed for the seqviewer link
     */ 
    public String get_seqviewer_type() {
        String seq_type = null;
        if ( get_insertion_type() != null ) {
            if ( get_insertion_type().equalsIgnoreCase( "T-DNA" ) ||
                 get_insertion_type().equalsIgnoreCase( "transposant" ) ) {

                seq_type = "tdna";
            } else {
                seq_type = "polymorphism";      
            }
        } else {
            seq_type = "polymorphism";
        }
        return seq_type;
    }

    /**
     * @return <code>true</code> if polymorphism has polymorphisms associated
     * with it, or <code>false</code> if no polymorphisms for reference 
     * polymorphism
     */
    public boolean has_polymorphisms() { 
	return ( polymorphisms != null && ( polymorphisms.size() > 0) ); 
    }

    /**
     * Gets the polymorphisms as an <code>Iterator</code>
     * of <code>PolymorphismObject</code>s.
     * @return an <code>Iterator</code> of <code>PolymorphismObject</code>s 
     * value specifying the polymorphisms associated with this reference
     * polymorphism
     * @see PolymorphismObject
     */ 
    public Iterator get_polymorphisms() {
        Iterator iter = null;
        if ( has_polymorphisms() ) {
            iter = polymorphisms.iterator();
        }
        return iter;
    }

    /**
     * Returns an <code>Iterator</code> of <code>PolymorphismObject</code>s
     * where polymorphism type equals the requested type.
     *
     * @param type Type of Polymorphism to return
     * @return <code>Iterator</code> of <code>PolymorphismObject</code>s with
     * the requested type, or <code>null</code> if no objects in collection have
     * the requested type. If submitted type is <code>null</code>, all 
     * polymorphisms in the collection will be returned
     */
    public Iterator get_polymorphisms( String type ) {
        return ( polymorphisms != null ) ? 
	    polymorphisms.get_polymorphisms( type ) : null;
    }

    /**
     * Returns an <code>Iterator</code> of <code>PolymorphismObject</code>s
     * where polymorphism type equals of the requested types
     *
     * @param types Types of Polymorphism to return
     * @return <code>Iterator</code> of <code>PolymorphismObject</code>s with
     * the requested types, or <code>null</code> if no objects in collection
     * have the requested types. If submitted types list is <code>null</code>, 
     * all polymorphisms in the collection will be returned
     */
    public Iterator get_polymorphisms( String[] types ) {
        return( polymorphisms != null ) ? 
	    polymorphisms.get_polymorphisms( types ) : null;
    }

    /**
     * @return <code>true</code> if polymorphism has gene models associated 
     * with it, or <code>false</code> if no gene models for reference 
     * polymorphism
     */
    public boolean has_gene_models() { 
	return ( geneModels != null && ( geneModels.size() > 0) ); 
    }


    /**
     * Gets the geneModels as an <code>Iterator</code>
     * of <code>GeneModelObject</code>s.
     *
     * @return an <code>Iterator</code> of <code>TfcGene</code>s value 
     * specifying the genes associated with this reference polymorphism's 
     * map_element_id
     * @see TfcGene
     */ 
    public Iterator get_gene_models() {
        Iterator iter = null;
        if ( has_gene_models() ) {
            iter = geneModels.iterator();
        }
        return iter;
    }

    /**
     * @return <code>true</code> if polymorphism has genetic markers associated
     * with it, or <code>false</code> if no genetic markers for reference 
     * polymorphism
     */
    public boolean has_genetic_markers() { 
	return ( geneticMarkers != null && (geneticMarkers.size() > 0) ); 
    }

    /**
     * Gets the genetic_marker_collection as an <code>Iterator</code>
     * of <code>TfcGeneticMarker</code>s.
     * 
     * @return an <code>Iterator</code> of <code>GeneticMarker</code>s value 
     * specifying the genetic markers associated with this reference 
     * polymorphism's ref_polymorphism_id
     * @see GeneticMarker
     */ 
    public Iterator get_genetic_markers() {
        Iterator iter = null;
        if ( has_genetic_markers() ) {
            iter = geneticMarkers.iterator();
        }
        return iter;
    }

    /**
     * Determines if polymorphism has loci directly associated to it
     *
     * @return <code>true</code> if polymorphism has loci directly associated
     * to it, or <code>false</code> if no loci associated to polymorphism
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves loci associated to polymorphism
     *
     * @return Loci associated to polymorphism as an <code>Iterator</code>
     * of <code>TfcLocus</code> objects, or <code>null</code> if no loci 
     * associated to polymorphism
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
    }

    /**
     * @return <code>true</code> if polymorphism has germplasms associated with it, 
     * or <code>false</code> if no germplasms for reference polymorphism
     */
    public boolean has_germplasms() {
	return ( germplasms != null && (germplasms.size() > 0) ); 
    }

    /**
     * Gets the germplasms as an <code>Iterator</code>
     * of <code>Germplasm</code>s.
     *
     * @return an <code>Iterator</code> of <code>Germplasm</code>s value 
     * specifying the germplasms associated with this reference polymorphism
     * @see Germplasm
     */ 
    public Iterator get_germplasms() {
        Iterator iter = null;
        if ( has_germplasms() ) {
            iter = germplasms.iterator();
        }
        return iter;
    }

    /**
     * Gets the number of germplasms associated with this reference polymorphism.
     *
     * @return an <code>int</code> value specifying the number germplasms associated with this reference polymorphism
     * @see Germplasm
     */
    public int getGermplasmCount()
    {
        return has_germplasms() ? germplasms.size() : 0;
    }

    /** 
     * Populates object with data referenced by submitted polymorphism name
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws SQLException {
	
	Long polyID = TfcPolymorphism.retrievePolymorphismID( conn, name );
	get_information( conn, polyID );
    }


    /**
     * Populates object with data referenced by submitted polymorphism id
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long polymorphismID )
	throws SQLException {           

	setPolymorphism( new TfcPolymorphism( conn, polymorphismID ) );
	super.populateBaseObject( getPolymorphism() );

	PolymorphismObjectCollection polys = 
	    new PolymorphismObjectCollection( conn, 
					      get_ref_polymorphism_id(), 
					      "poly" );

	polys.populateRestrictionEnzymes( conn );
	polys.populateSpeciesVariants( conn );
	polys.populateHasAttributions( conn );
	polys.populateFlankingSequences( conn );
	setPolymorphismObjects(  polys );

	GeneModelCollection genes = 
	    new GeneModelCollection( conn, 
				     get_map_element_id() );

	genes.populateLocus( conn ); // get associated loci for all genes
	setGeneModels( genes );
	setGermplasms( conn );

	// get any loci directly associated to polyallele
	this.loci = new LocusCollection( conn, 
					 get_map_element_id() ); 
	
	// MapElementDetail data
	populateShowMapViewer( conn, 
			       get_map_element_id(), 
			       get_map_element_type() );

	populateIsAGIMap( conn, get_map_element_id() );
	populateFlankingSequences( conn, get_map_element_id() );

	// populate w/full sequence text
	populateNTSequences( conn, get_map_element_id(), true ); 
	populateGlobalAssignments( conn, get_map_element_id() );


	// TairObjectDetail data
	populateAliases( conn, get_tair_object_id() );
	populateAnnotations( conn, get_tair_object_id() );
	populateAttributions( conn, get_tair_object_id() );
	populatePublications( conn, get_tair_object_id() );
	populateAnalysisReferences( conn, get_tair_object_id() );
	populateDatabaseReferences( conn, get_tair_object_id() );
	populateCommunications( conn, get_tair_object_id() );
	populateExternalLinks( conn, get_tair_object_id() );
	populateNotepad( conn, get_tair_object_id() );
	populateImages( conn, get_tair_object_id() );

	if ( this.get_clone_id() != null ) {
	    setClone( new TfcClone( conn, this.get_clone_id() ) );     
	}

	setGeneticMarkers( 
	   new GeneticMarkerCollection( conn, 
					get_ref_polymorphism_id(),
					"ref_polymorphism" ) );

	if ( this.get_genetic_marker_id() != null ) {
	    setGeneticMarker( new TfcGeneticMarker( conn, 
						    get_genetic_marker_id() ) );
        }
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** PolyAlleleDetail content test ******" );
        if ( getPolymorphism() != null ) {
            getPolymorphism().test();
        }
        System.out.println( "****** tfcClone ******" );
        if ( getClone() != null ) {
            getClone().test();
        }
        System.out.println( "****** associated polymorphisms ******" );
        if ( has_polymorphisms() ) {
            getPolymorphismObjects().test();
        }
        System.out.println( "****** gene models ******" );
        if ( has_gene_models() ) {
            getGeneModels().test();
        }
        System.out.println( "****** associated genetic markers ******" );
        if ( has_genetic_markers() ) {
            getGeneticMarkers().test();
        }
        System.out.println( "****** associated germplasms ******" );
        if ( has_germplasms() ) {
            getGermplasms().test();
      
        }
        System.out.println( " element type = " + getElementType() );
        System.out.println( "**** PolyAlleleDetail content test end ****" );
    }
            
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection connection = new DBconnection();
            Long test_id = new Long( 126 );
            PolyAlleleDetail pad = new PolyAlleleDetail( connection,
							 test_id );
            pad.setGermplasms( connection );
       
            pad.test();
            System.out.println( "**********************************************" );
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

  

}



