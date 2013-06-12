/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.community.*;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * ReferenceDetail is a composite class to represent all information
 * associated with an entry in the Reference table. This class is usually
 * used only as a superclass for child elements (publication etc.), but can
 * be instantiated as a stand alone object.  ReferenceDetail contains an 
 * instance of <code>TfcReference</code> (usually the same object contained
 * by child classes as type specific [i.e. TfcPublication], but referred to
 * here generally as TfcReference superclass), a collection of urls 
 * associated with the reference, and a collection of all community records
 * associated directly to the reference (as author of a publication, for instance)
 *
 * <p>
 * ReferenceDetail implements Accessible interface to facilitate creation of the object's
 * TAIR accession number through <code>AccessionManager</code>.  Sub-classes of
 * ReferenceDetail should override the getElementType() method if they need to 
 * return a more specific value. ReferenceDetail's implementation is to return
 * the reference type of the object.
 */


public class ReferenceDetail implements Detail, Accessible {

  private TfcReference reference;

  // URLs associated with reference
  private URLReferenceCollection urls;

  // Community records associated with reference - stored as ListCommunity
  private ListCommunityCollection communities;

  // keywords associated to reference ( entries in Reference_Keyword table )-- stored as KeywordLite objects
  private KeywordCollection keywords;

  // count of entries in TairObjKeyEvidence table for this reference id
  private int annotationCount;

  /**
   * Creates an empty instance of ReferenceDetail
   */ 
  public ReferenceDetail() { 
    reference = new TfcReference();
  }
  
  
  /**
   * Creates an instance of ReferenceDetail to reflect data 
   * referenced by submitted reference id.
   *
   * @param conn An active connection to the database
   * @param reference_id Reference id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error, or
   * if no record found for submitted reference_id
   */
  public ReferenceDetail( DBconnection conn, Long reference_id ) throws SQLException {
    if ( reference_id != null ) {
      get_information( conn, reference_id );
    }
  }


  // TfcReference wrappers
  public void set_reference_id ( Long value ) { reference.set_reference_id( value ); }
  public Long get_reference_id() { return reference.get_reference_id(); }
  
  public void set_reference_type ( String value ) { reference.set_reference_type( value ); }
  public String get_reference_type() { return reference.get_reference_type(); }
  

  /**
   * Retrieves URLS associated with this reference
   *
   * @return URLs associated with this reference as an <code>Iterator</code>
   * of <code>BsUrl</code> objects, or <code>null</code> if no URLs associated
   * with this reference
   */ 
  public Iterator get_url_references() {
    return ( hasURLs() ) ? urls.iterator() : null;
  }
 
  /**
   * Determines if reference has associated URLs
   * 
   * @return <code>true</code> if reference has associated URLs, or 
   * <code>false</code> if no URLs associated to reference
   */
  public boolean hasURLs() {
    return ( urls != null && !urls.isEmpty() );
  }

  /**
   * Sets the annotation count ( count of entries in TairObjKeyEvidence table ) for this reference id
   */
  protected void setAnnotationCount( DBconnection conn, Long reference_id ) throws SQLException { 
      String query = "select count( keyword_id ) AS annotation_count from " + 
	  " TairObjKeyEvidence where reference_id = " + reference_id.toString();
      conn.setQuery( query );
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
          annotationCount = results.getInt( "annotation_count" );
      } 
      conn.releaseResources();
      Debugger.println( Debugger.logMsg( this, "annotation count = " + annotationCount ) ); 
  }


  /**
   * retrieve count of annotations to this publication
   * 
   */
  public Integer getAnnotationCount() { return new Integer( annotationCount ); }

  /**
   * @return <code>true</code> if reference has annotations 
   * or <code>false</code> if no annotations exist
   */
  public boolean hasAnnotations() { return ( annotationCount > 0 ); }
   


  /**
   * Empty implementation of population method using object name to satisfy
   * Detail interface.  ReferenceDetail objects must always be created using
   * reference_id
   */
  public void get_information( DBconnection conn, String name ) throws SQLException { }

  
  /**
   * Implementation of get_id() as required by Detail interface.  This method
   * is necessary for providing a way to make sure that object creation succeeded,
   * since Tfc objects will not throw exceptions if ID is not found.  For Reference
   * objects, reference_id will be returned if one exists.
   *
   * @return Reference id, or <code>null</code> if no reference exists
   */
  public Long get_id() { return get_reference_id(); }


  /**
   * Populates object with data referenced by submitted reference id
   *
   * @param conn An active connection to the database
   * @param reference_id Reference id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error, 
   * or if no reference record found for reference_id
   */ 
  public void get_information( DBconnection conn, Long reference_id ) throws SQLException {      
    if ( reference_id != null ) {

      // only create TfcReference if null - will be populated by sub-class otherwise
      if ( reference == null ) { 
	reference = new TfcReference( conn, reference_id );
      }

      if ( get_reference_id() != null ) {
	urls = new URLReferenceCollection( conn, reference_id );
	communities = new ListCommunityCollection( conn, reference_id, "reference" );
	keywords = new KeywordCollection( conn, reference_id, reference.get_table_name() );
        setAnnotationCount( conn, reference_id );   
      }
    }
  }

  /**
   * Retrieves all community records associated to this reference
   *
   * @return Community records for reference as an <code>Iterator</code>
   * of <code>ListCommunity</code> objects, or <code>null</code> if no 
   * communities associated with this reference
   */
  public Iterator getCommunities() { 
    return ( hasCommunities() ) ? communities.iterator() : null;
  }

  /**
   * Determines if reference has associated community references
   *
   * @return <code>true</code> if reference has associated community 
   * records or <code>false</code> if reference has no associated
   * community records
   */
  public boolean hasCommunities() {
    return ( communities != null && !communities.isEmpty() );
  }


  /**
   * Determines if reference has associated keywords
   *
   * @return <code>true</code> if reference has associated keywords, or <code>false</code>
   * if no keywords associated to reference
   */
  public boolean hasKeywords() {
    return ( keywords != null && !keywords.isEmpty() );
  }

  /**
   * Retrieves all keywords associated to reference
   *
   * @return Keywords for reference as an <code>Iterator</code> of
   * <code>KeywordLite</code> objects, or <code>null</code> if no keywords
   * associated to reference
   */
  public Iterator getKeywords() {
    return ( hasKeywords() ) ? keywords.iterator() : null;
  }
   

  /**
   * Set internal reference for TfcReference to concrete class (inheriting from TfcReference) 
   * created in sub-class
   *
   * @param referenceObject Object to set as TfcReference object reference
   */
  protected void populateBaseObject( TfcReference referenceObject ) {
    if ( referenceObject != null ) {
      this.reference = referenceObject;
    }
  }

  
  /**
   * Retrieves TAIR accession number for this object.  Implemented here
   * to satisfy the <code>Accessible</code> interface
   * 
   * @return TAIR accession number for this object
   */
  public final String getAccession() { return AccessionManager.getAccession( this ); }

  /**
   * Retrieves element ty   String elementType = pe of this object for use in creating TAIR accession 
   * number. Implemented here to satisfy the <code>Accessible</code> interface.  This implementation
   * returns the reference type value for the object.  Sub-classes should override this method
   * if a different value should be returned
   *
   * @return Object's element type (reference type) for use in creating TAIR accession
   */
  public String getElementType() { return get_reference_type(); }

  /**
   * Retrieves object's super id (reference_id) for use in creating TAIR accession
   * number. Implemented here to satisfy the <code>Accessible</code> interface
   *
   * @return ID to use for creating TAIR accession number for this object
   */
  public final Long getSuperID() { return get_reference_id(); }


  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** ReferenceDetail content test ******" );

    System.out.println( "accession: " + getAccession() );

    if ( reference != null ) {
      reference.test();
      
      if ( hasURLs() ) {
	urls.test();
      }

      /*if ( hasCommunities() ) {
	communities.test();
      }*/

      if ( hasKeywords() ) {
	keywords.test();
      }
						    
    }
    System.out.println( "**** ReferenceDetail content test end ****" );
  }
  

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    
    try{

      DBconnection conn = new DBconnection();
      Long id = new Long( 4 );
      ReferenceDetail reference = new ReferenceDetail( conn, id );
      reference.test();

    } catch( Exception e ) {
      e.printStackTrace();
    }
  }
  
}
  








