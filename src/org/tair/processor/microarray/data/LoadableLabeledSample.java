//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2005/05/03 21:19:52 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLabeledSample;
import org.tair.tfc.TfcProtocol;
import org.tair.utilities.InvalidActionException;

/**
 * LoadableLabeledSample extends <code>TfcLabeledSample</code> to present 
 * detailed information on a labeled sample. LoadableLabeledSample is used 
 * primarily for adding and updating labeled sample data in the microarray 
 * loading programs.
 */


public class LoadableLabeledSample extends TfcLabeledSample {

    private LoadableProtocol labelingProtocol;

    // name of bio sample labeled sample is associated to -- this
    // is needed since bio sample id will be null for new entries 
    // until bio sample is stored to the database
    private String bioSampleName;

    // name of hyb description sample labeled sample is associated to -- this
    // is needed since hyb description id will be null for new entries until
    // hyb description is stored to the database
    private String hybDescriptionName;
      
    /**
     * Creates an empty instance of LoadableLabeledSample
     */
    public LoadableLabeledSample() {
	super();
    }

    /**
     * Creates an instance of LoadableLabeledSample that reflects the data 
     * referenced by combination of submitted bio_sample_id and 
     * hyb_description_id
     *
     * @param conn An active connection to the database
     * @param bio_sample_id Bio sample id to retrieve data for
     * @param hyb_description_id Hyb description id to retrieve data for
     * @throws SQLException thrown if a database error occurs
     */
    public LoadableLabeledSample( DBconnection conn, 
				  Long bio_sample_id, 
				  Long hyb_description_id ) 
	throws SQLException {

	super( conn, bio_sample_id, hyb_description_id );
	
	if ( get_labeling_protocol_ref_id() != null ) {
	    labelingProtocol = 
		new LoadableProtocol( conn, get_labeling_protocol_ref_id() );
	}
    }


    /**
     * Sets name of bio sample for this labeled sample.  This value is needed
     * to identify bio sample since bio sample id will be <code>null</code>
     * for new entries until new bio sample row is stored to the database
     *
     * @param name Name of bio sample for this labeled sample
     */
    public void setBioSampleName( String name ) {
	this.bioSampleName = name;
    }

    /**
     * Retrieves name of bio sample for this labeled sample.  This value can
     * be used to identify bio sample since bio sample id will be 
     * <code>null</code> for new entries until new bio sample row is stored 
     * to the database
     *
     * @return Name of bio sample for this labeled sample
     */
    public String getBioSampleName() {
	return bioSampleName;
    }


    /**
     * Sets name of hyb description sample for this labeled sample.  This value 
     * is needed to identify hyb description since hyb description id will be 
     * <code>null</code> for new entries until new hyb description row is stored
     * to the database
     *
     * @param name Name of hyb description for this labeled sample
     */
    public void setHybDescriptionName( String name ) {
	this.hybDescriptionName = name;
    }



    /**
     * Retrieves name of hyb description for this labeled sample.  This value 
     * can be used to identify hyb description since hyb description id will be 
     * <code>null</code> for new entries until new hyb description row is stored 
     * to the database
     *
     * @return Name of hyb description for this labeled sample
     */
    public String getHybDescriptionName() {
	return hybDescriptionName;
    }


    //
    // LoadableProtocol wrappers
    //
    public Long get_protocol_publication_id() {
	return hasLabelingProtocol() ? labelingProtocol.get_publication_id() : null;
    }

    public Long get_protocol_communication_id() {
	return hasLabelingProtocol() ? labelingProtocol.get_communication_id() : null;
    }

    public String get_protocol_title() { 
	return hasLabelingProtocol() ? labelingProtocol.get_title() : null; 
    }

    public Integer get_protocol_pubmed_id() { 
	return hasLabelingProtocol() ? labelingProtocol.get_pubmed_id() : null; 
    }

    public String get_protocol_description() { 
	return hasLabelingProtocol() ? labelingProtocol.get_description() : null;
    }

    public String get_protocol_authors() { 
	return hasLabelingProtocol() ? labelingProtocol.get_authors() : null;
    }

    public String get_protocol_usage() { 
	return hasLabelingProtocol() ? labelingProtocol.get_usage() : null;
    }

    public String get_protocol_methods() {
	return hasLabelingProtocol() ? labelingProtocol.get_methods() : null;
    }

    public String get_protocol_status() {
	return hasLabelingProtocol() ? labelingProtocol.get_status() : null;
    }
  

   /**
     * Determines if LoadableLabeledSample has associated labeling protocol 
     * reference data
     *
     * @return <code>true</code> if sample has associated labeling protocol 
     * reference data
     * or <code>false</code> if no protocol associated with sample
     */
    public boolean hasLabelingProtocol() {
	return ( labelingProtocol != null );
    }
  
    /**
     * Retrieve labeling protocol data for this LoadableLabeledSample as
     * LoadableProtocol
     *
     * @return protocol data as LoadableProtocol
     */
    public LoadableProtocol getLabelingProtocol(){
	return hasLabelingProtocol() ? labelingProtocol : null; 
    }

    /**
     * Sets labeling protocol data wholesale for labeled sample
     *
     * @param protocol Labeling protocol to set for labeled sample
     */
    public void setLabelingProtocol( LoadableProtocol protocol ) {
	this.labelingProtocol = protocol;

	// if protocol has a reference id (i.e. is not newly created
	// without being stored in db), set reference id in labeled
	// sample object to keep in synch.
	if ( protocol.get_reference_id() != null ) {
	    set_labeling_protocol_ref_id( protocol.get_reference_id() );
	}
    }


    /**
     * Retrieves URLs for labeling protocol associated to labeled sample.
     *
     * @return URLs for protocol for labeled sample as an <code>Iterator</code>
     * of <code>ReferenceURL</code> objects or <code>null</code> if no
     * URLs for protocol
     */
    public Iterator getLabelingProtocolURLs() {
	return hasLabelingProtocol() ? labelingProtocol.getURLs() : null;
    }


    /**
     * Stores labeled sample data, including labeling protocol, to the
     * database. Labeled samples are always done as an INSERT, meaning that
     * when updating all pre-existing rows should be DELETEd before calling
     * this method on individual objects (LoadableLabeledSampleCollection
     * takes care of this).
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any element to be stored
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	// store labeling protocol data
	storeProtocol( conn );

	// stored labeled sample data
	super.store( conn );
    }

    /**
     * Store labeling protocol data to the database.     
     * this will store the protocol into database if protocol doesn't exist and protocol's 
     * association data if not exist.
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any element to be stored
     * @throws SQLException if a database error occurs
     */
    private void storeProtocol( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	if ( hasLabelingProtocol() ) {
	    // stores new protocol along with any URLs and keyword associtations for this protocol
	    labelingProtocol.store( conn );
					  
	    // set link to protocol in labeled sample
	    set_labeling_protocol_ref_id( labelingProtocol.get_reference_id() );	    
	}
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** LoadableLabeledSample content test ******" );    
	super.test();
	if ( hasLabelingProtocol() ) {
	    labelingProtocol.test();
	}
	System.out.println( "****** LoadableLabeledSample content end ******" );    
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    Long bioSampleID = new Long( 2 );
	    Long hybDescrID = new Long( 638 );
	    LoadableLabeledSample sample = new LoadableLabeledSample( conn, bioSampleID, hybDescrID );
	    sample.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
