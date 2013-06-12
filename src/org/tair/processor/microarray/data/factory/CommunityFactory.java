//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:29:30 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data.factory;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.community.ListCommunity;
import org.tair.utilities.RecordNotFoundException;



/**
 * CommunityFactory handles the validation of TAIR community ids by verifying
 * that they reference a person or organization record in the TAIR database.  
 *
 * <p>
 * CommunityFactory returns results as a ListCommunity object that may
 * represent either a person or an organization. Microarray loading code
 * will use this record as part of an Attribution object to set community
 * attributions for an expression set or associated data element.
 *
 * <p>
 * CommunityFactory maintains a record of all previous ids that have been
 * looked up (successfully and unsuccessfully) during the object's lifetime.
 * This is done to skip actual database lookups whenever possible, since the
 * quantity of data processed during microarray loading can be large, and since
 * multiple elements may be associated to the same small number of community
 * records.
 */

public class CommunityFactory {

    // map of community records that have already been verified in the 
    // database stored as Long community id referencing a populated
    // ListCommunity object.
    private Map<BigInteger, ListCommunity> communities;

    // list of ids that were searched for and not found in the database
    private List<BigInteger> notFound;


    /**
     * Creates a new instance of CommunityFactory
     */
    public CommunityFactory() {
	communities = new HashMap<BigInteger, ListCommunity>();
	notFound = new ArrayList<BigInteger>();
    }


    /**
     * Translates submitted community id (as string) into a ListCommunity
     * object populated with community data from the database.
     *
     * @param community_id Community id to look up
     * @return ListCommunity object populated with community data or
     * <code>null</code> if community id was not found in the database
     * @throws SQLException if a database error occurs
     */
    public ListCommunity getCommunityRecord(BigInteger community_id )
	throws SQLException {

	ListCommunity community = 
	    lookupCommunityRecord(community_id);

	return community; // will be null if record not found

    }

    /**
     * Translates submitted community id into a ListCommunity object.
     * If id has been looked up before, community object will be
     * returned by communities cache, otherwise a database lookup will
     * be executed. 
     *
     * <p>
     * After lookup, submitted id will be saved for future reference 
     * in either found communities map or not found list.
     *
     * @param communityID ID to look up
     * @return ListCommunity instance representing basic display data for
     * submitted id, or <code>null</code> if id was not found in the
     * database
     * @throws SQLException if a database error occurs
     */
    private ListCommunity lookupCommunityRecord(BigInteger communityID)
	throws SQLException {

	ListCommunity community = null;
	
	// get previously created record if possible
	if ( communities.containsKey( communityID ) ) {
	    community = (ListCommunity) communities.get( communityID );


	    // if id hasn't been looked up before, verify id by 
	    // trying to create community instance with it -- 
	    // exception will be thrown if no person or organization
	    // found;
	} else if ( !notFound.contains( communityID ) ) {
	    try {
		community = new ListCommunity(communityID );

		// add to collection of found records -- this step will
		// be skipped if not found, since constructor above will
		// throw exception
		communities.put( communityID, community );
		
		
		// if not found, save id in not found list to save time
		// if requested again
	    } catch ( RecordNotFoundException rnfe ) {
		notFound.add( communityID );
	    }
	}

	return community;
    }
}
