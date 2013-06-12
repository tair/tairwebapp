/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;
import org.tair.utilities.*;

public class TfcDefinitions {

  private Long definitions_id;
  private String table_name;
  private String field_name;
  private String field_value;
  private String display_value;
  private String definition;
  private java.util.Date date_last_modified;
  private BigInteger community_id;
  private String reference;
  private Boolean do_stats;
  private Boolean is_glossary;
  public final static Long _DUMMY_DEFINITIONS_ID = new Long(0L);


  /**
   * Creates an empty instance of TfcDefinitions
   */
  public TfcDefinitions() { }


  /**
   * Creates an instance of TfcDefinitions that contains data 
   * referenced by submitted definitions_id
   *
   * @param conn An active connection to the database
   * @param definitions_id Definitions id to retrieve data for
   * @exception SQLException thrown if a database error occurs, or if 
   * no entry found for submitted definitions_id
   */
  public TfcDefinitions( DBconnection conn, Long definitions_id ) throws SQLException {
    String query = null;
    boolean found = false;
    
    if ( definitions_id != null ) {
      query = 
	"SELECT definitions_id, " +
	"table_name, " +
	"field_name, " +
	"field_value, " +
	"display_value, " +
	"definition, " +
	"date_last_modified, " +
	"community_id, " +
	"reference, " +
	"do_stats, " +
	"is_glossary " +
	"FROM Definitions " +
	"WHERE definitions_id = " + definitions_id.toString();

      found = processResults( conn, query );
    }
    
    if ( !found ) { // if no results found for this id, throw exception
      throw new RecordNotFoundException( "No entry found for definitions_id: " + definitions_id );
    }

  }

  
  // retrieve results of query & store in member variables; return true if 
  // query found results, false if no results found
  private boolean processResults( DBconnection conn, String query ) throws SQLException {
    boolean found = false;
    ResultSet results = null;

    conn.setQuery( query );
    results = conn.getResultSet();
    if ( results.next() ) {
      found = true;
      set_definitions_id( new Long( results.getLong( "definitions_id" ) ) );
      set_table_name( results.getString( "table_name" ) );
      set_field_name( results.getString( "field_name" ) );
      set_field_value( results.getString( "field_value" ) );
      set_display_value( results.getString( "display_value" ) );
      set_definition( results.getString( "definition" ) );
      set_date_last_modified( results.getDate( "date_last_modified" ) );

      BigDecimal id = results.getBigDecimal( "community_id" );
      if ( !results.wasNull() ) {
	    set_community_id( id.toBigInteger() );
      }

      set_reference( results.getString( "reference" ) );
      set_do_stats( TextConverter.stringToBoolean( results.getString( "do_stats" ) ) );
      set_is_glossary( TextConverter.stringToBoolean( results.getString( "is_glossary" ) ) );
    }
    conn.releaseResources();
    return found;
  }


  public void set_definitions_id( Long id ) { this.definitions_id = id; }
  public void set_table_name( String name ) { this.table_name = name; }
  public void set_field_name( String name ) { this.field_name= name; }
  public void set_field_value( String value ) { this.field_value = value; }
  public void set_display_value( String value ) { this.display_value = value; }
  public void set_definition( String definition ) { this.definition = definition; }
  public void set_date_last_modified( java.util.Date last_modified ) { this.date_last_modified = last_modified; }
  public void set_community_id( BigInteger id ) { this.community_id = id; }
  public void set_reference( String reference ) { this.reference = reference; }
  public void set_do_stats( Boolean do_stats ) { this.do_stats = do_stats; } 
  public void set_is_glossary( Boolean is_glossary ) { this.is_glossary = is_glossary; }

  public Long get_definitions_id() { return definitions_id; }
  public String get_table_name() { return table_name; }
  public String get_field_name() { return field_name; }
  public String get_field_value() { return field_value; }
  public String get_display_value() { return display_value; }
  public String get_definition() { return definition; }
  public java.util.Date get_date_last_modified() { return date_last_modified; }
  public BigInteger get_community_id() { return community_id; }
  public String get_reference() { return reference; }
  public Boolean get_do_stats() { return do_stats; }
  public Boolean get_is_glossary() { return is_glossary; }


  /**
   * Determines if a definitions row already exists in the db with the same combination
   * of table name, field name and field value that is submitted.  Method will return
   * <code>true</code> if a row with these values is found where the definitions_id is
   * different than the submitted id (submitted id may be null). This is so that a check 
   * can be made before inserting or updating a definitions entry -  since these fields 
   * are indexed as a unique composite key, error will be thrown if trying to update 
   * values so that current row becomes a duplicate row; this may happen if user is 
   * updating values so that they now clash with another row in the database.  By calling
   * this method, client code can check for duplicates before calling the store() method
   * and return a message to user if a duplicate row is found already in the database.
   *
   * @param An active connection to the database
   * @param definitionsID Definitions id to use when making comparisons; if a row is found with
   * matching values where id is different than this id, a true value is returned
   * @param tableName Table name to search for
   * @param fieldName Field name to search for
   * @param fieldValue Field value to search for
   * @return <code>true</code> if a row is found with submitted values and a different definitions id
   * than submitted definitionsID, or <code>false</code> if no duplicate row is found
   * @exception SQLException is thrown if a database error occurs
   */
  public static boolean duplicateRowExists( DBconnection conn, Long definitionsID, String tableName, String fieldName, String fieldValue ) throws SQLException {
    boolean exists = false;
    ResultSet results = null;
    StringBuffer query = new StringBuffer();    

    tableName = ( tableName != null ) ? tableName.toUpperCase() : tableName;
    fieldName = ( fieldName != null ) ? fieldName.toUpperCase() : fieldName;
    fieldValue = ( fieldValue != null ) ? fieldValue.toUpperCase() : fieldValue;

    query.append( "SELECT COUNT(*) " +
		  "FROM Definitions " +
		  "WHERE UPPER( table_name ) = " + TextConverter.dbQuote( tableName ) + " " +
		  "AND UPPER( field_name ) = " + TextConverter.dbQuote( fieldName ) + " " +
		  "AND UPPER( field_value ) = " + TextConverter.dbQuote( fieldValue ) + " " 
		  );
    
    if ( definitionsID != null ) {
      query.append( "AND definitions_id != " + definitionsID );
    }
    
    conn.setQuery( query.toString() );
    results = conn.getResultSet();
    if ( results.next() ) {
      int count = results.getInt( 1 );
      if ( count > 0 ) {
	exists = true;
      }
    }
    conn.releaseResources();

    return exists;
  }
  

  /**
   * Stores definitions data to the database.  Before calling this method, client
   * code should make sure a duplicate definitions row does not already exist with
   * this combination of table name, field name and field value by calling 
   * duplicateRowExists().  If this check is not made, UPDATE or INSERT will fail
   * if this combination exists with a different definitions_id
   *
   * @param conn An active connection to the database; connection must have UPDATE/INSERT privileges
   * or SQLException will be thrown
   * @exception SQLException thrown if a database error occurs
   */
  public void store( DBconnection conn ) throws SQLException {

    // the definitions_id is dummy one
    if ( get_definitions_id() == _DUMMY_DEFINITIONS_ID ) {
	storeWithoutId(conn);
	return;
    }

    StringBuffer query = new StringBuffer();
    ResultSet results = null;

    if ( get_definitions_id() != null ) { // UPDATE existing record

      query.append( "UPDATE Definitions SET " +
		    "table_name = " + TextConverter.dbQuote( get_table_name() ) + ", " +
		    "field_name = " + TextConverter.dbQuote( get_field_name() ) + ", " +
		    "field_value = " + TextConverter.dbQuote( get_field_value() ) + ", " +
		    "display_value = " + TextConverter.dbQuote( get_display_value() ) + ", " +
		    "definition = " + TextConverter.dbQuote( get_definition() ) + ", " +
		    "date_last_modified = " + TextConverter.dbQuote( get_date_last_modified(), "mm/dd/yyyy" ) + ", " +
		    "community_id = " + get_community_id() + ", " +
		    "reference = " + TextConverter.dbQuote( get_reference() ) + ", " +
		    "do_stats = " + TextConverter.dbQuote( get_do_stats() ) + ",  " +
		    "is_glossary = " + TextConverter.dbQuote( get_is_glossary() ) + " " +
		    "WHERE definitions_id = " + get_definitions_id().toString() );
      conn.setQuery( query.toString() );
      conn.executeUpdate();
      conn.releaseResources();

    } else { // INSERT new record
      query.append( "INSERT Definitions ( " +
		    "table_name, " +
		    "field_name, " +
		    "field_value, " +
		    "display_value, " +
		    "definition, " +
		    "date_last_modified, " +
		    "community_id, " +
		    "reference, " +
		    "do_stats, " +
		    "is_glossary " +
		    " ) VALUES ( " +
		    TextConverter.dbQuote( get_table_name() ) + ", " +
		    TextConverter.dbQuote( get_field_name() ) + ", " +
		    TextConverter.dbQuote( get_field_value() ) + ", " +
		    TextConverter.dbQuote( get_display_value() ) + ", " +
		    TextConverter.dbQuote( get_definition() ) + ", " +
		    TextConverter.dbQuote( get_date_last_modified(), "mm/dd/yyyy" ) + ", " +
		    get_community_id() + ", " +
		    TextConverter.dbQuote( get_reference() ) + ", " +
		    TextConverter.dbQuote( get_do_stats() ) + ", " +
		    TextConverter.dbQuote( get_is_glossary() ) + ") " +
		    "SELECT @@IDENTITY as definitions_id " );
      conn.setQuery( query.toString() );
      results = conn.getResultSet();
      if ( results.next() ) {
	set_definitions_id( new Long( results.getLong( "definitions_id" ) ) );
      }
      conn.releaseResources();
    }
  }
  
/** 
* this function updates Definitions using table_name, field_name and 
* field_value when definition_id is not available.
*  @param conn An active connection to the database
*  @exception SQLException thrown if a database error occurs
*/
  public void storeWithoutId( DBconnection conn ) throws SQLException {
    StringBuffer query = new StringBuffer();
    ResultSet results = null;

      query.append( "UPDATE Definitions SET " +
		    "display_value = " + TextConverter.dbQuote( get_display_value() ) + ", " +
		    "definition = " + TextConverter.dbQuote( get_definition() ) + ", " +
		    "date_last_modified = " + TextConverter.dbQuote( get_date_last_modified(), "mm/dd/yyyy") + ", " +
		    "community_id = " + get_community_id() + ", " +
		    "reference = " + TextConverter.dbQuote( get_reference() ) + ", " +
		    "do_stats = " + TextConverter.dbQuote( get_do_stats() ) + ",  " +
		    "is_glossary = " + TextConverter.dbQuote( get_is_glossary() ) + " " +
		    "WHERE " +
		    "table_name = " + TextConverter.dbQuote( get_table_name() ) + " AND  " +
		    "field_name = " + TextConverter.dbQuote( get_field_name() ) + " AND  " +
		    "field_value = " + TextConverter.dbQuote( get_field_value() ) );
      conn.setQuery( query.toString() );
      conn.executeUpdate();
      conn.releaseResources();

  }
  
  /**
   * Deletes row in Definitions table represented by this object as well as
   * any corresponding entry for the definition in the TableStats table. If object's 
   * definitions_id is null (i.e. definition row doesn't yet exist in the database)
   * request for deletion will be silently ignored.  
   *
   * <p>
   * Deletion is done in a db transaction since two tables are potentially affected.
   * Any error will cause delete on both tables to fail
   *
   * @param conn An active connection to the database; connection must have DELETE
   * privileges, or SQLException will be thrown
   * @exception SQLException thrown if a database error occurs
   */
  public void delete( DBconnection conn ) throws SQLException {
    String query = null;

    if ( get_definitions_id() != null ) {
      
      try { 
	conn.remove_auto_commit_mode(); 

	query = "DELETE TableStats WHERE definitions_id = " + get_definitions_id().toString();
	conn.setQuery( query );
	conn.executeUpdate();
	conn.releaseResources();

	query = "DELETE Definitions WHERE definitions_id = " + get_definitions_id().toString();
	conn.setQuery( query );
	conn.executeUpdate();
	conn.releaseResources();

	conn.commit();

	// rollback changes if any problems - propagate exception as SQLException 
      } catch ( Exception e ) { 
	if ( conn != null ) {
	  conn.rollback();
	}
	throw new SQLException( e.getMessage() );

      } finally {
	conn.set_auto_commit_mode();
      }
    }
  }


  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "definitions_id: " + get_definitions_id() );
    System.out.println( "table_name: " + get_table_name() );
    System.out.println( "field_name: " + get_field_name() );
    System.out.println( "field_value: " + get_field_value() );
    System.out.println( "display_value: " + get_display_value() );
    System.out.println( "definition: " + get_definition() );
    System.out.println( "last_modified: " + get_date_last_modified() );
    System.out.println( "community_id: " + get_community_id() );
    System.out.println( "reference: " + get_reference() );
    System.out.println( "do_stats: " + get_do_stats() );
    System.out.println( "is glossary: " + get_is_glossary() );
  }
  
  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try {
      DBconnection conn = new DBconnection();
      Long id = new Long( 13 );
      TfcDefinitions definition = new TfcDefinitions( conn, id );
      definition.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

}
