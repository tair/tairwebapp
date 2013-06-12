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
 * GeneModelLiteCollection is a custom collection that stores genes
 * related to a given element as <code>GeneModelLite</code> objects. 
 * GeneModelLite is a lightweight object that gives bare minimum information
 * about a gene; this is useful for displaying associated genes in search
 * results (as in AASequence and Germplasm searchers) where more info
 * is not needed.
 *
 * <p>
 * Implements Serializable so GeneModelLite objects can be written as
 * part of serialized stock catalog data
 */


public class GeneModelLiteCollection implements Serializable {

    // store genes in TreeMap so we can sort them by gene name using
    // TreeMap's natural ordering of keys
    private TreeMap genes; 

    /**
     * Creates an empty instance of GeneModelLiteCollection
     */
    public GeneModelLiteCollection() {
        this.genes = new TreeMap();
    }

    /**
     * Creates an instance of GeneModelLiteCollection that contains
     * gene models associated to submitted id, where object type of
     * id and population method is specified by type.  Valid values of
     * type are:
     * <ul>
     * <li>aa_sequence - id must be aa_sequence_id</li>
     * <li>germplasm - id must germplasm_id; retrieves genes associated
     *   to germplasm both through clone and germplasm</li>
     * <li>map_element - id must must be map_element_id;  genes will be returned
     * if they are associated to map_element_id in Gene_MapElement table
     * </ul>
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type of id, or population mode to use for retrieving
     * associated genes
     * @exception SQLException in the case of an invalid operation or database error
     */
    public GeneModelLiteCollection( DBconnection conn, Long id, String type ) throws SQLException {
        this.genes = new TreeMap();
        if ( id != null && type != null ) {
            if ( type.equals( "aa_sequence" ) ) {
                populateAASequence( conn, id );

            } else if ( type.equals( "germplasm" ) ) {
                populateGermplasm( conn, id );
                
            } else if ( type.equals( "map_element" ) ) {
                populateMapElement( conn, id );
            }
        }
    }

  
    /**
     * Retrieve gene ids associated to aa sequence id and create GeneModelLite
     * objects for each
     */
    private void populateAASequence( DBconnection conn, Long id ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;

        query = 
            "SELECT g.gene_id " +
            "FROM Gene_AASequence ga, Gene g " +
            "WHERE ga.gene_id = g.gene_id " +
            "AND g.is_obsolete = 'F' " +
            "AND ga.aa_sequence_id = " + id.toString();
    
        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "gene_id" ) ) );
        }
        conn.releaseResources();

        if ( ids != null && !ids.isEmpty() ) {
            createGenes( conn, ids, true ); //create genes w/collection of loci
        }
    }

    /**
     * Retrieve gene ids indirectly asssociated to germplasm through clone and polymorphism -
     * use work table created for easier searching to speed up selection
     */
    private void populateGermplasm( DBconnection conn, Long id ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;
   
        query = 
            "SELECT gene_id " +
            "FROM Germplasm_Gene_wrk " +
            "WHERE germplasm_id = " + id.toString();

        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ){
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "gene_id" ) ) );
        }
        conn.releaseResources();

        if ( ids != null && !ids.isEmpty() ) {
            createGenes( conn, ids, false ); // create w/out loci
        }
    }


    /**
     * Retrieves gene ids directly associated to map_element_id through
     * Gene_MapElement table and creates GeneModelLite objects for each
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    private void populateMapElement( DBconnection conn, Long map_element_id ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;

        query = 
            "SELECT gene_id " +
            "FROM Gene_MapElement " +
            "WHERE map_element_id = " + map_element_id.toString();

        conn.setQuery( query );
        results = conn.getResultSet();
        while( results.next() ){
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "gene_id" ) ) );
        }
        conn.releaseResources();

        if ( ids != null && !ids.isEmpty() ) {
            createGenes( conn, ids, false ); // create w/out loci
        }
    }



    private void createGenes( DBconnection conn, ArrayList ids, boolean getLocus ) throws SQLException {
        Iterator iter = null;
        GeneModelLite gene = null;

        iter = ids.iterator();
        while ( iter.hasNext() ) {
            gene = new GeneModelLite( conn, (Long) iter.next() );
            if ( getLocus ) {
                gene.populateLocus( conn, "with_symbols" );
            }
            add( gene );
        }
    }

    /**
     * Populates gene aliases for each gene in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateGeneAliases( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        GeneModelLite gene = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModelLite) iter.next();
                gene.populateGeneAliases( conn );
            }
        }
    }

    /**
     * Populates gene aliases with submitted alias types for each
     * gene in collection
     *
     * @param conn An active connection to the database
     * @param aliasTypes Alias types to retrieve
     * @throws SQLException if a database error occurs
     */
    public void populateGeneAliases( DBconnection conn, String[] aliasTypes ) throws SQLException {
        Iterator iter = null;
        GeneModelLite gene = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModelLite) iter.next();
                gene.populateGeneAliases( conn, aliasTypes );
            }
        }
    }

    /**
     * Sorts gene aliases for each gene in collection using the submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting gene aliases
     */
    public void sortGeneAliases( Comparator comparator ) {
        Iterator iter = null;
        GeneModelLite gene = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModelLite) iter.next();
                gene.sortGeneAliases( comparator );
            }
        }
    }


    /**
     * Populates symbols for each gene in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateSymbols( DBconnection conn  ) throws SQLException {
        Iterator iter = null;
        GeneModelLite gene = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModelLite) iter.next();
                gene.populateSymbols( conn );
            }
        }
    }

    /**
     * Sort symbols for each gene in collection using the submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting symbols
     */
    public void sortSymbols( Comparator comparator ) {
        Iterator iter = null;
        GeneModelLite gene = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModelLite) iter.next();
                gene.sortSymbols( comparator );
            }
        }
    }



    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return genes.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return genes.values().size(); }


    /**
     * Adds supplied element to collection
     * 
     * @param gene Element to add to collection
     */
    public void add( GeneModelLite gene ) { genes.put( gene.getName(), gene ); }


    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param gene Element to remove from collection
     */
    public void remove( GeneModelLite gene ) { genes.remove( gene.getName() ); }

    /**
     * Determines if supplied element is in collection
     *
     * @param gene Element to check
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( GeneModelLite gene ) { return genes.containsKey( gene.getName() ); }

    /**
     * Retrieves all elements in collection
     *
     * @return All elements in collection as an <code>Iterator</code> of <code>GeneModelLite</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() { return ( !genes.isEmpty() ) ? genes.values().iterator() : null; }




    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GeneModelLiteCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            GeneModelLite gene = null;
            while ( iter.hasNext() ) {
                gene = (GeneModelLite) iter.next();
                gene.test();
            }
        }
        System.out.println( "**** GeneModelLiteCollection content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            System.out.println( "populating using aa sequence id..." );
            Long id = new Long( 10);
            GeneModelLiteCollection genes = new GeneModelLiteCollection( conn, id, "aa_sequence" );
	    genes.populateSymbols(conn);
            genes.test();


            System.out.println( "populating using germplasm id..." );
            id = new Long( 1165);
            genes = new GeneModelLiteCollection( conn, id, "germplasm" );
	    genes.populateSymbols(conn);
            genes.test();

            System.out.println( "populating using germplasm id through clone only..." );
            id = new Long( 500211945 );
            genes = new GeneModelLiteCollection( conn, id, "germplasm_clone" );
	    genes.populateSymbols(conn);
            genes.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
  








