/** 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 * 
 * SynonymCollection is a custom collection for storing
 * all synonyms for a keyword as a collection of <code>TfcSynonym</code>
 * objects. Each TfcSynonym object maps to one row in the Synonym table.
 */

package org.tair.querytools;

import org.tair.tfc.*;
//import org.tair.utilities.*;
import java.sql.*;
import java.util.*;

public class SynonymCollection {
  private ArrayList synonyms;

  /**
   * Creates an empty version of SynonymCollection for population externally.
   */
  public SynonymCollection()  {
    synonyms = new ArrayList();
  }

  /**
   * Creates an instance of SynonymCollection populated with <code>TfcSynonym</code>
   * objects that are associated to the supplied keyword id. 
   * @param db An active connnection to the database
   * @param keyword_id Keyword id to retrieve synonyms for
   * @throws SQLException in the case of an invalid operation or database error
   */   
  public SynonymCollection( DBconnection db, Long keyword_id ) throws SQLException {
    if ( keyword_id != null ) {
      synonyms = new ArrayList();
      setSynonyms( db, keyword_id );
    }
  }


  // Retrieves synonyms for supplied keyword id and populates vector
  private void setSynonyms( DBconnection db, Long keyword_id ) throws SQLException {
    String query = null;
    TfcSynonym synonym = null;

    if ( keyword_id != null ) {
      query = 
	"select synonym_id "+
	"from TAIR_Synonym "+
	"where keyword_id = " + keyword_id.toString();
      db.setQuery( query );
      ResultSet results = db.getResultSet();
      while ( results.next() ) {
        synonym = new TfcSynonym( db, new Long( results.getLong( "synonym_id" ) ) );
	synonyms.add( synonym );
      }
      db.releaseResources();
    }
  }
  
  // custom collection wrappers
  public void add( TfcSynonym synonym ) { synonyms.add( synonym ); }
  public void remove( TfcSynonym synonym ) { synonyms.remove( synonym ); }
  public boolean isEmpty() { return synonyms.isEmpty(); }
  public int size() { return synonyms.size(); }
  public Iterator iterator() { return synonyms.iterator(); }

  /**
   * @return All synonyms in collection as a comma delimited string, or <code>null</code>
   * if no synonyms in collection
   */
  public String getSynonymString( ) {
    StringBuffer buffer = null;
    String termSynonyms = null;
    Iterator iter = iterator();

    if ( iter != null ) {
      buffer = new StringBuffer();
      boolean first = true;
      while ( iter.hasNext() ) {
	TfcSynonym synonym = (TfcSynonym) iter.next();
	if ( !first ) {
	  buffer.append( "; " );
	}
	buffer.append( synonym.get_term_synonym() );
	first = false;
      }
      termSynonyms = buffer.toString();
    }
    return termSynonyms;
  }

  
  /**
   * test SynonymCollection content
   */
  public void test() {
    System.out.println( "****** test SynonymCollection content ******" );
    int length = this.size();
    TfcSynonym synonym = null;
    Iterator iter = null;
    if ( !isEmpty() ) {
      iter = iterator();
      while ( iter.hasNext() ) {
	synonym = (TfcSynonym) iter.next();
	synonym.test();
      }
    }
    System.out.println( "synonym string = " + getSynonymString() );
    System.out.println( "**** test SynonymCollection content end ****" );	
  }


  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
	
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 4271 );
      SynonymCollection synonyms = new SynonymCollection( connection, test_id );
      synonyms.test();
      System.out.println( "**************************************" );
    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
  








