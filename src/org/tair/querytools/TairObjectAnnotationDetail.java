/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved 
*-----------------------------------------------------------------------
 */

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;

import java.sql.*;
import java.util.*;

/**
 * TairObjectAnnotationDetail is a composite class to represent all information
 * annotation information for a specific tair object
 * TairObjectAnnotationDetail contains a
 * collection of associated keywords with the corresponding relationship type and evidence information 
 * via <code>KeywordCollection</code>
 * and sorted by keyword type
 */

public class TairObjectAnnotationDetail implements Detail {

  private KeywordCollection keywords;
  private Long tair_object_id;
  private String tair_object_name;
  private String tair_object_table;
  private NotepadCollection notes;
  // notepad entries (user comments) for tair object - stored as Notepad objects
    
  /**
   * Creates an empty instance of TairObjectAnnotationDetail
   */
  public TairObjectAnnotationDetail() {}

  /**
   * Creates an empty instance of TairObjectAnnotationDetail
   */
  public TairObjectAnnotationDetail( DBconnection db, Long tair_object_id ) throws SQLException {
    if ( tair_object_id != null ) {
      get_information( db, tair_object_id );
    }
  }
  
  /**
   * Sets the tair object info and tair object name that the object will be populated for - link from a detail page
   * such as gene detail or locus detail page
   * @param value the tair object id
   */
  private void setTairObjectInfo( DBconnection db, Long tair_object_id ) throws SQLException { 
    // objectTyper can convert a tair_object_id to a tair object table which is what I need to get the correct 
    // name for the tair object 
    if ( tair_object_id != null ) {  
      this.tair_object_id = tair_object_id;
      tair_object_table = ObjectTyper.getTairObjectTable( db, tair_object_id );
      tair_object_name = ObjectTyper.getTairObjectName( db, tair_object_table, tair_object_id );
      /*String query = "select name from " + 
	  " Gene where tair_object_id = " + 
	   tair_object_id.toString();
      conn.setQuery( query );
      Debugger.println( Debugger.logMsg( this, "tair object info query = " + query ) );  	  
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
        name = results.getString( "name" ); 	
      }
      conn.releaseResources();*/
    }
  }

  /**
   * retrieve the tair_object_id
   * 
   */
  public Long getTairObjectID() { return tair_object_id; }

  /**
   * retrieve the name
   * 
   */
  public String getName() { return tair_object_name; }

  /**
   * retrieve the tair object table name, Gene or Locus , for now
   * 
   */
  public  String getTairObjectTable() { return tair_object_table; }

  /**
   * Sets the keywords
   * @param value the keyword collection <code>KeywordCollection</code> 
   */
  private void setKeywordCollection( KeywordCollection value ) { 
    keywords = value;
    keywords.sort( new TairObjectKeywordComparator() );
  }

  /**
   * retrieve the KeywordCollection
   * 
   */ 
  private KeywordCollection getKeywordCollection() { return keywords; }

  /**
   * Sets the notes
   * @param value the notepad collection <code>NotepadCollection</code> 
   */
  private void setNotepadCollection( NotepadCollection value ) { notes = value; }

  /**
   * retrieve the NotepadCollection
   * 
   */ 
  private NotepadCollection getNotepadCollection() { return notes; }

  /**
   * @return <code>true</code> if tair object has keywords associated with it, 
   * or <code>false</code> if no keywords for this tair object id
   */
  public boolean hasKeywords() { return ( keywords != null && ( keywords.size() > 0 ) ); }

  /**
   * Gets the keywords as an <code>Iterator</code>
   * of <code>TairObjectKeyword</code>s.
   * @return an <code>Iterator</code> of <code>TairObjectKeyword</code>s value 
   * specifying the keywords associated with this tair object
   * @see TairObjectKeyword
   */ 
  public Iterator getKeywords() {
    Iterator iter = null;
    if ( hasKeywords() ) {
      iter = keywords.iterator();
    }
    return iter;
  }

  /**
   * Determines if tair object has notepad entries associated to it
   *
   * @return <code>true</code> if tair object has associated notepad
   * entries; <code>false</code> if no notepad entries associated to 
   * tair object
   */
  public boolean hasNotepad() {
    return ( notes != null && !notes.isEmpty() );
  }

  /**
   * Retrieves notepad entries (user annotations) for this tair object, 
   * optionally restricting entries to only most recent 5
   *
   * @param showAll If <code>true</code> all entries for this object will
   * be returned; if <code>false</code> only most recent 5 entries will
   * be returned
   * @return Notepad entries for tair object as an <code>Iterator</code> 
   * of <code>Notepad</code> objects, or <code>null</code> if no notepad
   * entries for this tair object
   */
  public Iterator getNotepad( boolean showAll ) {
    return hasNotepad() ? notes.iterator( showAll ) : null;
  }

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
   * @return Tair object id, or <code>null</code> if no tair object exists
   */
  public Long get_id() { return getTairObjectID(); }	

  /**
   * Populates object with data referenced by submitted tair object id 
   * @param db An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public void get_information( DBconnection db, Long tair_object_id ) throws SQLException {		
    if ( tair_object_id != null ) {
      setTairObjectInfo( db, tair_object_id ); 	
      setNotepadCollection( new NotepadCollection( db, getTairObjectID() ) );
      setKeywordCollection( new KeywordCollection( db, getTairObjectID(), getTairObjectTable() ) );
    }
  }

  /**
   * test TairObjectAnnotationDetail content
   */
  public void test() {
    System.out.println( "****** TairObjectAnnotationDetail content test ******" );
    if( getTairObjectID() != null ) {
      System.out.println( "tair object id = " + getTairObjectID() );
      System.out.println( "name = " + getName() );
      System.out.println( "tair object table name = " + getTairObjectTable() );
    }
    System.out.println( "****** associated keywords ******" );
    // pull out the keywords via objects test method ( uses iterator ) and via get( index )
    if( hasKeywords() ) {
      getKeywordCollection().test();
    }
    System.out.println( "****** associated notes ******" );
    if( hasNotepad() ) {
      getNotepadCollection().test();
    }
    System.out.println( "**** TairObjectAnnotationDetail content test end ****" );
  }
	    
  /**
   * this method is used for testing.
   */

  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 2017602 );
      TairObjectAnnotationDetail toad = new TairObjectAnnotationDetail( connection, test_id );  
      toad.test();
      System.out.println( "**********************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

  

}



