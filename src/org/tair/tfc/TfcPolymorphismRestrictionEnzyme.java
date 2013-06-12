package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;


/**
 * This class map to the table PolymorphismRestrictionEnzyme in the tair 
 * database. Each instance maps one row of data in 
 * PolymorphismRestrictionEnzyme table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/


public class TfcPolymorphismRestrictionEnzyme {   
  private Long polymorphism_id;
  private Long restriction_enzyme_id;
  private Integer num_sites;

  /**
   * Creates an empty instance of TfcPolymorphismRestrictionEnzyme
   */
  public TfcPolymorphismRestrictionEnzyme() {  }

  /**
   * TfcPolymorphismRestrictionEnzyme constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcPolymorphismRestrictionEnzyme is null
   * @param connection An active connection to the database
   * @param polymorphism_id the object id of a row in the PolymorphismRestrictionEnzyme table
   * @param restriction_enzyme_id the object id of a row in the PolymorphismRestrictionEnzyme table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcPolymorphismRestrictionEnzyme( DBconnection connection, Long polymorphism_id, Long restriction_enzyme_id ) throws SQLException {
    String query = null;
    if ( polymorphism_id != null && restriction_enzyme_id != null ) {
      query =
	"SELECT  polymorphism_id, "+
	"restriction_enzyme_id, "+
	"num_sites "+
	"FROM Polymorphism_RestrictionEnzyme "+
	"WHERE polymorphism_id = " + polymorphism_id.toString() + " " +
	"AND restriction_enzyme_id = " + restriction_enzyme_id.toString();
      connection.setQuery( query );
      ResultSet results = connection.getResultSet();
      if ( results.next() ) {
	long id = results.getLong( "polymorphism_id" );
	if ( !results.wasNull() ) {
	  this.polymorphism_id = new Long( id );
	}
			
	id = results.getLong( "restriction_enzyme_id" );
	if ( !results.wasNull() ) {
	  this.restriction_enzyme_id = new Long( id );
	}
			
	int i = results.getInt( "num_sites" );
	if ( !results.wasNull() ) {
	  num_sites = new Integer( i );
	}
      }
      connection.releaseResources();
    }
  }

  public void set_polymorphism_id ( Long value ) { polymorphism_id = value; }
  public Long get_polymorphism_id() { return polymorphism_id; }

  public void set_restriction_enzyme_id ( Long value ) {  restriction_enzyme_id = value; }
  public Long get_restriction_enzyme_id() { return restriction_enzyme_id; }

  public void set_num_sites ( Integer value ) { num_sites = value; }
  public Integer get_num_sites() { return num_sites; }

  /**
   * test TfcPolymorphismRestrictionEnzyme content
   */
  public void test() {
    System.out.println( "****** TfcPolymorphismRestrictionEnzyme content test ******" );
    System.out.println( "polymorphism_id: " + this.get_polymorphism_id() );
    System.out.println( "restriction_enzyme_id: " + this.get_restriction_enzyme_id() );
    System.out.println( "num_sites: " + this.get_num_sites() );
    System.out.println( "**** TfcPolymorphismRestrictionEnzyme content test end ****" );
  }


  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      Long restriction_enzyme_id = new Long( 342 );
      Long polymorphism_id = new Long( 3337 );
      TfcPolymorphismRestrictionEnzyme polystate = new TfcPolymorphismRestrictionEnzyme( connection, polymorphism_id, restriction_enzyme_id );
      polystate.test();
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

}
