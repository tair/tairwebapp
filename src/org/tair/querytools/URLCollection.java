//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.9 $
// $Date: 2004/05/18 20:58:23 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.*;
import java.util.*;

import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.UrlDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.*;
import org.tair.utilities.*;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;

/** 
 * URLCollection is a custom collection class that stores
 * all urls for a Map Element as a collection of <code>Locus</code>
 * objects.
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data
 */

public class URLCollection implements Serializable {
    /**
   * Serial version UID for serializable objects
   */
  private static final long serialVersionUID = -3386085006031861738L;
    private ArrayList<BsUrl> urls;
  

    /**
     * Creates an empty instance of URLCollection 
     */
    public URLCollection() {
        urls = new ArrayList<BsUrl>();
    }
    
    /**
     * Creates an instance of URLCollection that contains all urls
     * associated to submitted map element id.  URLs are stored
     * internally as <code>URL</code> objects
     *
     * @param conn An active connection to the database
     * @param tair_object_id Map element id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public URLCollection( DBconnection conn, Long tair_object_id ) throws SQLException {
        urls = new ArrayList<BsUrl>();
        if ( tair_object_id != null ) {
            populate( conn, tair_object_id );
        }
    }

    /**
     * Retrieves url for submitted map element id and stores internally as URL
     *
     * @param conn An active connection to the database
     * @param tair_object_id map element id to retrieve urls for
     */
    private void populate( DBconnection conn, Long tair_object_id ) throws SQLException {
        ArrayList<BigInteger> ids = null;
        String query = null;
        ResultSet results = null;

        if ( tair_object_id != null ) {
            query = 
                "SELECT u.url_id "+
                " FROM TairObject_URL tu, URL u " +
                " WHERE tu.url_id = u.url_id " + 
                " AND tu.tair_object_id = " + tair_object_id.toString();
            System.out.println("populating urls : " + query);
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList<BigInteger>();
                }
                ids.add( results.getBigDecimal( "url_id" ).toBigInteger() );
            }
            conn.releaseResources();

            if ( ids != null && !ids.isEmpty() ) {
                createURLs( ids );
            }
        }
    }

    /**
    * utility method that is used to create the URL objects from list of ids
    *
    * @param list of all URL ids to make URL list for
    */
    private void createURLs(List<BigInteger> ids) throws SQLException {
      UrlDelegate delegate = CommunityDelegateFactory.getUrlDelegate();
      IPrimaryKey key = null;
      for (BigInteger id : ids) {
        key = CommunityFactory.getUrlPrimaryKey(id);
        add(delegate.getObject((SequencePrimaryKey)key));
      }
    }

    
    /**
     * Determines if collection has urls in it or not
     *
     * @return <code>true</code> if collection has no urls in it; <code>false</code>
     * if collection has at least one element in it
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
     * Retrieve element object at supplied index
     *
     * @return element at supplied index, or <code>null</code> if no 
     *  element at supplied index
     */
    public BsUrl elementAt( int index ) { 
        return (BsUrl) urls.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param url Element to add to collection
     */
    public void add( BsUrl t ) { 
        urls.add( t ); 
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param url Element to remove from collection
     */
    public void remove( BsUrl t ) { 
        urls.remove( t ); 
    }

    /**
     * Determines if supplied element is in collection or not
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( BsUrl t ) { 
        return urls.contains( t ); 
    }

    /**
     * Retrieve all elements in collection
     *
     * @return All urls in collection as an <code>Iterator</code> of <code>URL</code>
     * objects, or <code>null</code> if no urls in collection
     */
    public Iterator<BsUrl> iterator() { 
        return !urls.isEmpty() ? urls.iterator() : null; 
    }



    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** LocusCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator<BsUrl> iter = iterator();
            BsUrl t = null;
            while ( iter.hasNext() ) {
                t = (BsUrl) iter.next();
                String url = t.getUrl();
                if (url == null) {
                  throw new RuntimeException("null URL");
                }
                //t.test();
            }
        }
        System.out.println( "**** LocusCollection content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1 );
            URLCollection ts = new URLCollection( conn, id );
            ts.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
