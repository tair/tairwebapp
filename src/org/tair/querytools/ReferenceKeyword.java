/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;


/**
 * ReferenceKeyword is a composite class that extends <code>KeywordLite</code>
 * to present type specific information about a keyword. In addition to basic 
 * data for keyword, ReferenceKeyword also contains collections of 
 * associated information 
 * associated through the ReferenceKeyword table, and a set of 
 * relationship types for the specified keyword_id/reference_id pair that exists in ReferenceKeyword 
 */


public class ReferenceKeyword extends KeywordLite {


  private Long reference_id;

    //private EvidenceCollection evidences;

  /**
   * Creates an empty instance of ReferenceKeyword
   */         
  public ReferenceKeyword() { 
    super();
  }

  /**
   * Populates an instance of ReferenceKeyword to reflect data
   * referenced by submitted keyword id and tair object id.
   *
   * @param conn An active connection to the database
   * @param keyword_id Keyword id to retrieve data for
   * @param reference_id Reference id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error
   */      
  public void populate( DBconnection conn, Long keyword_id, Long reference_id ) throws SQLException {
    if ( reference_id != null ) {
      this.reference_id = reference_id; 	
      super.populate( conn, keyword_id ); // will populate relationship types
      //setEvidence( conn );
    }
  }

  /**
   * @returns reference_id 
   */
  public Long getReferenceID() { return this.reference_id; }

  /**
   * Populates keywords collection of relationship types between keyword_id and reference_id.
   * This is a concrete implementation of abstract method in superclass that allows for 
   * type specific population of this collection.  Collection of relationship types is held
   * in super class; this method is called as part of superclass's populate() method
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  protected void setRelationshipTypes( DBconnection conn ) throws SQLException { 
    relationship_types = new ArrayList();
    String query = "select rt.relationshiptype_type AS relationship_type from RelationshipType rt, Reference_Keyword rk " + 
	" where rk.relationship_type_id = rt.relationship_type_id AND rk.keyword_id = " + getKeywordID().toString() + 
	" AND rk.reference_id = " + getReferenceID().toString(); 
    conn.setQuery( query );
    Debugger.println( Debugger.logMsg( this, "relationship type query = " + query ) );  	  
    ResultSet results = conn.getResultSet();
    while ( results.next() ) {
      relationship_types.add( results.getString( "relationship_type" ) ); 	
    }
    conn.releaseResources();
  }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** ReferenceKeyword content test ******" );
    super.test();
    System.out.println( "****** end ReferenceKeyword content test ******" );
  }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{
      DBconnection conn = new DBconnection();
      Long keyword_id = new Long( 3753 );
      Long reference_id = new Long( 2871 );
      ReferenceKeyword rk = new ReferenceKeyword();
      rk.populate( conn, keyword_id, reference_id );
      rk.test();

    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
  








