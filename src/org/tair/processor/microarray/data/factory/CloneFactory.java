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

import org.tair.processor.microarray.data.LoadableClone;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcClone;

/**
 * CloneFactory handles the creation of clone data objects using 
 * combination of clone's name, insert type and vector type.
 *
 * <p>
 * CloneFactory returns results as a LoadableClone object. Microarray
 * loading code will use this record when creating a new Germplasm
 * record.
 *
 * <p>
 * CloneFactory maintains a record of all previous name, insert type
 * and vector type combinations that have been looked up (successfully
 * and unsuccessfully) during the object's lifetime. This is done to 
 * skip actual database lookups whenever possible.
 *
 * <p>
 * If possible, objects are created populated with clone data from the 
 * database, however CloneFactory also caches new clone records 
 * (referenced by name, insert type, vector type combination) that will
 * be INSERTed when germplasm is stored to database.  This is done to 
 * allow multiple germplasms to share a reference to the same new clone
 * object; this sharing of references should allow us to avoid repeatedly
 * storing the new data to the db as new germplasms are inserted.
 */

public class CloneFactory {

    // map of populated clone objects stored with clone name, insert type
    // and vector type combined as a single string key referencing a 
    // populated LoadableClone; this map may contain new clone objects 
    // that will be INSERTed when expression set data is stored.
    private Map clones;

    // clone name/insert type/vector type combinations that were not found
    // in db and do not yet have a new clone entry created
    private List notFound;

    /**
     * Creates a new instance of CloneFactory
     */
    public CloneFactory() {
	clones = new HashMap();
	notFound = new ArrayList();
    }


    /**
     * Translates submitted clone name, insert type and vector type into
     * a populated LoadableClone object. This method may return an object that
     * represents data that is not yet in the db, but will be added when 
     * expression set is stored to the db.  This is done to allow multiple
     * germplasms to share the same reference to a new clone record, and avoid
     * storing clone data repeatedly.
     *
     * @param conn An active connection to the database
     * @param name Clone name to look up
     * @param insertType Insert type to look up
     * @param vectorType Vector type to look up
     * @return LoadableClone object populated with data or <code>null</code> 
     * if name was not found in the database or new object cache.
     * @throws SQLException if a database error occurs
     */
    public LoadableClone getClone( DBconnection conn, 
				   String name,
				   String insertType,
				   String vectorType )
	throws SQLException {
	
	LoadableClone clone = lookupName( conn, name, insertType, vectorType );

	return clone; // will be null if record not found

    }

    /**
     * Translates submitted clone name into a LoadableClone object. If name
     * has been looked up before, object will be returned from clones cache of
     * objects populated from database or that are to be newly inserted;  if 
     * name not found, a database look up will be executed.
     *
     * <p>
     * After lookup, name will be saved for future reference in clones map or
     * or not found names list.
     *
     * @param conn An active connection to the database
     * @param name Clone name to look up
     * @param insertType Insert type to look up
     * @param vectorType Vector type to look up
     * @return LoadableClone instance representing data found for submitted 
     * name or <code>null</code> if name was not found in the database or
     * new object cache.
     * @throws SQLException if a database error occurs
     */
    private LoadableClone lookupName( DBconnection conn, 
				      String name,
				      String insertType,
				      String vectorType )
	throws SQLException {

	LoadableClone clone = null;

	// get combined key from clone name, insert type and vector type
	String cloneInfoUC = getCombinedKey( name, insertType, vectorType );
	
	// get previously created record if possible -- returned record
	// may either be from db or from newly created clone record
	if ( clones.containsKey( cloneInfoUC ) ) {
	    clone = (LoadableClone) clones.get( cloneInfoUC );
	    
	    // search now if haven't searched for this value before
	} else if ( !notFound.contains( cloneInfoUC ) ) {
	    Long cloneID = LoadableClone.retrieveCloneID( conn, 
							  name,
							  insertType,
							  vectorType );
	    
	    // if found, create object and add to collections of 
	    // found names and ids
	    if ( cloneID != null ) {
		clone = new LoadableClone( conn, cloneID );
		clones.put( cloneInfoUC, clone );
		
		// if not found, save combined key in not found list to 
		// save time if requested again
	    } else {
		notFound.add( cloneInfoUC );
	    }
	}

	return clone;
    }


    /** 
     * Combine clone name, insert type and vector typed into a single 
     * uppercased String key for use in storing and looking up clones
     * in caches.  Three values will be joined with an underscore 
     * character ("_") between them. Null values for any variable will
     * not be added to the key string.
     *
     * @param name Clone name to use for key
     * @param insertType Insert type to use for key
     * @param vectorType Vector type to use for key
     * @return String containing combination of non-null values joined
     * with an underscore character
     */
    private String getCombinedKey( String name, 
				   String insertType, 
				   String vectorType ) 
    {
	StringBuffer keyBuffer = new StringBuffer();
	if ( name != null ) {
	    keyBuffer.append( name.toUpperCase() );
	}

	keyBuffer.append( "_" );

	if ( insertType != null ) {
	    keyBuffer.append( insertType.toUpperCase() );
	}


	keyBuffer.append( "_" );

	if ( vectorType != null ) {
	    keyBuffer.append( vectorType.toUpperCase() );
	}

	return keyBuffer.toString();
    }



    /**
     * Adds a new clone record to cache of clones referenced by combination
     * of clone name, insert type and vector type. Submitted clone will be
     * populated with data submitted through data loading instead of with 
     * data from the database.  A new record will be created for this clone
     * when expression set data is stored.
     *
     * <p>
     * This is done so that multiple germplasms using the same new clone
     * record will all use the same object reference for clone.  Sharing
     * of reference allows us to avoid storing clone data multiple times
     * to the database as new germplasm data is inserted.
     *
     * @param clone Newly created clone object populated with data
     * imported from data file.  Clone will be stored in clones 
     * cache using name, insert type and vector type set for clone.
     */
    public void addNewClone( LoadableClone clone ) {

	// add to cache for future use
	String cloneInfoUC = getCombinedKey( clone.get_name(),
					     clone.get_insert_type(),
					     clone.get_vector_type() );
	clones.put( cloneInfoUC, clone );

	// remove combined key from not found list so future requests
	// will get newly created object
	notFound.remove( cloneInfoUC );
    }
     

}
