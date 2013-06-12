/**
 * This class maps to the RelationshipType table in the tair database. Each instance
 * maps to one row of data in RelationshipType table. Each member variable maps to 
 * one field of a row in the table.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;


public class TfcRelationshipType {   

  private Long relationship_type_id;
  private String type;
  private String description;
  private String table_name;
  private Long pub_id;


  /**
   * Creates an empty instance of TfcRelationshipType
   */
  public TfcRelationshipType() { }

  /**
   * Creates an instance of TfcRelationshipType that reflects the data referenced
   * by submitted relationship_type_id
   *
   * @param conn An active connection to the database
   * @param relationship_type_id Relationship type id to retrieve data for
   * @exception SQLException thrown if a database error occurs, or if no row
   * found for submitted id
   */
  public TfcRelationshipType( DBconnection conn, Long relationship_type_id ) throws SQLException {
    String query = null;
    boolean found = false;

    if ( relationship_type_id != null ) {
      query =  getBaseQuery() + "WHERE relationship_type_id = " + relationship_type_id.toString();
      found = processResults( conn, query );
    }

    if ( !found ) {
      throw new RecordNotFoundException( "No relationship type found for relationship type id: " + relationship_type_id );
    }
  }


  /**
   * Creates an instance of TfcRelationshipType that reflects the data referenced by
   * the unique combination of submitted relationship type literal value, and child table
   * name that keywords are linked to using relationship type.
   *
   *
   * @param conn An active connection to the database
   * @param type Relationship type literal value to search for
   * @param table_name Child table name to search for
   * @exception SQLException thrown if a database error occurs, or if no row found for submitted
   * combination of type and table name
   */
  public TfcRelationshipType( DBconnection conn, String type, String table_name ) throws SQLException {
    String query = null;
    boolean found = false;

    if ( type != null && table_name != null ) {
      query = 
	getBaseQuery() + 
	"WHERE relationshiptype_type = " + TextConverter.dbQuote( type ) + " " +
	"AND table_name = " + TextConverter.dbQuote( table_name );
      found = processResults( conn, query );
    }

    if ( !found ) {
      throw new RecordNotFoundException( "No relationship type found for type: " + type + 
					 " and child table: " + table_name );
    }
  }
 
  private String getBaseQuery() {
    String select = 
      "SELECT relationship_type_id, " +
      "relationshiptype_type, " +
      "description, " +
      "table_name, " +
      "pub_id " +
      "FROM RelationshipType ";
    return select;
  }

  private boolean processResults( DBconnection conn, String query ) throws SQLException {
    boolean found = false;
    ResultSet results = null;

    conn.setQuery( query );
    results = conn.getResultSet();	       
    found = results.next();
    if ( found ) {
      set_relationship_type_id( new Long( results.getLong( "relationship_type_id" ) ) );
      set_type( results.getString( "relationshiptype_type" ) );
      set_description( results.getString( "description" ) );
      set_table_name( results.getString( "table_name" ) );

      long id = results.getLong( "pub_id" );
      if ( results.wasNull() ) {
	set_pub_id( new Long( id ) );
      }
    }
    conn.releaseResources();

    return found;
  }

  public void set_relationship_type_id ( Long id ) { this.relationship_type_id = id; }
  public Long get_relationship_type_id() { return relationship_type_id; }

  public void set_type ( String type ) { this.type = type; }
  public String get_type() { return type; }

  public void set_description ( String description ) { this.description = description; }
  public String get_description() { return description; }

  public void set_table_name( String name ) { this.table_name = name; }
  public String get_table_name() { return table_name; }

  public void set_pub_id( Long id ) { this.pub_id = id; }
  public Long get_pub_id() { return pub_id; }





  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** TfcRelationshipType content test ******" );
    System.out.println( "relationship_type_id: " + get_relationship_type_id() );
    System.out.println( "type: " + get_type() );
    System.out.println( "description: " + get_description() );
    System.out.println( "table name : " + get_table_name() );
    System.out.println( "pub_id: " + get_pub_id() );
    System.out.println( "**** TfcRelationshipType content test end ****" );
  }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      Long id = new Long( 3 );
      TfcRelationshipType relationship = new TfcRelationshipType( conn, id );
      relationship.test();

      System.out.println( "\n" );
      relationship = new TfcRelationshipType( conn, "experiment category", "ExpressionSet" );
      relationship.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

}
