/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.tfc.*;


/** 
 * ImageCollection is a custom collection that stores information on all
 * images associated to a supplied tair object id. Image information is stored 
 * as a collection of <code>TfcImage</code> objects, which contain data about
 * the image, but not the image data itself. 
 *
 * <p>
 * Implements Serializable so TfcImage objects can be written as
 * part of serialized stock catalog data
 */


public class ImageCollection implements Serializable {
  private ArrayList images;


  /**
   * Creates an empty instance of ImageCollection
   */
  public ImageCollection() {
    images = new ArrayList();
  }

    
  /**
   * Creates an instance of ImageCollection that stores all images associated to
   * supplied tair_object_id.
   *
   * @param conn An active connection to the database
   * @param tair_object_id ID to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error
   */
  public ImageCollection( DBconnection conn, Long tair_object_id ) throws SQLException {
    images = new ArrayList();
    if ( tair_object_id != null ) {
      populate( conn, tair_object_id );
    }
  }

  
  // Retrieve images associated to submitted tair object id gene id
  private void populate( DBconnection conn, Long tair_object_id ) throws SQLException {
    String query = null;
    ArrayList ids = null;
    ResultSet results = null;
    TfcImage image = null;
    Iterator iter = null;

    // get tair object ids of images & use to create Tfc objects
    if ( tair_object_id != null ) {
      query = 
	"SELECT i.tair_object_id " +
	"FROM TairObject_Image t, Image i " +
	"WHERE t.image_id = i.image_id " +
	"AND t.tair_object_id = ? ";

      conn.setQuery( query );
      conn.setQueryVariable( tair_object_id.toString() );

      results = conn.getResultSet();
      while ( results.next() ) {
	if ( ids == null ) {
	  ids = new ArrayList();
	}
	ids.add( new Long( results.getLong( "tair_object_id" ) ) );
      }
      conn.releaseResources();

      if ( ids != null && !ids.isEmpty() ) {
	iter = ids.iterator();
	while ( iter.hasNext() ) {
	  image = new TfcImage( conn, (Long) iter.next() );
	  addElement( image );
	}
      }
    }
  }
  

  /**
   * @return <code>true</code> if collection has no images in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return images.isEmpty(); }

  /**
   * @return Number of elements in collection
   */
  public int size() { return images.size(); }

  /**
   * @return Image at supplied index, or <code>null</code> if no element at supplied index
   */
  public TfcImage get( int index ) { return (TfcImage) images.get( index ); }


  /**
   * Adds supplied element to collection
   * 
   * @param image Image to add to collection
   */
  public void addElement( TfcImage image ) { images.add( image ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param image Image to remove from collection
   */
  public void removeElement( TfcImage image ) { images.remove( image ); }

  /**
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( TfcImage image ) { return images.contains( image ); }

  /**
   * @return All images in collection as an <code>Iterator</code> of <code>TfcImage</code>
   * objects, or <code>null</code> if no images in collection
   */
  public Iterator iterator() { return ( !images.isEmpty() ) ? images.iterator() : null; }


 
  /**
   * For unit testing only
   */

  public void test() {
    System.out.println( "****** ImageCollection content test ******" );
    if ( !isEmpty() ) {
      Iterator iter = iterator();
      TfcImage image = null;

      while ( iter.hasNext() ) {
	image = (TfcImage) iter.next();
	image.test();
      }
    }
    System.out.println( "**** ImageCollection content test end ****" );
  }



  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      Long tair_object_id = new Long( 4113725 );
      ImageCollection images = new ImageCollection( conn, tair_object_id );
      images.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
      
  }
}
  








