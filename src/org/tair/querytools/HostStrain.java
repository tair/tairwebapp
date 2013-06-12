//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/06/01 16:32:19 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * HostStrain extends TfcHostStrain to show more complete information about
 * a host strain entry on another element's detail page (such as clone,
 * vector or library).  HostStrain contains taxon info. in addition to
 * base host strain data in superclass.
 */


public class HostStrain extends TfcHostStrain {

    private TfcTaxon taxon;
       
    /**
     * Creates an empty instance of HostStrain
     */
    public HostStrain() {
	super();
    }


    /**
     * Creates an instance of HostStrain that represents the data
     * associated to the submitted host strain id.
     *
     * @param conn An active connection to the database
     * @param host_strain_id Host strain id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public HostStrain( DBconnection conn, Long host_strain_id )
	throws RecordNotFoundException, SQLException {
	super( conn, host_strain_id );

	if ( get_taxon_id() != null ) {
	    taxon = new TfcTaxon( conn, get_taxon_id() );
	}
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
     * For unit testing only
     */
    public void test(){
       
	System.out.println( "****** HostStrain content test ******" );
	super.test();

	if ( hasTaxon() ) {
	    taxon.test();
	}

	System.out.println( "**** HostStrain content test end ****" );
    }
  
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ){
	try{

	    DBconnection conn = new DBconnection();
	    HostStrain strain = null;
	    Long id = new Long( 27 );
	    strain = new HostStrain( conn, id );
	    strain.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
      
    }
        
}
