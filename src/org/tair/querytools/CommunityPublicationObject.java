//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/01/30 18:16:32 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.io.Serializable;
import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcReferenceCommunity;
import org.tair.utilities.InvalidActionException;

/** 
 * CommunityPublicationObject extends PublicationObject to represent the
 * specific association of publication to a community record. This
 * class includes join specific data, as well as a store() method
 * that can be used to store community to publication relationships,
 * as in the community profile maintenance section.
 *
 * <p>
 * CommunityPublicationObject extends PublicationObject (instead of TfcPublication)
 * so it can include the PubSource info. in superclass
 */
public class CommunityPublicationObject extends PublicationObject implements Serializable {

    /**
   * Generated serial version UID for serializable class
   */
  private static final long serialVersionUID = 5044554179521056729L;
    // join info. for publication to community association
    private TfcReferenceCommunity refCommunity;


    /**
     * Creates an empty instance of CommunityPublicationObject
     */
    public CommunityPublicationObject() {  
        super();
        refCommunity = new TfcReferenceCommunity();
    }
  
    /**
     * Creates an instance of CommunityPublicationObject that reflects
     * the data referenced by submitted reference_id.  If this constructor
     * is used, no join information to community is retrieved.
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public CommunityPublicationObject( DBconnection conn, Long reference_id ) 
        throws SQLException {  

	super( conn, reference_id );
        refCommunity = new TfcReferenceCommunity();
	refCommunity.set_reference_id( reference_id );
    }
  
    /**
     * Creates an instance of CommunityPublicationObject that reflects the
     * data referenced by submitted reference id in the context of its join
     * to submitted community id.
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @param community_id Community id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public CommunityPublicationObject( DBconnection conn, Long reference_id, Long community_id )  
	throws SQLException{
       
        super( conn, reference_id );
        refCommunity = new TfcReferenceCommunity( conn, reference_id, community_id );
    }


    /**
     * Overrides superclass implementation to keep reference id of publication
     * in synch. with community join object
     *
     * @param reference_id Reference id to set
     */
    public void set_tair_object_id( Long reference_id ) { 
        super.set_reference_id( reference_id );
        refCommunity.set_reference_id( reference_id );
    }

    // 
    // TfcReferenceCommunity wrappers
    //
    public void set_community_id( Long community_id ) {
        refCommunity.set_community_id( community_id );
    }

    public Long get_community_id() {
        return refCommunity.get_community_id();
    }
    
                                                      
    /**
     * Stores the association between publication and community record to the
     * database. This action only stores the association information - other
     * community and publication data remains untouched
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if either reference id or community id 
     * is <code>null</code>
     */
    public void store (DBconnection conn) throws SQLException, InvalidActionException {
        refCommunity.store( conn );
    }
  

    /**
     * Overrides equals method in Object to compare CommunityPublicationObjects to
     * each other.  Submitted object will be considered equal to this object if
     * it is a CommunityPublicationObject with the same reference and community ids.
     * This implementation is necessary for checking whether a given CommunityPublicationObject
     * is contained by a collection or not, when two items may represent the same
     * data without actually being the same object instance
     *
     * @param publication Object to check for equality
     * @return <code>true</code> if submitted object is equal to this object, or
     * <code>false</code> if submitted object is not equals to this object
     */
    public boolean equals( Object publication ) {
        boolean isEqual = false;

        if ( publication instanceof CommunityPublicationObject ) {
            CommunityPublicationObject pub = (CommunityPublicationObject) publication;
            isEqual =  ( idsEqual( get_reference_id(), pub.get_reference_id() ) &&
                         idsEqual( get_community_id(), pub.get_community_id() ) );
        }
        
        return isEqual;
    }



    /**
     * Utility method to compare two ids for equality.
     *
     * @param id_1 ID to compare to id_2
     * @param id_2 ID to compare to id_1
     * @return <code>true</code> if two ids are equal, <code>false</code>
     * if two ids are not equal
     */
    private boolean idsEqual( Long id_1, Long id_2 ) {
        boolean isEqual = ( ( id_1 == null && id_2 == null ) ||
                            ( id_1 != null && id_1.equals( id_2 ) ) );
        return isEqual;
    } 


       
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "**** CommunityPublicationObject content test begin ****" );
        super.test();
        refCommunity.test();
        System.out.println( "**** CommunityPublicationObject content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long refID = new Long( 2 );
            Long commID = new Long( 11550 );
            CommunityPublicationObject pub = new CommunityPublicationObject( conn, refID, commID );
            pub.test();

            refID = new Long( 3 );
            pub = new CommunityPublicationObject( conn, refID );
            pub.set_community_id( new Long( 1234 ) );
            pub.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
