//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.10 $
// $Date: 2004/04/05 22:40:50 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the CloneChimerism table in the tair database. Each 
 * instance maps one row of data in CloneChimerism table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 */

public class TfcCloneChimerism {   
    
    private Long clone_chimerism_id;
    private String genome_type;
    private String repeat_type;
    private Boolean chim_pos_known;
    private Boolean chim_on_left;
    private Boolean chim_on_right;
    private Boolean is_on_same_chr;
    private Boolean is_repeat;
    private java.util.Date date_last_modified;


    /**
     * Creates an empty instance of TfcCloneChimerism
     */
    public TfcCloneChimerism() { }

    /**
     * Creates an instance of TfcCloneChimerism that reflects the data 
     * referenced by submitted clone_chimerism_id
     * 
     * @param conn An active connection to the database
     * @param clone_chimerism_id ID to retrieve data for
     * @throws SQLException in the case of an invalid operation or database 
     * error
     */
    public TfcCloneChimerism( DBconnection connection, Long clone_chimerism_id )
	throws SQLException {
	
	if ( clone_chimerism_id != null ) {
	    String query =
		"SELECT clone_chimerism_id, "+
		"genome_type, "+
		"repeat_type, "+
		"chim_pos_known, "+
		"chim_on_left, "+
		"chim_on_right, "+
		"is_on_same_chr, "+
		"is_repeat "+
		"from CloneChimerism "+
		"where clone_chimerism_id = " + clone_chimerism_id.toString();
	    connection.setQuery( query );
      
	    ResultSet results = connection.getResultSet();           
	    if ( results.next() ) {
		long id = results.getLong( "clone_chimerism_id" );
		if ( !results.wasNull() ) {
		    clone_chimerism_id = new Long( id );
		}
        
		genome_type = results.getString( "genome_type" );
		repeat_type = results.getString( "repeat_type" );

		chim_pos_known = 
		    TextConverter.stringToBoolean( results.getString( "chim_pos_known" ) );

		chim_on_left = 
		    TextConverter.stringToBoolean( results.getString( "chim_on_left" ) );

		chim_on_right = 
		    TextConverter.stringToBoolean( results.getString( "chim_on_right" ) );

		is_on_same_chr = 
		    TextConverter.stringToBoolean( results.getString( "is_on_same_chr" ) );

		is_repeat = 
		    TextConverter.stringToBoolean( results.getString( "is_repeat" ) );
	    }
	    connection.releaseResources();
	}
    }

    public void set_clone_chimerism_id( Long value ) { 
	clone_chimerism_id = value; 
    }

    public Long get_clone_chimerism_id() { 
	return clone_chimerism_id; 
    }

    public void set_genome_type( String value ) {
	genome_type = value; 
    }

    public String get_genome_type() { 
	return genome_type; 
    }

    public void set_repeat_type( String value ) {
	repeat_type = value; 
    }

    public String get_repeat_type() { 
	return repeat_type; 
    }

    public void set_chim_pos_known( Boolean value ) { 
	chim_pos_known = value; 
    }

    public Boolean get_chim_pos_known() { 
	return chim_pos_known; 
    }

    public void set_chim_on_left( Boolean value ) { 
	chim_on_left = value; 
    }

    public Boolean get_chim_on_left() {
	return chim_on_left; 
    }

    public void set_chim_on_right( Boolean value ) { 
	chim_on_right = value; 
    }

    public Boolean get_chim_on_right() { 
	return chim_on_right; 
    }

    public void set_is_on_same_chr( Boolean value ) { 
	is_on_same_chr = value; 
    }

    public Boolean get_is_on_same_chr() { 
	return is_on_same_chr; 
    }

    public void set_is_repeat( Boolean value ) { 
	is_repeat = value; 
    }

    public Boolean get_is_repeat() { 
	return is_repeat; 
    }

    public void set_date_last_modified( java.util.Date value ) { 
	date_last_modified = value; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcCloneChimerism content test ******" );
	System.out.println( "clone_chimerism_id is " + this.get_clone_chimerism_id() );    
	System.out.println( "genome_type is " + this.get_genome_type() );
	System.out.println( "repeat is " + this.get_repeat_type() );
	System.out.println( "chi_pos_known is " + this.get_chim_pos_known() );
	System.out.println( "chim_on_left is " + this.get_chim_on_left() );
	System.out.println( "chim_on_right is " + this.get_chim_on_right() );
	System.out.println( "is_on_same_chr is " + this.get_is_on_same_chr() );
	System.out.println( "is_repeat is " + this.get_is_repeat() );
	System.out.println( "date_last_modified is " + this.get_date_last_modified() );
	System.out.println( "**** TfcCloneChimerism content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
	try {

	    DBconnection connection = new DBconnection();
	    Long test_id = new Long( 4 );
	    TfcCloneChimerism clone = new TfcCloneChimerism( connection, test_id );
	    clone.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}
    }
}
