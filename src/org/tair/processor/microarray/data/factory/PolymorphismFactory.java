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
import org.tair.tfc.TfcPolymorphism;



/**
 * PolymorphismFactory handles the population and validation of polymorphism
 * (allele) records for a submitted polymorphism name in the database
 *
 * <p>
 * PolymorphismFactory returns results as a TfcPolymorphism object. 
 * Microarray loading code will use this record as part of a new germplasm
 * record to represent the alleles for that germplasm.
 *
 * <p>
 * PolymorphismFactory maintains a record of all previous names that have
 * been looked up (successfully and unsuccessfully) during the object's 
 * lifetime. This is done to skip actual database lookups whenever possible,
 * since the quantity of data processed during microarray loading can be large,
 * and since multiple elements may be associated to the same small number of 
 * alleles
 */

public class PolymorphismFactory {

    // map of polymorphisms that have already been verified in the database
    // stored with name as String key referencing a populated TfcPolymorphism 
    // object. Name is stored all upper case to allow for case insensitivity
    private Map polymorphisms;

    // list of names that were searched for and not found in the database
    private List notFound;


    /**
     * Creates a new instance of PolymorphismFactory
     */
    public PolymorphismFactory() {
	polymorphisms = new HashMap();
	notFound = new ArrayList();
    }


    /**
     * Translates submitted polymorphism name into a TfcPolymorphism object 
     * populated with data from the database.
     *
     * <p>
     * If desired, polymorphism lookups can be restricted to alleles only
     * through the allelesOnly argument.
     *
     * @param conn An active connection to the database
     * @param name Name to look up
     * @param allelesOnly If <code>true</code> name search will only return
     * a polymorphism if the "is_allele" flag is set to true; if 
     * <code>false</code> any polymorphism matching name will be returned 
     * regardless of allele status.
     * @return TfcPolymorphism object populated with data or <code>null</code> 
     * if name was not found in the database
     * @throws SQLException if a database error occurs
     */
    public TfcPolymorphism getPolymorphism( DBconnection conn, 
					    String name,
					    boolean allelesOnly )
	throws SQLException {
	
	TfcPolymorphism poly = lookupPolymorphism( conn, name );

	// determine if found polymorphism is an allele
	if ( poly != null ) {
	    boolean isAllele = ( poly.get_is_allele() != null || 
				 poly.get_is_allele().booleanValue() );

	    // if found poly is not allele when only alleles requested,
	    // set local reference null and return
	    if ( allelesOnly && !isAllele ) {
		poly = null;
	    } 
	}

	return poly; // will be null if record not found
    }


    /**
     * Translates submitted name into a TfcPolymorphism object. If name has
     * been looked up before, object will be returned from polymorphisms
     * cache, otherwise a database lookup will be executed. 
     *
     * <p>
     * After lookup, name will be saved for future reference in either found
     * polymorphisms map or not found list.
     *
     * @param conn An active connection to the database
     * @param name Name to look up
     * @return TfcPolymorphism instance representing data found for 
     * submitted name or <code>null</code> if name was not found in the
     * database
     * @throws SQLException if a database error occurs
     */
    private TfcPolymorphism lookupPolymorphism( DBconnection conn, String name )
	throws SQLException {
	
	TfcPolymorphism poly = null;

	// uppercase input term 
	String nameUC = name.toUpperCase();
	
	// get previously created record if possible
	if ( polymorphisms.containsKey( nameUC ) ) {
	    poly = (TfcPolymorphism) polymorphisms.get( nameUC );
	    
	    // search now if haven't searched for this value before
	} else if ( !notFound.contains( nameUC ) ) {
	    Long polyID = 
		TfcPolymorphism.retrievePolymorphismID( conn, name );
	    
	    // if found, create object and add to collection of found records
	    if ( polyID != null ) {
		poly = new TfcPolymorphism( conn, polyID );

		polymorphisms.put( nameUC, poly );
		
		// if not found, save name in not found list to save time
		// if requested again
	    } else {
		notFound.add( nameUC );
	    }
	}

	return poly;
    }
}
