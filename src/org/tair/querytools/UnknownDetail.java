//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/04/05 22:43:47 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.tfc.TfcUnknown;
import org.tair.tfc.DBconnection;


/**
 * UnknownDetail is a composite class to represent information associated 
 * with an entry in the Unknown table for display on the unknown detail 
 * page. UnknownDetail contains specific information on an unknown entry in
 * addition to all data contained by TairObjectDetail and MapElementDetail
 * superclasses
 */

public class UnknownDetail extends MapElementDetail {

    // Unknown instance this object represents
    private TfcUnknown unknown;


    /**
     * Creates an empty instance of UnknownDetail
     */
    public UnknownDetail() {
	super();
    }


    /**
     * Creates an instance of UnknownDetail that reflects the data 
     * referenced by submitted tair_object_id;
     *
     * @param conn An active connection to the database
     * @param tair_object_id Id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public UnknownDetail( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, tair_object_id );
    }


    /**
     * Retrieves data associated to submitted uknown name. This method
     * is supplied to satisfy the Detail interface
     * 
     * @param conn An active connection to the database
     * @param name Unknown name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcUnknown.retrieveTairObjectID( conn, name );

	if ( id == null ) {
	    throw new RecordNotFoundException( "No row found in Unknown with " +
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
	this.unknown = new TfcUnknown( conn, tair_object_id );
	
	// populate superclass data
	populateBaseObject( unknown );
	getMapElementInformation( conn );
	getTairObjectInformation( conn );
    }
     
    //
    // TfcUnknown wrappers
    //

    public void set_unknown_id( Long id ) {
	initTfcObject();
	unknown.set_unknown_id( id );
    }

    public Long get_unknown_id() {
	return unknown != null ? unknown.get_unknown_id() : null;
    }

    public void set_name( String name ) {
	initTfcObject();
	unknown.set_name( name );
    }

    public String get_name() {
	return unknown != null ? unknown.get_name() : null;
    }

    public void set_chromosome( String chr ) {
	initTfcObject();
	unknown.set_chromosome( chr );
    }

    public String get_chromosome() {
	return unknown != null ? unknown.get_chromosome() : null;
    }

    public void set_units( String units ) {
	initTfcObject();
	unknown.set_units( units );
    }

    public String get_units() {
	return unknown != null ? unknown.get_units() : null;
    }

    public void set_date_last_modified( java.util.Date date ) {
	initTfcObject();
	unknown.set_date_last_modified( date );
    }

    public java.util.Date get_date_last_modified() {
	return unknown != null ? unknown.get_date_last_modified() : null;
    }

    public void set_length( Float length ) {
	initTfcObject();
	unknown.set_length( length );
    }

    public Float get_length() {
	return unknown != null ? unknown.get_length() : null;
    }

    public void set_taxon_id( Long id ) {
	initTfcObject();
	unknown.set_taxon_id( id );
    }

    public Long get_taxon_id() {
	return unknown != null ? unknown.get_taxon_id() : null;
    }

    public void set_species_variant_id( Long id ) {
	initTfcObject();
	unknown.set_species_variant_id( id );
    }

    public Long get_species_variant_id() {
	return unknown != null ? unknown.get_species_variant_id() : null;
    }

    public void set_is_sequenced( Boolean is_sequenced ) {
	initTfcObject();
	unknown.set_is_sequenced( is_sequenced );
    }

    public Boolean get_is_sequenced() {
	return unknown != null ? unknown.get_is_sequenced() : null;
    }

    public void set_has_flank_sequence( Boolean has_flank_sequence ) {
	initTfcObject();
	unknown.set_has_flank_sequence( has_flank_sequence );
    }

    public Boolean get_has_flank_sequence() {
	return unknown != null ? unknown.get_has_flank_sequence() : null;
    }

    public void set_is_obsolete( Boolean is_obsolete ) {
	initTfcObject();
	unknown.set_is_obsolete( is_obsolete );
    }

    public Boolean get_is_obsolete() {
	return unknown != null ? unknown.get_is_obsolete() : null;
    }

    public void set_original_name( String name ) { 
	initTfcObject();
	unknown.set_original_name( name ); 
    }

    public String get_original_name() { 
	return unknown != null ? unknown.get_original_name() : null; 
    }

    public void set_date_entered( java.util.Date date ) { 
	initTfcObject();
	unknown.set_date_entered( date );
    }

    public java.util.Date get_date_entered() { 
	return unknown != null ? unknown.get_date_entered() : null; 
    }


    /**
     * Utility method to ensure that TfcUnknown has been initialized
     * before trying to set a value.
     */
    private void initTfcObject() {
	if ( unknown == null ) {
	    unknown = new TfcUnknown();
	}
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
        System.out.println( "**** UnknownDetail content test ****" );

	if ( unknown != null ) {
	    unknown.test();
	}

        System.out.println( "**** UnknownDetail content test end ****" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){
        try {

	    DBconnection conn = new DBconnection();
	    Long tairObjectID = new Long( 14633 );
	    UnknownDetail detail = new UnknownDetail( conn,
						      tairObjectID );

	    detail.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}

    }
}
