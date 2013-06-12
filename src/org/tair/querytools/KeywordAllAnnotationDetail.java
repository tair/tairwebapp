/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;

import java.sql.*;
import java.util.*;

/**
 * KeywordAllAnnotationDetail is a composite class to represent all 
 * annotation information for a specific keyword's children and term itself
 * KeywordChildrenAnnotationDetail contains information about the passed in keyword and a
 * collection of the keyword's children's  and term 's evidence information 
 * via <code>TairObjKeyEvidenceCollection</code>
 */

public class KeywordAllAnnotationDetail implements Detail {

  private Long keyword_id;
  private String keyword_name;
  private String keyword_extdb_id;
  private int tair_obj_key_evidence_count;
  private ArrayList child_evidences;
  private boolean children;  
    
  /**
   * Creates an empty instance of KeywordChildrenAnnotationDetail
   */
  public KeywordAllAnnotationDetail() {}

  /**
   * Creates an instance of KeywordAllAnnotationDetail includes
   * the annotations to this term and it's children term  
   */
  public KeywordAllAnnotationDetail( DBconnection db, Long keyword_id )
     throws  SQLException {
      if ( keyword_id != null ) {
	  get_information( db, keyword_id );
       
      }
  }

  private void setKeywordInfo( DBconnection conn, Long keyword_id ) throws SQLException {	
    if ( keyword_id != null ) {	
      String query = "select keyword, extdb_id from " + 
	  " Keyword where keyword_id = " + 
	  keyword_id.toString();
      conn.setQuery( query );
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
	keyword_name = results.getString( "keyword" ); 	
	keyword_extdb_id = results.getString( "extdb_id" ); 	
      }
      conn.releaseResources();
    }
  }

  /**
   * @return <code>String</code> keyword name of keyword id 
   */
  public String getKeywordName() { return keyword_name; } 

  /**
   * @return <code>String</code> keyword extdb_id of keyword id 
   */
  public String getKeywordExtdbId() { return keyword_extdb_id; } 

  /**
   * retrieve the keyword_id
   * 
   */
  public Long getKeywordID() { return this.keyword_id; }
 
  /**
   * Sets the keyword's children with their evidence collection
   */
  private void setChildEvidences( DBconnection conn) throws SQLException { 
    ArrayList child_list = new ArrayList();
    
    String query = "select child_term_id AS child_id from " + 
	  " ShortestPath where parent_term_id = " + 
	  getKeywordID().toString() + " AND child_term_id <> parent_term_id ";
    conn.setQuery( query );

    ResultSet results = conn.getResultSet();
    child_list.add (getKeywordID() );

    while ( results.next() ) {
      child_list.add( new Long( results.getLong( "child_id" ) ) ); 	
    }
 
    conn.releaseResources();
    child_evidences = new ArrayList();
    TairObjKeyEvidenceCollection child_evidence = null;
    for ( int i = 0; i < child_list.size(); i ++ ) {  
      child_evidence = new TairObjKeyEvidenceCollection( conn, ( Long )child_list.get( i ) );
      if ( child_evidence.getCountForCreatedByKeyword() > 0 ) child_evidences.add( child_evidence );
    }
  }


  /**
   * retrieve iterator of collection of child_evidences which is a collection of TairObjKeyEvidenceCollection, 
   * one  TairObjKeyEvidenceCollection for each child the keyword has - should be cast to TairObjKeyEvidenceCollection
   * 
   */
  public Iterator getChildEvidences() { return ( !child_evidences.isEmpty() ) ? child_evidences.iterator() : null; }

  /**
   * @return <code>true</code> if keyword has children with tair obj key evidences 
   * or <code>false</code> if no children exist
   */
  public boolean hasChildEvidences() { return ( child_evidences != null && !child_evidences.isEmpty() ); }

  /**
   * retrieve iterator of collection of child_evidences which is a collection of TairObjKeyEvidenceCollection, 
   * one  TairObjKeyEvidenceCollection for each child the keyword has - should be cast to TairObjKeyEvidenceCollection
   * 
   */
  public int getNumberOfChildrenWithEvidences() { return ( !child_evidences.isEmpty() ) ? child_evidences.size() : 0; }

  /**
   * required method per Detail interface -- does nothing since keywords cannot be resolved b a tair object name alone
   *
   * @param conn An active connection to the database
   * @param name Tair object name to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public void get_information( DBconnection db, String name ) throws SQLException {}		

  /**
   * Implementation of get_id() as required by Detail interface.  This method
   * is necessary for providing a way to make sure that object creation succeeded,
   * since Tfc objects will not throw exceptions if ID is not found.  For TAIR 
   * objects, tair_object_id will be returned if one exists.
   *
   * @return keyword id, or <code>null</code> if no keyword object exists
   */
  public Long get_id() { return getKeywordID(); }	

  /**
   * Populates object with data referenced by submitted keyword id 
   * @param db An active connection to the database
   * @param keyword_id Long id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public void get_information( DBconnection db, Long keyword_id ) throws SQLException {		
    if ( keyword_id != null ) {
      this.keyword_id = keyword_id;
      setKeywordInfo( db, getKeywordID() );	
      setChildEvidences( db );
    }
  }
 /**
   * Populates object with data referenced by submitted keyword id 
   * @param db An active connection to the database
   * @param keyword_id Long id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public void get_information( DBconnection db, Long keyword_id, boolean include_term ) 
    throws SQLException {	
    if ( keyword_id != null ) {
      this.keyword_id = keyword_id;
      setKeywordInfo( db, getKeywordID() );
      setChildEvidences( db );
     }
  }
  /**
   * test KeywordAnnotationDetail content
   */
  public void test() {
    
  }
	    
  /**
   * this method is used for testing.
   */

  public static void main( String[] args ) {
    
  }

}



