/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */


/**
 * KeywordLite is a base class that contains some basic information ( less than what is contained in TfcKeyword )
 * about a keyword.  It represents a starting point for which to gather information about associations to child tables in TAIR. * The association information 
 * is specific to the various linking tables that the keyword exists in so that information is provided through various 
 * subclasses of this class   
 */

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;

public abstract class KeywordLite {

  private String keyword_name;
  private String keyword_type;
  private String keyword_display; // display version of keyword type
  private Long keyword_id;

  // relationship types populated polymorphically by concrete sub-classes
  protected ArrayList relationship_types;

  /**
   * Creates an empty instance of Keyword
   */         
  public KeywordLite() { }


  /**
   * populates Keyword attributes for a particular keyword id from the db
   */
  protected void populate( DBconnection conn, Long keyword_id ) throws SQLException {
    if ( keyword_id != null ) {
      setKeywordInfo( conn, keyword_id );

      // must be called after child class has already stored corresponding id 
      setRelationshipTypes( conn ); 
    }
  }


  /**
   * Abstract method to define polymorphic object population for concrete subclasses. This
   * version of populate() takes as parameters both the keyword_id as well as the id of 
   * the object the keyword is linked to in sub-class.  This method is provided as a gateway
   * to allow generic object population using references to KeywordLite.  Sub-classes
   * should make sure to call populate( conn, keyword_id ) defined here to ensure that
   * superclass population happens correctly
   *
   * @param conn An active connection to the database
   * @param keyword_id Keyword id to retrieve data for
   * @param linking_id Corresponding id to retrieve data for - will be tair_object_id, 
   * community_id, reference_id or bio_sample_id depending on sub-class
   */
  public abstract void populate( DBconnection conn, Long keyword_id, Long linking_id ) throws SQLException;
  
  /**
   * Populates keyword's collection of relationship types for keyword's join to annotation
   * object (i.e. tair object, reference, community or bio sample).  Since this data must come
   * from one of the 4 keyword linking tables based on type of annotation object, this population
   * is implemented polymorphically so that each child class defines this method to retrieve
   * relationship types in the proper type specific manner
   *
   * This method will be called by the populate() method
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  protected abstract void setRelationshipTypes( DBconnection conn ) throws SQLException;
  
  /**
   * Determines if object has associated relationship types
   *
   * @return <code>true</code> if object contains relationship types, or <code>false</code>
   * if no relationship types for this object
   */
  public boolean hasRelationshipTypes() {
    return ( relationship_types != null && !relationship_types.isEmpty() );
  }


  /**
   * Retrieves all relationship types for keyword's join to type-specific annotation object
   *
   * @returns Relationship types as an <code>Iterator</code> of <code>String</code>s, or 
   * <code>null</code> if no relationship types for this object
   */
  public Iterator getRelationshipTypes() { return ( hasRelationshipTypes() ) ? relationship_types.iterator() : null; }
  
  /**
   * Determines if keyword is joined to annotation object with submitted relationship type
   *
   * @param relationshipType Relationship type to search for
   * @return <code>true</code> if submitted relationshipType found in object's collection
   * of relationship types, or <code>false</code> if relationship type not found
   */
  public boolean hasRelationshipType( String relationshipType ) {
    return ( relationship_types != null && relationship_types.contains( relationshipType ) );
  }


    // 
  private void setKeywordInfo( DBconnection conn, Long keyword_id ) throws SQLException { 
    this.keyword_id = keyword_id; 	
    ResultSet results = null;
    String query = " select k.keyword AS keyword, kt.keywordtype_type, kt.display " + 
                   "from Keyword k, KeywordType kt " + 
                   "where k.keyword_type_id = kt.keyword_type_id and k.keyword_id = " + keyword_id.toString();
    conn.setQuery( query );
    results = conn.getResultSet();
    if ( results.next() ) {
      keyword_name = results.getString( "keyword" );
      keyword_type = results.getString( "keywordtype_type" );
      keyword_display = results.getString( "display" );
    }
    conn.releaseResources(); 
  }

  /**
   * @returns keyword name
   */
  public String getKeywordName() { return keyword_name; }

  /**
   * @returns keyword type 
   */
  public String getKeywordType() { return keyword_type; }

  /**
   * @return display version of keyword type
   */
  public String getKeywordDisplayType() { return keyword_display; }


  /**
   * @returns keyword id
   */
  public Long getKeywordID() { return this.keyword_id; }

  /**
   * test KeywordLite content
   */
  public void test() {
    System.out.println( "****** KeywordLite content test ******" );
    System.out.println( " keyword id = " + getKeywordID() ); 
    System.out.println( " keyword name = " + getKeywordName() ); 
    System.out.println( " keyword type = " + getKeywordType() ); 
    System.out.println( " keyword display type = " + getKeywordDisplayType() );

    Iterator rel_type_iter = getRelationshipTypes();
    if ( rel_type_iter != null ) {
      while ( rel_type_iter.hasNext() ) {
	System.out.println( "relationship type = " + rel_type_iter.next() );  
      }
    }
    System.out.println( "**** KeywordLite content test end ****" );
  }

}
  








