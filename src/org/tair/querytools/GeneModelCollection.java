//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2004/04/26 17:03:16 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * GeneModelCollection is a custom collection that stores information on 
 * the association between map elements and genes as a collection of 
 * <code>GeneModel/code> objects. 
 */


public class GeneModelCollection  {   
    private ArrayList<GeneModel> geneModels;


    /**
     * Creates an empty instance of GeneModelCollection
     */
    public GeneModelCollection() {  }


    /*
     * Creates an instance of GeneModelCollection that stores data for the 
     * association between genes and supplied map element id
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public GeneModelCollection( DBconnection conn, Long map_element_id ) 
	throws SQLException {
	populate( conn, map_element_id, "map_element" );
    }


    /**
     * Creates an instance of GeneModelCollection that stores data for the 
     * association between genes and a given object, where type of object 
     * and how genes are retrieved are determined by type. Possible values 
     * of type are:
     * <ul>
     * <li>map_element - id should be map_element_id
     * <li>locus - id should be locus_id
     * <li>aa_sequence - id should be aa_sequence_id
     * <li>germplasm - id should be germplasm_id
     * </ul>
     *
     * Genes are stored as <code>GeneModel</code> objects
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @param type Object type to retrieve genes for
     * @throws SQLException if a database error occurs
     */
    public GeneModelCollection( DBconnection conn, Long id, String type) 
	throws SQLException {
	if ( type.equals( "germplasm" ) ) {
	    populateGermplasm( conn, id );
	} else if (type.equals("publication") ){
        populatePublication(conn, id);
    }else {
	    populate( conn, id, type );
        }
    }


    /**
     * Retrieve gene ids according to type-specific rules, then create full 
     * objects and store internally. 
     */
    private void populate( DBconnection conn, Long id, String type ) 
	throws SQLException {

        String query = null;
        ResultSet results = null;
        ArrayList geneIDs = null;
        Long geneID = null;
        Iterator iter = null;
        GeneModel gene = null;

        // track if retrieving genes through Gene_MapElement table & create
        // objects w/join specific data
        boolean mapElement = false; 

        if ( id != null && type != null ) {
            if ( type.equalsIgnoreCase( "map_element" ) ) {
                mapElement = true;
                query =
                    "SELECT g.gene_id "+
                    "FROM Gene_MapElement m, Gene g " +
                    "WHERE m.gene_id = g.gene_id " +
                    "AND g.is_obsolete = 'F' " +
                    "AND m.map_element_id = " + id.toString();

            } else if ( type.equalsIgnoreCase( "locus" ) ) {
                query = 
                    "SELECT g.gene_id " +
                    "FROM Gene g, MapElement_Locus l " +
                    "WHERE g.map_element_id = l.map_element_id " +
                    "AND g.is_obsolete = 'F' " +
                    "AND l.locus_id = " + id.toString();

            } else if ( type.equalsIgnoreCase( "aa_sequence" ) ) {
                query = 
                    "SELECT g.gene_id " +
                    "FROM Gene_AASequence ga, Gene g " +
                    "WHERE ga.gene_id = g.gene_id " +
                    "AND g.is_obsolete = 'F' " +
                    "AND ga.aa_sequence_id = " + id.toString();
            }
                                                   
            if ( query != null ) {
                conn.setQuery( query );
                results = conn.getResultSet();
        
                while( results.next() ) {
                    if ( geneIDs == null ) {
                        geneIDs = new ArrayList();
                    }
          
                    geneIDs.add( new Long( results.getLong( "gene_id" ) ) );
                }
                conn.releaseResources();
        
                if ( geneIDs != null && !geneIDs.isEmpty() ) {
                    if ( geneModels == null ) {
                        geneModels = new ArrayList();
                    }
          
                    iter = geneIDs.iterator();
                    while ( iter.hasNext() ) {
                        geneID = (Long) iter.next(); 


                        // if populating through Gene_MapElement, create
                        // GeneModel objects to contain join specific data
                        if ( mapElement ) {
                            gene = new GeneModel( conn, geneID, id );
                        } else {
                            gene = new GeneModel( conn, geneID );
                        }
                        geneModels.add( gene );
                    }
                }
            }
        }
    }

    /**
    * For publication get genes associated to this particular publication
    */
    public void populatePublication( DBconnection conn, Long publication_id )
    throws SQLException {
        
        String query = null;
        HashMap ids = null;
        GeneModel gene = null;
        ResultSet results = null;
        Iterator iter = null;
        Long geneID = null;
        
        query = 
            "SELECT g.gene_id FROM TairObj_Ref r, Publication p, Gene g " + 
            "WHERE r.reference_id = p.reference_id " +
            "AND r.tair_object_id = g.tair_object_id " + 
            "AND g.is_obsolete = 'F' " + 
            "AND p.publication_id = " + publication_id;
        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            geneID = new Long( results.getLong( "gene_id" ) );
            gene = new GeneModel(conn, geneID);
            addElement( gene );
        }
    }
    
    /**
     * For germplasm, get genes associated to germplasm indirectly through 
     * polymorphism and clone retrieve gene's id as well as clone or poly's map
     * element id for creating GeneModel object with join info. from 
     * Gene_MapElement
     */
    private void populateGermplasm( DBconnection conn, Long germplasm_id ) 
	throws SQLException {

        String query = null;
        HashMap ids = null;
        GeneModel gene = null;
        ResultSet results = null;
        Iterator iter = null;
        Long geneID = null;
        Long mapElementID = null;

        query =
            "SELECT c.map_element_id, g.gene_id " +
            "FROM Germplasm_MapElement gm, " +
	    "Clone c, " +
	    "Gene_MapElement gnm, " +
	    "Gene g " +
            "WHERE gm.map_element_id = c.map_element_id " +
            "AND c.map_element_id = gnm.map_element_id " +
            "AND gnm.map_element_id = gm.map_element_id " +
            "AND gnm.gene_id = g.gene_id " +
            "AND g.is_obsolete = 'F' " +
            "AND gm.germplasm_id = " + germplasm_id.toString();
        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new HashMap();
            }
            geneID = new Long( results.getLong( "gene_id" ) );
            mapElementID = new Long( results.getLong( "map_element_id" ) );
            ids.put( geneID, mapElementID );
        }
        conn.releaseResources();

        query = 
            "SELECT p.map_element_id, g.gene_id " +
            "FROM Germplasm_MapElement gm, " +
	    "Polymorphism p, " +
	    "Gene_MapElement gnm, " +
	    "Gene g " +
            "WHERE gm.map_element_id = p.map_element_id " +
            "AND p.is_obsolete = 'F' " +
            "AND p.map_element_id = gnm.map_element_id " +
            "AND gnm.map_element_id = gm.map_element_id " +
            "AND gnm.gene_id = g.gene_id " +
            "AND g.is_obsolete = 'F' " +
            "AND gm.germplasm_id = " + germplasm_id.toString();
        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new HashMap();
            }
            // only add gene ids we don't already have from previous query
            geneID = new Long( results.getLong( "gene_id" ) );
            mapElementID = new Long( results.getLong( "map_element_id" ) );
            if ( !ids.containsKey( geneID ) ) {
                ids.put( geneID, mapElementID );
            }
        }
        conn.releaseResources();

        if ( ids != null ) {
            iter = ids.keySet().iterator();
            while ( iter.hasNext() ) {
                geneID = (Long) iter.next();
                mapElementID = (Long) ids.get( geneID );
                gene = new GeneModel( conn, geneID, mapElementID );
                addElement( gene );
            }
        }
    }


    /**
     * Utility method to retrieve tair object ids of genes associated to
     * submitted locus tair object id. This is useful when retrieving 
     * publications for a locus, which are linked to the locus's gene
     * models instead of to the locus itself.
     *
     * @param conn An active connection to the database
     * @param locus_tair_object_id Tair object id of locus to retrieve
     * gene models for
     * @return Tair object ids of gene models associated to locus as an
     * array of Long objects
     * @throws SQLException if a database error occurs
     */
    public static Long[] getLocusGeneModels( DBconnection conn,
					     Long locus_tair_object_id )
	throws SQLException {

	Long[] geneIDs = null;

	String query = 
	    "SELECT g.tair_object_id " +
	    "FROM Gene g, MapElement_Locus ml, Locus l " +
	    "WHERE g.map_element_id = ml.map_element_id " +
	    "AND ml.locus_id = l.locus_id " +
	    "AND g.is_obsolete = 'F' " +
	    "AND l.tair_object_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( locus_tair_object_id );

	ArrayList ids = null;
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "tair_object_id" ) ) );
	}
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {
	    geneIDs = new Long[ ids.size() ];
	    geneIDs = (Long[]) ids.toArray( geneIDs );
	}

	return geneIDs;
    }
					     


    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no elements in it, or 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return ( geneModels == null || geneModels.isEmpty() ); 
    }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return ( geneModels != null ) ? geneModels.size() : 0; 
    }

    
    /**
     * Retrieves elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of 
     * <code>GeneModel</code> objects, or <code>null</code> if no elements 
     * in collection
     */
    public Iterator iterator() {
        Iterator iter = null;
        if ( geneModels != null && !geneModels.isEmpty() ) {
            iter = geneModels.iterator();
        }
        return iter;
    }

    /**
     * Adds submitted element to collection
     *
     * @param gene Element to add
     */
    public void addElement( GeneModel gene ) {
        if ( geneModels == null ) {
            geneModels = new ArrayList();
        }
        geneModels.add( gene );
    }
  
    /**
     * Retrieves element at supplied index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public GeneModel elementAt( int index ) {
        GeneModel gene = null;

        if ( geneModels != null && !geneModels.isEmpty() ) {
            gene = (GeneModel) geneModels.get( index );
        }
        return gene;
    }
    

    /**
     * Returns all gene models in collection except the gene model that has a 
     * map element id that equals the submitted representativeID.  This is to 
     * provide access to all elements in the collection while deliberately 
     * excluding the representative gene model which is presumably being 
     * accessed separately.  If representativeID is <code>null</code> or not 
     * found, all gene models in collection will be returned
     *
     * @param representativeID Map element id of representative gene model which
     * should not be included in returned iterator
     * @return Iterator of all gene models in collection except gene model whose
     * map element id equals representativeID.
     */
    public Iterator iterator( Long representativeID ) {
        ArrayList tmp = null;
        GeneModel tmpGene = null;
        Iterator returnIter = null;
        Iterator iter = null;

        if ( representativeID != null && 
	     geneModels != null && 
	     !geneModels.isEmpty() ) {

            iter = geneModels.iterator();
            while ( iter.hasNext() ) {
                tmpGene = (GeneModel) iter.next();
                if ( !representativeID.equals( 
					      tmpGene.get_map_element_id() ) ) {

                    if ( tmp == null ) {
                        tmp = new ArrayList();
                    }
                    tmp.add( tmpGene );
                }
            }

            if ( tmp != null && !tmp.isEmpty() ) {
                returnIter = tmp.iterator();
            }
        }

        return returnIter;
    }

    
    /**
     * Retrieves all gene models of submitted name type. 
     *
     * @return Gene models of submitted type as an <code>Iterator</code>
     * of <code>GeneModel</code> objects, or <code>null</code> 
     * if submitted type is <code>null</code> or if no gene models
     * of requested type exist in collection
     */
    public Iterator iterator( String type ) {
        ArrayList tmpGenes = null;
        Iterator iter = null;
        GeneModel gene = null;
    
        if ( type != null && !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModel) iter.next();
                if ( type.equals( gene.get_name_type() ) ) {
                    if ( tmpGenes == null ) {
                        tmpGenes = new ArrayList();
                    }
                    tmpGenes.add( gene );
                }
            }
            iter = null; // reset to return null if no results
        }
        
        if ( tmpGenes != null && !tmpGenes.isEmpty() ) {
            iter = tmpGenes.iterator();
        }
    
        return iter;
    }


    /**
     * Retrieves all gene models of submitted types.
     *
     * @return Gene models of submitted types as an <code>Iterator</code>
     * of <code>GeneModel</code> objects, or <code>null</code> 
     * if submitted types are <code>null</code> or if no gene models
     * of requested types exist in collection
     */  
    public Iterator iterator( String[] types ) {
        ArrayList tmpGenes = null;
        Iterator iter = null;
        GeneModel gene = null;
    
        if ( types != null && types.length > 0 && !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModel) iter.next();
                boolean keep = false;
                for ( int i = 0; i < types.length; i++ ) {
                    if ( types[ i ].equals( gene.get_name_type() ) ) {
                        keep = true;
                        break;
                    }
                }
        
                if ( keep ) {
                    if ( tmpGenes == null ) {
                        tmpGenes = new ArrayList();
                    }
                    tmpGenes.add( gene );
                }
            }
            iter = null; // reset to return null if no results
        }

        if ( tmpGenes != null && !tmpGenes.isEmpty() ) {
            iter = tmpGenes.iterator();
        }
        return iter;
    }
  

    /**
     * Returns all gene models in collection except the gene model that has 
     * a map element id that equals the submitted representativeID.  This is
     * to provide access to all elements in the collection while deliberately
     * excluding the representative gene model which is presumably being 
     * accessed separately.  If representativeID is <code>null</code> or not
     * found, all gene models in collection will be returned
     *
     * @param representativeID Map element id of representative gene model 
     * which should not be included in returned iterator
     * @return Iterator of all gene models in collection except gene model 
     * whose map element id equals representativeID.
     */
    public Iterator iterator( Long representativeID, String[] types ) {
        ArrayList tmpGenes = null;
        GeneModel gene = null;
        Iterator returnIter = null;
        Iterator iter = null;

        if ( representativeID != null || 
	     ( types != null && types.length > 0 ) ) {

            iter = iterator();
            if ( iter != null ) {
                while ( iter.hasNext() ) {
                    gene = (GeneModel) iter.next();
                    boolean keep = false;
          
                    // if gene is representative gene model, skip immediately
		    // before checking types
                    if ( representativeID != null && 
			 representativeID.equals( gene.get_map_element_id() ) ) {
                        continue;
                    }
            
                    // check for matching types
                    for ( int i = 0; i < types.length; i++ ) {
                        if ( types[ i ].equals( gene.get_name_type() ) ) {
                            keep = true;
                            break;
                        }
                    }
          
                    if ( keep ) {
                        if ( tmpGenes == null ) {
                            tmpGenes = new ArrayList();
                        }
                        tmpGenes.add( gene );
                    }
                }
                iter = null; // reset to return null if no results
            }
      
            if ( tmpGenes != null && !tmpGenes.isEmpty() ) {
                iter = tmpGenes.iterator();
            }
        }
        return iter;
    }


    /**
     * Finds the representative gene model having supplied map element id in 
     * representativeID. 
     * 
     * @param representativeID Map element id of representative gene model
     * @return Gene model in collection having map element id that equals 
     * representativeID, or <code>null</code> if no gene model found with 
     * submitted map element id
     */
    public GeneModel getRepresentativeGeneModel( Long representativeID ) {
        GeneModel representative = null;
        GeneModel tmp = null;

        if ( representativeID != null && 
	     geneModels != null && 
	     !geneModels.isEmpty() ) {

            Iterator iter = geneModels.iterator();
            while ( iter.hasNext() ) {
                tmp = (GeneModel) iter.next();
                if ( representativeID.equals( tmp.get_map_element_id() ) ) {
                    representative = tmp;
                    break;
                }
            }
        }
        return representative;
    }

    /**
     * Iterates through collection of gene models and populates gene aliases
     * for each object. This is done separately from the object constructor 
     * so that aliases are only retrieved explicitly when they are needed for 
     * display (as in the locus detail page).
     *
     * @param conn An active connection to the database
     */
    public void populateAliases( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        GeneModel gene = null;

        if ( geneModels != null && !geneModels.isEmpty() ) {
            iter = geneModels.iterator();
            while ( iter.hasNext() ) {
                gene = (GeneModel) iter.next();
                gene.populateAliases( conn );
            }
        }
    }


    /**
     * Iterates through collection of gene models and populates the symbol
     * for each object. This is done separately from the object constructor 
     * so that symbols are only retrieved explicitly when they are needed for 
     * display (as in the locus detail page).
     *
     * @param conn An active connection to the database
     */
    public void populateSymbols( DBconnection conn ) throws SQLException {
        if ( geneModels != null && !geneModels.isEmpty() ) {
            for ( GeneModel gene : geneModels ) {
                gene.populateSymbols( conn );
            }
        }
    }


    /**
     * Iterates through collection of gene models and populates loci
     * for each object. This is done separately from the object constructor 
     * so that loci are only retrieved explicitly when they are needed for 
     * display (as in the genetic marker detail page).
     *
     * @param conn An active connection to the database
     */
    public void populateLocus( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        GeneModel gene = null;

        iter = iterator();
        if ( iter != null ) {
            while ( iter.hasNext() ) {
                gene = (GeneModel) iter.next();
                gene.populateLocus( conn );
            }
        }
    }



    /**
     * Iterates through collection of gene models and populates loci
     * for each object. This version of method allows for loci to be
     * created with type specific logic according to submitted type 
     * param.  This is useful on the aa sequence page, for example,
     * where gene's loci must be retrieved along with AGI map info
     * for locus's representative gene model. 
     *
     * @param conn An active connection to the database
     * @param type Population mode to create loci with. See LocusCollection
     * for an explanation of possible values of type
     * @exception SQLException thrown if a database error occurs
     */
    public void populateLocus( DBconnection conn, String type ) 
	throws SQLException {

        Iterator iter = null;
        GeneModel gene = null;

        iter = iterator();
        if ( iter != null ) {
            while ( iter.hasNext() ) {
                gene = (GeneModel) iter.next();
                gene.populateLocus( conn, type );
            }
        }
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GeneModelCollection content test ******" );
        if ( geneModels != null && !geneModels.isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                GeneModel g = (GeneModel) iter.next();
                g.test();
            }
        }
        System.out.println( "**** GeneModelCollection content test end ****" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1000430036 );
            GeneModelCollection genes = new GeneModelCollection( conn, 
								 id, 
								 "locus" );
            genes.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }

}

