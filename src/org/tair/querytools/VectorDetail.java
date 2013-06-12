//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.16 $
// $Date: 2004/09/16 22:30:50 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * VectorDetail is a composite class to represent all information
 * associated with an entry in the Vector table for display on the
 * vector detail page. VectorDetail contains an instance of 
 * <code>TfcVector</code> and collections of libraries, stocks and NT 
 * sequences in addition to all information in <code>TairObjectDetail</code> 
 * superclass.
 */


public class VectorDetail extends TairObjectDetail {

    private TfcVector vector;

    private HostStrain hostStrain;

    // libraries associated to this vector - stored as TfcLibrary
    private LibraryCollection libraries;

    // Stocks associated with vector - stored as StockObject
    private StockCollection stocks;

    // Nucleotide sequences associated to vector - stored as Sequence
    private NTSequenceCollection ntSequences;

       
    /**
     * Creates an empty instance of VectorDetail
     */
    public VectorDetail() {  }



    /**
     * Creates an instance of VectorDetail that represents the data
     * associated to the submitted vector id.
     *
     * @param conn An active connection to the database
     * @param vector_id Vector id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public VectorDetail( DBconnection conn, Long vector_id )
	throws RecordNotFoundException, SQLException {

	get_information( conn, vector_id );
    }

    /**
     * Creates an instance of VectorDetail that represents the data
     * associated to the submitted vector name
     *
     * @param conn An active connection to the database
     * @param name Vector name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public VectorDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }

    /**
     * Retrieves data for submitted vector name and stores in member objects
     *
     * @param conn An active connection to the database
     * @param name Vector name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcVector.retrieveVectorID( conn, name );
	
	if ( id == null ) {
	    throw new RecordNotFoundException( "No vector found " +
					       "with name: " + name );
	}
	
	get_information( conn, id );
    }



    /**
     * Retrieves data for submitted vector id and stores in member objects
     *
     * @param conn An active connection to the database
     * @param vector_id Vector id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long vector_id )
	throws RecordNotFoundException, SQLException {

	vector = new TfcVector( conn, vector_id );
	super.populateBaseObject( vector );

	if ( vector.get_host_strain_id() != null ) {
	    hostStrain = new HostStrain( conn, vector.get_host_strain_id() );
	}

	stocks = new StockCollection( conn, get_tair_object_id() );
	stocks.populateDonors( conn );
	
	libraries = new LibraryCollection( conn, 
					   vector.get_vector_id(), 
					   "vector" );
	
	ntSequences = new NTSequenceCollection( conn, 
						vector.get_vector_id(), 
						"vector", 
						false );
	// populate superclass data
	getTairObjectInformation( conn );
    }
  

    //
    // TfcVector wrappers
    //

    public String get_vector_name() { 
	return vector.get_name(); 
    }

    public String get_vector_type() { 
	return vector.get_vector_type();
    }

    public java.util.Date get_date_last_modified() { 
	return vector.get_date_last_modified();
    }

    public Long get_vector_id() { 
	return vector.get_vector_id();
    }

    public Boolean get_is_obsolete() {
	return vector.get_is_obsolete(); 
    }

    public Float get_length() { 
	return vector.get_length(); 
    }

    public String get_units() {
	return vector.get_units(); 
    }

    public String get_description() { 
	return vector.get_description(); 
    }

    public String get_ic_accession() { 
	return vector.get_ic_accession(); 
    }

    public String get_origin_replication() { 
	return vector.get_origin_replication();
    }

    public String get_polylinker() {
	return vector.get_polylinker(); 
    }

    public String get_selectable_markers() { 
	return vector.get_selectable_markers(); 
    }

    public String get_usage_type() {
	return vector.get_usage_type(); 
    }

    public String get_promoter_info() {
	return vector.get_promoter_info();
    }

    public String get_promoter_name() { 
	return vector.get_promoter_name(); 
    }

    public String get_reporter_info() {
	return vector.get_reporter_info();
    }

    public String get_reporter_name() { 
	return vector.get_reporter_name(); 
    }

    public String get_antibiotic_resistance() { 
	return vector.get_antibiotic_resistance(); 
    }

    public java.util.Date get_date_entered() { 
        return vector.get_date_entered();
    }
    
    public String get_original_name() { 
        return vector.get_original_name();
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
     * Determines if vector has associated host strain data
     *
     * @return <code>true</code> if vector has associated host strain data,
     * <code>false</code> if vector has no associated host strain data.
     */
    public boolean hasHostStrain() {
	return ( hostStrain != null );
    }

    /**
     * Determines if vector has associated libraries
     *
     * @return <code>true</code> if vector has associated libraries, or 
     * <code>false</code> if no libraries associated to vector
     */
    public boolean hasLibrary() {
	return ( libraries != null && !libraries.isEmpty() );
    }
   

    /**
     * Retrieves libraries associated with vector
     *
     * @return Libraries associated with this Vector as an <code>Iterator</code>
     * of <code>TfcLibrary</code> objects, or <code>null</code> if no libraries
     * associated with this vector.
     */
    public Iterator get_library() { 
	return ( hasLibrary() ) ? libraries.iterator() : null; 
    }
  

    /**
     * Determines if vector has associated stocks
     *
     * @return <code>true</code> if vector has associated stocks, or 
     * <code>false</code> if no stocks associated to vector
     */
    public boolean hasStocks() {
	return ( stocks != null && !stocks.isEmpty() );
    }

  
    /**
     * Retrieves stocks associated with vector
     *
     * @return Stocks associated with this vector as an <code>Iterator</code>
     * of <code>TfcStock</code> objects, or <code>null</code> if no stocks for
     * this vector
     */
    public Iterator get_stocks() {
	return ( hasStocks() ) ? stocks.iterator() : null;
    }


    /**
     * Determines if vector has associated NT sequences
     * 
     * @return <code>true</code> if vector has associated NT
     * sequences, or <code>false</code> if no NT sequences associated
     * to vector
     */
    public boolean hasNTSequences() {
	return ( ntSequences != null && !ntSequences.isEmpty() );
    }

    /**
     * Retrieves NT sequences associated to vector
     *
     * @return NT sequences associated to vector as an <code>Iterator</code>
     * of <code>Sequence</code> object, or <code>null</code> if no NT
     * sequences associated to vector
     */
    public Iterator getNTSequences() {
	return ( hasNTSequences() ) ? ntSequences.iterator() : null;
    }

  
    /**
     * For unit testing only
     */
    public void test(){
       
	System.out.println( "****** VectorDetail content test ******" );
	super.test();
    
	if ( vector != null ) {
	    vector.test();
	}

	if ( hasLibrary() ) {
	    libraries.test();
	}
    
	if ( hasStocks() ) {
	    stocks.test();
	}

	if ( hasNTSequences() ) {
	    ntSequences.test();
	}
    
	if ( hasHostStrain() ) {
	    hostStrain.test();
	}

	System.out.println( "**** VectorDetail content test end ****" );
    }
  
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ){
	try{

	    DBconnection conn = new DBconnection();
	    VectorDetail vector = null;
	    Long id = new Long( 500500119 );
	    vector = new VectorDetail( conn, id );
	    vector.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
      
    }
        
}
