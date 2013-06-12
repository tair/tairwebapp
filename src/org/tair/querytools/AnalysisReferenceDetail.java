//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.13 $
// $Date: 2004/04/06 18:30:26 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * AnalysisReferenceDetail is a composite class to represent all information
 * associated with an entry in the AnalysisReference table for display
 * on the analysis reference detail page. AnalysisReferenceDetail contains
 * an instance of <code>TfcAnalysisReference</code> and 
 * <code>AnalysisSoftware</code> in addition to all information in super class 
 * <code>ReferenceDetail</code>
 *
 * <p>
 * AnalysisReferenceDetail overrides the getElementType() method implemented 
 * in ReferenceDetail to satisfy Accessible interface so that a type specific 
 * element type can be returned.
 */


public class AnalysisReferenceDetail extends ReferenceDetail {

    private TfcAnalysisReference analysisReference;
    private TfcAnalysisSoftware analysisSoftware;


    /**
     * Creates an empty instance of AnalysisDetail
     */ 
    public AnalysisReferenceDetail() {
	super();
    }


    /**
     * Creates an instance of AnalysisReferenceDetail that represents data
     * for the item with submitted reference id.
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public AnalysisReferenceDetail( DBconnection conn, Long reference_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, reference_id );
    }

  
    /**
     * Retrieves all data for the submitted reference id.
     * 
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long reference_id ) 
	throws RecordNotFoundException, SQLException {

	analysisReference = new TfcAnalysisReference( conn, reference_id );
	super.populateBaseObject( analysisReference );

	Long softwareID = analysisReference.get_analysis_software_id();
	if ( softwareID != null ) {
	    analysisSoftware = new TfcAnalysisSoftware( conn, softwareID );
	}
	super.get_information( conn, reference_id );
    }
 
    //
    // TfcAnalysisReference wrappers
    //
    public String get_analysis_reference_name() {
	return ( analysisReference != null ) ?
	    analysisReference.get_name() : null; 
    }

    public Long get_analysis_reference_id() { 
	return ( analysisReference != null ) ? 
	    analysisReference.get_analysis_reference_id() : null; 
    }

    public String get_parameters() {
	return ( analysisReference != null ) ? 
	    analysisReference.get_parameters() : null;
    }

    public String get_output_definition_criteria() {
	return ( analysisReference != null ) ?
	    analysisReference.get_output_definition_criteria() : null;
    }

    public Boolean get_is_nucleotide() {
	return ( analysisReference != null ) ?
	    analysisReference.get_is_nucleotide() : null; 
    }

    public Boolean get_is_peptide() { 
	return ( analysisReference != null ) ? 
	    analysisReference.get_is_peptide() : null;
    }

    public java.util.Date get_date_run() { 
	return ( analysisReference != null ) ? 
	    analysisReference.get_date_run() : null;
    }
    

    //
    // TfcAnalysisSoftware wrappers
    //
    public Long get_analysis_software_id() {
	return ( analysisSoftware != null ) ?
	    analysisSoftware.get_analysis_software_id() : null;
    }

    public String get_program_name() { 
	return ( analysisSoftware != null ) ? 
	    analysisSoftware.get_program_name() : null; 
    }

    public String get_description() { 
	return ( analysisSoftware != null ) ? 
	    analysisSoftware.get_description() : null;
    }

    public String get_sw_function() {
	return ( analysisSoftware != null ) ?
	    analysisSoftware.get_sw_function() : null;
    }

    public String get_source() { 
	return ( analysisSoftware != null ) ? 
	    analysisSoftware.get_source() : null; 
    }

    public String get_author() {
	return ( analysisSoftware != null ) ? 
	    analysisSoftware.get_author() : null;
    }

    public java.util.Date get_date_released() { 
	return ( analysisSoftware != null ) ? 
	    analysisSoftware.get_date_released() : null;
    }

    public String get_version() { 
	return ( analysisSoftware != null ) ? 
	    analysisSoftware.get_version() : null; 
    }

  
    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "*** AnalysisReferenceDetail content test ***" );
	super.test();
    
	if ( analysisReference != null ) {
	    analysisReference.test();
	}

	if ( analysisSoftware != null ) {
	    analysisSoftware.test();
	}
	System.out.println( "** AnalysisReferenceDetail content test end **" );
    }
  
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ){
	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1 );
	    AnalysisReferenceDetail ref = 
		new AnalysisReferenceDetail( conn, id );
	    ref.test();
      
	} catch( Exception e ) {
	    e.printStackTrace();
	}
    }

}
