//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/04/06 20:45:48 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidActionException;


/**
 * CommunityPublicationObjectCollection is a custom collection that stores 
 * publications associated to a community record as a collection of 
 * <code>CommunityPublicationObject/code> objects. 
 */


public class CommunityPublicationObjectCollection implements Serializable {

    /**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = 6712625465932243231L;

    // store as map w/reference id referencing pub object 
    // for easy retrieval of pubs by id
    private TreeMap<Long, CommunityPublicationObject> communityPublications;

    // keep reference to community id that publications in collection
    // are related to for use when storing collection (which first deletes
    // all previous rows in linking table)
    private Long communityID;
    
    /**
     * Creates an empty instance of CommunityPublicationObjectCollection
     */
    public CommunityPublicationObjectCollection() {
        communityPublications = new TreeMap<Long, CommunityPublicationObject>();
    }
     

    /**
     * Creates an instance of CommunityPublicationObjectCollection that
     * represents a collection of publications associated to a community record
     *
     * @param conn An active connection to the database
     * @param community_id Community id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public CommunityPublicationObjectCollection( DBconnection conn, Long community_id ) 
        throws SQLException {
        communityPublications = new TreeMap<Long, CommunityPublicationObject>();
        this.communityID = community_id;
        populate( conn );
    }


    /**
     * Retrieves reference ids associated to community id and creates 
     * CommunityPublicationObjects for each combination of reference and community id
     * 
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList<Long> referenceIDs = null;
        Iterator<Long> iter = null;

        query = 
            "SELECT rc.reference_id " +
            "FROM Reference_Community rc, Publication p " +
            "WHERE rc.reference_id = p.reference_id " +
            "AND rc.community_id = " + communityID.toString();

        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( referenceIDs == null ) {
                referenceIDs = new ArrayList<Long>();
            }
            referenceIDs.add( new Long( results.getLong( "reference_id" ) ) );
        }
        conn.releaseResources();
        
        if ( referenceIDs != null ) {
            iter = referenceIDs.iterator();
            while ( iter.hasNext() ) {
                add( new CommunityPublicationObject( conn, iter.next(), communityID ) );
            }
        }
    }
  
  
    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no elements in it, or <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { 
        return communityPublications.isEmpty();
    }
    
    /*
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
        return communityPublications.size();
    }
    
    
    /**
     * Retrieve all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of <
     * code>CommunityPublicationObject</code> objects, or <code>null</code> 
     * if no elements in collection
     */
    public Iterator iterator() {
        return !isEmpty() ? communityPublications.values().iterator() : null;
    }

    /**
     * Retrieves all elements in collection sorted according to logic defined
     * in submitted comparator
     *
     * @returns Elements in collection sorted according to rules in comparator
     * as an <code>Iterator</code> of <code>CommunityPublicationObject</code> objects, or
     * <code>null</code> if no elements in collection
     */
    public Iterator<CommunityPublicationObject> iterator( Comparator<CommunityPublicationObject> comparator ) {
        Iterator<CommunityPublicationObject> sortedIter = null;

        // get publications (values of map) as Collection, create
        // List from Collection, sort List by comparator & return iterator 
        // for sorted values
        if ( !isEmpty() ) {
            List<CommunityPublicationObject> pubs = new ArrayList<CommunityPublicationObject>( communityPublications.values() );
            Collections.sort( pubs, comparator );
            sortedIter = pubs.iterator();
        }

        return sortedIter;
    }
    
    

   /**
     * Adds supplied element to collection
     * 
     * @param element CommunityPublicationObject to add to collection
     */
    public void add( CommunityPublicationObject element ) { 
        communityPublications.put( element.get_reference_id(), element ); 
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored.  Items removed from collection will have
     * their association to community record deleted from the database the
     * next time store() is called
     *
     * @param element CommunityPublicationObject to remove from collection
     */
    public void remove( CommunityPublicationObject element ) { 
        communityPublications.remove( element.get_reference_id() ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @param element Element to check for
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( CommunityPublicationObject element ) { 
        return communityPublications.containsKey( element.get_reference_id() ); 
    }

    /**
     * Determines if publication with submitted reference id is in collection
     *
     * @param reference_id Reference id of publication to check for
     * @return <code>true</code> if publication with reference_id found in
     * collection, or <code>false</code> if no publication found with reference id
     */
    public boolean contains( Long reference_id ) {
        return communityPublications.containsKey( reference_id );
    }


    /**
     * Removes publication with submitted reference id from collection.  Any 
     * assocation between publication and community record will be deleted when
     * store() is next called
     *
     * @param reference_id Reference id of publication to remove from collection.
     */
    public void remove( Long reference_id ) {
        communityPublications.remove( reference_id );
    }


    /**
     * Retrieves publication with submitted reference id.
     *
     * @return Publication with submitted reference id, or <code>null</code> if
     * no publication found with reference id
     */
    public CommunityPublicationObject get( Long reference_id ) {
        return communityPublications.get( reference_id );
    }

    /**
     * Sets community id for all items in collection. This must be done explicitly
     * when storing items for a newly created community record, since community id
     * was not present when publication object was first added to collection.
     *
     * @param community_id Community id to associate all publications in collection to
     */
    public void setCommunityID( Long communityID ) {
        Iterator iter = null;
        CommunityPublicationObject pub = null;

        this.communityID = communityID;
        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                pub = (CommunityPublicationObject) iter.next();
                pub.set_community_id( communityID );
            }
        }
    }


    /**
     * Stores collection to the database by creating associations between community
     * record and all publication records in collection.  Before storing individual
     * associations, this method will first DELETE any previous associations for
     * community id.  This is done to ensure that only the relationships in this 
     * collection are persisted.  If collection is empty when store is called, 
     * only the DELETE will be carried out.  In community profile maintenance, 
     * existing relationships to publications can be removed by removing publication
     * objects from this collection.  When community's store method is called, it 
     * will call this method, removing all previous records of publication relationships
     * to community record
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if any objects in collection have a <code>null</code>
     * community id or reference id
     */
    public void store( DBconnection conn ) throws SQLException, InvalidActionException {

        // first delete any previous associations
        delete( conn );

        if ( !isEmpty() ) {
            Iterator iter = iterator();
            CommunityPublicationObject pub = null;
            while ( iter.hasNext() ) {
                pub = (CommunityPublicationObject) iter.next();
                pub.store( conn );
            }
        }
    }


    /**
     * Deletes all associations to publications for community id
     * this collection represents. 
     */
    public void delete( DBconnection conn ) throws SQLException {
        String query = 
            "DELETE from Reference_Community WHERE community_id = " + communityID.toString();

        conn.setQuery( query );
        conn.executeUpdate();
        conn.releaseResources();
    }


    
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** CommunityPublicationObjectCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                CommunityPublicationObject element = (CommunityPublicationObject) iter.next();
                element.test();
            }
        }
        System.out.println( "**** CommunityPublicationObjectCollection content test end ****" );
    }
    
    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBWriteManager.init();
            DBWriteManager connPool = DBWriteManager.getInstance();
            DBconnection conn = connPool.getSearchConnection();
            Long communityID = new Long( 11550 );
            CommunityPublicationObjectCollection elements = new CommunityPublicationObjectCollection( conn,
                                                                                                      communityID );
            elements.test();

            elements.remove( new CommunityPublicationObject( conn, new Long( 3 ), communityID ) );
            elements.remove( new CommunityPublicationObject( conn, new Long( 4 ), communityID ) );
            elements.store( conn );

            
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}

