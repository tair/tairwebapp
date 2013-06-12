//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.25 $
// $Date: 2004/06/01 16:32:19 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * CloneDetail is a composite class to represent all information associated 
 * with an entry in the Clone table for display on the clone detail page. 
 * CloneDetail contains instances of <code>TfcClone</code>, 
 * <code>TfcAssemblyUnit</code>, <code>TfcLibrary</code>,<code>TfcVector</code>,
 * <code>TfcRestrictionEnzyme</code> (1 and 2), <code>TfcCloneChimerism</code>,
 * <code>TfcHostStrain</code> and collections of all genetic markers in the 
 * clone, stocks, genes, loci and clone ends associated with clone, in addition
 * to all information in <code>MapElementDetail</code> and 
 * <code>TairObjectDetail</code> superclasses.
 */

public class CloneDetail extends MapElementDetail {

    private TfcClone clone;
    private TfcAssemblyUnit assembly_unit;
    private TfcVector vector;   
    private TfcLibrary library;
    private TfcRestrictionEnzyme restriction_enzyme_1;
    private TfcRestrictionEnzyme restriction_enzyme_2;
    private TfcCloneChimerism clone_chimerism;
    private TfcTaxon taxon;
    private TfcSpeciesVariant speciesVariant;
    private HostStrain hostStrain;

    // parent clone of this clone
    private Clone parentClone;

    // Clone ends associated with clone - stored as CloneEnd
    private CloneEndCollection clone_end;

    // Clone alt sizes associated w/clone - stored as TfcCloneAlternateSize
    private CloneAltSizeCollection cloneAltSize;

    // Stocks associated with clone - stored as TfcStock
    private StockCollection stocks;
  
    // Genes associated with clone - stored as GeneModel (w/collection 
    // of loci for each)
    private GeneModelCollection genes;

    // Loci associated w/clone - stored as Locus (may be different than 
    // those in gene collection)
    private LocusCollection loci;


    /**
     * Creates an empty instance of CloneDetail
     */
    public CloneDetail() {  }


    /**
     * Creates an instance of CloneDetail to reflect the data referenced
     * by the submitted clone id.
     *
     * @param conn An active connection to the database
     * @param clone_id Clone id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public CloneDetail( DBconnection conn, Long clone_id )
	throws RecordNotFoundException, SQLException {

	get_information( conn, clone_id );
    }


    /**
     * Creates an instance of CloneDetail to reflect the data referenced
     * by the submitted clone name.
     *
     * @param conn An active connection to the database
     * @param name Clone name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public CloneDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }
  

    /**
     * Retrieves all data for submitted clone name & populates member objects
     *
     * @param conn An active connection to the database
     * @param name Clone name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
        throws RecordNotFoundException, SQLException {
	
	Long id = TfcClone.retrieveCloneID( conn, name );

	if ( id == null ) {
	    throw new RecordNotFoundException( "No clone found with name: " +
					       name );
	}
	get_information( conn, id );
    }
  

    /**
     * Retrieves all data for submitted clone id & populates member objects
     *
     * @param conn An active connection to the database
     * @param clone_id Clone id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long clone_id )
	throws RecordNotFoundException, SQLException {

        clone = new TfcClone( conn, clone_id );
        super.populateBaseObject( clone );
    
	
	clone_end = new CloneEndCollection( conn, clone_id, "clone" );
	cloneAltSize = new CloneAltSizeCollection( conn, clone_id );
    
        if ( clone.get_vector_id() != null ) {
            vector = new TfcVector( conn, clone.get_vector_id() );
        }

        if ( clone.get_library_id() != null ) {
            library = new TfcLibrary( conn, clone.get_library_id() );
        }
    
        if ( clone.get_cloning_enzyme_1_id() != null ) {
            restriction_enzyme_1 = 
                new TfcRestrictionEnzyme( conn,
					  clone.get_cloning_enzyme_1_id() );
        }

        if ( clone.get_cloning_enzyme_2_id() != null ) {
            restriction_enzyme_2 =
                new TfcRestrictionEnzyme( conn, 
					  clone.get_cloning_enzyme_2_id() );
        }
    
        if ( clone.get_is_chimeric() != null && 
             clone.get_is_chimeric().booleanValue() && 
             clone.get_clone_chimerism_id() != null ) {

            clone_chimerism = 
		new TfcCloneChimerism( conn, 
				       clone.get_clone_chimerism_id() );
        }
    
        if ( clone.get_assembly_unit_id() != null ) {
            assembly_unit = 
		new TfcAssemblyUnit( conn, 
				     clone.get_assembly_unit_id() );
        }

        if ( clone.get_taxon_id() != null ) {
            taxon = new TfcTaxon( conn, clone.get_taxon_id() );
        }

        if ( clone.get_species_variant_id() != null ) {
            speciesVariant =
		new TfcSpeciesVariant( conn,
				       clone.get_species_variant_id() );
        }

	if ( clone.get_host_strain_id() != null ) {
	    hostStrain = new HostStrain( conn,
					 clone.get_host_strain_id() );
	}

	// get stocks and stock donor info.
        stocks = new StockCollection( conn, get_tair_object_id() );
	stocks.populateDonors( conn );

        genes = new GeneModelCollection( conn, get_map_element_id() );
        genes.populateLocus( conn ); // get associated loci for genes

        // get other associated loci
        loci = new LocusCollection( conn, get_map_element_id() );

        // get parent clone if any exists; populate stock data
        // for parent explicitly
        if ( get_parent_clone_id() != null ) {
            this.parentClone = new Clone( conn, get_parent_clone_id() );
            parentClone.populateStocks( conn );
        }
   
	// populate superclass data
	getMapElementInformation( conn );
	getTairObjectInformation( conn );
    }
  
    //
    // TfcClone wrappers
    //
    public Long get_clone_id() { 
        return ( clone != null ) ? clone.get_clone_id() : null;
    }

    public String get_clone_name() {
        return ( clone != null ) ? clone.get_name() : null;
    }

    public String get_chromosome() {
        return ( clone != null ) ? clone.get_chromosome() : null;
    }

    public Float get_insert_size() {
        return ( clone != null ) ? clone.get_insert_size() : null;
    }
    
    public String get_units() {
        return ( clone != null ) ? clone.get_units() : null;
    }

    public java.util.Date get_date_last_modified() {
        return ( clone != null ) ? clone.get_date_last_modified() : null;
    }

    public String get_insert_type() {
        return ( clone != null ) ? clone.get_insert_type() : null;
    }

    public String get_clone_vector_type() {
        return ( clone != null ) ? clone.get_vector_type() : null;
    }

    public Boolean get_has_clone_end() {
        return ( clone != null ) ? clone.get_has_clone_end() : null;
    }

    public Boolean get_is_sequenced() {
        return ( clone != null ) ? clone.get_is_sequenced() : null;
    }

    public Boolean get_has_flank_sequence() {
        return ( clone != null ) ? clone.get_has_flank_sequence() : null;
    }

    public Boolean get_is_chimeric() {
        return ( clone != null ) ? clone.get_is_chimeric() : null;
    }

    public Boolean get_is_obsolete() {
        return ( clone != null ) ? clone.get_is_obsolete() : null;
    }

    public String get_antibiotic_selection() {
        return ( clone != null ) ? clone.get_antibiotic_selection() : null;
    }

    public Float get_length() { 
        return ( clone != null ) ? clone.get_length() : null;
    }

    public String get_construct_type() {
        return ( clone != null ) ? clone.get_construct_type() : null;
    }

    public String get_reporter() { 
        return ( clone != null ) ? clone.get_reporter() : null;
    }

    public String get_promoter() {
        return ( clone != null ) ? clone.get_promoter() : null;
    }

    public Long get_parent_clone_id() {
        return clone.get_parent_clone_id();
    }

    public java.util.Date get_date_entered() { 
        return clone.get_date_entered();
    }
    
    public String get_original_name() { 
        return clone.get_original_name();
    }

    //
    // TfcAssemblyUnit wrappers
    //
    public Long get_assembly_unit_id() {
        return ( assembly_unit != null ) ?
            assembly_unit.get_assembly_unit_id() : null;
    }

    public String get_assembly_unit_name() { 
        return ( assembly_unit != null ) ? assembly_unit.get_name() : null;
    }

    public String get_assembly_unit_chromosome() { 
        return ( assembly_unit != null ) ? 
	    assembly_unit.get_chromosome() : null;
    }

    public String get_seq_status() {
        return ( assembly_unit != null ) ? 
	    assembly_unit.get_seq_status() : null;
    }

    public Float get_assembly_unit_length() {
        return ( assembly_unit != null ) ? 
	    assembly_unit.get_length() : null;
    }

    public String get_assembly_unit_units() {
        return ( assembly_unit != null ) ? assembly_unit.get_units() : null;
    }

    public Character get_orientation() {
        return ( assembly_unit != null ) ? 
	    assembly_unit.get_orientation() : null;
    }

    public String get_ic_accession() {
        return ( assembly_unit != null ) ? 
	    assembly_unit.get_ic_accession() : null;
    }

    public String get_right_overlap_clone() {
        return ( assembly_unit != null ) ?
            assembly_unit.get_right_overlap_clone() : null;
    }

    public String get_left_overlap_clone() {
        return ( assembly_unit != null ) ?
            assembly_unit.get_left_overlap_clone() : null;
    }

    public Integer get_right_overlap_size() {
        return ( assembly_unit != null ) ? 
            assembly_unit.get_right_overlap_size() : null;
    }

    public Integer get_left_overlap_size() {
        return ( assembly_unit != null ) ?
            assembly_unit.get_left_overlap_size() : null;
    }

    public String get_note() {
        return ( assembly_unit != null ) ? assembly_unit.get_note() : null;
    }


    //
    // TfcVector wrappers
    //
    public String get_vector_name() {
        return ( vector != null ) ? vector.get_name() : null;
    }

    public String get_vector_type() { 
        return ( vector != null ) ? vector.get_vector_type() : null;
    }

    public Long get_vector_id() {
        return ( vector != null ) ? vector.get_vector_id() : null;
    }

    public String get_vector_description() {
	return vector != null ? vector.get_description() : null;
    }

    //
    // TfcLibrary wrappers
    //
    public String get_library_name() { 
        return ( library != null ) ? library.get_name() : null;
    }

    public Long get_library_id() { 
        return ( library != null ) ? library.get_library_id() : null;
    }

    //
    // TfcRestrictionEnzyme (1 & 2) wrappers
    //
    public String get_restriction_enzyme_1_name() {
        return ( restriction_enzyme_1 != null ) ?
            restriction_enzyme_1.get_name() : null;
    }

    public Long get_restriction_enzyme_1_id() { 
        return ( restriction_enzyme_1 != null ) ? 
            restriction_enzyme_1.get_restriction_enzyme_id() : null; 
    }

    public String get_restriction_enzyme_2_name() {
        return ( restriction_enzyme_2 != null ) ?
            restriction_enzyme_2.get_name() : null; 
    }
    public Long get_restriction_enzyme_2_id() { 
        return ( restriction_enzyme_2 != null ) ?
            restriction_enzyme_2.get_restriction_enzyme_id() : null; 
    }
    
    //
    // TfcCloneChimerism wrappers
    //
    public String get_clone_chimerism_genome_type() {
        return ( clone_chimerism != null ) ? 
            clone_chimerism.get_genome_type() : null; 
    }

    public String get_clone_chimerism_repeat_type() {
        return ( clone_chimerism != null ) ? 
            clone_chimerism.get_repeat_type() : null;
    }

    public Boolean get_chim_pos_known() {
        return ( clone_chimerism != null ) ?
            clone_chimerism.get_chim_pos_known() : null;
    }

    public Boolean get_chim_on_left() {
        return ( clone_chimerism != null ) ?
            clone_chimerism.get_chim_on_left() : null;
    }

    public Boolean get_chim_on_right() {
        return ( clone_chimerism != null ) ?
            clone_chimerism.get_chim_on_right() : null;
    }

    public Boolean is_on_same_chr() { 
        return ( clone_chimerism != null ) ?
            clone_chimerism.get_is_on_same_chr() : null; 
    }

    public Boolean is_repeat() {
        return ( clone_chimerism != null ) ?
            clone_chimerism.get_is_repeat() : null;
    }

    //
    // TfcTaxon wrappers
    //
    public Long get_taxon_id() {
        return ( taxon != null ) ? taxon.get_taxon_id() : null;
    }

    public String get_genus() { 
        return ( taxon != null ) ? taxon.get_genus() : null;
    }

    public String get_species() {
        return ( taxon != null ) ? taxon.get_species() : null;
    }

    public String get_division_code() {
        return ( taxon != null ) ? taxon.get_division_code() : null;
    }

    public String get_scientific_name() { 
        return ( taxon != null ) ? taxon.get_scientific_name() : null;
    }

    public String get_common_name() {
        return ( taxon != null ) ? taxon.get_common_name() : null;
    }

    public String get_taxonomy() { 
        return ( taxon != null ) ? taxon.get_taxonomy() : null;
    }
    public String get_genbank_taxonomy_id() { 
        return ( taxon != null ) ? taxon.get_genbank_taxonomy_id() : null; 
    }

    //
    // TfcSpeciesVariant wrappers
    //
    public Long get_species_variant_id() { 
        return ( speciesVariant != null ) ? 
            speciesVariant.get_species_variant_id() : null;
    }

    public String get_species_variant_type() {
        return ( speciesVariant != null ) ? speciesVariant.get_speciesvariant_type() : null;
    }

    public String get_species_variant_name() { 
        return ( speciesVariant != null ) ? speciesVariant.get_name() : null;
    }

    public String get_species_variant_original_name() {
        return ( speciesVariant != null ) ? 
	    speciesVariant.get_original_name() : null;
    }

    public String get_species_variant_abbrev_name() {
        return ( speciesVariant != null ) ? 
	    speciesVariant.get_abbrev_name() : null;
    }

    public String get_species_variant_accession_number() {
        return ( speciesVariant != null ) ?
            speciesVariant.get_accession_number() : null;
    }

    public String get_species_variant_base_name() {
        return ( speciesVariant != null ) ? 
	    speciesVariant.get_base_name() : null; 
    }

    public String get_species_variant_location() {
        return ( speciesVariant != null ) ? 
	    speciesVariant.get_location() : null;
    }

    public String get_species_variant_country() { 
        return ( speciesVariant != null ) ? 
	    speciesVariant.get_country() : null; 
    }

    public String get_species_variant_habitat() {
        return ( speciesVariant != null ) ? 
	    speciesVariant.get_habitat() : null; 
    }

    public String get_min_altitude() { 
        return ( speciesVariant != null ) ?
            speciesVariant.get_min_altitude() : null;
    }

    public String get_max_altitude() {
        return ( speciesVariant != null ) ? 
            speciesVariant.get_max_altitude() : null;
    }

    public String get_min_longitude() {
        return ( speciesVariant != null ) ?
            speciesVariant.get_min_longitude() : null;
    }

    public String get_max_longitude() {
        return ( speciesVariant != null ) ?
            speciesVariant.get_max_longitude() : null;
    }

    public String get_min_latitude() { 
        return ( speciesVariant != null ) ?
            speciesVariant.get_min_latitude() : null;
    }

    public String get_max_latitude() {
        return ( speciesVariant != null ) ? 
            speciesVariant.get_max_latitude() : null;
    }

    public java.util.Date get_species_variant_date_collected() {
        return ( speciesVariant != null ) ? 
            speciesVariant.get_date_collected() : null;
    }

    public String get_monthly_precipitation() {
        return ( speciesVariant != null ) ?
            speciesVariant.get_monthly_precipitation() : null;
    }

    public String get_daily_temperature() {
        return ( speciesVariant != null ) ?
            speciesVariant.get_daily_temperature() : null;
    }

    public String get_num_plants() {
        return ( speciesVariant != null ) ?
            speciesVariant.get_num_plants() : null;
    }

    //
    // HostStrain wrappers
    //
    public Long get_host_strain_id() {
	return hasHostStrain() ? hostStrain.get_host_strain_id() : null;
    }

    public String get_host_strain_name() {
	return hasHostStrain() ? hostStrain.get_name() : null;
    }
    
    public String get_host_strain_original_name() {
	return hasHostStrain() ? hostStrain.get_original_name() : null;
    }

    public String get_host_strain_genotype() {
	return hasHostStrain() ? hostStrain.get_genotype() : null;
    }

    public String get_host_strain_antibiotic_resistance() {
	return hasHostStrain() ? hostStrain.get_antibiotic_resistance() : null;
    }

    public String get_host_strain_media() {
	return hasHostStrain() ? hostStrain.get_media() : null;
    }

    public Float get_host_strain_growth_temperature() {
	return hasHostStrain() ? hostStrain.get_growth_temperature() : null;
    }

    public String get_host_strain_description() {
	return hasHostStrain() ? hostStrain.get_description() : null;
    }

    public String get_host_strain_duration_of_growth() {
	return hasHostStrain() ? hostStrain.get_duration_of_growth() : null;
    }

    public Long get_host_strain_taxon_id() {
	return hasHostStrain() ? hostStrain.get_taxon_id() : null;
    }

    public String get_host_strain_genus() { 
        return hasHostStrain() ? hostStrain.get_genus() : null;
    }

    public String get_host_strain_species() {
        return hasHostStrain() ? hostStrain.get_species() : null;
    }


    /**
     * Determines if clone has associated host strain data
     *
     * @return <code>true</code> if clone has associated host strain data,
     * <code>false</code> if clone has no associated host strain data.
     */
    public boolean hasHostStrain() {
	return ( hostStrain != null );
    }


    /**
     * Retrieve right overlap size of assembly unit as string w/"bp"
     * units appended
     *
     * @return Right overlap size of assembly init as a String with 
     *  "bp" units appended to it.
     */
    public String get_format_right_overlap_size() { 
        return ( get_right_overlap_size() != null ) ? 
            get_right_overlap_size().toString() + " bp" : null; 
    }

    /**
     * Retrieve left overlap size of assembly unit as string w/"bp" 
     * units appended
     *
     * @return Left overlap size of Assembly Unit as a String with "bp" 
     *  units appended to it.
     */
    public String get_format_left_overlap_size() {
        return ( get_left_overlap_size() != null ) ? 
            get_left_overlap_size().toString() + " bp" : null;
    }


    /**
     * Determines whether clone has associated clone ends
     *
     * @return <code>true</code> if clone has associated clone ends
     * or <code>false</code> if clone has no associated clone ends
     */
    public boolean hasCloneEnds() {
        return ( clone_end != null && !clone_end.isEmpty() );
    }

    /**
     * Retrieves clone ends associated to clone
     *
     * @return Clone ends associated with this clone as an <code>Iterator</code>
     * of <code>CloneEnd</code> objects, or <code>null</code> if no clone ends 
     * associated to clone
     */
    public Iterator get_clone_ends() {
        return ( hasCloneEnds() ) ? clone_end.iterator() : null;
    }

    /**
     * Determines whether clone has associated clone alternate sizes
     *
     * @return <code>true</code> if clone has associated alternate sizes
     * or <code>false</code> if clone has no associated alternate sizes
     */
    public boolean hasCloneAltSizes() {
        return ( cloneAltSize != null && !cloneAltSize.isEmpty() );
    }

  
    /**
     * Retrieves clone alternate sizes
     *
     * @return Alternate sizes for this clone as an <code>Iterator</code> of
     *  <code>TfcCloneAlternateSize</code> objects, or <code>null</code> if no 
     *  alternate sizes for this clone
     */
    public Iterator get_clone_alt_sizes() { 
        return ( hasCloneAltSizes() ) ? cloneAltSize.iterator() : null;
    }

    /**
     * Determines whether clone has associated stocks
     *
     * @return <code>true</code> if clone has associated stocks
     * or <code>false</code> if clone has no associated stocks
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }

    /**
     * Retrieves stocks for clone
     *
     * @return Stocks associated with this clone as an <code>Iterator</code>
     *  of <code>TfcStock</code> objects, or <code>null</code> if no stocks for 
     *  this clone
     */
    public Iterator get_stocks() {
        return ( hasStocks() ) ? stocks.iterator() : null;
    }

    /**
     * Determines whether clone has associated genes
     *
     * @return <code>true</code> if clone has associated genes
     * or <code>false</code> if clone has no associated genes
     */
    public boolean hasGenes() {
        return ( genes != null && !genes.isEmpty() );
    }

    /**
     * Retrieves genes associated to clone
     *
     * @return Genes associated with this clone as an <code>Iterator</code>
     *  of <code>GeneModel</code> objects, or <code>null</code> if no genes 
     *  for this clone
     */
    public Iterator getGenes() {
        return ( hasGenes() ) ? genes.iterator() : null;
    }

    /**
     * Determines whether clone has associated loci
     *
     * @return <code>true</code> if clone has associated loci
     * or <code>false</code> if clone has no associated loci
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves loci associated to clone
     *
     * @return Loci associated with this clone as an <code>Iterator</code>
     *  of <code>Locus</code> objects, or <code>null</code> if no loci directly
     *  associated to clone
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
    }


    /**
     * Determines if clone has a parent clone
     *
     * @return <code>true</code> if clone has a parent clone or 
     * <code>false</code> if no parent clone exists for this clone
     */
    public boolean hasParentClone() {
        return parentClone != null;
    }


    /**
     * Retrieves parent clone info as a <code>Clone</code> object
     *
     * @return Parent clone data as <code>Clone</code> object, or 
     * <code>null</code>  if no parent clone data for this clone
     */
    public Clone getParentClone() {
        return parentClone;
    }


    /**
     * For unit testing only
     */
    public void test() {
       
        System.out.println( "****** CloneDetail content test ******" );
        super.test();
       
        if ( clone != null ) {
            clone.test();
        }
        
        if ( vector != null ) {
            vector.test();
        }

        if ( library != null ) {
            library.test();
        }

        if ( hasCloneEnds() ) {
            clone_end.test();
        }

        if ( clone_chimerism != null ) {
            clone_chimerism.test();
        }
       
        if ( restriction_enzyme_1 != null ) {
            restriction_enzyme_1.test();
        }

        if ( restriction_enzyme_2 != null ) {
            restriction_enzyme_2.test();
        }
    
        if ( hasCloneAltSizes() ) {
            cloneAltSize.test();
        }

        if ( hasStocks() ) {
            stocks.test();
        }

        if ( hasGenes() ) {
            genes.test();
        }

        if ( hasLocus() ) {
            loci.test();
        }

	if ( hasHostStrain() ) {
	    hostStrain.test();
	}

        System.out.println( "**** CloneDetail content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 2 );
            CloneDetail clone = new CloneDetail( conn, id );
            clone.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
      
    }
        
}
  








