//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/07/06 16:31:28 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.UrlDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcReferenceURL;
import org.tair.utilities.InvalidActionException;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * ReferenceURL represents an association between a URL and a Community.
 */

public class ReferenceURL {

    private TfcReferenceURL refURL;
    private BsUrl url;
    private UrlDelegate delegate = CommunityDelegateFactory.getUrlDelegate();


    /**
     * Creates an empty instance of ReferenceURL
     */
    public ReferenceURL() {
	super();
	refURL = new TfcReferenceURL();
    }

    /**
     * Creates an instance of ReferenceURL that contains URL data for
     * submitted id.  This constructor should be used when using object
     * to create new associations between URL and a reference. Reference
     * id must be set explicitly after object creation if using this
     * way
     * 
     * @param conn An active connection to the database
     * @param urlId URL id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public ReferenceURL( DBconnection conn, BigInteger urlId ) 
	throws SQLException {

	refURL = new TfcReferenceURL();
	// Query the URL.
	IPrimaryKey key = CommunityFactory.getUrlPrimaryKey(urlId);
	url = delegate.getObject((SequencePrimaryKey)key);
    }

    /**
     * Creates an instance of ReferenceURL that contains URL data for submitted
     * id along with its relationship to submitted reference id
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @param url_id URL id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public ReferenceURL( DBconnection conn, Long reference_id, BigInteger urlId )
	throws SQLException {

	refURL = new TfcReferenceURL( conn, reference_id, urlId );
    // Query the URL.
    IPrimaryKey key = CommunityFactory.getUrlPrimaryKey(urlId);
    url = delegate.getObject((SequencePrimaryKey)key);
    }

    /**
     * Retrieves reference id URL is associated to
     *
     * @return reference id URL is associated to
     */
    public Long get_reference_id() {
	return refURL.get_reference_id();
    }

    /**
     * Sets reference id to associate URL to
     *
     * @param id Reference id to associate URL to
     */
    public void set_reference_id( Long id ) {
	refURL.set_reference_id( id );
    }


    /**
     * Stores URL data as well as Reference/URL association to the database.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if data required for storing has
     * not been set
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {
      // insert, update, or delete the URL.
      List<BsUrl> list = new ArrayList<BsUrl>(1);
      list.add(url);
      delegate.process(list);
      
	// set url id for join object in case URL was newly created 
	// and an id hasn't been available until now
	refURL.set_url_id(url.getUrlId());
	refURL.store( conn );
    }

    /**
     * Get the associated URL.
     * 
     * @return a BsUrl object
     */
    public BsUrl getUrl() {
      return url;
    }

    /**
     * Set the associated URL.
     * 
     * @param url a BsUrl object
     */
    public void setUrl(BsUrl url) {
      this.url = url;
    }


}


