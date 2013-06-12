//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:28:41 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcRelationshipType;
import org.tair.utilities.InvalidActionException;


/**
 * LoadableTairObjectKeywordCollection is a custom collection that stores 
 * keywords associated to a tair object record with a specific relationship 
 * type. Items are stored as <code>LoadableTairObjectKeyword</code> objects.
 *
 * <p>
 * This collection is used for creating and editing tair object keyword
 * associations. 
 *
 * <p> 
 * All keyword items in collection will be associated to tair object with
 * the same relationship type. This is done to handle groups of keyword
 * associations together easily without having to constantly filter
 * using relationship type criteria.
 */


public class LoadableTairObjectKeywordCollection {

    private ArrayList keywords;

    // keep reference to tair object id that keywords in collection are
    // related to for use when storing collection (which first deletes
    // all previous rows in linking table)
    private Long tairObjectID;

    // keep reference to relationship type id that keywords in collection
    // are related to tair object id with for use when storing collection
    // (which first deletes all previous rows in linking table)
    private Long relationshipTypeID;


    /**
     * Creates an empty instance of LoadableTairObjectKeywordCollection
     */
    public LoadableTairObjectKeywordCollection() {
	keywords = new ArrayList();
    }

    /**
     * Creates an empty instance of LoadableTairObjectKeywordCollection
     * that contains all keywords associated to submitted tair object id
     * with submitted relationship type.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @param relationship_type_id Relationship type id to retrieve
     * @throws SQLException if a database error occurs
     */
    public LoadableTairObjectKeywordCollection( DBconnection conn,
						Long tair_object_id,
						Long relationship_type_id )
	throws SQLException {

	this.tairObjectID = tair_object_id;
	this.relationshipTypeID = relationship_type_id;

	keywords = new ArrayList();

	populate( conn );
    }

    /**
     * Retrieves keyword ids associated to tair_object_id with relationship type
     * id and creates LoadableTairObjectKeyword objects for each association
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {
	ArrayList keywordIDs = null;
	
	String query =
	    "SELECT keyword_id " +
	    "FROM TairObject_Keyword " +
	    "WHERE tair_object_id = ? " +
	    "AND relationship_type_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, tairObjectID );
	conn.setQueryVariable( 2, relationshipTypeID );

	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( keywordIDs == null ) {
		keywordIDs = new ArrayList();
	    }

	    keywordIDs.add( new Long( results.getLong( "keyword_id" ) ) );
	}
	conn.releaseResources();

	// create one LoadableTairObjectKeyword object for each 
	// tairobject/keyword/relationship type id combination
	if ( keywordIDs != null ) {
	    for ( Iterator iter = keywordIDs.iterator(); iter.hasNext(); ) {
		add( new LoadableTairObjectKeyword( conn,
						    tairObjectID,
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
    public LoadableTairObjectKeyword get( int index ) { 
	return (LoadableTairObjectKeyword) keywords.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param keyword element to add to collection
     */
    public void add( LoadableTairObjectKeyword keyword ) {
	keywords.add( keyword ); 
    }

    /**
     * Removes supplied element from collection.
     *
     * @param keyword element to remove from collection
     */
    public void remove( LoadableTairObjectKeyword keyword ) { 
	keywords.remove( keyword ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( LoadableTairObjectKeyword keyword ) { 
	return keywords.contains( keyword ); 
    }


    /**
     * Retrieves all elements in collection.
     *
     * @return All keywords in collection as an <code>Iterator</code> of 
     * <code>LoadableTairObjectKeyword</code> objects, or <code>null</code> 
     * if no elements in collection. 
     */
    public Iterator iterator() { 
	return ( !keywords.isEmpty() ) ? keywords.iterator() : null; 
    }


    /**
     * Sets tair object id for all items in collection. This must be done 
     * explicitly when storing new keyword associations for a tair object.
     *
     * @param tair_object_id Tair object id to associate all keywords in 
     * collection to
     */
    public void setTairObjectID( Long tairObjectID ) {

        this.tairObjectID = tairObjectID;

        if ( !isEmpty() ) {
	    LoadableTairObjectKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableTairObjectKeyword) iter.next();
		keyword.set_tair_object_id( tairObjectID );
            }
        }
    }


    /**
     * Sets relationship type data for all items in collection. This must be done 
     * explicitly when storing new keyword associations for a tair object.
     *
     * @param relationshipType Relationship type to use when associating
     * keywords to tair object
     */
    public void setRelationshipType( TfcRelationshipType relationshipType ) {
	
        this.relationshipTypeID = relationshipType.get_relationship_type_id();

        if ( !isEmpty() ) {
	    LoadableTairObjectKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableTairObjectKeyword) iter.next();
		keyword.setRelationshipType( relationshipType );
            }
        }
    }

    /**
     * Sets annotation type data for all items in collection. This must be done 
     * explicitly when storing new keyword associations for a tair object.
     *
     * @param annotationType Annotation type to use when associating
     * keywords to tair object
     */
    public void setAnnotationType( TfcAnnotationType annotationType ) {
        if ( !isEmpty() ) {
	    LoadableTairObjectKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableTairObjectKeyword) iter.next();
		keyword.setAnnotationType( annotationType );
            }
        }
    }

    /**
     * Stores collection to the database by creating associations between tair
     * object and all keywords in collection with specified relationship type.
     * Before storing individual associations, this method will first DELETE 
     * any previous associations for tair object id with relationship type.
     * This is done to ensure that only the relationships in this collection
     * are persisted.  If collection is empty when store is  called, only 
     * the DELETE will be carried out.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if any objects in collection are missing
     * required data
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {
	
        // first delete any previous associations
        delete( conn );

        if ( !isEmpty() ) {
            Iterator iter = iterator();
            LoadableTairObjectKeyword keyword = null;

            while ( iter.hasNext() ) {
                keyword = (LoadableTairObjectKeyword) iter.next();
                keyword.store( conn );
            }
        }
    }


    /**
     * Deletes all associations to keywords with relationship type for 
     * tair object id this collection represents. 
     */
    public void delete( DBconnection conn ) throws SQLException {

        String query = 
            "DELETE TairObject_Keyword " +
            "WHERE tair_object_id = ? " +
	    "AND relationship_type_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( 1, tairObjectID );
	conn.setQueryVariable( 2, relationshipTypeID );

        conn.executeUpdate();
        conn.releaseResources();
    }


}


