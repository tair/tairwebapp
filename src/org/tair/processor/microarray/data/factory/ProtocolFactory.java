//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.2 $
// $Date: 2005/05/03 21:03:53 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data.factory;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.processor.microarray.data.LoadableProtocol;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcProtocol;



/**
 * ProtocolFactory handles the creation of protocol records by protocol
 * title.
 *
 * <p>
 * ProtocolFactory returns results as a LoadableProtocol object. Microarray
 * loading code will use this record to resolve foreign key links to
 * Protocol for various elements including HybDescription, LabeledSample
 * and BioSample
 *
 * <p>
 * ProtocolFactory maintains a record of all previous titles that have been
 * looked up (successfully and unsuccessfully) during the object's lifetime.
 * This is done to skip actual database lookups whenever possible, since the
 * quantity of data processed during microarray loading can be large, and since
 * multiple elements may be associated to the same small number of protocol
 * records
 *
 * <p>
 * If possible, objects are created populated with protocol data from the 
 * database, however ProtocolFactory also caches new protocol records 
 * (referenced by title) that will be INSERTed when expression set is stored to 
 * database.  This is done to allow multiple elements to share a reference 
 * to the same new protocol object; this sharing of references should allow us
 * to avoid repeatedly storing the new data to the db as new elements are 
 * inserted.
 */

public class ProtocolFactory {

    // map of protocol titles that have already been populated stored with
    // title as String key referencing a LoadableProtocol object. Title is
    // stored all upper case to allow for case insensitivity
    private Map protocols;

    // list of titles that were searched for and not found in the database
    private List notFound;


    /**
     * Creates a new instance of ProtocolFactory
     */
    public ProtocolFactory() {
	protocols = new HashMap();
	notFound = new ArrayList();
    }


    /**
     * Translates submitted protocol title into a LoadableProtocol object 
     * populated with data from the database or from data file.
     *
     * @param conn An active connection to the database
     * @param title Protocol title
     * @return LoadableProtocol object populated with data or <code>null</code> 
     * if title was not found
     * @throws SQLException if a database error occurs
     */
    public LoadableProtocol getProtocol( DBconnection conn, String title, String description )
	throws SQLException {
	// using title and description to look up a protocol, title itself won't be enough, per marga
	LoadableProtocol protocol = lookupProtocol( conn, title , description);

	return protocol; // will be null if record not found

    }

    /**
     * Translates submitted protocol title into a LoadableProtocol object. If
     * title has been looked up before, object will be returned from protocols
     * cache, otherwise a database lookup will be executed. 
     *
     * <p>
     * After lookup, protocol title will be saved for future reference in 
     * either found protocols map or not found list.
     *
     * @param conn An active connection to the database
     * @param title Protocol title to look up
     * @param description Protocol description to look up
     * @return LoadableProtocol instance representing data found for submitted
     * title and descriptionor <code>null</code> if protocol was not found in the database
     * @throws SQLException if a database error occurs
     */
    private LoadableProtocol lookupProtocol( DBconnection conn, String title , String description)
	throws SQLException {
		
	LoadableProtocol protocol = null;

	// uppercase input term 

 	String protocolLookUpKey =  title.toUpperCase() + "|" + description.toUpperCase();
	// get previously created record if possible
	if ( protocols.containsKey(protocolLookUpKey  ) ) {
	    protocol = (LoadableProtocol) protocols.get( protocolLookUpKey);
	    
	    // search now if haven't searched for this key before
	} else if ( !notFound.contains(protocolLookUpKey ) ) {
	    Long referenceID = TfcProtocol.retrieveReferenceID( conn, title, description  );
	    
	    // if found, create object and add to collection of found records
	    if ( referenceID != null ) {
		protocol = new LoadableProtocol( conn, referenceID );
		protocols.put( protocolLookUpKey, protocol );
		
		// if not found, save title in not found list to save time
		// if requested again
	    } else {
		notFound.add( protocolLookUpKey  );
	    }
	}

	return protocol;
    }




    /**
     * Adds a new protocol record to cache. Submitted protocol record will 
     * be populated with data submitted through data files instead of with
     * data from the database.  A new record will be created for this protocol
     * when expression set data is stored.
     *
     * <p>
     * This is done so that multiple elements using the same new protocol 
     * record will all use the same object reference for protocol.  Sharing
     * of reference allows us to avoid storing data multiple times to the
     * database as other elements are inserted.
     *
     * @param protocol Newly created protocol object populated with data 
     * imported from data file. Protocol will be stored in cache using 
     * protocol title set for protocol.
     */
    public void addNewProtocol( LoadableProtocol protocol ) {

	// add to lookupKey to map for future use
        String protocolLookUpKey = protocol.get_title().toUpperCase() + "|" 
                                 + protocol.get_description().toUpperCase();
	protocols.put( protocolLookUpKey, protocol );

	// remove this key from not found list so future requests will get
	// newly created object
	notFound.remove(  protocolLookUpKey );
    }
}
