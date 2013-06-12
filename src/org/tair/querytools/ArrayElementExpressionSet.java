//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2005/01/08 00:23:08 $
//---------------------------------------------------------------------

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcArrayElement;
import org.tair.tfc.TfcExpressionSet;
import org.tair.tfc.TfcKeyword;

/**
 * ArrayElementExpressionSet is a class to generically represent an ExpressionSet  for an 
 * ArrayElement entry with it's associated HybDescription data.
 */

public class  ArrayElementExpressionSet  extends TfcExpressionSet {
    // hyb descriptions associated to this expression set
    private ArrayList hybDescriptions ;
    // keyword ids associated to this expression set where relationship_type = experiment category  
    private ArrayList categoryKeywords ; 
    
    private Long array_element_id ;
    
    /**
     * Creates an instance of ArrayElementExpressionSet that contains data for submitted array_element_id 
     * and tair_object_id of expression set 
     *
     * @param conn An active connection to the database
     * @param array_element_id 
     * @param tair_object_id Tair object id of the expression set 
     * @throws SQLException if a database error occurs
     */
    public ArrayElementExpressionSet( DBconnection conn,  Long array_element_id ,Long tair_object_id ) 
        throws SQLException {
	super( conn, tair_object_id );
	this.array_element_id =  array_element_id ;
	if( get_expression_set_id() != null ){
            populateHybDescriptions ( conn, array_element_id, get_expression_set_id() );
            populateCategoryKeywords ( conn, tair_object_id );
	} 
    }

    // populate the hybdescriptions for an expression_set_id and array_element_id
    // currently stored as an arraylist of ArrayElementHybDescription object 
    private void populateHybDescriptions (  DBconnection conn, Long array_element_id, Long  expression_set_id ) 
        throws SQLException {
	ArrayList ids = null;
        ResultSet results = null;  
        Iterator iter = null;
        String arrayDesignType =  TfcArrayElement.arrayDesignPlatformType ( conn,array_element_id );
        String from_table =  arrayDesignType.equals( "dual") ? "DualChannelHybData" : "SingleChannelHybData" ; 
        String columns =  arrayDesignType.equals( "dual") ? "fold_change , fold_change_stderr ": " signal, signal_percentile ";  
 
	String query = "SELECT hds.hyb_description_id as hyb_description_id , hd.name as name, " + 
            "hd.hyb_data_id  as hyb_data_id , " + columns +
            "FROM HybDescription hds , HybData hd, " + from_table + " s " + 
	    "WHERE hds.expression_set_id = " + expression_set_id.toString() +
            " AND hds.hyb_description_id = hd.hyb_description_id  " +
            " AND s.hyb_data_id = hd.hyb_data_id " +    
           ( ! arrayDesignType.equals("dual") ? " AND s.detection = 'P' " : " "  ) + 
            " AND s.array_element_id = " + array_element_id.toString() ;

        conn.setQuery( query );
	results = conn.getResultSet();
	while( results.next() ) {
	    Long hyb_description_id = new Long( results.getLong( "hyb_description_id" ) ); 
            Long hyb_data_id = new Long( results.getLong("hyb_data_id"));
            String name =  results.getString( "name" ); 
	    if ( hybDescriptions == null ){
		hybDescriptions = new ArrayList();
            }
            ArrayElementHybDescription aehd = new  ArrayElementHybDescription(conn, hyb_description_id );
            aehd.setHybName( name); 
            if ( arrayDesignType.equals( "dual") ){
                Float fold_change =  new Float(results.getFloat( "fold_change" ) );
                Float fold_change_stderr =  new Float(results.getFloat( "fold_change_stderr" ) );
	        aehd.setFoldChange( fold_change );
                aehd.setFoldChangeStdErr( fold_change_stderr );
	    }else {
                Float signal =  new Float(results.getFloat( "signal" ) );
                Float signal_percentile =  new Float(results.getFloat( "signal_percentile" ) );
	        aehd.setSignal( signal);
                aehd.setSignalPercentile(signal_percentile);
            }
            hybDescriptions.add ( aehd ); 
	}	
        conn.releaseResources();
    }

    /**
     * Determines if this object has associated hyb dsecription data
     *
     * @return <code>true</code> if this object has associated hyb description data,
     * <code>false</code> if this object has no associated hyb description data.
     */
    public boolean hasHybDescriptions() { 
        return hybDescriptions!= null && hybDescriptions.size()> 0 ;
    }

    /**
     * Determines number of hybdescriptions in collection
     *
     * @return Number of hybdescriptions in collection
     */
    public int hybDescriptionsCount() { return hybDescriptions.size(); }
    
    /**
     * Retrieves hyb descriptions associated with object
     *
     * @return ArrayElementHybDescription s with this object as an <code>Iterator</code>
     * of <code> ArrayElementHybDescription</code> objects, or <code>null</code> if no 
     * ArrayElementHybDescription associated with this object.
     */ 
    public Iterator getHybDescriptions() { return hybDescriptions.iterator(); }
    
    // populate the category for an expression_set_id and array_element_id
    // currently stored as an arraylist of TfcKeyword object 
    private void  populateCategoryKeywords ( DBconnection conn, Long  tair_object_id) 
	throws SQLException {
        ResultSet results = null;  
        ArrayList ids = null ; 
        Iterator iter = null;
	String query = "SELECT keyword_id "+
	    "FROM TairObject_Keyword  tk, RelationshipType rt " + 
	    "WHERE tk.relationship_type_id = rt.relationship_type_id " +
            "AND rt.relationshiptype_type = 'experiment category' " +
            "AND tk.tair_object_id ="+tair_object_id.toString();
       	conn.setQuery( query );
	results = conn.getResultSet();
	while( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }       
	    Long keyword_id = new Long( results.getLong( "keyword_id" ) );
	    ids.add ( keyword_id );
	}   
                
	conn.releaseResources();	
        if ( ids != null && !ids.isEmpty() ) {
            iter = ids.iterator();
	    while ( iter.hasNext() ) {
                Long keyword_id   =  (Long) iter.next();
                addKeyword( new TfcKeyword( conn, keyword_id  ) );
	    }
	}
    }
   /**
     * Determines if this object has associated category keywords
     *
     * @return <code>true</code> if this object has associated category keyword,
     * <code>false</code> if this object has no associated category keyword.
     */
    public boolean hasCategoryKeywords() { 
        return categoryKeywords!= null &&  categoryKeywords.size()> 0 ;
    }

    /**
     * Retrieves the first category keyword associated with object
     *
     * @return first category keyword name as <code> String </code>
     */      
    public String getFirstCategoryKeywordName(){
        return  hasCategoryKeywords() ? ((TfcKeyword)categoryKeywords.get(0)).get_keyword() : "";
    } 

    /**
     * Retrieves category keywords associated with object
     *
     * @return  Category keywords associted with this object as an <code>Iterator</code>
     * of <code>TfcKeyword</code> objects, or <code>null</code> if no 
     * TfcKeyword associated with this object.
     */ 
    public Iterator getCategoryKeywords() { return categoryKeywords.iterator(); }  
    /**
     * Adds supplied element to collection
     * 
     * @param TfcKeyword Element to add to collection
     */
    public void addKeyword( TfcKeyword keyword ) {
        if ( categoryKeywords == null ){
           categoryKeywords = new ArrayList();
        } 
        categoryKeywords.add( keyword ); 
    }
}

