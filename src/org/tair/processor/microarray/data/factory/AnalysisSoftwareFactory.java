//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:29:29 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data.factory;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnalysisSoftware;



/**
 * AnalysisSoftwareFactory handles the creation of analysis software object by
 * using program names and versions.
 *
 * <p>
 * AnalysisSoftwareFactory returns results as a TfcAnalysisSoftware object.
 * Microarray loading code will use this record as part of a 
 * HybDescriptionObject to represent the scanning software used for the
 * replicate set.
 *
 * <p>
 * AnalysisSoftwareFactory maintains a record of all previous names and 
 * versions that have been looked up (successfully and unsuccessfully) during
 * the object's lifetime. This is done to skip actual database lookups whenever
 * possible, since the quantity of data processed during microarray loading can
 * be large, and since multiple elements may be associated to the same small 
 * number of software programs.
 *
 * <p>
 * If possible, objects are populated with analyis software data from the 
 * database, however AnalysisSoftwareFactory also caches new software records
 * that will be INSERTed when expression set is stored to database.  This is 
 * done to allow multiple hyb descriptions to share a reference to the same 
 * new analysis software object; this sharing of references should allow us to
 * avoid repeatedly storing the new data to the db as new hyb descriptions are
 * inserted.
 */

public class AnalysisSoftwareFactory {

    // map of analysis software programs that have already been created stored
    // as concatenated combination of program name and version number 
    // referencing a populated TfcAnalysisSoftware object. Name/version number
    // key is stored all upper case to allow for case insensitivity
    private Map software;

    // list of names and versions that were searched for and not found in 
    // the database
    private List notFound;


    /**
     * Creates a new instance of AnalysisSoftwareFactory
     */
    public AnalysisSoftwareFactory() {
	software = new HashMap();
	notFound = new ArrayList();
    }


    /**
     * Translates submitted software program name and version into a 
     * TfcAnalysisSoftware object populated with data from the database.
     * Combination of two values must be used since name on its own is
     * not a UNIQUE identifier in AnalysisSoftware table
     *
     * Translates submitted software program name and version into a 
     * populated TfcAnalysisSoftware object. Returned object may represent
     * data that is not yet in the db, but will be added when expression 
     * set is stored to the db.  This is done to allow multiple hyb descriptions
     * to share the same reference to a new analysis software record, and avoid 
     * storing new software data repeatedly.


     * @param conn An active connection to the database
     * @param program Software program name to look up
     * @param version Software version to look up
     * @return TfcAnalysisSoftware object populated with data or 
     * <code>null</code> if program was not found.
     * @throws SQLException if a database error occurs
     */
    public TfcAnalysisSoftware getAnalysisSoftware( DBconnection conn,
						    String program,
						    String version )
	throws SQLException {
	
	TfcAnalysisSoftware analysisSoftware = 
	    lookupSoftware( conn, program, version );

	return analysisSoftware; // will be null if record not found

    }

    /**
     * Translates submitted software program name and version into a 
     * TfcAnalysisSoftware object. If program/version has been looked up 
     * before, object will be returned from software cache, otherwise a 
     * database lookup will be executed. 
     *
     * <p>
     * After lookup, combination of submitted name and version will be saved
     * for future reference in either found software map or not found list.
     *
     * @param conn An active connection to the database
     * @param program Software program name to look up
     * @param version Software version to look up
     * @return TfcAnalysisSoftware instance representing data found for 
     * submitted program/version combination, or <code>null</code> if program
     * was not found in the database
     * @throws SQLException if a database error occurs
     */
    private TfcAnalysisSoftware lookupSoftware( DBconnection conn, 
						String program,
						String version ) 
	throws SQLException {

	TfcAnalysisSoftware analysisSoftware = null;

	// get combined key from program and version
	String programUC = getProgramVersionKey( program, version );
	
	// get previously created record if possible
	if ( software.containsKey( programUC ) ) {
	    analysisSoftware = 
		(TfcAnalysisSoftware) software.get( programUC );
	    
	    // search now if haven't searched for these values before
	} else if ( !notFound.contains( programUC ) ) {
	    Long softwareID = 
		TfcAnalysisSoftware.retrieveAnalysisSoftwareID( conn,
								program,
								version );
	    
	    // if found, create object and add to collection of found records
	    if ( softwareID != null ) {
		analysisSoftware = new TfcAnalysisSoftware( conn, softwareID );
		software.put( programUC, analysisSoftware );
		
		// if not found, save program in not found list to save time
		// if requested again
	    } else {
		notFound.add( programUC );
	    }
	}

	return analysisSoftware;
    }


    /** 
     * Combine program name and version into a single uppercased String
     * key for use in storing and looking up program in caches.  Two
     * values will be joined with an underscore character ("_") between
     * them. Null values for either variable will not be added to the
     * key string.
     *
     * @param program Software program name to use for key
     * @param version Version to use for key 
     * @return String containing combination of non-null values joined
     * with an underscore character
     */
    private String getProgramVersionKey( String program, String version ) {
	StringBuffer keyBuffer = new StringBuffer();
	if ( program != null ) {
	    keyBuffer.append( program.toUpperCase() );
	}

	keyBuffer.append( "_" );

	if ( version != null ) {
	    keyBuffer.append( version.toUpperCase() );
	}

	return keyBuffer.toString();
    }



    /**
     * Adds a new analysis software record to software cache. Submitted 
     * analysis software record will be populated with data submitted through
     * data loading sheets instead of with data from the database.  A new 
     * record will be created for this software record when expression set 
     * data is stored.
     *
     * <p>
     * This is done so that multiple hyb descriptions using the same new 
     * analysis software record will all use the same object reference for 
     * software.  Sharing of reference allows us to avoid storing data multiple
     * times to the database as hyb description data is inserted.
     *
     * @param analysisSoftware Newly created analysis software object populated
     * with data imported from data file. Software record will be stored in 
     * software cache using program and version set for record.
     */
    public void addNewAnalysisSoftware( TfcAnalysisSoftware analysisSoftware ) {

	// get combined key from program and version and store
	// for future use
	String programUC = 
	    getProgramVersionKey( analysisSoftware.get_program_name(), 
				  analysisSoftware.get_version() );
	
	software.put( programUC, analysisSoftware );

	// remove program/version combo. from not found list so future 
	// requests will get newly created object
	notFound.remove( programUC );
    }

}
