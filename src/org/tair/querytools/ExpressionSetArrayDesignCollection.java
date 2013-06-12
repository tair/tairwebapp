/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * ExpressionSetArrayDesignCollection is a custom collection that stores
 * as a collection of <code>ArrayDesign</code> objects. 
 *
 * <p>
 * Since the the array designs for a given expression set's hybdescriptions duplicates.
 * display the array designs in hybdescription page is not ideal, we want to seperate 
 * the array designs for a expression set in a different page 
 */

public class ExpressionSetArrayDesignCollection  {   
    
    // the array design id and it's corresponding of Hybdecriptions
    // as a map 
    private HashMap arrayDesigns;
    
    /** an empty instance of ExpressionSetArrayDesignCollection 
     */
    public ExpressionSetArrayDesignCollection() { 
       
        arrayDesigns = new HashMap(); 
    }

    /**
     * Creates an instance of  ExpressionSetArrayDesignCollection that
     * represents a full collection of ArrayDesign Ids and it's associated 
     * HybDescription  objects for submitted expression_set_id
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public ExpressionSetArrayDesignCollection( DBconnection conn, Long expression_set_id ) 
        throws SQLException {
       
        arrayDesigns = new HashMap(); 
        if ( expression_set_id != null ) {
            populateArrayDesign ( conn, expression_set_id ); 
        }
    }

    // populate arraydesign hashmap 
    // key on arraydesign id, value is a List of HybDescriptionObject
    private void populateArrayDesign ( DBconnection conn, Long expression_set_id)
	throws SQLException {
        ResultSet results = null;
      
        String  query =
            "SELECT array_design_id, hyb_description_id " +
            "FROM HybDescription  "+ 
            "WHERE expression_set_id = "+ expression_set_id.toString() +
            " ORDER BY (array_design_id) "; 
     
	conn.setQuery( query );
	results = conn.getResultSet();	
	while ( results.next() ) {
            if ( results.getLong( "array_design_id") > 0 ){
                List hybdescriptions = new ArrayList();
		Long array_design_id = new Long( results.getLong( "array_design_id")) ;
		Long hyb_description_id = new Long( results.getLong("hyb_description_id"));
		if ( arrayDesigns.containsKey (array_design_id) ){
                    hybdescriptions = (List)arrayDesigns.get(array_design_id);
		}   

		// create hyb description and populate associated labeled 
		// sample data
		HybDescriptionObject hybDescription =  
		    new HybDescriptionObject( conn,hyb_description_id );
		hybDescription.populateLabeledSamples( conn );

		hybdescriptions.add( hybDescription );
                
		arrayDesigns.put( array_design_id, hybdescriptions );
	    }  
	}
       
	conn.releaseResources();
    }

    /**
     * Return the uniq array design ids for the HybDescriptions of a expression set 
     * The reason is the HybDescriptionObjects for an ExpressiobSet may have common 
     * array designs
     * @return a iterator of arraydesign ids as Long value 
     */
    // the hasCommonArrayDesign() method determine if all the hybdesription has common arraydesing
    // this method similar to that but return a uniq set of  arraydegines in case 
    // some HybDescriptions share an arraydesign while others share another

    public Iterator getUniqArrayDesignIds (){
        return  (arrayDesigns == null || arrayDesigns.isEmpty())? null : arrayDesigns.keySet().iterator();
    }
      
     /**
     * Return the number of uniq array design ids associated to expression set
     @return an int
     */
    public int  getNumberUniqArrayDesignIds(){
        return  (arrayDesigns == null || arrayDesigns.isEmpty())? 0 : arrayDesigns.size();
    }  
 
    /**
     * Get iterator of HybDescriptionObject for an given array design id 
     * @return Elements in collection as an <code>Iterator</code> of <code>HybDescriptionObject</code>
     * objects, or <code>null</code> if no elements in collection 
     */
    public Iterator getHybDescriptionsForArrayDesign( Long array_design_id){
	 return (arrayDesigns == null || arrayDesigns.isEmpty())? null : 
	     ((List)arrayDesigns.get(array_design_id)).iterator();
    }

    /**
     * get first HybDescriptionObject for a given array design id 
     * @return a <code>HybDescriptionObject</code> , 
     */
    public HybDescriptionObject getFirstHybDescriptionForArrayDesign( Long array_design_id){
          return (arrayDesigns == null || arrayDesigns.isEmpty())? null : 
	    (( HybDescriptionObject)((List)arrayDesigns.get(array_design_id)).get(0));
    }
    /**
     * determine if there is any arrsy design for the expression set
     * @return true if the collection is empty, false otherwise 
     */
    public boolean isEmpty (){
        return  arrayDesigns == null || arrayDesigns.isEmpty() ;
    }
}
