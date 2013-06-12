//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.2 $
// $Date: 2004/11/18 20:35:45 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcKeyword;
import org.tair.tfc.TfcRelationshipType;
import org.tair.tfc.TfcTairObjectKeyword;

import org.tair.utilities.InvalidActionException;

/**
 * LoadableTairObjectKeyword extends TfcKeyword for use in creating and storing
 * associations between a tair object and a keyword.  When creating new 
 * associations, the object can be created initially with keyword data; 
 * additional data such as tair object id, child table and relationship type
 * must be submitted before storing new record to the database through store
 * method.
 *
 * <p>
 * There are other composite classes that handle this association, however 
 * this class is designed to be used specifically for inserting or updating
 * data instead of the read only versions used on detail pages that contain
 * lots of behavior and data that's not needed in this context.
 */

public class LoadableTairObjectKeyword extends TfcKeyword {
    
    private TfcTairObjectKeyword tairObjectKeyword;

    private TfcRelationshipType relationshipType;

    private TfcAnnotationType annotationType;

    /**
     * Creates an empty instance of LoadableTairObjectKeyword
     */
    public LoadableTairObjectKeyword() {
	super();
	tairObjectKeyword = new TfcTairObjectKeyword();
    }
     

    /**
     * Creates an instance of LoadableTairObjectKeyword that represents
     * keyword data referenced by submitted id.  Join information, such
     * as what tair object, relationship type and annotation type, that
     * defines the keywords association to a TairObject must be populated
     * externally.
     *
     * <p>
     * This method is used when creating keywords for use in creating
     * associations to a tair object.  A new association to the tair object
     * will be created when store is called
     *
     * @param conn An active connection to the database
     * @param keyword_id Keyword id to retrieve data for
     */
    public LoadableTairObjectKeyword( DBconnection conn,
				      Long keyword_id ) 
	throws SQLException {

	super( conn, keyword_id );

	// set keyword id in join table class
	tairObjectKeyword = new TfcTairObjectKeyword();
	tairObjectKeyword.set_keyword_id( keyword_id );
    }


    /**
     * Creates an instance of LoadableTairObjectKeyword that represents
     * the join between submitted tair object id and keyword id with submitted
     * relationship type
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @param keyword_id Keyword id to retrieve data for
     * @param relationship_type_id Relationship type id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableTairObjectKeyword( DBconnection conn,
				      Long tair_object_id,
				      Long keyword_id,
				      Long relationship_type_id ) 
	throws SQLException {

	super( conn, keyword_id );

	tairObjectKeyword = new TfcTairObjectKeyword( conn,
						      tair_object_id,
						      keyword_id,
						      relationship_type_id );

	relationshipType = 
	    new TfcRelationshipType( conn, relationship_type_id );

	annotationType = 
	    new TfcAnnotationType( conn, 
				   get_annotation_type_id() );
    }

    /**
     * Overrides superclass method to ensure that keyword id is set both for
     * parent member variable as well as for object that handles tair object's
     * association to keyword
     *
     * @param keyword_id Keyword id to set
     */
    public void set_keyword_id( Long keyword_id ) {
	super.set_keyword_id( keyword_id );
	
	// join object will be null if this method happens to be called from
	// super class constructor -- not a problem, though, just skip for now
	if ( tairObjectKeyword != null ) {
	    tairObjectKeyword.set_keyword_id( keyword_id );
	}
    }


    //
    // TfcTairObjectKeyword wrappers
    // 
    public void set_tair_object_id( Long id ) {
	tairObjectKeyword.set_tair_object_id( id );
    }

    public Long get_tair_object_id() {
	return tairObjectKeyword.get_tair_object_id();
    }

    public Long get_relationship_type_id() {
	return tairObjectKeyword.get_relationship_type_id();
    }

    public Long get_annotation_type_id() {
	return tairObjectKeyword.get_annotation_type_id();
    }

    /**
     * Sets relationship type data wholesale for tair object's relationship
     * to keyword. This is useful when using object to create new associations
     * between a tair object and a keyword.
     *
     * @param type Relationship type data for tair object to
     * keyword association
     */
    public void setRelationshipType( TfcRelationshipType type ) {
	this.relationshipType = type;

	// set type for tair object/keyword association object to keep
	// in synch.
	Long typeID = relationshipType.get_relationship_type_id();
	tairObjectKeyword.set_relationship_type_id( typeID );
    }


    /**
     * Sets annotation type data wholesale for tair object's relationship
     * to keyword. This is useful when using object to create new associations
     * between a tair object and a keyword.
     *
     * @param type Annotation type data for tair object to keyword association
     */
    public void setAnnotationType( TfcAnnotationType type ) {
	this.annotationType = type;

	// set type for tair object/keyword association object to keep
	// in synch.
	Long typeID = annotationType.getAnnotationTypeID();
	tairObjectKeyword.set_annotation_type_id( typeID );
    }


    /**
     * Stores association between keyword and tair object with set values
     * for relationship type and annotation type.  This is always done as
     * an INSERT. 
     *
     * <p>
     * NOTE: Keyword, annotation type and relationship type data is not
     * updated at all in this method, only the association of those elements
     * to TairObject is created.
     *
     * @param conn DB connection with INSERT privileges
     * @throws InvalidActionException if any data required for INSERT is missing
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// Tfc class will throw exception if required data elements have not
	// been set
	tairObjectKeyword.store( conn ); 
    }
     
    public String toString (){
	return ""+get_tair_object_id() + " keyword id "+ get_keyword_id() + " keyword "+get_keyword();
    }

}
