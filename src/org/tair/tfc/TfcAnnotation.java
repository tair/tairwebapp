/**
 * This class map to the table Annotation in the tair database. Each instance
 * maps one row of data in Annotation table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.util.*;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;

public class TfcAnnotation {   
  private Long annotation_id;
  private Long tair_object_id;
  private BigInteger annotated_by_id;
  private String type;
  private String short_annotation;
  private String long_annotation;
  private java.util.Date date_entered;
   
  public TfcAnnotation() { }

  /**
   * TfcAnnotation constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcAnnotation is null
   * @param connection the instance of DBconnection
   * @param annotation_id the object id of a row in the Annotation table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcAnnotation( DBconnection connection, Long annotation_id ) throws SQLException {
    String query = null;
    if ( annotation_id != null ) {	       
      query =
	"select tair_object_id, "+
	"annotation_id, "+
	"annotated_by_id, "+
	"annotation_long, "+
	"short, "+
	"date_entered, "+
	"annotation_type "+
	"from Annotation "+
	"where annotation_id = " + annotation_id.toString();
      connection.setQuery( query );
      
      ResultSet results = connection.getResultSet();	       
      if ( results.next() ) {
	long id = results.getLong( "tair_object_id" );
	if ( !results.wasNull() ){
	  this.tair_object_id = new Long( id );
	}
	
	id = results.getLong( "annotation_id" );
	if ( !results.wasNull() ){
	  this.annotation_id = new Long( id );
	}
	
	BigDecimal annotatedById = results.getBigDecimal( "annotated_by_id" );
	if ( !results.wasNull() ){
	  this.annotated_by_id = annotatedById.toBigInteger();
	}
	
	this.long_annotation = results.getString( "annotation_long" );
	this.short_annotation = results.getString( "short" );
	this.date_entered = results.getDate( "date_entered" );
	this.type =  results.getString( "annotation_type" );
      }
      connection.releaseResources();
    }
  }

  public void set_annotation_id ( Long value ) { annotation_id = value; }
  public Long get_annotation_id() { return annotation_id; }

  public void set_tair_object_id ( Long value ) { tair_object_id = value; }
  public Long get_tair_object_id() { return tair_object_id; }

  public void set_annotated_by_id ( BigInteger value ) { annotated_by_id = value; }
  public BigInteger get_annotated_by_id() { return annotated_by_id; }

  public void set_short_annotation ( String value ) { short_annotation = value; }
  public String get_short_annotation() { return short_annotation; }

  public void set_long_annotation ( String value ) { long_annotation = value; }
  public String get_long_annotation() { return long_annotation; }

  public void set_date_entered ( java.util.Date value ) { date_entered = value; }
  public java.util.Date get_date_entered() { return date_entered; }

  public void set_type ( String value ) { type = value; }
  public String get_type() { return type; }

  
  /**
   * Stores data in this object to Annotation table.  If annotation_id is
   * <code>null</code> data is INSERTed to the table and resulting annotation_id 
   * is stored in the object.  If annotation_id is not null, database is UPDATEd 
   * with current information in the object. 
   *
   * @param connection An active connection to the database.  Connection must have INSERT/UPDATE
   * permissions on the Annotation table, or an exception will be thrown
   * @exception SQLException thrown if an error occurs while updating the database
   */  
  public void store( DBconnection conn ) throws SQLException {
    String query = null;
    ResultSet results = null;

    if ( get_annotation_id() != null ) { // update if existing
      query = 
	"UPDATE Annotation SET " +
	"tair_object_id = " + get_tair_object_id().toString() + ", " +
	"annotated_by_id = " + get_annotated_by_id().toString() + ", " +
	"annotation_type = " + TextConverter.dbQuote( get_type() ) + ", " +
	"date_entered = " + TextConverter.dbQuote( get_date_entered(), "mm/dd/yyyy" ) + ", " +
	"short = " + TextConverter.dbQuote( get_short_annotation() ) + ", " +
	"annotation_long = " + TextConverter.dbQuote( get_long_annotation() ) + " " +
	"WHERE annotation_id = " + get_annotation_id().toString();
      conn.setQuery( query );
      conn.executeUpdate();
      conn.releaseResources();
      
    } else { // insert new annotation
      query =
	"INSERT Annotation ( " +
	"tair_object_id, " +
	"annotated_by_id, " +
	"annotation_type, " +
	"date_entered, " + 
	"short, " +
	"annotation_long ) " +
	"VALUES ( " + get_tair_object_id().toString() + ", " +
	get_annotated_by_id().toString() + ", " +
	TextConverter.dbQuote( get_type() ) + ", " +
	TextConverter.dbQuote( get_date_entered(), "mm/dd/yyyy" ) + ", " +
	TextConverter.dbQuote( get_short_annotation() ) + ", " +
	TextConverter.dbQuote( get_long_annotation() ) + " ) " +
	"SELECT @@IDENTITY as annotation_id";
      conn.setQuery( query );
      results = conn.getResultSet();
      if ( results.next() ) {
	set_annotation_id( new Long( results.getLong( "annotation_id" ) ) );
      }
      conn.releaseResources();
    }
  }



  /**
   * test TfcAnnotation content
   */
  public void test(){
    System.out.println( "****** TfcAnnotation content test ******" );
    System.out.println( "tair_object_id is " + this.get_tair_object_id() ); 
    System.out.println( "annotation_id is " + this.get_annotation_id() );
    System.out.println( "annotated_by_id is " + this.get_annotated_by_id() );
    System.out.println( "long_annotation is " + this.get_long_annotation() );
    System.out.println( "short_annotation is " + this.get_short_annotation() );
    System.out.println( "date is " + this.get_date_entered() );
    System.out.println( "type is " + this.get_type() );
    System.out.println( "**** TfcAnnotation content test end ****" );
  }


  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ){
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 277 );
      TfcAnnotation annotation = new TfcAnnotation( connection, test_id );
      annotation.test();

      long id = 1;
      String t = "labda";
      String n = "phage"; 
      boolean test = true;
      java.util.Date date = new java.util.Date();
      id++;
      annotation.set_tair_object_id( new Long( id ) );
      id++;
      annotation.set_annotation_id( new Long( id ) );
      id++; 
      annotation.set_annotated_by_id( new BigInteger( "1" ) );
      annotation.set_long_annotation( n );
      annotation.set_short_annotation( t );
      annotation.set_date_entered( date );
      annotation.set_type( "test type" );
      annotation.test();
      System.out.println( "test completed " );
      System.out.println( "****************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
