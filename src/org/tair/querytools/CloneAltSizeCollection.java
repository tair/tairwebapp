/** 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 * 
 * CloneAltSizeCollection is a custom collection for storing
 * all alternate sizes for a clone as a collection of <code>TfcCloneAlternateSize</code>
 * objects. 
 */

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.sql.*;
import java.util.*;

public class CloneAltSizeCollection {
  private Vector altSizes;


  /**
   * Creates an empty version of CloneAltSizeCollection for population externally.
   */
  public CloneAltSizeCollection()  {
    altSizes = new Vector();
  }


  /**
   * Creates an instance of CloneAltSizeCollection populated with <code>TfcCloneAlternateSize</code>
   * objects that are associated to the supplied clone id 
   * @param db An active connnection to the database
   * @param clone_id Clone id to retrieve alternate sizes for 
   * @throws SQLException in the case of an invalid operation or database error
   */   
  public CloneAltSizeCollection( DBconnection db, Long clone_id ) throws SQLException {
    if ( clone_id != null ) {
      altSizes = new Vector();
      retrieveAltSizes( db, clone_id );
    }
  }


  // Retrieves alternate sizes for supplied clone id and populates vector
  private void retrieveAltSizes( DBconnection db, Long clone_id ) throws SQLException {
    Vector altSizeIDs = null;
    String query = null;

    if ( clone_id != null ) {
      query = 
	"select clone_alt_size_id "+
	"from CloneAlternateSize "+
	"where clone_id = " + clone_id.toString();
      db.setQuery( query );
      ResultSet results = db.getResultSet();
      while( results.next() ) {
	if ( altSizeIDs == null ) {
	  altSizeIDs = new Vector();
	}
	altSizeIDs.add( new Long( results.getLong( "clone_alt_size_id" ) ) );
      }
      db.releaseResources();

      if ( altSizeIDs != null && !altSizeIDs.isEmpty() ) {
	Iterator iter = altSizeIDs.iterator();
	while ( iter.hasNext() ) {
	  TfcCloneAlternateSize altSize = new TfcCloneAlternateSize( db, (Long) iter.next() );
	  add( altSize );
	}
      }
    }
  }


  // custom collection wrappers
  public void add( TfcCloneAlternateSize stock ) { altSizes.add( stock ); }
  public void remove( TfcCloneAlternateSize stock ) { altSizes.remove( stock ); }
  public boolean isEmpty() { return altSizes.isEmpty(); }
  public int size() { return altSizes.size(); }
  public Iterator iterator() { return altSizes.iterator(); }


  /**
   * test CloneAltSizeCollection content
   */
  public void test() {
    System.out.println( "****** test CloneAltSizeCollection content ******" );
    int length = this.size();
    TfcCloneAlternateSize altSize = null;
    Iterator iter = null;
    if ( !isEmpty() ) {
      iter = iterator();
      while ( iter.hasNext() ) {
	altSize = (TfcCloneAlternateSize) iter.next();
	altSize.test();
      }
    }
    System.out.println( "**** test CloneAltSizeCollection content end ****" );	
  }


  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
	
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 2453 );
      CloneAltSizeCollection altSizes = new CloneAltSizeCollection( connection, test_id );
      altSizes.test();
      System.out.println( "**************************************" );
    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
  








