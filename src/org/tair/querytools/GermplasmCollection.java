//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2003/09/04 15:43:05 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * GermplasmCollection is a custom collection that retrieves and stores
 * germplasms related to a given object id.  Germplasm records are stored
 * as a collection of <code>Germplasm</code> objects
 */


public class GermplasmCollection {
    private ArrayList germplasms;

    /**
     * Creates an empty instance of GermplasmCollection
     */
    public GermplasmCollection() {
        this.germplasms = new ArrayList();
    }

    /**
     * Creates an instance of GermplasmCollection that contains
     * germplasms associated to submitted id.  Type of id and
     * method of joining to id is determined by submitted type
     * parameter.  Current valid values of type are:
     * <ul>
     * <li>species_variant - id should be species_variant_id;</li>
     * <li>stock - id should be stock_id</li>
     * <li>poly - id should be reference polymorphism's map_element_id</li>
     * </ul>
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Population method to find associated germplasms by
     * @exception SQLException in the case of an invalid operation or database error
     */
    public GermplasmCollection( DBconnection conn, Long id, String type ) throws SQLException {
        this.germplasms = new ArrayList();
        if ( id != null && type != null ) {
            populate( conn, id, type );
        }
    }


    // retrieve germplasm tair object ids using method specified by type; create
    // TfcGermplasm objects & save
    private void populate( DBconnection conn, Long id, String type ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;
        Iterator iter = null;
        Germplasm germplasm = null;

    
        if ( type.equals( "species_variant" ) ) {
            query = 
                "SELECT tair_object_id "+
                "FROM Germplasm " +
                "WHERE is_obsolete = 'F' " +
                "AND species_variant_id = " + id.toString();

        } else if ( type.equals( "stock" ) ) {
            query = 
                "SELECT g.tair_object_id " +
                "FROM TairObject_Stock ts, Germplasm g " +
                "WHERE ts.tair_object_id = g.tair_object_id " +
                "AND g.is_obsolete = 'F' " +
                "AND ts.stock_id = " + id.toString();
        } else if ( type.equals( "poly" ) ) {
            query = 
                "SELECT g.tair_object_id " +
                "FROM Germplasm_MapElement gme, Germplasm g " +
                "WHERE gme.germplasm_id = g.germplasm_id " +
                "AND g.is_obsolete = 'F' " +
                "AND gme.map_element_id = " + id.toString();
        }

        if ( query != null ) {
            conn.setQuery( query );
            results = conn.getResultSet();
            while( results.next() ){
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "tair_object_id" ) ) );
            }
            conn.releaseResources();
      
            if ( ids != null && !ids.isEmpty() ) {
                iter = ids.iterator();
                while ( iter.hasNext() ) {
                    germplasm = new Germplasm( conn, (Long) iter.next() );
                    add( germplasm );
                }
            }
        }
    }



    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return germplasms.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return germplasms.size(); }

    /**
     * Retrieves element at supplied index as a <code>Germplasm</code> object
     *
     * @return Element at supplied index, or <code>null</code> if no element at supplied index
     */
    public Germplasm get( int index ) { return (Germplasm) germplasms.get( index ); }


    /**
     * Adds supplied element to collection
     * 
     * @param germplasm Element to add to collection
     */
    public void add( Germplasm germplasm ) { germplasms.add( germplasm ); }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param germplasm Element to remove from collection
     */
    public void remove( Germplasm germplasm ) { germplasms.remove( germplasm ); }

    /**
     * Determines if supplied element is in collection
     *
     * @param germplasm Element to check
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( Germplasm germplasm ) { return germplasms.contains( germplasm ); }

    /**
     * Retrieves all elements in collection
     *
     * @return All elements in collection as an <code>Iterator</code> of <code>Germplasm</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() { return ( !germplasms.isEmpty() ) ? germplasms.iterator() : null; }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be sorted by
     */
    public void sort( Comparator comparator ) {
        Collections.sort( germplasms, comparator );
    }


    /** 
     * Populate polymorphisms for those germplasms in this collection.
     * Polymorphism data objects will automatically be created to 
     * contain associated locus data for each polymorphism
     *
     * @param conn An active connection to the database
     */
    public void populatePolymorphisms( DBconnection conn ) throws SQLException{
        if ( !isEmpty() ) { 
            Germplasm germplasm = null; 
            Iterator  iter = iterator();
            while ( iter.hasNext() ) {
                germplasm = (Germplasm) iter.next();
                germplasm.populatePolymorphisms(conn );
            }
        }
    } 

    /** 
     * Populate stocks for those germplasms in this collection
     *
     * @param conn An active connection to the database
     */
    public void populateStocks( DBconnection conn ) throws SQLException{
        if ( !isEmpty() ) { 
            Germplasm germplasm = null; 
            Iterator  iter = iterator();
            while ( iter.hasNext() ) {
                germplasm = (Germplasm) iter.next();
                germplasm.populateStocks(conn );
            }
        }
    } 

    /**
     * Populates taxon data for germplasms in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateTaxons( DBconnection conn ) throws SQLException {
        if ( !isEmpty() ) { 
            Germplasm germplasm = null; 
            Iterator  iter = iterator();
            while ( iter.hasNext() ) {
                germplasm = (Germplasm) iter.next();
                germplasm.populateTaxon(conn );
            }
        }
    } 


    /**
     * Populates species variant data for backgrounds directly associated to
     * germplasms in collection (not through Pedigree).
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateSpeciesVariants( DBconnection conn ) throws SQLException {
        if ( !isEmpty() ) { 
            Germplasm germplasm = null; 
            Iterator  iter = iterator();
            while ( iter.hasNext() ) {
                germplasm = (Germplasm) iter.next();
                germplasm.populateSpeciesVariant(conn );
            }
        }
    } 

  
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GermplasmCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            Germplasm germplasm = null;
            while ( iter.hasNext() ) {
                germplasm = (Germplasm) iter.next();
                germplasm.test();
            }
        }
        System.out.println( "**** GermplasmCollection content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();

            System.out.println( "Creating collection for species variant..." );
            Long id = new Long( 14 );
            GermplasmCollection germplasms = new GermplasmCollection( conn, id, "species_variant" );
            germplasms.test();

            System.out.println( "Creating collection for ref polymorphism..." );
            id = new Long( 2607978 );
            germplasms = new GermplasmCollection( conn, id , "poly" );
      
            germplasms.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
  








