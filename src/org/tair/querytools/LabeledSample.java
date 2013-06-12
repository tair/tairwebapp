//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2004/11/08 22:11:32 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.ArrayList;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLabeledSample;
import org.tair.tfc.TfcProtocol;

/**
 * LabeledSample extends <code>TfcLabeledSample</code> to present detailed 
 * information on a labeled sample. Since labeled samples represent a join
 * between a hyb description and a biosample, LabeledSample objects will be
 * created to represent data from the perspective of one data type or the
 * other.  If LabeledSample has been created to represent a sample from the
 * point of view of a hyb description, bio sample data must be populated
 * externally through the populateBioSample method.  If LabeledSample
 * has been created to represent the sample from the point of view of the
 * BioSample, this data will be null internally, since it will be redundant
 * with the data in the BioSample object that contains the LabeledSample
 * reference.
 */


public class LabeledSample extends TfcLabeledSample {

    private TfcProtocol labelingProtocol;

    // associated bio sample object, containing environmental condition
    // data for bio sample - this element must be populated explicitly through
    // the populateBioSample method and should only be done if creating 
    // LabeledSample for a HybDescriptionObject to avoid duplication of data
    // with BioSampleObject that may contain LabeledSampleCollection.
    private BioSampleObject bioSample;
  
    /**
     * Creates an empty instance of LabeledSample
     */
    public LabeledSample() {
	super();
    }

    /**
     * Creates an instance of LabeledSample that reflects the data referenced by
     * combination of submitted bio_sample_id and hyb_description_id
     *
     * @param conn An active connection to the database
     * @param bio_sample_id Bio sample id to retrieve data for
     * @param hyb_description_id Hyb description id to retrieve data for
     * @throws SQLException thrown if a database error occurs, or if no row found
     * for combination of submitted ids
     */
    public LabeledSample( DBconnection conn, 
			  Long bio_sample_id, 
			  Long hyb_description_id ) 
	throws SQLException {

	super( conn, bio_sample_id, hyb_description_id );

	if ( get_labeling_protocol_ref_id() != null ) {
	    labelingProtocol = 
		new TfcProtocol( conn, get_labeling_protocol_ref_id() );
	}
    }

    /**
     * Populates bio sample data associated to LabeledSample, including 
     * any environmental condition data for that bio sample.  This method should
     * only be called when creating LabeledSample from the point of view of
     * a HybDescriptionObject, since a BioSampleObject will already have this
     * data.
     *
     * <p>
     * This method is usually called only through LabeledSampleCollection
     * when collection is created by HybDescriptionObject.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateBioSampleData( DBconnection conn ) 
	throws SQLException {

	this.bioSample = new BioSampleObject( conn, get_bio_sample_id() );
    }

    /**
     * Determines if associated bio sample data has been populated for
     * this LabeledSample
     *
     * @return <code>true</code> if bio sample data has been populated,
     * <code>false</code> if no bio sample data has been populated for
     * LabeledSample.
     */
    public boolean hasBioSampleData() {
	return ( bioSample != null );
    }

    /**
     * Retrieves bio sample name as stored in BioSample
     *
     * @return bio sample name
     */
    public String getBioSampleName() {
	return hasBioSampleData() ? bioSample.get_name() : null;
    }
 
    /**
     * Determines if at least one environmental condition of biosample for
     * labeled sample has data for the condition duration field. This is useful
     * at the JSP level for determining whether this data column can be 
     * excluded or not when displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all 
     * environmental conditions, or if bio sample data has not been populated 
     * for this object instance.
     */
    public boolean hasConditionDuration() {
	return hasBioSampleData() ? bioSample.hasConditionDuration() : false;
    }
    
    /**
     * Determines if at least one environmental condition of labled sample has 
     * data for the condition value  field. This is useful at the JSP level for
     * determining whether this data column can be excluded or not when
     * displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all 
     * environmental conditions, or if bio sample has not been populated for
     * this object instance
     */
    public boolean hasConditionValue() {
	return hasBioSampleData() ? bioSample.hasConditionValue() : false;
    }
  
    /**
     * Determines if LabeledSample has associated labeling protocol reference 
     * data
     *
     * @return <code>true</code> if sample has associated labeling protocol 
     * reference data
     * or <code>false</code> if no protocol associated with sample
     */
    public boolean hasProtocol() {
	return ( labelingProtocol != null && 
		 labelingProtocol.get_reference_id() != null );
    }
  
    /**
     * Retrieve LabelingProtocol of this LabeledSample as TfcProtocol
     * @return TfcProtocol
     */
    public TfcProtocol getLabelingProtocol(){
	return hasProtocol() ? labelingProtocol : null; 
    }

    //
    // TfcProtocol wrappers
    //

    public Long get_protocol_publication_id() {
	return hasProtocol() ? labelingProtocol.get_publication_id() : null;
    }

    public Long get_protocol_communication_id() {
	return hasProtocol() ? labelingProtocol.get_communication_id() : null;
    }

    public String get_protocol_title() { 
	return hasProtocol() ? labelingProtocol.get_title() : null; 
    }

    public Integer get_protocol_pubmed_id() { 
	return hasProtocol() ? labelingProtocol.get_pubmed_id() : null; 
    }

    public String get_protocol_description() { 
	return hasProtocol() ? labelingProtocol.get_description() : null;
    }

    public String get_protocol_authors() { 
	return hasProtocol() ? labelingProtocol.get_authors() : null;
    }

    public String get_protocol_usage() { 
	return hasProtocol() ? labelingProtocol.get_usage() : null;
    }

    public String get_protocol_methods() {
	return hasProtocol() ? labelingProtocol.get_methods() : null;
    }

    public String get_protocol_status() {
	return hasProtocol() ? labelingProtocol.get_status() : null;
    }

    /**
     * Determines if this labeledsample's bio sample has associated 
     * environmental condition data
     *
     * @return <code>true</code> if bio sample has env condition data,
     * or <code>false</code> if no env condition data for biosample, or if
     * biosample data has not been populated for this object instance.
     */ 
    public boolean hasEnvConds() { 
	return hasBioSampleData() ? bioSample.hasEnvConds() : false;
    }

    /**
     * Retrieves environmental conditions for this labeledsample's bio sample
     *
     * @returns <code>Iterator</code> of <code>BioSamEnvConObject</code> 
     * objects for this BioSample
     */
    public Iterator getEnvConds() { 
	return hasEnvConds() ? bioSample.getEnvConds() : null;
    } 
   /**
     * Determines if this labeledsample's bio sample has associated 
     * experimental environmental condition data
     *
     * @return <code>true</code> if bio sample has experimental env condition data,
     * or <code>false</code> if no experimental env condition data for biosample, or if
     * biosample data has not been populated for this object instance.
     */ 
    public boolean hasExperimentalEnvConds() { 
	if (hasEnvConds()){ 
	    Iterator envIter = bioSample.getEnvConds();
            while ( envIter.hasNext() ) {
		BioSamEnvConObject  envCon = (BioSamEnvConObject) envIter.next();
                if( envCon.get_is_experimental_variable()!= null &&
		       envCon.get_is_experimental_variable().booleanValue()){
                    return true; 
                }
            }
        } 
	return false;
    }

    /**
     * Retrieves experimental environmental conditions for this labeledsample's bio sample
     *
     * @returns <code>Iterator</code> of <code>BioSamEnvConObject</code> 
     * objects for this BioSample
     */
    public Iterator getExperimentalEnvConds() { 
        ArrayList experimentalEnvCon = new ArrayList();
        Iterator iter = null;
        if (hasEnvConds() ){
            iter = bioSample.getEnvConds();
            while ( iter.hasNext() ) {
		BioSamEnvConObject  envCon = (BioSamEnvConObject) iter.next();
                if( envCon.get_is_experimental_variable()!= null &&
		       envCon.get_is_experimental_variable().booleanValue()){
		    experimentalEnvCon.add (envCon);
                }
            }
        } 
        return ( !experimentalEnvCon.isEmpty() ) ? experimentalEnvCon.iterator() : null;
    } 
  
    


    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** LabeledSample content test ******" );    
	super.test();
	if ( hasProtocol() ) {
	    labelingProtocol.test();
	}
	System.out.println( "****** LabeledSample content end ******" );    
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    Long bioSampleID = new Long( 2 );
	    Long hybDescrID = new Long( 638 );
	    LabeledSample sample = new LabeledSample( conn, bioSampleID, hybDescrID );
	    sample.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
