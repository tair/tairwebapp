/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcArrayElement;

/**
 * ArrayElementExpressionSetCollection is a custom collection that stores
 * expressionsets associated to an array element 
 * as a list of <code>ArrayElementExpressionSet</code> objects. 
 */

public class ArrayElementExpressionSetCollection {   
   
    private ArrayList expressionSets;

    private Long array_element_id ;
    
    private String arrayDesignPlatformType ; 

    private int  expression_size = 0;  
    // this is the slides size of all expression set 
    private int  slide_size = 0 ;

    /**
     * Creates an empty instance of ArrayElementExpressionSetCollection
     */
    public ArrayElementExpressionSetCollection() { 
        expressionSets = new ArrayList();
    }

    /**
     * Creates an instance of ArrayElementExpressionSetCollection that represents a collection of 
     * ExpressionSet for submitted array_element_id and type
     *
     * @param conn An active connection to the database
     * @param array_element_id Array element id to retrieve expressionSet for
     * @param type  
     * @exception SQLException in the case of an invalid operation or database error
     */
    //type should be one of these : present_all/present_count
    //                               expressed_all/expressed_count 
    public ArrayElementExpressionSetCollection( DBconnection conn, Long array_element_id, String type ) 
	throws SQLException {
        this.array_element_id = array_element_id ;
	expressionSets = new ArrayList();
        arrayDesignPlatformType  =  TfcArrayElement.arrayDesignPlatformType ( conn, array_element_id );
	populate( conn, array_element_id, type );
    }

    // retrieve expression ids associated to array element id through Spot, ArrayDesign and 
    // HybDescriotion table
    // create ExpressionSet objects for each
    // type should be one of these : present_all/present_count
    //                               expressed_all/expressed_count 
    private void populate( DBconnection conn, Long array_element_id, String type )
        throws SQLException {
        ResultSet results = null;
        ArrayList ids = null;
        Iterator iter = null;
   
        String query = makeQueryString( array_element_id, type  );   
         
        if ( type.endsWith( "count") ){
            conn.setQuery( query );
            results = conn.getResultSet();
            if ( results.next() ) {
		// slide count for expressed list 
		// expression set count for present list
                if ( type.equals( "expressed_count") ){
		    slide_size = results.getInt( 1 );
                }else{
                    expression_size = results.getInt( 1 );
                }
            }
        }else {
	    conn.setQuery( query );

	    results = conn.getResultSet();
	    while ( results.next() ) {
		if ( ids == null ) {
		    ids = new ArrayList();
		}
		ids.add( new Long( results.getLong( "tair_object_id" ) ) );
	    }
	    conn.releaseResources();
        
	    if ( ids != null && !ids.isEmpty() ) {
		expression_size =  ids.size() ;
		iter = ids.iterator();
		while ( iter.hasNext() ) {
		    ArrayElementExpressionSet aees =  
                       new ArrayElementExpressionSet( conn,  array_element_id, (Long) iter.next() );
                    if ( type.equals( "expressed_all") ){
			slide_size +=  aees.hybDescriptionsCount();
                    }
		    add( aees );
		}
	    }
	}
        //
        if (type.equals("expressed_all")){ 
            Collections.sort(  expressionSets, new ExpressionSetComparator() );
        }

    }

    // helper function to make the query string for given array_element_id
    // and query type 
    public String makeQueryString( Long array_element_id, String type){
	StringBuffer present_from = new StringBuffer( 
              "FROM Spot s, HybDescription hd , ExpressionSet es " +
			   "WHERE s.array_design_id =  hd.array_design_id " +
			   "AND es.expression_set_id  = hd.expression_set_id " +
			   "AND  s.array_element_id = " + array_element_id.toString() );
            
        StringBuffer expressed_from = new StringBuffer(
	         "FROM HybDescription hd , ExpressionSet es, HybData hdata, " + 
                ( arrayDesignPlatformType.equals("dual") ? "DualChannelHybData s " : "SingleChannelHybData s " )+ 
                 "WHERE s.hyb_data_id = hdata.hyb_data_id " +  
		 "AND hd.hyb_description_id = hdata.hyb_description_id " + 
		 "AND es.expression_set_id = hd.expression_set_id  " + 
	        ( ! arrayDesignPlatformType.equals("dual") ? " AND s.detection = 'P' " : " "  ) + 
		 "AND s.array_element_id = " + array_element_id.toString());

        StringBuffer query = new StringBuffer(); 
        if ( type.equals("present_count" ) ){
	    query .append ("SELECT count( DISTINCT es.tair_object_id) " );
	    query.append ( present_from);            
        }else if (type.equals("expressed_count" ) ){
            query .append("SELECT count( *) " );
	    query.append ( expressed_from); 
        }else if (type.equals("present_all") ){
            query .append( "SELECT DISTINCT es.tair_object_id, es.name " );
	    query.append ( present_from); 
	    query.append ( " ORDER BY es.name" );  
        }else if ( type.equals("expressed_all")){
   	    query.append( "SELECT DISTINCT es.tair_object_id " );
            query.append ( expressed_from);
      	}
       
	return query.toString();
   
    } 
  
    public Long getArrayElementId() {
	return array_element_id ;
    }

    /**
     * Determines if collection contains elements or not
     *
     * @return <code>true</code> if collection has no elements in it, or <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return expression_size == 0 ; }
    
    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int expressionSize() { return expression_size; }

    public int slideSize(){ return slide_size; }
    /**
     * Retrieves all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of <code>ArrayElementExpressionSet</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() {
        return !isEmpty() ? expressionSets.iterator() : null;
    }
  
    /**
     * Retrieves element at submitted index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public  ArrayElementExpressionSet get( int index ) { 
       return (ArrayElementExpressionSet)expressionSets.get( index ); 
    }
  
   /**
     * Adds supplied element to collection
     * 
     * @param expressionSet ExpressionSet to add to collection
     */
    public void add( ArrayElementExpressionSet expressionSet ) { expressionSets.add( expressionSet ); }
}
