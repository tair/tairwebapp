//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:28:39 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.tair.processor.genesymbol.TairObjectPublication;
import org.tair.processor.genesymbol.TairObjectPublicationCollection;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGermplasm;
import org.tair.tfc.TfcGermplasmMapElement;
import org.tair.tfc.TfcPolymorphism;
import org.tair.tfc.TfcSpeciesVariant;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.InvalidActionException;



/**
 * LoadableGermplasm extends TfcGermplasm to contain detailed information
 * about a germplasm. LoadableGermplasm is used by the microarray data
 * loading tool to handle the insertion of new germplasm data and its
 * association to clones, polymorphisms, species variants and publications
 * as needed when parsing data files to populate an expression set.
 */
 

public class LoadableGermplasm extends TfcGermplasm {
    // 
    // clone data for germplasm along with join info. for clone to 
    // germplasm
    // 
    private LoadableClone clone;
    private TfcGermplasmMapElement germplasmClone;

    // Map of polymorphism/allele data for germplasm along with join 
    // info. for associating allele to germplasm. Stored with TfcPolymorphism
    // as key referencing TfcGermplasmMapElement for germplasm/allele 
    // association. This is a little yucky, but ultimately less cumbersome
    // than creating a composite object and associated collection to 
    // handle multiple relationships -- may change my mind on this when
    // it comes time to do the online curation tool
    private Map alleles;

    private TfcSpeciesVariant speciesVariant;

    private TfcTaxon taxon;

    // publications associated to germplasm
    private TairObjectPublicationCollection publications;

    // ABRC stock number used to identify germplasm from
    // data sheet.  This value is not included in Germplasm table 
    // itself, but is recorded for display purposes
    private String stockNumber;

    // List of bio sample names germplasm is associated with; this is
    // helpful for display on Excel parsing confirmation page where all 
    // data for germplasm sheet is displayed from Germplasm's point of 
    // view.
    private List bioSampleNames;
    
    
    /**
     * Creates an empty instance of LoadableGermplasm
     */
    public LoadableGermplasm() {
	super();
    }



    /**
     * Creates an instance of LoadableGermplasm that reflects the data
     * reference by submitted germplasm id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Germplasm tair object id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableGermplasm( DBconnection conn, Long tair_object_id ) 
	throws SQLException {
	
	super( conn, tair_object_id );
    }

    /**
     * Sets ABRC stock number used to identify germplasm from
     * data sheet.  This value is not included in Germplasm table 
     * itself, but is recorded for display purposes
     *
     * @param stockNubmer ABRC stock number used to identify germplasm
     */
    public void setStockNumber( String stockNumber) {
	this.stockNumber = stockNumber;
    }


    /**
     * Retrieves ABRC stock number used to identify germplasm from
     * data sheet.  This value is not included in Germplasm table 
     * itself, but is recorded for display purposes
     *
     * @return ABRC stock number used to identify germplasm
     */
    public String getStockNumber() {
	return stockNumber;
    }


    /**
     * Adds a bio sample name to germplasm's list of bio samples it's
     * associated to
     *
     * @param bioSampleName Name of bio sample germplasm is associated to
     */
    public void addBioSampleName( String bioSampleName ) {
	if ( bioSampleNames == null ) {
	    bioSampleNames = new ArrayList();
	}
	
	bioSampleNames.add( bioSampleName );
    }


    /**
     * Determines if germplasm contains names of any bio samples it's
     * asociated to.
     *
     * @return <code>true</code> if germplasm has bio sample names stored,
     * <code>false</code> if germplasm has no record of bio samples it's 
     * associated to.
     */
    public boolean hasBioSampleNames() {
	return ( bioSampleNames != null && !bioSampleNames.isEmpty() );
    }

    /**
     * Retrieves all bio sample names germplasm is associated to
     *
     * @return Bio sample names germplasm is associated to as an 
     * <code>Iterator</code> of <code>String</code> objects or <code>null</code>
     * if no bio sample names recorded for germplasm.
     */
    public Iterator getBioSampleNames() {
	return hasBioSampleNames() ? bioSampleNames.iterator() : null;
    }


    /**
     * Sets clone data wholesale for germplasm
     *
     * @param clone Clone data to set for germplasm
     */
    public void setClone( LoadableClone clone ) {
	this.clone = clone;

	// initialize germplasmClone object representing association and 
	// set clone map element id; if inserting a new clone, map element
	// id will be NULL now, but should be set after clone data has been 
	// stored
	this.germplasmClone = new TfcGermplasmMapElement();
	germplasmClone.set_map_element_id( clone.get_map_element_id() );

    }

    /**
     * Determines if germplasm has associated clone data
     *
     * @return <code>true</code> if germplasm has associated clone data,
     * <code>false</code> if germplasm does not have associated clone data
     */
    public boolean hasClone() {
	return ( clone != null );
    }

    //
    // LoadableClone wrappers
    //
    public String get_clone_name() {
	return hasClone() ? clone.get_name() : null;
    }

    public String get_clone_insert_type() {
	return hasClone() ? clone.get_insert_type() : null;
    }

    public String get_clone_vector_type() {
	return hasClone() ? clone.get_vector_type() : null;
    }

    public String get_clone_construct_type() {
	return hasClone() ? clone.get_construct_type() : null;
    }

    public String get_clone_promoter() {
	return hasClone() ? clone.get_promoter() : null;
    }

    public String get_clone_reporter() {
	return hasClone() ? clone.get_reporter() : null;
    }

    public String get_clone_gene_name() {
	return hasClone() ? clone.get_gene_name() : null;
    }

    public Long get_clone_gene_id() {
	return hasClone() ? clone.get_gene_id() : null;
    }

    public String get_clone_taxon_scientific_name() {
	return hasClone() ? clone.get_scientific_name() : null;
    }


    //
    // TfcTaxon wrappers
    //
    public String get_taxon_original_name() { 
	return hasTaxon() ? taxon.get_original_name() : null;
    }

    public String get_genus() { 
	return hasTaxon() ? taxon.get_genus() : null;
    }

    public String get_species() {
	return hasTaxon() ? taxon.get_species() : null;
    }

    public String get_division_code() { 
	return hasTaxon() ? taxon.get_division_code() : null;
    }

    public String get_scientific_name() { 
	return hasTaxon() ? taxon.get_scientific_name() : null;
    }

    public String get_common_name() {
	return hasTaxon() ? taxon.get_common_name() : null;
    }

    public String get_taxonomy() {
	return hasTaxon() ? taxon.get_taxonomy() : null; 
    }

    public String get_genbank_taxonomy_id() { 
	return hasTaxon() ? taxon.get_genbank_taxonomy_id() : null;
    }

    /**
     * Determines if germplasm has associated taxon data
     *
     * @return <code>true</code> if germplasm has taxon data, 
     * <code>false</code> if no taxon data for germplasm
     */
    public boolean hasTaxon() {
	return ( taxon != null );
    }
    
    /**
     * Sets taxon object.  When loading from external data file, this object 
     & is assembled externally and then set with germplasm
     *
     * @param taxon Taxon for germplasm
     */
    public void setTaxon( TfcTaxon taxon ) {
	this.taxon = taxon;

	// set foreign key in superclass
	super.set_taxon_id( taxon.get_taxon_id() );
    }


    /**
     * Adds a polymorphism link for germplasm
     *
     * @param polymorphism Polymorphism to link germplasm to
     */
    public void addPolymorphism( TfcPolymorphism polymorphism ) {
	if ( alleles == null ) {
	    alleles = new HashMap();
	}
	

	// initialize germplasmAllele object representing germplasm's
	// association to polymorphism and set polymorphism map element id
	TfcGermplasmMapElement germplasmAllele = new TfcGermplasmMapElement();
	
	Long id = polymorphism.get_map_element_id();
	germplasmAllele.set_map_element_id( id );

	// add polymorphism to map as key referencing object
	// that handles the association to germplasm
	alleles.put( polymorphism, germplasmAllele );
    }


    /**
     * Determines if germplasm has associated polymorphism
     *
     * @return <code>true</code> if germplasm has associated polymorphism data,
     * <code>false</code> if germplasm does not have associated polymorphism data
     */
    public boolean hasPolymorphisms() {
	return ( alleles != null && !alleles.isEmpty() );
    }


    /**
     * Retrieves polymorphisms (alleles) associated to germplasm
     *
     * @return Polymorphisms associated to germplasm as an <code>Iterator</code>
     * of <code>TfcPolymorphism</code> objects, or <code>null</code> if no
     * polymorphisms associated to germplasm.
     */
    public Iterator getPolymorphisms() {
	return hasPolymorphisms() ? alleles.keySet().iterator() : null;
    }

    /**
     * Sets species variant data wholesale for germplasm
     *
     * @param speciesVariant Species variant data to set for germplasm
     */
    public void setSpeciesVariant( TfcSpeciesVariant speciesVariant ) {
	this.speciesVariant = speciesVariant;

	// set relationship to species variant for germplasm itself
	Long id = speciesVariant.get_species_variant_id();
	super.set_species_variant_id( id );
    }

    /**
     * Determines if germplasm has associated species variant data
     *
     * @return <code>true</code> if germplasm has associated species variant
     * data, <code>false</code> if germplasm does not have associated species
     * variant data
     */
    public boolean hasSpeciesVariant() {
	return ( speciesVariant != null );
    }

    //
    // TfcSpeciesVariant wrappers
    //
    public String get_species_variant_abbrev_name() {
	return  hasSpeciesVariant() ? speciesVariant.get_abbrev_name() : null;
    }

    public String get_species_variant_type() { 
	return hasSpeciesVariant() ? speciesVariant.get_speciesvariant_type() : null; 
    }

    public String get_species_variant_name() { 
	return hasSpeciesVariant() ? speciesVariant.get_name() : null;
    }


  /**
     * Adds a publication to be associated to germplasm
     *
     * @param publication Publication to associate to germplasm
     */
    public void addPublication( TairObjectPublication publication ) {
	if ( publications == null ) {
	    publications = new TairObjectPublicationCollection();
	}
	publications.add( publication );
    }

    /**
     * Removes publication association to germplasm
     *
     * @param publication Publication to remove
     */
    public void removePublication( TairObjectPublication publication ) {
	if ( hasPublications() ) {
	    publications.remove( publication );
	}
    }

    /**
     * Determines if germplasm has associated publications
     *
     * @return <code>true</code> if germplasm has associated publications,
     * <code>false</code> if no publications associated to germplasm
     */
    public boolean hasPublications() {
	return ( publications != null && !publications.isEmpty() );
    }


    /**
     * Retrieves publications associated to germplasm
     *
     * @return publications associated to germplasm as an 
     * <code>Iterator</code> of <code>TairObjectPublication</code> objects
     * or <code>null</code> if no publications associated to germplasm
     */
    public Iterator getPublications() {
	return hasPublications() ? publications.iterator() : null;
    }


    /**
     * Stores germplasm data and associations to database
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	// store germplasm and get newly created ids
	super.store( conn );

	// store new clone data (if needed) and germplasm's association
	// to clone
	storeClone( conn );
	
	// store germplasm's association to polymorphisms. Polymorphism 
	// data itself is not INSERTed or UPDATEd in this operation.
	storePolymorphisms( conn );

	// store germplasm's association to publications
	storePublications( conn );
    }
    

    /**
     * Stores germplasm's association to clone data. Clone data will be
     * INSERTed if no record exists for clone, however existing clone data
     * will not be UPDATEd. May have to change this depending on requirements
     * on online curation tool.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set
     * for any elements
     * @throws SQLException if a database error occurs
     */
    private void storeClone( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	if ( hasClone() ) {
	    if ( clone.get_clone_id() == null ) {

		// store new clone data
		clone.store( conn );
		
		// add log message that clone was inserted
		InsertLogger.log( "Inserted clone " + clone.get_name() + 
				  " [vector type: " + 
				  clone.get_vector_type() + "]" +
				  " [insert type: " + 
				  clone.get_insert_type() + "]" +
				  " [clone id: " + 
				  clone.get_clone_id() + "] " );
	    }
	    
	    // set clone's map element id and associate to germplasm
	    germplasmClone.set_germplasm_id( get_germplasm_id() );
	    germplasmClone.set_map_element_id( clone.get_map_element_id() );
	    germplasmClone.store( conn );
	}
    }


    /**
     * Stores germplasm's associations to polymorphisms.  Polymorphism
     * data itself is not INSERTed or UPDATEd in this operation
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set
     * for any elements
     * @throws SQLException if a database error occurs
     */
    private void storePolymorphisms( DBconnection conn )
	throws InvalidActionException, SQLException {

	if ( hasPolymorphisms() ) {
	    TfcPolymorphism poly = null;
	    TfcGermplasmMapElement germplasmAllele = null;
	    
	    Iterator iter = alleles.keySet().iterator();
	    while ( iter.hasNext() ) {
		poly = (TfcPolymorphism) iter.next();
		germplasmAllele = (TfcGermplasmMapElement) alleles.get( poly );
		germplasmAllele.set_germplasm_id( get_germplasm_id() );
		germplasmAllele.store( conn );
	    }
	}
    }


    /**
     * Stores germplasm's association to publications. Publication data will be
     * not itself be updated.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set
     * for any elements
     * @throws SQLException if a database error occurs
     */
    private void storePublications( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// set tair object id for publications and store associations
	if ( hasPublications() ) {
	    publications.set_tair_object_id( get_tair_object_id() );
	    publications.store( conn );
	}
    }

}
