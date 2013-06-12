//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.17 $
// $Date: 2004/04/06 18:30:26 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * ContigDetail is a composite class to represent all information
 * associated with an entry in the Contig table for display
 * on the contig detail page. ContigDetail contains an instance of 
 * <code>TfcContig</code> in addition to all information
 * in <code>MapElementDetail</code> and <code>TairObjectDetail</code>
 * superclasses.
 */

public class ContigDetail extends MapElementDetail {
  
    private TfcContig contig;


    /**
     * Creates an empty instance of ContigDetail
     */
    public ContigDetail() { }

    
    /**
     * Creates an instance of ContigDetail that represents all information
     * referenced by submitted contig id
     *
     * @param conn An active connection to the database
     * @param contig_id Contig id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public ContigDetail( DBconnection conn, Long contig_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, contig_id );
    }


    /**
     * Creates an instance of ContigDetail that represents all information
     * referenced by submitted contig name
     *
     * @param conn An active connection to the database
     * @param name Contig name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public ContigDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {
	
	get_information( conn, name );
    }


    /**
     * Retrieves information for submitted contig name and populates 
     * member objects
     *
     * @param conn An active connection to the database
     * @param name Contig name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcContig.retrieveContigID( conn, name );

	if ( id == null ) {
	    throw new RecordNotFoundException( "No contig found with " +
						"name: " + name );
	}
	get_information( conn, id );
    }


    /**
     * Retrieves information for submitted contig id and populates member 
     * objects. ContigDetail objects are created without any assignment 
     * information; this is because of the number of map feature assignments 
     * onto contig that would bog the server down and probably not be terribly 
     * useful at the display level anyway.
     *
     * @param conn An active connection to the database
     * @param contig id Contig_id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public  void get_information( DBconnection conn, Long contig_id ) 
	throws RecordNotFoundException, SQLException {
    
        // populate superclasses using populateXXX methods instead of 
	// regular getMapElementInformation and getTairObjectInformation
	// methods so we can omit map feature assignments 
	contig = new TfcContig( conn, contig_id );

	// MapElementDetail info
	Long id = contig.get_map_element_id();
	super.populateBaseObject( contig );
	super.populateIsAGIMap( conn, id );
	super.populateShowMapViewer( conn, id, get_map_element_type() );
	
	// TairObjectDetail info.
	id = contig.get_tair_object_id();
	super.populateAliases( conn, id );
	super.populateAttributions( conn, id );
	super.populateUpdateHistory( conn, id );
	super.populateAnnotations( conn, id );
	super.populateExternalLinks( conn, id );
	super.populateNotepad( conn, id );
	super.populateImages( conn, id );
    }
  


    //
    // TfcContig wrappers
    // 
    public String get_name() { 
	return contig.get_name(); 
    }

    public String get_chromosome() { 
	return contig.get_chromosome(); 
    }

    public Float get_length() { 
	return contig.get_length(); 
    }

    public String get_units() { 
	return contig.get_units(); 
    }

    public String get_group_name() { 
	return contig.get_group_name(); 
    }

    public String get_type() { 
	return contig.get_type(); 
    }

    public java.util.Date get_date_last_modified() {
	return contig.get_date_last_modified(); 
    }
 
    public java.util.Date get_date_entered() { 
        return contig.get_date_entered();
    }
    
    public String get_original_name() { 
        return contig.get_original_name();
    } 

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        if ( contig != null ) {
            contig.test();
        }
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 2 );
            ContigDetail object = new ContigDetail( conn, id );
            object.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
