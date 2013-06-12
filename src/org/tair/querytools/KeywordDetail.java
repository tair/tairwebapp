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
 * KeywordDetail is a composite class to represent all information
 * associated with an entry in the Keyword table for display
 * on the Keyword detail page which displays detail information about keywords. 
 * KeywordDetail contains an instance of <code>TfcKeyword</code> Additionally, collections of: all 
 * associated synonyms via <code>SynonymCollection</code>, and associated annotations via 
 * <code>???Collection</code>  
 */

public class KeywordDetail implements Detail {

  // keyword info from tfc_keyword - name, definition, extdb_id, keyword_type
  private TfcKeyword tfc_keyword;

  // a collection of synonyms associated to a keyword - stored as TfcSynonyms
  private SynonymCollection synonyms;

  private Iterator to_term_counts;// iterator to AnnotationCount objects

  private Iterator to_children_counts;// iterator to AnnotationCount objects

  /**
   * Creates an empty instance of KeywordDetail
   */
  public KeywordDetail() {}
  
  /**
   * Creates an instance of KeywordDetail that represents
   * all data referenced by submitted reference keyword id.
   * @param db An active connection to the database
   * @param id keyword id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public KeywordDetail( DBconnection db, Long keyword_id ) throws SQLException {
    if ( keyword_id != null ) {
      get_information( db, keyword_id );
    }
  }  

  /**
   * Sets the keyword
   * @param value the keyword <code>TfcKeyword</code> 
   */
  private void setKeyword( TfcKeyword value ) { tfc_keyword = value; }

  /**
   * retrieve the keyword tfc object
   * 
   */
  private TfcKeyword getKeyword() { return tfc_keyword; }

  /**
   * Sets the synonyms
   * @param value the synonyms <code>SynonymCollection</code> 
   */
  private void setSynonymCollection( SynonymCollection value ) { synonyms = value;}

  // TfcKeyword wrappers
  public Long get_keyword_id() { return getKeyword().get_keyword_id(); }
  public String get_keyword_type_id() { return getKeyword().get_keyword_type_id(); }
  public String get_keyword() { return getKeyword().get_keyword(); }
  public String get_definition() { return getKeyword().get_definition(); }
  public String get_note() { return getKeyword().get_note(); }
  public String get_extdb_id() { return getKeyword().get_extdb_id(); }
  public String get_keyword_type() { return getKeyword().get_keyword_type(); }
  public String get_def_source() { return getKeyword().get_def_source(); }
  public String get_type_definition() { return getKeyword().get_type_definition(); }
  public String get_keyword_type_display() { return getKeyword().get_keyword_type_display(); }
  public java.util.Date get_date_last_modified() { return getKeyword().get_date_last_modified(); }

  /**
   * @return <code>true</code> if keyword has synonyms associated with it, 
   * or <code>false</code> if no synonymss for keyowrd
   */
  public boolean has_synonyms() { return ( synonyms != null && ( synonyms.size() > 0) ); }

  /**
   * Gets the synonyms as an <code>Iterator</code>
   * of <code>TfcSynonym</code>s.
   * @return an <code>Iterator</code> of <code>TfcSynonym</code>s value 
   * specifying the synonyms associated with this keyword
   * @see TfcSynonym
   */ 
  public Iterator get_synonyms() {
    Iterator iter = null;
    if ( has_synonyms() ) {
      iter = synonyms.iterator();
    }
    return iter;
  }
  /**
   * @return All synonyms to this term as a comma delimited string, or <code>null</code>
   * if no synonyms 
   */
    public String getSynonymString( ){
	return synonyms.getSynonymString( );
    }

  /**
   */
    private void setAnnotationCounts( DBconnection conn, Long keyword_id ) throws SQLException { 
      AnnotationCountPopulator acp = new AnnotationCountPopulator();
      acp.setAnnotationCounts( conn, keyword_id, "term", true );
      to_term_counts = acp.getAnnotationCounts();    
      acp.setAnnotationCounts( conn, keyword_id, "children", true );
      to_children_counts = acp.getAnnotationCounts();           
    }

  /**
   */
    public boolean hasToTermCounts() { return ( to_term_counts != null ) ? to_term_counts.hasNext() : false; }

  /**
   */ 
    public Iterator getToTermCounts() { return to_term_counts; }

  /**
   */
    public boolean hasToChildrenCounts() { return ( to_children_counts != null ) ? to_children_counts.hasNext() : false; }

  /**
   */ 
    public Iterator getToChildrenCounts() { return to_children_counts; }


  /**
   * required method per Detail interface -- does nothing since keywords cannot be resolved b a keyword name alone
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
   * objects, keyword_id will be returned if one exists.
   *
   * @return keyword id, or <code>null</code> if no keyword exists
   */
  public Long get_id() { return get_keyword_id(); }	

  /**
   * Populates object with data referenced by submitted keyword id
   * @param db An active connection to the database
   * @param keyword_id Polymorphism id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public  void get_information( DBconnection db, Long keyword_id ) throws SQLException {		
    if ( keyword_id != null ) {
      setKeyword( new TfcKeyword( db, keyword_id ) );
      setSynonymCollection( new SynonymCollection( db, keyword_id ) );
      setAnnotationCounts( db, keyword_id );      
    }
  }

  /**
   * test KeywordDetail content
   */
  public void test() {
    System.out.println( "****** KeywordDetail content test ******" );
    if( get_keyword_id() != null ) {
      System.out.println( "keyword id = " + get_keyword_id() );
      System.out.println( "get_keyword_type_id = " + get_keyword_type_id() );
      System.out.println( "get_keyword = " + get_keyword() );
      System.out.println( "get_definition = " + get_definition() );
      System.out.println( "get_extdb_id = " + get_extdb_id() );
      System.out.println( "get_keyword_type = " + get_keyword_type() );
      System.out.println( "get_def_source = " + get_def_source() );
      System.out.println( "get_keyword_type_id = " + get_keyword_type_id() );
      System.out.println( "get_type_definition = " + get_type_definition() );
      System.out.println( "get_keyword_type_display = " + get_keyword_type_display() );
      System.out.println( "get_date_last_modified = " + get_date_last_modified() );
    }
    System.out.println( "****** synonyms ******" );
    if( has_synonyms() ) {
      System.out.println( "synonyms = " + getSynonymString() );
    }
    Iterator toTermIter = getToTermCounts();
    if( hasToTermCounts() ) {
      System.out.println( "****** to term counts ******" );
      if ( toTermIter != null ) {
	while ( toTermIter.hasNext() ) {
	  AnnotationCount ac = ( AnnotationCount )toTermIter.next();
	  ac.test();
	}  
      }
    }

    Iterator toChildrenIter = getToChildrenCounts();
    if( hasToChildrenCounts() ) {
      System.out.println( "****** to children counts ******" );
      if ( toChildrenIter != null ) {
	while ( toChildrenIter.hasNext() ) {
	  AnnotationCount ac = ( AnnotationCount )toChildrenIter.next();
	  ac.test();
	}  
      }
    }
    System.out.println( "**** KeywordDetail content test end ****" );
  }
	    
  /**
   * this method is used for testing.
   */

  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 7816 );
      KeywordDetail kd = new KeywordDetail( connection, test_id );  
      kd.test();
      test_id = new Long( 4148 ); 
      kd = new KeywordDetail( connection, test_id );
      kd.test();
      test_id = new Long( 14085 ); 
      kd = new KeywordDetail( connection, test_id );
      kd.test();
      test_id = new Long( 11997 ); 
      kd = new KeywordDetail( connection, test_id );
      kd.test();
      System.out.println( "**********************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

  



}



