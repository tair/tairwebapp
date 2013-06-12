/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * AnnotationObjectCollection is a custom collection that stores
 * all annotations for a TairObject as a collection of <code>AnnotationObject</code>
 * objects. 
 */


public class AnnotationObjectCollection {
  private ArrayList annotations;
  private ArrayList annotationSources;

  /**
   * Creates an empty instance of AnnotationObjectCollection
   */
  public AnnotationObjectCollection()  {
    annotations = new ArrayList();
  }


  /**
   * Creates an instance of AnnotationObjectCollection that contains all Annotations
   * associated with supplied tair object id as <code>AnnotationObject</code>s.
   *,
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve annotations for
   * @exception SQLException in the case of an invalid operation or database error
   */
  public AnnotationObjectCollection( DBconnection conn, Long tair_object_id ) throws SQLException {
    annotations = new ArrayList();
    
    if ( tair_object_id != null ) {
      populateTairObject( conn, tair_object_id );
    }
  }

  /**
   * Creates an instance of AnnotationObjectCollection that contains annotations for
   * submitted id.  This version includes a type param that allows for different modes
   * of population.  Currently, valid values of type are:
   * <ul>
   * <li>tair_object - Collection will be populated with all annotations for submitted
   * tair_object_id; this is the same as callling the AnnotationObjectCollection( conn, id )
   * form of the constructor</li>
   * </ul>
   *
   * @param conn An active connection to the database
   * @param id Id to retrieve annotations for
   * @param type Mode to populate connection; current values can be "tair_object" or 
   * "aa_sequence"
   */
  public AnnotationObjectCollection( DBconnection conn, Long id, String type ) throws SQLException {
    annotations = new ArrayList();
    if ( id != null && type != null ) {
      if ( type.equals( "tair_object" ) ) {
	populateTairObject( conn, id );
      }
    }

  }


  // retrieve annotation ids associated to tair object id & create AnnotationObjects for each
  private void populateTairObject( DBconnection conn, Long tair_object_id ) throws SQLException {
    ArrayList ids = null;
    String query = null;
    ResultSet results = null;

    if ( tair_object_id != null ) {
      query = 
	"SELECT annotation_id " +
	"FROM Annotation " +
	"WHERE tair_object_id = " + tair_object_id.toString() + 
        " order by date_entered  desc  ";

      conn.setQuery( query );
      results = conn.getResultSet();
      while ( results.next() ) {
	if ( ids == null ) {
	  ids = new ArrayList();
	}
	ids.add( new Long( results.getLong( "annotation_id" ) ) );
      }
      conn.releaseResources();

      if ( ids != null && !ids.isEmpty() ) {
	createAnnotations( conn, ids );
      }
    }
  }


  // iterate through collection of annotation ids & create objects
  private void createAnnotations( DBconnection conn, ArrayList ids ) throws SQLException {
    Iterator iter = null;
    AnnotationObject annotation = null;
    if (annotationSources == null){
        annotationSources = new ArrayList ();
    }
    iter = ids.iterator(); // ids should never be null if we got this far
    while ( iter.hasNext() ) {
      annotation = new AnnotationObject( conn, (Long) iter.next() );
      add( annotation );
      // not sure if I can init the annotationSource here
    
      if ( ! annotationSources.contains( annotation.get_annotation_source() )){
          annotationSources.add ( annotation.get_annotation_source());
      }
      
    }
  }



  /**
   * Determines if collection has elements in it
   *
   * @return <code>true</code> if collection has no annotations in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return annotations.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return annotations.size(); }

  /**
   * Retrieves element at supplied index
   *
   * @return AnnotationObject at supplied index, or <code>null</code> if no element at supplied index
   */
  public AnnotationObject get( int index ) { return (AnnotationObject) annotations.get( index ); }


  /**
   * Adds supplied element to collection
   * 
   * @param annotation AnnotationObject to add to collection
   */
  public void add( AnnotationObject annotation ) { annotations.add( annotation ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param annotation AnnotationObject to remove from collection
   */
  public void remove( AnnotationObject annotation ) { annotations.remove( annotation ); }

  /**
   * Determines if supplied element is in collection
   *
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( AnnotationObject annotation ) { return annotations.contains( annotation ); }


  /**
   * Retrieves all elements in collection
   *
   * @return All annotations in collection as an <code>Iterator</code> of <code>AnnotationObject</code>
   * objects, or <code>null</code> if no annotations in collection
   */
    public Iterator iterator() { 
	if (!annotations.isEmpty() ){
	    // sort by date 
	    sort(new AnnotationComparator() );
	    return  annotations.iterator() ;
	}
	return null; 
    }
  
  /**
   * Retrieves all elements in collection
   *
   * @return All annotations in collection as an <code>Iterator</code> of <code>String</code>
   * objects, or <code>null</code> if no annotation source s in collection
   */
  public Iterator getAnnotationSources() { 
     return ( !annotationSources.isEmpty() ) ? annotationSources.iterator() : null; 
  }

 /**
   * Retrieves all elements in collection
   *
   * @return All annotations in collection as an <code>Iterator</code> of <code>AnnotationObject</code>
   * objects for a given source , or <code>null</code> if no annotations in collection
   */
  public Iterator getAnnotations(String source) { 
    ArrayList tmp = new ArrayList();
    Iterator iter = null;
    AnnotationObject tmpObj = null;
    Iterator returnIter = null;
   
    if ( source != null ) { // create collection for objects matching source
      iter = iterator();
      if ( iter != null ) {
	while ( iter.hasNext() ) {
	  tmpObj = (AnnotationObject) iter.next();
	  if ( source.equals( tmpObj.get_annotation_source() ) ) {
	     tmp.add( tmpObj );
	  }
	}
      }
      if ( tmp != null && !tmp.isEmpty() ) {
	  Collections.sort(tmp , new AnnotationComparator() ); 
  	  returnIter = tmp.iterator();
      }  
    } else { // if not restricting by type, return all in collection
      returnIter = iterator();
    }
     return returnIter ;
  }


  /**
   * Sorts all elements in collection according to criteria set in comparator
   *
   * @param comparator Comparator that defines criteria collection should be sorted by
   */
  public void sort( Comparator comparator ) {
    Collections.sort( annotations, comparator );
  }


 
  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** AnnotationObjectCollection content test ******" );
    if ( !isEmpty() ) {
      Iterator iter = iterator();
      while ( iter.hasNext() ) {
	AnnotationObject annotation = (AnnotationObject) iter.next();
	annotation.test();
      }
    }
    System.out.println( "**** AnnotationObjectCollection content test end ****" );
  }
  

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      Long id = new Long( 17398 );
      AnnotationObjectCollection annotations = new AnnotationObjectCollection( conn, id );
      annotations.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
  








