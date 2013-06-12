//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 19:18:17 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.TreeMap;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGlobalAssignment;
import org.tair.utilities.TextConverter;

/**
 * GlobalAssignmentCollection is a custom collection that stores all 
 * assignments for a Map Element as a collection of  
 * <code>TfcGlobalAssignment</code> objects. This class differs from  
 * GlobalAssignmentObjectCollection by containing smaller TfcGlobalAssignment  
 * class instead of GlobalAssignmentObject class.
 * 
 * <p>
 * GlobalAssignments are stored in a Map that references the Map name each
 * assignment is on.
 * 
 * <p>
 * Implements Serializable for writing ABRC stock catalog data to disk
 */

public class GlobalAssignmentCollection implements Serializable {

    private TreeMap globalAssignments;

    /**
     * Creates an empty instance of GlobalAssignmentCollection
     */

    public GlobalAssignmentCollection() {
        globalAssignments = new TreeMap();
    }

    /**
     * Creates an instance of GlobalAssignmentCollection that contains all
     * globalAssignments for submitted mapElementId
     * 
     * @param conn
     *            An active connection to the database
     * @param mapElementId
     *            Map element id to retrieve globalAssignments for
     * @exception SQLException
     *                in the case of an invalid operation or database error
     */

    public GlobalAssignmentCollection( DBconnection conn, 
				       Long mapElementId )
        throws SQLException {

        globalAssignments = new TreeMap();

        if ( mapElementId != null ) {
            populate( conn, mapElementId );
        }
    }

    /**
     * Creates an instance of GlobalAssignmentCollection that contains
     * GlobalAssignments for mapElementId that are onto the Map with submitted
     * mapName and on the submitted chromosome
     * 
     * @param conn
     *            An active connection to the database
     * @param mapElementId
     *            Map element id to retrieve globalAssignments for
     * @param mapName
     *            Map name to retrieve globalAssignments on
     * @param chromosome
     *            Chromosome to retrieve globalAssignments on
     * @exception SQLException
     *                in the case of an invalid operation or database error
     */

    public GlobalAssignmentCollection( DBconnection conn, 
				       Long mapElementId,
                                       String mapName, 
				       String chromosome ) 
        throws SQLException {

        globalAssignments = new TreeMap();

        if ( mapElementId != null ) {
            populate( conn, mapElementId, mapName, chromosome );
        }
    }

    /**
     * Retrieves all globalAssignments & map names globalAssignments are on
     * for map element id
     */
	
    private void populate( DBconnection conn, 
			   Long mapElementId )
        throws SQLException {

        String query = null;

        if ( mapElementId != null ) {
            query = "SELECT a.global_assignment_id, m.name " + 
                    "FROM GlobalAssignment a, Map m " + 
                    "WHERE a.map_id = m.map_id " + 
                    "AND a.is_obsolete = 'F' " + 
                    "AND a.map_element_id = " + mapElementId.toString();
            processResults( conn, query );
        }
    }

    private void processResults( DBconnection conn, 
				 String query )
        throws SQLException {

        Hashtable tmpAssign = null;
        Iterator iter = null;
        ResultSet results = null;
        Long id = null;
        String mapName = null;
        TfcGlobalAssignment tfcGlobalAssignment = null;

        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( tmpAssign == null ) {
                tmpAssign = new Hashtable();
            }
            tmpAssign.put( new Long( results.
                                     getLong( "global_assignment_id" ) ),
                           results.getString( "name" ) );
        }
        conn.releaseResources();

        if ( tmpAssign != null && !tmpAssign.isEmpty() ) {
            iter = tmpAssign.keySet().iterator();
            while ( iter.hasNext() ) {
                id = ( Long ) iter.next();
                mapName = ( String ) tmpAssign.get( id );
                tfcGlobalAssignment = new TfcGlobalAssignment( conn, id );
                globalAssignments.put( tfcGlobalAssignment, mapName );
            }
        }
    }

    /**
     * Retrieve all globalAssignments onto Map w/submitted name & chromosome
     */
	
    private void populate( DBconnection conn, 
			   Long mapElementId,
			   String mapName, 
			   String chromosome ) 
        throws SQLException {

        StringBuffer query = null;

        if ( mapElementId != null ) {
            query = new StringBuffer();
            query.append( "SELECT a.global_assignment_id, m.name " + 
                          "FROM GlobalAssignment a, Map m " + 
                          "WHERE a.map_id = m.map_id " + 
                          "AND a.is_obsolete = 'F' " );

            if ( mapName != null ) {
                query.append( "AND m.name LIKE " + 
                              TextConverter.dbQuote( mapName.toUpperCase() + 
                                                     "%" ) + 
                              " ESCAPE '\\\' " );
            }

            if ( chromosome != null ) {
                query.append( "AND m.chromosome LIKE " + 
                              TextConverter.dbQuote( "%" + chromosome + "%" ) +
                              " ESCAPE '\\\' " );
            }

            query.append( "AND a.map_element_id = " + 
                          mapElementId.toString() );
            processResults( conn, query.toString() );
        }
    }

    /**
     * Retrieves unique globalAssignments in collection. GlobalAssignments are
     * considered duplicate if they have the same mapId,
     * mapStartPosition, and mapEnd position as another globalAssignment in
     * collection.
     * 
     * @return Unique globalAssignments in collection as an
     *         <code>Iterator</code> of <code>TfcGlobalAssignment</code>
     *         objects, or <code>null</code> if no globalAssignments in
     *         collection.
     */
	
    public Iterator uniqueIterator() {

        // Store unique globalAssignments as key referencing custom value
        // composed of startposition + end position + map id -- if any 
        // globalAssignments share this value, they should be considered 
        // duplicates. Use TreeMap and keep TfcGlobalAssignments as keys to 
        // keep ordering of globalAssignments by start position ( done by 
        // implementing Comparable in TfcGlobalAssignment )
		
        TreeMap uniqueCollection = null;

        Iterator iter = null;
        Iterator returnIter = null;
        TfcGlobalAssignment tmpAssign = null;
        String uniqueValue = null;

        // iterate through collection & only store unique globalAssignments in
        // uniqueCollection.
		
        iter = iterator();

        if ( iter != null ) {
            uniqueCollection = new TreeMap();

            while ( iter.hasNext() ) {
                tmpAssign = ( TfcGlobalAssignment ) iter.next();

		// Exclude any globalAssignments w/out map info -- join to
		// Map in populate()
		// should have already excluded those, but just to be sure
				
                if ( tmpAssign.getStartPosition() != null
                    && tmpAssign.getEndPosition() != null
                    && tmpAssign.getMapId() != null ) {
                    uniqueValue = tmpAssign.getStartPosition().toString()
                        + tmpAssign.getEndPosition().toString()
                        + tmpAssign.getMapId().toString();

                    if ( !uniqueCollection.containsValue( uniqueValue ) ) {
                        uniqueCollection.put( tmpAssign, uniqueValue );
                    }
                }
            }

            returnIter = uniqueCollection.keySet().iterator();
        }

        return returnIter;
    }

    /**
     * Retrieves globalAssignments in collection. Each TfcGlobalAssignment can
     * be used as a key to retrieve the map name the globalAssignment was made
     * onto using the getMap(  TfcGlobalAssignment  ) method.
     * 
     * @return GlobalAssignments in collection as an <code>Iterator</code> of
     *         <code>TfcGlobalAssignment</code> objects, or <code>null</code>
     *         if no globalAssignments in collection
     */
	
    public Iterator iterator() {
        return ( globalAssignments != null && !globalAssignments.isEmpty() )
            ? globalAssignments.keySet().iterator()
            : null;
    }

    /**
     * Determines if collection has globalAssignments
     * 
     * @return <code>true</code> if no globalAssignments in collection,
     *         <code>false</code> if one or more globalAssignments are
     *         contained in collection
     */
	
    public boolean isEmpty() {
        return ( globalAssignments == null || globalAssignments.isEmpty() );
    }

    /**
     * Determines if submitted element is in collection
     * 
     * @return <code>true</code> if submitted globalAssignment is in this
     *         collection, or <code>false</code> if submitted
     *         globalAssignment is not found
     */
	
    public boolean contains( TfcGlobalAssignment globalAssignment ) {
        return ( globalAssignments != null && 
                 globalAssignments.containsKey( globalAssignment ) );
    }

    /**
     * Retrieves number of globalAssignments in collection
     * 
     * @return Number of elements in collection
     */
	
    public int size() {
        return ( globalAssignments != null ) ? globalAssignments.size() : 0;
    }

    /**
     * Adds submitted globalAssignment onto mapName to collection
     * 
     * @param globalAssignment
     *            GlobalAssignment to add
     * @param mapName
     *            Map globalAssignment is made onto.
     */
	
    public void put( TfcGlobalAssignment globalAssignment, String mapName ) {
        globalAssignments.put( globalAssignment, mapName );
    }

    /**
     * Retrieves the map name submitted globalAssignment was made onto,
     * assuming globalAssignment is stored in internal collection of
     * globalAssignments
     * 
     * @return Map name submitted globalAssignment is made onto, or
     *         <code>null</code> if no map name stored for globalAssignment,
     *         or if globalAssignment is not in internal collection of
     *         globalAssignments
     */
	
    public String getMap( TfcGlobalAssignment globalAssignment ) {

        String mapName = null;

        if ( globalAssignments != null && 
             globalAssignments.containsKey( globalAssignment ) ) {
            mapName = ( String ) globalAssignments.get( globalAssignment );
        }

        return mapName;
    }

    /**
     * For unit testing only
     */
	
    public void test() {

        System.out
            .println( "****** GlobalAssignmentCollection " + 
                      "content test ******" );

        Iterator iter = iterator();

        while ( iter.hasNext() ) {
            TfcGlobalAssignment globalAssignment = 
                ( TfcGlobalAssignment ) iter.next();
            String mapName = getMap( globalAssignment );
            System.out.println( "GlobalAssignment onto: " + mapName );
            globalAssignment.test();
        }

        System.out.println( "**** GlobalAssignmentCollection " +
                            "content test end ****" );
    }

    /**
     * For unit testing only
     */
	
    public static void main( String[] args ) {

        try {
            DBconnection conn = new DBconnection();
            Long testId = new Long( 41 );
            GlobalAssignmentCollection globalAssignment = 
                new GlobalAssignmentCollection( conn, testId );
            globalAssignment.test();
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}

