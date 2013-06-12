//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/** 
 * TransposonCollection is a custom collection class that stores
 * all transposons for a Map Element as a collection of <code>Locus</code>
 * objects.
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data
 */

public class TransposonCollection implements Serializable {
    private ArrayList transposons;
  

    /**
     * Creates an empty instance of TransposonCollection 
     */
    public TransposonCollection() {
        transposons = new ArrayList();
    }
    
    /**
     * Creates an instance of TransposonCollection that contains all transposons
     * associated to submitted map element id.  Transposons are stored
     * internally as <code>Transposon</code> objects
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TransposonCollection( DBconnection conn, Long map_element_id ) throws SQLException {
        transposons = new ArrayList();
        if ( map_element_id != null ) {
            populate( conn, map_element_id );
        }
    }

    /**
     * Creates an instance of TransposonCollection that is populated with transposons according
     * to specific rules for a submitted type value.  Valid values of type are:
     * <ul>
     *
     * <li>map_element - id should be map_element_id; this is identical to calling constructor
     *    (conn, id). Null entries for type will default to this population mode</li>
     *
     * <li>family - Retrieves all transposons that are associatd with this family_id</li>
     *
     * <li>locus - Retrieves all transposons that are associated with this locus_id</li>
     *
     * <li>gene - Retrieves all transposons that are associated with the loci associated to this
     * gene_id </li>
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve transposons for
     * @param type Population method/logic to use for retrieving transposons
     * @exception SQLException thrown if a database error occurs
     */
    public TransposonCollection( DBconnection conn, Long id, String type ) throws SQLException {
        transposons = new ArrayList();
        if ( id != null ) {
            if ( type == null || type.equals( "map_element" ) ) {
                populate( conn, id );
            } else if ( type.equals( "family" ) ) {
                populateByFamily( conn, id );
            }else if (type.equals("locus") ){
                populateByLocus( conn, id );
            }else if (type.equals("gene") ){
                populateByGene(conn, id);
            }
        }
    }


    /**
     * Retrieves transposon for submitted map element id and stores internally as Transposon
     *
     * @param conn An active connection to the database
     * @param map_element_id map element id to retrieve transposons for
     */
    private void populate( DBconnection conn, Long map_element_id ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;

        if ( map_element_id != null ) {
            query = 
                "SELECT t.transposon_id "+
                "FROM Transposon t " +
                "WHERE t.map_element_id = " + map_element_id.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "transposon_id" ) ) );
            }
            conn.releaseResources();

            if ( ids != null && !ids.isEmpty() ) {
                createTransposons( conn, ids );
            }
        }
    }

    /**
     * Specialized population mode that retrieves a set of transposons that
     * are associated to a particular familyID.
     * 
     * @param conn An active connection to the database
     * @param familyID fmaily id to retrieve transposons for
    */
    private void populateByFamily( DBconnection conn, Long familyID ) 
        throws SQLException {

        String query = null;
        ResultSet results = null;
        ArrayList ids = null;

        if ( familyID != null ) {
            query = 
                "SELECT t.transposon_id " +
                "FROM Transposon t " +
                "WHERE t.transposon_family_id = " + familyID.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "transposon_id" ) ) );
            }
            conn.releaseResources();
      
            if ( ids != null && !ids.isEmpty() ) {
                createTransposons( conn, ids );
            }
        }
    }
    
    /**
     * Specialized population mode that retrieves a set of transposons that
     * are associated to a particular locusID. For this particular set, we look
     * at the Locus_MapElement table to find the associations.
     *
     * @param conn An active connection to the database
     * @param locusID locus id to retrieve transposons for
     */
    private void populateByLocus( DBconnection conn, Long locusID )
    throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList ids = null;

        if (locusID != null){   
            query = "SELECT t.transposon_id " +
                "FROM MapElement_Locus ml, Transposon t " + 
                "WHERE ml.map_element_id = t.map_element_id " + 
                "AND ml.locus_id = " + locusID.toString();
            conn.setQuery(query);
            results = conn.getResultSet();
            while (results.next() ) {
                if (ids == null) {
                    ids = new ArrayList();
                }
                ids.add( new Long(results.getLong("transposon_id" ) ) );
            }
            conn.releaseResources();
            if (ids != null && !ids.isEmpty() ){
                createTransposons(conn, ids);
            }
        }
    }
    
    /**
     * Specialized population mode that retrieves a set of transposons that
     * are associated to a particular geneID.
     * 
     * @param conn An active connection to the database
     * @param geneID gene id to retrieve transposons for
    */
    private void populateByGene( DBconnection conn, Long geneID ) 
        throws SQLException {

        String query = null;
        ResultSet results = null;
        ArrayList ids = null;

        if ( geneID != null ) {
            query = 
                "SELECT DISTINCT t.transposon_id " +
                "From Transposon t, MapElement_Locus ma INNER JOIN " +  
                "(SELECT locus_id " + 
                "FROM MapElement_Locus ml, Gene g " +
                "WHERE ml.map_element_id = g.map_element_id " + 
                "AND g.gene_id = " + geneID.toString() + ") assoc_loci " + 
                "ON ma.locus_id = assoc_loci.locus_id " + 
                "WHERE t.map_element_id = ma.map_element_id ";
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "transposon_id" ) ) );
            }
            conn.releaseResources();
      
            if ( ids != null && !ids.isEmpty() ) {
                createTransposons( conn, ids );
            }
        }
    }
    
    /**
    * utility method that is used to create the transposon objects from list of ids
    *
    * @param DBconnection of an active databasec conection
    * @param list of all transposon ids to make transposon list for
    */
    private void createTransposons(DBconnection conn, List ids) throws SQLException { 
        Iterator iter = null;
        Transposon t = null;
        iter = ids.iterator();
        while (iter.hasNext() ){
            t = new Transposon(conn, (Long) iter.next() );
            add(t);
        }
    }

    
    /**
     * Determines if collection has transposons in it or not
     *
     * @return <code>true</code> if collection has no transposons in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { 
        return transposons.isEmpty(); 
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
        return transposons.size(); 
    }

    /**
     * Retrieve element object at supplied index
     *
     * @return element at supplied index, or <code>null</code> if no 
     *  element at supplied index
     */
    public Transposon elementAt( int index ) { 
        return (Transposon) transposons.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param transposon Element to add to collection
     */
    public void add( Transposon t ) { 
        transposons.add( t ); 
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param transposon Element to remove from collection
     */
    public void remove( Transposon t ) { 
        transposons.remove( t ); 
    }

    /**
     * Determines if supplied element is in collection or not
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( Transposon t ) { 
        return transposons.contains( t ); 
    }

    /**
     * Retrieve all elements in collection
     *
     * @return All transposons in collection as an <code>Iterator</code> of <code>Transposon</code>
     * objects, or <code>null</code> if no transposons in collection
     */
    public Iterator iterator() { 
        return !transposons.isEmpty() ? transposons.iterator() : null; 
    }



    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** LocusCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            Transposon t = null;
            while ( iter.hasNext() ) {
                t = (Transposon) iter.next();
                t.test();
            }
        }
        System.out.println( "**** LocusCollection content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1 );
            TransposonCollection ts = new TransposonCollection( conn, id );
            ts.test();

            System.out.println( "\nPopulating family mode..." );
            id = new Long( 274 );
            ts = new TransposonCollection( conn, id, "family" );
            ts.test();

            System.out.println( "\nPopulating locus mode..." );
            id = new Long( 30837 );
            ts = new TransposonCollection( conn, id, "locus" );
            ts.test();
        
            System.out.println( "\nPopulating gene mode..." );
            id = new Long( 32167 );
            ts = new TransposonCollection( conn, id, "gene" );
            ts.test();
        
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
