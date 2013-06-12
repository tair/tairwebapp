//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2004/05/18 20:58:23 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.tair.tfc.DBconnection;

/** 
 * LocusCollection is a custom collection class that stores
 * all loci for a Map Element as a collection of <code>Locus</code>
 * objects.
 *
 * <p>
 * If collection is created using "aa_sequence" as population mode, Locus objects
 * will be populated to include AGI map information for locus's representative
 * gene model.  This data is used on the aa sequence detail page to create
 * seq viewer links for aa sequence's loci.
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data
 */

public class LocusCollection implements Serializable {
    private ArrayList loci;
  

    /**
     * Creates an empty instance of LocusCollection
     */
    public LocusCollection() {
        loci = new ArrayList();
    }
    
    /**
     * Creates an instance of LocusCollection that contains all loci
     * associated to submitted map element id.  Loci are stored
     * internally as <code>Locus</code> objects
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public LocusCollection( DBconnection conn, Long map_element_id ) throws SQLException {
        loci = new ArrayList();
        if ( map_element_id != null ) {
            populate( conn, map_element_id, "" );
        }
    }

    /**
     * Creates an instance of LocusCollection that is populated with loci according
     * to specific rules for a submitted type value.  Valid values of type are:
     * <ul>
     *
     * <li>map_element - id should be map_element_id; this is identical to calling constructor
     *    (conn, id). Null entries for type will default to this population mode</li>
     *
     * <li>germplasm_clone - Retrieves loci for a clone included in a germplasm detail record; id
     *    should be clone's map element id in this case. Loci are retrieved for genes that are 
     *    associated to clone with submitted map element
     *
     * <li>germplasm - Retrieves loci associated to polymorphisms associated to a germplasm; id
     *    should be germplasm's germplasm id. 
     *
     * <li>aa_sequence - Retrieves loci for gene with submitted id that is associated to an
     *   aa sequence; id must be gene's map_element_id. If populating collection this way,
     *   objects in collection will include AGI map info. for locus's representative gene model; 
     *   this data is then used to create seq viewer links for locus on aa sequence detail page
     *
     * <li>array_element - Retrieves rep_gene model for the loci associated to array_element; 
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve loci for
     * @param type Population method/logic to use for retrieving loci
     * @exception SQLException thrown if a database error occurs
     */
    public LocusCollection( DBconnection conn, Long id, String type ) throws SQLException {
        loci = new ArrayList();
        if ( id != null ) {
            if ( type == null || type.equals( "map_element" ) ) {
                populate( conn, id, "" );
            } else if ( type.equals( "germplasm_clone" ) ) {
                populateGermplasmClone( conn, id );
            } else if ( type.equals( "germplasm" ) ) {
                populateGermplasm( conn, id );
            } else if ( type.equals( "aa_sequence" ) ) {
                populateAASequenceGene( conn, id );
            } else if ( type.equals( "array_element" ) ) {
                populateArrayElementGene( conn, id );
            } else if (type.equals( "publication" ) ) {
                populatePublication( conn, id );
            } else {
                populate( conn, id, type );
            } 
        }
    }


    /**
     * Retrieves loci for submitted map element id and stores internally as Locus
     */
    private void populate( DBconnection conn, Long map_element_id, String type ) throws SQLException {
        ArrayList ids = null;
        String query = null;
        ResultSet results = null;

        if ( map_element_id != null ) {
            query = 
                "SELECT m.locus_id "+
                "FROM MapElement_Locus m, Locus l " +
                "WHERE m.locus_id = l.locus_id " +
                "AND l.is_obsolete = 'F' " +
                "AND m.map_element_id = " + map_element_id.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "locus_id" ) ) );
            }
            conn.releaseResources();

            if ( ids != null && !ids.isEmpty() ) {
                createLoci( conn, ids, type );
            }
        }
    }

    /**
     * Specialized population mode that retrieves loci for a clone that is included in 
     * a germplasm's record. For this purpose only, loci are retrieved for genes that are
     * associated to submitted clone's map element id
     */
    private void populateGermplasmClone( DBconnection conn, Long cloneMapElementID ) 
        throws SQLException {

        String query = null;
        ResultSet results = null;
        ArrayList ids = null;

        if ( cloneMapElementID != null ) {
            query = 
                "SELECT l.locus_id " +
                "FROM Gene_MapElement gm, Gene g, MapElement_Locus ml, Locus l " +
                "WHERE gm.gene_id = g.gene_id " +
                "AND g.map_element_id = ml.map_element_id " +
                "AND ml.locus_id = l.locus_id " +
                "AND l.is_obsolete = 'F' " +
                "AND g.is_obsolete = 'F' " +
                "AND gm.map_element_id = " + cloneMapElementID.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "locus_id" ) ) );
            }
            conn.releaseResources();
      
            if ( ids != null && !ids.isEmpty() ) {
                createLoci( conn, ids,"" );
            }
        }
    }

    /**
    * Specialized population mode for retriveing loci for a publication
    * by the associated publication id. 
    *
    * @param conn An active connection to the database
    * @param publicationID Publication id to retreive data for
    * @throws SQLException if a database error occurs
    */
    private void populatePublication( DBconnection conn, Long publicationID )
        throws SQLException {
        
        ArrayList ids = null;
        Long locusID = null;
        String query = "SELECT l.locus_id " +
                       "  FROM TairObj_Ref r, Publication p, Gene g, Gene_MapElement gme, Locus l " +
                       " WHERE r.tair_object_id = g.tair_object_id " +
                       "   AND g.gene_id = gme.gene_id " +
                       "   AND gme.map_element_id = l.map_element_id " +
                       "   AND g.is_obsolete = 'F' " +
                       "   AND r.reference_id = p.reference_id " +
                       "   AND p.publication_id = ? " +
                       " UNION " +
                       "SELECT mel.locus_id " +
                       "  FROM TairObj_Ref r, Publication p, Gene g, MapElement_Locus mel " +
                       " WHERE r.tair_object_id = g.tair_object_id " +
                       "   AND g.map_element_id = mel.map_element_id " +
                       "   AND g.is_obsolete = 'F' " +
                       "   AND r.reference_id = p.reference_id " +
                       "   AND p.publication_id = ? " +
                       " UNION " +
                       "SELECT l.locus_id " +
                       "  FROM TairObj_Ref r, Publication p, Locus l " +
                       " WHERE r.tair_object_id = l.tair_object_id " +
                       "   AND l.is_obsolete = 'F' " +
                       "   AND r.reference_id = p.reference_id " +
                       "   AND p.publication_id = ? ";

        conn.setQuery( query );
        conn.setQueryVariable(1, publicationID);
        conn.setQueryVariable(2, publicationID);
        conn.setQueryVariable(3, publicationID);
        ResultSet results = conn.getResultSet();
        while(results.next()){
            if(ids == null)
                ids = new ArrayList();
            ids.add(new Long(results.getLong("locus_id")));
        }
        conn.releaseResources();
        
        if (ids != null && !ids.isEmpty() ){
            createLoci(conn, ids, "");
        }
    }
    
    /**
     * Specialized population mode for retrieving loci for a germplasm by
     * retrieving loci associated to polymorphisms associated to germplasm.  
     * Final list of loci should contain distinct loci that are indirectly
     * related to germplasm
     *
     * @param conn An active connection to the database
     * @param germplasmID Germplasm id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    private void populateGermplasm( DBconnection conn, Long germplasmID ) 
        throws SQLException {

        ArrayList polyIDs = null;
        String query = null;
        ResultSet results = null;

        // get map element ids for all polymorphisms associated 
        // to germplasm
        query = "SELECT p.map_element_id " +
            "FROM Polymorphism p, Germplasm_MapElement gm " +
            "WHERE p.map_element_id = gm.map_element_id " +
            "AND p.is_obsolete = 'F' " +
            "AND gm.germplasm_id = " + germplasmID.toString();
        conn.setQuery( query );

        results = conn.getResultSet();
        while ( results.next() ) {
            if ( polyIDs == null ) {
                polyIDs = new ArrayList();
            }
            polyIDs.add( new Long( results.getLong( "map_element_id" ) ) );
        }
        conn.releaseResources();
        
        // get all locus ids associated to any of polymorphism ids
        if ( polyIDs != null && !polyIDs.isEmpty() ) {
            populateMultipleMapElement( conn, polyIDs );
        }
        
    }


    /**
     * Retrieves distinct locus ids associated to multiple map element ids,
     * creates Locus objects for each, and adds to collection.  This is useful 
     * in cases like germplasm population mode where we want all loci for a 
     * group of map element ids associated to another single id
     *
     * @param conn An active connection to the database
     * @param mapElementIDs List of map element ids to retrieve loci for
     * @throws SQLException if a database error occurs
     */
    private void populateMultipleMapElement( DBconnection conn,
                                             List mapElementIDs ) 
        throws SQLException {

        StringBuffer query = new StringBuffer();
        query.append( "SELECT l.locus_id " +
                      "FROM Locus l, MapElement_Locus ml " +
                      "WHERE l.locus_id = ml.locus_id " +
                      "AND l.is_obsolete = 'F' " +
                      "AND ml.map_element_id IN (" );
        
        Iterator iter = mapElementIDs.iterator();
        boolean firstID = true;
        while ( iter.hasNext() ) {
            if ( !firstID ) {
                query.append( ", " );
            }
            firstID = false;
            query.append( (Long) iter.next() );
        }
        query.append( ") " );
        
        ArrayList locusIDs = null;
        Long locusID = null;

        conn.setQuery( query.toString() );
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( locusIDs == null ) {
                locusIDs = new ArrayList();
            }
            
            locusID = new Long( results.getLong( "locus_id" ) );
            if ( !locusIDs.contains( locusID ) ) {
                locusIDs.add( locusID );
            }
        }
        conn.releaseResources();
        
        if ( locusIDs != null && !locusIDs.isEmpty() ) {
            createLoci( conn, locusIDs, "" );
        }
    }
    

    /**
     * Specialized population mode for retrieving loci for an aa sequence's 
     * gene(s). Objects will be created to include AGI map info. on locus's 
     * representative gene model.  This data can then be used by aa sequence 
     * detail page to present links to seq viewer for locus
     */
    private void populateAASequenceGene( DBconnection conn, Long geneMapElementID ) 
        throws SQLException {

        ArrayList ids = null;
        String query = null;
        ResultSet results = null;
        Iterator iter = null;
        Locus locus = null;

        if ( geneMapElementID != null ) {
            query = 
                "SELECT l.locus_id " +
                "FROM MapElement_Locus ml, Locus l " +
                "WHERE ml.locus_id = l.locus_id " +
                "AND l.is_obsolete = 'F' " +
                "AND ml.map_element_id = " + geneMapElementID.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "locus_id" ) ) );
            }
            conn.releaseResources();

            if ( ids != null && !ids.isEmpty() ) {
                createLoci( conn, ids, "" );
                // get specialized data for aa sequence detail page
                populateRepGeneModelData( conn ); 
            }
        }
    }

   // Specialized population mode for retrieving gene for an arrayelemnt  
    private void populateArrayElementGene( DBconnection conn, Long geneMapElementID ) 
        throws SQLException {

        ArrayList ids = null;
        String query = null;
        ResultSet results = null;
        Iterator iter = null;
        Locus locus = null;

        if ( geneMapElementID != null ) {
            query = 
                "SELECT l.locus_id " +
                "FROM MapElement_Locus ml, Locus l " +
                "WHERE ml.locus_id = l.locus_id " +
                "AND l.is_obsolete = 'F' " +
                "AND ml.map_element_id = " + geneMapElementID.toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "locus_id" ) ) );
            }
            conn.releaseResources();

            if ( ids != null && !ids.isEmpty() ) {
                createLoci( conn, ids, "" );
                // get specialized data for array element detail page
                populateRepGeneModelForArrayElement(conn);
            }
        }
    }

    /**
     * utility method to create Locus objects from list of locus ids
     */
    private void createLoci( DBconnection conn, List ids, String type ) 
    throws SQLException {
        Iterator iter = null;
        Locus locus = null;
        iter = ids.iterator();
        while ( iter.hasNext() ) {
            locus = new Locus( conn, (Long) iter.next() );
            if (type.equals ("with_symbols") ){
                locus.populatePrimarySymbolData( conn );
            }
            add( locus );
        }
    }
    
    /**
     * Retrieves specific info. for representative gene model of each locus
     * in collection. This data must be populated explicitly to avoid overhead
     * of retrieving data when it's not needed.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateRepGeneModelForArrayElement( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        Locus locus = null;
        
        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                locus = (Locus) iter.next();
                locus.populateRepGeneModelForArrayElement( conn );
            }
        }
    }


    /**
     * Retrieves specific info. for representative gene model of each locus
     * in collection. This data must be populated explicitly to avoid overhead
     * of retrieving data when it's not needed.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateRepGeneModelData( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        Locus locus = null;
        
        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                locus = (Locus) iter.next();
                locus.populateRepGeneModelData( conn );
            }
        }
    }

    /**
     * Determines if collection has loci in it or not
     *
     * @return <code>true</code> if collection has no loci in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { 
        return loci.isEmpty(); 
    }


    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
        return loci.size(); 
    }

    /**
     * Retrieve element object at supplied index
     *
     * @return element at supplied index, or <code>null</code> if no 
     *  element at supplied index
     */
    public Locus elementAt( int index ) { 
        return (Locus) loci.get( index ); 
    }


    /**
     * Adds supplied element to collection
     * 
     * @param locus Element to add to collection
     */
    public void add( Locus locus ) { 
        loci.add( locus ); 
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param locus Element to remove from collection
     */
    public void remove( Locus locus ) { 
        loci.remove( locus ); 
    }

    /**
     * Determines if supplied element is in collection or not
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code> if element is not found
     */
    public boolean contains( Locus locus ) { 
        return loci.contains( locus ); 
    }

    /**
     * Retrieve all elements in collection
     *
     * @return All loci in collection as an <code>Iterator</code> of <code>Locus</code>
     * objects, or <code>null</code> if no loci in collection
     */
    public Iterator iterator() { 
        return !loci.isEmpty() ? loci.iterator() : null; 
    }



    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** LocusCollection content test ******" );
        if ( !isEmpty() ) {
            Iterator iter = iterator();
            Locus locus = null;
            while ( iter.hasNext() ) {
                locus = (Locus) iter.next();
                locus.test();
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
            Long id = new Long( 1011766 );
            LocusCollection loci = new LocusCollection( conn, id );
            loci.test();

            System.out.println( "\nPopulating germplasm mode..." );
            id = new Long( 133241 );
            loci = new LocusCollection( conn, id, "germplasm" );
            loci.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }

}
