//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2003/11/14 00:13:23 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/** 
 * CloneCollection is a custom collection that stores all clones associated to a 
 * given element. Clones are stored as a collection  of <code>Clone</code> objects. 
 * CloneCollection's constructor uses a type parameter to determine what kind of 
 * object the collection of clones is associated to, and therefore how to
 * create the collection
 *
 * <p>
 * Implements Serializable for writing stock catalog data to disk.
 */

public class CloneCollection implements Serializable {
    private ArrayList<Clone> clones;


    /**
     * Creates an empty instance of CloneCollection
     */
    public CloneCollection() {
        clones = new ArrayList();
    }

    
    /**
     * Creates an instance of CloneCollection that stores all clones associated to
     * a given object, where type of object and how clones are retrieved are
     * determined by type. Possible values of type are:
     * <ul>
     * <li>gene - id should be gene_id</li>
     * <li>assembly_unit - id should be assembly_unit_id</li>
     * <li>stock - id should be stock_id</li>
     * <li>locus - id should be locus_id</li>
     * <li>germplasm - id should be germplasm_id</li>
     * </ul>
     *
     * Clones are stored as  <code>Clone</code> objects
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type to retrieve clones for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public CloneCollection( DBconnection conn, Long id, String type ) throws SQLException {
        clones = new ArrayList();

        if ( id != null && type != null ) {
            get_information( conn, id, type );
        }
    }
    

    private void get_information( DBconnection conn, Long id, String type ) throws SQLException {
        String query = null;
        ArrayList cloneIDs = null;
        ResultSet results = null;
        Clone clone = null;

        if ( id != null && type != null ) {
            if ( type.equalsIgnoreCase( "gene" ) ) {
                query = 
                    "SELECT c.clone_id "+
                    "FROM Gene_MapElement g, Clone c " +
                    "WHERE g.map_element_id = c.map_element_id " +
                    "AND c.is_obsolete = 'F' " +
                    "AND g.gene_id = " + id.toString();

            } else if ( type.equalsIgnoreCase( "assembly_unit" ) ) {
                query = 
                    "SELECT clone_id " +
                    "FROM Clone " +
                    "WHERE is_obsolete = 'F' " +
                    "AND assembly_unit_id = " + id.toString();
         
            } else if ( type.equalsIgnoreCase( "stock" ) ) {
                query = 
                    "SELECT c.clone_id " +
                    "FROM Clone c, TairObject_Stock ts " +
                    "WHERE c.tair_object_id = ts.tair_object_id " +
                    "AND c.is_obsolete = 'F' " + 
                    "AND ts.stock_id = " + id.toString();

            } else if ( type.equalsIgnoreCase( "locus" ) ) {
                query = 
                    "SELECT c.clone_id "+
                    "FROM Clone c, MapElement_Locus m "+
                    "WHERE c.map_element_id = m.map_element_id " +
                    "AND c.is_obsolete = 'F' " +
                    "AND m.locus_id = " + id.toString();  

            } else if ( type.equalsIgnoreCase( "germplasm" ) ) {
                query =
                    "SELECT c.clone_id " +
                    "FROM Clone c, Germplasm_MapElement gm " +
                    "WHERE c.map_element_id = gm.map_element_id " +
                    "AND c.is_obsolete = 'F' " +
                    "AND gm.germplasm_id = " + id.toString();
            }

            if ( query != null ) {
                conn.setQuery( query );
                results = conn.getResultSet();
                while ( results.next() ) {
                    if ( cloneIDs == null ) {
                        cloneIDs = new ArrayList();
                    }
                    cloneIDs.add( new Long( results.getLong( "clone_id" ) ) );
                }
                conn.releaseResources();
        
                if ( cloneIDs != null && !cloneIDs.isEmpty() ) {
                    Iterator iter = cloneIDs.iterator();
                    while ( iter.hasNext() ) {
                        clone = new Clone( conn, (Long) iter.next() );
                        addElement( clone );
                    }
                }
            }
        }
    }

    /**
     * Populates collection of associated loci for each Clone object in collection.  
     * This is done separately from constructor to avoid retrieving loci when they are
     * not needed for display.  Method to retrieve clone's loci should be specified
     * by populationType (see LocusCollection for description of values for this type
     * param)
     *
     * @param conn An active connection to the database
     * @param populationType Population mode to use for getting clone's loci.
     * @exception SQLException thrown if a database error occurs
     */
    public void populateLocus( DBconnection conn, String populationType ) throws SQLException {
        Iterator iter = null;
        Clone clone = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                clone = (Clone) iter.next();
                clone.populateLocus( conn, populationType );
            }
        }
    }

    /**
     * Populates collection of attributions for each Clone object in collection.  
     * This is done separately from constructor to avoid retrieving attributions when they are
     * not needed for display. 
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public void populateAttributions( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        Clone clone = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                clone = (Clone) iter.next();
                clone.populateAttributions( conn );
            }
        }
    }

    /**
     * Populates collection of NT sequences for each Clone object in collection.  
     * This is done separately from constructor to avoid retrieving sequences when they are
     * not needed for display.  Sequences are populated to contain all data about sequence
     * excluding sequence text itself
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public void populateNTSequences( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        Clone clone = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                clone = (Clone) iter.next();
                clone.populateNTSequences( conn );
            }
        }
    }


    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no clones in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return clones.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return clones.size(); }

    /**
     * Retrieves element at supplied index
     *
     * @return Clone at supplied index, or <code>null</code> if no element at supplied index
     */
    public Clone elementAt( int index ) { return (Clone) clones.get( index ); }


    /**
     * Adds supplied element to collection
     * 
     * @param clone Clone to add to collection
     */
    public void addElement( Clone clone ) { clones.add( clone ); }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param clone Clone to remove from collection
     */
    public void removeElement( Clone clone ) { clones.remove( clone ); }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( Clone clone ) { return clones.contains( clone ); }

    /**
     * Retrieves all clones in collection
     *
     * @return All clones in collection as an <code>Iterator</code> of <code>Clone</code>
     * objects, or <code>null</code> if no clones in collection
     */
    public Iterator iterator() { return ( !clones.isEmpty() ) ? clones.iterator() : null; }

    /**
     * Determines if any clone object has data for the "Locus Name"
     * field. This info. can be used at the JSP level to determine whether to
     * show the "Locus Name" column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for Locus Name
     */
    public boolean hasLocusName() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                Clone c = (Clone) iter.next();
		if (c.hasLocus()) {
		    Iterator locusItr = c.getLocus();
		    while ( locusItr.hasNext() ) {
			TfcLocus l = (TfcLocus) locusItr.next();
			if (!EmptyTextConverter.convert(l.get_name()).equals("")) {
			    return true;
			}
		    }
                }
            }
        }

        return hasData;
    }


    /**
     * Determines if any clone object has data for the "Construct Type"
     * field. This info. can be used at the JSP level to determine whether to
     * show the "Construct Type" column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for Construct Type
     */
    public boolean hasConstructType() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                Clone c = (Clone) iter.next();
		if (!EmptyTextConverter.convert(c.get_construct_type()).equals("")) {
		    return true;
		}
	    }
	}

        return hasData;
    }

    /**
     * Determines if any clone object has data for the "Vector Name"
     * field. This info. can be used at the JSP level to determine whether to
     * show the "Vector Name" column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for Vector Name
     */
    public boolean hasVectorName() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                Clone c = (Clone) iter.next();
		if (!EmptyTextConverter.convert(c.get_vector_original_name()).equals("")) {
		    return true;
		}
	    }
	}

        return hasData;
    }

 
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** CloneCollection content test ******" );
        if ( !isEmpty() ) {
            Clone clone = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                clone = (Clone) iter.next();
                clone.test();
            }
        }
        System.out.println( "**** CloneCollection content test end ****" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();

            System.out.println( "Creating from gene id..." );
            Long id = new Long( 137055 );
            CloneCollection clones = new CloneCollection( conn, id, "gene" );
            clones.test();

            System.out.println( "\nCreating from assembly unit id..." );
            id = new Long( 1306 );
            clones = new CloneCollection( conn, id, "assembly_unit" );
            clones.test();
      
            System.out.println( "\nCreating from locus id..." );
            id = new Long( 665 );
            clones = new CloneCollection( conn, id, "locus" );
            clones.test();

            System.out.println( "\nCreating from stock id..." );
            id = new Long( 32616 );
            clones = new CloneCollection( conn, id, "stock" );
            clones.test();
      
            System.out.println( "\nCreating from germplasm id..." );
            id = new Long( 500237054 );
            clones = new CloneCollection( conn, id, "germplasm" );
            clones.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
      
    }
}
