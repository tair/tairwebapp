//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/04/05 22:43:44 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.tfc.TfcDnaFragment;
import org.tair.tfc.DBconnection;


/**
 * DnaFragmentDetail is a composite class to represent information associated 
 * with an entry in the DnaFragment table for display on the dna fragment detail 
 * page. DnaFragmentDetail contains specific information on a dna fragment in
 * addition to all data contained by TairObjectDetail and MapElementDetail
 * superclasses
 */

public class DnaFragmentDetail extends MapElementDetail {

    // DnaFragment this object represents
    private TfcDnaFragment dnaFragment;


    /**
     * Creates an empty instance of DnaFragmentDetail
     */
    public DnaFragmentDetail() {
	super();
    }


    /**
     * Creates an instance of DnaFragmentDetail that reflects the data 
     * referenced by submitted tair_object_id;
     *
     * @param conn An active connection to the database
     * @param tair_object_id Id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public DnaFragmentDetail( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, tair_object_id );
    }


    /**
     * Retrieves data associated to submitted dna fragment name. This method
     * is supplied to satisfy the Detail interface
     * 
     * @param conn An active connection to the database
     * @param name Dna fragment name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcDnaFragment.retrieveTairObjectID( conn, name );

	if ( id == null ) {
	    throw new RecordNotFoundException( "No dna fragment found with " +
					       "name: " + name );
	}

	get_information( conn, id );
    }


    /**
     * Retrieves data associated to submitted tair_object_id.  This method
     * is supplied to satisfy the Detail interface. 
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {
	
	// will throw exception if no row found for id
	this.dnaFragment = new TfcDnaFragment( conn, tair_object_id );

	// populate superclass data
	populateBaseObject( dnaFragment );
	getMapElementInformation( conn );
	getTairObjectInformation( conn );
    }
     

    //
    // TfcDnaFragment wrappers
    //

    public void set_dna_fragment_id( Long id ) {
	initTfcObject();
	dnaFragment.set_dna_fragment_id( id ); 
    }
    
    public Long get_dna_fragment_id() { 
	return dnaFragment != null ? dnaFragment.get_dna_fragment_id() : null;
    }

    public void set_name( String name ) {
	initTfcObject();
	dnaFragment.set_name( name ); 
    }

    public String get_name() {
	return dnaFragment != null ? dnaFragment.get_name() : null; 
    }

    public void set_type( String type ) { 
	initTfcObject();
	dnaFragment.set_type( type );
    }

    public String get_type() { 
	return dnaFragment != null ? dnaFragment.get_type() : null; 
    }

    public void set_is_arrayed( Boolean is_arrayed ) { 
	initTfcObject();
	dnaFragment.set_is_arrayed( is_arrayed ); 
    }

    public Boolean get_is_arrayed() { 
	return dnaFragment != null ? dnaFragment.get_is_arrayed() : null; 
    }

    public void set_chromosome( String chr ) {
	initTfcObject();
	dnaFragment.set_chromosome( chr ); 
    }

    public String get_chromosome() { 
	return dnaFragment != null ? dnaFragment.get_chromosome() : null; 
    }

    public void set_units( String units ) {
	initTfcObject();
	dnaFragment.set_units( units ); 
    }

    public String get_units() { 
	return dnaFragment != null ? dnaFragment.get_units() : null; 
    }

    public void set_date_last_modified( java.util.Date date ) { 
	initTfcObject();
	dnaFragment.set_date_last_modified( date ); 
    }
    
    public java.util.Date get_date_last_modified() { 
	return dnaFragment != null ? 
	    dnaFragment.get_date_last_modified() : null; 
    }

    public void set_length( Float length ) { 
	initTfcObject();
	dnaFragment.set_length( length );
    }

    public Float get_length() { 
	return dnaFragment != null ? dnaFragment.get_length() : null; 
    }

    public void set_taxon_id( Long id ) {
	initTfcObject();
	dnaFragment.set_taxon_id( id ); 
    }

    public Long get_taxon_id() { 
	return dnaFragment != null ? dnaFragment.get_taxon_id() : null; 
    }

    public void set_species_variant_id( Long id ) { 
	initTfcObject();
	dnaFragment.set_species_variant_id( id ); 
    }

    public Long get_species_variant_id() { 
	return dnaFragment != null ? 
	    dnaFragment.get_species_variant_id() : null; 
    }

    public void set_is_sequenced( Boolean is_sequenced ) { 
	initTfcObject();
	dnaFragment.set_is_sequenced( is_sequenced ); 
    }
    
    public Boolean get_is_sequenced() {
	return dnaFragment != null ? dnaFragment.get_is_sequenced() : null;
    }

    public void set_has_flank_sequence( Boolean has_flank_sequence ) {
	initTfcObject();
	dnaFragment.set_has_flank_sequence( has_flank_sequence ); 
    }
    
    public Boolean get_has_flank_sequence() { 
	return dnaFragment != null ? 
	    dnaFragment.get_has_flank_sequence() : null;
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
	initTfcObject();
	dnaFragment.set_is_obsolete( is_obsolete ); 
    }
    
    public Boolean get_is_obsolete() { 
	return dnaFragment != null ? dnaFragment.get_is_obsolete() : null; 
    }

    public void set_original_name( String name ) { 
	initTfcObject();
	dnaFragment.set_original_name( name ); 
    }

    public String get_original_name() { 
	return dnaFragment != null ? dnaFragment.get_original_name() : null; 
    }

    public void set_date_entered( java.util.Date date ) { 
	initTfcObject();
	dnaFragment.set_date_entered( date );
    }

    public java.util.Date get_date_entered() { 
	return dnaFragment != null ? dnaFragment.get_date_entered() : null; 
    }

    /**
     * Utility method to ensure that TfcDnaFragment has been initialized
     * before trying to set a value.
     */
    private void initTfcObject() {
	if ( this.dnaFragment == null ) {
	    dnaFragment = new TfcDnaFragment();
	}
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
        System.out.println( "**** DnaFragmentDetail content test ****" );

	if ( dnaFragment != null ) {
	    dnaFragment.test();
	}

        System.out.println( "**** DnaFragmentDetail content test end ****" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){
        try {

	    DBconnection conn = new DBconnection();
	    Long tairObjectID = new Long( 1005722639 );
	    DnaFragmentDetail detail = new DnaFragmentDetail( conn,
							      tairObjectID );

	    detail.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}

    }
}
