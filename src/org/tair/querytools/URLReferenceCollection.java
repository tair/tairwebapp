//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2004/07/06 16:31:28 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.math.BigInteger;
import java.sql.*;
import java.util.*;

import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.UrlDelegate;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * URLReferenceCollection is a custom collection that stores all urls associated
 * to a reference as a collection of <code>ReferenceURL</code> objects. 
 */

public class URLReferenceCollection {
    private ArrayList urls;


    // list of URLs that have been removed from collection since
    // it was created -- these are held until store() is called at which
    // point they will be deleted from the database
    private ArrayList removed;

    // reference id for all urls in collection
    private Long referenceID;

    /**
     * Creates an empty instance of URLReferenceCollection
     */
    public URLReferenceCollection() {
        urls = new ArrayList();
    }
  
    /**
     * Creates an instance of URLReferenceCollection that contains
     * all URLs associated with submitted reference id as
     * <code>ReferenceURL</code> objects
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve urls for
     * @throws SQLException if a database error occurs
     */
    public URLReferenceCollection( DBconnection conn, Long reference_id ) 
	throws SQLException {

        urls = new ArrayList();
	this.referenceID = reference_id;
	populate( conn );
    }

    /**
     * Retrieves url ids associated to reference and creates ReferenceURL
     * objects for each.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) 
	throws SQLException {

        ArrayList<BigInteger> ids = null;

        String query =
            "SELECT url_id " +
            "FROM Reference_URL " +
            "WHERE reference_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( referenceID );

        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList<BigInteger>();
            }
            ids.add(results.getBigDecimal( "url_id" ).toBigInteger());
        }
        conn.releaseResources();

        if ( ids != null && !ids.isEmpty() ) {
            Iterator<BigInteger> iter = ids.iterator();
	    ReferenceURL url = null;
            while ( iter.hasNext() ) {

		// create object with only URL info. then manually set
		// reference id to avoid another db query
                url = new ReferenceURL( conn, iter.next() );
		url.set_reference_id( referenceID );
                add( url );
            }
        }
    }


    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it; 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() {
	return urls.isEmpty(); 
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return urls.size();
    }

    /**
     * Retrieves element at supplied index as a <code>ReferenceURL</code> object
     *
     * @return Element at supplied index, or <code>null</code> if no element 
     * at supplied index
     */
    public ReferenceURL get( int index ) { 
	return (ReferenceURL) urls.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param url Element to add to collection
     */
    public void add( ReferenceURL url ) {
	urls.add( url );
    }

    /**
     * Removes supplied element from collection. This will delete the 
     * association between url and reference the next time store is
     * called. After association is deleted, URL itself will be deleted
     * if it is not associated to any other elements (community or reference).
     *
     * @param url Element to remove from collection
     */
    public void remove( ReferenceURL url ) {
	urls.remove( url );

	// add to list of items to be deleted next time store is called.
	if ( removed == null ) {
	    removed = new ArrayList();
	}
	removed.add( url );
    }

    /**
     * Determines if supplied element is in collection
     *
     * @param url Element to check
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( ReferenceURL url ) {
	return urls.contains( url ); 
    }


    /**
     * Determines if URL object with submitted value for URL is in collection
     *
     * @param url URL to search for
     * @return <code>true</code> if URL object found with submitted value for
     * URL; <code>false</code> if URL is not found
     */
    public boolean contains( String url ) {
	boolean containsURL = false;

	if ( !isEmpty() ) {
	    ReferenceURL urlObj = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		urlObj = (ReferenceURL) iter.next();
		if ( url.equalsIgnoreCase( urlObj.getUrl().getUrl() ) ) {
		    containsURL = true;
		    break;
		}
	    }
	}

	return containsURL;
    }


    /**
     * Retrieves all elements in collection
     *
     * @return All elements in collection as an <code>Iterator</code> of 
     * <code>ReferenceURL</code> objects, or <code>null</code> if no elements in
     * collection
     */
    public Iterator iterator() { 
	return ( !urls.isEmpty() ) ? urls.iterator() : null;
    }


  
    /**
     * Sets reference id for all urls. This is used when creating new urls
     * for a new reference
     *
     * @param referenceID Reference id to set for all urls in collection
     */
    public void setReferenceID( Long referenceID ) {
	this.referenceID = referenceID;

	if ( !isEmpty() ) {
	    ReferenceURL url = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		url = (ReferenceURL) iter.next();
		url.set_reference_id( referenceID );
	    }
	}
    }

  
    /**
     * Stores collection's contents to the database.  All associations
     * to reference id will be first DELETED, then existing associations
     * will be INSERTed so that after storing, database will only contain
     * associations contained by collection.  After removing association
     * to this reference, any URL removed from the collection since collection
     * was created that is not associated to any other references or communities
     * will be deleted.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any object
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// delete all pre-existing associations as well as URLs
	// that don't have any other associations
	delete( conn );

	// store url data and association to reference for all items in collection
	if ( !isEmpty() ) {
	    ReferenceURL url = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		url = (ReferenceURL) iter.next();
		url.store( conn );
	    }
	}
    }

    /**
     * Deletes associations between a URL and reference id. Any items removed 
     * from collection since it was created will be deleted. If, after removing 
     * association, URL is not associated to any references or communities, URL
     * itself will be deleted.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void delete( DBconnection conn ) throws SQLException {

	// first delete all URL associations to this reference id
	String query = 
	    "DELETE Reference_URL " +
	    "WHERE reference_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( referenceID );
	conn.executeUpdate();
	
	// for each item removed from collection since it was created,
	// check to see if URL is joined to any other reference or community;
	// if no other joins, delete URL record itself

	ReferenceURL url = null;
	if ( removed != null ) {
	    for ( Iterator iter = removed.iterator(); iter.hasNext(); ) {
		url = (ReferenceURL) iter.next();
		
        UrlDelegate delegate = CommunityDelegateFactory.getUrlDelegate();
        BsUrl thisUrl = url.getUrl();
		if ( !TfcReferenceURL.hasReferences( conn, url.getUrl().getUrlId() ) && 
		     thisUrl.getCommunity().size() == 0 ) {
		    thisUrl.delete(); // mark
		    delegate.delete(thisUrl); // delete and commit
		}
	    }
	}
    }


  
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** URLReferenceCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            ReferenceURL url = null;
            while ( iter.hasNext() ) {
                url = (ReferenceURL) iter.next();
            }
        }
        System.out.println( "**** URLReferenceCollection content test end ****" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){
        try {

            DBconnection conn = new DBconnection();
            Long id = new Long( 1386 );
            URLReferenceCollection urls = new URLReferenceCollection( conn, id );
            urls.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
  
}
  








