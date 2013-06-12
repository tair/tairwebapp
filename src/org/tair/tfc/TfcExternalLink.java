/**
 * This class map to the table ExternalLink in the tair database. Each instance
 * maps one row of data in ExternalLink table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

public class TfcExternalLink {   

  private Long external_link_id;
  private String base_url;
  private String web_site_name;

  /**
   * Creates an empty instance of TfcExternalLink
   */

  public TfcExternalLink() {  }
  
  /**
   * TfcExternalLink constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcExternalLink is null
   * @param connection the instance of DBconnection
   * @param external_link_id the object id of a row in the ExternalLink table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcExternalLink( DBconnection connection, Long external_link_id ) throws SQLException {
    String query = null;
    if ( external_link_id != null ) {
      query = 
	"select external_link_id, "+
	"base_url, " +
	"web_site_name " +
	"from ExternalLink "+
	"where external_link_id = " + external_link_id.toString();
      connection.setQuery( query );
      ResultSet results = connection.getResultSet();	       
      if ( results.next() ) {
	long id = results.getLong( "external_link_id" );
	if ( !results.wasNull() ) {
	  this.external_link_id = new Long( id );
	}
	this.base_url = results.getString( "base_url" );
	this.web_site_name = results.getString( "web_site_name" );
      }
      connection.releaseResources();
    }
  }

	public TfcExternalLink(Long id, String base, String ws_name){
		this.external_link_id = id;
		this.base_url = base;
		this.web_site_name = ws_name;
	}

  public void set_external_link_id ( Long value ) { external_link_id = value; }
  public Long get_external_link_id() { return external_link_id; }

  public void set_base_url( String base_url ) { this.base_url = base_url; }
  public String get_base_url() { return base_url; }

  public void set_web_site_name( String web_site_name ) { this.web_site_name = web_site_name; }
  public String get_web_site_name() { return web_site_name; }
  
  /**
   * test TfcExternalLink content
   */
  public void test() {
    System.out.println( "****** TfcExternalLink content test ******" );
    System.out.println( "external_link_id: " + get_external_link_id() );
    System.out.println( "base_url: " + get_base_url() );
    System.out.println( "web_site_name: " + get_web_site_name() );
    System.out.println( "**** TfcExternalLink content test end ****" );
  }
    

  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
    try{
      
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 2 );
      TfcExternalLink external_link = new TfcExternalLink( connection, test_id );
      external_link.test();
    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
