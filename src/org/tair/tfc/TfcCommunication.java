
/**
 * This class map to the table Communication in the tair database. Each instance
 * maps one row of data in Communication table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

import java.util.*;

public class TfcCommunication extends TfcReference {   

  private Long communication_id;
  private String name;
  private String author_name;
  private String communication;
  private java.util.Date date;
    
  public TfcCommunication() { }

  /**
   * TfcCommunication constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, all fields are null
   * @param connection an active connection to the database
   * @param reference_id the object id of a row in the Communication table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcCommunication( DBconnection connection, Long reference_id ) throws SQLException {
    super( connection, reference_id ); 
    String query = null;
    if ( reference_id != null ) {
      query =
	"select communication_id, "+
	"reference_id, "+
	"name, "+
	"author_name, "+
	"communication, "+
	"communication_date "+
	"from Communication "+
	"where reference_id = " + reference_id.toString();
      processResults( connection, query );
    }
  }

  public String getReferenceLabel() { return name + " (" + date + ")"; }
  
  private void processResults( DBconnection connection, String query ) throws SQLException {
    connection.setQuery( query );
    ResultSet results = connection.getResultSet();	       
    if ( results.next() ) {
			   
      long id = results.getLong( "communication_id" );
      if ( !results.wasNull() ) {
	this.communication_id = new Long( id );
      }
			   
      this.name = results.getString( "name" );
      this.author_name = results.getString( "author_name" );
      this.communication = results.getString( "communication" );
      this.date =  results.getDate( "communication_date" );
    }
    connection.releaseResources();
  }
  

  /**
     * TfcCommunication constructor initializes each field according to the value
     * of the object name in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcCommunication is null
     * @param connection the instance of DBconnection
     * @param value the object name of a row in the Communication table
     * @throws SQLException in the case of an invalid operation or database error
     */
  public TfcCommunication( DBconnection connection, String value ) throws SQLException {
    super( connection,get_super_id( connection, value ) ); 
    String query = null;
    if ( value != null ) {
      query =
	"select communication_id, "+
	"reference_id, "+
	"name, "+
	"author_name, "+
	"communication, "+
	"communication_date "+
	"from Communication "+
	"where name = " + TextConverter.dbQuote( value );
      processResults( connection, query );
    }
  }


  /**
   * Retrieves reference id for item with submitted communication_id
   *
   * @param connection An active connection to the database
   * @param communication_id communication id to retrieve reference id for
   * @return a <code>Long</code> value specifying the reference id for given communication id
   * @excetpion SQLException thrown in the case of an invalid operation or database error

   */
  public static Long get_super_id( DBconnection connection, Long communication_id ) throws SQLException {
    Long retval = null;
    String query = null;

    if ( communication_id != null ) { 
      query =
	"select reference_id "+
	"from Communication "+
	"where communication_id = " + communication_id.toString();
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
     * Retrieves reference id for item with submitted name
     * @param connection An active connection to the database
     * @param name Name of communication reference to retrieve id for
     * @return a <code>Long</code> value specifying the reference id for given name
     * @exception SQLException thrown in the case of an invalid operation or database error
     */
  public static Long get_super_id( DBconnection connection, String name )throws SQLException {
    Long retval = null;
    String query = null;
    if ( name != null ) {    
	query =
	    "select reference_id "+
	    "from Communication "+
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
  

  public void set_communication_id ( Long value ) { communication_id = value; }
  public Long get_communication_id() { return communication_id; }

  public void set_name ( String value ) { name = value; }
  public String get_name() { return name; }

  public void set_author_name ( String value ) { author_name = value; }
  public String get_author_name() { return author_name; }

  public void set_communication ( String value ) {  communication = value; }
  public String get_communication() { return communication; }

  public void set_date ( java.util.Date value ) { date = value; }
  public java.util.Date get_date() { return date; }

  
  /**
   * test TfcCommunication content
   */
  public void test() {
    super.test();
    System.out.println( "****** TfcCommunication content test ******" );
    System.out.println( "communication_id: " + get_communication_id() );
    System.out.println( "name is: " + get_name() );
    System.out.println( "author_name: " + get_author_name() );
    System.out.println( "communication: " + get_communication() );
    System.out.println( "date: " + get_date() );
    System.out.println( "**** TfcCommunication content test end ****" );
  }
  
  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {

    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 1545903 );
      TfcCommunication communication = new TfcCommunication( connection,test_id );
      communication.test();
  
      System.out.println( "*******************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
