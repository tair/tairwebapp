//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/09/02 22:15:55 $
//-----------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the ProteinDomain table in the tair database. Each 
 * instance maps one row of data in ProteinDomain table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 */


public class TfcProteinDomain extends TfcTairObject {   

    private Long protein_domain_id;
    private Long interpro_id;
    private String accession;
    private String name;
    private String type;
    private String structural_class_type_id;
    private java.util.Date date_last_modified;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;   

    /**
     * Creates an empty instance of TfcProteinDomain
     */
    public TfcProteinDomain() {
	super();
    }


    /**
     * Creates an instance of TfcProteinDomain that reflects the data referenced
     * by submitted protein_domain_id
     *
     * @param conn An active connection to the database
     * @param protein_domain_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcProteinDomain( DBconnection conn, Long protein_domain_id )
	throws RecordNotFoundException, SQLException {

	super( conn, protein_domain_id );
    }

    /**
     * Implements abstract method in superclass to return "ProteinDomain"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "ProteinDomain";
    }

    /**
     * Implements abstract method in superclass to return "protein_domain_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "protein_domain_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all ProteinDomain specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of all ProteinDomain specific columns to 
     * include in SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "protein_domain_id",
	    "interpro_id",
	    "accession",
	    "name",
	    "proteindomain_type",
	    "structural_class_type_id",
	    "date_last_modified",
	    "date_entered",
	    "original_name",
	    "is_obsolete"
	};

	return localClassColumns;
    }

    /**
     * Retrieves ProteinDomain specific data from result set and stores in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "protein_domain_id" );
	if ( !results.wasNull() ) {
	    set_protein_domain_id( new Long( id ) );
	}
	
	id = results.getLong( "interpro_id" );
	if ( !results.wasNull() ) {
	    set_interpro_id( new Long( id ) );
	}
	
	set_accession( results.getString( "accession" ) );
	set_name( results.getString( "name" ) );
	set_type( results.getString( "proteindomain_type" ) );
	set_date_last_modified( results.getDate( "date_last_modified" ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );

	set_structural_class_type_id( 
	    results.getString( "structural_class_type_id" ) );
    }


    //
    // Get 'em and set 'em
    //

    public void set_protein_domain_id( Long id ) { 
	this.protein_domain_id = id; 
    }

    public Long get_protein_domain_id() { 
	return protein_domain_id;
    }

    public void set_interpro_id( Long id ) { 
	this.interpro_id = id; 
    }

    public Long get_interpro_id() { 
	return interpro_id; 
    }

    public void set_accession( String accession ) {
	this.accession = accession; 
    }

    public String get_accession() {
	return accession; 
    }

    public void set_name( String name ) {
	this.name = name;
    }

    public String get_name() {
	return name; 
    }

    public void set_type( String type ) {
	this.type = type; 
    }

    public String get_type() { 
	return type; 
    }

    public void set_structural_class_type_id( String id ) {
	this.structural_class_type_id = id;
    }

    public String get_structural_class_type_id() {
	return structural_class_type_id;
    }

    public void set_date_last_modified( java.util.Date date ) { 
	this.date_last_modified = date; 
    }

    public java.util.Date get_date_last_modified() { 
	return date_last_modified; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
	this.is_obsolete = is_obsolete; 
    }

    public Boolean get_is_obsolete() { 
	return is_obsolete; 
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
	System.out.println( "****** TfcProteinDomain content test ******" );
	System.out.println( "protein_domain_id: " + get_protein_domain_id() ); 
	System.out.println( "accession: " + get_accession() );
	System.out.println( "interpro_id: " + get_interpro_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "type: " + get_type() );

	System.out.println( "structural class type id: " + 
			    get_structural_class_type_id() );

	System.out.println( "is_obsolete: " + get_is_obsolete() );
	System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcProteinDomain content test end ****" );        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 13 );
	    TfcProteinDomain domain = new TfcProteinDomain( conn, id );
	    domain.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}

    }

}
