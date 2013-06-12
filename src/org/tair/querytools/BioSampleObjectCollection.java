//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/06/09 18:09:53 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * BioSampleObjectCollection is a custom collection that stores bio 
 * samples for an expression set  as a collection of 
 * <code>BioSampleObject/code> objects. 
 *
 * <p>
 * Since the number of bio samples associated to an expression set may
 * be so high that displaying them all on the expression set detail page 
 * is impractical, collection can be populated in "count" mode. In 
 * this mode, BioSampleObjects will not be created and stored in collection,
 * but total number of associated objects will be retrieved and saved for
 * display.
 *
 * <p>
 * Regardless of population mode, the total number of bio samples asociated 
 * to the expression set will be stored and can be retrieved using the 
 * fullSize() method.
 */


public class BioSampleObjectCollection  {   
    private ArrayList bioSamples;

    // total number of bio samples associated to expression set
    private int fullSize = 0;

    /**
     * Creates an empty instance of BioSampleObjectCollection
     */
    public BioSampleObjectCollection() { 
        bioSamples = new ArrayList();
    }

    /**
     * Creates an instance of BioSampleObjectCollection that represents a 
     * full collection of BioSampleObject objects for submitted 
     * expression_set_id.
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public BioSampleObjectCollection( DBconnection conn, 
				      Long expression_set_id ) 
        throws SQLException {

        bioSamples = new ArrayList();

	// create unabbreviated collection
	populate( conn, expression_set_id, "all" ); 
    }


    /**
     * Creates an instance of BioSampleObjectCollection that represents a 
     * collection of BioSampleObject objects for submitted expression_set_id.
     * Objects will be created according to the population mode parameter.  
     * Possible values of mode are:
     * <ul>
     * <li>all - Creates objects for all associated elements regardless of 
     * number</li>
     * <li>count - Skips object creation for all elements and only populates
     * counts of associated elements</li>
     * </ul><br>
     * 
     * After collection is created, total number of associated bio samples can
     * be determined through the fullSize() method
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @param mode Population mode to use when retrieving and creation objects
     * @throws SQLException if a database error occurs
     */
    public BioSampleObjectCollection( DBconnection conn, 
				      Long expression_set_id, 
				      String mode ) 
        throws SQLException {

        bioSamples = new ArrayList();
	populate( conn, expression_set_id, mode );
    }

    /**
     * Retrieve associated bio sample ids & create BioSampleObjects for each 
     * according to  population mode.  
     *
     * If mode is "all" create objects for all associated elements
     *
     * If mode is "count" skip object creation and just retrieve counts
     *
     * Store total number of bio samples for expression set so that client code
     * can tell how many associated elements expression set has regardless of 
     * actual contents of collection.
     */
    private void populate( DBconnection conn, 
			   Long expression_set_id, 
			   String mode )

        throws SQLException {

        ArrayList ids = null;

	String query =
	    "SELECT bio_sample_id "+
	    "FROM BioSample "+
	    "WHERE expression_set_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( expression_set_id );
	
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "bio_sample_id" ) ) );
	}
	conn.releaseResources();
	
	if ( ids != null && !ids.isEmpty() ) {
	    this.fullSize = ids.size(); 
	    
	    
	    // only create objects for each id and store if in "all" mode
	    // (i.e. not in count mode)
	    if ( mode.equals( "all" ) ) { 
		
		Iterator iter = ids.iterator();
		while ( iter.hasNext() ) {
		    bioSamples.add( new BioSampleObject( conn, 
							 (Long) iter.next() ) );
		}
            }
        }
    }
    

    /**
     * Populates collection of labeled samples for each element in collection.
     * This is done explicitly to avoid duplication of data in some contexts
     * BioSampleObject is used (in particular in the microarray data loading
     * tools).
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateLabeledSamples( DBconnection conn ) 
	throws SQLException {

	if ( !isEmpty() ) {
	    BioSampleObject bioSample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		bioSample = (BioSampleObject) iter.next();
		bioSample.populateLabeledSamples( conn );
	    }
	}
    }
    


    /**
     * Retrieves the total number of bio samples associated to expression set. 
     * This is different from the size() method which will only return the 
     * number of elements actually in the collection. Since object creation will
     * be skipped if collection was created in "count" mode, the number of 
     * elements currently in collection cannot be used to get number of 
     * associated elements for expression set.
     *
     * <p>
     * This information is useful on the expression set detail page where JSP
     * must display number of bio samples associated to expression set, while
     * actual display of elements may occur on a different page.
     *
     * @return Number of bio samples associated to expression set regardless of
     * actual contents of collection.
     */
    public int fullSize() {
	return fullSize;
    }


    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it, or 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return ( bioSamples != null && bioSamples.isEmpty() );
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() {
	return ( bioSamples != null ) ? bioSamples.size() : 0;
    }

    
    /**
     * Retrieves all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of 
     * <code>BioSampleObject</code> objects, or <code>null</code> if no 
     * elements in collection
     */
    public Iterator iterator() {
        return !isEmpty() ?  bioSamples.iterator() : null;
    }
  
    /**
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public BioSampleObject elementAt( int index ) {
        return (BioSampleObject) bioSamples.get( index );
    }    

    /**
     * @param bs_object BioSampleObject of index to retrieve
     * @return index of BioSampleObject within Collection
     */
    public int indexOf( BioSampleObject bs_object ) {
        return bioSamples.indexOf( bs_object );
    }    

    /**
     * test BioSampleObjectCollection content
     */
    public void test() {
        System.out.println( "****** BioSampleObjectCollection content test ******" );
        if ( bioSamples != null && !bioSamples.isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                BioSampleObject bs_object = ( BioSampleObject ) iter.next();
                bs_object.test();
            }
        }

        System.out.println( "full size: " + fullSize() );
        System.out.println( "size: " + size() );
        System.out.println( "**** BioSampleObjectCollection content test end ****" );
    }
  
    // this part is for test basic functions
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 88 );

            System.out.println( "All mode..." );
            BioSampleObjectCollection bioSamples = 
		new BioSampleObjectCollection( conn, test_id, "all" );
            bioSamples.test();

            System.out.println( "\nCount mode..." );
            bioSamples = new BioSampleObjectCollection( conn, test_id, "count" );
            bioSamples.test();


        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
