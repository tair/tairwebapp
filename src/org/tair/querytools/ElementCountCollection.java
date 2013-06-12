/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;
import java.io.Serializable;

import org.tair.tfc.*;

/**
 * ElementCountCollection stores simples counts of elements associated to a
 * given data object as a collection of ElementCount objects. Each
 * ElementCount object contains a String type parameter that describes what
 * data type the count is for (i.e. "clone") as well as a count of how many
 * objects of that type are associated to parent object. ElementCount also
 * contains a string URL that links to the object type's search for displaying
 * the full list of elements.
 *
 * <p>
 * ElementCountCollection is used in situations where showing itemized lists
 * of associated data elements is bulky and costly due to the number of
 * associated elements (for example, on assembly unit detail page where the
 * number of associated ESTs makes it impractical to show all of them).
 * ElementCountCollection allows these elements to be displayed through
 * counts of associated elements that usually hyperlink to an associated
 * search results page that will show the itemized list in the standard
 * search summary page format.
 */

public class ElementCountCollection implements Serializable {

    // Store element counts as element type referencing
    // the associated ElementCount object

    public static final String kPolymorphismParentType = "polymorphism";
    public static final String kGermplasmSearchType = "germplasm";
    public static final String kPhenotypeSearchType = "phenotype";

    private TreeMap elementCounts;

    /**
     * Creates an instance of ElementCountCollection that retrieves counts of
     * elements associated to object of submitted parentType with submitted
     * id and parentName. Which element counts are retrieved, and how they
     * are retrieved, will be different according to parentType.  Current
     * valid values of parentType are:
     *
     * <ul>
     * <li>assembly_unit - id should be Assembly Unit's map_element_id;
     * counts will be retrieved through assignments onto assembly unit for
     * genetic markers, clones and ESTs (clone ends where type = 'EST')</li>
     *
     * <li>locus - id should be Locus's locus_id; counts will be retrieved
     * for locus's clones and ESTs through MapElement_Locus.  Clones & ESTs
     * will be restricted to only those thatt have an associated NT
     * sequence</li>
     * </ul>
     *
     * @param conn An active connection to the database
     * @param id ID of parent object to use for retrieving counts
     * @param parentType Data type of parent object
     * @exception SQLException thrown if a database error occurs
     */

    public ElementCountCollection( DBconnection conn, Long id,
                                   String parentType )
        throws SQLException {

        elementCounts = new TreeMap();

        if ( id != null && parentType != null ) {
            if ( parentType.equals( "assembly_unit" ) ) {
                populateAssemblyUnit( conn, id );
            } else if ( parentType.equals( "locus" ) ) {
                populateLocus( conn, id );
            } else if ( parentType.equals( kPolymorphismParentType ) ) {
                populatePolymorphism( conn, id );
            }
        }
    }

    // Populates element counts for assembly unit with submitted map_element_id
    // get URL to link to full list of elements from ElementSearchLinks

    private void populateAssemblyUnit( DBconnection conn,
                                       Long map_element_id )
        throws SQLException {

        ElementCount countRecord = null;
        String searchLink = null;
        int count = 0;

        // Get markers

        count = getSubAssignmentCount( conn, "GeneticMarker",
                                       map_element_id, "" );

        if ( count > 0 ) {
            searchLink = ElementSearchLinks.getSearchLink( "genetic_marker",
                                                           "assembly_unit",
                                                           map_element_id );

            countRecord = new ElementCount( "genetic_marker", count,
                                            searchLink );
            elementCounts.put( countRecord.getElementType(), countRecord );
        }

        // Get clones

        count = getSubAssignmentCount( conn, "Clone", map_element_id, "" );

        if ( count > 0 ) {
            searchLink = ElementSearchLinks.getSearchLink( "clone",
                                                           "assembly_unit",
                                                           map_element_id );

            countRecord = new ElementCount( "clone", count, searchLink );
            elementCounts.put( countRecord.getElementType(), countRecord );
        }

        // Get ESTs

        count = getSubAssignmentCount( conn, "CloneEnd", map_element_id,
                                       "AND f.cloneend_type = 'EST' " );

        if ( count > 0 ) {
            searchLink = ElementSearchLinks.getSearchLink( "EST",
                                                           "assembly_unit",
                                                           map_element_id );
            countRecord = new ElementCount( "EST", count, searchLink );
            elementCounts.put( countRecord.getElementType(), countRecord );
        }
    }


    /*
     * Populates element counts for locus with submitted locus id.  All
     * clones/ESTs will automatically be restricted to those that have an
     * associated NT sequence. Get URL to link to full list of elements from
     * ElementSearchLinks
     */

    private void populateLocus( DBconnection conn, Long locus_id )
        throws SQLException {

        ElementCount countRecord = null;
        String searchLink = null;
        int count = 0;

        // Get cDNA clones

        count = getMapElementLocusCount( conn, "Clone", locus_id,
                                         "AND a.insert_type='cDNA'" );

        if ( count > 0 ) {
            searchLink = ElementSearchLinks.getSearchLink( "cDNA", "locus",
                                                           locus_id );
            countRecord = new ElementCount( "cDNA", count, searchLink );
            elementCounts.put( countRecord.getElementType(), countRecord );
        }

        // Get genomic clones

        count = getMapElementLocusCount( conn, "Clone", locus_id,
                                         "AND a.insert_type='genomic'" );

        if ( count > 0 ) {
            searchLink = ElementSearchLinks.getSearchLink( "genomic clone",
                                                           "locus", locus_id );
            countRecord = new ElementCount( "genomic clone", count,
                                            searchLink );
            elementCounts.put( countRecord.getElementType(), countRecord );
        }

        // Get ESTs

        count = getMapElementLocusCount( conn, "CloneEnd", locus_id,
                                         "AND a.cloneend_type= 'EST' " );

        if ( count > 0 ) {
            searchLink = ElementSearchLinks.getSearchLink( "EST", "locus",
                                                           locus_id );
            countRecord = new ElementCount( "EST", count, searchLink );
            elementCounts.put( countRecord.getElementType(), countRecord );
        }

    }

    /*
     * Populates element counts for given polymorphism id; obtains
     * both germplasm and phenotype counts.
     */
    private void populatePolymorphism( DBconnection conn, Long polymorphism_id )
        throws SQLException {

        TfcPolymorphism poly = new TfcPolymorphism( conn, polymorphism_id );
        int count = 0;

        // 1) the germplasm count.
        count = getPolymorphismGermplasmCount( conn, poly.get_map_element_id() );
        populatePolymorphism_Helper( count, kGermplasmSearchType, kPolymorphismParentType, polymorphism_id );

        // 2) the phenotype count.
        count = getPolymorphismPhenotypeCount( conn, poly.get_map_element_id() );
        populatePolymorphism_Helper( count, kPhenotypeSearchType, kPolymorphismParentType, polymorphism_id );
    }

    private void populatePolymorphism_Helper( int count, String searchType, String parentElement, Long parentID ) {
        if( count > 0 )
        {
            String searchLink = ElementSearchLinks.getSearchLink( searchType, parentElement, parentID );
            ElementCount countRecord = new ElementCount( searchType, count, searchLink );
            elementCounts.put( countRecord.getElementType(), countRecord );
        }
    }

    private int getPolymorphismGermplasmCount( DBconnection conn, Long polymorphism_map_element_id )
        throws SQLException
    {
        String query =
            "SELECT COUNT(wrk.germplasm_id) " +
            "FROM Germp_MapEl_Pheno_wrk wrk " +
            "WHERE wrk.map_element_id = " + polymorphism_map_element_id.toString();

        return(
               retrieveCount( conn, query )
               );
    }

    private int getPolymorphismPhenotypeCount( DBconnection conn, Long polymorphism_map_element_id )
        throws SQLException
    {
        String query =
            "SELECT COUNT(wrk.germplasm_id) " +
            "FROM Germp_MapEl_Pheno_wrk wrk " +
            "WHERE wrk.map_element_id = " + polymorphism_map_element_id.toString() +
            "AND wrk.phenotype_uc is not null";

        return(
               retrieveCount( conn, query )
               );
    }

    /*
     * Utility method to get number of elements in featureTable that are
     * assigned on to map element with id (where Assignment.map_id = id) -
     * use additionalCriteria to append type specific criteria needed for
     * associatedTable
     */

    private int getSubAssignmentCount( DBconnection conn,
                                       String featureTable,
                                       Long id,
                                       String additionalCriteria )
        throws SQLException {

        String query =
            "SELECT COUNT(*) FROM LocalAssignment la, " +
            featureTable + " f " +
            "WHERE la.sub_map_element_id = f.map_element_id " +
            "AND f.is_obsolete = 'F' " +
            "AND la.super_map_element_id = " + id.toString() + " " +
            additionalCriteria;

        int count = retrieveCount( conn, query );

        return count;
    }

    /*
     * Utility method to get number of elements in associatedTable that are
     * related to to locus with submitted locus_id - use additionalCriteria
     * to append type specific criteria needed for associatedTable.
     * Automatically restrict all elements returned to those having an NT
     * sequence (use is_sequenced flag to save actual join to NT seq)
     */

    private int getMapElementLocusCount( DBconnection conn,
                                         String associatedTable,
                                         Long locus_id,
                                         String additionalCriteria )
        throws SQLException {

        String query =
            "SELECT COUNT( *) FROM MapElement_Locus ml, " +
            associatedTable + " a " +
            "WHERE ml.map_element_id = a.map_element_id " +
            "AND a.is_obsolete = 'F' " +
            "AND a.is_sequenced = 'T' " +
            "AND ml.locus_id = " + locus_id.toString() + " " +
            additionalCriteria;

        int count = retrieveCount( conn, query );

        return count;
    }

    /*
     * Utility method to retrieve element counts for any SQL query
     */

    private int retrieveCount( DBconnection conn, String query )
        throws SQLException {

        ResultSet results = null;
        int count = 0;

        conn.setQuery( query );
        results = conn.getResultSet();

        if ( results.next() ) {
            count = results.getInt( 1 );
        }

        conn.releaseResources();

        return count;
    }

    /**
     * Determines whether there is at least one element of submitted type
     * associated to parent element (i.e. that the element count for submitted
     * type is > 0
     *
     * @return <code>true</code> if element type has a count of at least one;
     * or <code>false</code> if element type is zero, or not found in
     * collection
     */

    public boolean hasElementCount( String elementType ) {

        // all elements in collection should have counts > 0

        return ( elementType != null &&
                 elementCounts.containsKey( elementType ) );
    }

    /**
     * Retrieves all elements in collection
     *
     * @return All elements in collection as an <code>Iterator</code> of
     * <code>ElementCount</code> objects, or <code>null</code> if collection
     * has no elements in it
     */

    public Iterator getElementCounts() {
        return ( !elementCounts.isEmpty() ) ?
            elementCounts.values().iterator() : null;
    }

    /**
     * Retrieves all element types stored in collection
     *
     * @return All element types in collection as an <code>Iterator</code>
     * of <code>String</code> objects, or <code>null</code> if collection
     * has no elements in it
     */

    public Iterator getElementTypes() {
        return ( !elementCounts.isEmpty() ) ?
            elementCounts.keySet().iterator() : null;
    }

    /**
     * Determines if collection is empty
     *
     * @return <code>true</code> if collection has no elements in it;
     * <code>false</code>if collection has at least one element in it
     */

    public boolean isEmpty() {
        return elementCounts.isEmpty();
    }

    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */

    public int size() {
        return elementCounts.size();
    }

    /**
     * Retrieves element count for submitted type as an
     * <code>ElementCount</code> object
     *
     * @return <code>ElementCount</code> object for submitted type,
     * or <code>null</code> if no element found for elementType
     */

    public ElementCount get( String elementType ) {

        ElementCount count = null;

        if ( hasElementCount( elementType ) ) {
            count = (ElementCount) elementCounts.get( elementType );
        }

        return count;
    }

    /**
     * Adds element count for submitted elementType to collection
     *
     * @param elementType Element type to associated elementCount to
     * @param elementCount ElementCount to add to collection
     */

    public void put( String elementType, ElementCount elementCount ) {
        elementCounts.put( elementType, elementCount );
    }

    /**
     * Removes supplied element from collection. If element is not in
     * collection request is silently ignored
     *
     * @param elementCount ElementCount to remove from collection
     */

    public void remove( ElementCount elementCount ) {
        elementCounts.remove( elementCount );
    }

}
