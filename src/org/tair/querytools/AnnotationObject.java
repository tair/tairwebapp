/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

/**
 * AnnotationObject extends TfcAnnotation to include complete information
 * for an annotation.
 */
package org.tair.querytools;

import java.sql.SQLException;

import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnnotation;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;

public class AnnotationObject extends TfcAnnotation {

  // convenience property to easily present annotation source.  Will
  // either be person or organization name
  private String annotation_source = null;
    
  /**
   * Creates an empty instance of AnnotationObject for population externally
   */    
  public AnnotationObject() {  }

    
  /**
   * Creates an instance of AnnotationObject that contains data for the
   * annotation with submitted annotation id. Constructor also retrieves
   * community data as a BsCommunity.
   * 
   * @param db An active connection to the database
   * @param annotation_id The annotation id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public AnnotationObject(DBconnection db, Long annotation_id)
      throws SQLException {
    super(db, annotation_id);
    if (annotation_id != null) {
      CommunityDelegate delegate =
        CommunityDelegateFactory.getCommunityDelegate();
      IPrimaryKey key =
        CommunityFactory.getCommunityPrimaryKey(get_annotated_by_id());
      BsCommunity community = delegate.getObject((SequencePrimaryKey)key);
      annotation_source = community.getName();
    }
  }

  /**
   * @return Annotation source (either person or organization name)
   */ 
  public String get_annotation_source() {
    return annotation_source;
  }

  /**
   * test AnnotationObject content
   */
  public void test() {
    System.out.println( "****** AnnotationObject content test ******" );
    super.test();
    
    System.out.println( "annotation_source is " + get_annotation_source() );
    System.out.println( "**** AnnotationObject content test end ****" );
  }


  public static void main( String[] args ) {
    try{
      DBconnection connection = new DBconnection();
      //Long test_id = new Long( 337 ); //for person_object
      Long test_id = new Long( 275 ); //for organization_object
      AnnotationObject annotation = new AnnotationObject( connection,test_id );
      annotation.test();
      System.out.println( "*******************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }   

  }

}
  








