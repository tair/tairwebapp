//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/09/02 22:24:59 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Iterator;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;


/** 
 * DomainMatchCollection is a custom collection that stores all protein domain
 * match information for either an AA sequence, or for a protein domain.  Domain
 * matches are stored as a collection of <code>DomainMatch</code> objects
 */

public class DomainMatchCollection {
  private static final Logger logger = Logger.getLogger(DomainMatchCollection.class);
    private ArrayList matches;


    /**
     * Creates an empty instance of DomainMatchCollection
     */
    public DomainMatchCollection() {
	matches = new ArrayList();
    }

    
    /**
     * Creates an instance of DomainMatchCollection that stores all matches 
     * associated to a given object, where type of object and how matches are 
     * retrieved are determined by type. Possible values of type are:
     *
     * <ul>
     * <li>sequence - id should be aa_sequence_id</li>
     * <li>domain - id should be protein_domain_id</li>
     * </ul>
     *
     * Matches are stored as  <code>DomainMatch</code> objects
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type to retrieve matches for
     * @throws SQLException if a database error occurs
     */
    public DomainMatchCollection( DBconnection conn, Long id, String type ) 
	throws SQLException {

	matches = new ArrayList();

	populate( conn, id, type );
    }
    

    /**
     * Retrieve evidence ids for domain matches and create DomainMatch objects
     * for each.
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type to retrieve matches for
     * @throws SQLException when there is a database problem
     */
  private void populate(DBconnection conn, Long id, String type)
      throws SQLException {

    ArrayList<Long> ids = null;
    String query = null;

    if (type.equalsIgnoreCase("domain")) {
      logger.debug("Querying protein domain id: " + id);
      query =
        "SELECT evidence_id " + "FROM DomainMatch "
            + "WHERE protein_domain_id = ?";

    } else if (type.equalsIgnoreCase("sequence")) {
      logger.debug("Querying protein sequence id: " + id);
      query =
        "SELECT evidence_id " + "FROM DomainMatch "
            + "WHERE aa_sequence_id = ?";
    }

    logger.debug("Query: " + query);
    conn.setQuery(query);
    conn.setQueryVariable(id);

    ResultSet results = conn.getResultSet();
    while (results.next()) {
      if (ids == null) {
        ids = new ArrayList<Long>();
      }
      long queriedId = results.getLong("evidence_id");
      logger.debug("Fetchng id " + queriedId);
      ids.add(new Long(queriedId));
    }
    
    // Release resources before passing to Domain constructor.
    conn.releaseResources();

    if (ids != null) {
      for (Long thisId : ids) {
        logger.debug("Adding domain to list: " + thisId);
        DomainMatch domain;
        try {
          domain = new DomainMatch(conn, thisId);
          addElement(domain);
        } catch (SQLException e) {
          // Log and ignore: there is some kind of memory bug that is causing
          // the loop to get spurious ids from somewhere. Just exit the loop.
          // TODO Figure out why this bug happens on the real server but not my local system!
          logger.error("Domain Match lookup error in DomainMatchCollection: " + e.getMessage(), e);
          break;
        }
      }
    }
  }

    /**
     * Determines if collection has elements in it.
     *
     * @return <code>true</code> if collection has no matches in it; 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return matches.isEmpty(); 
    }

    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return matches.size(); 
    }

    /**
     * Retrieves element at requested index
     *
     * @return DomainMatch at supplied index, or <code>null</code> if no 
     * element at supplied index
     */
    public DomainMatch elementAt( int index ) { 
	return (DomainMatch) matches.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param match DomainMatch to add to collection
     */
    public void addElement( DomainMatch match ) { 
	matches.add( match );
    }

    /**
     * Removes supplied element from collection. 
     *
     * @param match DomainMatch to remove from collection
     */
    public void removeElement( DomainMatch match ) { 
	matches.remove( match );
    }

    /**
     * Determines if submitted elements is in collection
     *
     * @return <code>true</code> if supplied element is in collection;
     * <code>false</code>
     * if element is not found
     */
    public boolean contains( DomainMatch match ) { 
	return matches.contains( match ); 
    }

    /**
     * Retrieves all elements in collection
     *
     * @return All matches in collection as an <code>Iterator</code> of 
     * <code>DomainMatch</code> objects, or <code>null</code> if no matches
     * in collection
     */
    public Iterator iterator() { 
	return !matches.isEmpty() ? matches.iterator() : null; 
    }


 
    /**
     * For unit testing only
     */

    public void test() {
	System.out.println( "****** DomainMatchCollection content test ******" );
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    DomainMatch match = null;

	    while ( iter.hasNext() ) {
		match = (DomainMatch) iter.next();
		match.test();
	    }
	}
	System.out.println( "**** DomainMatchCollection content test end ****" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();

	    System.out.println( "Creating from protein domain..." );
	    Long id = new Long( 6947 );
	    DomainMatchCollection matches = new DomainMatchCollection( conn, id, "domain" );
	    matches.test();

	    System.out.println( "\nCreating from aa sequence..." );
	    id = new Long( 103317 );
	    matches = new DomainMatchCollection( conn, id, "sequence" );
	    matches.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
      
    }
}
  








