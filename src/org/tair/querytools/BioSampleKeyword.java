/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;


/**
 * BioSampleKeyword is a composite class that extends <code>KeywordLite</code>
 * to present type specific information about a keyword in its relation to a 
 * bio sample. In addition to basic data for keyword, BioSampleKeyword also 
 * contains a set of  relationship types for the specified keyword_id/bio_sample_id 
 * pair that exists in BioSample_Keyword
 */

public class BioSampleKeyword extends KeywordLite {

  // bio sample id this instance of keyword is related to
  private Long bioSampleID; 

  /**
   * Creates an empty instance of BioSampleKeyword
   */         
  public BioSampleKeyword() { 
    super();
  }

  /**
   * Populates an instance of BioSampleKeyword to reflect data
   * referenced by submitted keyword id and bio_sample_id
   *
   * @param conn An active connection to the database
   * @param keyword_id Keyword id to retrieve data for
   * @param tair_object_id Tair object id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error
   */      
  public void populate( DBconnection conn, Long keyword_id, Long bio_sample_id ) throws SQLException {
    if ( bio_sample_id != null && keyword_id != null ) {
      this.bioSampleID = bio_sample_id;
      super.populate( conn, keyword_id ); // will populate relationship types
    }
  }
  
  
  /**
   * Populates keywords collection of relationship types between keyword_id and bio_sample_id.
   * This is a concrete implementation of abstract method in superclass that allows for 
   * type specific population of this collection.  Collection of relationship types is held
   * in super class; this method is called as part of superclass's populate() method
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  protected void setRelationshipTypes( DBconnection conn ) throws SQLException {
    ResultSet results = null;
    String query = null;

    query = 
      "SELECT rt.relationshiptype_type " +
      "FROM RelationshipType rt, BioSample_Keyword bk " + 
      "WHERE bk.relationship_type_id = rt.relationship_type_id " +
      "AND bk.keyword_id = " + getKeywordID().toString() + " " +
      "AND bk.bio_sample_id = " + getBioSampleID().toString(); 
    conn.setQuery( query );
   
    results = conn.getResultSet();
    while ( results.next() ) {
      if ( relationship_types == null ) {
	relationship_types = new ArrayList();
      }
      relationship_types.add( results.getString( "relationshiptype_type" ) ); 	
    }
    conn.releaseResources();
  }

  /**
   * Retrieves bio sample id
   */
  public Long getBioSampleID() {
    return bioSampleID;
  }


  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** BioSampleKeyword content test ******" );
    super.test();
    System.out.println( "****** end BioSampleKeyword content test ******" );
  }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{
      DBconnection conn = new DBconnection();
      Long keyword_id = new Long( 2747 );
      Long bio_sample_id = new Long( 2 );
      BioSampleKeyword bsk = new BioSampleKeyword();
      bsk.populate( conn, keyword_id, bio_sample_id );
      bsk.test();

    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
  








