//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.19 $
// $Date: 2004/09/16 22:30:49 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import org.tair.utilities.*;
import org.tair.tfc.*;
import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * LibraryDetail is a composite class to represent all information
 * associated with an entry in the library table for display on the 
 * library detail page.
 */

public class LibraryDetail extends TairObjectDetail {

    private TfcLibrary library;
    private TfcVector vector;
    private TfcSpeciesVariant speciesVariant;
    private TfcTaxon taxon;
    private TfcRestrictionEnzyme restrictionEnzyme_1;
    private TfcRestrictionEnzyme restrictionEnzyme_2;
    private HostStrain hostStrain;

    // Stocks associated with library - stored as StockObject
    private StockCollection stocks = null;

    /**
     * Creates an empty instance of LibraryDetail
     */           
    public LibraryDetail() {
	super();
    }
  
    /**
     * Creates an instance of LibraryDetail that represents all data
     * referenced by submitted library id.
     *
     * @param conn An active connection to the database
     * @param library_id Library id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public LibraryDetail( DBconnection conn, Long library_id ) 
	throws RecordNotFoundException, SQLException {      

	get_information( conn, library_id );
    }


    /**
     * Creates an instance of LibraryDetail that represents all data
     * referenced by submitted library name.
     *
     * @param conn An active connection to the database
     * @param name Library name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public LibraryDetail( DBconnection conn, String name )
	throws RecordNotFoundException, SQLException {  

	get_information( conn, name );
    }

    /**
     * Retrieves data for library referenced by submitted library name
     *
     * @param conn An active connection to the database
     * @param name Library name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name )
	throws RecordNotFoundException, SQLException {
	
	Long id = TfcLibrary.retrieveLibraryID( conn, name );
	
	if ( id == null ) {
	    throw new RecordNotFoundException( "No library found with " +
					       "name: " + name );
	}
	
	get_information( conn, id );
    }
  

    /**
     * Retrieves data for library referenced by submitted library id
     *
     * @param conn An active connection to the database
     * @param library_id Library id to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long library_id ) 
	throws RecordNotFoundException, SQLException {

	library = new TfcLibrary( conn, library_id );
	super.populateBaseObject( library );
	if ( library.get_vector_id() != null ) {
	    this.vector = new TfcVector( conn, library.get_vector_id() );
	}

	if ( library.get_species_variant_id() != null ) {
	    this.speciesVariant = 
		new TfcSpeciesVariant( conn, library.get_species_variant_id() );
	}

	if ( library.get_taxon_id() != null ) {
	    this.taxon = new TfcTaxon( conn, library.get_taxon_id() );
	}

	if ( library.get_restriction_enzyme_1_id() != null ) {
	    this.restrictionEnzyme_1 = 
		new TfcRestrictionEnzyme( conn, 
					  library.get_restriction_enzyme_1_id() );
	}

	if ( library.get_restriction_enzyme_2_id() != null ) {
	    this.restrictionEnzyme_2 = 
		new TfcRestrictionEnzyme( conn, 
					  library.get_restriction_enzyme_2_id() );
	}

	if ( library.get_host_strain_id() != null ) {
	    this.hostStrain = 
		new HostStrain( conn, library.get_host_strain_id() );
	}
    
	this.stocks = new StockCollection( conn, get_tair_object_id() );
	stocks.populateDonors( conn );

	// populate superclass data
	getTairObjectInformation( conn );
    }
    

    //
    // TfcLibrary wrappers
    //
    public String get_name() { 
	return library.get_name(); 
    }

    public String get_description() { 
	return library.get_description(); 
    }

    public String get_abbreviation() {
	return library.get_abbreviation(); 
    }

    public java.util.Date get_date_last_modified() { 
	return library.get_date_last_modified(); 
    }

    public Long get_library_id() {
	return library.get_library_id(); 
    }

    public Boolean get_is_obsolete() { 
	return library.get_is_obsolete(); 
    }

    public String get_insert_type() { 
	return library.get_insert_type(); 
    }

    public String get_insert_size_range() {
	return library.get_insert_size_range(); 
    }

    public java.util.Date get_date_entered() { 
        return library.get_date_entered();
    }
    
    public String get_original_name() { 
        return library.get_original_name();
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

    public String get_species_variant_abbrev_name() { 
	return ( speciesVariant != null ) ? 
	    speciesVariant.get_abbrev_name() : null; 
    }

    public String get_species_variant_accession_number() { 
	return ( speciesVariant != null ) ? 
	    speciesVariant.get_accession_number() : null; 
    }

    public String get_species_variant_location() { 
	return ( speciesVariant != null ) ? 
	    speciesVariant.get_location() : null; 
    }
    
    public String get_species_variant_country() { 
	return ( speciesVariant != null ) ? speciesVariant.get_country() : null;
    }
 
    //
    // TfcVector wrappers
    //
    public Long get_vector_id() { 
	return ( vector != null ) ? vector.get_vector_id() : null;
    }

    public String get_vector_name() {
	return ( vector != null ) ? vector.get_name() : null;
    }

    public String get_vector_type() {
	return ( vector != null ) ? vector.get_vector_type() : null; 
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
    // TfcRestrictionEnzyme wrappers - for enzyme 1 & 2
    //
    public Long get_restriction_enzyme_1_id() { 
	return ( restrictionEnzyme_1 != null ) ? 
	    restrictionEnzyme_1.get_restriction_enzyme_id() : null;
    }

    public String get_restriction_enzyme_1_name() {
	return ( restrictionEnzyme_1 != null ) ?
	    restrictionEnzyme_1.get_name() : null;
    }

    public String get_restriction_enzyme_1_site() {
	return ( restrictionEnzyme_1 != null ) ? 
	    restrictionEnzyme_1.get_site() : null;
    }

    public Integer get_restriction_enzyme_1_offset() { 
	return ( restrictionEnzyme_1 != null ) ? 
	    restrictionEnzyme_1.get_offset() : null;
    }

    public Integer get_restriction_enzyme_1_overhang() { 
	return ( restrictionEnzyme_1 != null ) ? 
	    restrictionEnzyme_1.get_overhang() : null;
    }

    public String get_restriction_enzyme_1_cleavage() {
	return ( restrictionEnzyme_1 != null ) ? 
	    restrictionEnzyme_1.get_cleavage() : null;
    }

    public String get_restriction_enzyme_1_isoschizomer() {
	return ( restrictionEnzyme_1 != null ) ? 
	    restrictionEnzyme_1.get_isoschizomer() : null;
    }

    public Long get_restriction_enzyme_2_id() { 
	return ( restrictionEnzyme_2 != null ) ? 
	    restrictionEnzyme_2.get_restriction_enzyme_id() : null;
    }

    public String get_restriction_enzyme_2_name() {
	return ( restrictionEnzyme_2 != null ) ? 
	    restrictionEnzyme_2.get_name() : null;
    }

    public String get_restriction_enzyme_2_site() {
	return ( restrictionEnzyme_2 != null ) ?
	    restrictionEnzyme_2.get_site() : null;
    }

    public Integer get_restriction_enzyme_2_offset() { 
	return ( restrictionEnzyme_2 != null ) ? 
	    restrictionEnzyme_2.get_offset() : null;
    }

    public Integer get_restriction_enzyme_2_overhang() {
	return ( restrictionEnzyme_2 != null ) ?
	    restrictionEnzyme_2.get_overhang() : null;
    }

    public String get_restriction_enzyme_2_cleavage() {
	return ( restrictionEnzyme_2 != null ) ?
	    restrictionEnzyme_2.get_cleavage() : null;
    }

    public String get_restriction_enzyme_2_isoschizomer() {
	return ( restrictionEnzyme_2 != null ) ?
	    restrictionEnzyme_2.get_isoschizomer() : null;
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
     * Determines if library has associated host strain data
     *
     * @return <code>true</code> if library has associated host strain data,
     * <code>false</code> if library has no associated host strain data.
     */
    public boolean hasHostStrain() {
	return ( hostStrain != null );
    }
    

    /**
     * Retrieves stocks for this library
     *
     * @return Stocks associated with this library as an <code>Iterator</code>
     * of <code>TfcStock</code> objects, or <code>null</code> if no stocks for
     * this library
     */
    public Iterator get_stocks() { 
	return hasStocks() ? stocks.iterator() : null; 
    }

    /**
     * Determines if library has stocks
     *
     * @return <code>true</code> if library has stocks, <code>false</code> if
     * no stocks associated to library
     */
    public boolean hasStocks() {
	return ( stocks != null && !stocks.isEmpty() );
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** LibraryDetail content test ******" );
	if ( library != null ) {
	    library.test();
	}

	if ( stocks != null ) {
	    stocks.test();
	}

	if ( speciesVariant != null ) {
	    speciesVariant.test();
	}

	if ( taxon != null ) {
	    taxon.test();
	}

	if ( restrictionEnzyme_1 != null ) {
	    restrictionEnzyme_1.test();
	}

	if ( restrictionEnzyme_2 != null ) {
	    restrictionEnzyme_2.test();
	}

	if ( hasHostStrain() ) {
	    hostStrain.test();
	}

	System.out.println( "**** LibraryDetail content test end ****" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    Long test_id = new Long( 60 );

	    LibraryDetail library = new LibraryDetail( conn, test_id );
	    library.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    
    }
}
  








