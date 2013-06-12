//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/12/08 17:11:09 $
//------------------------------------------------------------------------------

package org.tair.search.table;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;


/**
 * 
 * TableIDFactory is a utility class for translating user session ids created
 * by the application server into unique 8 character ids.  This translation is
 * done to facilitate the creation of user specific temp tables in the database.
 * These tables are created using the user's session id as a unique suffix; 
 * however, using the session id directly is problematic since Sybase database
 * objects cannot have names greater the 30 characters, and the length of 
 * session id keys can vary from vendor to vendor (for example, current 
 * versions of tomcat cannot use this method since their session ids are now
 * too long for use in this way).  TableIDFactory solves this problem by
 * generating and storing a unique alias key for each session id in use; these
 * keys should never be greater than 8 characters long (since we should never
 * have 100 million active sessions, this should allow for plenty of concurrent
 * sessions).
 *
 * <p>
 * Unique alternate keys are created by getting first getting the hash code
 * for the original session id (as String), then translating that into a
 * hex value. This should usually return a unique value, but to ensure 
 * uniqueness all alternate keys in use are stored locally so that if a 
 * duplicate is created, another value can be generated using Java's random
 * number generator.
 *
 * <p>
 * TableIDFactory is used by MasterTableInfo to create temp table names using
 * session ids;  session id translations are freed up by SearchSession, which
 * is bound to user's session for cleaning up database temp tables.
 */

public class TableIDFactory {
    
    // map to hold session ids and their translated versions; stored with
    // original session ID from application server as String key referencing
    // 8 character string value used in db temp table names
    private static Map idMap = new HashMap();

    // set of all translated ids currently in use -- translation of application
    // server session id to 8 char hash code should return uniqe ids, but
    // store here to do a manual check when first translating to make sure
    private static Set tableIDs = new HashSet();

    /**
     * Translates submitted session id into a shorter, unique alias id that can
     * be used for creating temp tables in db.
     *
     * @param sessionID Session id for a user as generated by application
     * server
     * @return Unique id that can be used instead of session id; these ids
     * should not be greater than 8 characters long.
     */
    public static String translateSessionID( String sessionID ) {

	if ( !idMap.containsKey( sessionID ) ) {
	    createUniqueTableID( sessionID );
	}

	String translatedID = (String) idMap.get( sessionID );

	return translatedID;
    }


    /**
     * Creates a unique, 8 character for submitted id and stores mapping
     * in idMap for use next time alternate id is requested for session
     * id.  Alternate id is also saved in tableIDs list to ensure that no
     * future mappings are created for it. Method is synchronized to protect
     * access to static collections.
     *
     * @param sessionID Session id for a user as generated by application
     * server
     */
    private static synchronized void createUniqueTableID( String sessionID ) {

	String uniqueID = getUniqueID( sessionID.hashCode() );

	tableIDs.add( uniqueID );
	
	idMap.put( sessionID, uniqueID );
    }

    /**
     * Translates submitted int value into a unique string. This method will
     * call itself recursively until it finds a unique number. Usually, 
     * submitted int value will be hash code of session id from the
     * application server, however if this does not yield a unique number,
     * a random int value is generated using the Java Random class.
     *
     * @param seed Int value to use for making a unique string value
     * @return Unique value that can be used for mapping a session id
     * to.
     */
    private static String getUniqueID( int seed ) {

	// translate hashcode to hex version (shouldn't be more than 8
	// chars)
	String uniqueID = Integer.toHexString( seed );

	// if hex string is already in use, use random number generator
	// to come up with a different int value and try again
	if ( tableIDs.contains( uniqueID ) ) {
	    
	    Random randomGenerator = new Random();
	    uniqueID = getUniqueID( randomGenerator.nextInt() );
	}

	// do some quick and dirty logging for a while until I'm convinced
	// this is working correctly and not generating keys that are too long
	if ( uniqueID.length() > 8 ) {
	    System.err.println( "TABLE ID: " + uniqueID + " > 8 chars!" );

	}
	return uniqueID;
    }


    /**
     * Removes mapping for submitted session id from collection of alternate
     * ids.  This method should be called when user's session expires, meaning
     * that the session id mapping is no longer needed.  This is done 
     * exclusively from the SearchSession object, which implements the
     * HttpSessionBindingListener interface so that it can respond to session
     * expiration events.
     *
     * <p>
     * Calling this method will remove the alternate key created for session
     * id from list of all keys currently in use, freeing it up for future
     * use if needed, and will remove mapping for session id.
     *
     * <p>
     * Method is synchronized to protect access to static internal collections
     */
    public static synchronized void expireID( String sessionID ) {
	
	// if sessionID not in map of translated ids, no need
	// to do anything
	if ( idMap.containsKey( sessionID ) ) {
	
	    // get unique id created for session id and remove
	    // it from set of unique ids in use
	    String uniqueID = (String) idMap.get( sessionID );
	    tableIDs.remove( uniqueID );

	    // remove mapping for this session id
	    idMap.remove( sessionID );
	}

    }


    /**
     * Main method implemented to allow an easy way to translate a
     * session id from the command line. Session id to translate must
     * be submitted as a command line argument; translated version will
     * be printed to STDOUT.
     */
    public static void main( String[] args ) {

	if ( args == null || args.length < 1 ) {
	    System.out.println( "\nUsage: org.tair.search.TableIDFactory " +
				"session_id\n" );
	    System.exit( 0 );

	}

	String sessionID = args[ 0 ];

	String translated =  TableIDFactory.translateSessionID( sessionID );

	System.out.println( "\nOriginal:\t" + sessionID );
	System.out.println( "Translated:\t" + translated + "\n");
    }

}
