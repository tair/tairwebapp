/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;


/**
 * TairObjectKeyword is a composite class that extends <code>KeywordLite</code>
 * to present type specific information about a keyword. In addition to basic 
 * data for keyword, TairObjectKeyword also contains collections of 
 * associated information( at this point Evidence information which will contain reference information ) 
 * associated through the TairObjectKeyword table, and a set of 
 * relationship types for the specified keyword_id/tair_object_id pair that exists in TairObjectKeyword 
 */


public class TairObjectKeyword extends KeywordLite {

  private Long tair_object_id;
  private String tair_object_name;
  private HashMap evidences;  

  /**
   * Creates an empty instance of TairObjectKeyword
   */         
  public TairObjectKeyword() { 
    super();
  }

  /**
   * Populates an instance of TairObjectKeyword to reflect data
   * referenced by submitted keyword id and tair object id.
   *
   * @param conn An active connection to the database
   * @param keyword_id Keyword id to retrieve data for
   * @param tair_object_id Tair object id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error
   */      
  public void populate( DBconnection conn, Long keyword_id, Long tair_object_id ) throws SQLException {
    if ( tair_object_id != null && keyword_id != null ) {
      this.tair_object_id = tair_object_id; 	
      super.populate( conn, keyword_id ); // will populate relationship types
      String child_table_name = ObjectTyper.getTairObjectTable( conn, tair_object_id );
      if ( child_table_name.equalsIgnoreCase( "Gene" ) ) setEvidences( conn );
      tair_object_name = ObjectTyper.getTairObjectName( conn, child_table_name, tair_object_id );
    }
  }

  /**
   * @returns tair_object_id 
   */
  public Long getTairObjectID() { return this.tair_object_id; }

  /**
   * @returns tair_object_name 
   */
  public String getTairObjectName() { return this.tair_object_name; }

  /**
   * Populates keywords collection of relationship types between keyword_id and tair_object_id.
   * This is a concrete implementation of abstract method in superclass that allows for 
   * type specific population of this collection.  Collection of relationship types is held
   * in super class; this method is called as part of superclass's populate() method
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  protected void setRelationshipTypes( DBconnection conn ) throws SQLException {
    relationship_types = new ArrayList();
    String query = "select rt.relationshiptype_type AS relationship_type from RelationshipType rt, TairObject_Keyword tok " + 
      " where tok.relationship_type_id = rt.relationship_type_id AND tok.keyword_id = " + getKeywordID().toString() + 
      " AND tok.tair_object_id = " + getTairObjectID().toString(); 
    conn.setQuery( query );
    //Debugger.println( Debugger.logMsg( this, "relationship type query = " + query ) );  	  
    ResultSet results = conn.getResultSet();
    while ( results.next() ) {
      relationship_types.add( results.getString( "relationship_type" ) ); 	
    }
    conn.releaseResources();
  }


    // sets the HashMap of evidences by relationship type. the relationship type is the key which accesses a TairObjKeyEvidenceCollection for that type
  private void setEvidences( DBconnection conn ) throws SQLException {
    evidences = new HashMap();  
    String rel_type = null;
    TairObjKeyEvidenceCollection tokec = new TairObjKeyEvidenceCollection(); 
    Iterator iter = getRelationshipTypes();
    if ( iter != null ) {
      while ( iter.hasNext() ) {
	rel_type = ( String )iter.next();
	tokec.populate( conn, getTairObjectID(), getKeywordID(), rel_type );
	evidences.put( rel_type, tokec ); 
      }  
    }
  }

  /**
   * @returns iterator of collection of TairObjKeyEvidence for one of this object's relationship_types
   *  see TairObjKeyEvidenceCollection
   */
  public Iterator getEvidences( String relationship_type ) { 
    TairObjKeyEvidenceCollection tokec = null;
    if ( relationship_type != null ) {
      tokec = ( TairObjKeyEvidenceCollection )evidences.get( relationship_type ); 
    }
    return ( !tokec.isEmpty() ) ? tokec.iterator() : null; 
  }



  /**
   * For unit testing only
   */
  public void test() {
    super.test();
    System.out.println( "****** TairObjectKeyword content test ******" );
    System.out.println( "tair object name = " + getTairObjectName() );
    Iterator rel_type_iter = getRelationshipTypes();
    String rel_type = null;
    Iterator evid_iter = null;
    if ( rel_type_iter != null ) {
      while ( rel_type_iter.hasNext() ) {
	rel_type = ( String )rel_type_iter.next();  
	System.out.println( "relationship type = " + rel_type );
	evid_iter = getEvidences( rel_type );
	if ( evid_iter != null ) {
	  TairObjKeyEvidence toke = new TairObjKeyEvidence();
	  int i = 0;
	  while ( evid_iter.hasNext() ) {
	    System.out.println( "evidence # " + i++ );
	    toke = ( TairObjKeyEvidence )evid_iter.next();
	    toke.test();
	  }  
	} 
      }
    }
    System.out.println( "****** end TairObjectKeyword content test ******" );
  }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{
      DBconnection conn = new DBconnection();
      Long keyword_id = new Long( 1091 );
      Long tair_object_id = new Long( 2124942 );
      TairObjectKeyword tok = new TairObjectKeyword();
      tok.populate( conn, keyword_id, tair_object_id );
      tok.test();

    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
  








