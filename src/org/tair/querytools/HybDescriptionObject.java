//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2004/06/16 19:39:33 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnalysisSoftware;
import org.tair.tfc.TfcHybDescription;
import org.tair.tfc.TfcArrayDesign;
import org.tair.tfc.TfcProtocol;

/**
 * HybDescriptionObject extends <code>TfcHybDescription</code> to present 
 * detailed information about a hyb description. 
 */

public class HybDescriptionObject extends TfcHybDescription {

    private TfcArrayDesign arrayDesign;
    private TfcAnalysisSoftware scanningSoftware;
    private TfcProtocol protocol;

    // LabeledSampleCollection - stored as LabeledSample objects -
    // this collection must be explicitly populated through the
    // populateLabeledSamples method.
    private LabeledSampleCollection labeledSamples;

    // associated hyb data - stored as HybData
    private HybDataCollection hybData;

    // name of HybDescription that is controller for this hyb description
    private String controllerName; 

    // names of HybDescriptions that this object is controller for
    private ArrayList controlledNames;

    // name of HybDescription this object is a reverse of
    private String forwardName;

    // name HybDescription that is a reverse of this object
    private String reverseName;


    /**
     * Creates an empty instance of HybDescriptionObject
     */         
    public HybDescriptionObject() { 
	super();
    }

    /**
     * Creates an instance of HybDescriptionObject to reflect data
     * referenced by submitted hyb_description id.
     *
     * @param conn An active connection to the database
     * @param hyb_description_id HybDescription id to retrieve data for
     * @throws SQLException if a database error occurs
     */      
    public HybDescriptionObject( DBconnection conn, Long hyb_description_id )
	throws SQLException {

	super( conn, hyb_description_id );
	if ( hyb_description_id != null ){

	    // populate collection of hyb data - set expression set accession 
	    // for each obj. in collection for creating FTP URLs to download 
	    // raw hyb data files
	    hybData = new HybDataCollection( conn, hyb_description_id );
	    hybData.populateExpressionSetData( conn, hyb_description_id );

	    if ( get_array_design_id() != null ) {
		arrayDesign = new TfcArrayDesign( conn, get_array_design_id() );
	    }
      
	    if ( get_hyb_protocol_ref_id() != null ) {
		protocol = new TfcProtocol( conn, get_hyb_protocol_ref_id() );
	    }

	    if ( get_scanning_software_id() != null ) {
		scanningSoftware = 
		    new TfcAnalysisSoftware( conn, get_scanning_software_id() );
	    }
      
	    // get name of hyb description this object is a reverse dye of
	    if ( get_is_reverse_dye() != null &&
		 get_is_reverse_dye().booleanValue() ) {

		retrieveForwardName( conn );

	    }

	    // get name of hyb description that is reverse of this object 
	    if ( get_reverse_id() != null ) {
		retrieveReverseName( conn );
	    }

	    // get name of hyb description that is controller/reference for 
	    // this object
	    if ( get_controller_id() != null ) {
		retrieveControllerName( conn );
	    }

	    // get names of hyb descriptions that this object is controller for
	    retrieveControlledNames( conn );
	} 
    }

    /**
     * Determines if at least one labeled sample in hyb description has 
     * associated labeling protocol data. This can be used at the JSP level 
     * to decide whether to show that column when displaying labeled samples.
     *
     * @return <code>true</code> if at least one sample for hyb description has
     * labeling protocol data, or <code>false</code> if no samples in collection
     * have protocol data.
     */
    public boolean hasLabelingProtocol() {
	return hasLabeledSamples() ? 
	    labeledSamples.hasLabelingProtocol() : false;
    }


    /**
     * Get name of hyb description that is controller/reference for this object
     * by retrieving from HybDescription where hyb description id = this 
     * object's controller id
     */
    private void retrieveControllerName( DBconnection conn ) 
	throws SQLException {

	if ( get_controller_id() != null ) {
	    String query =
		"SELECT name " +
		"FROM HybDescription " +
		"WHERE hyb_description_id = ?";
      
	    conn.setQuery( query );
	    conn.setQueryVariable( get_controller_id() );

	    ResultSet results = conn.getResultSet();
	    if ( results.next() ) {
		this.controllerName = results.getString( "name" );
	    }
	    conn.releaseResources();
	}
    }

    /**
     * Get names of hyb description(s) this object is controller/reference for
     * by retrieving from HybDescription where controller id = this object's 
     * hyb description id
     */
    private void retrieveControlledNames( DBconnection conn )
	throws SQLException {

	if ( get_hyb_description_id() != null ) {
	    String query =
		"SELECT name " +
		"FROM HybDescription " +
		"WHERE controller_id = ?";
      
	    conn.setQuery( query );
	    conn.setQueryVariable( get_hyb_description_id() );
	    
	    ResultSet results = conn.getResultSet();
	    while ( results.next() ) {
		if ( controlledNames == null ) {
		    controlledNames = new ArrayList();
		}
		controlledNames.add( results.getString( "name" ) );
	    }
	    conn.releaseResources();
	}
    }
  

    /**
     * Get name of hyb description this object is a reverse dye of by retrieving
     * from HybDescription where reverse_id = this object's id
     */
    private void retrieveForwardName( DBconnection conn ) throws SQLException {

	if ( get_hyb_description_id() != null ) {
	    String query =
		"SELECT name " +
		"FROM HybDescription " +
		"WHERE reverse_id = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( get_hyb_description_id() );

	    ResultSet results = conn.getResultSet();
      
	    if ( results.next() ) {
		this.forwardName = results.getString( "name" );
	    }
	    conn.releaseResources();
	}
    }


    /**
     * Get name of hyb description that is a reverse dye of this object retrieving
     * from HybDescription where hyb description id = this object's reverse_id
     */
    private void retrieveReverseName( DBconnection conn ) throws SQLException {

	String query =
	    "SELECT name " +
	    "FROM HybDescription " +
	    "WHERE hyb_description_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( get_reverse_id() );

	ResultSet results = conn.getResultSet();
	
	if ( results.next() ) {
	    this.reverseName = results.getString( "name" );
	}
	conn.releaseResources();

    }

    /**
     * Populates collection of labeled samples for hyb description. This is done
     * separately from constructor to avoid duplication of data in some contexts
     * HybDescriptionObject is used (in particular in the microarray data loading
     * tools).
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateLabeledSamples( DBconnection conn )
	throws SQLException {

	// populate labeled samples along with associated biosample data
	// for each sample
	labeledSamples = new LabeledSampleCollection( conn, 
						      get_hyb_description_id(),
						      "hyb_description" );
	labeledSamples.populateBioSampleData( conn );
    }
    
    

    /**
     * Determines if hyb description has associated array design data
     *
     * @return <code>true</code> if hyb description has associated array design
     * data or <code>false</code> if no array design data for hyb description
     */
    public boolean hasArrayDesign() {
	return ( arrayDesign != null && 
		 arrayDesign.get_array_design_id() != null );
    }

    /**
     * Determines if hyb description has associated protocol data
     *
     * @return <code>true</code> if hyb description has associated protocol
     * data or <code>false</code> if no protocol data for hyb description
     */
    public boolean hasProtocol() {
	return ( protocol != null );
    }

    /**
     * Determines if hyb description has associated scanning software data
     *
     * @return <code>true</code> if hyb description has associated scanning
     * software data or <code>false</code> if no scanning software data for
     * hyb description
     */
    public boolean hasScanningSoftware() {
	return ( scanningSoftware != null );
    }



    //
    // TfcArrayDesign wrappers
    //
    public String get_array_design_name() {
	return hasArrayDesign() ? arrayDesign.get_name() : null;
    }

    public String get_array_manufacturer() { 
	return hasArrayDesign() ? arrayDesign.get_manufacturer() : null;
    }

    public Integer get_num_spots() { 
	return hasArrayDesign() ? arrayDesign.get_num_spots() : null;
    }

    public String get_array_description() { 
	return hasArrayDesign() ? arrayDesign.get_description() : null;
    }

    public String get_platform_type() {
	return hasArrayDesign() ? arrayDesign.get_platform_type() : null;
    }

    public String get_surface_type() { 
	return hasArrayDesign() ? arrayDesign.get_surface_type() : null; 
    }

    public Integer get_number_of_slides() { 
	return hasArrayDesign() ? arrayDesign.get_number_of_slides() : null;
    }

    public String get_array_comments() {
	return hasArrayDesign() ? arrayDesign.get_comments() : null;
    }

    /**
     * Method to set array design data wholesale.  This is useful in microarray
     * data loading code when array design info. is assembled from data 
     * submitted in a data file.
     * 
     * @param arrayDesign Array design info. to set for hybridization
     */
    public void setArrayDesign( TfcArrayDesign arrayDesign ) {
	this.arrayDesign = arrayDesign;
    }
    

    //
    // TfcProtocol wrappers 
    //
    public Long get_protocol_publication_id() {
	return hasProtocol() ? protocol.get_publication_id() : null; 
    }

    public Long get_protocol_communication_id() { 
	return hasProtocol() ? protocol.get_communication_id() : null; 
    }

    public String get_protocol_title() {
	return hasProtocol() ? protocol.get_title() : null;
    }

    public Integer get_protocol_pubmed_id() {
	return hasProtocol() ? protocol.get_pubmed_id() : null; 
    }

    public String get_protocol_description() { 
	return hasProtocol() ? protocol.get_description() : null;
    }

    public String get_protocol_authors() {
	return hasProtocol() ? protocol.get_authors() : null; 
    }

    public String get_protocol_usage() { 
	return hasProtocol() ? protocol.get_usage() : null; 
    }

    public String get_protocol_methods() { 
	return hasProtocol() ? protocol.get_methods() : null; 
    }

    public String get_protocol_status() { 
	return hasProtocol() ? protocol.get_status() : null; 
    }

    //
    // TfcAnalysisSoftware wrappers
    //
    public Long get_analysis_software_id() {
	return hasScanningSoftware() ? 
	    scanningSoftware.get_analysis_software_id() : null;
    }

    public String get_program_name() {
	return hasScanningSoftware() ? 
	    scanningSoftware.get_program_name() : null; 
    }

    public String get_description() { 
	return hasScanningSoftware() ? 
	    scanningSoftware.get_description() : null; 
    }

    public String get_sw_function() {
	return hasScanningSoftware() ? 
	    scanningSoftware.get_sw_function() : null; 
    }

    public String get_source() {
	return hasScanningSoftware() ? scanningSoftware.get_source() : null;
    }

    public String get_author() {
	return hasScanningSoftware() ? scanningSoftware.get_author() : null; 
    }

    public java.util.Date get_date_released() { 
	return hasScanningSoftware() ?
	    scanningSoftware.get_date_released() : null; 
    }

    public String get_version() { 
	return hasScanningSoftware() ? scanningSoftware.get_version() : null; 
    }
  

    /** 
     * Retrieves name of hyb description that is controller/reference for this
     * hyb description
     *
     * @return Name of controller hyb description for this object, or 
     * <code>null</code> if no controller for this object
     */
    public String getControllerName() {
	return controllerName;
    }

    /**
     * Determines if hyb description is controller for other hyb descriptions
     *
     * @return <code>true</code> if hyb description is controller for other hyb
     * descriptions, or <code>false</code> if hyb description is not controller
     * for other hyb descriptions.
     */
    public boolean isController() {
	return ( controlledNames != null && !controlledNames.isEmpty() );
    }

    /**
     * Retrieves names of hyb descriptions that this hyb description is 
     * controller for
     *
     * @return Names of hyb descriptions this hyb description is controller for
     * as an <code>Iterator</code> of <code>String</code> objects, or 
     * <code>null</code> if this hyb description is not controller for other hyb
     * descriptions
     */
    public Iterator getControlledNames() {
	return isController() ? controlledNames.iterator() : null;
    }

    /**
     * Retrieves name of hyb description this object is a reverse of.  If 
     * get_is_reverse_dye() returns <code>true</code>, this method should never
     * return <code>null</code>. Conversely, if get_is_reverse_dye() is 
     * <code>false</code> and getReversedName() returns non-null, this 
     * method should always return <code>null</code>
     *
     * @return Name of hyb description this object is a reverse of
     */
    public String getForwardName() {
	return forwardName;
    }

    /**
     * Retrieves name of hyb description that is a reverse this object. This 
     * method should only return non-null if getReverseName() returns null 
     * (get_is_reverse_dye() returns <code>true</code>)
     *
     * @return Name of hyb description that is a reverse of this object
     */
    public String getReverseName() {
	return reverseName;
    }
  

    /**
     * Determines if hyb description has labeled samples associated to it
     *
     * @return <code>true</code> if hyb description has labeled samples 
     * associated with it, or <code>false</code> if no labeled samples for 
     * hyb description
     */ 
    public boolean hasLabeledSamples() {
	return ( labeledSamples != null && !labeledSamples.isEmpty() );
    }


    /**
     * Retrieves labeled samples associated to this hyb description
     *
     * @returns Labeled samples for this HybDescription as an
     * <code>Iterator</code> of <code>LabeledSample</code> objects, or 
     * <code>null</code> if no labeled samples associated to hyb description
     */
    public Iterator getLabeledSamples() {
	return hasLabeledSamples() ? labeledSamples.iterator() : null;
    } 

    /**
     * Determines number of labeled samples associated to this hyb description
     *
     * @return Number of labeled samples associated to hyb description
     */
    public int getNumberLabeledSamples() {
	return ( hasLabeledSamples() ) ? labeledSamples.size() : 0;
    }


    /**
     * Determines if hyb description has associated hyb data records
     *
     * @return <code>true</code> if hyb description has hyb data rows associated
     * with it, or <code>false</code> if no hyb data rows for hyb description
     */ 
    public boolean hasHybData() { 
	return ( hybData != null && !hybData.isEmpty() );
    }

    /**
     * Retrieves hyb data records associated to this hyb description
     *
     * @return Hyb data records for hyb description as an <code>Iterator</code> 
     * of <code>HybData</code> objects or <code>null</code> if no hyb data for 
     * this hyb description
     */
    public Iterator getHybData() { 
	return ( hasHybData() ) ? hybData.iterator() : null;
    } 
  
    /**
     * Determines number of hyb data records associated to this hyb description
     *
     * @return Number of hyb data records associated to hyb description
     */
    public int getNumberHybData() {
	return ( hasHybData() ) ? hybData.size() : 0;
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** HybDescriptionObject content test ******" );
	if ( hasArrayDesign() ) {
	    arrayDesign.test();
	}

	if ( hasProtocol() ) {
	    protocol.test();
	}

	if ( hasScanningSoftware() ) {
	    scanningSoftware.test();
	}

	if ( hasLabeledSamples() ) {
	    labeledSamples.test();
	}

	if ( hasHybData() ) {
	    hybData.test();
	}



	System.out.println( "**** HybDescriptionObject content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 387 );
	    HybDescriptionObject hybDescr = new HybDescriptionObject( conn, id );
	    hybDescr.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}
    }

}

