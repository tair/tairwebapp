//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2004/05/10 17:08:40 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * PolymorphismLite presents minimal information on a polymorphism record;
 * this class is used for display on search results pages, where a listing 
 * of associated polymorphisms is shown for each search result. This class
 * is used to avoid the overhead of more heavyweight objects such as 
 * org.tair.querytools.PolymorphismObject which contains many attributes that 
 * aren't needed.
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data
 */


public class PolymorphismLite implements Serializable {

    private String name;
    private String originalName;
    private Long tairObjectID;
    private Long mapElementID;
    private Long polymorphismID;
    private Long refPolymorphismID;

    // loci associated to polymorphism - stored as TfcLocus objects --
    // collection must be populated explicitly through populateLocus() method
    private LocusCollection loci;


    // genes associated to polymorphism - stored as GeneModelLite objects --
    // collection must be populated explicitly through populateGenes method
    private GeneModelLiteCollection genes;


    /**
     * Creates an instance of PolymorphismLite that reflects the data referenced
     * by submitted polymorphismID
     *
     * @param conn An active connection to the database
     * @param polymorphismID Polymorphism id to retrieve data for
     * @exception SQLException thrown if a database error occurs, or if no
     * polymorphism found with submitted id
     */
    public PolymorphismLite( DBconnection conn, Long polymorphismID ) 
	throws SQLException {
	populate( conn, polymorphismID );
    }

    /** 
     * Get basic info from Polymorphism table
     */
    private void populate( DBconnection conn, Long polymorphismID ) 
	throws SQLException {

        boolean found = false;
    
        String query = 
            "SELECT p.polymorphism_id, " +
            "p.ref_polymorphism_id, " +
            "p.map_element_id, " +
            "p.tair_object_id, " +
            "p.name, " +
            "p.original_name " +
            "FROM Polymorphism p " +
            "WHERE p.polymorphism_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( polymorphismID );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            found = true;
            setTairObjectID( new Long( results.getLong( "tair_object_id" ) ) );
            setMapElementID( new Long( results.getLong( "map_element_id" ) ) );
            setPolymorphismID( new Long( 
					results.getLong( "polymorphism_id" ) ) );
            setRefPolymorphismID( new Long( 
					   results.getLong( "ref_polymorphism_id" ) ) );

            setName( results.getString( "name" ) );
            setOriginalName( results.getString( "original_name" ) );
        }
        conn.releaseResources();

        if ( !found ) {
            throw new RecordNotFoundException( "No polymorphism found with " +
					       "polymorphism id: " + 
					       polymorphismID );
        }
    }

    public String getName() {
	return name; 
    }

    public String getOriginalName() {
	return originalName;
    }

    public Long getTairObjectID() {
	return tairObjectID;
    }

    public Long getMapElementID() {
	return mapElementID;
    }

    public Long getPolymorphismID() { 
	return polymorphismID;
    }

    public Long getRefPolymorphismID() {
	return refPolymorphismID;
    }

    public void setName( String name ) {
	this.name = name;
    }

    public void setOriginalName( String name ) { 
	this.originalName = name; 
    }

    public void setTairObjectID( Long id ) { 
	this.tairObjectID = id; 
    }

    public void setMapElementID( Long id ) { 
	this.mapElementID = id;
    }

    public void setPolymorphismID( Long id ) { 
	this.polymorphismID = id;
    }

    public void setRefPolymorphismID( Long id ) {
	this.refPolymorphismID = id;
    }

    /**
     * Populates polymorphism's collection of loci.  This is done separately
     * from constructor so that loci are only retrieved when absolutely needed
     * for display
     *
     * @param conn An active connection to the database
     */
    public void populateLocus( DBconnection conn ) throws SQLException {
        loci = new LocusCollection( conn, getMapElementID() );
    }
  

    /**
     * Determines if polymorphism has associated loci or not
     *
     * @return <code>true</code> if polymorphism has associated loci, or
     * <code>false</code> if no loci associated to polymorphism.
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves loci for polymorphism
     *
     * @return Loci for polymorphism as an <code>Iterator</code> of
     * <code>TfcLocus</code> objects, or <code>null</code> if no loci
     * associated to polymorphism
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
    }



    /**
     * Populates polymorphism's collection of genes.  This is done separately
     * from constructor so that genes are only retrieved when absolutely needed
     * for display
     *
     * @param conn An active connection to the database
     */
    public void populateGenes( DBconnection conn ) throws SQLException {
        genes = new GeneModelLiteCollection( conn, 
					     getMapElementID(), 
					     "map_element" );
    }
  

    /**
     * Determines if polymorphism has associated genes or not
     *
     * @return <code>true</code> if polymorphism has associated genes, or
     * <code>false</code> if no genes associated to polymorphism.
     */
    public boolean hasGenes() {
        return ( genes != null && !genes.isEmpty() );
    }

    /**
     * Retrieves genes for polymorphism
     *
     * @return Genes for polymorphism as an <code>Iterator</code> of
     * <code>TfcGenes</code> objects, or <code>null</code> if no genes
     * associated to polymorphism
     */
    public Iterator getGenes() {
        return ( hasGenes() ) ? genes.iterator() : null;
    }


    /**
     * Retrieves gene aliases for genes associated to polymorphism. Gene 
     * aliases will only be retrieved if their alias type matches any of 
     * submitted alias types. This method must be called after populateGenes 
     * is called to initialize gene collection.
     *
     * @param conn An active connection to the database
     * @param aliasTypes Alias types to retrieve for genes
     */
    public void populateGeneAliases( DBconnection conn, String[] aliasTypes )
	throws SQLException {

        genes.populateGeneAliases( conn, aliasTypes );
    }

    /**
     * Sorts gene aliases for genes associated to polymorphism using the 
     * submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting gene aliases
     */
    public void sortGeneAliases( Comparator comparator ) {
        genes.sortGeneAliases( comparator );
    }

    /**
     * Retrieves symbols for genes associated to polymorphism. 
     * This method must be called after populateGenes 
     * is called to initialize gene collection.
     *
     * @param conn An active connection to the database
     */
    public void populateSymbols( DBconnection conn )
	throws SQLException {

        genes.populateSymbols( conn );
    }

    /**
     * Sorts symbols for genes associated to polymorphism using the 
     * submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting symbols
     */
    public void sortSymbols( Comparator comparator ) {
        genes.sortSymbols( comparator );
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "name: " + getName() );
        System.out.println( "original name: " + getOriginalName() );
        System.out.println( "tair object id: " + getTairObjectID() );
        System.out.println( "map element id: " + getMapElementID() );
        System.out.println( "polymorphism id: " + getPolymorphismID() );
        System.out.println( "ref polymorphism id: " + getRefPolymorphismID() );

	genes.test();
    }

}
