//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;

/**
* Transposon extends <code>TfcTransposon</code> to present complete information
* about a given Transposon. In addition to transposon data, Transposon contains
* associated global assignment information, 
*/

public class Transposon extends TfcTransposon {

    //list of a transposon's global assignments
    private GlobalAssignmentObjectCollection gas;

    /**
     * Creates an empty instance of Transposon
     */
    public Transposon() {
        super();
        gas = new GlobalAssignmentObjectCollection();
    }


    /**
     * Creates an instance of Transposon that reflects the data referenced by
     * submitted transposon_id
     *
     * @param conn An active connection to the database
     * @param transposon_id Transposon id to retrieve data for
     * @throws SQLException thrown if a database error occurs
     */
    public Transposon( DBconnection conn, Long transposon_id ) throws SQLException {
        super( conn, transposon_id );
        gas = new GlobalAssignmentObjectCollection(conn, get_map_element_id() ); 
    }
    
    /**
    * Returns the number of global assignments that are assocated with the
    * Transposon
    *
    * @return size The number of global assignments associated to the Transposon
    */
    public int get_gas_size(){
        return gas.size();
    }

    /**
    * Determines if a Transposon has associated global assignments
    *
    * @return <code>true</code> if a transposon has associted global assignments or
    * </code>false</code> if no global assignments are found for this transposon
    */
    public boolean has_gas(){
        return (gas != null && !gas.isEmpty() );
    }

    /**
    * Retrieves global assignments for this transposon
    *
    * @return Global Assignments associated with this transposon as an <code>Iterator</code>
    * of a </code>GlobalAssignment</code> object or <code>null</code> if no assignments
    * are found for this transposon
    */
    public Iterator get_gas(){
        return (has_gas() ) ? gas.iterator() : null;
    }
    
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** Transposon content test ******" );
        super.test();
        
        if (gas != null && !gas.isEmpty() ){
            gas.test();
        }

        System.out.println( "****** Transpson content end ******" );
    }
    

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 1 );
            Transposon t = new Transposon( conn, id );
            t.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}




