//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2005/05/03 21:27:24 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcKeyword;
import org.tair.tfc.TfcRelationshipType;
import org.tair.tfc.TfcReferenceKeyword;

import org.tair.utilities.InvalidActionException;

/**
 * LoadableReferenceKeyword extends TfcKeyword for use in creating and storing
 * associations between a reference and a keyword.  When creating new 
 * associations, the object can be created initially with keyword data; 
 * additional data such as reference id, relationship type and annotation type
 * must be submitted before storing new record to the database through store
 * method.
 *
 */

public class LoadableReferenceKeyword extends TfcKeyword {
    
    private TfcReferenceKeyword refKeyword;

    private TfcRelationshipType relationshipType;

    private TfcAnnotationType annotationType;

    /**
     * Creates an empty instance of LoadableBioSampleKeyword
     */
    public LoadableReferenceKeyword() {
	super();
	refKeyword = new TfcReferenceKeyword();  
        annotationType = new TfcAnnotationType();
        relationshipType =  new TfcRelationshipType(); 
    }
     
    /**
     * Creates an instance of LoadableReferenceKeyword that represents
     * keyword data referenced by submitted id.  Join information, such
     * as what reference id, relationship type and annotation type, that
     * defines the keywords association to a Reference must be populated
     * externally.
     *
     * <p>
     * This method is used when creating keywords for use in creating
     * associations to a reference.  A new association to the reference
     * will be created when store is called
     *
     * @param conn An active connection to the database
     * @param keyword_id Keyword id to retrieve data for
     */
    public LoadableReferenceKeyword( DBconnection conn,
				     Long keyword_id ) 
	throws SQLException {

	super( conn, keyword_id );
        refKeyword = new TfcReferenceKeyword();
	refKeyword.set_keyword_id( keyword_id ); 
        annotationType = new TfcAnnotationType();
        relationshipType =  new TfcRelationshipType();  
    }


    /**
     * Creates an instance of LoadableReferenceKeyword that represents
     * the join between submitted reference id and keyword id with submitted
     * relationship type
     *
     * @param conn An active connection to the database
     * @param reference_id to retrieve data for
     * @param keyword_id Keyword id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableReferenceKeyword( DBconnection conn,
				     Long reference_id,
				     Long keyword_id,
				     Long relationship_type_id ) 
	throws SQLException {
	
	super( conn, keyword_id );
	refKeyword = new TfcReferenceKeyword( conn,
					      reference_id,
					      keyword_id,
					      relationship_type_id );
	
	relationshipType = 
	    new TfcRelationshipType( conn, relationship_type_id );

	annotationType = 
	    new TfcAnnotationType( conn, 
				   refKeyword.get_annotation_type_id() );
    }


    /**
     * Overrides superclass method to ensure that keyword id is set both for
     * parent member variable as well as for object that handles reference's
     * association to keyword
     *
     * @param keyword_id Keyword id to set
     */
    public void set_keyword_id( Long keyword_id ) {
	super.set_keyword_id( keyword_id );
	
	// join object will be null if this method happens to be called from
	// super class constructor -- not a problem, though, just skip for now
	if ( refKeyword != null ) {
	    refKeyword.set_keyword_id( keyword_id );
	}
    }


    //
    // TfcBioSampleKeyword wrappers
    // 
    public void set_reference_id( Long id ) {
	refKeyword.set_reference_id( id );
    }

    public Long get_reference_id() {
	return refKeyword.get_reference_id();
    }

    public Long get_relationship_type_id() {
	return refKeyword.get_relationship_type_id()== null ?null : refKeyword.get_relationship_type_id();
    }


    // 
    // TfcAnnotationType wrapper
    //
    public Long get_annotation_type_id() {
	return annotationType.getAnnotationTypeID()== null ? null :annotationType.getAnnotationTypeID() ;
    }


    /**
     * Sets relationship type data wholesale for bio sample's relationship
     * to keyword. This is useful when using object to create new associations
     * between a bio sample and a keyword.
     *
     * @param type Relationship type data for bio sample to keyword association
     */
    public void setRelationshipType( TfcRelationshipType type ) {
	this.relationshipType = type;
 
	// set type for bio sample/keyword association object to keep
	// in synch.
	Long typeID = relationshipType.get_relationship_type_id();
	refKeyword.set_relationship_type_id( typeID );
    }


    /**
     * Sets annotation type data wholesale for reference's relationship
     * to keyword. This is useful when using object to create new associations
     * between a reference and a keyword.
     *
     * @param type Annotation type data for bio sample to keyword association
     */
    public void setAnnotationType( TfcAnnotationType type ) {
	this.annotationType = type;

	// set type for bio sample/keyword association object to keep
	// in synch.
	Long typeID = annotationType.getAnnotationTypeID();
	refKeyword.set_annotation_type_id( typeID );
    }


    /**
     * Stores association between keyword and reference with set values
     * for relationship type and annotation type.  This is always done as
     * an INSERT. 
     *
     * <p>
     * NOTE: Keyword, annotation type and relationship type data is not
     * updated at all in this method, only the association of those elements
     * to Reference is created.
     *
     * @param conn DB connection with INSERT privileges
     * @throws InvalidActionException if any data required for INSERT is missing
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// Tfc class will throw exception if required data elements have not
	// been set
	refKeyword.store( conn ); 
    }

    /**
     * Overrides equals method in Object to compare LoadableReferenceKeyword
     * Submitted object will be considered equal to this object if
     * it is a  LoadableReferenceKeyword with the same ids .
     * This implementation is necessary for checking whether a given LoadableReferenceKeyword
     * is contained by a collection or not, when two items may represent the same
     * data without actually being the same object instance
     *
     * @param  LoadableReferenceKeyword Object to check for equality
     * @return <code>true</code> if submitted object is equal to this object, or
     * <code>false</code> if submitted object is not equals to this object
     */  
    public boolean equals ( Object ref_key ) {
        boolean isEqual = false;
         
        if ( ref_key instanceof LoadableReferenceKeyword ) {
            LoadableReferenceKeyword ref = (LoadableReferenceKeyword)ref_key;
            if (  idsEqual( get_keyword_id(),ref.get_keyword_id() ) && 
                  idsEqual( get_reference_id(), ref. get_reference_id () ) &&
                  idsEqual( get_relationship_type_id(), ref. get_relationship_type_id() ) &&
                  idsEqual( get_annotation_type_id(), ref.get_annotation_type_id()) 
            ) {    
		isEqual = true;   
            }       
        }
        
        return isEqual;
    }

    /**
     * Utility method to compare two ids for equality.
     *
     * @param id_1 ID to compare to id_2
     * @param id_2 ID to compare to id_1
     * @return <code>true</code> if two ids are equal, <code>false</code>
     * if two ids are not equal
     */
    // ids are considered as equal if one of them is null
    private boolean idsEqual( Long id_1, Long id_2 ) {
        boolean isEqual = ( id_1 == null  || 
                            id_2 == null  ||
                           ( id_1 != null && id_2 != null &&  id_1.equals( id_2 )));
        return isEqual;
    } 
  
    public String toString (){
        return  " reference :"+get_reference_id()+
                " annotation : "+get_annotation_type_id()+ 
                " keyword : " + get_keyword_id()+ 
                " relation:"+get_relationship_type_id();
    }
}
