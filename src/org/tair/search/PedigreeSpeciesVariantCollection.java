//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2003/09/11 20:04:15 $
//------------------------------------------------------------------------------ 

package org.tair.search;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.TreeMap;

import org.tair.tfc.DBconnection;

/**
 * PedigreeSpeciesVariantCollection is a custom collection that
 * stores bare minimum information on species variants associated
 * to a germplasm.  Species variants in this collection will be
 * associated to germplasm directly or through association to
 * germplasm's parent(s) as determined in the Pedigree table.
 * This data is retrieved by querying the Germplasm_Pedigree_wrk
 * work table which flattens out the data stored in Pedigree to 
 * make direct links between a germplasm and the background
 * of its parent(s).
 *
 * <p>
 * Information stored in this collection is only the species variant
 * abbrev. name and species variant id; this info. can be used to display
 * a simple list of species variants for a germplasm as hyperlinks to the
 * species variant detail page. If more info. is required, may need to
 * change contents of collection so that species variant info. is 
 * stored as full-fledged TfcSpeciesVariant objects, but bare minimum
 * is fine for now (and more efficient).
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data
 */


public class PedigreeSpeciesVariantCollection implements Serializable {

    // store items in in TreeMap as abbrev name referencing species variant
    // id so we can sort them by polymorphism name using TreeMap's natural ordering of keys
    private TreeMap speciesVariants; 

    /**
     * Creates an empty instance of PedigreeSpeciesVariantCollection
     */
    public PedigreeSpeciesVariantCollection() {
        this.speciesVariants = new TreeMap();
    }

    /**
     * Creates an instance of PedigreeSpeciesVariantCollection that contains
     * species variants associated to submitted germplasm id either directly or
     * through the Pedigree table.
     *
     * @param conn An active connection to the database
     * @param germplasm_id Germplasm id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public PedigreeSpeciesVariantCollection( DBconnection conn, Long germplasm_id ) 
        throws SQLException {

        this.speciesVariants = new TreeMap();
        populate( conn, germplasm_id );
    }


    /**
     * Retrieve species variant ids and abbrev names associated to germplasm
     * by querying Germplasm_Pedigree_wrk work table that flattens relationships
     * in Pedigree table out to connect child strains directly to species variant
     * of their parent(s).
     *
     * @param conn An active connection to the database
     * @param germplasm_id Germplasm id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn, Long germplasm_id ) throws SQLException {
        String query = null;
        ResultSet results = null;
        Long speciesVariantID = null;
        String abbrevName = null;
    
        query =
            "SELECT DISTINCT abbrev_name, species_variant_id " +
            "FROM Germplasm_Pedigree_wrk " +
            "WHERE species_variant_id IS NOT NULL AND abbrev_name IS NOT NULL " +
            "AND germplasm_id = " + germplasm_id.toString();
      
        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            abbrevName = results.getString( "abbrev_name" );
            if (abbrevName != null) {
              speciesVariantID = new Long( results.getLong( "species_variant_id" ) );
              speciesVariants.put( abbrevName, speciesVariantID );
            }
        }
        conn.releaseResources();
    }

    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return speciesVariants.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return speciesVariants.values().size(); }


    /**
     * Adds submitted species variant abbreviated name and species variant
     * id to to collection
     * 
     * @param name Species variant abbreviated name to add to collection
     * @param id Species variant id to add
     */
    public void put( String name, Long id ) {
        speciesVariants.put( name, id );
    }

    /**
     * Removes species variant entry with submitted abbreviated name 
     * from collection
     *
     * @param name Species variant abbreviated name to remove
     */
    public void remove( String name ) { 
        speciesVariants.remove( name ); 
    }

    /**
     * Determines if submitted abbreviated name is in collection
     *
     * @param name Abbreviated name to look for in collection
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean containsKey( String name ) { 
        return speciesVariants.containsKey( name ); 
    }

    /**
     * Determines if submitted species variant id is in collection
     *
     * @param id Species variant id to look for in collection
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean containsValue( Long id ) { 
        return speciesVariants.containsValue( id ); }


    /**
     * Retrieves all species variant abbreviated names in collection
     *
     * @return Species variant abbreviated names as an <code>Iterator</code>
     * of <code>String</code> objects, or <code>null</code> if no elements in collection
     */
    public Iterator getAbbreviatedNames() { 
        return !isEmpty() ? speciesVariants.keySet().iterator() : null; 
    }
    
    /**
     * Retrieves all species variant ids in collection
     *
     * @return Species variant ids as an <code>Iterator</code> of 
     * <code>Long</code> objects, or <code>null</code> if no elements 
     * in collection
     */
    public Iterator getSpeciesVariantIDs() { 
        return !isEmpty() ? speciesVariants.values().iterator() : null; 
    }
    
    /**
     * Retrieves species variant ID for submitted abbreviated name
     *
     * @param name Species variant abbreviated name to find species variant id for
     * @return Long value of species variant id, or <code>null</code>
     * if name not found in collection
     */
    public Long get( String name ) {
        return (Long) speciesVariants.get( name );
    }
                                                            

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** PedigreeSpeciesVariantCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = getAbbreviatedNames();
            while ( iter.hasNext() ) {
                String name = (String) iter.next();
                Long id = get( name );
                System.out.println( "Abbrev name: " + name );
                System.out.println( "Species variant id: " + id + "\n" );
            }
        }
        System.out.println( "**** PedigreeSpeciesVariantCollection content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 500240508 );
            PedigreeSpeciesVariantCollection speciesVariants = new PedigreeSpeciesVariantCollection( conn, 
                                                                                                     id );
            speciesVariants.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
