/**
 * This class map to the table DatabaseReference in the tair database. Each instance
 * maps one row of data in DatabaseReference table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;
import java.util.*;

public class TfcDatabaseReference extends TfcReference {   

  private Long database_reference_id;
  private String name;
  private String description;
  private String extdb_table;
  private String extdb_field;
  private String extdb_id;
  private Boolean is_stock_center;
  private java.util.Date date_last_updated;

  /** 
   * Creates an empty instance of TfcDatabaseReference
   */
  public TfcDatabaseReference() { }

  /**
   * TfcDatabaseReference constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcDatabaseReference is null
   * @param connection the instance of DBconnection
   * @param reference_id the object id of a row in the DatabaseReference table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcDatabaseReference( DBconnection connection, Long reference_id ) throws SQLException {
    super( connection, reference_id ); 
    String query = null;
    if ( reference_id != null ) {
      query =
	"select database_reference_id, "+
	"reference_id, "+
	"name, "+
	"description, "+
	"extdb_table, "+
	"extdb_field, "+
	"extdb_id, "+
	"is_stock_center, "+
	"date_last_updated "+
	"from DatabaseReference "+
	"where reference_id = " + reference_id.toString();
      processResults( connection, query );
    }
  }

  private void processResults( DBconnection connection, String query ) throws SQLException {
    connection.setQuery( query );
    ResultSet results = connection.getResultSet();	       
    if ( results.next() ) {
      long id = results.getLong( "database_reference_id" );
      if ( !results.wasNull() ) {
	this.database_reference_id = new Long( id );
      }
      
      this.name = results.getString( "name" );
      this.description = results.getString( "description" );
      this.extdb_table = results.getString( "extdb_table" );
      this.extdb_field = results.getString( "extdb_field" );
      this.extdb_id = results.getString( "extdb_id" );
      this.is_stock_center = TextConverter.stringToBoolean( results.getString( "is_stock_center" ) );
      this.date_last_updated =  results.getDate( "date_last_updated" );    
    }
    connection.releaseResources();
  }


  /**
   * TfcDatabaseReference constructor initializes each field according to the value
   * of the object name in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcDatabaseReference is null
   * @param connection the instance of DBconnection
   * @param name the object name of a row in the DatabaseReference table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcDatabaseReference( DBconnection connection, String name )throws SQLException {
    super( connection, get_super_id( connection, name ) ); 
    if ( name != null ) {
      String query =
	"select database_reference_id, "+
	"reference_id, "+
	"name, "+
	"description, "+
	"extdb_table, "+
	"extdb_field, "+
	"extdb_id, "+
	"is_stock_center, "+
	"date_last_updated "+
	"from DatabaseReference "+
	"where name = " + TextConverter.dbQuote( name );
      processResults( connection, query );
    }
  }


  /**
   * Gets reference id for given database_reference_id
   * @param connection an instance of DBconnection
   * @param database_reference_id ID to retrieve reference_id for
   * @exception SQLException thrown in the case of an invalid operation or database error
   * @return a <code>Long</code> value specifying the reference id of this database_reference_id
   */
  public static Long get_super_id( DBconnection connection, Long database_reference_id ) throws SQLException {
    Long retval = null;
    String query = null;

    if ( database_reference_id != null ) {
      query =
	"select reference_id "+
	"from DatabaseReference "+
	"where database_reference_id = " + database_reference_id.toString();
      connection.setQuery( query );
      ResultSet results = connection.getResultSet();	       
      if ( results.next() ) {
	retval = new Long( results.getLong( "reference_id" ) );
      }
      connection.releaseResources();
    }
    return retval;
  }

  /**
   * Gets reference id for given database reference name
   * @param connection an instance of DBconnection
   * @param name name to retrieve reference_id for
   * @exception SQLException thrown in the case of an invalid operation or database error
   * @return a <code>Long</code> value specifying the reference id of this name
   */
  public static Long get_super_id( DBconnection connection, String name )throws SQLException{
    Long retval = null;
    String query = null;
    if ( name != null ) {
      query =
	"select reference_id "+
	"from DatabaseReference "+
	"where name = " + 
	TextConverter.dbQuote( name );

      connection.setQuery( query );

      ResultSet results = connection.getResultSet();	       
      if ( results.next() ) {
	retval = new Long( results.getLong( "reference_id" ) );
      }
      connection.releaseResources();
    }
    return retval;
  }
  
  public void set_database_reference_id ( Long value ) { database_reference_id = value; }
  public Long get_database_reference_id() { return database_reference_id; }

  public void set_name ( String value ) { name = value; }
  public String get_name() { return name; }

  public void set_description ( String value ) { description = value; }
  public String get_description() { return description; }

  public void set_extdb_table ( String value ) { extdb_table = value; }
  public String get_extdb_table() { return extdb_table; }

  public void set_extdb_field ( String value ) { extdb_field = value; }
  public String get_extdb_field() { return extdb_field; }

  public void set_extdb_id ( String value ) { extdb_id = value;  }
  public String get_extdb_id() { return extdb_id; }

  public void set_is_stock_center ( Boolean value ) { is_stock_center = value; }
  public Boolean get_is_stock_center() { return is_stock_center; }

  public void set_date_last_updated ( java.util.Date value ) { date_last_updated = value; }
  public java.util.Date get_date_last_updated() { return date_last_updated; }

  /**
   * test TfcDatabaseReference content
   */
  public void test() {
    super.test();
    System.out.println( "****** TfcDatabaseReference content test ******" );
    System.out.println( "database_reference_id: " + get_database_reference_id() );
    System.out.println( "name: " + get_name() );
    System.out.println( "description: " + get_description() );
    System.out.println( "extdb_table: " + get_extdb_table() );
    System.out.println( "extdb_field: " + get_extdb_field() );
    System.out.println( "extdb_id: " + get_extdb_id() );
    System.out.println( "date_last_updated: " + get_date_last_updated() );
    System.out.println( "is_stock_center:  " + get_is_stock_center() );
    System.out.println( "**** TfcDatabaseReference content test end ****" );
  }

  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 945266 );
      TfcDatabaseReference reference = new TfcDatabaseReference( connection,test_id );
      reference.test();
      System.out.println( "***********************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
