//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.2 $
// $Date: 2005/05/03 21:17:18 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;
import java.util.Iterator;

import org.tair.querytools.URLReferenceCollection;
import org.tair.querytools.ReferenceURL;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcProtocol;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcPublication;
import org.tair.tfc.TfcRelationshipType;
import org.tair.utilities.InvalidActionException;


/**
 * LoadableProtocol extends TfcProtocol to contain detailed information
 * about a protocol. LoadableProtocol is used by the microarray data
 * loading tool to handle the insertion of new protocol data as needed.
 * when parsing data files to populate an expression set
 */
 

public class LoadableProtocol extends TfcProtocol {

    /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = 7724588135148305425L;

    // URLs for protocol
    private URLReferenceCollection urls;

    // keywords associations for protocol
    private LoadableReferenceKeywordCollection keywords;   
    
    /**
     * Creates an empty instance of LoadableProtocol
     */
    public LoadableProtocol() {
	super();
    }


    /**
     * Creates an instance of LoadableProtocol that reflects the data
     * reference by submitted reference id
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableProtocol( DBconnection conn, Long reference_id ) 
	throws SQLException {
	
	super( conn, reference_id );
	urls = new URLReferenceCollection( conn, reference_id );

	if ( get_publication_id() != null ) {
	    Long referenceID = 
		TfcPublication.get_super_id( conn, get_publication_id() );
	    new TfcPublication( conn, referenceID );
	}

        populateKeywords( conn, reference_id );  
    }


    private void populateKeywords(DBconnection conn, Long reference_id ) 
        throws SQLException  {

        TfcRelationshipType relType = getProtocolRelType( conn );
        Long relTypeID = relType.get_relationship_type_id();
        keywords  = new LoadableReferenceKeywordCollection( conn,
							   reference_id,
                                                           relTypeID,
                                                           "meth" );
    }

    private TfcRelationshipType  getProtocolRelType(DBconnection conn )
	throws SQLException {
	
	TfcRelationshipType relationshipType = 
	    new  TfcRelationshipType( conn, 
				      "describes method", 
				      "Protocol" );
	
	return relationshipType;
    }	
    /**
     * Adds an url to be associated to protocol
     *
     * @param url url to associate to protocol
     */
    public void addURL( ReferenceURL url ) {
	if ( urls == null ) {
	    urls = new URLReferenceCollection();

	    // make sure url hasn't already been added
	} else {
	    if ( !urls.contains( url ) ) {
		urls.add( url );
	    }
	}
    }

    /**
     * Removes url association to protocol
     *
     * @param url url to remove
     */
    public void removeURL( ReferenceURL url ) {
	if ( hasURLs() ) {
	    urls.remove( url );
	}
    }

    /**
     * Determines if protocol has associated urls
     *
     * @return <code>true</code> if protocol has associated URLs, 
     * <code>false</code> if no urls associated to protocol
     */
    public boolean hasURLs() {
	return ( urls != null && !urls.isEmpty() );
    }

   

    /**
     * Retrieves urls associated to protocol
     *
     * @return urls associated to protocol as an <code>Iterator</code>
     * of <code>ReferenceURL</code> objects or <code>null</code> if no 
     * urls associated to protocol
     */
    public Iterator getURLs() {
	return hasURLs() ? urls.iterator() : null;
    }

   
    public void addKeyword( LoadableReferenceKeyword keyword ) {
	if ( keywords == null ) {
	    keywords = new LoadableReferenceKeywordCollection();
	}
	   
	keywords.add(keyword );
   }

    public boolean hasKeywords() {
	return ( keywords != null && !keywords.isEmpty() );
    }


    /**
     * Stores protocol data to the database
     *
     * @param conn An active connection to the database
     * @throws InvalidActionException if data required for storing has 
     * not been set for protocol or associated data object
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {
	
	// store protocol data itself
	super.store( conn );
	
	// set protocol's reference id for all urls to store association
	if ( hasURLs() ) {
	    urls.setReferenceID( get_reference_id() );
	    urls.store( conn );
	}
       
        
        if ( hasKeywords() ){
            
            // all keyword associations to protocol should
	    // have same annotation type
	    TfcAnnotationType annotationType = 
		new TfcAnnotationType( conn, "Protocol" );
            
           // all keyword associations to protocol should have the
	    // same relationship type
	    TfcRelationshipType relationshipType = getProtocolRelType(conn ); 
            keywords.setReferenceID( get_reference_id() );
	    keywords.setAnnotationType( annotationType );
	    keywords.setRelationshipType( relationshipType );
	    keywords.store(conn );
	}
	// publication ????
    }
   
    public String toString() {
	return get_title() +" keywords: " + keywords ;
    }
    
}
