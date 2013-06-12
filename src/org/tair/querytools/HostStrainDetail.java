//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/09/16 22:32:49 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * HostStrainDetail is a composite class to represent all information
 * associated with an entry in the HostStrain table for display on the
 * host strain detail page. 
 */


public class HostStrainDetail extends TairObjectDetail {

    private TfcHostStrain hostStrain;

    private TfcTaxon taxon;
    
    // Stocks associated with host strain
    private StockCollection stocks;

       
    /**
     * Creates an empty instance of HostStrainDetail
     */
    public HostStrainDetail() {  }


    /**
     * Creates an instance of HostStrainDetail that represents the data
     * associated to the submitted host strain id.
     *
     * @param conn An active connection to the database
     * @param host_strain_id Host strain id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public HostStrainDetail( DBconnection conn, Long host_strain_id )
	throws RecordNotFoundException, SQLException {

	get_information( conn, host_strain_id );
    }

    /**
     * Retrieves data for submitted host strain name and stores in
     & member objects
     *
     * @param conn An active connection to the database
     * @param name Host strain name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcHostStrain.retrieveHostStrainID( conn, name );
	
	if ( id == null ) {
	    throw new RecordNotFoundException( "No host strain found " +
					       "with name: " + name );
	}
	
	get_information( conn, id );
    }



    /**
     * Retrieves data for submitted host strain id and stores in member objects
     *
     * @param conn An active connection to the database
     * @param host_strain_id Host strain id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long host_strain_id )
	throws RecordNotFoundException, SQLException {

	hostStrain = new TfcHostStrain( conn, host_strain_id );
	super.populateBaseObject( hostStrain );

	if ( hostStrain.get_taxon_id() != null ) {
	    taxon = new TfcTaxon( conn, hostStrain.get_taxon_id() );
	}
	
	stocks = new StockCollection( conn, get_tair_object_id() );
	stocks.populateDonors( conn );

	// populate superclass data
	getTairObjectInformation( conn );
    }
  

    //
    // TfcHostStrain wrappers
    //
    public Long get_host_strain_id() {
	return hostStrain.get_host_strain_id();
    }

    public java.util.Date get_date_last_modified() {
	return hostStrain.get_date_last_modified();
    }

    public String get_name() {
	return hostStrain.get_name();
    }
    
    public String get_original_name() {
	return hostStrain.get_original_name();
    }

    public String get_genotype() {
	return hostStrain.get_genotype();
    }

    public String get_antibiotic_resistance() {
	return hostStrain.get_antibiotic_resistance();
    }

    public String get_media() {
	return hostStrain.get_media();
    }

    public Float get_growth_temperature() {
	return hostStrain.get_growth_temperature();
    }

    public String get_description() {
	return hostStrain.get_description();
    }

    public String get_duration_of_growth() {
	return hostStrain.get_duration_of_growth();
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

    /**
     * Determines if host strain has taxon data
     *
     * @return <code>true</code> if host strain has associated taxon data
     * or <code>false</code> if host strain has no associated taxon data
     */
    public boolean hasTaxon() {
	return ( taxon != null );
    }


    /**
     * Determines if host strain has associated stocks
     *
     * @return <code>true</code> if host strain has associated stocks, or
     * <code>false</code> if no stocks associated to host strain
     */
    public boolean hasStocks() {
	return ( stocks != null && !stocks.isEmpty() );
    }

  
    /**
     * Retrieves stocks associated with host strain
     *
     * @return Stocks associated with this host strain as an <code>Iterator</code>
     * of <code>TfcStock</code> objects, or <code>null</code> if no stocks for
     * this strain
     */
    public Iterator getStocks() {
	return hasStocks() ? stocks.iterator() : null;
    }

    /**
     * For unit testing only
     */
    public void test(){
       
	System.out.println( "****** HostStrainDetail content test ******" );
	super.test();


	hostStrain.test();

	if ( hasStocks() ) {
	    stocks.test();
	}

	if ( hasTaxon() ) {
	    taxon.test();
	}

	System.out.println( "**** HostStrainDetail content test end ****" );
    }
  
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ){
	try{

	    DBconnection conn = new DBconnection();
	    HostStrainDetail strain = null;
	    Long id = new Long( 27 );
	    strain = new HostStrainDetail( conn, id );
	    strain.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
      
    }
        
}
