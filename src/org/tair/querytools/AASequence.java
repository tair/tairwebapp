//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
// $Revision: 1.3 $
// $Date: 2004/09/02 21:01:35 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.SQLException;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAASequence;

/**
 * AASequence extends <code>TfcAASequence</code> to include detailed
 * information about an amino acid sequence.  In addition to all  data 
 * contained in the super class, AASequence contains a collection of
 * protein domain matches associated with the sequence as a collection
 * of <code>DomainMatch</code> objects.  AASequence provides constructors
 * that give client code the option of retrieving full sequence text. This
 * is done so that sequence text is only retrieved when absolutely needed
 * for display, avoiding overhead of  unneccessarily getting large sequence
 * for every instance
 */

public class AASequence extends TfcAASequence{

    // Protein domain matches for sequence - stored as DomainMatch objects
    private DomainMatchCollection domainMatches;


    /**
     * Creates an empty instance of AASequence
     */
    public AASequence() { 
	super();
    }


    /**
     * Creates an instance of AASequence that contains all data for the 
     * submitted tair object id except for the AA sequence text itself. This 
     * version of the constructor should be used when information is needed 
     * about the sequence, but the actual sequence is not required.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @throws SQLException thrown if a database error occurs, or if no record
     * found with supplied id
     */
    public AASequence( DBconnection conn, Long tair_object_id ) 
	throws SQLException {

	super( conn, tair_object_id, false ); // don't get sequence text
	if ( get_aa_sequence_id() != null ) {
	    populate( conn, get_aa_sequence_id() );
	}      
    }


    /**
     * Creates an instance of AASequence that contains all data for the 
     * submitted tair object id, optionally including the AA sequence text 
     * itself.
     *
     * @param conn An active conn to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @param getSequence If <code>true</code>, full sequence will be retrieved;
     * if <code>false</code> sequence will not be retrieved
     * @throws SQLException thrown if a database error occurs, or if no record 
     * found with supplied id
     */
    public AASequence( DBconnection conn, 
		       Long tair_object_id, 
		       boolean getSequence ) 
	throws SQLException {

	super( conn, tair_object_id, getSequence );
	if ( get_aa_sequence_id() != null ) {
	    populate( conn, get_aa_sequence_id() );
	}
    }


    /**
     * Populate member variables -- create sequence w/getSequence flag from 
     * constructor to determine whether full sequence text should be retrieved
     */
    private void populate( DBconnection conn, Long aa_sequence_id ) 
	throws SQLException {

	domainMatches = 
	    new DomainMatchCollection( conn, aa_sequence_id, "sequence" );
    }


    /**
     * Retrieves all domain matches associated with AA sequence
     *
     * @return Domain matches for sequence as an <code>Iterator</code>
     * of <code>DomainMatch</code> objects, or <code>null</code> if
     * no domain matches for sequence
     */
    public Iterator getDomainMatches() {
	return hasDomainMatches() ? domainMatches.iterator() : null;
    }


    /**
     * Determines if aa sequence has associated domain matches
     *
     * @return <code>true</code> if aa sequence has associated domain matches,
     * <code>false</code> if no domain matches associated to aa sequence
     */
    public boolean hasDomainMatches() {
	return ( domainMatches != null && !domainMatches.isEmpty() );
    }

    /**
     * For unit testing only
     */
    public void test() {
	super.test();

	if ( domainMatches != null ) {
	    domainMatches.test();
	}
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 3986232 );
	    AASequence sequence = new AASequence( conn, id );
	    sequence.test();

	} catch ( Exception e) {
	    e.printStackTrace();
	}
    }

}
