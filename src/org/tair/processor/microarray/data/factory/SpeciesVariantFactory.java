//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:29:31 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data.factory;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcSpeciesVariant;



/**
 * SpeciesVariantFactory handles the population and validation of species 
 * variant records  for a submitted abbreviated name in the database
 *
 * <p>
 * SpeciesVariantFactory returns results as a TfcSpeciesVariant object. 
 * Microarray loading code will use this record as part of a new germplasm
 * record to represent the species variant for that germplasm.
 *
 * <p>
 * SpeciesVariantFactory maintains a record of all previous names that have
 * been looked up (successfully and unsuccessfully) during the object's 
 * lifetime. This is done to skip actual database lookups whenever possible,
 * since the quantity of data processed during microarray loading can be large,
 * and since multiple elements may be associated to the same small number of 
 * species variants.
 */

public class SpeciesVariantFactory {

    // map of species variants that have already been verified in the database
    // stored with abbreviated name as String key referencing a populated 
    // TfcSpeciesVariant object. Name is stored all upper case to allow
    // for case insensitivity
    private Map speciesVariants;

    // list of names that were searched for and not found in the database
    private List notFound;


    /**
     * Creates a new instance of SpeciesVariantFactory
     */
    public SpeciesVariantFactory() {
	speciesVariants = new HashMap();
	notFound = new ArrayList();
    }


    /**
     * Translates submitted species variant abbreviated name into a 
     * TfcSpeciesVariant object populated with data from the database.
     *
     * @param conn An active connection to the database
     * @param name Abbreviated name to look up
     * @return TfcSpeciesVariant object populated with data or <code>null</code> 
     * if name was not found in the database
     * @throws SQLException if a database error occurs
     */
    public TfcSpeciesVariant getSpeciesVariant( DBconnection conn, String name )
	throws SQLException {
	
	TfcSpeciesVariant speciesVariant = lookupSpeciesVariant( conn, name );

	return speciesVariant; // will be null if record not found

    }

    /**
     * Translates submitted abbreviated name into a TfcSpeciesVariant object. 
     * If name has been looked up before, object will be returned from species
     * variants cache, otherwise a database lookup will be executed. 
     *
     * <p>
     * After lookup, abbreviated name will be saved for future reference in 
     * either found variants map or not found list.
     *
     * @param conn An active connection to the database
     * @param name Abbreviated name to look up
     * @return TfcSpeciesVariant instance representing data found for 
     * submitted name or <code>null</code> if name was not found in the
     * database
     * @throws SQLException if a database error occurs
     */
    private TfcSpeciesVariant lookupSpeciesVariant( DBconnection conn, 
						    String name )
	throws SQLException {
	
	TfcSpeciesVariant speciesVariant = null;

	// uppercase input term 
	String nameUC = name.toUpperCase();
	
	// get previously created record if possible
	if ( speciesVariants.containsKey( nameUC ) ) {
	    speciesVariant = (TfcSpeciesVariant) speciesVariants.get( nameUC );
	    
	    // search now if haven't searched for this value before
	} else if ( !notFound.contains( nameUC ) ) {
	    Long speciesVariantID = 
		TfcSpeciesVariant.abbrevNameToSpeciesVariantID( conn, name );
	    
	    // if found, create object and add to collection of found records
	    if ( speciesVariantID != null ) {
		speciesVariant = new TfcSpeciesVariant( conn, 
							speciesVariantID );

		speciesVariants.put( nameUC, speciesVariant );
		
		// if not found, save name in not found list to save time
		// if requested again
	    } else {
		notFound.add( nameUC );
	    }
	}

	return speciesVariant;
    }
}
