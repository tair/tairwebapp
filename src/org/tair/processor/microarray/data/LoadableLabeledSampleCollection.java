//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.2 $
// $Date: 2004/11/18 20:35:45 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.utilities.CompoundVector;
import org.tair.utilities.InvalidActionException;


/**
 * LoadableLabeledSampleCollection is a custom collection that stores labeled
 * samples as a collection of <code>LoadableLabeledSample/code> objects.
 *
 * <p>
 * LoadableLabeledSampleCollection is used specifically for microarray data
 * loading and curation tasks.  Unlike org.tair.querytools.LabeledSampleCollection,
 * which represents either labeled samples for a bio sample or for a hyb
 * description, this collection represents all labeled samples for an expression
 * set.
 */

public class LoadableLabeledSampleCollection  {   
    private ArrayList labeledSamples;

    // expression set labeled samples collection represents
    private Long expressionSetID;

    /**
     * Creates an empty instance of LoadableLabeledSampleCollection
     */
    public LoadableLabeledSampleCollection() { 
	labeledSamples = new ArrayList();
    }

    /**
     * Creates an instance of LoadableLabeledSampleCollection that represents a 
     * collection of LoadableLabeledSample objects for submitted expression
     * set id.
     *
     * @param conn An active connection to the database
     * @param expression_set_id ID to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableLabeledSampleCollection( DBconnection conn, 
					    Long expression_set_id )
	throws SQLException {

	labeledSamples = new ArrayList();
	this.expressionSetID = expression_set_id;
	populate( conn );
    }

    
    /**
     * Retrieves hyb description and bio sample ids for each labeled sample associated
     * to expression set and creates LoadableLabeledSample objects to reflect
     * data for each unique association.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) 
	throws SQLException {

	// CompoundVector stores key-> value relationships. Use to store
	// bio sample/hyb description pairings since it allows multiple
	// entries for each key.
	CompoundVector ids = null;
	
	// get unique pairings of ids -- join through HybDescription, though
	// going through BioSample would be valid as well
	String query =
	    "SELECT DISTINCT l.bio_sample_id, l.hyb_description_id " +
	    "FROM LabeledSample l, HybDescription h " +
	    "WHERE l.hyb_description_id = h.hyb_description_id " +
	    "AND h.expression_set_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( expressionSetID );
	
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new CompoundVector();
	    }
	    
	    ids.put( new Long( results.getLong( "bio_sample_id" ) ),
		     new Long( results.getLong( "hyb_description_id" ) ) );
	}
	conn.releaseResources();

	if ( ids != null ) {
	    Long bioSampleID = null;
	    Long hybDescriptionID = null;
	    LoadableLabeledSample sample = null;
	    
	    for ( int i = 0; i < ids.size(); i++ ) {
		bioSampleID = (Long) ids.getKeyAt( i );
		hybDescriptionID = (Long) ids.getValueAt( i );

		sample = new LoadableLabeledSample( conn,
						    bioSampleID, 
						    hybDescriptionID );
		add( sample );
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

	LoadableLabeledSample sample = null;
	boolean hasProtocol = false;

	Iterator iter = iterator();
	if ( iter != null ) {
	    while ( iter.hasNext() ) {
		sample = (LoadableLabeledSample) iter.next();
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
     * <code>LoadableLabeledSample</code> objects, or <code>null</code> if no 
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
    public LoadableLabeledSample get( int index ) {
	return (LoadableLabeledSample) labeledSamples.get( index );
    }    

    /**
     * Retrieves labeled samples with submitted name.  Multiple labeled
     * samples may have the same name if same bio sample and labeled sample
     * data is used for multiple hyb descriptions.
     *
     * @param name Name of labeled sample to retrieve
     * @return Labeled sample(s) with submitted name as an <code>Iterator</code>
     * of <code>LoadableLabeledSample</code> objects, or <code>null</code> if no
     * labeled sample found with name
     */
    public Iterator get( String name ) {
	ArrayList found = null;
	Iterator returnIter = null;

	if ( !isEmpty() ) {
	    LoadableLabeledSample sample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		sample = (LoadableLabeledSample) iter.next();

		if ( name.equals( sample.get_name() ) ) {
		    if ( found == null ) {
			found = new ArrayList();
		    }
		    found.add( sample );
		}
	    }

	    if ( found != null ) {
		returnIter = found.iterator();
	    }
	}

	return returnIter;
    }    


    /**
     * Retrieves first labeled sample found in collection with submitted name. 
     * If multiple labeled samples exist with same name, majority of information
     * (except for associated hyb description) should be the same. This
     * method provides an easy way to get a single representative object
     * for displaying labeled sample data.
     *
     * @param name Name of labeled sample to retrieve
     * @return First labeled sample found in collection with submitted name
     * or <code>null</code> if no labeled sample found with name
     */
    public LoadableLabeledSample getFirst( String name ) {
	LoadableLabeledSample sample = null;

	// get all samples with name and return first element
	Iterator iter = get( name );
	if ( iter != null && iter.hasNext() ) {
	    sample = (LoadableLabeledSample) iter.next();
	}
	return sample;
    }


    /**
     * Retrieves all hyb description names associated to labeled sample with
     * submitted name.  This is a convenience method for easily displaying 
     * different hyb descriptions without going through each labeled sample
     * (since majority of info. should be the same.
     *
     * @param name Labeled sample name to get hyb descriptions for
     * @return Names of hyb descriptions associated to labeled sample(s) with
     * submitted name as an <code>Iterator</code> of Strings, or <code>null</code>
     * if no hyb description data found for labeled sample name
     */
    public Iterator getLabeledSampleHybDescriptions( String name ) {
	ArrayList hybNames = null;
	Iterator returnIter = null;

	LoadableLabeledSample sample = null;
	Iterator iter = get( name );
	if ( iter != null ) {
	    hybNames = new ArrayList();
	    while ( iter.hasNext() ) {
		sample = (LoadableLabeledSample) iter.next();
		hybNames.add( sample.getHybDescriptionName() );
	    }

	    returnIter = hybNames.iterator();
	}
	return returnIter;
    }



    /**
     * Adds labeled sample to collection
     *
     * @param sample Labeled sample to add to collection
     */
    public void add( LoadableLabeledSample sample ) {
	labeledSamples.add( sample );
    }

    /**
     * Removes labeled sample from collection.  Row in LabeledSample will be
     * deleted the next time store() is called
     *
     * @param sample Sample to remove from collection
     */
    public void remove( LoadableLabeledSample sample ) {
	labeledSamples.remove( sample );
    }

    /**
     * Sets expression set id for collection.
     *
     * @param expressionSetID Expression set id to set for collection
     */
    public void setExpressionSetID( Long expressionSetID ) {
	this.expressionSetID = expressionSetID;
    }


    /**
     * Sets bio sample id for all labeled samples using bio sample with 
     * submitted name.  This method is needed when loading new data, since
     * bio sample id for new bio samples will not exist until they are stored
     * to the database.  After a new id is created, this method can be used
     * to update all labeled sample objects with key value required for 
     * creating a row in LabeledSample
     *
     * @param bioSampleID Bio sample id to set for name
     * @param name Bio sample name to use to find labeled samples to update
     * with bio sample id
     */
    public void setBioSampleID( Long bioSampleID, String name ) {
	Iterator iter = getBioSamples( name );

	LoadableLabeledSample sample = null;
	if ( iter != null ) {
	    while ( iter.hasNext() ) {
		sample = (LoadableLabeledSample) iter.next();
		sample.set_bio_sample_id( bioSampleID );
	    }
	}
    }
     
    /**
     * Sets hyb description id for all labeled samples using hyb description 
     * with  submitted name.  This method is needed when loading new data, since
     * hyb description id for new hyb descriptions will not exist until they are
     * stored to the database.  After a new id is created, this method can be 
     * used to update all labeled sample objects with key value required for 
     * creating a row in LabeledSample
     *
     * @param hybDescriptionID Hyb description id to set for name
     * @param name Hyb description name to use to find labeled samples to 
     * update with hyb description id
     */
    public void setHybDescriptionID( Long hybDescriptionID, String name ) {
	Iterator iter = getHybDescriptions( name );

	LoadableLabeledSample sample = null;
	if ( iter != null ) {
	    while ( iter.hasNext() ) {
		sample = (LoadableLabeledSample) iter.next();
		sample.set_hyb_description_id( hybDescriptionID );
	    }
	}
    }
     

    /**
     * Retrieves all labeled samples for bio sample with submitted name
     * 
     * @param name Bio sample name to retrieve labeled samples for
     * @return Labeled samples for bio sample with submitted name as
     * an <code>Iterator</code> of <code>LoadableLabeledSample</code>
     * objects, or <code>null</code> if no labeled samples found for 
     * bio sample
     */
    public Iterator getBioSamples( String name ) {
	Iterator bioIter = null;

	if ( !isEmpty() ) {

	    ArrayList found = null;
	    LoadableLabeledSample sample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		sample = (LoadableLabeledSample) iter.next();
		if ( name.equals( sample.getBioSampleName() ) ) {
		    if ( found == null ) {
			found = new ArrayList();
		    }
		    found.add( sample );
		}
	    }

	    if ( found != null ) {
		bioIter = found.iterator();
	    }
	}
		
	return bioIter;
    }

    /**
     * Retrieves all labeled samples for hyb description with submitted name
     * 
     * @param name Hyb description name to retrieve labeled samples for
     * @return Labeled samples for hyb description with submitted name as
     * an <code>Iterator</code> of <code>LoadableLabeledSample</code>
     * objects, or <code>null</code> if no labeled samples found for 
     * hyb description
     */
    public Iterator getHybDescriptions( String name ) {
	Iterator hybIter = null;

	if ( !isEmpty() ) {

	    ArrayList found = null;
	    LoadableLabeledSample sample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		sample = (LoadableLabeledSample) iter.next();
		if ( name.equals( sample.getHybDescriptionName() ) ) {
		    if ( found == null ) {
			found = new ArrayList();
		    }
		    found.add( sample );
		}
	    }

	    if ( found != null ) {
		hybIter = found.iterator();
	    }
	}
		
	return hybIter;
    }



    /**
     * Stores contents of collection to the database. All storing is done
     * as INSERTs.  Before storing each labeled sample row, all labeled
     * sample rows will be deleted for collection's expression set id.
     * This is done so that after storing, database contains only rows for
     * labeled samples in collection. If collection is empty when store is
     * called, only DELETE will take place
     *
     * @param conn An active connection to the database
     * @throws InvalidActionException if required data has not been set
     * for an object to be stored
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {
	
	delete( conn );
	
	if ( !isEmpty() ) {
	    LoadableLabeledSample sample = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		sample = (LoadableLabeledSample) iter.next();
                sample.store( conn );
	    }
	}
    }

    /**
     * Deletes all labeled sample rows for expression set id this collection
     * represents. This is done before storing items in collection to ensure
     * that after storing database table only contains rows for samples
     * currently in collection.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
     	String query =
	    "DELETE LabeledSample FROM HybDescription h " +
            "WHERE LabeledSample.hyb_description_id = h.hyb_description_id " +
            "AND h.expression_set_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( expressionSetID );
        conn.executeUpdate();
        conn.releaseResources();
    }



    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "** LoadableLabeledSampleCollection test **" );
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    LoadableLabeledSample sample = null;
	    while ( iter.hasNext() ) {
		sample = (LoadableLabeledSample) iter.next();
		sample.test();
	    }
	}
	System.out.println( "** LoadableLabeledSampleCollection test end **" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 115 );
	    LoadableLabeledSampleCollection lsc = 
		new LoadableLabeledSampleCollection( conn, id );

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
