//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2005/05/03 21:14:48 $
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
 * LoadableBioSampleKeywordCollection is a custom collection that stores 
 * keywords associated to a bio sample with a specific keyword type. 
 * Items are stored as <code>LoadableBioSampleKeyword</code> objects.
 *
 * <p>
 * This collection is used for creating and editing bio sample keyword
 * associations. 
 *
 * <p> 
 * All keyword items in collection will be of the same keyword type and
 * be related to bio sample with the same relationship type. All keywords
 * associated to bio sample will have the same annotation type. Keyword 
 * collection is keyword/relationship type specific so that bio sample 
 * objects can use different collections handle groups of keyword 
 * associations together easily without having to constantly  filter 
 * using type criteria.
 */


public class LoadableBioSampleKeywordCollection {

    private ArrayList keywords;

    // bio sample id that keywords in collection are related to
    // all previous rows in linking table)
    private Long bioSampleID;

    // keyword type id for all keywords in collection
    private List keywordTypeIDs;
    
    // relationship type id for all keywords in collection
    private Long relationshipTypeID;


    /**
     * Creates an empty instance of LoadableBioSampleKeywordCollection to
     * represents keywords of submitted type associated to a bio sample
     *
     * @param keywordTypeID Keyword type id of keywords collection will
     * represent.
     */
    public LoadableBioSampleKeywordCollection( List keywordTypeIDs ) {
	this.keywordTypeIDs = keywordTypeIDs;
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
    public LoadableBioSampleKeywordCollection( DBconnection conn,
					       Long bio_sample_id,
					       Long relationship_type_id,
					       List keyword_type_ids )
	throws SQLException {

	this.bioSampleID = bio_sample_id;
	this.keywordTypeIDs = keyword_type_ids;
	this.relationshipTypeID = relationship_type_id;

	keywords = new ArrayList();

	populate( conn );
    }

    /**
     * Retrieves keyword ids of requested keyword type associated to
     * bio_sample_id with requested relationship type and creates 
     * LoadableBioSampleKeyword objects for each association
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {
	
	ArrayList keywordIDs = null;
	
        String query =
	    "SELECT k.keyword_id, k.keyword_type_id " +
	    "FROM BioSample_Keyword bk, Keyword k " +
	    "WHERE bk.keyword_id = k.keyword_id " +
	    "AND bk.relationship_type_id = " + relationshipTypeID.toString() + " " +
	    "AND bk.bio_sample_id = " + bioSampleID.toString() + " " +
	    "AND k.keyword_type_id IN ( " + 
	    makeKeywordTypeString(keywordTypeIDs) + " )" ;
       
	System.out.println( "query:" + query );

	conn.setQuery( query );
	
	ResultSet results = conn.getResultSet();
        while ( results.next() ) {
	    if ( keywordIDs == null ) {
		keywordIDs = new ArrayList();
	    }

	    keywordIDs.add( new Long( results.getLong( "keyword_id" ) ) );
	}
	
	conn.releaseResources();

	// create one LoadableBioSampleKeyword object for each 
	// biosample/keyword/relationship type id combination
	if ( keywordIDs != null ) {
	    for ( Iterator iter = keywordIDs.iterator(); iter.hasNext(); ) {
		add( new LoadableBioSampleKeyword( conn,
						    bioSampleID,
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
    public LoadableBioSampleKeyword get( int index ) { 
	return (LoadableBioSampleKeyword) keywords.get( index ); 
    }


    /**
     * Adds supplied element to collection.
     * 
     * @param keyword element to add to collection
     */
    public void add( LoadableBioSampleKeyword keyword ) {
	keywords.add( keyword ); 
    }

    /**
     * Removes supplied element from collection.
     *
     * @param keyword element to remove from collection
     */
    public void remove( LoadableBioSampleKeyword keyword ) { 
	keywords.remove( keyword ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( LoadableBioSampleKeyword keyword ) { 
	return keywords.contains( keyword ); 
    }


    /**
     * Retrieves all elements in collection.
     *
     * @return All keywords in collection as an <code>Iterator</code> of 
     * <code>LoadableBioSampleKeyword</code> objects, or <code>null</code> 
     * if no elements in collection. 
     */
    public Iterator iterator() { 
	return ( !keywords.isEmpty() ) ? keywords.iterator() : null; 
    }


    /**
     * Sets bio sample id for all items in collection. This must be done 
     * explicitly when storing new keyword associations for a bio sample.
     *
     * @param bio_sample_id bio sample id to associate all keywords in 
     * collection to
     */
    public void setBioSampleID( Long bioSampleID ) {

        this.bioSampleID = bioSampleID;

        if ( !isEmpty() ) {
	    LoadableBioSampleKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableBioSampleKeyword) iter.next();
		keyword.set_bio_sample_id( bioSampleID );
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
	    LoadableBioSampleKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableBioSampleKeyword) iter.next();
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
	    LoadableBioSampleKeyword keyword = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		keyword = (LoadableBioSampleKeyword) iter.next();
		keyword.setAnnotationType( annotationType );
            }
        }
    }




    /**
     * Stores collection to the database by creating associations between bio 
     * sample and all keywords of specified type in collection with specified
     * relationship type. Before storing individual associations, this method
     * will first DELETE any previous associations for bio sample id to keywords
     * of specified type with relationship type. This is done to ensure that 
     * only the relationships in this collection are persisted. If collection
     * is empty when store is  called, only the DELETE will be carried out.
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
	
        // first delete any previous associations
        delete( conn );

        if ( !isEmpty() ) {
            Iterator iter = iterator();
            LoadableBioSampleKeyword keyword = null;

            while ( iter.hasNext() ) {
                keyword = (LoadableBioSampleKeyword) iter.next();
                keyword.store( conn );
            }
        }
    }


    /**
     * Deletes all associations to specific type of keywords with relationship
     * type for bio sample id this collection represents. 
     */
    public void delete( DBconnection conn ) throws SQLException {

        String query = 
            "DELETE BioSample_Keyword FROM Keyword k " +
            "WHERE BioSample_Keyword.keyword_id = k.keyword_id " +
	    "AND k.keyword_type_id IN (" +
 	     makeKeywordTypeString(keywordTypeIDs) + " )  " +
	    "AND BioSample_Keyword.bio_sample_id = ? " +
	    "AND BioSample_Keyword.relationship_type_id = ?";
	
        conn.setQuery( query );
	conn.setQueryVariable( 1, bioSampleID );
	conn.setQueryVariable( 2, relationshipTypeID );
	
        conn.executeUpdate();
        conn.releaseResources();
    }

    private String makeKeywordTypeString ( List types ){ 
        if (types== null  || types.size() == 0)
            return "";
        if (types.size() == 1){
            return TextConverter.dbQuote ((String)types.get(0));
        }       

        StringBuffer result = new StringBuffer("" + TextConverter.dbQuote ( (String)types.get(0)));
        for (int i = 1; i < types.size(); i++) {
            result.append(",");
            result.append(  TextConverter.dbQuote( (String)types.get(i) )) ;
        }
        return result.toString();
    } 
}


