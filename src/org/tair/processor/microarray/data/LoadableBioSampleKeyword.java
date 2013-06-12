//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:28:38 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcKeyword;
import org.tair.tfc.TfcRelationshipType;
import org.tair.tfc.TfcBioSampleKeyword;

import org.tair.utilities.InvalidActionException;

/**
 * LoadableBioSampleKeyword extends TfcKeyword for use in creating and storing
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

public class LoadableBioSampleKeyword extends TfcKeyword {
    
    private TfcBioSampleKeyword bioSampleKeyword;

    private TfcRelationshipType relationshipType;

    private TfcAnnotationType annotationType;

    /**
     * Creates an empty instance of LoadableBioSampleKeyword
     */
    public LoadableBioSampleKeyword() {
	super();
	bioSampleKeyword = new TfcBioSampleKeyword();
    }
     

    /**
     * Creates an instance of LoadableBioSampleKeyword that represents
     * keyword data referenced by submitted id.  Join information, such
     * as what bio sample id, relationship type and annotation type, that
     * defines the keywords association to a BioSample must be populated
     * externally.
     *
     * <p>
     * This method is used when creating keywords for use in creating
     * associations to a bio sample.  A new association to the bio sample
     * will be created when store is called
     *
     * @param conn An active connection to the database
     * @param keyword_id Keyword id to retrieve data for
     */
    public LoadableBioSampleKeyword( DBconnection conn,
				     Long keyword_id ) 
	throws SQLException {

	super( conn, keyword_id );

	// set keyword id and annotation type id in join table class
	bioSampleKeyword = new TfcBioSampleKeyword();
	bioSampleKeyword.set_keyword_id( keyword_id );
    }


    /**
     * Creates an instance of LoadableBioSampleKeyword that represents
     * the join between submitted bio sample id and keyword id with submitted
     * relationship type
     *
     * @param conn An active connection to the database
     * @param bio_sample_id bio sample id to retrieve data for
     * @param keyword_id Keyword id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableBioSampleKeyword( DBconnection conn,
				     Long bio_sample_id,
				     Long keyword_id,
				     Long relationship_type_id ) 
	throws SQLException {
	
	super( conn, keyword_id );
	bioSampleKeyword = new TfcBioSampleKeyword( conn,
						    bio_sample_id,
						    keyword_id,
						    relationship_type_id );
	
	relationshipType = 
	    new TfcRelationshipType( conn, relationship_type_id );

	annotationType = 
	    new TfcAnnotationType( conn, 
				   bioSampleKeyword.get_annotation_type_id() );
    }


    /**
     * Overrides superclass method to ensure that keyword id is set both for
     * parent member variable as well as for object that handles bio sample's
     * association to keyword
     *
     * @param keyword_id Keyword id to set
     */
    public void set_keyword_id( Long keyword_id ) {
	super.set_keyword_id( keyword_id );
	
	// join object will be null if this method happens to be called from
	// super class constructor -- not a problem, though, just skip for now
	if ( bioSampleKeyword != null ) {
	    bioSampleKeyword.set_keyword_id( keyword_id );
	}
    }


    //
    // TfcBioSampleKeyword wrappers
    // 
    public void set_bio_sample_id( Long id ) {
	bioSampleKeyword.set_bio_sample_id( id );
    }

    public Long get_bio_sample_id() {
	return bioSampleKeyword.get_bio_sample_id();
    }

    public Long get_relationship_type_id() {
	return bioSampleKeyword.get_relationship_type_id();
    }


    // 
    // TfcAnnotationType wrapper
    //
    public Long get_annotation_type_id() {
	return annotationType.getAnnotationTypeID();
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
	bioSampleKeyword.set_relationship_type_id( typeID );
    }


    /**
     * Sets annotation type data wholesale for bio sample's relationship
     * to keyword. This is useful when using object to create new associations
     * between a bio sample and a keyword.
     *
     * @param type Annotation type data for bio sample to keyword association
     */
    public void setAnnotationType( TfcAnnotationType type ) {
	this.annotationType = type;

	// set type for bio sample/keyword association object to keep
	// in synch.
	Long typeID = annotationType.getAnnotationTypeID();
	bioSampleKeyword.set_annotation_type_id( typeID );
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
	bioSampleKeyword.store( conn ); 
    }
     

}
