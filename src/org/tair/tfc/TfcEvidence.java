/**
 * This class map to the table Evidence in the tair database. Each instance
 * maps one row of data in Evidence table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

public class TfcEvidence {   

  private Long evidence_id;
  private String type;

  /**
   * Creates an empty instance of TfcEvidence
   */

  public TfcEvidence() {  }
  
  /**
   * TfcEvidence constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcEvidence is null
   * @param connection the instance of DBconnection
   * @param evidence_id the object id of a row in the Evidence table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcEvidence( DBconnection connection, Long evidence_id ) throws SQLException {
    String query = null;
    if ( evidence_id != null ) {
      query = 
	"select evidence_id, "+
	"evidence_type " +
	"from Evidence "+
	"where evidence_id = " + evidence_id.toString();
      connection.setQuery( query );
      ResultSet results = connection.getResultSet();	       
      if ( results.next() ) {
	long id = results.getLong( "evidence_id" );
	if ( !results.wasNull() ) {
	  this.evidence_id = new Long( id );
	}
	this.type = results.getString( "evidence_type" );
      }
      connection.releaseResources();
    }
  }

  public void set_evidence_id ( Long value ) { evidence_id = value; }
  public Long get_evidence_id() { return evidence_id; }

  public void set_type( String type ) { this.type = type; }
  public String get_type() { return type; }
  
  /**
   * test TfcEvidence content
   */
  public void test() {
    System.out.println( "****** TfcEvidence content test ******" );
    System.out.println( "evidence_id: " + get_evidence_id() );
    System.out.println( "type: " + get_type() );
    System.out.println( "**** TfcEvidence content test end ****" );
  }
    

  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
    try{
      
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 731 );
      TfcEvidence evidence = new TfcEvidence( connection, test_id );
      evidence.test();
    } catch( Exception e ) {
      e.printStackTrace();
    }

  }

}
