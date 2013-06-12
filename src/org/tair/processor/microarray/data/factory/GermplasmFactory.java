//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:29:30 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data.factory;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.processor.microarray.data.LoadableGermplasm;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGermplasm;
import org.tair.utilities.RecordNotFoundException;



/**
 * GermplasmFactory handles the creation of germplasm data objects by name, 
 * TAIR accession number or ABRC stock number. 
 *
 * <p>
 * GermplasmFactory returns results as a LoadableGermplasm object. Microarray
 * loading code will use this record as part of a LoadableBioSample to represent
 * the germplasm used in the bio sample.
 *
 * <p>
 * GermplasmFactory maintains a record of all previous names, ids and stock 
 * numbers that have been looked up (successfully and unsuccessfully) during
 * the object's lifetime. This is done to skip actual database lookups whenever
 * possible, since the quantity of data processed during microarray loading can
 * be large, and since multiple elements may be associated to the same small 
 * number of germplasms.
 *
 * <p>
 * If possible, objects are created populated with germplasm data from the 
 * database, however GermplasmFactory also caches new germplasm records 
 * (referenced by name) that will be INSERTed when expression set is stored to 
 * database.  This is done to allow multiple bio samples to share a reference 
 * to the same new germplasm object; this sharing of references should allow us
 * to avoid repeatedly storing the new data to the db as new bio samples are 
 * inserted.
 *
 * <p>
 * If populated from the database, returned LoadableGermplasm will contain
 * only basic germplasm data. If populated from data sheet, object will contain
 * all data submitted in data sheet including germplasm data as well associated
 * clone and polymorphism data.
 */

public class GermplasmFactory {

    // map of germplasm tair object ids referencing a populated LoadableGermplasm
    // instance for that id
    private Map germplasmIDs;

    // map of germplasm names in all uppercase, referencing a populated 
    // LoadableGermplasm for that name; this map may contain new germplasm
    // objects that will be INSERTed when expression set data is stored.
    private Map germplasmNames;

    // map of germplasm stock numbers in all uppercase, referencing a
    // populated LoadableGermplasm for that stock number
    private Map germplasmStocks;

    // germplasm names that were not found in db
    private List notFoundNames;

    // germplasm tair object ids (TAIR accession numbers) that were not found
    // in db
    private List notFoundIDs;

    // ABRC stock numbers that were not found in db
    private List notFoundStocks;


    /**
     * Creates a new instance of GermplasmFactory
     */
    public GermplasmFactory() {
	germplasmIDs = new HashMap();
	germplasmNames = new HashMap();
	germplasmStocks = new HashMap();

	notFoundNames = new ArrayList();
	notFoundIDs = new ArrayList();
	notFoundStocks = new ArrayList();
    }


    /**
     * Translates submitted germplasm name into a populated 
     * LoadableGermplasm object. Unlike looking up by id or stock number,
     * this method may return an object that represents data that is
     * not yet in the db, but will be added when expression set is stored
     * to the db.  This is done to allow multiple bio samples to share
     * the same reference to a new germplasm record, and avoid storing
     * germplasm data repeatedly.
     *
     * @param conn An active connection to the database
     * @param name Germplasm name to look up
     * @return LoadableGermplasm object populated with data or <code>null</code> 
     * if name was not found in the database or new object cache.
     * @throws SQLException if a database error occurs
     */
    public LoadableGermplasm getGermplasmName( DBconnection conn, String name )
	throws SQLException {
	
	LoadableGermplasm germplasm = lookupName( conn, name );

	return germplasm; // will be null if record not found

    }


    /**
     * Translates submitted germplasm accession id (tair object id) into a
     * LoadableGermplasm object populated with data from the database.
     *
     * @param conn An active connection to the database
     * @param id Germplasm TAIR accession number to look up
     * @return LoadableGermplasm object populated with data or <code>null</code> 
     * if id was not found in the database
     * @throws SQLException if a database error occurs
     */
    public LoadableGermplasm getGermplasmAccession( DBconnection conn, Long id )
	throws SQLException {
	
	LoadableGermplasm germplasm = lookupID( conn, id );

	return germplasm; // will be null if record not found

    }

    /**
     * Translates submitted ABRC stock number into a LoadableGermplasm object 
     * populated with data from the database. In most cases, this should
     * be the same value as germplasm name, but need to check the Stock table
     * to be absolutely sure.
     *
     * @param conn An active connection to the database
     * @param number ABRC stock number to look up
     * @return LoadableGermplasm object populated with data or <code>null</code> 
     * if stock number was not found for a germplasm.
     * @throws SQLException if a database error occurs
     */
    public LoadableGermplasm getGermplasmStock( DBconnection conn, String number )
	throws SQLException {
	
	LoadableGermplasm germplasm = lookupStock( conn, number );

	return germplasm; // will be null if record not found

    }


    /**
     * Translates submitted germplasm name into a LoadableGermplasm object. If
     * name has been looked up before, object will be returned from germplasms
     * cache of objects populated from database or that are to be newly 
     * inserted;  if name not found, a database look up will be executed.
     *
     * <p>
     * After lookup, name will be saved for future reference in either found
     * maps or not found names list.
     *
     * @param conn An active connection to the database
     * @param name Germplasm name to look up
     * @return LoadableGermplasm instance representing data found for submitted
     * name or <code>null</code> if name was not found in the database or new 
     * object cache.
     * @throws SQLException if a database error occurs
     */
    private LoadableGermplasm lookupName( DBconnection conn, String name )
	throws SQLException {

	LoadableGermplasm germplasm = null;

	// uppercase input term 
	String nameUC = name.toUpperCase();
	
	// get previously created record if possible -- returned record
	// may either be from db or from newly created germplasm record
	if ( germplasmNames.containsKey( nameUC ) ) {
	    germplasm = (LoadableGermplasm) germplasmNames.get( nameUC );
	    
	    // search now if haven't searched for this value before
	} else if ( !notFoundNames.contains( nameUC ) ) {
	    Long tairObjectID = TfcGermplasm.retrieveTairObjectID( conn, name );
	    
	    // if found, create object and add to collections of 
	    // found names and ids
	    if ( tairObjectID != null ) {
		germplasm = new LoadableGermplasm( conn, tairObjectID );
		germplasmNames.put( nameUC, germplasm );
		germplasmIDs.put( tairObjectID, germplasm );
		
		// if not found, save name in not found list to save time
		// if requested again
	    } else {
		notFoundNames.add( nameUC );
	    }
	}

	return germplasm;
    }

    /**
     * Translates submitted germplasm TAIR accession number (tair object id)
     * into a LoadableGermplasm object. If id has been looked up before, object
     * will be returned from germplasms cache, otherwise a database lookup 
     * will be executed. 
     *
     * <p>
     * After lookup, id will be saved for future reference in either found 
     * maps or not found ids list.
     *
     * @param conn An active connection to the database
     * @param id Germplasm accession (tair object id) to look up
     * @return LoadableGermplasm instance representing data found for submitted id
     * or <code>null</code> if id was not found in the database
     * @throws SQLException if a database error occurs
     */
    private LoadableGermplasm lookupID( DBconnection conn, Long id )
	throws SQLException {


	LoadableGermplasm germplasm = null;
	
	// get previously created record if possible
	if ( germplasmIDs.containsKey( id ) ) {
	    germplasm = (LoadableGermplasm) germplasmIDs.get( id );
	    
	    // Lookup id now if haven't searched for this value before.
	    // ID lookups can be done by creating object using constructor -
	    // RecordNotFoundException will be thrown if id not found
	} else if ( !notFoundIDs.contains( id ) ) {

	    try {

		germplasm = new LoadableGermplasm( conn, id );

		// add to collections of  found names and ids -- if not
		// found, this step will be skipped since exception will
		// be thrown by constructor
		germplasmNames.put( germplasm.get_name().toUpperCase(), 
				    germplasm );
		germplasmIDs.put( id, germplasm );
		

		// if not found, save id in not found list to save time
		// if requested again
	    } catch ( RecordNotFoundException rnfe ) {
		notFoundIDs.add( id );
	    }
	}

	return germplasm;
    }

    /**
     * Translates submitted ABRC stock number into a LoadableGermplasm object. If
     * stock number has been looked up before, object will be returned from 
     * germplasms cache, otherwise a database lookup will be executed. 
     *
     * <p>
     * After lookup, stock number will be saved for future reference in 
     * either found maps or not found stock numbers list.
     *
     * @param conn An active connection to the database
     * @param stockNumber Stock number to look up
     * @return LoadableGermplasm instance representing data found for submitted
     * ABRC stock number or <code>null</code> if stock number was not found
     * in the database
     * @throws SQLException if a database error occurs
     */
    private LoadableGermplasm lookupStock( DBconnection conn, String stockNumber )
	throws SQLException {

	LoadableGermplasm germplasm = null;

	// uppercase input term 
	String numberUC = stockNumber.toUpperCase();
	
	// get previously created record if possible
	if ( germplasmStocks.containsKey( numberUC ) ) {
	    germplasm = (LoadableGermplasm) germplasmStocks.get( numberUC );
	    
	    // search now if haven't searched for this value before
	} else if ( !notFoundStocks.contains( numberUC ) ) {

	    Long tairObjectID = 
		TfcGermplasm.stockNumberToTairObjectID( conn, stockNumber );
						   	    
	    // if id found, check ids cache for a populated object, else
	    // create one; add stock number to found maps to save time
	    // next time number is requested
	    if ( tairObjectID != null ) {

		if ( germplasmIDs.containsKey( tairObjectID ) ) {
		    germplasm = (LoadableGermplasm) germplasmIDs.get( tairObjectID );

		} else {
		    germplasm = new LoadableGermplasm( conn, tairObjectID );

		    germplasmNames.put( germplasm.get_name().toUpperCase(),
					germplasm );
		    germplasmIDs.put( tairObjectID, germplasm );
		}

		germplasmStocks.put( numberUC, germplasm );
		
		// if not found, save stock number in not found list to save
		// time requested again
	    } else {
		notFoundStocks.add( numberUC );
	    }
	}

	return germplasm;
    }


    /**
     * Adds a new germplasm record to cache of germplasms referenced by name.
     * Submitted germplasm will be populated with data submitted through data
     * loading instead of with data from the database.  A new record will be
     * created for this germplasm when expression set data is stored.
     *
     * <p>
     * This is done so that multiple bio samples using the same new germplasm
     * record will all use the same object reference for germplasm.  Sharing
     * of reference allows us to avoid storing germplasm data multiple times
     * to the database as bio sample data is inserted.
     *
     * @param germplasm Newly created germplasm object populated with data
     * imported from data file.  Germplasm will be stored in germplasms 
     * cache using name set for germplasm.
     */
    public void addNewGermplasm( LoadableGermplasm germplasm ) {

	// add to names map for future use
	String nameUC = germplasm.get_name().toUpperCase();
	germplasmNames.put( nameUC, germplasm );

	// remove name from not found names list so future requests
	// will get newly created object
	notFoundNames.remove( nameUC );
    }
     

}
