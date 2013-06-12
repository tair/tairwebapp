//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2006/01/18 00:12:17 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;



/**
 * PolymorphismObjectCollection is a custom collection that stores
 * all polymorphisms associated to a given object type as a collection of 
 * <code>PolymorphismObject</code> objects. 
 *
 * <p>
 * If the collection is created to contain polymorphisms associated with 
 * a germplasm, the concrete object type of the elements in the collection 
 * will be <code>GermplasmPolymorphism</code> objects, which inherit from
 * <code>PolymorphismObject</code> to contain data specific to the join
 * between germplasm and polymorphism as well as collection of polymorphism's loci
 */


public class PolymorphismObjectCollection implements Serializable {
    private ArrayList polymorphisms;


    /**
     * Creates an empty instance of PolymorphismObjectCollection 
     */
    public PolymorphismObjectCollection() {
        polymorphisms = new ArrayList();
    }

  
    /**
     * Creates an instance of PolymorphismObjectCollection that contains all polymorphisms
     * associated to  a given object, where type of  object and how polymorphisms are 
     * retrieved are determined by type. Possible values of type are:
     * <ul>
     * <li>marker - id should be genetic_marker_id
     * <li>locus -  id should be locus_id
     * <li>poly - id should be polymorphism_id for reference polymorphism
     * <li>gene - id should be gene id. Collection will be populated by getting all
     * polymorphisms associated to all loci associated to gene_id
     * <li>germplasm - id should be germplasm_id; if populating collection with this type,
     * concrete type of objects in collection will be <code>GermplasmPolymorphism</code>,
     * which inherits from <code>PolymorphismObject</code>
     * </ul>
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type to retrieve polymorphisms for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public PolymorphismObjectCollection( DBconnection conn, Long id, String type ) throws SQLException {
        polymorphisms = new ArrayList();
        populate( conn, id, type );
    }


    private void populate( DBconnection conn, Long id, String type ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;
        Long polyID= null;
        Iterator iter = null;
        boolean isGermplasm = false;
        
        if ( type.equalsIgnoreCase( "marker" ) ) {
            query =
                "SELECT polymorphism_id "+
                "FROM Polymorphism "+
                "WHERE is_obsolete = 'F' " +
                "AND genetic_marker_id = " + id.toString();
            
        } else if ( type.equalsIgnoreCase( "locus" ) ) {
            query = 
                "SELECT p.polymorphism_id "+
                "FROM Polymorphism p, MapElement_Locus m " +
                "WHERE p.map_element_id = m.map_element_id " +
                "AND p.is_obsolete = 'F' " +
                "AND m.locus_id = " + id.toString();
            
        } else if ( type.equalsIgnoreCase( "poly" ) ) {
            query =
                "SELECT polymorphism_id " +
                "FROM Polymorphism " +
                "WHERE is_obsolete = 'F' " +
                "AND ref_polymorphism_id = " + id.toString();
            
            
        } else if ( type.equalsIgnoreCase( "gene" ) ) {
            
            // get polys for gene by getting items associated to
            // loci associated to gene id
            query =
                "SELECT p.polymorphism_id " +
                "FROM Polymorphism p, MapElement_Locus pl, Locus l, MapElement_Locus gl, Gene g " +
                "WHERE p.map_element_id = pl.map_element_id " +
                "AND p.is_obsolete = 'F' " +
                "AND pl.locus_id = l.locus_id " +
                "AND l.is_obsolete = 'F' " +
                "AND l.locus_id = gl.locus_id " +
                "AND gl.map_element_id = g.map_element_id " +
                "AND g.gene_id = " + id.toString();
            
        } else if ( type.equalsIgnoreCase( "germplasm" ) ) {
            query =
                "SELECT p.polymorphism_id, p.name " +
                "FROM Germplasm_MapElement g, Polymorphism p " +
                "WHERE g.map_element_id = p.map_element_id " +
                "AND p.is_obsolete = 'F' " +
                "AND g.germplasm_id = " + id.toString() +
                " ORDER BY name";
            
            isGermplasm = true; // set flag to create specialized objects for collection
            
        }
        
        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ){
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "polymorphism_id" ) ) );
        }
        conn.releaseResources();
        
        if ( ids != null && !ids.isEmpty() ) {
            iter = ids.iterator();
            while ( iter.hasNext() ) {
                polyID = (Long) iter.next();
                
                if ( isGermplasm ) { // create specialized version for germplasm (contains locus info)
                    addElement( new GermplasmPolymorphism( conn, id, polyID ) );
                } else { // create more general version for all others
                    addElement( new PolymorphismObject( conn, polyID ) );
                }
            }
        }
    }
    
    /**
     * Populates associated restriction enzymes for each polymorphism in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateRestrictionEnzymes( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        PolymorphismObject poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismObject) iter.next();
                poly.populateRestrictionEnzymes( conn );
            }
        }
    }

    /**
     * Populates associated flanking sequences for each polymorphism in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateFlankingSequences( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        PolymorphismObject poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismObject) iter.next();
                poly.populateFlankingSequences( conn );
            }
        }
    }

    /**
     * Populates associated species variants for each polymorphism in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateSpeciesVariants( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        PolymorphismObject poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismObject) iter.next();
                poly.populateSpeciesVariants( conn );
            }
        }
    }

    /**
     * Populates attribution flag for each polymorphism in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateHasAttributions( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        PolymorphismObject poly = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismObject) iter.next();
                poly.populateHasAttributions( conn );
            }
        }
    }


    /**
     * Determines if collection has polymorphisms in it
     *
     * @return <code>true</code> if collection has no polymorphisms in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { 
        return polymorphisms.isEmpty(); 
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
        return polymorphisms.size(); 
    }

    /**
     * Retrieve element at supplied index
     * 
     * @return Polymorphism at supplied index, or <code>null</code> if no element at supplied index
     */
    public PolymorphismObject elementAt( int index ) { 
        return (PolymorphismObject) polymorphisms.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param polymorphism Polymorphism to add to collection
     */
    public void addElement( PolymorphismObject polymorphism ) { 
        polymorphisms.add( polymorphism ); 
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param polymorphism Polymorphism to remove from collection
     */
    public void removeElement( PolymorphismObject polymorphism ) { 
        polymorphisms.remove( polymorphism ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( PolymorphismObject polymorphism ) { 
        return polymorphisms.contains( polymorphism ); 
    }

    /**
     * Retrieve all elements in collection 
     *
     * @return All polymorphisms in collection as an <code>Iterator</code> of <code>PolymorphismObject</code>
     * objects, or <code>null</code> if no polymorphisms in collection
     */
    public Iterator iterator() { 
        return ( !polymorphisms.isEmpty() ) ? polymorphisms.iterator() : null; 
    }


    /**
     * Returns an <code>Iterator</code> of <code>PolymorphismObject</code>s where
     * polymorphism type equals the requested type.
     *
     * @param type Type of Polymorphism to return
     * @return <code>Iterator</code> of <code>PolymorphismObject</code>s with the
     * requested type, or <code>null</code> if no objects in collection have the requested
     * type. If submitted type is <code>null</code>, all polymorphisms in the collection
     * will be returned
     */
    public Iterator get_polymorphisms( String type ) {
        ArrayList tmp = null;
        Iterator iter = null;
        PolymorphismObject tmpObj = null;
        Iterator returnIter = null;


        if ( type != null ) { // create collection for objects matching type
            iter = iterator();
            if ( iter != null ) {
                while ( iter.hasNext() ) {
                    tmpObj = (PolymorphismObject) iter.next();
                    if ( type.equals( tmpObj.get_polymorphism_type() ) ) {
                        if ( tmp == null ) {
                            tmp = new ArrayList();
                        }
                        tmp.add( tmpObj );
                    }
                }
            }
            if ( tmp != null && !tmp.isEmpty() ) {
                returnIter = tmp.iterator();
            }
        } else { // if not restricting by type, return all in collection
            returnIter = iterator();
        }
        return returnIter;
    }

    /**
     * Returns an <code>Iterator</code> of <code>PolymorphismObject</code>s where
     * polymorphism type equals of the requested types
     *
     * @param types Types of Polymorphism to return
     * @return <code>Iterator</code> of <code>PolymorphismObject</code>s with the
     * requested types, or <code>null</code> if no objects in collection have the requested
     * types. If submitted types list is <code>null</code>, all polymorphisms in the collection
     * will be returned
     */
  
    public Iterator get_polymorphisms( String[] types ) {
        ArrayList tmp = null;
        Iterator iter = null;
        Iterator returnIter = null;
        PolymorphismObject tmpObj = null;
        String tmpType = null;

        if ( types != null && types.length > 0 ) {
            iter = iterator();
            if ( iter != null ) {
                while ( iter.hasNext() ) {
                    tmpObj = (PolymorphismObject) iter.next();
                    tmpType = tmpObj.get_polymorphism_type();
                    boolean keep = false;
                    if ( tmpType != null ) {
                        for ( int i = 0; i < types.length; i++ ) {
                            if ( tmpType.equals( types[ i ] ) ) {
                                keep = true;
                                break;
                            }
                        }
                    }
                    if ( keep ) {
                        if ( tmp == null ) {
                            tmp = new ArrayList();
                        }
                        tmp.add( tmpObj );
                    }
                }
            }
      
            if ( tmp != null && !tmp.isEmpty() ) {
                returnIter = tmp.iterator();
            }

        } else { // if not restricting by type, return all in collection
            returnIter = iterator();
        }
        return returnIter;
    }
    

    /**
     * For unit testing only
     */
    public void test(){
        System.out.println( "****** PolymorphismObjectCollection content test ******" );
        if ( !isEmpty() ) {
            PolymorphismObject poly = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                poly = (PolymorphismObject) iter.next();
                poly.test();
            }
        }
        System.out.println( "**** PolymorphismObjectCollection content test end ****" );
    
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){
        try{
            DBconnection conn = new DBconnection();
 
            System.out.println( "Creating from marker id..." );
            Long id = new Long( 632 ); //visible_phenotype
            PolymorphismObjectCollection polymorphisms = new PolymorphismObjectCollection( conn, id, "marker" );
            polymorphisms.test();

            System.out.println( "\nCreating from locus id..." );
            id = new Long( 12 );
            polymorphisms = new PolymorphismObjectCollection( conn, id, "locus" );
            polymorphisms.test();

            System.out.println( "\nCreating from reference polymorphism id..." );
            id = new Long( 13 );
            polymorphisms = new PolymorphismObjectCollection( conn, id, "poly" );
            polymorphisms.test();

            System.out.println( "\nCreating from gene id..." );
            id = new Long( 26819 );
            polymorphisms = new PolymorphismObjectCollection( conn, id, "gene" );
            polymorphisms.test();
            System.out.println( "******************************************" );


        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }

}
  








