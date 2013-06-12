/**
 * This class map to the table Erratum in the tair database. Each instance
 * maps one row of data in Erratum table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

public class TfcErratum {   

  private Long erratum_id;
  private Long reference_id;
  private String erratum;

  /**
   * Creates an empty instance of TfcErratum
   */
  public TfcErratum() { }

  /**
   * TfcErratum constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcErratum is null
   * @param connection the instance of DBconnection
   * @param erratum_id the object id of a row in the Erratum table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcErratum( DBconnection connection, Long erratum_id ) throws SQLException {
    String query = null;
    if ( erratum_id != null ) {
      query = 
	"select erratum_id, "+
	"reference_id, "+
	"erratum "+
	"from Erratum "+
	"where erratum_id = " + erratum_id.toString();
      connection.setQuery( query );

      ResultSet results = connection.getResultSet();	       
      if ( results.next() ) {
	long id = results.getLong( "erratum_id" );
	if ( !results.wasNull() ) {
	  this.erratum_id = new Long( id );
	}
			
	id = results.getLong( "reference_id" );
	if ( !results.wasNull() ) {
	  this.reference_id = new Long( id );
	}			
	this.erratum = results.getString( "erratum" );
      }
      connection.releaseResources();
    }
  }

  public void set_erratum_id ( Long value )  { erratum_id = value; }
  public Long get_erratum_id() { return erratum_id; }

  public void set_reference_id ( Long value ) { reference_id = value; }
  public Long get_reference_id() { return reference_id; }

  public void set_erratum ( String value ) { erratum = value; }
  public String get_erratum() { return erratum; }

  /**
   * test TfcErratum content
   */
  public void test() {
    System.out.println( "****** TfcErratum content test ******" );
    System.out.println( "erratum_id: " + get_erratum_id() );
    System.out.println( "reference_id: " + get_reference_id() );
    System.out.println( "erratum: " + get_erratum() );
    System.out.println( "**** TfcErratum content test end ****" );
  }

 
  /**
   * main function used to for testing only 
   */
  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 35626 );
      TfcErratum erratum = new TfcErratum( connection, test_id );
      erratum.test();
    } catch ( Exception e ) {
      e.printStackTrace();
    }

  }

}
