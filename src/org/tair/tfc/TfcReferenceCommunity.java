//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/01/30 18:16:55 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.io.Serializable;
import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the Reference_Community table in the tair database. Each 
 * instance maps one row of data in the table. Each data object maps to one field
 * of a row in the table. 
 */

public class TfcReferenceCommunity implements Serializable{   

    private Long reference_id;
    private Long community_id;


    /**
     * Creates an empty instance of TfcReferenceCommunity
     */
    public TfcReferenceCommunity() {  }



    /**
     * Creates an instance of TfcReferenceCommunity that represents the data referenced
     * by combination of submitted reference id and community id
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @param community_id Community id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error, or
     * if no row found for submitted combination of ids
     */
    public TfcReferenceCommunity( DBconnection conn, 
                                  Long reference_id, 
                                  Long community_id ) 
        throws SQLException {

        boolean found = false;

        String query =
            "SELECT reference_id, " +
            "community_id " +
            "FROM Reference_Community " +
            "WHERE reference_id = " + reference_id.toString() + " " +
            "AND community_id = " + community_id.toString();

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            found = true;
            this.reference_id = reference_id;
            this.community_id = community_id;
        }
        conn.releaseResources();

        if ( !found ) {
            throw new RecordNotFoundException( "No entry for found combination of " +
                                               "reference id: " + reference_id  + 
                                               " and community id: " + community_id );
        }
    }
  

    
    public void set_reference_id( Long id ) { 
        this.reference_id = id;
    }

    public Long get_reference_id() { 
        return reference_id; 
    }

    public void set_community_id( Long id ) {
        this.community_id = id;
    }

    public Long get_community_id() {
        return community_id;
    }


    /**
     * Stores contents of object to Reference_Community id to create a new linkage between
     * reference id and community id.  This operation is done as an INSERT only - SQLException
     * will be thrown if a row already exists for this combination of ids.
     *
     * @param conn An active connection to the database with INSERT permissions
     * @exception SQLException thrown if a database error occurs
     * @exception InvalidActionException thrown if either reference id or community id is null
     */
    public void store( DBconnection conn ) throws SQLException, InvalidActionException {
        StringBuffer query = new StringBuffer();
        ResultSet results = null;

        if ( get_reference_id() == null || get_community_id() == null ) {
            throw new InvalidActionException( "db storage failed for reference_id " + 
                                              get_reference_id() + ", " +
                                              "community_id " + get_community_id() + 
                                              " - one or more ids is null" );
        }
    
        query.append( "INSERT INTO Reference_Community ( " +
                      "reference_id, " +
                      "community_id " +
                      ") " +
                      "VALUES " +
                      "(" + get_reference_id() + ", " +
                      get_community_id() + 
                      ")" );
        
        conn.setQuery( query.toString() );
        conn.executeUpdate();
        conn.releaseResources();
    }


    /**
     * For unit testing only
     */
    public void test(){
        System.out.println( "****** TfcReferenceCommunity content test ******" );
        System.out.println( "reference_id: " + get_reference_id() );
        System.out.println( "community id: " + get_community_id() );
        System.out.println( "**** TfcReferenceCommunity content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ){

        try{
            DBWriteManager.init();

            DBWriteManager connPool = DBWriteManager.getInstance();
            DBconnection conn = connPool.get_connection();

            Long referenceID = new Long( 2 );
            Long communityID = new Long( 1828 );
            TfcReferenceCommunity ref = new TfcReferenceCommunity( conn, referenceID, communityID );
            ref.test();

            // test insert
            ref = new TfcReferenceCommunity();
            ref.set_reference_id( new Long( 3 ) );
            ref.set_community_id( new Long( 11550 ) );
            ref.store( conn );
            ref.test();


        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
