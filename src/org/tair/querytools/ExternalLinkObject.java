/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * ExternalLinkObject is a composite class to show collected information
 * for a given tair object and external link from the ExternalLink table via TfcExternalLink 
 * and TairObject_ExternalLink table.  
 */

public class ExternalLinkObject {

  private TfcExternalLink externalLink;
  private Long tair_object_id;
  private String url_variable;
  private String link_name;
  private String fully_assembled_link;
    
  /**
   * Creates an empty instance of ExternalLinkObject
   */
  public ExternalLinkObject() { }

  /**
   * Creates an instance of ExternalLinkObject to reflect the information
   * represented by submitted external_link_id and tair_object_id
   *
   * @param conn An active connection to the database
   * @param external_link_id External link id to retrieve data for
   * @param tair_objectk_id Tair Object id to retrieve data for
   * @exception SQLException thrown if a database error occurs
   */
  public ExternalLinkObject( DBconnection conn, Long tair_object_external_link_id ) throws SQLException {
    // sql for linking table
    String query = null;
    if ( tair_object_external_link_id != null ) {
      Long external_link_id = null;
      query = 
	"select tair_object_id, "+
	"external_link_id, " +
	"url_variable, " +
	"link_name " +
	"from TairObject_ExternalLink "+
	"where tair_object_external_link_id = " + tair_object_external_link_id.toString();
      conn.setQuery( query );
      ResultSet results = conn.getResultSet();	       
      if ( results.next() ) {
	long id = results.getLong( "tair_object_id" );
	if ( !results.wasNull() ) {
	  tair_object_id = new Long( id );
	}
	id = results.getLong( "external_link_id" );
	if ( !results.wasNull() ) {
	  external_link_id = new Long( id );
	}
	url_variable = results.getString( "url_variable" );
	link_name = results.getString( "link_name" );
      }
      conn.releaseResources();
      externalLink = new TfcExternalLink( conn, external_link_id );
    }
    set_fully_assembled_link( externalLink.get_base_url(), url_variable);
  }

	public ExternalLinkObject(Long id, String link_name, String url_variable, Long tfc_id, String base, String ws_name) {
		this.tair_object_id = id;
		this.link_name = link_name;
		this.url_variable = url_variable;
		this.externalLink = new TfcExternalLink(tfc_id, base, ws_name);
		set_fully_assembled_link( externalLink.get_base_url(), url_variable);
	}

  //TfcExternalLink wrappers
  public Long get_external_link_id() { return externalLink.get_external_link_id(); }
  public String get_base_url() { return externalLink.get_base_url(); }
  public String get_web_site_name() { return externalLink.get_web_site_name(); }

  //TairObject_ExternalLink wrappers
  public Long get_tair_object_id() { return tair_object_id; }
  public String get_url_variable() { return url_variable; }
  public String get_link_name() { return link_name; }

  //Custom attribute getter/setter methods
  private void set_fully_assembled_link( String base_url, String url_variable ) {
    String target = "\" target=\"_blank"; 
    if ( base_url != null ) {
      if ( url_variable == null ) url_variable = "   ";	
    } else {
      base_url = "    ";
      url_variable = "    ";
    }	
    fully_assembled_link = base_url + url_variable + target;  
  }    
  private String get_fully_assembled_link() { return fully_assembled_link; }

  /**
   * builds a fully assembled html link using the passed in display name for displaying the link on the 
   * page -- will append the TairObject_ExternalLink.link_name value to the passed in string  
   */
  public String get_external_HTML_link( String display_name ) { 
    return ( get_link_name() != null ) ? HTMLFactory.urlToHTML( get_fully_assembled_link(), display_name + " " + get_link_name() ) :HTMLFactory.urlToHTML( get_fully_assembled_link(), display_name ); 
  }
    
  public String get_external_HTML_link_withGAaction( String display_name ) {
    Map map = new HashMap();
    String action_link = get_fully_assembled_link();
    action_link = action_link.replaceAll("http://", "");
    action_link = action_link.replaceAll("https://", "");
    action_link = action_link.replaceAll("ftp://", "");
    String[] parts = action_link.split("/");
    action_link = parts[0];
    String action = "onClick=\"javascript:urchinTracker('/outgoing/" + action_link + "');\"";

    return ( get_link_name() != null ) ? HTMLFactory.urlToHTML( get_fully_assembled_link(), 
        display_name + " " + get_link_name(), action ) :HTMLFactory.urlToHTML( get_fully_assembled_link(), display_name, action ); 
  }
  /**
   * For unit testing only
   */
  public void test() {
    if ( externalLink != null ) {
      externalLink.test();
    }
    // include TairObject_ExternalLink data
    System.out.println( "****** TairObject_ExternalLink content test ******" );
    System.out.println( "tair_object_id: " + get_tair_object_id() );
    System.out.println( "external_link_id: " + get_external_link_id() );
    System.out.println( "url_variable: " + get_url_variable() );
    System.out.println( "link_name: " + get_link_name() );
    System.out.println( "**** TairObject_ExternalLink content test end ****" ); 
    // include custom data
    System.out.println( "****** Custom attribute content test ******" );
    System.out.println( "External HTML link: " + get_external_HTML_link( "Display Name for Link" ) );
    System.out.println( "**** Custom attribute content test end ****" ); 
  }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try {
      DBconnection conn = new DBconnection();
      Long to_ext_id = new Long( 2 );
      ExternalLinkObject link = new ExternalLinkObject( conn, to_ext_id );
      link.test();
      to_ext_id = new Long( 87899 );
      link = new ExternalLinkObject( conn, to_ext_id );
      link.test();
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

}
