// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import org.apache.oro.text.perl.Perl5Util;
import org.tair.querytools.GeneModel;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGeneClassSymbol;
import org.tair.utilities.TextConverter;

/**
 * Do the Gene class symbol related search
 * 1> search GeneClassSymbol table for a given gene class symbol name
 * 2> search GeneAlias table for a gene class symbol name to see this name exits (starts  * with symbol followed by some digits)
 * 3> search for a locus
 * This seach may be called from two source : when user want to submit a symbol, this saercher
 * checks 1> and 2>; when user wants to associate locus to the sybmol, it checks 3>
 * The search result is stored in a HashMap (type to arraylist of ids) 
 */

public class GeneSymbolSearcher {
    
    private String search_from;
    private String search_term;
    private String search_terms;
    private String next_page ;
    private HashMap  searchResults = null;
    
    public GeneSymbolSearcher () {
	searchResults = new HashMap();
    }

    public GeneSymbolSearcher( String where, String what ){
	searchResults =  new HashMap (); 
        search_from = where;
        if (search_from.equals("symbol")){
            search_term = what ;
        }else if (search_from.equals("locus")){
            search_terms = what ;
        }
    }
    
     
    /**
      * return an HashMap of type <code>TfcTairObject</code>s
      */ 
    public HashMap search(DBconnection conn) throws SQLException  {
        if ( search_from.equals ("symbol") ){
           
	        searchGeneSymbolTable(conn);
            searchGeneTable (conn);
   
	    if ( searchResults.size() > 0 ){
		    next_page = "/jsp/processor/genesymbol/symbol_exists.jsp" ;  
	    } else {
		    next_page = "/jsp/processor/genesymbol/symbol_registration.jsp" ;
	    } 
	   
	    }else if ( search_from.equals ("locus") ){
            Vector locus_names = new Vector();
            Perl5Util util = new Perl5Util();
	        locus_names = util.split ("/;/", search_terms);
	    
            ArrayList loci = new ArrayList ();	
            for (int i = 0; i< locus_names.size(); i++){
		        search_term = ((String)locus_names.get(i)).toUpperCase();
                searchLocusTable (conn, loci) ;
            }
            if (loci.size()>0){
		searchResults.put("locus",loci );
            }
            next_page = "/jsp/processor/genesymbol/select_loci.jsp" ;  
          
        }
        
        return ( !searchResults.isEmpty() ) ? searchResults : null ;
        
    }
    /**
     * Search Gene Sysmol class table to see if a symbol is existing
     * and store the search result in  searchResults 
     */
    private void  searchGeneSymbolTable (DBconnection conn) throws SQLException{
       ArrayList ids = new ArrayList(); 
       ArrayList  objects = new ArrayList ();
       String query = 
           "SELECT tair_object_id " +
	   "FROM GeneClassSymbol " +
	   "WHERE not status = 'obsolete' " + 
       "AND symbol=" + TextConverter.dbQuote( search_term.toUpperCase() ) ;
      
       conn.setQuery( query); 
       ResultSet results = conn.getResultSet();
       while ( results.next() ) {
           ids.add(new Long(results.getLong( "tair_object_id")));
       } 
       conn.releaseResources();
       if (ids.size() < 1){ return ; }
       for (int i = 0; i < ids.size(); i++) {
	  objects.add(new TfcGeneClassSymbol( conn, (Long)ids.get(i)));
       }
      
       searchResults.put("symbol",objects );
       
    }
   
     /**
     * Search Gene and GeneNameAlias table to see if a symbol exists, where
     * existence is defined as there being a gene name alias with the proposed
     * symbol as the first characters followed by any other characters and
     * there not being a gene name alias with the symbol as the first characters
     * followed by at least one upper-case letter. Store the search result in  
     * searchResults.
     */
  private void searchGeneTable(DBconnection conn) throws SQLException {
    ArrayList<Long> ids = new ArrayList<Long>();
    ArrayList<GeneModel> objects = new ArrayList<GeneModel>();
    String query =
      "SELECT DISTINCT gene_id "
          + "FROM GeneNameAlias "
          + "WHERE name like "
          + TextConverter.dbQuote(search_term.toUpperCase() + "%")
          + " ESCAPE '\\\' AND NOT REGEXP_LIKE(name, "
          + TextConverter.dbQuote(search_term.toUpperCase() + "[[:upper:]]")
          + ") AND name_type = 'symbol' ";

    conn.setQuery(query);
    ResultSet results = conn.getResultSet();

    while (results.next()) {
      ids.add(new Long(results.getLong("gene_id")));
    }

    conn.releaseResources();
    if (ids.size() < 1) {
      return;
    }
    for (int i = 0; i < ids.size(); i++) {
      GeneModel model = null;
      model = new GeneModel(conn, (Long)ids.get(i));
      model.populateAliases(conn);
      model.populateSymbols(conn);
      objects.add(model);
    }
    searchResults.put("gene", objects);
  }

     /**
     * Search Gene and LocusNameAlias table to see if a list loci are  existing
     * and store the search result in  searchResults 
     */
   
    private void  searchLocusTable (DBconnection conn , ArrayList loci) throws SQLException{
	ArrayList ids = new ArrayList(); 

	String query = 
	    "SELECT locus_id " +
	    "FROM LocusNameAlias " +
	    "WHERE name=" + TextConverter.dbQuote( search_term ) ;
     
	conn.setQuery( query); 
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    ids.add(new Long(results.getLong( "locus_id")));
	} 

	conn.releaseResources();
       
        if (ids.size() < 1){ return ; }
	for (int i = 0; i < ids.size(); i++) {
	    loci.add(new GeneSymbolLocus( conn, (Long)ids.get(i)));
	}

    }
    /**
     */
    public String getNextPage (){
        return next_page;
    }
    
}
