/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;


/**
 * PolymorphismRestrictionEnzymeCollection is a custom collection that stores
 * information on the association between polymorphism and restriction enzymes
 * as a collection of <code>PolymorphismRestrictionEnzyme/code> objects. 
*
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */
 
public class PolymorphismRestrictionEnzymeCollection  implements Serializable {   
  private ArrayList polyEnzymes;


  /**
   * Creates an empty instance of PolymorphismRestrictionEnzymeCollection
   */
  public PolymorphismRestrictionEnzymeCollection() { 
    polyEnzymes = new ArrayList();
  }


  /**
   * Creates an instance of PolymorphismRestrictionEnzymeCollection that
   * stores data for the association between restriction enzymes and
   * submitted polymorphism id
   *
   * @param conn An active connection to the database
   * @param polymorphism_id Polymorphism id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error
   */
  public PolymorphismRestrictionEnzymeCollection( DBconnection conn, Long polymorphism_id ) throws SQLException {
    polyEnzymes = new ArrayList();
    populate( conn, polymorphism_id );
  }

  private void populate( DBconnection conn, Long polymorphism_id ) throws SQLException {
    String query = null;
    ResultSet results = null;
    ArrayList enzymeIDs = null;
    Long enzymeID = null;
    Iterator iter = null;
    PolymorphismRestrictionEnzyme poly = null;

    if ( polymorphism_id != null ) {
      query =
	"SELECT restriction_enzyme_id "+
	"FROM Polymorphism_RestrictionEnzyme "+
	"WHERE polymorphism_id = " + polymorphism_id.toString();
      conn.setQuery( query );
      results = conn.getResultSet();

      while( results.next() ) {
	if ( enzymeIDs == null ) {
	  enzymeIDs = new ArrayList();
	}
	
	enzymeIDs.add( new Long( results.getLong( "restriction_enzyme_id" ) ) );
      }
      conn.releaseResources();

      if ( enzymeIDs != null && !enzymeIDs.isEmpty() ) {
	iter = enzymeIDs.iterator();
	while ( iter.hasNext() ) {
	  enzymeID = (Long) iter.next(); 
	  poly = new PolymorphismRestrictionEnzyme( conn, polymorphism_id, enzymeID );
	  polyEnzymes.add( poly );
	}
	conn.releaseResources();
      }
    }
  }

  /**
   * @return <code>true</code> if collection has no elements in it, or <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return ( polyEnzymes != null && polyEnzymes.isEmpty() ); }

  /**
   * @return Number of elements in collection
   */
  public int size() { return ( polyEnzymes != null ) ? polyEnzymes.size() : 0; }

    
  /**
   * @return Elements in collection as an <code>Iterator</code> of <code>PolymorphismRestrictionEnzyme</code>
   * objects, or <code>null</code> if no elements in collection
   */
  public Iterator iterator() {
    return ( polyEnzymes != null && !polyEnzymes.isEmpty() ) ? polyEnzymes.iterator() : null;
  }

  /**
   * Adds submitted element to collection
   *
   * @param polyEnzyme Element to add
   */
  public void addElement( PolymorphismRestrictionEnzyme polyEnzyme ) {
    polyEnzymes.add( polyEnzyme );
  }
  
  /**
   * @param index Index of item to retrieve
   * @return Element at submitted index, or <code>null</code>
   * if no element at requested index
   */
  public PolymorphismRestrictionEnzyme elementAt( int index ) {
    PolymorphismRestrictionEnzyme poly = null;

    if ( polyEnzymes != null && !polyEnzymes.isEmpty() ) {
      poly = (PolymorphismRestrictionEnzyme) polyEnzymes.get( index );
    }
    return poly;
  }
    

  /**
   * test PolymorphismRestrictionEnzymeCollection content
   */
  public void test() {
    System.out.println( "****** PolymorphismRestrictionEnzymeCollection content test ******" );
    if ( polyEnzymes != null && !polyEnzymes.isEmpty() ) {
      Iterator iter = iterator();
      while ( iter.hasNext() ) {
	PolymorphismRestrictionEnzyme polyEnz = (PolymorphismRestrictionEnzyme) iter.next();
	polyEnz.test();
      }
    }
    System.out.println( "**** PolymorphismRestrictionEnzymeCollection content test end ****" );
  }
  
  // this part is for test basic functions
  public static void main( String[] args ) {
    try{
      DBconnection conn = new DBconnection();
      Long test_id = new Long( 1716 );
      PolymorphismRestrictionEnzymeCollection coll = new PolymorphismRestrictionEnzymeCollection( conn, test_id );
      coll.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }

  }

}
