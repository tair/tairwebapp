//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.8 $
// $Date: 2004/07/06 16:30:44 $
//------------------------------------------------------------------------------

package org.tair.processor.genesymbol;

import java.sql.*;
import java.util.*;
import java.io.Serializable;

import org.tair.tfc.*;
import org.tair.utilities.*;

/** 
 * TairObjectPublicationCollection is a custom collection class that stores
 * all publication for a tair_object as a collection of 
 * <code>TairObjectPublication</code> objects.
 */

public class TairObjectPublicationCollection implements Serializable{

    private ArrayList publications;

    // tair object id collection contains publications for
    private Long tair_object_id ;

    // list of publications that have been removed from collection since
    // it was created -- these are held until store() is called at which
    // point they will be deleted from the database
    private ArrayList deleted;

    /**
     * Creates an empty instance of PublicationCollection
     */
    public TairObjectPublicationCollection() {
	publications = new ArrayList();
    }
    
    /**
     * Creates an instance of PublicationCollection that contains all publications
     * associated to submitted tair_object_id.  publications are stored
     * internally as <code>TairObjectPublication</code> objects
     *
     * @param conn An active connection to the database
     * @param  tair_object_id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TairObjectPublicationCollection( DBconnection conn,
					    Long tair_object_id )
	throws SQLException {

	publications = new ArrayList();
	this.tair_object_id  =  tair_object_id;
	populate( conn );
    }


    /**
     * Retrieves publications for submitted tair_object_id and stores internally 
     * as TairObjectPublication. 
     */
    private void populate( DBconnection conn ) throws SQLException {

	// save tairobj_ref ids as key referencing reference id
	// -- need both to get join info. as well as publication
	// info
	Map ids = null;

	String query = 
	    "SELECT tr.tairobj_ref_id, tr.reference_id " +
	    "FROM TairObj_Ref tr, Publication pub  " +
	    "WHERE tr.reference_id = pub.reference_id " +
	    "AND tr.tair_object_id = ?";
        
	conn.setQuery( query );
	conn.setQueryVariable( tair_object_id );
	
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new HashMap();
	    }

	    ids.put( new Long( results.getLong( "tairobj_ref_id" ) ),
		     new Long( results.getLong( "reference_id" ) ) );
	}
	    
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {

	    Iterator iter = ids.keySet().iterator();

	    Long refID = null;
	    Long tairObjRefID = null;
	    TairObjectPublication publication = null;
	    while ( iter.hasNext() ) {
		tairObjRefID = (Long) iter.next();
		refID = (Long) ids.get( tairObjRefID );
		publication = new TairObjectPublication( conn, 
							 refID, 
							 tairObjRefID );
		add( publication );
	    }
	}
    }


    /**
     * Determines if collection has publication in it or not
     *
     * @return <code>true</code> if collection has no publication in it; 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return publications.isEmpty();
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return publications.size(); 
    }

    /**
     * Retrieve element object at supplied index
     *
     * @return element at supplied index, or <code>null</code> if no element 
     * at supplied index
     */
    public TairObjectPublication elementAt( int index ) {
	return (TairObjectPublication) publications.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param TairObjectPublication Element to add to collection
     */
    public void add( TairObjectPublication publication ) { 
	publications.add( publication ); 
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param publication Element to remove from collection
     */
    public void remove( TairObjectPublication publication ) {
  
	for (int i  = 0; i < size(); i++){
	    if ( ( (TairObjectPublication) elementAt(i) ).equals(publication) ) {
		publications.remove (i);

		// if tairobj_ref_id is not null, add to list of items to be
		// deleted next time store is called - if null, no further
		// work required
		if ( publication.get_tairobj_ref_id() != null ) {
		    if ( deleted == null ) {
			deleted = new ArrayList();
		    }
		    deleted.add( publication );
		}
	    }
	}
    }

    /**
     * Determines if supplied element is in collection or not
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( TairObjectPublication publication ) { 
	return publications.contains( publication );
    }

    /**
     * Retrieve all elements in collection
     *
     * @return All publications in collection as an <code>Iterator</code> of 
     * <code>TairObjectPublication</code> objects, or <code>null</code> if no
     * publication in collection
     */
    public Iterator iterator() { 
	return ( !publications.isEmpty() ) ? publications.iterator() : null; 
    }

    /**
     * Stores collection to the database by creating associations between tair 
     * object and all publications in collection. Before storing individual 
     * associations, this method will first DELETE any associations that
     * were removed from collection since it was created. This is done to ensure
     * that only the relationships in this collection are persisted.  If 
     * collection is empty when store is called, only the DELETE will be carried
     * out.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if any objects in collection are missing
     * required data.
     */

    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException { 
   
	if ( !isEmpty() ) { 
	    // remove the previous linkings
	    removePreviousLinking( conn );
      
	    Iterator iter = iterator();
	    TairObjectPublication publication = null;
	    while ( iter.hasNext() ) {
		publication = (TairObjectPublication) iter.next();
		publication.store( conn );
	    }
	}
    }

    /**
     * Remove associations to any publications that were removed from collection
     * since it was created. This is done to ensure that after storing, only
     * relationships currently in collection are persisted.
     */
    private void removePreviousLinking ( DBconnection conn ) 
	throws SQLException {

	if ( deleted != null ) {

	    TairObjectPublication pub = null;
	    for ( Iterator iter = deleted.iterator(); iter.hasNext(); ) {
		pub = (TairObjectPublication) iter.next();
		pub.delete( conn );
	    }
	}
	
    }
  
    public Long get_tair_object_id () {
	return tair_object_id;   
    }
    
    /**
     * Sets tair object id that all publications in collection should be 
     * associated to. This needs to be done explicitly when collection has
     * been created in the process of creating a new data object (such
     * as gene symbol registry entry) where a tair object id doesn't exist
     * when collection was created.
     *
     * @param id Tair object id to associate all publications to
     */
    public void set_tair_object_id( Long id ) {
	this. tair_object_id = id;  
	
	if ( !isEmpty() ) {
	    TairObjectPublication pub = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		pub = (TairObjectPublication) iter.next();
		pub.set_tair_object_id (id);
	    }   
	}
    }
  
    /**
     * test Collection content
     */
    public void test() {
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    TairObjectPublication pub = null;
	    while ( iter.hasNext() ) {
		pub = (TairObjectPublication) iter.next();
		pub.test();
	    }
	}
  
    }

    public static void main( String[] args ) {
	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1006374740 );
	    TairObjectPublicationCollection publications = 
		new TairObjectPublicationCollection( conn, id );
	    publications.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}

    }

}
  








