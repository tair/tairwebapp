//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/06/09 18:09:54 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;


/**
 * LabeledSampleCollection is a custom collection that stores as a collection 
 * of <code>LabeledSample/code> objects.
 */

public class LabeledSampleCollection  {   
    private ArrayList labeledSamples;

    /**
     * Creates an empty instance of LabeledSampleCollection
     */
    public LabeledSampleCollection() { 
	labeledSamples = new ArrayList();
    }

    /**
     * Creates an instance of LabeledSampleCollection that represents a 
     * collection of LabeledSample objects for either a bio sample or hyb 
     * description, depending on value of type param. Valid values of type 
     * are:
     *
     * <ul>
     * <li>bio_sample - id should be bio_sample_id</li>
     * <li>hyb_description - id should be hyb_description_id</li>
     * </ul>
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Type of id submitted for populating collection
     * @throws SQLException in the case of an invalid operation or database error
     */
    public LabeledSampleCollection( DBconnection conn, Long id, String type ) 
	throws SQLException {

	labeledSamples = new ArrayList();
	populate( conn, id, type );
    }

    /**
     * Retrieves either associated hyb description ids, or bio sample ids, 
     * depending on value of type, and creates LabeledSample objects to reflect
     * association between submitted id and retrieved ids.
     */
    private void populate( DBconnection conn, Long id, String type ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	ArrayList keyIDs = null;
	Long keyID = null;
	Iterator iter = null;
	LabeledSample sample = null;

	if ( type.equals( "bio_sample" ) ) {
	    query =
		"SELECT hyb_description_id AS key_id " +
		"FROM LabeledSample " +
		"WHERE bio_sample_id = " + id.toString();

	} else if ( type.equals( "hyb_description" ) ) {
	    query =
		"SELECT bio_sample_id AS key_id ,label " +
		"FROM LabeledSample " +
		"WHERE hyb_description_id  = " + id.toString() +
		"  ORDER BY label ";
	}

	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
	    if ( keyIDs == null ) {
		keyIDs = new ArrayList();
	    } 
	    keyIDs.add( new Long( results.getLong( "key_id" ) ) );
	}
	conn.releaseResources();

	if ( keyIDs != null && !keyIDs.isEmpty() ) {
	    iter = keyIDs.iterator();
	    while ( iter.hasNext() ) {
		keyID = (Long) iter.next(); 

		if ( type.equals( "bio_sample" ) ) {
		    sample = new LabeledSample( conn, id, keyID );

		} else if (type.equalsIgnoreCase( "hyb_description" ) ) {
		    sample = new LabeledSample( conn, keyID, id );
		} 
		labeledSamples.add( sample );
	    }
	}
    }


    /**
     * Populates biosample data for each element in collection. This data 
     * includes additional info. on the biosample such as its name and 
     * associated environmental conditions.  This method should only be
     * called when collection is created to represent labeled samples for
     * a hyb description, since if collection is created for a biosample
     * this data is redundant with data already in the BioSampleObject class.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateBioSampleData( DBconnection conn ) throws SQLException {
	if ( !isEmpty() ) {
	    LabeledSample sample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		sample = (LabeledSample) iter.next();
		sample.populateBioSampleData( conn );
	    }
	}
    }
		

    /**
     * Determines if at least one member of collection has associated labeling 
     * protocol data. This can be used at the JSP level to decide whether to 
     * show that column when displaying the collection.
     *
     * @return <code>true</code> if at least on sample in collection has 
     * labeling protocol data, or <code>false</code> if no samples in collection
     * have protocol data.
     */
    public boolean hasLabelingProtocol() {

	LabeledSample sample = null;
	boolean hasProtocol = false;

	Iterator iter = iterator();
	if ( iter != null ) {
	    while ( iter.hasNext() ) {
		sample = (LabeledSample) iter.next();
		if ( sample.get_labeling_protocol_ref_id() != null ) {
		    hasProtocol = true;
		    break;
		}
	    }
	}
	return hasProtocol;
    }

    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no elements in it, or 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() {
	return ( labeledSamples != null && labeledSamples.isEmpty() );
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return ( labeledSamples != null ) ? labeledSamples.size() : 0;
    }

    
    /**
     * Retrieves all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of 
     * <code>LabeledSample</code> objects, or <code>null</code> if no 
     * elements in collection
     */
    public Iterator iterator() {
	return ( !isEmpty() ) ? labeledSamples.iterator() : null;
    }
  
    /**
     * Retrieves element at supplied index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public LabeledSample elementAt( int index ) {
	return ( !isEmpty() && size() > index ) ? 
	    (LabeledSample) labeledSamples.get( index ) : null;
    }    

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "**** LabeledSampleCollection content test ****" );
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		LabeledSample sample = (LabeledSample) iter.next();
		sample.test();
	    }
	}
	System.out.println( "** LabeledSampleCollection content test end **" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 2 );

	    System.out.println( "bio sample mode..." );
	    LabeledSampleCollection lsc = 
		new LabeledSampleCollection( conn, id, "bio_sample" );
	    lsc.test();

	    System.out.println( "hyb description mode..." );
	    id = new Long( 638 );
	    lsc = new LabeledSampleCollection( conn, id, "hyb_description" );
	    lsc.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
