//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/11/18 20:31:04 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcBioSampleEnvCond;
import org.tair.utilities.InvalidActionException;

/**
 * BioSamEnvConObjectCollection is a custom collection that stores
 * as a collection of <code>BioSamEnvConObject/code> objects. 
 */


public class BioSamEnvConObjectCollection  {   
    private ArrayList envConditions;

    // keep track of all env. conditions removed from collection -
    // when storing data to db, condition records themselves will
    // be deleted if they are not associated to any other bio samples
    private ArrayList deleted;


    // bio sample id for all items in collection
    private Long bioSampleID;

    // Flags to track whether any objects in collection
    // have data for different data fields
    boolean hasConditionValue = false;
    boolean hasConditionDuration = false;
    boolean hasApplicationFrequency = false;
    boolean hasOrderNumber = false;

    /**
     * Creates an empty instance of BioSamEnvConObjectCollection
     */
    public BioSamEnvConObjectCollection() { 
	envConditions = new ArrayList();
    }

    /**
     * Creates an instance of BioSamEnvConObjectCollection that
     * represents a collection of BioSamEnvConObject objects for 
     * submitted bio_sample_id
     *
     * @param conn An active connection to the database
     * @param bio_sample_id BioSample id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public BioSamEnvConObjectCollection( DBconnection conn, Long bio_sample_id ) 
	throws SQLException {

	envConditions = new ArrayList();
	this.bioSampleID = bio_sample_id;
	populate( conn );
	populateDataFlags();
    }


    /**
     * Retrieves environmental condition ids for biosample and creates
     * data objects for each
     * 
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {

	ArrayList environmental_condition_ids = null;

	String query =
	    "SELECT environmental_condition_id " +
	    "FROM BioSample_EnvCond " +
	    "WHERE bio_sample_id = ? " + 
	    "ORDER BY order_number ";

	conn.setQuery( query );
	conn.setQueryVariable( bioSampleID );
	
	ResultSet results = conn.getResultSet();
	Long id = null;
	while ( results.next() ) {
	    if ( environmental_condition_ids == null ) {
		environmental_condition_ids = new ArrayList();
	    } 

	    id = new Long( results.getLong( "environmental_condition_id" ) );
	    environmental_condition_ids.add( id );
	}
	conn.releaseResources();
    
	if ( environmental_condition_ids != null ) {
	    Iterator iter = environmental_condition_ids.iterator();
	    while ( iter.hasNext() ) {
		envConditions.add( new BioSamEnvConObject( conn, 
							   bioSampleID,
							   (Long) iter.next() ) );
		
	    }
	}

	// sort collection
	sort( new BioSamEnvConObjectComparator() );
    }
  

    /**
     * Iterate through collection and determine if any object in collection 
     * has data for quantity, duration, frequency or order fields.  Populate 
     * all flags here to minimize number of iterations through collection
     */
    private void populateDataFlags() {
	Iterator iter = null;
	BioSamEnvConObject bsec = null;
    
	if ( !isEmpty() ) {
	    iter = iterator();
	    while ( iter.hasNext() ) {
		bsec = (BioSamEnvConObject) iter.next();
		if ( bsec.get_condition_value() != null ) {
		    this.hasConditionValue = true;
		}

		if ( bsec.get_condition_duration() != null ) {
		    this.hasConditionDuration = true;
		}

		if ( bsec.get_application_frequency() != null ) {
		    this.hasApplicationFrequency = true;
		}

		if ( bsec.get_order_number() != null ) {
		    this.hasOrderNumber = true;
		}

		// don't need to continue iteration if all true
		if ( hasConditionValue && 
		     hasConditionDuration && 
		     hasApplicationFrequency && 
		     hasOrderNumber ) {

		    break;
		}
	    }
	}
    }

    /**
     * Determines if at least one object in collection has data for the 
     * condition value field. This is useful at the JSP level for determining
     * whether this data column can be excluded or not when displaying the 
     * collection
     *
     * @return <code>true</code> if at least one object has data for this 
     * field, or <code>false</code> if this field is <code>null</code> for all 
     * objects in collection
     */
    public boolean hasConditionValue() {
	return hasConditionValue;
    }

    /**
     * Determines if at least one object in collection has data for the 
     * condition duration field. This is useful at the JSP level for determining
     * whether this data column can be excluded or not when displaying the 
     * collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all objects 
     * in collection
     */
    public boolean hasConditionDuration() {
	return hasConditionDuration;
    }

    /**
     * Determines if at least one object in collection has data for the 
     * application frequency field. This is useful at the JSP level for 
     * determining whether this data column can be excluded or not when 
     * displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all objects
     * in collection
     */
    public boolean hasApplicationFrequency() {
	return hasApplicationFrequency;
    }

    /**
     * Determines if at least one object in collection has data for the order 
     * number field. This is useful at the JSP level for determining whether 
     * this data column can be excluded or not when displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all objects 
     * in collection
     */
    public boolean hasOrderNumber() {
	return hasOrderNumber;
    }


  
    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no elements in it, or 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return ( envConditions != null && envConditions.isEmpty() );
    }

    /*
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return ( envConditions != null ) ? envConditions.size() : 0;
    }

    
    /**
     * Retrieve all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of 
     * <code>BioSamEnvConObject</code> objects, or <code>null</code> 
     * if no elements in collection
     */
    public Iterator iterator() {
	return !isEmpty() ? envConditions.iterator() : null;
    }
  
    /**
     * Retrieves elements at submitted index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public BioSamEnvConObject elementAt( int index ) {
	return (BioSamEnvConObject ) envConditions.get( index );
    }    
    
    /**
     * Adds submitted element to collection
     * 
     * @param envCondition Element to add to collection
     */
    public void add( BioSamEnvConObject envCondition ) {
	envConditions.add( envCondition );
    }
    
    /**
     * Removes submitted element from collection. Biosample's association
     * to environmental condition will be deleted from the database the
     * next time store is called.  If, after removing association, 
     * environmental condition is not associated to any bio samples,
     * environmental condition itself will be deleted.
     * 
     * @param envCondition Element to remove from collection
     */
    public void remove( BioSamEnvConObject envCondition ) {
	envConditions.remove( envCondition );
	
	// if item has environmental condition id, add to
	// list of items to delete -- if no id, no further action
	// necessary
	if ( envCondition.get_environmental_condition_id() != null ) {
	    if ( deleted == null ) {
		deleted = new ArrayList();
	    }
	    deleted.add( envCondition );
	}
    }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be 
     * sorted by
     */
    public void sort( Comparator comparator ) {
	Collections.sort( envConditions, comparator );
    }

    /**
     * Sets bio sample id for all elements in collection
     * 
     * @param bioSampleID Bio sample id to set for all items in collection
     */
    public void setBioSampleID( Long bioSampleID ) {
	this.bioSampleID = bioSampleID;

	if ( !isEmpty() ) {
	    BioSamEnvConObject envCond = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		envCond = (BioSamEnvConObject) iter.next();
		envCond.set_bio_sample_id( bioSampleID );
	    }
	}
    }

    /**
     * Retrieves bio sample id for all elements in collection
     *
     * @return Bio sample id all environmental conditions in collection 
     * are associated to
     */
    public Long getBioSampleID() {
	return bioSampleID;
    }

    /** 
     * Determines if collection contains an association between bio sample 
     * and submitted environmental condition id;
     *
     * @return <code>true</code> if collection contains an association to 
     * submitted id; <code>false</code> if id not found in collection */
    public boolean containsEnvCondID( Long id ) {
	boolean containsID = false;

	if ( !isEmpty() ) {
	    BioSamEnvConObject envCond = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		envCond = (BioSamEnvConObject) iter.next();
		if ( id.equals( envCond.get_environmental_condition_id() ) ) {
		    containsID = true;
		    break;
		}
	    }
	}

	return containsID;
    }

    /**
     * Retrieves item associated to environmental condition with submitted
     * condition name. Given the UNIQUE constraint in join table, there should
     * only ever be one association to environmental condition for bio sample
     * this collection represents data for.
     *
     * @param name Environmental condition name to retrieve association for
     * @return Environmental condition and association data for condition
     * with submitted name, or <code>null</code> if no record found for
     * condition name
     */
    public BioSamEnvConObject getEnvironmentalCondition( String name ) {
	BioSamEnvConObject envCond = null;

	if ( !isEmpty() ) {
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		envCond = (BioSamEnvConObject) iter.next();

		if ( name.equals( envCond.get_condition_name() ) ) {
		    break;
		}
	    }
	}

	return envCond;
    }
								

     /**
     * Stores collection's contents to the database.  All associations
     * to bio sample id will be first DELETED, then existing associations
     * will be INSERTed so that after storing, database will only contain
     * associations contained by collection.  After removing association
     * to this bio sample, any environmental condition removed from the 
     * collection since collection was created that is not associated to
     * any bio samples, will be deleted.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any object
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// delete all pre-existing associations as well as environmental
	// conditions that don't have any other associations
	delete( conn );

	// store environmental condition data and association to bio
	// sample for all items in collection
	if ( !isEmpty() ) {
	    BioSamEnvConObject envCond = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		envCond = (BioSamEnvConObject) iter.next();
		envCond.store( conn );
	    }
	}
    }

    /**
     * Deletes associations between a bio sample and an environmental
     * condition. Any items removed from collection since it was created
     * will be deleted. If, after removing association, environmental condition
     * is not associated to any bio samples, environmental condition itself will
     * be deleted.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void delete( DBconnection conn ) 
        throws InvalidActionException,SQLException {

	// first delete all associations to this bio sample
	String query = 
	    "DELETE BioSample_EnvCond " +
	    "WHERE bio_sample_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( bioSampleID );
	conn.executeUpdate();
	conn.releaseResources();
	
	// for each item removed from collection since it was created,
	// check to see if condition is joined to any other bio 
	// sample; if no other joins, delete environmental condition 
	// record itself
	if ( deleted != null ) {
	    BioSamEnvConObject envCond = null;
	    for ( Iterator iter = deleted.iterator(); iter.hasNext(); ) {
		envCond = (BioSamEnvConObject) iter.next();
		
		Long envCondID = envCond.get_environmental_condition_id();
		if ( !TfcBioSampleEnvCond.hasBioSamples( conn, envCondID ) ) {
		    envCond.delete( conn );
		}
	    }
	}
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "** BioSamEnvConObjectCollection test **" );
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		BioSamEnvConObject envCond = (BioSamEnvConObject) iter.next();
		envCond.test();
	    }
	}
	System.out.println( "** BioSamEnvConObjectCollection test end **" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    Long bioSampleID = new Long( 2 );
	    BioSamEnvConObjectCollection conds = 
		new BioSamEnvConObjectCollection( conn, bioSampleID );
	    conds.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
