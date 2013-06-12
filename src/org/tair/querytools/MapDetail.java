//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.17 $
// $Date: 2004/04/06 18:30:27 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * MapDetail is a composite class to represent all information
 * associated with an entry in the Map table for display on the 
 * map detail page. MapDetail contains map specific information
 * along with taxon and species variant information in addition
 * to all information in <code>MapElementDetail</code> and 
 * <code>TairObjectDetail</code> superclasses. Unlike other map
 * elements (and like ContigDetail), MapDetail does not populate
 * the collection of map feature assignments (map elements assigned
 * directly onto the map) since they would be so numerous that in
 * addition to being expensive to retrieve, would probably not be
 * very useful for viewing.
 */

public class MapDetail extends MapElementDetail {

    private TfcMap map;
    private TfcTaxon taxon;
    private TfcSpeciesVariant speciesVariant;
  
    /**
     * Creates an empty instance of MapDetail 
     */
    public MapDetail() {  }


    /**
     * Creates an instance of MapDetail to reflect the data referenced
     * by the submitted map id.
     *
     * @param conn An active connection to the database
     * @param map_id Map id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public MapDetail( DBconnection conn, Long map_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, map_id );
    }

    /**
     * Maps cannot be populated by name since name is not unique.  This 
     * method is an empty implementation to satisfy the Detail interface, 
     * but calling it will result in a RecordNotFoundException
     *
     * @param conn An active connection to the database
     * @param name Map name to retrieve data for
     * @throws RecordNotFoundException ALWAYS throws this exception since
     * maps cannot be retrieved by name alone
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name )
	throws RecordNotFoundException, SQLException {
	
	throw new RecordNotFoundException( "Maps cannot be retrieved by " +
					   "name alone" );
    }
  

    /**
     * Retrieves all data for submitted map id & populates member objects. This
     * method retrieves all info. contained in MapElementDetail and 
     * TairObjectDetail classes, but excludes all Assignment related data 
     * (including feature assignments, map features and sequences) since the
     * number of elements associated to Map is so large that it would be very
     * expensive to retrieve, and not very useful to display.
     *
     * @param conn An active connection to the database
     * @param map_id Map id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long map_id ) 
	throws RecordNotFoundException, SQLException {

        // populate superclasses using populateXXX methods instead of 
	// getMapElementInformation and getTairOnjectInformation so we can
        // omit assignment data
	this.map = new TfcMap( conn, map_id );

	// MapElementDetail info
	Long id = map.get_map_element_id();
	super.populateBaseObject( map );
	super.populateIsAGIMap( conn, id );
	super.populateShowMapViewer( conn, id, get_map_element_type() );

	// TairObjectDetail info.
	id = map.get_tair_object_id();
	super.populateAliases( conn, id );
	super.populateAttributions( conn, id );
	super.populateUpdateHistory( conn, id );
	super.populateAnnotations( conn, id );
	super.populateExternalLinks( conn, id );
	super.populateNotepad( conn, id );
	super.populateImages( conn, id );
	
	if ( map.get_taxon_id() != null ) {
	    this.taxon = new TfcTaxon( conn, map.get_taxon_id() );
	}
	
	if ( map.get_species_variant_id() != null ) {
	    this.speciesVariant = 
		new TfcSpeciesVariant( conn,
				       map.get_species_variant_id() );
	}
    }

    //
    // TfcMap wrappers
    //
    public Long get_map_id() { 
	return map.get_map_id();
    }

    public String get_name() { 
	return map.get_name();
    }

    public String get_map_type() { 
	return map.get_map_type();
    }

    public String get_chromosome() { 
	return map.get_chromosome(); 
    }

    public String get_units() { 
	return map.get_units(); 
    }

    public java.util.Date get_date_last_modified() { 
	return map.get_date_last_modified();
    }

    public Float get_length() { 
	return map.get_length();
    }

    public Long get_taxon_id() { 
	return map.get_taxon_id();
    }

    public Long get_species_variant_id() {
	return map.get_species_variant_id();
    }

    public Boolean get_is_sequenced() { 
	return map.get_is_sequenced(); 
    }

    public java.util.Date get_date_entered() { 
        return map.get_date_entered();
    }
    
    public String get_original_name() { 
        return map.get_original_name();
    }

    //
    // TfcTaxon wrappers
    //

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

    public String get_species_variant_type() {
	return ( speciesVariant != null ) ? speciesVariant.get_speciesvariant_type() : null;
    }

    public String get_species_variant_name() {
	return ( speciesVariant != null ) ? speciesVariant.get_name() : null; 
    }

    public String get_abbrev_name() { 
	return ( speciesVariant != null ) ? 
	    speciesVariant.get_abbrev_name() : null;
    }

    public String get_accession_number() { 
	return ( speciesVariant != null ) ? 
	    speciesVariant.get_accession_number() : null;
    }

    public String get_location() { 
	return ( speciesVariant != null ) ? 
	    speciesVariant.get_location() : null;
    }

    public String get_country() { 
	return ( speciesVariant != null ) ?
	    speciesVariant.get_country() : null;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** MapDetail content test ******" );

	if ( map != null ) {
	    map.test();
	}

	if ( taxon != null ) {
	    taxon.test();
	}

	if ( speciesVariant != null ) {
	    speciesVariant.test();
	}

    	System.out.println( "**** MapDetail content test end ****" );
    }
            
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
	    
            DBconnection conn = new DBconnection();
            Long id = new Long( 29);
	    
	    MapDetail map = new MapDetail( conn, id );
	    map.test();
	    
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
