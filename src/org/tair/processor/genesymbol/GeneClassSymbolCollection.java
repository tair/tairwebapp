// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.math.BigInteger;
import java.sql.*;
import java.util.*;
import java.text.*;
import org.tair.tfc.*;
import org.tair.utilities.*;
import org.tair.querytools.*;

/** 
 * GeneClassSymbolCollection is a collection class that stores
 * all <code>TfcGeneClassSymbol</code> objects.
 */

public class GeneClassSymbolCollection {
    private ArrayList symbols;
   
    /**
     * Creates an empty instance of GeneClassSymbolCollection
     */
    public GeneClassSymbolCollection() {
	symbols= new ArrayList();
    }
    /**
     * Creates an instance of  that GeneClassSymbolCollection contains all GeneClassSymbol
     *
     * @param conn An active connection to the database
     * @throws SQLException in the case of an invalid operation or database error
     */
    public GeneClassSymbolCollection( DBconnection conn) throws SQLException {
	symbols = new ArrayList();
	populate( conn,"all");
    }
    /**
     * Creates an instance of  that GeneClassSymbolCollection contains all GeneClassSymbol
     * that has or not has mutant_pynotype and startswith the given string
     * @param conn An active connection to the database
     * @param String the type of gene class symbol, either "mutant"/"phenotype"/"all"
     * @param String the symbol startsWith 
     * @throws SQLException in the case of an invalid operation or database error
     */
    public GeneClassSymbolCollection( DBconnection conn, String type, String startwith) 
	throws SQLException {
	symbols = new ArrayList();
        if (startwith.equals("ALL")){
	    populate( conn, type); 
        }else {
      	    populate( conn, type, startwith );
        }
    }
   /**
     * Creates an instance of  that GeneClassSymbolCollection contains all GeneClassSymbol
     * that has or not has mutant_pynotype
     * @param conn An active connection to the database
     * @param String the type of gene class symbol, either "mutant"/"phenotype"/"all"
     * @param user_id the submmiter of those symbols
     * @throws SQLException in the case of an invalid operation or database error
     */
    public GeneClassSymbolCollection( DBconnection conn, BigInteger user_id) 
	throws SQLException {
	symbols = new ArrayList();
      	populate( conn, user_id );
    }
  
    /**
     * Creates an instance of  that GeneClassSymbolCollection contains all GeneClassSymbol
     * that need curator review
     * @param conn An active connection to the database
     * @param boolean need revied or not if the symbol status is "await_approval", it needs review
     * @throws SQLException in the case of an invalid operation or database error
     */
    public GeneClassSymbolCollection( DBconnection conn, boolean curator) 
	throws SQLException {
	symbols = new ArrayList();
      	populate( conn, curator );
    }
  
    
    // Retrieves GeneClassSymbols and  stores internally as TfcGeneClassSymbol
    private void populate( DBconnection conn,  BigInteger user_id ) throws SQLException {
       	StringBuffer query = new StringBuffer() ;
        if(user_id != null){
	    query.append( "SELECT gs.tair_object_id  as tair_object_id , symbol  " +
		"FROM GeneClassSymbol gs, Attribution ta , AttributionType aty " +
		"WHERE gs.tair_object_id =  ta.tair_object_id  " +
		"AND ta.attribution_type_id  = aty. attribution_type_id " +
		"AND aty.attribution_type = 'submitted_by' " +
		"AND ta.community_id = " + user_id.toString());
	   
            query.append ( "  and status != 'obsolete'  order by symbol "  );
            populateCollection (conn, query.toString() );           
        }
    }

    // Retrieves GeneClassSymbols and  stores internally as TfcGeneClassSymbol
    private void populate( DBconnection conn, String type,  String startwith ) throws SQLException {
       	StringBuffer query = new StringBuffer() ;
       
	query.append( "SELECT tair_object_id , symbol  " +
		      "FROM GeneClassSymbol where status != 'obsolete' ");
	if ( type.equals("mutant")){
	    query.append( " AND has_mutant_phenotype='T' " );
	}else if ( type.equals("structure") ){
	    query.append(" AND has_mutant_phenotype='F' " );
	}
	if (startwith != null && !startwith.equals("") ){
	    query.append ( " AND symbol like " + "'"+startwith+"%'" );
	}	
	query.append ( " ORDER BY symbol"  );
       
	populateCollection (conn, query.toString() );           
       
    }

    // Retrieves GeneClassSymbols and  stores internally as TfcGeneClassSymbol
    private void populate( DBconnection conn, boolean curator ) throws SQLException {
       
	if (!curator){
	    populate (conn,"");
	}
	else {
	    String  query = 
		"SELECT tair_object_id , symbol "+
		"FROM GeneClassSymbol where ( status ='await_approval' or status='pending') " +
		" order by symbol  ";
	    populateCollection (conn, query);
	}
    }

  
    // Retrieves GeneClassSymbols and  stores internally as TfcGeneClassSymbol
    private void populate( DBconnection conn, String type ) throws SQLException {
      
	StringBuffer  query = new StringBuffer( 
	    "SELECT tair_object_id , symbol "+
	    "FROM GeneClassSymbol  where status != 'obsolete'  " ) ;
	if ( type.equals("mutant")){
	    query.append ( " and has_mutant_phenotype='T' ") ;
	}else if ( type.equals("structure") ){
	    query.append( "  and  has_mutant_phenotype='F' ") ;
	}
        query.append ( " order by symbol "  );	
	populateCollection (conn, query.toString());
    }

    private void populateCollection(DBconnection conn, String query) throws SQLException{
	ArrayList ids = null;
	ResultSet results = null;
	Iterator iter = null;
	TfcGeneClassSymbol symbol = null;
   
	conn.setQuery( query );
	results = conn.getResultSet();
	while( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "tair_object_id" ) ) );
	}
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {
	    iter = ids.iterator();
	    while ( iter.hasNext() ) {
	      symbol = getSymbol(conn, (Long) iter.next());
	      conn.releaseResources();
	      add( symbol );
	    }
	}

    } 

    /**
     * create a TfcGeneClassSymbol for  a given tair_object_id from cache
   
     * @param conn An active connection to the database
     * @param id of  TfcGeneClassSymbol's tair_object_id
     * @throws SQLException in the case of an invalid operation or database error
     * @return a  TfcGeneClassSymbol object
     */  

    private TfcGeneClassSymbol getSymbol(DBconnection conn, Long id) throws SQLException{
	return  new TfcGeneClassSymbol( conn, id );
    }

    /**
     * Determines if collection has GeneclassSymbol in it or not
     *
     * @return <code>true</code> if collection has no GeneClassSymbol in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return symbols.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return symbols.size(); }
    /**
     * Adds supplied element to collection
     * 
     * @param TfcGeneClassSymbol Element to add to collection
     */
    public void add( TfcGeneClassSymbol symbol ) { 
	if (  !contains(symbol) ){
	    symbols.add( symbol );
	}
    }
  
    /**
     * Retrieve all elements in collection
     *
     * @return All TfcGeneClassSymbol in collection as an <code>Iterator</code> of 
     * <code>TfcGeneClassSymbol</code>
     * objects, or <code>null</code> if no class symbol in collection
     */
    public Iterator iterator() { return ( !symbols.isEmpty() ) ? symbols.iterator() : null; }
    /**
     * Determines if supplied element is in collection or not
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( TfcGeneClassSymbol symbol ) { return symbols.contains( symbol ); }
  
    /**
     * get the total number of geneclasssymbols submitted by this user
     * @param community_id 0f the user
     * @throws SQLException in the case of an invalid operation or database error
     * @return int count of symbols submitted by this user
     */ 
    
    public static int numberSymbolsByUser( Long community_id ) throws SQLException {
       
	DatabaseManager connectionPool = null;
	DBconnection conn = null;
	
	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

            String query = "SELECT count(*) as c " +
		"FROM GeneClassSymbol gs, Attribution ta , AttributionType aty " +
		"WHERE gs.tair_object_id =  ta.tair_object_id  " +
		"AND ta.attribution_type_id  = aty.attribution_type_id " +
		"AND aty.attribution_type = 'submitted_by' " +
                "AND gs.status != 'obsolete' " +
		"AND ta.community_id = " + community_id.toString();
	  
	    conn.setQuery( query );
	    ResultSet results = conn.getResultSet();
	    while( results.next() ) {
		return results.getInt("c");
	    }
	    conn.releaseResources();
        } finally {
	    if ( conn != null ) {
		connectionPool.return_connection( conn );
	    }
	} 
	return 0;      
    }

}
