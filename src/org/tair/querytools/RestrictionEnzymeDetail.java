//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2004/04/05 22:43:46 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import org.tair.utilities.*;
import org.tair.tfc.*;
import java.sql.*;
import java.io.*;
import java.util.*;



/**
 * RestrictionEnzymeDetail is a composite class to represent all information
 * associated with an entry in the restriction enzyme table. 
 * RestrictionEnzymeDetail contains an instance of 
 * <code>TfcRestrictionEnzyme</code> in addition to all information in 
 * <code>TairObjectDetail</code> superclass.
 *
 * <p>
 * RestrictionEnzymeDetail overrides the getElementType() method implemented
 * in TairObjectDetail to satisfy Accessible interface so that a type specific 
 * element type can be returned.
 */


public class RestrictionEnzymeDetail extends TairObjectDetail {

    private TfcRestrictionEnzyme restrictionEnzyme;


    /**
     * Creates an empty instance of RestrictionEnzymeDetail
     */           
    public RestrictionEnzymeDetail() { }
  

    /**
     * Creates an instance of RestrictionEnzymeDetail to reflect data referenced
     * by submitted restriction_enzyme_id
     *
     * @param conn An active connection to the database
     * @param restriction_enzyme_id Restriction enzyme id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public RestrictionEnzymeDetail( DBconnection conn, 
				    Long restriction_enzyme_id ) 
	throws SQLException { 
	
	get_information( conn, restriction_enzyme_id );
    }
  

    /**
     * Creates an instance of RestrictionEnzymeDetail to reflect data referenced
     * by submitted restriction_enzyme name
     *
     * @param conn An active connection to the database
     * @param name Restriction enzyme name to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public RestrictionEnzymeDetail( DBconnection conn, String name )
	throws SQLException {
	if ( name != null ) {
	    get_information( conn, name );
	}
    }

    //
    // TfcRestrictionEnzyme wrappers
    //
    public String get_name() { 
	return restrictionEnzyme.get_name(); 
    }

    public String get_site() { 
	return restrictionEnzyme.get_site(); 
    }

    public String get_cleavage() { 
	return restrictionEnzyme.get_cleavage(); 
    }

    public String get_isoschizomer() { 
	return restrictionEnzyme.get_isoschizomer(); 
    }

    public Integer get_offset() { 
	return restrictionEnzyme.get_offset(); 
    }

    public Integer get_overhang() { 
	return restrictionEnzyme.get_overhang(); 
    }

    public java.util.Date get_date_last_modified() { 
	return restrictionEnzyme.get_date_last_modified(); 
    }

    public java.util.Date get_date_entered() { 
        return restrictionEnzyme.get_date_entered();
    }
    
    public String get_original_name() { 
        return restrictionEnzyme.get_original_name();
    }


    /**
     * Retrieves data for submitted restriction enzyme id
     *
     * @param conn An active connection to the database
     * @param restriction_enzyme_id Restriction enzyme id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, 
				 Long restriction_enzyme_id ) 
	throws SQLException {

	restrictionEnzyme = new TfcRestrictionEnzyme( conn, 
						       restriction_enzyme_id );

	// populate superclass data
	super.populateBaseObject( restrictionEnzyme );
	getTairObjectInformation( conn );

    }
    
    /**
     * Retrieves data for submitted restriction enzyme name
     *
     * @param conn An active connection to the database
     * @param name Restriction enzyme name to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws SQLException {
	if ( name != null ) {
	    get_information( conn, get_id( conn, name ) );
	}
    }


    // get restriction enzyme id given name
    private Long get_id( DBconnection conn, String name ) throws SQLException {
	Long id = null;
	ResultSet results = null;
	
	String query = 
	    "SELECT restriction_enzyme_id " +
	    "FROM RestrictionEnzyme " +
	    "WHERE name = " + 
	    TextConverter.dbQuote( name );
    
	conn.setQuery( query );
	results = conn.getResultSet();
	if ( results.next() ) {
	    id = new Long( results.getLong( "restriction_enzyme_id" ) );
	}
	conn.releaseResources();

	return id;
    }


    /**
     * Retrieves element type of this object for use in creating TAIR accession
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (restrictionenzyme) for use in creating 
     * TAIR accession
     */
    public final String getElementType() { 
	return "restrictionenzyme"; 
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "*** RestrictionEnzymeDetail content test **" );
	restrictionEnzyme.test();
	System.out.println( "*** RestrictionEnzymeDetail content test end **" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection connection = new DBconnection();
	    Long test_id = new Long( 60 );
	    
	    RestrictionEnzymeDetail restriction_enzyme = 
		new RestrictionEnzymeDetail( connection, test_id );
	    restriction_enzyme.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
        
    }
    
}

  








