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
 * KeywordAnnotationDetail is a composite class to represent all 
 * annotation information for a specific keyword
 * KeywordAnnotationDetail contains a
 * collection of associated evidence information 
 * via <code>TairObjKeyEvidenceCollection</code>
 * this class allows development of jsp that will display a list of tair object key evidence data for a keyword 
 * this will be the link from the "Annotation" count displayed on the treeview and on the 
 * Keyword detail page.  Other "types" will link to that "type"s summary page
 */

public class KeywordAnnotationDetail implements Detail {

  private TairObjKeyEvidenceCollection tair_obj_key_evidences;
  private Long keyword_id;
  private String keyword_name;
  private String extdb_id;
  private int tair_obj_key_evidence_count;
    
  /**
   * Creates an empty instance of KeywordAnnotationDetail
   */
  public KeywordAnnotationDetail() {}

  /**
   * Creates an empty instance of KeywordAnnotationDetail
   */
  public KeywordAnnotationDetail( DBconnection db, Long keyword_id ) throws SQLException {
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
      Debugger.println( Debugger.logMsg( this, "keyword info query = " + query ) );  	  
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
	keyword_name = results.getString( "keyword" ); 	
	extdb_id = results.getString( "extdb_id" ); 	
      }
      conn.releaseResources();
    }
  }

  /**
   * @return <code>String</code> keyword name of keyword id 
   */
  public String getKeywordName() { return keyword_name; } 

  /**
   * @return <code>String</code> extdb_id of keyword id 
   */
  public String getKeywordExtdbId() { return extdb_id; } 

  /**
   * retrieve the keyword_id
   * 
   */
  public Long getKeywordID() { return this.keyword_id; }

  /**
   * Sets the collection of tair_obj_key_evidence objects for the keyword
   * @param conn DBconnection 
   * @param keyword_id Long the id to generate the tair object key evidence collection <code>TairObjKeyEvidenceCollection</code> 
   */
  private void setTairObjKeyEvidences( DBconnection conn, Long keyword_id ) throws SQLException { 
    tair_obj_key_evidences = new TairObjKeyEvidenceCollection( conn, keyword_id );
  }

  /**
   * retrieve the TairObjKeyEvidenceCollection
   * 
   */ 
  private TairObjKeyEvidenceCollection getTairObjKeyEvidenceCollection() { return ( !tair_obj_key_evidences.isEmpty() ) ? tair_obj_key_evidences : null; }

  /**
   * retrieve the iterator to the TairObjKeyEvidenceCollection
   * 
   */ 
  public Iterator getTairObjKeyEvidences() { return ( !tair_obj_key_evidences.isEmpty() ) ? tair_obj_key_evidences.iterator() : null; }

  /**
   * @return <code>true</code> if keyword has tair obj key evidences 
   * or <code>false</code> if no tair obj key evidences exist
   */
  public boolean hasTairObjKeyEvidences() { return ( tair_obj_key_evidences != null && !tair_obj_key_evidences.isEmpty() ); }

  /**
   * retrieve the count of tair_obj_key_evidences
   * 
   */
  public int getCount() { return getTairObjKeyEvidenceCollection().getCountForCreatedByKeyword(); }
 
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
      setTairObjKeyEvidences( db, getKeywordID() );
    }
  }

  /**
   * test KeywordAnnotationDetail content
   */
  public void test() {
    System.out.println( "****** KeywordAnnotationDetail content test ******" );
    if( getKeywordID() != null ) {
      System.out.println( "keyword id = " + getKeywordID() );
      System.out.println( "keyword name = " + getKeywordName() );
      System.out.println( "keyword extdb_id = " + getKeywordExtdbId() );
    }
    System.out.println( "****** tair obj key evidences for keyword ******" );
    if( hasTairObjKeyEvidences() ) {
      System.out.println( "count = " + getCount() );
      Iterator tokeIter = getTairObjKeyEvidences();
      TairObjKeyEvidence toke = null;
      if ( tokeIter != null ) {
	while ( tokeIter.hasNext() ) {
	   toke = ( TairObjKeyEvidence )tokeIter.next();
	   toke.test();
	}
      }
    }
    System.out.println( "**** KeywordAnnotationDetail content test end ****" );
  }
	    
  /**
   * this method is used for testing.
   */

  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 7816 );
      KeywordAnnotationDetail kad = new KeywordAnnotationDetail( connection, test_id );  
      kad.test();
      System.out.println( "**********************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

  

}



