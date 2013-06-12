/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.Iterator;

import org.tair.tfc.DBconnection;

/**
 * SpeciesVariantCollection is a custom collection that stores species variants
 * for a polymorphism as a collection of <code>PolymorphismSpeciesVariant</code> 
 * objects which contain species variant data as well as relationship specific
 * data for the join between polymorphism and species variant
 *
 * <p>
 * NOTE: currently this collection is only used for polymorphisms. Collection could
 * be altered to be used by other classes by changing method signatures to
 * use TfcSpeciesVariant instead of the polymorphism specific PolymorphismSpeciesVariant
 * data object and by adding a population "mode" param that would flag whether
 * population is for polymorphism or not. Just an idear....
 * 
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */

public class SpeciesVariantCollection implements Serializable {
    private ArrayList speciesVariants;
    private ArrayList poly2sv_tair_objects_ids;
    private Map       poly2sv_tair_objects_ids_map;

    /**
     * Creates an empty instance of SpeciesVariantCollection
     */
    public SpeciesVariantCollection() {
        this.speciesVariants = new ArrayList();
        this.poly2sv_tair_objects_ids=new ArrayList();
        this.poly2sv_tair_objects_ids_map=new HashMap();
    }

    /**
     * Creates an instance of SpeciesVariantCollection that contains
     * species variants associated to submitted polymorphism id as
     * <code>PolymorphismSpeciesVariant</code> objects
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public SpeciesVariantCollection( DBconnection conn, Long polymorphism_id ) throws SQLException {
        this.speciesVariants = new ArrayList();
        this.poly2sv_tair_objects_ids=new ArrayList();
        this.poly2sv_tair_objects_ids_map=new HashMap();
        populate( conn, polymorphism_id );
    }


    /**
     * Populates object by retrieving species variants associated with submitted
     * polymorphism id and storing internally as <code>PolymorphismSpeciesVariant</code> 
     * objects
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    private void populate( DBconnection conn, Long polymorphismID ) throws SQLException {
        ArrayList ids = null;
        //for the Polymorphism_SpeciesVariant ids we need for attribution
        ArrayList tIds = new ArrayList();
        String query = null;
        ResultSet results = null;
        Iterator iter = null;
        PolymorphismSpeciesVariant variant = null;


        query = 
            "SELECT p.species_variant_id,p.tair_object_id "+
            "FROM Polymorphism_SpeciesVariant p, SpeciesVariant s " +
            "WHERE p.species_variant_id = s.species_variant_id " +
            "AND s.is_obsolete = 'F' " +
            "AND p.polymorphism_id = " + polymorphismID.toString();
        
        conn.setQuery( query );
        results = conn.getResultSet();
        while( results.next() ){
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "species_variant_id" ) ) );
            tIds.add( new Long( results.getLong( "tair_object_id" ) ) );
        }
        conn.releaseResources();
        
        int index = 0;
        if ( ids != null && !ids.isEmpty() ) {
            iter = ids.iterator();
            while ( iter.hasNext() ) {
                variant = new PolymorphismSpeciesVariant( conn, polymorphismID, (Long) iter.next());
                Long tairID = (Long) tIds.get(index++);
                add( variant, tairID);
            }
        }
    }


    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { 
        return speciesVariants.isEmpty(); 
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
        return speciesVariants.size(); 
    }


    /**
     * Retrieves element at supplied index
     *
     * @return Element at supplied index, or <code>null</code> if no element at supplied index
     */
    public PolymorphismSpeciesVariant get( int index ) { 
        return (PolymorphismSpeciesVariant) speciesVariants.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param variant Element to add to collection
     */
    public void add( PolymorphismSpeciesVariant variant ) { 
        speciesVariants.add( variant ); 
    }
    
    
    /**
     * Adds supplied element to collection
     * 
     * @param variant Element to add to collection
     * @param variant Element's tair object id for Polymorphism_SequenceVariant to add in same order
     */
    public void add( PolymorphismSpeciesVariant variant,Long tairObjectID ) { 
        speciesVariants.add( variant );
        poly2sv_tair_objects_ids.add(tairObjectID);
        poly2sv_tair_objects_ids_map.put(variant.get_abbrev_name().toUpperCase(),tairObjectID);
    }
    
    public Long getTairObjectIDForVariantAbbrevName(String abbrev_name)
    {
	if(abbrev_name == null)
		return null;
    	return (Long) poly2sv_tair_objects_ids_map.get(abbrev_name.toUpperCase());
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param variant Element to remove from collection
     */
    public void remove( PolymorphismSpeciesVariant variant ) { 
        speciesVariants.remove( variant ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @param variant Element to check
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( PolymorphismSpeciesVariant variant ) { 
        return speciesVariants.contains( variant ); 
    }

    /**
     * Retrieves all elements in collection
     *
     * @return All elements in collection as an <code>Iterator</code> of <code>PolymorphismSpeciesVariant</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() { 
        return ( !speciesVariants.isEmpty() ) ? speciesVariants.iterator() : null; 
    }
    
    
    public PolymorphismSpeciesVariant getSpeciesVariantByIndex(int index)
    {
    	return ( !speciesVariants.isEmpty() && speciesVariants.size() > index) ? 
    					(PolymorphismSpeciesVariant) speciesVariants.get(index) : null;
    }
    
    public Long getSpeciesVariant2PolymorphismTairObjectID(int index)
    {
    	return ( !poly2sv_tair_objects_ids.isEmpty() && poly2sv_tair_objects_ids.size() > index) ? 
    													(Long) poly2sv_tair_objects_ids.get(index) : null;
    }
    
    public List SpeciesVariant2PolymorphismTairObjectIDs()
    {
    	return poly2sv_tair_objects_ids;
    }
    
    /**
     * Get distinct verification status of species variants
     * @return All verification status <code>Iterator</code> of <code>String</code>
     * objects, or <code>null</code> if no verification for species variants
     */
    public Iterator getStatuses (){
        Set statuses = new HashSet();
	if ( !speciesVariants.isEmpty() ){
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                PolymorphismSpeciesVariant speciesVariant = (PolymorphismSpeciesVariant) iter.next();
                Boolean statusInDb =  speciesVariant.get_is_verified();
                if ( statusInDb == null ){
		    statuses.add ("unknown");
                }else if (statusInDb != null && statusInDb.booleanValue () ){
		    statuses.add ("yes");
                } else if (statusInDb != null && !(statusInDb.booleanValue ()) ){
		    statuses.add ("no");
                }  
            }

	}
        return statuses.iterator(); 
    } 
    /**
     * Get species variant of a specific status 
     * @param String status
     * @return All elements in collection of a specif status as an <code>Iterator</code> of 
     * <code>PolymorphismSpeciesVariant</code> objects, or <code>null</code> if no elements in collection
     */
    public Iterator getSpeciesVariantsOfStatus(String status){ 
        ArrayList ofStatus = new ArrayList();
	if ( !speciesVariants.isEmpty() ){
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                PolymorphismSpeciesVariant speciesVariant = (PolymorphismSpeciesVariant) iter.next();
                Boolean statusInDb =  speciesVariant.get_is_verified();
                if ( statusMatch( statusInDb, status )){
                   ofStatus.add( speciesVariant ); 
                }
            }

	}
        return ofStatus.iterator(); 
    }

    // a private helper function to determine the status in database matches the status we are looking for
    private boolean statusMatch ( Boolean inDb, String status){
        boolean resturnValue = false ;
        if (inDb == null  && status.equals( "unknown")){
            resturnValue = true;
        }
        if (inDb != null && inDb.booleanValue() && status.equals( "yes") ){
             resturnValue = true;
        }
        if (inDb != null && (!inDb.booleanValue()) && status.equals( "no") ){
	    resturnValue = true;
        }
        return resturnValue; 
    }
 
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** SpeciesVariantCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            PolymorphismSpeciesVariant variant = null;
            while ( iter.hasNext() ) {
                variant = (PolymorphismSpeciesVariant) iter.next();
                variant.test();
            }
        }
        System.out.println( "**** SpeciesVariantCollection content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 500200491 );
            SpeciesVariantCollection variants = new SpeciesVariantCollection( conn, id );
            variants.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}//SpeciesVariantCollection
  








