//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2004/11/18 20:35:44 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidActionException;

/**
 * LoadableBioSampleCollection is a custom collection that stores bio 
 * samples for an expression set  as a collection of 
 * <code>LoadableBioSample/code> objects. This class is created specifically
 * for use in microarray data loading and curation.
 */


public class LoadableBioSampleCollection  {   
    private ArrayList bioSamples;

    // list of bio samples that have been removed from collection since
    // it was created -- these are held until store() is called at which
    // point they will be deleted from the database
    private ArrayList removed;

    // expression set id for all bio samples in collection
    private Long expressionSetID;

    /**
     * Creates an empty instance of LoadableBioSampleCollection
     */
    public LoadableBioSampleCollection() { 
        bioSamples = new ArrayList();
    }

    /**
     * Creates an instance of LoadableBioSampleCollection that represents a 
     * full collection of LoadableBioSample objects for submitted 
     * expression_set_id.
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableBioSampleCollection( DBconnection conn, 
					Long expression_set_id ) 
        throws SQLException {

        bioSamples = new ArrayList();

	this.expressionSetID = expression_set_id;
	populate( conn ); 
    }


    /**
     * Retrieve associated bio sample ids & create LoadableBioSamples for each.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {

        ArrayList ids = null;

	String query =
	    "SELECT bio_sample_id "+
	    "FROM BioSample "+
	    "WHERE expression_set_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( expressionSetID );
	
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "bio_sample_id" ) ) );
	}
	conn.releaseResources();
	
	if ( ids != null && !ids.isEmpty() ) {
	    Iterator iter = ids.iterator();
	    LoadableBioSample bioSample = null;
	    while ( iter.hasNext() ) {
		bioSample =  new LoadableBioSample( conn, 
						    (Long) iter.next() );
		bioSamples.add( bioSample );
            }
        }
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
     * <code>LoadableBioSample</code> objects, or <code>null</code> if no 
     * elements in collection
     */
    public Iterator iterator() {
        return !isEmpty() ?  bioSamples.iterator() : null;
    }
  
    /**
     * Retrieves bio sample at index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public LoadableBioSample get( int index ) {
        return (LoadableBioSample) bioSamples.get( index );
    }    

    /**
     * Retrieves bio sample with submitted name
     *
     * @return Bio sample with submitted name
     */
    public LoadableBioSample get( String name ) {
	if(name == null) { throw new RuntimeException();}
	LoadableBioSample bioSample = null;

	if ( !isEmpty() ) {
	    LoadableBioSample tmpBioSample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		tmpBioSample = (LoadableBioSample) iter.next();
                if ( name.equalsIgnoreCase( tmpBioSample.get_name() ) ) {
		    bioSample = tmpBioSample;
		    break;
		}
	    }
	}
	return bioSample;
    }


    /**
     * Adds supplied element to collection
     * 
     * @param bioSample Element to add to collection
     */
    public void add( LoadableBioSample bioSample ) {
	bioSamples.add( bioSample ); 
    }
  

    /**
     * Removes supplied element from collection. This will delete the 
     * bio sample next time store is called.
     *
     * @param bioSample Bio sample to remove from collection
     */
    public void remove( LoadableBioSample bioSample ) { 

	// If bio sample has a bio sample id, add to list of 
	// items to be deleted next time store is called.  If
	// id is null, no further action is necessary.
	if ( bioSample.get_bio_sample_id() != null ) {
	    if ( removed == null ) {
		removed = new ArrayList();
	    }
	    removed.add( bioSample );
	}
	bioSamples.remove( bioSample ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code>if element is not found
     */
    public boolean contains( LoadableBioSample bioSample ) { 
	return bioSamples.contains( bioSample ); 
    }
  
    /**
     * Sets expression set id for all bio samples in collection. This is 
     * used when creating new bio samples for a new expression set.
     *
     * @param expressionSetID Expression set id to set for all bio samples
     * in collection
     */
    public void setExpressionSetID( Long expressionSetID ) {
	this.expressionSetID = expressionSetID;

	if ( !isEmpty() ) {
	    LoadableBioSample bioSample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		bioSample = (LoadableBioSample) iter.next();
		bioSample.set_expression_set_id( expressionSetID );
	    }
	}
    }


    /**
     * Stores collection of bio samples for an expression set to the 
     * database. Any pre-existing bio samples will be UPDATEd, any new hyb
     * descriptions will be inserted. Any bio samples that were removed 
     * from collection since it was created will now be DELETEd.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if required info has not been
     * set for any bio samples in collection.
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	Iterator iter = null;
	LoadableBioSample bioSample = null;

	// first delete any items removed since collection was created
	if ( removed != null ) {
	    for ( iter = removed.iterator(); iter.hasNext(); ) {
		bioSample = (LoadableBioSample) iter.next();
		bioSample.delete( conn );
	    }
	}

	// now store all items in collection
	for ( iter = iterator(); iter.hasNext(); ) {
	    bioSample = (LoadableBioSample) iter.next();
	    bioSample.store( conn );
	}
    }
    



    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "** LoadableBioSampleCollection content test **" );
        if ( bioSamples != null && !bioSamples.isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                LoadableBioSample bs_object = ( LoadableBioSample ) iter.next();
                bs_object.test();
            }
        }

        System.out.println( "size: " + size() );
        System.out.println( "** LoadableBioSampleCollection content end **" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 88 );

            LoadableBioSampleCollection bioSamples = 
		new LoadableBioSampleCollection( conn, test_id );
            bioSamples.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
