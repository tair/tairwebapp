//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2004/04/06 18:30:28 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * SpeciesVariantDetail is a composite class to represent all information
 * associated with an entry in the SpeciesVariant table for display on the
 * species variant detail page. SpeciesVariantDetail contains species variant
 * info, data on the variant's associated taxon, any collectors for variant,
 * and a collection of stocks associated to germplasms associated to variant
 * in addition to all information in the <code>TairObjectDetail</code> 
 * superclass.
 */

public class SpeciesVariantDetail extends TairObjectDetail {

    private TfcSpeciesVariant speciesVariant;

    private TfcTaxon taxon;

    // aliases for Taxon - stored as TfcAlias -- easier to store here
    // rather than create derived class for TfcTaxon to hold this collection
    //  - if it turns out we want taxon alias in many places can change this
    // later
    private AliasVector taxonAliases;

    //the aliases that are for that particular SpeciesVariant
    private AliasVector SpeciesVariantAliases;
    
    // species variant collector(s) - stored as ListCommunity objects
    private ListCommunityCollection collectors;

    // stocks associated to germplasms associated to species variant -
    // stored as StockObject objects
    private StockCollection stocks;

    // germplasms associated to species variant - stored as Germplasm objects
    private GermplasmCollection germplasms;

    /**
     * Creates an empty instance of SpeciesVariantDetail
     */
    public SpeciesVariantDetail() {
        super();
    }

    /**
     * Creates an instance of SpeciesVariantDetail that contains species variant
     * data referenced by the submitted species variant id
     *
     * @param conn An active connection to the database
     * @param species_variant_id Species variant id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public SpeciesVariantDetail( DBconnection conn, Long species_variant_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, species_variant_id );
    }
   
  
    /**
     * Creates an instance of SpeciesVariantDetail that represents the data
     * associated to the submitted name.
     *
     * @param conn An active connection to the database
     * @param name Species variant name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public SpeciesVariantDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {
 
	get_information( conn, name );
    }

    /**
     * Retrieves data for submitted species variant name and stores in member 
     * objects
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcSpeciesVariant.retrieveSpeciesVariantID( conn, name );
	
	if ( id == null ) {
	    throw new RecordNotFoundException( "No species variant found " +
					       "with name: " + name );
	}

	get_information( conn, id );
    }

  
    /**
     * Retrieves data for submitted tair object id and stores in member objects
     *
     * @param conn An active connection to the database
     * @param species_variant_id ID to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long species_variant_id )
	throws RecordNotFoundException, SQLException {

        speciesVariant = new TfcSpeciesVariant( conn, species_variant_id );

	// populate superclass data
        super.populateBaseObject( speciesVariant );
	getTairObjectInformation( conn );

        if ( speciesVariant.get_taxon_id() != null ) {
            taxon = new TfcTaxon( conn, speciesVariant.get_taxon_id() );
            taxonAliases = new AliasVector( conn, taxon.get_tair_object_id() );
        }
        
        Long tair_object_id = TfcSpeciesVariant.retrieveTairObjectID( conn, species_variant_id);
        SpeciesVariantAliases = new AliasVector( conn, tair_object_id );

        collectors =  new ListCommunityCollection( conn,
						   species_variant_id, 
						   "collector" );

        stocks = new StockCollection( conn, 
				      species_variant_id, 
				      "species_variant" );

        stocks.populateDonors( conn ); // get donors for stocks in collection

        germplasms = new GermplasmCollection( conn,
					      species_variant_id, 
					      "species_variant" );
    }
    
    //
    // TfcSpeciesVariant wrappers
    //

    public Long get_species_variant_id() {
	return speciesVariant.get_species_variant_id();
    }

    public String get_speciesvariant_type() {
	return speciesVariant.get_speciesvariant_type(); 
    }

    public String get_name() { 
	return speciesVariant.get_name(); 
    }

    public String get_abbrev_name() {
	return speciesVariant.get_abbrev_name();
    }

    public String get_accession_number() {
	return speciesVariant.get_accession_number(); 
    }

    public String get_base_name() {
	return speciesVariant.get_base_name();
    }

    public String get_location() {
	return speciesVariant.get_location();
    }

    public String get_country() { 
	return speciesVariant.get_country(); 
    }

    public String get_habitat() {
	return speciesVariant.get_habitat();
    }

    public String get_min_altitude() {
	return speciesVariant.get_min_altitude();
    }

    public String get_max_altitude() {
	return speciesVariant.get_max_altitude();
    }

    public String get_min_longitude() { 
	return speciesVariant.get_min_longitude(); 
    }

    public String get_max_longitude() {
	return speciesVariant.get_max_longitude();
    }

    public String get_min_latitude() { 
	return speciesVariant.get_min_latitude(); 
    }

    public String get_max_latitude() { 
	return speciesVariant.get_max_latitude();
    }

    public java.util.Date get_date_collected() {
	return speciesVariant.get_date_collected(); 
    }

    public String get_monthly_precipitation() {
	return speciesVariant.get_monthly_precipitation();
    }

    public String get_daily_temperature() {
	return speciesVariant.get_daily_temperature();
    }

    public String get_num_plants() { 
	return speciesVariant.get_num_plants();
    }

    public java.util.Date get_date_last_modified() {
	return speciesVariant.get_date_last_modified(); }

    public Boolean get_is_obsolete() {
	return speciesVariant.get_is_obsolete();
    }

    public String get_format_name() { 
	return speciesVariant.get_format_name();
    }

    public java.util.Date get_date_entered() { 
        return speciesVariant.get_date_entered();
    }
    
    public String get_original_name() { 
        return speciesVariant.get_original_name();
    }
    
    //
    // TfcTaxon wrappers
    //

    public Long get_taxon_tair_object_id() {
	return ( taxon != null ) ? taxon.get_tair_object_id() : null; 
    }
    public Long get_taxon_id() { 
	return ( taxon != null ) ? taxon.get_taxon_id() : null;
    }
    public String get_genus() { 

	return ( taxon != null ) ? taxon.get_genus() : null; }
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
  

    /**
     * Determines if species variant has collectors associated with it
     *
     * @return <code>true</code> if species variant has collectors, or 
     * <code>false</code> if no collectors associated to species variant
     */
    public boolean hasCollectors() {
        return ( collectors != null && !collectors.isEmpty() );
    }


    /**
     * Retrieves collectors associated to species variant
     *
     * @return Collectors associated to species variant as an 
     * <code>Iterator</code> of <code>ListCommunity</code> objects, or 
     * <code>null</code> if no collectors associated to species variant
     */
    public Iterator getCollectors() {
        return ( hasCollectors() ) ? collectors.iterator() : null;
    }

    /**
     * Determines if species variant has stocks associated to germplasms 
     * associated to variant
     *
     * @return <code>true</code> if species variant has stocks, or 
     * <code>false</code> if no stocks associated to species variant
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }


    /**
     * Retrieves stocks associated to species variant's associated germplasm 
     * records
     *
     * @return Stocks associated to species variant as an <code>Iterator</code>
     * of <code>StockObject</code> objects, or <code>null</code> if no stocks
     * associated to species variant
     */
    public Iterator getStocks() {
        return ( hasStocks() ) ? stocks.iterator() : null;
    }

    /**
     * Determines how many stocks are associated to species variant
     *
     * @return Number of stocks associated to species variant; zero is returned
     * if no stocks associated to variant
     */
    public int getNumberStocks() {
        return ( hasStocks() ) ? stocks.size() : 0;
    }

    /**
     * Determines if species variant has associated germplasms
     *
     * @return <code>true</code> if species variant has germplasms, or 
     * <code>false</code> if no germplasms associated to species variant
     */
    public boolean hasGermplasms() {
        return ( germplasms != null && !germplasms.isEmpty() );
    }


    /**
     * Retrieves germplasms associated to species variant
     *
     * @return Germplasms associated to species variant as an 
     * <code>Iterator</code> of <code>Germplasm</code> objects, or 
     * <code>null</code> if no germplasms associated to species variant
     */
    public Iterator getGermplasms() {
        return ( hasGermplasms() ) ? germplasms.iterator() : null;
    }

    /**
     * Determines if species variant's taxon has associated aliases
     *
     * @return <code>true</code> if species variant's taxon has aliases, 
     * or <code>false</code> if no aliases associated to species variant's 
     * taxon
     */
    public boolean hasTaxonAliases() {
        return ( taxonAliases != null && !taxonAliases.isEmpty() );
    }


    /**
     * Retrieves aliases associated to species variant's taxon
     *
     * @return Aliases associated to species variant's taxon as an 
     * <code>Iterator</code> of <code>TfcAlias</code> objects, or 
     * <code>null</code> if no aliases associated to species variant's taxon
     */
    public Iterator getTaxonAliases() {
        return ( hasTaxonAliases() ) ? taxonAliases.iterator() : null;
    }

    /**
     * Retrieves species variant's taxon aliases as a delimited string
     * 
     * @return Species variant's taxon aliases as a delimited string, or 
     * <code>null</code> if no aliases associated to taxon
     */
    public String getTaxonAliasString() {
        return ( hasTaxonAliases() ) ? taxonAliases.get_alias_string() : null;
    }

    /**
    * Determines if a species variant has associated aliases
    *
    * @return <code>true</code> if species varaint has aliases, and 
    * <code>false</code> if no aliases are associated
    */
    public boolean hasAliases(){
        return (SpeciesVariantAliases != null && !SpeciesVariantAliases.isEmpty() );
    }

    /**
    * Retrieves aliases associated to Species Variant as a delimited string
    *
    * @return Species variant's aliases as a delimited string or <code>null</code>
    * if no aliases are associated
    */
    public String getAliasesString(){
        return (hasAliases() ) ? SpeciesVariantAliases.get_alias_string() : null;
    }

    /**
     * For unit testing only
     */
    public void test() {
        if ( speciesVariant != null ) {
            speciesVariant.test();
        }

        if ( taxon != null ) {
            taxon.test();
            if ( hasTaxonAliases() ) {
                taxonAliases.test();
            }
        }
    
        /*if ( hasCollectors() ) {
            collectors.test();
        }*/

        if ( hasStocks() ) {
            stocks.test();
        }

        if ( hasGermplasms() ) {
            germplasms.test();
        }

    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 650 );
            SpeciesVariantDetail variant = new SpeciesVariantDetail( conn, id );
            variant.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    
    }

}
