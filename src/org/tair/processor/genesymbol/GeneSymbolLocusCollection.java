// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/** 
 * GeneSymbolLocusCollection is a custom collection class that stores
 * all loci for a GeneClassSymbol as a collection of <code>GeneSymbolLocus</code>
 * objects.
 */

public class GeneSymbolLocusCollection implements java.io.Serializable {
  private ArrayList loci;
  private Long gene_class_symbol_id ;

  /**
   * Creates an empty instance of LocusCollection
   */
  public GeneSymbolLocusCollection() {
    loci = new ArrayList();
  }
    
  /**
   * Creates an instance of LocusCollection that contains all loci
   * associated to submitted gene_class_symbol_id.  Loci are stored
   * internally as <code>GeneSymbolLocus</code> objects
   *
   * @param conn An active connection to the database
   * @param gene_class_symbol_id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public GeneSymbolLocusCollection( DBconnection conn, Long gene_class_symbol_id ) throws SQLException {
    loci = new ArrayList();
    if ( gene_class_symbol_id != null ) {
      this.gene_class_symbol_id =  gene_class_symbol_id;
      populate( conn, gene_class_symbol_id );
    }
  }


  // Retrieves loci for submitted gene_class_symbol_id and stores internally as GeneSymbolLocus
  private void populate( DBconnection conn, Long gene_class_symbol_id ) throws SQLException {
    ArrayList ids = null;
    String query = null;
    ResultSet results = null;
    Iterator iter = null;
    GeneSymbolLocus locus = null;

    if ( gene_class_symbol_id != null ) {
      query = 
	"SELECT locus_id "+
	"FROM GeneClassSymbol_Locus  " +
	"WHERE gene_class_symbol_id= " + gene_class_symbol_id.toString() ;
	
      conn.setQuery( query );
      results = conn.getResultSet();
      while( results.next() ) {
	if ( ids == null ) {
	  ids = new ArrayList();
	}
	ids.add( new Long( results.getLong( "locus_id" ) ) );
      }
      conn.releaseResources();

      if ( ids != null && !ids.isEmpty() ) {
	iter = ids.iterator();
	while ( iter.hasNext() ) {
	  locus = new GeneSymbolLocus( conn, gene_class_symbol_id, (Long) iter.next() );
	  add( locus );
	}
      }
    }
  }


  /**
   * Determines if collection has loci in it or not
   *
   * @return <code>true</code> if collection has no loci in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return loci.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return loci.size(); }

  /**
   * Retrieve element object at supplied index
   *
   * @return element at supplied index, or <code>null</code> if no element at supplied index
   */
  public GeneSymbolLocus elementAt( int index ) { return (GeneSymbolLocus) loci.get( index ); }

  /**
   * Adds supplied element to collection
   * 
   * @param GeneSymbollocus Element to add to collection
   */
  public void add( GeneSymbolLocus locus ) { 
      if (  !contains(locus) ){
	 
         loci.add( locus );
      }
      
  }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param locus Element to remove from collection
   */
  public void remove( GeneSymbolLocus locus ) { 
      for (int i  = 0; i< size(); i++){
          GeneSymbolLocus symbolLocus  =   (GeneSymbolLocus)elementAt(i);
      
	  if (  symbolLocus.equals(locus) ){
      
	      loci.remove (i);
          } 
      }

  }

  /**
   * Determines if supplied element is in collection or not
   *
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( GeneSymbolLocus locus ) { 
     return loci.contains( locus );
  }

  /**
   * Retrieve all elements in collection
   *
   * @return All loci in collection as an <code>Iterator</code> of <code>TfcLocus</code>
   * objects, or <code>null</code> if no loci in collection
   */
  public Iterator iterator() { return ( !loci.isEmpty() ) ? loci.iterator() : null; }

  public void store (DBconnection conn) throws SQLException, InvalidActionException {
    if ( !isEmpty() ) {
	// remove the previous linkings to locus and all the alias to 
        // locus's representative gene model
      removePreviousLinking ( conn );
      
      Iterator iter = iterator();
      GeneSymbolLocus locus = null;
      while ( iter.hasNext() ) {
	locus = (GeneSymbolLocus) iter.next();
        
	locus.store( conn );
      }
    }
  }


    /**
     * remove all the symbol alias of the prevoius linked locus
     * @param conn An active connection to the database
     * @throws SQLException in the case of an invalid operation or database error 
     */ 

    private void removePreviousLinking (DBconnection conn )throws SQLException{

	ResultSet results = null;
	Iterator iter = null;
	GeneSymbolLocus locus = null;
        ArrayList  ids = new ArrayList();

	if ( gene_class_symbol_id != null ) {
	    String query = 
		"SELECT locus_id "+
		"FROM GeneClassSymbol_Locus  " +
		"WHERE gene_class_symbol_id= " + gene_class_symbol_id.toString() ;
	
	    conn.setQuery( query );
	    results = conn.getResultSet();
	    while( results.next() ) {
		if ( ids == null ) {
		    ids = new ArrayList();
		}
		ids.add( new Long( results.getLong( "locus_id" ) ) );
	    }
	    conn.releaseResources();

	    if ( ids != null && !ids.isEmpty() ) {
		iter = ids.iterator();
		while ( iter.hasNext() ) {
                    Long this_id = (Long) iter.next();
		    locus = new GeneSymbolLocus( conn, gene_class_symbol_id, this_id );
		    if(locus.getAliasId () != null) {
			deleteThisAlias (conn,locus.getAliasId ()  );
		    }
                    deleteThisLocusLinking ( conn, gene_class_symbol_id, this_id );
		}
	    }
	}
    }

    /**
     * delete a alias entry for a given genealais id
     * @param conn An active connection to the database
     * @throws SQLException in the case of an invalid operation or database error 
     */ 
    private void deleteThisAlias (DBconnection conn, Long alias_id  )throws SQLException  {

	if (alias_id !=null){
	    String query = "delete from GeneAlias where gene_alias_id="+
		alias_id ;
	    conn.setQuery( query );
	    int result = conn.executeUpdate();
	    conn.releaseResources();
	}
    }
    /**
     * delete a geneclassysmbol_locus entry for a given locus id and gene_class_symbol_id
     * @param conn An active connection to the database
     * @throws SQLException in the case of an invalid operation or database error 
     */ 
   private void deleteThisLocusLinking ( DBconnection conn,Long gene_class_symbol_id,  Long locus_id  )
          throws SQLException{
      if ( locus_id !=null && gene_class_symbol_id != null ){
          String query = "delete from GeneClassSymbol_Locus where locus_id ="+
	     locus_id  + " AND gene_class_symbol_id=" +gene_class_symbol_id ;
          conn.setQuery( query );
          int result = conn.executeUpdate();
          conn.releaseResources();
      }
   
   }

    /**
     * set gene class symbol id
     * @param gene class symbol id  
     */ 
    public void set_gene_class_symbol_id ( Long gene_class_symbol_id){
	this.gene_class_symbol_id = gene_class_symbol_id;
	for (int i  = 0; i< size(); i++){
	    GeneSymbolLocus locus  = (GeneSymbolLocus)elementAt(i);
	    locus.set_gene_class_symbol_id (gene_class_symbol_id ) ;
	}
  
    }  

    public Long get_gene_class_symbol_id(){
	return gene_class_symbol_id ;
    }
    /**
     * test LocusCollection content
     */
    public void test() {
	
	if ( !isEmpty() ) {
	    Iterator iter = iterator();
	    GeneSymbolLocus locus = null;
	    while ( iter.hasNext() ) {
		locus = (GeneSymbolLocus) iter.next();
		locus.test();
	    }
	}
	
    }

    public static void main( String[] args ) {
	try{

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1011766 ); //for organization_object
	    GeneSymbolLocusCollection loci = new GeneSymbolLocusCollection( conn, id );
	    loci.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}

    }

}
  








