/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * ArrayDesignCollectionDetail is a composite class to represent all array design
 * information associated with an entry in the ExpressionSet table. This class
 * is used to present complete array design information for an expression 
 * ArrayDesignCollectionDetail extends 
 * ExpressionSetDetail in order to make use of code and objects in superclass, 
 */

public class ArrayDesignCollectionDetail extends ExpressionSetDetail {

    /**
     * Creates an empty instance of ArrayDesignCollectionDetail
     */
    public ArrayDesignCollectionDetail() {
        super();
    }


    /**
     * Creates an instance of ArrayDesignCollectionDetail that represents
     * array design data referenced by submitted expression set tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Expression set tair object id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public ArrayDesignCollectionDetail( DBconnection conn, Long tair_object_id ) throws SQLException {
        if ( tair_object_id != null ) {
            get_information( conn, tair_object_id );
        }
    } 

    /**
     * Creates an instance of ArrayDesignCollectionDetail that represents
     * array design data referenced by submitted expression set name.
     *
     * @param conn An active connection to the database
     * @param name ExpressionSet name to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public ArrayDesignCollectionDetail( DBconnection conn, String name ) throws SQLException {
        if ( name != null ) {
            get_information( conn, name );
        }
    }


    /** 
     * Populates object with array design referenced by submitted expression set name
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
     * Populates object with array design data referenced by submitted tair object_id.  This
     * method overrides superclass implementation so that only basic expression set info. 
     * and array design info is retrieved
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
	if ( get_expression_set_id() != null ) { 
	    populateArrayDesigns( conn, get_expression_set_id() );
        }
    }


    /**
     * Populate array design data for expression set with submitted expression_set_id. This
     * method is called by get_information() in super-class, and overrides super-class
     * implementation to retrieve all associated array design for expression set
     *
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
     * Determines if this object has associated hyb descriptions.
     * @return true 
     */
    // overwrite the method in super 
    public boolean hasHybDescriptions() {
        return true;
    }

    /**
     * Return the uniq array designs associated to expression set
     * @return a iterator of arraydesign ids as Long value 
     */
    public Iterator getUniqArrayDesignIds (){
       return  arrayDesigns.getUniqArrayDesignIds () ;
    }
    
    /**
     * Return the number of uniq array design ids associated to expression set
     @return an int
     */
    public int getNumberUniqArrayDesignIds (){
       return  arrayDesigns.getNumberUniqArrayDesignIds () ;
    }

    /**
     * Get iterator of HybDescriptionObject for an given array design id associated to expression set
     * @return Elements in collection as an <code>Iterator</code> of <code>HybDescriptionObject</code>
     * objects, or <code>null</code> if no elements in collection 
     */
    public Iterator getHybDescriptionsForArrayDesign( Long array_design_id){
	return arrayDesigns.getHybDescriptionsForArrayDesign(array_design_id );
    }
    
    /**
     * Get the first HybDescriptionObject for an given array design id associated to expression set
     * @return one <code>HybDescriptionObject</code>
     * objects, or <code>null</code> if no elements in collection 
     */
    public  HybDescriptionObject getFirstHybDescriptionForArrayDesign( Long array_design_id){
	return arrayDesigns.getFirstHybDescriptionForArrayDesign(array_design_id );
    }

    public void test() {
    }
            
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

    }

}



