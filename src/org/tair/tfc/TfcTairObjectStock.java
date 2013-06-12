/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.io.Serializable;
import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the table TairObjectStock in the tair database. Each 
 * instance maps one row of data in TairObjectStock table. Each data object 
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data 
 */


public class TfcTairObjectStock implements Serializable {   

  private Long tair_object_id;
  private Long stock_id;
  private String relationship_type;

   
  public TfcTairObjectStock() { }

  /**
   * Creates an instance of TfcTairObjectStock that represents the relationship
   * between the submitted tair_object_id and stock_id.
   *
   * @param conn an active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @param stock_id Stock id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error, or if 
   * no row found for join between tair_object_id and stock_id
   */
  public  TfcTairObjectStock( DBconnection conn, Long tair_object_id, Long stock_id ) throws SQLException {
    String query = null;
    if ( tair_object_id != null && stock_id != null ) {
      query =
	"SELECT tair_object_id, " +
	"stock_id, " +
	"relationship_type " +
	"FROM TairObject_Stock " +
	"WHERE tair_object_id = " + tair_object_id.toString() + " " +
	"AND stock_id = " + stock_id.toString();
      conn.setQuery( query );
      try {
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	  long id = results.getLong( "tair_object_id" );
	  if ( !results.wasNull() ) {
	    this.tair_object_id = new Long( id );
	  }
	  
	  id = results.getLong( "stock_id" );
	  if ( !results.wasNull() ) {
	    this.stock_id = new Long( id );
	  }
	  this.relationship_type = results.getString( "relationship_type" );
	} else {
	  throw new RecordNotFoundException( "No relationship found between tair object id: " + 
					     tair_object_id + " and stock id " + stock_id );
	}
      } finally {
	conn.releaseResources();
      }
    }
  }


  public void set_tair_object_id ( Long id ) { this.tair_object_id = id; }
  public Long get_tair_object_id() { return tair_object_id; }
    
  public void set_stock_id ( Long id ) { this.stock_id = id; }
  public Long get_stock_id() { return stock_id; }

  public void set_relationship_type( String type ) { this.relationship_type = type; }
  public String get_relationship_type() { return relationship_type; }


  /**
   * For unit testing only
   */
  public void test() {	
    System.out.println( "****** TfcTairObjectStock content test *******" );
    System.out.println( "stock_id: " + get_stock_id() );
    System.out.println( "tair_object_id: " + get_tair_object_id() );
    System.out.println( "relationship type: " + get_relationship_type() );
    System.out.println( "**** TfcTairObjectStock content test end *****" );
  }
    
    
  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    
    try{
      DBconnection conn = new DBconnection();
      Long tair_object_id = new Long( 14891 );
      Long stock_id = new Long( 5 );
      TfcTairObjectStock stock = new TfcTairObjectStock( conn, tair_object_id, stock_id );
      stock.test();
      System.out.println( "**********************************************" );
	    
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
