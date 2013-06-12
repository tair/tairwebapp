/**
 * This class map to the table KeywordType in the tair database. Each instance
 * maps one row of data in KeywordType table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.TextConverter;

public class TfcKeywordType {   
   private String keywordTypeId;
   private String type;
   private String definition;
   private String display;

  /**
   * Creates an empty instance of TfcKeywordType
   */
  public TfcKeywordType() {  }


  /**
   * TfcKeywordType constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcKeywordType is null
   * @param connection the instance of DBconnection
   * @param keyword_type_id the object id of a row in the KeywordType table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcKeywordType( DBconnection connection, String keywordTypeId ) throws SQLException {
  	String query = null;

    if ( keywordTypeId != null ) {
    	query =
    		"SELECT keyword_type_id, " +
			"keywordtype_type, definition, display " +
			"from KeywordType "+
			"where keyword_type_id = " + TextConverter.dbQuote( keywordTypeId );
    	connection.setQuery( query );
    	ResultSet results = connection.getResultSet();
    	if ( results.next() ) {
     			this.keywordTypeId = results.getString( "keyword_type_id" );
    			this.type = results.getString( "keywordtype_type" );
    			this.definition = results.getString( "definition" );
    			this.display = results.getString( "display" );
    	}
    	connection.releaseResources();
    }
  }

  public void set_keyword_type_id ( String value ) { keywordTypeId = value; }
  public String get_keyword_type_id() { return keywordTypeId; }

  public void set_type ( String value ) { type = value; }
  public String get_type() { return type; }
  
  public void set_definition ( String value ) { definition = value; }
  public String get_definition() { return definition; }
  
  public void set_display ( String value ) { display = value; }
  public String get_display() { return display; }

  /**
     * main function is used to for testing only 
    */
  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      String testId = new String( "stru" );
      TfcKeywordType keywordType = new TfcKeywordType( connection, testId );
      System.out.println( "keyword_type_id  is " + keywordType.get_keyword_type_id() );
      System.out.println( "type is " + keywordType.get_type() ); 
      System.out.println( "definition  is " + keywordType.get_definition() );
      System.out.println( "display is " + keywordType.get_display() ); 
    } catch (Exception e ) {
      e.printStackTrace();
    }
  }

}
