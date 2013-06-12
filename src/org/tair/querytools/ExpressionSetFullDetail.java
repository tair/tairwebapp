/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * ExpressionSetFullDetail is a composite class to represent all information
 * associated with an entry in the ExpressionSet table for display
 * on the ExpressionSet detail page which displays detail information about expression sets. 
 * ExpressionSetFullDetail contains instances of <code>TfcExpressionSet</code>, 
 * <code>BioSampleObjectCollection</code> lists all information pertaining to 
 * associated bio samples, and <code>HybDescriptionObjectCollection</code> lists 
 * all information pertaining to associated hyb descriptions.  Information up the 
 * hierachy is also available from <code>TairObjectDetail</code>
 */

public class ExpressionSetFullDetail extends ExpressionSetDetail {

 
    /**
     * Creates an empty instance of ExpressionSetFullDetail
     */
    public ExpressionSetFullDetail() {
        super();
    }


    /**
     * Creates an instance of ExpressionSetFullDetail that represents
     * all data referenced by submitted tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id tair object id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public ExpressionSetFullDetail( DBconnection conn, Long tair_object_id ) throws SQLException {
        if ( tair_object_id != null ) {
            get_information( conn, tair_object_id );
        }
    } 

    /**
     * Creates an instance of ExpressionSetFullDetail that represents
     * all data referenced by submitted expression set name.
     *
     * @param conn An active connection to the database
     * @param name ExpressionSet name to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public ExpressionSetFullDetail( DBconnection conn, String name ) throws SQLException {
        if ( name != null ) {
            get_information( conn, name );
        }
    }


    /** 
     * Populates object with data referenced by submitted expression set name
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
     * Populates object with data referenced by submitted tair object_id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public  void get_information( DBconnection conn, Long tair_object_id ) throws SQLException {          
        // populates object using overridden populateXXX() methods implemented here
        super.get_information( conn, tair_object_id ); 	
        if ( get_expression_set_id() != null ) { 
	    populateArrayDesigns( conn, get_expression_set_id() );
        }
    }


    /**
     * Populate bio sample data for expression set with submitted expression_set_id. This
     * method is called by get_information() in super-class, and overrides super-class
     * implementation to retrieve all associated bio samples for expression set regardless
     * of number
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @exception SQLException thrown if a database error occurs.
     */
    protected void populateBioSamples( DBconnection conn, Long expression_set_id ) 
        throws SQLException {

        if ( expression_set_id != null ) {
            bioSamples = new BioSampleObjectCollection( conn, expression_set_id, "all" );

	    // get labeled sample data for bio samples - will overlap
	    // with data in hyb descriptions if they are populated, but
	    // easier to deal with redundancy than to try to keep
	    // collections in synch.
	    bioSamples.populateLabeledSamples( conn );
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

	    // get labeled sample data for hyb descriptions - will overlap
	    // with data in bio samples if they are populated, but
	    // easier to deal with redundancy than to try to keep
	    // collections in synch.
	    hybDescriptions.populateLabeledSamples( conn );
        }
    }

    /**
     * Populate array design data for expression set with submitted expression_set_id. This
     * method is called by get_information()   
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @exception SQLException thrown if a database error occurs.
     */
    protected void populateArrayDesigns( DBconnection conn, Long expression_set_id ) 
        throws SQLException {

        if ( expression_set_id != null ) {
            arrayDesigns = new ExpressionSetArrayDesignCollection( conn, expression_set_id );
        }
    }
   
    /**
     * Return the uniq array designs associated to expression set
     * @return a iterator of arraydesign ids as Long value 
     */
    public Iterator getUniqArrayDesignIds (){
       return  (arrayDesigns == null || arrayDesigns.isEmpty())? null : arrayDesigns.getUniqArrayDesignIds () ;
    }

    /**
     * Return the number of uniq array design ids associated to expression set
     @return an int
     */
    public int getNumberUniqArrayDesignIds (){
       return   (arrayDesigns == null || arrayDesigns.isEmpty())? 0 : arrayDesigns.getNumberUniqArrayDesignIds () ;
    }

    /**
     * Get iterator of HybDescriptionObject for an given array design id associated to expression set
     * @return Elements in collection as an <code>Iterator</code> of <code>HybDescriptionObject</code>
     * objects, or <code>null</code> if no elements in collection 
     */
    public Iterator getHybDescriptionsForArrayDesign( Long array_design_id){
	return (arrayDesigns == null || arrayDesigns.isEmpty())? null : arrayDesigns.getHybDescriptionsForArrayDesign(array_design_id );
    }
   
    /**
     * get first HybDescriptionObject for a given array design id 
     * @return a <code>HybDescriptionObject</code> , or null if no HybDescriptionObject for given array design id
     */
    public  HybDescriptionObject getFirstHybDescriptionForArrayDesign( Long array_design_id){
	return (arrayDesigns == null || arrayDesigns.isEmpty())?null:arrayDesigns.getFirstHybDescriptionForArrayDesign(array_design_id );
    }
    /**
     * Determines whether object is full version of data, or if data is abbreviated. This
     * data is used to determine what params and display text to use when displaying a
     * control to toggle between full and abbreviated versions of display.  This
     * implementation will always return <code>true</code>, while ExpressionSetDetail
     * parent class will override this method to always return <code>false</code>
     *
     * @return <code>true</code> if object is full representation of data, or <code>false</code>
     * if data in object is abbreviated.  This implementation will always return <code>true</code>
     * since this object will never be created in abbreviated mode through detail page requests
     */
    public boolean isFullVersion() {
        return true;
    }


    /**
     * For unit testing only
     */
    public void test() {

        System.out.println( "****** ExpressionSetFullDetail content test ******" );
        super.test(); 
        System.out.println( "**** ExpressionSetFullDetail content test end ****" );
    }
            
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1006158457 );
            ExpressionSetFullDetail exd = new ExpressionSetFullDetail( conn, id );
            exd.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}



