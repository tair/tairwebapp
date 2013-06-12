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
import org.tair.tfc.TfcArrayDesign;



/**
 * ArrayDesignFactory handles the validation of microarray array design
 * records by looking up a submitted array design name in the database
 *
 * <p>
 * ArrayDesignFactory returns results as a TfcArrayDesign object. Microarray
 * loading code will use this record as part of a HybDescriptionObject to 
 * represent the chip array design for the replicate set.
 *
 * <p>
 * ArrayDesignFactory maintains a record of all previous names that have been
 * looked up (successfully and unsuccessfully) during the object's lifetime.
 * This is done to skip actual database lookups whenever possible, since the
 * quantity of data processed during microarray loading can be large, and since
 * multiple elements may be associated to the same small number of array
 * design records.
 */

public class ArrayDesignFactory {

    // map of array design names that have already been verified in
    // the database stored with array design name as String key referencing a 
    // populated TfcArrayDesign object. Name is stored all upper case to allow
    // for case insensitivity
    private Map arrayDesigns;

    // list of names that were searched for and not found in the database
    private List notFound;


    /**
     * Creates a new instance of ArrayDesignFactory
     */
    public ArrayDesignFactory() {
	arrayDesigns = new HashMap();
	notFound = new ArrayList();
    }


    /**
     * Translates submitted array design name into a TfcArrayDesign object 
     * populated with data from the database.
     *
     * @param conn An active connection to the database
     * @param name Array design name
     * @return TfcArrayDesign object populated with data or <code>null</code> 
     * if name was not found in the database
     * @throws SQLException if a database error occurs
     */
    public TfcArrayDesign getArrayDesign( DBconnection conn, String name )
	throws SQLException {
	
	TfcArrayDesign arrayDesign = lookupArrayDesign( conn, name );

	return arrayDesign; // will be null if record not found

    }

    /**
     * Translates submitted array design name into a TfcArrayDesign object. 
     * If name has been looked up before, object will be returned from array
     * designs cache, otherwise a database lookup will be executed. 
     *
     * <p>
     * After lookup, array design name will be saved for future reference in 
     * either found array designs map or not found list.
     *
     * @param conn An active connection to the database
     * @param name Array design name to look up
     * @return TfcArrayDesign instance representing data found for 
     * submitted name or <code>null</code> if array design was not found in the
     * database
     * @throws SQLException if a database error occurs
     */
    private TfcArrayDesign lookupArrayDesign( DBconnection conn, String name )
	throws SQLException {
		
	TfcArrayDesign arrayDesign = null;

	// uppercase input term 
	String nameUC = name.toUpperCase();
	
	// get previously created record if possible
	if ( arrayDesigns.containsKey( nameUC ) ) {
	    arrayDesign = (TfcArrayDesign) arrayDesigns.get( nameUC );
	    
	    // search now if haven't searched for this value before
	} else if ( !notFound.contains( nameUC ) ) {
	    Long arrayDesignID =
		TfcArrayDesign.retrieveArrayDesignID( conn, name );
	    
	    // if found, create object and add to collection of found records
	    if ( arrayDesignID != null ) {
		arrayDesign = new TfcArrayDesign( conn, arrayDesignID );
		arrayDesigns.put( nameUC, arrayDesign );
		
		// if not found, save name in not found list to save time
		// if requested again
	    } else {
		notFound.add( nameUC );
	    }
	}

	return arrayDesign;
    }
}
