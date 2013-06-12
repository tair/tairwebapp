//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.5 $
// $Date: 2005/05/03 21:31:31 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.querytools.HybData;
import org.tair.querytools.HybDataCollection;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcArrayDesign;
import org.tair.tfc.TfcAnalysisSoftware;
import org.tair.tfc.TfcHybDescription;
import org.tair.tfc.TfcProtocol;

import org.tair.utilities.InvalidActionException;

/**
 * LoadableHybDescription extends <code>TfcHybDescription</code> to present 
 * detailed information about a hyb description.  LoadableHybDescription
 * exists specifically for use in microarray data loading and curation 
 * tools.
 */

public class LoadableHybDescription extends TfcHybDescription {

    private TfcArrayDesign arrayDesign;
    private TfcAnalysisSoftware scanningSoftware;

    private LoadableProtocol protocol;

    // associated hyb data - stored as HybData
    private HybDataCollection hybData;

    // name of HybDescription that is controller for this hyb description
    private String controllerName; 

    // name HybDescription that is a reverse of this object
    private String reverseName;


    // Number of hyb data slides associated with hyb description as entered
    // from data sheet used to populate hyb description during microarray 
    // data loading. This number may not immediately agree with with 
    // getNumberHybData, which returns the number of hyb data objects 
    // currently in HybDataCollection
    private int dataSheetNumberHybData;

    /**
     * Creates an empty instance of LoadableHybDescription
     */         
    public LoadableHybDescription() { 
	super();
    }

    /**
     * Creates an instance of LoadableHybDescription to reflect data
     * referenced by submitted hyb_description id.
     *
     * @param conn An active connection to the database
     * @param hyb_description_id HybDescription id to retrieve data for
     * @throws SQLException if a database error occurs
     */      
    public LoadableHybDescription( DBconnection conn, Long hyb_description_id )
	throws SQLException {

	super( conn, hyb_description_id );

	// populate collection of hyb data - set expression set accession 
	// for each obj. in collection for creating FTP URLs to download 
	// raw hyb data files
	hybData = new HybDataCollection( conn, hyb_description_id );
	hybData.populateExpressionSetData( conn, hyb_description_id );
	
	if ( get_array_design_id() != null ) {
	    arrayDesign = new TfcArrayDesign( conn, get_array_design_id() );
	}
	
	if ( get_hyb_protocol_ref_id() != null ) {
	    protocol = new LoadableProtocol( conn, get_hyb_protocol_ref_id() );
	}
	
	if ( get_scanning_software_id() != null ) {
	    scanningSoftware = 
		new TfcAnalysisSoftware( conn, get_scanning_software_id() );
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
	set_array_design_id( arrayDesign.get_array_design_id() );
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
     * Method to set hybridization protocol data wholesale.  This is useful in
     * microarray data loading code when protocol info. is assembled from data 
     * submitted in a data file.
     * 
     * @param protocol Protocol info. to set for hybridization
     */
    public void setProtocol( LoadableProtocol protocol ) {
	this.protocol = protocol;
	set_hyb_protocol_ref_id( protocol.get_reference_id() );
    }


    /**
     * Retrieves URLs for hybridization protocol associated to hyb description.
     *
     * @return URLs for protocol for hyb description as an <code>Iterator</code>
     * of <code>ReferenceURL</code> objects or <code>null</code> if no
     * URLs for protocol
     */
    public Iterator getProtocolURLs() {
	return hasProtocol() ? protocol.getURLs() : null;
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
     * Determines if hyb description has associated scanning software data
     *
     * @return <code>true</code> if hyb description has associated scanning
     * software data or <code>false</code> if no scanning software data for
     * hyb description
     */
    public boolean hasScanningSoftware() {
	return ( scanningSoftware != null );
    }


    /**
     * Method to set scanning software data wholesale.  This is useful in
     * microarray data loading code when software info. is assembled from data 
     * submitted in a data file.
     * 
     * @param software Scanning software info. to set for hybridization
     */
    public void setScanningSoftware( TfcAnalysisSoftware software ) {
	this.scanningSoftware = software;
	set_scanning_software_id( software.get_analysis_software_id() );
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
     * Sets name of hyb description that is controller/reference for this
     * hyb description. This is useful during microarray data loading. This
     * value will be translated into appropriate foreign key id when store
     * is called.
     *
     * @param controller
     */
    public void setControllerName( String controller ) {
	this.controllerName = controller;
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
     * Sets name of hyb description that is a reverse of this object. This method
     * should only used if get_is_reverse_dye is true. This is useful during 
     * microarray data loading. This value will be translated into appropriate 
     * foreign key id when store is called.
     *
     * @param reverse
     */
    public void setReverseName( String reverse ) {
	this.reverseName = reverse;
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
     * Adds submitted hyb data record to hyb description's collection of slides
     *
     * @param slide Hyb data slide to add to hyb description
     */
    public void addHybData( HybData slide ) {
	if ( !hasHybData() ) {
	    hybData = new HybDataCollection();
	}
	hybData.add( slide );
    }

    /**
     * Removes submitted hyb data slide from hyb description's collection of
     * slides
     *
     * @param slide Hyb data slide to remove from hyb description
     */
    public void removeHybData( HybData slide ) {
	if ( hasHybData() ) {
	    hybData.remove( slide );
	}
    }

    /**
     * Retrieves hyb data slide with submitted name
     *
     * @param name Name of hyb data slide to retrieve
     * @return Hyb data slide with submitted name, or <code>null</code> if
     * no slide found with submitted name
     */
    public HybData getHybData( String name ) {
	return ( hasHybData() ) ? hybData.get( name ) : null;
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
     * Sets the number of hyb data slides associated with hyb description. This
     * number comes directly from data sheet used to populate hyb description 
     * during microarray loading and may not immediately agree with with 
     * getNumberHybData, which returns the number of hyb data objects currently
     * in hyb description's collection.
     *
     * @param number Number of hyb data slides for hyb description.
     */

    public void setDataSheetNumberHybData( int number ) {
	this.dataSheetNumberHybData = number;
    }

    /**
     * Gets number of hyb data slides associated with hyb description as entered
     * in data sheet used to populate hyb description during microarray loading. 
     * This may be different from getNumberHybData, which returns the number of 
     * hyb data slides actually contained in hyb description's collection of data.
     *
     * @return Number of hyb data slides associated with hyb description as
     * entered in data sheet used to populate hyb description during microarray
     * loading.
     */
    public int getDataSheetNumberHybData() {
	return dataSheetNumberHybData;
    }

    /**
     * Stores hyb description and all associated data to the database. 
     * Associated data will include any hyb data slides for hyb description
     * as well links to protocol, scanning software and array design. New 
     * records will be stored for protocol and scanning software if necessary.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any element to be stored
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn )
	throws SQLException, InvalidActionException {

	// store hybridization protocol data
	storeProtocol( conn );

	// store scanning software data
	storeScanningSoftware( conn );

	// store hyb description
	super.store( conn );

	// store individual data slides -- set newly created
	// hyb description id and expression set id
	if ( hasHybData() ) {
	    hybData.setHybDescriptionID( get_hyb_description_id() );
	    hybData.setExpressionSetID( get_expression_set_id() );
	    hybData.store( conn );
	}

    }

     /**
     * Deletes hyb description and all associated data from database. 
     * Associated data will include any hyb data slides for hyb description
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete (DBconnection conn )throws SQLException{	
        // delete associated hybdata
        if ( hasHybData()) {
	    for ( Iterator iter = getHybData(); iter.hasNext(); ) {
		HybData hybData = (HybData) iter.next();
		hybData.delete( conn );
	    }
        }  
        super.delete( conn );
    }

    /**
     * Store hybridization protocol data to the database.
     * this will store the protocol into database if protocol doesn't exist and protocol's 
     * association data if not exist.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any element to be stored
     * @throws SQLException if a database error occurs
     */
    private void storeProtocol( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	if ( hasProtocol() ) {
	    // stores protocol along with any URLs submitted for it and associated keywords
	    protocol.store( conn );
		
	   // set link to protocol in hyb description
	    super.set_hyb_protocol_ref_id( protocol.get_reference_id() );
	}
    }


    /**
     * Store scanning software data to the database. Storing here will only be 
     * done when creating new analysis software record; UPDATEs will not occur here.
     * This is done to avoid saving data over and over for each hybDescription
     * that use software record --- WILL NEED TO CHANGE THIS IF SOFTWARE DATA CAN 
     * BE UPDATED BY ONLINE CURATION TOOL
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any element to be stored
     * @throws SQLException if a database error occurs
     */
    private void storeScanningSoftware( DBconnection conn ) 
	throws InvalidActionException, SQLException {
	
	if ( hasScanningSoftware() ) {

	    if ( scanningSoftware.get_analysis_software_id() == null ) {

		scanningSoftware.store( conn );
		
		// add log message that software record was inserted
		InsertLogger.log( "Inserted analysis software " + 
				  get_program_name() + ", " +
				  "(" + get_version() + " " +
				  "[analysis software id: " + 
				  get_analysis_software_id() + 
				  "] " );
	    }
	    
	    
	    // set link in hyb description
	    super.set_scanning_software_id( get_analysis_software_id() );
	}
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** LoadableHybDescription content test ******" );
	if ( hasArrayDesign() ) {
	    arrayDesign.test();
	}

	if ( hasProtocol() ) {
	    protocol.test();
	}

	if ( hasScanningSoftware() ) {
	    scanningSoftware.test();
	}


	if ( hasHybData() ) {
	    hybData.test();
	}



	System.out.println( "**** LoadableHybDescription content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 387 );
	    LoadableHybDescription hybDescr = new LoadableHybDescription( conn, id );
	    hybDescr.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}
    }

}

