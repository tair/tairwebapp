/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * PolymorphismLiteCollection is a custom collection that stores polymorphisms
 * related to a given element as <code>PolymorphismLite</code> objects. 
 * PolymorphismLite is a lightweight object that gives bare minimum information
 * about a polymorphism; this is useful for displaying associated polymorphisms in search
 * results (as in Germplasm searches) where more info is not needed.
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data
 */


public class PolymorphismLiteCollection implements Serializable {
    // store polymorphisms in TreeMap so we can sort them by polymorphism name using
    // TreeMap's natural ordering of keys
    private TreeMap polymorphisms; 

    /**
     * Creates an empty instance of PolymorphismLiteCollection
     */
    public PolymorphismLiteCollection() {
        this.polymorphisms = new TreeMap();
    }

    /**
     * Creates an instance of PolymorphismLiteCollection that contains
     * polymorphism models associated to submitted id, where object type of
     * id and population method is specified by type.  Valid values of
     * type are:
     * <ul>
     * <li>germplasm - id must be germplasm_id.  Each polymorphism object 
     * created will automatically have its collection of associated loci populated</li>
     * </ul>
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type of id, or population mode to use for retrieving
     * associated polymorphisms
     * @exception SQLException in the case of an invalid operation or database error
     */
    public PolymorphismLiteCollection( DBconnection conn, Long id, String type ) throws SQLException {
        this.polymorphisms = new TreeMap();
        if ( id != null && type != null ) {
            if ( type.equals( "germplasm" ) ) {
                populateGermplasm( conn, id );
            }
        }
    }

    // retrieve polymorphism ids directly associated to germplasm
    private void populateGermplasm( DBconnection conn, Long id ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;
        Long polymorphismID = null;
    
        query =
            "SELECT p.polymorphism_id " +
            "FROM Germplasm_MapElement g, Polymorphism p " +
            "WHERE g.map_element_id = p.map_element_id " +
            "AND p.is_obsolete = 'F' " +
            "AND g.germplasm_id = " + id.toString();
        conn.setQuery( query );
        results = conn.getResultSet();
        while( results.next() ){
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "polymorphism_id" ) ) );
        }
        conn.releaseResources();
    
        if ( ids != null && !ids.isEmpty() ) {
            createPolymorphisms( conn, ids );
        }

        // get loci for all polymorphisms when creating for display on germplasm search results
        // as well as in ABRC stock catalog
        populateLocus( conn );
    }
  
    private void createPolymorphisms( DBconnection conn, ArrayList ids ) throws SQLException {
        Iterator iter = null;
        PolymorphismLite polymorphism = null;

        iter = ids.iterator();
        while ( iter.hasNext() ) {
            polymorphism = new PolymorphismLite( conn, (Long) iter.next() );
            add( polymorphism );
        }
    }

    /**
     * Populates collection of loci for each polymorphism in collection. This population
     * is done explicitly here to avoid retrieving data when it's not needed for display
     *
     * @param conn An active connection to the database
     */
    public void populateLocus( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        PolymorphismLite poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismLite) iter.next();
                poly.populateLocus( conn );
            }
        }
    }


    /**
     * Populates collection of genes for each polymorphism in collection. This population
     * is done explicitly here to avoid retrieving data when it's not needed for display
     *
     * @param conn An active connection to the database
     */
    public void populateGenes( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        PolymorphismLite poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismLite) iter.next();
                poly.populateGenes( conn );
            }
        }
    }

    /**
     * Retrieves gene aliases for genes associated to polymorphisms in collection. 
     * Gene aliases will only be retrieved if their alias type matches any of
     * submitted alias types. This method must be called after populateGenes is 
     * called to initialize gene collection.
     *
     * @param conn An active connection to the database
     * @param aliasTypes Alias types to retrieve for genes
     */
    public void populateGeneAliases( DBconnection conn, String[] aliasTypes ) throws SQLException {
        Iterator iter = null;
        PolymorphismLite poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismLite) iter.next();
                poly.populateGeneAliases( conn, aliasTypes );
            }
        }
    }


    /**
     * Sorts gene aliases for each polymorphism in collection using the submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting gene aliases
     */
    public void sortGeneAliases( Comparator comparator ) {
        Iterator iter = null;
        PolymorphismLite poly = null;
        
        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismLite) iter.next();
                poly.sortGeneAliases( comparator );
            }
        }
    }


    /**
     * Retrieves symbols for genes associated to polymorphisms in collection. 
     * This method must be called after populateGenes is called to initialize
     * gene collection.
     *
     * @param conn An active connection to the database
     */
    public void populateSymbols( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        PolymorphismLite poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismLite) iter.next();
                poly.populateSymbols( conn );
            }
        }
    }


    /**
     * Sorts symbols for each polymorphism in collection using the submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting symbols
     */
    public void sortSymbols( Comparator comparator ) {
        Iterator iter = null;
        PolymorphismLite poly = null;
        
        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismLite) iter.next();
                poly.sortSymbols( comparator );
            }
        }
    }


    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return polymorphisms.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return polymorphisms.values().size(); }


    /**
     * Adds supplied element to collection
     * 
     * @param polymorphism Element to add to collection
     */
    public void add( PolymorphismLite polymorphism ) { polymorphisms.put( polymorphism.getName(), polymorphism ); }


    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param polymorphism Element to remove from collection
     */
    public void remove( PolymorphismLite polymorphism ) { polymorphisms.remove( polymorphism.getName() ); }

    /**
     * Determines if supplied element is in collection
     *
     * @param polymorphism Element to check
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( PolymorphismLite polymorphism ) { return polymorphisms.containsKey( polymorphism.getName() ); }

    /**
     * Retrieves all elements in collection
     *
     * @return All elements in collection as an <code>Iterator</code> of <code>PolymorphismLite</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() { return ( !polymorphisms.isEmpty() ) ? polymorphisms.values().iterator() : null; }




    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** PolymorphismLiteCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            PolymorphismLite polymorphism = null;
            while ( iter.hasNext() ) {
                polymorphism = (PolymorphismLite) iter.next();
                polymorphism.test();
            }
        }
        System.out.println( "**** PolymorphismLiteCollection content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            System.out.println( "populating using genetic marker id..." );
            Long id = new Long( 632 );
            PolymorphismLiteCollection polymorphisms = new PolymorphismLiteCollection( conn, id, "marker" );
	    polymorphisms.populateGenes(conn);
	    polymorphisms.populateSymbols(conn);
            polymorphisms.test();


            System.out.println( "populating using germplasm id..." );
            id = new Long( 500230994 );
            polymorphisms = new PolymorphismLiteCollection( conn, id, "germplasm" );
	    polymorphisms.populateGenes(conn);
	    polymorphisms.populateSymbols(conn);
            polymorphisms.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
