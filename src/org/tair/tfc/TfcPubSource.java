/**
 * This class map to the table PubSource in the tair database. Each instance
 * maps one row of data in PubSource table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

public class TfcPubSource implements Serializable {   

  /**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = 752935389689475753L;
  private Long pub_source_id;
  private String name;
  private String type;
  private String publisher;
  private String editors;
  private String isbn_number;
  private String issn_number;

  /**
   * Creates an empty instance of TfcPubSource
   */
  public TfcPubSource() { }

  /**
   * Creates an instance of TfcPubSource that reflects data for
   * the row in PubSource with the submitted pub_source_id
   *
   * @param conn An active connection to the database
   * @param pub_source_id Pub source id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error, or
   * if no record found for submitted pub source id
   */
  public TfcPubSource( DBconnection conn, Long pub_source_id ) throws SQLException {
    String query = null;
    if ( pub_source_id != null ) {
      query =
	"select pub_source_id, "+
	"name, "+
	"pubsource_type, "+
	"publisher, "+
	"editors, "+
	"isbn_number, "+
	"issn_number "+
	"from PubSource "+
	"where pub_source_id = " + pub_source_id;
      processResults( conn, query );

      if ( get_pub_source_id() == null ) {
	throw new RecordNotFoundException( "No pub source found for pub source id: " + pub_source_id );
      }
    }
  }

  private void processResults( DBconnection conn, String query ) throws SQLException {
    conn.setQuery( query );
    ResultSet results = conn.getResultSet();	       
    if ( results.next() ) {
      this.pub_source_id = new Long( results.getLong( "pub_source_id" ) );
      this.name = results.getString( "name" );
      this.type = results.getString( "pubsource_type" );
      this.publisher = results.getString( "publisher" );
      this.editors = results.getString( "editors" );
      this.isbn_number = results.getString( "isbn_number" );
      this.issn_number = results.getString( "issn_number" );
    }
    conn.releaseResources();
  }
  

  /**
   * Creates an instance of TfcPubSource that reflects data for
   * the row in PubSource with the submitted name
   *
   * @param conn An active connection to the database
   * @param name Pub source name to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error, or
   * if no record found for submitted pub source id
   */
  public TfcPubSource( DBconnection conn, String name ) throws SQLException {
    String query = null;
    if ( name != null ) {
      query =
	"select pub_source_id, "+
	"name, "+
	"pubsource_type, "+
	"publisher, "+
	"editors, "+
	"isbn_number, "+
	"issn_number "+
	"from PubSource "+
	"where name = " + TextConverter.dbQuote( name );
      processResults( conn, query );
      if ( get_pub_source_id() == null ) {
	throw new RecordNotFoundException( "No pub source found with name: " + name );
      }
    }
  }


  // get 'em & set 'em

  public void set_pub_source_id ( Long value ) { pub_source_id = value; }
  public void set_name ( String value ) { name = value; }
  public void set_type ( String value ) { 
	  type = value; }
  public void set_publisher ( String value ) { publisher = value; }
  public void set_editors ( String value ) { editors = value; }
  public void set_isbn_number ( String value ) { isbn_number = value; }
  public void set_issn_number ( String value ) { issn_number = value; }

  public Long get_pub_source_id() { return pub_source_id; }
  public String get_name() { return name;}
  
  public String get_type() { 
	  StringTokenizer words = new StringTokenizer(type, "_");
	  String totalWord = "";
	  String temp = "";
	  while (words.hasMoreTokens()) {
		  String properWord = words.nextToken();
		  //capitalize first letter of the word
		  temp = properWord.charAt(0) + ""; 
		  temp = temp.toUpperCase();
		  properWord = temp + properWord.substring(1,properWord.length());
		  totalWord += properWord + " ";
	  }
	  
	return totalWord; 
  }
  
  public String get_publisher() { return publisher; }
  public String get_editors() { return editors; }
  public String get_isbn_number() { return isbn_number; }
  public String get_issn_number() { return issn_number; }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** TfcPubSource content test ******" );
    System.out.println( "pub_source_id is " + this.get_pub_source_id() );
    System.out.println( "name is" + this.get_name() );
    System.out.println( "type is" + this.get_type() );
    System.out.println( "publisher is " + this.get_publisher() );
    System.out.println( "editor is " + this.get_editors() );
    System.out.println( "isbn_number is " + this.get_isbn_number() );
    System.out.println( "issn_number is " + this.get_issn_number() );
    System.out.println( "**** TfcPubSource content test end ****" );       
  }


  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{
      DBconnection conn = new DBconnection();
      Long test_id = new Long( 318 );
      TfcPubSource pub_source = new TfcPubSource( conn, test_id );
      pub_source.test();
      pub_source = new TfcPubSource( conn,"SCIENTIST" );
      pub_source.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
