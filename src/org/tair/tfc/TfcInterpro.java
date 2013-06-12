
/**
 * This class map to the table Interpro in the tair database. Each instance
 * maps one row of data in Interpro table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcInterpro {   

  private Long interpro_id;
  private String description;
  private String accession;
  private Integer parent_id;
  private String name;

  /**
   * Creates an empty instance of TfcInterpro
   */
  public TfcInterpro() { }

  /**
   * TfcInterpro constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcInterpro is null
   * @param connection the instance of DBconnection
   * @param interpro_id the object id of a row in the Interpro table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcInterpro( DBconnection connection, Long interpro_id ) throws SQLException {
    String query = null;

    if ( interpro_id != null ) {
      query =
	"select interpro_id, "+
	"name, "+
	"description, "+
	"accession, "+
	"parent_id "+
	"from Interpro "+
	"where interpro_id = " + interpro_id.toString();
      processResults( connection, query );
    }
  }

  private void processResults( DBconnection connection, String query ) throws SQLException {
    connection.setQuery( query );
    ResultSet results = connection.getResultSet();
    
    if ( results.next() ) {
      long id = results.getLong( "interpro_id" );
      if ( !results.wasNull() ) {
	this.interpro_id = new Long( id );
      }
      
      this.name = results.getString( "name" );
      this.description = results.getString( "description" );
      this.accession = results.getString( "accession" );
      
      int i = results.getInt( "parent_id" );
      if ( !results.wasNull() ) {
	this.parent_id = new Integer( i );
      }
      
    }
    connection.releaseResources();
  }

  /**
   * TfcInterpro constructor initializes each field according to the value
   * of the object name in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcInterpro is null
   * @param connection the instance of DBconnection
   * @param value the object name of a row in the Interpro table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public  TfcInterpro( DBconnection connection, String value ) throws SQLException {
    String query = null;
    if ( value != null ) {
      query ="select interpro_id, "+
	"name, "+
	"description, "+
	"accession, "+
	"parent_id "+
	"from Interpro "+
	"where name = " + TextConverter.dbQuote( value );
      processResults( connection, query );
    }
  }


  public void set_interpro_id ( Long value ) { interpro_id = value; }
  public Long get_interpro_id() { return interpro_id; }

  public void set_description ( String value ) { description = value; }
  public String get_description() { return description; }

  public void set_accession ( String value ) { accession = value; }
  public String get_accession() { return accession; }

  public void set_parent_id ( Integer value ) { parent_id = value; }
  public Integer get_parent_id() { return parent_id; }

  public void set_name ( String value ) { name = value; }
  public String get_name() { return name; }

  /**
   * test TfcInterpro content
   */
  public void test() {
    System.out.println( "****** TfcInterpro content test ******" );
    System.out.println( "interpro_id: " + get_interpro_id() );
    System.out.println( "name: " + get_name() );
    System.out.println( "description: " + get_description() );
    System.out.println( "accession: " + get_accession() );
    System.out.println( "parent_id: " + get_parent_id() );
    System.out.println( "**** TfcInterpro content test end ****" );
  }

  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {

    try{

      DBconnection connection = new DBconnection();
      Long test_id = new Long( 1 );
      
      //Translation_Tables
      TfcInterpro translation_tables = new TfcInterpro( connection, test_id );
      translation_tables.test();
    } catch( Exception e ) {
      e.printStackTrace();
    }

  }
}
