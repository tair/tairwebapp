//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.10 $
// $Date: 2004/06/09 18:09:54 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * HybDescriptionObjectCollection is a custom collection that stores as a 
 * collection of <code>HybDescriptionObject/code> objects. 
 *
 * <p>
 * Since the number of hyb descriptions associated to an expression set may
 * be so high that displaying them all on the expression set detail page 
 * is impractical, collection can be populated in "count" mode. In 
 * this mode, HybDescriptionObjects will not be created and stored in 
 * collection, but total number of associated objects will be retrieved and 
 * saved for display.
 *
 * <p>
 * Regardless of population mode, the total number of hyb descriptions and hyb
 * data slides associated  to the expression set will be stored and can be 
 * retrieved using the fullSize(), and getNumberHybData() methods
 */


public class HybDescriptionObjectCollection  {   
    private ArrayList hybDescriptions ;

    // total number of hyb descriptions associated to expression set
    private int fullSize = 0;

    // total number of hyb data entries associated to expression set through
    // hyb description
    private int hybDataCount = 0;


    /**
     * Creates an empty instance of HybDescriptionObjectCollection
     */
    public HybDescriptionObjectCollection() { 
        hybDescriptions = new ArrayList();
    }

    /**
     * Creates an instance of HybDescriptionObjectCollection that
     * represents a full collection of HybDescriptionObject objects for 
     * submitted expression_set_id
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public HybDescriptionObjectCollection( DBconnection conn, 
					   Long expression_set_id ) 
	throws SQLException {

        hybDescriptions = new ArrayList();

	// create unabbreviated collection
	populate( conn, expression_set_id, "all" );
    }


    /**
     * Creates an instance of HybDescriptionObjectCollection that represents a 
     * collection of HybDescriptionObject objects for submitted 
     * expression_set_id. Objects will be created according to the population 
     * mode parameter.  Possible values of mode are:
     * <ul>
     * <li>all - Creates objects for all associated elements regardless of 
     * number</li>
     * <li>count - Skips object creation for all elements and only populates 
     * counts of associated elements</li>
     * </ul><br>
     * 
     * After collection is created, total number of hyb descriptions can be
     * determined through the fullSize() method
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @param mode Population mode to use when retrieving and creation objects
     * @throws SQLException if a database error occurs
     */
    public HybDescriptionObjectCollection( DBconnection conn, 
					   Long expression_set_id, 
					   String mode ) 
	throws SQLException {

        hybDescriptions = new ArrayList();
	populate( conn, expression_set_id, mode );
    }


    
    /**
     * Retrieve associated hyb description ids & create HybDescriptionObjects 
     * for each  according to population mode.  
     *
     * If mode is "all" create objects for all associated elements
     *
     * If mode is "count" skip object creation and just retrieve counts
     *
     * Store total number of hyb descriptions for expression set so that client 
     * code can tell how many associated elements expression set has regardless
     * of actual contents of collection. Also store total number of hyb data 
     * elements associated to expression set through hyb description.
     */
    private void populate( DBconnection conn,
			   Long expression_set_id, 
			   String mode )
        throws SQLException {

        ArrayList ids = null;
        HashSet uniq_ids = new HashSet();

	String query =
	    "SELECT hyb_description_id, reverse_id "+
	    "from HybDescription "+
	    "where expression_set_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( expression_set_id );
	
	ResultSet results = conn.getResultSet();
	while( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }       
	    Long hyb_description_id = 
		new Long( results.getLong( "hyb_description_id" ) );

	    Long reverse_id = null;
	    if ( results.getLong("reverse_id") >0 ){
		reverse_id = new Long( results.getLong( "reverse_id" ) ); 
	    } 
	    if ( !uniq_ids.contains ( hyb_description_id ) ) {
		ids.add ( hyb_description_id );
		uniq_ids.add ( hyb_description_id);
	    }
	    if (reverse_id != null && ! uniq_ids.contains ( reverse_id) ){
		ids.add ( reverse_id );
		uniq_ids.add ( reverse_id);
	    }
               
	}
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {
	    this.fullSize = ids.size();
	    
	    // Only create objects if in all mode
	    if ( mode.equals( "all" ) ) { 
		Iterator iter = ids.iterator();
		while ( iter.hasNext() ) {
		    add( new HybDescriptionObject( conn, (Long) iter.next() ) );
		}
	    }
	}
	
	// get count of associated hyb data elements
	countHybData( conn, expression_set_id, mode );
    }
    
    /**
     * Determine total number of hyb data entries associated to expression set
     * counting entries for each associated hyb description. If collection 
     * contains objects for all associated hyb descriptions, this can be done by
     * iterating through contents of collection, however if collection contains
     * counts only, counting will have be done from the database
     */
    private void countHybData( DBconnection conn,
			       Long expression_set_id, 
			       String mode ) 
        throws SQLException {

        if ( mode.equals( "count" ) ) {
            String query =
                "SELECT COUNT( DISTINCT hda.hyb_data_id ) AS data_count " +
                "FROM HybData hda, HybDescription hd " +
                "WHERE hda.hyb_description_id = hd.hyb_description_id " +
                "AND hd.expression_set_id = ?";
      
            conn.setQuery( query );
	    conn.setQueryVariable( expression_set_id );
	    
            ResultSet results = conn.getResultSet();
            while ( results.next() ) {
                this.hybDataCount = results.getInt( "data_count" );
            }
            conn.releaseResources();

        } else if ( !isEmpty() ) {
            HybDescriptionObject hybDescription = null;

	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		hybDescription = (HybDescriptionObject) iter.next();
		this.hybDataCount += hybDescription.getNumberHybData();
            }
        }
    }
    

    /**
     * Retrieves total number of hyb data entries associated to hyb descriptions
     * associated to expression set. Depending on population mode, this number 
     * may not directly correspond to number of hyb data objects accessible 
     * through hyb description objects currently in collection, but will always 
     * return total number of hyb data entries for expression set.
     *
     * <p>
     * This data is useful on the expression set detail page where total number 
     * of hyb data entries for expression set is needed for display, while 
     * actual display of hyb data entries is done on another page
     *
     * @return Total number of hyb data entries associated to hyb descriptions 
     * that are associated to expression set
     */
    public int getNumberHybData() {
        return hybDataCount;
    }

    /**
     * Retrieves the total number of hyb descriptions associated to expression 
     * set. This is different from the size() method which will only return the
     * number of elements actually in the collection. Since object creation will
     * be skipped if collection was created in "count" mode, the number of 
     * elements currently in collection cannot be used to get number of 
     * associated elements for expression set.
     *
     * <p>
     * This information is useful on the expression set detail page where JSP 
     * must display number of hyb descriptions associated to expression set, 
     * while actual display of elements may occur on a different page.
     *
     * @return Number of hyb descriptions associated to expression set 
     * regardless of actual contents of collection.
     */
    public int fullSize() { 
	return fullSize; 
    }

    /**
     * Determines if array design info. of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations,
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same array design id (even if that id is <code>null</code>), or
     * <code>false</code> if hybDescriptions do not share the same array design
     * id
     */
    public boolean hasCommonArrayDesign() {
        Iterator iter = null;
        Long firstID = null;
        Long currentID = null;
        HybDescriptionObject hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = longValuesEqual( firstID, currentID )) ) {

                hybDescription = (HybDescriptionObject) iter.next();
                currentID = hybDescription.get_array_design_id();
                if ( first ) {
                    firstID = currentID;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }

  
    /**
     * Determines if protocol info. of hybridizations in collection is common, 
     * and can therefore just be displayed once for all hybridizations, rather
     * than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have 
     * the same protocol reference id (even if that id is <code>null</code>), or 
     * <code>false</code> if hybDescriptions do not share the same protocol 
     * reference id
     */
    public boolean hasCommonProtocol() {
        Iterator iter = null;
        Long firstID = null;
        Long currentID = null;
        HybDescriptionObject hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = longValuesEqual( firstID, currentID )) ) {

                hybDescription = (HybDescriptionObject) iter.next();
                currentID = hybDescription.get_hyb_protocol_ref_id();
                if ( first ) {
                    firstID = currentID;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }


    /**
     * Determines if scanning software of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same scanning software id (even if that id is <code>null</code>), 
     * or <code>false</code> if hybDescriptions do not share the same scannning 
     * software id
     */
    public boolean hasCommonScanningSoftware() {
        Iterator iter = null;
        Long firstID = null;
        Long currentID = null;
        HybDescriptionObject hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() &&
		    (hasCommon = longValuesEqual( firstID, currentID )) ) {

                hybDescription = (HybDescriptionObject) iter.next();
                currentID = hybDescription.get_scanning_software_id();
                if ( first ) {
                    firstID = currentID;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }



    /**
     * Determines if scanning hardware of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same scanning hardware description, or <code>false</code> if 
     * hybDescriptions do not share the same scannning hardware description
     */
    public boolean hasCommonScanningHardware() {
        Iterator iter = null;
        String firstValue = null;
        String currentValue = null;
        HybDescriptionObject hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = stringValuesEqual( firstValue, 
						    currentValue )) ) {
		
                hybDescription = (HybDescriptionObject) iter.next();
                currentValue = hybDescription.get_scanner();
                if ( first ) {
                    firstValue = currentValue;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }
  

    /**
     * Determines if normalizing description of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same normalizing description, or <code>false</code> if  
     * hybDescriptions do not share the same normalizing function
     */
    public boolean hasCommonNormalizationDesc() {
        Iterator iter = null;
        String firstValue = null;
        String currentValue = null;
        HybDescriptionObject hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = stringValuesEqual( firstValue, 
						    currentValue )) ) {

                hybDescription = (HybDescriptionObject) iter.next();
                currentValue = hybDescription.get_normalization_desc();
                if ( first ) {
                    firstValue = currentValue;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }


    /**
     * Utility method to determine if two Long values are equal - return true 
     * even if that means both are null
     */
    private boolean longValuesEqual( Long firstValue, Long currentValue ) {
        boolean valuesEqual = false;
    
        if ( firstValue == null && currentValue == null ) {
            valuesEqual = true;
        } else if ( firstValue != null && firstValue.equals( currentValue ) ) {
            valuesEqual = true;
        }
        return valuesEqual;
    }
  
    /**
     * Utility method to determine if two String values are equal - return true 
     ** even if that means both are null
     */
    private boolean stringValuesEqual( String firstValue, 
				       String currentValue ) 
    {
        boolean stringsEqual = false;
    
        if ( firstValue == null && currentValue == null ) {
            stringsEqual = true;
        } else if ( firstValue != null && firstValue.equals( currentValue ) ) {
            stringsEqual = true;
        }
        return stringsEqual;
    }


    /**
     * Populates collection of labeled samples for each hyb description in 
     * collection. This is done explicitly to avoid duplication of data in some 
     * contexts HybDescriptionObject is used (in particular in the microarray 
     * data loading tools).
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateLabeledSamples( DBconnection conn ) 
        throws SQLException {

        if ( !isEmpty() ) {
            HybDescriptionObject hybDescription = null;
            for ( Iterator iter = iterator(); iter.hasNext(); ) {
                hybDescription = (HybDescriptionObject) iter.next();
                hybDescription.populateLabeledSamples( conn );
            }
        }
    }
    

    /**
     * Determines if collection has elements in it 
     *
     * @return <code>true</code> if collection has no elements in it, or 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return hybDescriptions.isEmpty();
    }

    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return hybDescriptions.size();
    }

    
    /**
     * Retrieves all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of 
     * <code>HybDescriptionObject</code> objects, or <code>null</code> if no 
     * elements in collection
     */
    public Iterator iterator() { 
	return hybDescriptions.iterator();
    }


    /**
     * Adds supplied element to collection
     * 
     * @param hybDescription Element to add to collection
     */
    public void add( HybDescriptionObject hybDescription ) { 
	hybDescriptions.add( hybDescription ); 
    }
  
    /**
     * Removes supplied element from collection.
     *
     * @param hybDescription HybDescription to remove from collection
     */
    public void remove( HybDescriptionObject hybDescription ) { 
	hybDescriptions.remove( hybDescription ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code>if element is not found
     */
    public boolean contains( HybDescriptionObject hybDescription ) { 
	return hybDescriptions.contains( hybDescription ); 
    }
  
    /**
     * Retrieves elements at submitted index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public HybDescriptionObject get( int index ) {
        return (HybDescriptionObject) hybDescriptions.get( index );
    }    

    /**
     * Determines index of submitted object
     *
     * @param hybDescription HybDescriptionObject of index to retrieve
     * @return index of HybDescriptionObject within Collection
     */
    public int indexOf( HybDescriptionObject hybDescription ) {
        return ( hybDescriptions.indexOf( hybDescription ) );
    }    

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "** HybDescriptionObjectCollection test **" );
        if ( hybDescriptions != null && !hybDescriptions.isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                HybDescriptionObject hybDescription = 
		    (HybDescriptionObject) iter.next();
                hybDescription.test();
            }
        }
  
        System.out.println( "full size: " + fullSize() );
        System.out.println( "size: " + size() );
        System.out.println( "hyb data count: " + getNumberHybData() );
        System.out.println( "** HybDescriptionObjectCollection test end **" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 88 );

            System.out.println( "All mode..." );
            HybDescriptionObjectCollection descriptions = 
		new HybDescriptionObjectCollection( conn, 
						    id, 
						    "all" );
            descriptions.test();

            System.out.println( "\nCount mode..." );
            descriptions =
		new HybDescriptionObjectCollection( conn, id, "count" );
            descriptions.test();


        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
