/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * HybDescriptionCollectionDetail is a composite class to represent all hyb 
 * description information associated with an entry in the ExpressionSet table. 
 * This class is used to present complete hyb description information for an 
 * expression set when the number of hyb descriptions makes it impractical to 
 * display all info. directly on the expression set detail page. 
 * HybDescriptionCollectionDetail extends ExpressionSetDetail in order to make 
 * use of code and objects in superclass, however it overrides the populateHybDescription() 
 * method to retrieve all hyb description data (super class only retrieves counts).
 */

public class HybDescriptionCollectionDetail extends ExpressionSetDetail {

    /**
     * Creates an empty instance of HybDescriptionCollectionDetail
     */
    public HybDescriptionCollectionDetail() {
        super();
    }


    /**
     * Creates an instance of HybDescriptionCollectionDetail that represents
     * hyb description data referenced by submitted expression set tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Expression set tair object id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public HybDescriptionCollectionDetail( DBconnection conn, Long tair_object_id ) 
        throws SQLException {

        if ( tair_object_id != null ) {
            get_information( conn, tair_object_id );
        }
    } 

    /**
     * Creates an instance of HybDescriptionCollectionDetail that represents
     * hyb description data referenced by submitted expression set name.
     *
     * @param conn An active connection to the database
     * @param name ExpressionSet name to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public HybDescriptionCollectionDetail( DBconnection conn, String name ) throws SQLException {
        if ( name != null ) {
            get_information( conn, name );
        }
    }


    /** 
     * Populates object with hyb descripion data referenced by submitted expression set name
     *
     * @param conn An active connection to the database
     * @param name ExpressionSet name to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public void get_information( DBconnection conn, String name ) throws SQLException {
        if ( name != null ) {
            get_information( conn, TfcExpressionSet.nameToTairObjectID( conn, name ) );
        }
    }

    /**
     * Populates object with hyb description data referenced by submitted tair object_id.
     * This method overrides superclass implementation so that only basic expression set
     * info. and hyb description info is retrieved
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public  void get_information( DBconnection conn, Long tair_object_id ) throws SQLException {          
        if ( tair_object_id != null ) {

            // populates object using overridden populateXXX() methods implemented here
            super.get_information( conn, tair_object_id );
        }
    }

    /**
     * Populate hyb description data for expression set with submitted expression_set_id. This
     * method is called by get_information() in super-class, and overrides super-class
     * implementation to retrieve all associated hyb descriptions for expression set regardless
     * of number
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @exception SQLException thrown if a database error occurs.
     */
    protected void populateHybDescriptions( DBconnection conn, Long expression_set_id ) 
        throws SQLException {

        if ( expression_set_id != null ) {
            hybDescriptions = new HybDescriptionObjectCollection( conn, expression_set_id, "all" );

	    // get labeled sample data for hyb descriptions
	    hybDescriptions.populateLabeledSamples( conn );
        }
    }

   

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** HybDescriptionCollectionDetail content test ******" );
        super.test();
        System.out.println( "**** HybDescriptionCollectionDetail content test end ****" );
    }
            
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1005823504 );
            HybDescriptionCollectionDetail hybDescr = new HybDescriptionCollectionDetail( conn, id );
            hybDescr.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}



