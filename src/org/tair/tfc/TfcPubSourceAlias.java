
/**
 * This class map to the table PubSourceAlias in the tair database. Each instance
 * maps one row of data in PubSourceAlias table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

public class TfcPubSourceAlias {
  private Long pub_source_alias_id;
  private Long pub_source_id;
  private String alias;
  private Boolean is_standard;

  /**
   * Creates an empty instance of TfcPubSourceAlias
   */
  public TfcPubSourceAlias() { }


  /**
   * Creates an instance of TfcPubSourceAlias to reflect data for 
   * the row in PubSourceAlias with the submitted pub_source_alias_id
   *
   * @param conn An active connection to the database
   * @param pub_source_alias_id ID to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error, or
   * if no row found with submitted ID
   */
  public TfcPubSourceAlias( DBconnection conn, Long pub_source_alias_id ) throws SQLException {
    String query = null;
    if ( pub_source_alias_id != null ) {
      query = 
	"select pub_source_alias_id, "+
	"pub_source_id, "+
	"alias, "+
	"is_standard " +
	"from PubSourceAlias "+
	"where pub_source_alias_id = " + pub_source_alias_id.toString();
      conn.setQuery( query );
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
	this.pub_source_alias_id = new Long( results.getLong( "pub_source_alias_id" ) );

 	long id = results.getLong( "pub_source_id" );
	if ( !results.wasNull() ) {
	  this.pub_source_id = new Long( id );
	}
		       
	alias = results.getString( "alias" );
	this.is_standard = TextConverter.stringToBoolean( results.getString( "is_standard" ) );
      }
      conn.releaseResources(); 
    }
  }

  // get 'em & set 'em
  public void set_pub_source_alias_id ( Long value ) { pub_source_alias_id = value; }
  public void set_pub_source_id ( Long value ) {  pub_source_id = value; }
  public void set_alias ( String value ) { alias = value; }
  public void set_is_standard ( Boolean value ) { is_standard = value; }

  public Long get_pub_source_alias_id() { return pub_source_alias_id; }
  public Long get_pub_source_id() { return pub_source_id; }
  public String get_alias() { return alias; }
  public Boolean get_is_standard() { return is_standard; }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** TfcPubSourceAlias content test ******" );
    System.out.println( "pub_source_alias_id: " + get_pub_source_alias_id() );
    System.out.println( "pub_source_id: " + get_pub_source_id() );
    System.out.println( "alias: " + get_alias() );
    System.out.println( "is_standard: " + get_is_standard() );
    System.out.println( "**** TfcPubSourceAlias content test end ****" );
  }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
      
    try{
      DBconnection conn = new DBconnection();
      Long test_id = new Long( 248 );
      TfcPubSourceAlias alias = new TfcPubSourceAlias( conn, test_id );
      alias.test();
      System.out.println( "********************************************" );
    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
