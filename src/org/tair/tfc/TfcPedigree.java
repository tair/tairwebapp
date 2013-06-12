/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.io.Serializable;
import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the Pedigree table in the tair database. Each instance
 * maps one row of data in the Pedigree table. Each data object maps to one 
 * field of a row in the table.
 *
 * <p>
 * Implements Serializable for writing stock catalog data to disk
 */




public class TfcPedigree implements Serializable {

  private Long child_germplasm_id;
  private Long parent_germplasm_id;
  private String parent_gender;
  private String generation;
  private String generative_method;



  /** 
   * Creates an instance of TfcPedigree that reflects data represented by
   * the association of submitted parent and child germplasm ids.  RecordNotFoundException
   * is thrown if no row found for combination of ids
   *
   * @param conn An active connection to the database
   * @param parent_germplasm_id Parent id to retrieve data for
   * @param child_germplasm_id Child id to retrieve data for
   * @exception SQLException thrown if a database error occurs, or if no record found for 
   * submitted ids
   */
  public TfcPedigree( DBconnection conn, Long parent_germplasm_id, Long child_germplasm_id ) throws SQLException {
    String query = null;
    boolean found = false;

    if ( parent_germplasm_id != null && child_germplasm_id != null ) {
      query = 
	"SELECT child_germplasm_id, " +
	"parent_germplasm_id, " +
	"parent_gender, " +
	"generation, " +
	"generative_method " +
	"FROM Pedigree " +
	"WHERE child_germplasm_id = ? " +
  	"AND parent_germplasm_id = ? ";

      ResultSet results = null;
      conn.setQuery( query );
      conn.setQueryVariable( 1, child_germplasm_id.toString()  );
      conn.setQueryVariable( 2, parent_germplasm_id.toString() );
      results = conn.getResultSet();
      found = process(results);
      conn.releaseResources();
    }

    if ( !found ) {
      throw new RecordNotFoundException( "No pedigree record found for parent id " + 
					 parent_germplasm_id + " with child id " + child_germplasm_id );
    }
  }

  private boolean process( ResultSet results ) throws SQLException {
    boolean found = false;

    if ( results.next() ) {
	found = true;
	set_child_germplasm_id( new Long( results.getLong( "child_germplasm_id" ) ) );
	set_parent_germplasm_id( new Long( results.getLong( "parent_germplasm_id" ) ) );
	set_parent_gender( results.getString( "parent_gender" ) );
	set_generation( results.getString( "generation" ) );
	set_generative_method( results.getString( "generative_method" ) );
    }

    return found;
  }


  // retrieve values from result set and assign to member variables
  private boolean processResults( DBconnection conn, String query ) throws SQLException {
    boolean found = false;
    ResultSet results = null;

    conn.setQuery( query );
    results = conn.getResultSet();
    if ( results.next() ) {
      found = true;
      set_child_germplasm_id( new Long( results.getLong( "child_germplasm_id" ) ) );
      set_parent_germplasm_id( new Long( results.getLong( "parent_germplasm_id" ) ) );
      set_parent_gender( results.getString( "parent_gender" ) );
      set_generation( results.getString( "generation" ) );
      set_generative_method( results.getString( "generative_method" ) );
    }
    conn.releaseResources();
    
    return found;
  }
  
  public Long get_child_germplasm_id() { return child_germplasm_id; }
  public Long get_parent_germplasm_id() { return parent_germplasm_id; }
  public String get_parent_gender() { return parent_gender; }
  public String get_generation() { return generation; }
  public String get_generative_method() { return generative_method; }

  public void set_child_germplasm_id( Long id ) { this.child_germplasm_id = id; }
  public void set_parent_germplasm_id( Long id ) { this.parent_germplasm_id = id; }
  public void set_parent_gender( String gender ) { this.parent_gender = gender; }
  public void set_generation( String generation ) { this.generation = generation; }
  public void set_generative_method( String method ) { this.generative_method = method; }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "child_germplasm_id: " + get_child_germplasm_id() );
    System.out.println( "parent_germplasm_id: " + get_parent_germplasm_id() );
    System.out.println( "parent_gender: " + get_parent_gender() );
    System.out.println( "generation: " + get_generation() );
    System.out.println( "generative_method: " + get_generative_method() );
  }


  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    
    try {
      DBconnection conn = new DBconnection();
      Long parentID = new Long( 5700 );
      Long childID = new Long( 1445 );
      TfcPedigree pedigree = new TfcPedigree( conn, parentID, childID );
      pedigree.test();
	  
    } catch ( Exception e ) {
      e.printStackTrace();
    }
 

  }

}
