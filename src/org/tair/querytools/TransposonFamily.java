//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.6 $
// $Date: 2004/05/18 21:01:04 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;

/**
 * TransposonFamily is a composite class that extends <code>TfcTransposonFamily</code>
 * to present detailed information about a TransposonFamily, usually for display
 * in a band as part of a larger detail page.
 */

public class TransposonFamily extends TfcTransposonFamily {

    TransposonCollection assoc_transposons;
    int assoc_transposons_count;    
    /**
     * Creates an empty instance of TransposonFamily
     */
    public TransposonFamily() {
        super();
        assoc_transposons = new TransposonCollection();
        assoc_transposons_count = 0;
    }

    /**
     * Creates an instance of TransposonFamily that reflects the data referenced by
     * submitted transposon_family_id 
     *
     * @param conn An active connection to the database
     * @param transposon_family_id TransposonFamily id to retrieve data for
     * @exception SQLException thrown if a database error occurs
     */
    public TransposonFamily( DBconnection conn, Long transposon_family_id ) throws SQLException {
        super( conn, transposon_family_id );
        assoc_transposons = new TransposonCollection();
        assoc_transposons_count = getAssocTransposons(conn, transposon_family_id);
    }

    public int get_assoc_transposons_size(){
        return assoc_transposons_count;
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** TransposonFamily content test ******" );
        super.test();

        System.out.println( "****** TransposonFamily content end ******" );
    }
    

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 274 );
            TransposonFamily t = new TransposonFamily( conn, id );
            t.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}




