//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2005/05/03 21:27:24 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcRelationshipType;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;

/**
 * LoadableReferenceKeywordCollection is a custom collection that stores 
 * keywords associated to a reference with a specific keyword type. 
 * Items are stored as <code>LoadableReferenceKeyword</code> objects.
 *
 * <p>
 * This collection is used for creating and editing reference keyword
 * associations. 
 *
 * <p> 
 * All keyword items in collection will be of the same keyword type and
 * be related to reference with the same relationship type. All keywords
 * associated to reference will have the same annotation type. Keyword 
 * collection is keyword/relationship type specific so that reference 
 * objects can use different collections handle groups of keyword 
 * associations together easily without having to constantly  filter 
 * using type criteria.
 */


public class LoadableReferenceKeywordCollection {

    private ArrayList keywords ;

    private Long referenceId ; 
   
    // keyword type id 
    private String keywordTypeID;
    
    // relationship type id for all keywords in collection
    private Long relationshipTypeID;

    public LoadableReferenceKeywordCollection(  ) {
     	keywords = new ArrayList();
    }

    public LoadableReferenceKeywordCollection( String keywordTypeID ) {
	this.keywordTypeID = keywordTypeID;
	keywords = new ArrayList();
    }

    /**
     * Creates an empty instance of LoadableBioSampleKeywordCollection
     * that contains all keywords of submitted keyword type associated 
     * to submitted bio sample id with submitted relationship type.
     *
     * @param conn An active connection to the database
     * @param tair_object_id bio sample id to retrieve data for
     * @param relationship_type_id Relationship type id to retrieve data for
     * @param keyword_type_ids Keyword type ids to retrieve
     * @throws SQLException if a database error occurs
     */
    public LoadableReferenceKeywordCollection( DBconnection conn,
					       Long reference_id,
					       Long relationship_type_id,
					       String keyword_type_id )
	throws SQLException {

	this.referenceId = reference_id;
	this.keywordTypeID = keyword_type_id;
	this.relationshipTypeID = relationship_type_id;
       
	keywords = new ArrayList();

	populate( conn );
    }

    /**
     * Retrieves keyword ids of requested keyword type associated to
     * protocol_reference_id with requested relationship type and creates 
     * LoadableProtocolKeyword objects for each association
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {
	
	ArrayList keywordIDs = null;
	
        String query =
	    "SELECT k.keyword_id " +
	    "FROM Reference_Keyword bk, Keyword k " +
	    "WHERE bk.keyword_id = k.keyword_id " +
	    "AND bk.relationship_type_id = " + relationshipTypeID.toString() + " " +
	    "AND bk.reference_id = " + referenceId.toString() + " " +
	    "AND k.keyword_type_id = " +
            TextConverter.dbQuote ( keywordTypeID );

       
	conn.setQuery( query );
	
	ResultSet results = conn.getResultSet();
        while ( results.next() ) {
	    if ( keywordIDs == null ) {
		keywordIDs = new ArrayList();
	    }

	    keywordIDs.add( new Long( results.getLong( "keyword_id" ) ) );
	}
	
	conn.releaseResources();

	// create one LoadableProtocolKeyword object for each 
	// protocol_reference/keyword/relationship type id combination
	if ( keywordIDs != null ) {
	    for ( Iterator iter = keywordIDs.iterator(); iter.hasNext(); ) {
		add( new LoadableReferenceKeyword( conn,
						   referenceId ,
						   (Long) iter.next(),
						   relationshipTypeID ) );
	    }
	}

    }

    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no elements in it; 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return keywords.isEmpty(); 
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() {
	return keywords.size(); 
    }


    /**
     * Retrieves element at supplied index.
     *
     * @return element at supplied index, or <code>null</code> if no element at 
     * supplied index
     */
    public LoadableReferenceKeyword get( int index ) { 
	return (LoadableReferenceKeyword) keywords.get( index ); 
    }


    /**
     * Adds supplied element to collection.
     * 
     * @param keyword element to add to collection
     */
    public void add( LoadableReferenceKeyword keyword ) {
        if ( ! contains (keyword ) ){
            keywords.add( keyword ); 
        }
    }

    /**
     * Removes supplied element from collection.
     *
     * @param keyword element to remove from collection
     */
    public void remove( LoadableReferenceKeyword keyword ) { 
	keywords.remove( keyword ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( LoadableReferenceKeyword keyword ) { 
	return keywords.contains( keyword ); 
    }


    /**
     * Retrieves all elements in collection.
     *
     * @return All keywords in collection as an <code>Iterator</code> of 
     * <code>LoadableProtocolKeyword</code> objects, or <code>null</code> 
     * if no elements in collection. 
     */
    public Iterator iterator() { 
	return ( !keywords.isEmpty() ) ? keywords.iterator() : null; 
    }


    /**
     * Sets protocol_reference_id for all items in collection. This must be done 
     * explicitly when storing new keyword associations for a protocol.
     *
     * @param reference_id to associate all keywords in 
     * collection to
     */
    public void setReferenceID( Long refID ) {

        this.referenceId = refID;

        if ( !isEmpty() ) {
	    LoadableReferenceKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableReferenceKeyword) iter.next();
		keyword.set_reference_id( refID );
            }
        }
    }


    /**
     * Sets relationship type for all items in collection. This must be done 
     * explicitly when storing new keyword associations for a bio sample.
     *
     * @param relationshipType Relationship type to use when associating
     * keywords to bio sample
     */
    public void setRelationshipType( TfcRelationshipType relationshipType ) {
	
        this.relationshipTypeID = relationshipType.get_relationship_type_id();

        if ( !isEmpty() ) {
	    LoadableReferenceKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableReferenceKeyword) iter.next();
		keyword.setRelationshipType( relationshipType );
            }
        }
    }

    /**
     * Sets annotation type data for all items in collection. This must be done 
     * explicitly when storing new keyword associations for a bio sample
     *
     * @param annotationType Annotation type to use when associating
     * keywords to bio sample
     */
    public void setAnnotationType( TfcAnnotationType annotationType ) {
        if ( !isEmpty() ) {
	    LoadableReferenceKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableReferenceKeyword) iter.next();
		keyword.setAnnotationType( annotationType );
            }
        }
    }


    /**
     * Stores collection to the database by creating associations between reference
     * and all keywords of specified type in collection with specified
     * relationship type. Before storing individual associations, this method
     * will check if the same associations exists for reference id to keywords
     * of specified type with relationship type.
     *
     * <p>
     * If any associations to be stored are to keywords that have a keyword
     * type different than the type set for collection, InvalidActionException
     * will be thrown.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if any objects in collection are missing
     * required data.
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {
        if ( !isEmpty() ) {
           
            Iterator iter = iterator();
            LoadableReferenceKeyword keyword = null;
            while ( iter.hasNext() ) {
                keyword = (LoadableReferenceKeyword) iter.next();
		
                keyword.store( conn );
            }
        }
    }
   
    public String toString (){
        StringBuffer returnS = new StringBuffer();
      
	for (int i  = 0; i < size(); i++ ){
            returnS.append ( get(i) ); 
        }
        return returnS.toString();
    }

}


