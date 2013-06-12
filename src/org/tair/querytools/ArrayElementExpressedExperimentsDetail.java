//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/06/15 21:48:13 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * ArrayElementExpressedExperimentsDetail is a composite class to represent expressed expression 
 * set associated with an entry in the ArrayElement table. This class is used to present 
 * expressed expression set information for an ArrayElement when the number of expressino sets
 * makes it impractical to display all info. directly on the array element detail page.
 * ArrayElementPresentExperimentsDetail extends  ArrayElementDetail in order to make use of code 
 * and objects in superclass, however it overrides the populate() method to 
 * retrieve all array designs data (super class only retrieves counts).
 */

 public class ArrayElementExpressedExperimentsDetail extends ArrayElementDetail {
    
     public ArrayElementExpressedExperimentsDetail(  ){    
         super();
     }
   

   /**
     * Creates an instance of ArrayElementExpressedExperimentsDetail to represent all data referenced
     * by submitted arrayelement id.
     *
     * @param conn An active connection to the database
     * @param arrayelement_id Arrayelement id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public ArrayElementExpressedExperimentsDetail( DBconnection conn, Long arrayelement_id )
	throws RecordNotFoundException, SQLException {
        get_information( conn, arrayelement_id );
    }

   /**
     * Creates an instance of ArrayElementExpressedExperimentsDetail to represent all data referenced
     * by submitted arrayelement name.
     *
     * @param conn An active connection to the database
     * @param name Arrayelement name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public ArrayElementExpressedExperimentsDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {
        get_information( conn, name );
    }

     /**
     * Populate object by retrieving all data associated to submitted
     * arrayelement id.
     *
     * @param conn An active connection to the database
     * @param arreyelement_id Arrayelement id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public  void get_information( DBconnection conn, Long array_element_id ) 
	throws RecordNotFoundException, SQLException {  
        if ( array_element_id != null ) {
            super.get_information( conn, array_element_id );
        }
    }

    /**
     * Populate object by retrieving all data associated to submitted
     * arrayelement name
     *
     * @param conn An active connection to the database
     * @param name Arrayelement name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {
        if ( name != null ) {
            get_information( conn, name );
        }
    }

    /**
     * Populate expressed expression set for array element with submitted array_element_id. This
     * method is called by get_information() in super-class, and overrides super-class
     * implementation to retrieve all associated expressed expression sets for array element 
     *
     * @param conn An active connection to the database
     * @param array_element_id Array Element id to retrieve data for
     * @exception SQLException thrown if a database error occurs.
     */
    protected void populateExpressedExpressionSets( DBconnection conn, 
				         Long array_element_id )  throws SQLException {

        if ( array_element_id != null ) {
            expressedExpressionSets = 
                new ArrayElementExpressionSetCollection ( conn, array_element_id , "expressed_all" );
         }
    }
 
}
