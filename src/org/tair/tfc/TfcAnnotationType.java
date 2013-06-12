/**
 * This class maps to the table AnnotationType in the tair database. Each instance
 * maps one row of data in AnnotationType table. This table was set up to facilitate accessing
 * keyword and/or child table info - since there are several linking tables that handle the keyword associations
 * The most common use at this point is to centralize accessing the AnnotationType data using a child table name which is
 * unique for a row with objective of getting the linking table name that the association of interest resides in -- also what
 * is often needed is the column name to make a join with and the display name has been helpful to use when the sql is being 
 * constructed to display counts of the associations with the corresponding type.  
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import java.sql.*;
import org.tair.utilities.*;

public class TfcAnnotationType {   

  private Long annotation_type_id;
  private String linking_table_name;
  private String child_table_name;
  private String column_name;
  private String display_name;
  private Boolean is_active;
  private static final String SELECT = "select * ";
  private static final String FROM = " from AnnotationType ";  

  public static final String LOCUS = "Locus";
  public static final String GENE = "Gene";

  /**
   * Creates an empty instance of TfcAnnotationType
   */

  public TfcAnnotationType() {}
  
  /**
   * TfcAnnotationType constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcAnnotationType is null
   * @param connection the instance of DBconnection
   * @param annotation_type_id the object id of a row in the AnnotationType table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcAnnotationType( DBconnection conn, Long annotation_type_id ) throws SQLException {
    String query = null;
    if ( annotation_type_id != null ) {
      query = SELECT + FROM + " where annotation_type_id = " + annotation_type_id.toString();
      processQuery( conn, query );
    }
  }

  /**
   * TfcAnnotationType constructor initializes each field according to the value
   * of the child table name in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcAnnotationType is null
   * @param connection the instance of DBconnection
   * @param child_table_name the child table name of a row in the AnnotationType table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcAnnotationType( DBconnection conn, String child_table_name ) throws SQLException {
    String query = null;
    if ( child_table_name != null ) {
      query = SELECT + FROM + " where child_table_name = " + TextConverter.dbQuote( child_table_name );
      processQuery( conn, query );
    }
  }

  private void processQuery( DBconnection conn, String query ) throws SQLException {
    conn.setQuery( query );
    ResultSet results = conn.getResultSet();	       
    if ( results.next() ) {
      long id = results.getLong( "annotation_type_id" );
      if ( !results.wasNull() ) {
	setAnnotationTypeID( new Long( id ) );
      }
      setLinkingTableName( results.getString( "linking_table_name" ) );
      setChildTableName( results.getString( "child_table_name" ) );
      setColumnName( results.getString( "column_name" ) );
      setDisplayName( results.getString( "display_name" ) );
      setIsActive( TextConverter.stringToBoolean( results.getString( "is_active" ) ) );
    }
    conn.releaseResources();
  }

  private void setAnnotationTypeID( Long annotation_type_id ) { this.annotation_type_id = annotation_type_id; }  
  /**
   * Retrieve value in column of annotation_type_id for this row of AnnotationType table
   *
   * @return Long value of annotation_type_id
   */
  public Long getAnnotationTypeID() { return annotation_type_id; }

  private void setLinkingTableName( String linking_table_name ) { this.linking_table_name = linking_table_name; }  
  /**
   * Retrieve value in column of linking_table_name for this row of AnnotationType table
   *
   * @return String value of linking_table_name
   */
  public String getLinkingTableName() { return linking_table_name; }

  private void setChildTableName( String child_table_name ) { this.child_table_name = child_table_name; }  
  /**
   * Retrieve value in column of child_table_name for this row of AnnotationType table
   *
   * @return String value of child_table_name
   */
  public String getChildTableName() { return child_table_name; }

  private void setColumnName( String column_name ) { this.column_name = column_name; }
  /**
   * Retrieve value in column of column_name for this row of AnnotationType table
   *
   * @return String value of column_name
   */
  public String getColumnName() { return column_name; }

  private void setDisplayName( String display_name ) { this.display_name = display_name; }
  /**
   * Retrieve value in column of display_name for this row of AnnotationType table
   *
   * @return String value of display_name
   */
  public String getDisplayName() { return display_name; }

  private void setIsActive( Boolean is_active ) { this.is_active = is_active; }
  /**
   * Retrieve value in column of is_active for this row of AnnotationType table
   *
   * @return Boolean value of is_active
   */
  public Boolean getIsActive() { return is_active; }
  
  /**
   * test TfcAnnotationType content
   */
  public void test() {
    System.out.println( "****** TfcAnnotationType content test ******" );
    System.out.println( "annotation_type_id: " + getAnnotationTypeID() );
    System.out.println( "linking_table_name: " + getLinkingTableName() );
    System.out.println( "child_table_name: " + getChildTableName() );
    System.out.println( "column_name: " + getColumnName() );
    System.out.println( "display_name: " + getDisplayName() );
    System.out.println( "is_active: " + getIsActive() );
    System.out.println( "**** TfcAnnotationType content test end ****" );
  }
    

  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
    try{      
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 2 );
      TfcAnnotationType tat = new TfcAnnotationType( connection, test_id );
      tat.test();
      String test_child_table_name = "Gene";
      tat = new TfcAnnotationType( connection, test_child_table_name );
      tat.test();
      test_child_table_name = "Publication";
      tat = new TfcAnnotationType( connection, test_child_table_name );
      tat.test();
      
    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
