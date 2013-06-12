//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2004/04/12 17:31:32 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;


/**
 * This class maps to the RestrictionEnzyme table in the tair database. Each 
 * instance maps one row of data in RestrictionEnzyme table. Each data object 
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.
 */

public class TfcRestrictionEnzyme extends TfcTairObject {   

    private Long restriction_enzyme_id;
    private String name;
    private String site;
    private Integer offset;
    private Integer overhang;
    private String cleavage;
    private String isoschizomer;
    private java.util.Date date_last_modified;  
    private String original_name;
    private java.util.Date date_entered;

    /**
     * Creates an empty instance of TfcRestrictionEnzyme
     */
    public TfcRestrictionEnzyme() { 
	super();
    }

    /**
     * Creates an instance of TfcRestrictionEnzyme that reflects the data 
     * referenced by submitted restriction_enzyme_id
     *
     * @param conn An active connection to the database
     * @param restriction_enzyme_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcRestrictionEnzyme( DBconnection conn, Long restriction_enzyme_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, restriction_enzyme_id );
    }

    /**
     * Implements abstract method in superclass to return "RestrictionEnzyme"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "RestrictionEnzyme";
    }

    /**
     * Implements abstract method in superclass to return 
     * "restriction_enzyme_id" as name of primary key column to use when 
     * creating SQL statement for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "restriction_enzyme_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all RestrictionEnzyme specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of all RestrictionEnzyme columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "restriction_enzyme_id",
	    "name",
	    "site",
	    "isoschizomer",
	    "cleavage",
	    "offset",
	    "overhang",
	    "date_entered",
	    "original_name",
	    "date_last_modified "
	};

	return localClassColumns;
    }

    /**
     * Retrieves RestrictionEnzyme specific data from result set and stores
     * in member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "restriction_enzyme_id" );
	if ( !results.wasNull() ) {
	    set_restriction_enzyme_id( new Long( id ) );
	}
	
	set_name( results.getString( "name" ) );
	set_site( results.getString( "site" ) );
	set_isoschizomer( results.getString( "isoschizomer" ) );
	set_cleavage( results.getString( "cleavage" ) );
	
	int i = results.getInt( "offset" );
	if ( !results.wasNull() ) {
	    set_offset( new Integer( i ) );
	}
	
	i = results.getInt( "overhang" );
	if ( !results.wasNull() ) {
	    set_overhang( new Integer( i ) );
	}

      	set_original_name( results.getString( "original_name" ) );
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }
  

    //
    // Get 'em and set 'em
    //

    public void set_restriction_enzyme_id( Long id ) {  
	this.restriction_enzyme_id = id; 
    }

    public Long get_restriction_enzyme_id() { 
	return restriction_enzyme_id; 
    }

    public void set_name( String name ) {
	this.name = name;
    }

    public String get_name() { 
	return name; 
    }
    
    public void set_site( String site ) { 
	this.site = site; 
    }

    public String get_site() { 
	return site; 
    }

    public void set_offset( Integer offset) {
	this.offset = offset; 
    }

    public Integer get_offset() { 
	return offset; 
    }

    public void set_overhang( Integer overhang ) {
	this.overhang = overhang; 
    }

    public Integer get_overhang() { 
	return overhang; 
    }

    public void set_cleavage( String cleavage ) { 
	this.cleavage = cleavage;
    }

    public String get_cleavage() { 
	return cleavage; 
    }

    public void set_isoschizomer( String isoschizomer ) {
	this.isoschizomer = isoschizomer;
    }

    public String get_isoschizomer() {
	return isoschizomer; 
    }

    public void set_date_last_modified( java.util.Date date ) {
	date_last_modified = date; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_original_name ( String name ) { 
	this.original_name = name; 
    }

    public String get_original_name() { 
	return original_name; 
    }

    public void set_date_entered ( java.util.Date date ) { 
	this.date_entered = date;
    }

    public java.util.Date get_date_entered() { 
	return date_entered; 
    }
    
    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** TfcRestrictionEnzyme content test ******" );
	System.out.println( "restriction_enzyme_id: " + 
			    get_restriction_enzyme_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "site: " + get_site() );
	System.out.println( "isoschizomer: " + get_isoschizomer() );
	System.out.println( "cleavage: " + get_cleavage() );
	System.out.println( "offset: " + get_offset() );
	System.out.println( "overhang: " + get_overhang() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
	System.out.println( "**** TfcRestrictionEnzyme content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{

	    DBconnection conn = new DBconnection();
	    Long test_id = new Long( 360 );
	    TfcRestrictionEnzyme restriction_enzyme = 
		new TfcRestrictionEnzyme( conn, test_id ); 
	    restriction_enzyme.test();

	} catch (Exception e ) {
	    e.printStackTrace();
	}
    }  
}
