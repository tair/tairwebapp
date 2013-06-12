/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/** 
 * GeneAliasCollection is a custom collection that stores all gene aliases
 * for a gene as a collection of <code>TfcGeneAlias</code> objects. 
 *
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */ 

public class GeneAliasCollection implements Serializable {
    private ArrayList aliases;

    /**
     * Creates an empty instance of GeneAliasCollection
     */
    public GeneAliasCollection() {
        aliases = new ArrayList();
    }

    /**
     * Creates an instance of GeneAliasCollection that contains gene aliases
     * for submitted gene id. Gene aliases stored as <code>TfcGeneAlias</code>
     * objects
     *
     * @param conn An active connection to the database
     * @param gene_id Gene id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public GeneAliasCollection( DBconnection conn, Long gene_id ) throws SQLException {
        aliases = new ArrayList();
        if ( gene_id != null ) {
            populate( conn, gene_id, true );
        }
    }
    
    public GeneAliasCollection( DBconnection conn, Long gene_id, boolean show_symbol )
    throws SQLException { 
        aliases = new ArrayList();
        if (gene_id != null ) { 
            populate( conn, gene_id, show_symbol );
        }
    }
    
    // retrieve gene alias ids for gene id and create TfcGeneAlias objects for each
    private void populate( DBconnection conn, Long gene_id, boolean show_symbol ) throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList ids = null;

        query =
            "SELECT gene_alias_id " +
            "FROM GeneAlias " + 
            "WHERE is_obsolete = 'F' " +
            "AND gene_id = " + gene_id.toString();
        if (show_symbol == false){
            query = query + " AND not alias_type = 'symbol' ";
        }

        conn.setQuery( query );
        results = conn.getResultSet();                  
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "gene_alias_id" ) ) );
        }
        conn.releaseResources();

        if ( ids != null && !ids.isEmpty() ) {
            createAliasObjects( conn, ids );
        }
    }

    /**
     * Custom population method that only retrieves gene aliases of submitted
     * types for submitted gene id. This is helpful in situations where only 
     * certain alias types are desired, and we don't want to waste resources
     * retrieving types not needed.
     *
     * @param conn An active connection to the database
     * @param gene_id Gene id to retrieve aliases for
     * @param aliasTypes Alias types to retrieve
     * @throws SQLException if a database error occurs
     */
    public void populateAliasTypes( DBconnection conn, Long gene_id, String[] aliasTypes ) 
        throws SQLException {

        StringBuffer query = null;
        ResultSet results = null;
        ArrayList ids = null;

        query = new StringBuffer();
        query.append( "SELECT gene_alias_id " +
                      "FROM GeneAlias " + 
                      "WHERE is_obsolete = 'F' " +
                      "AND gene_id = " + gene_id.toString() + " " );

        query.append( "AND alias_type IN (" );
        for ( int i = 0; i < aliasTypes.length; i++ ) {
            if ( i > 0 ) {
                query.append( ", " );
            }
            query.append( TextConverter.dbQuote( aliasTypes[ i ] ) );
        }
        query.append( ") " );

        conn.setQuery( query.toString() );
        results = conn.getResultSet();                  
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "gene_alias_id" ) ) );
        }
        conn.releaseResources();

        if ( ids != null && !ids.isEmpty() ) {
            createAliasObjects( conn, ids );
        }
    }

    /**
     * Utility method to create alias objects from submitted list of gene_alias_ids
     */
    private void createAliasObjects( DBconnection conn, List ids ) throws SQLException {
        Iterator iter = ids.iterator();
        while ( iter.hasNext() ) {
            add( new TfcGeneAlias( conn, (Long) iter.next() ) );
        }
    }
     

    /**
     * Retrieves a gene's GeneClassSymbol alias that matches the submitted symbol. 
     * as a TfcGeneAlias object
     */
    public TfcGeneAlias getGeneClassSymbolAlias( String symbol) {
        TfcGeneAlias alias = null;
    
        if ( symbol== null || isEmpty() ) {
            return null;
        }
     
        Iterator iter = iterator(); 
        if (iter == null){ return  null;}
 
        while ( iter.hasNext() ) {
            alias = (TfcGeneAlias) iter.next();
            if ( isGeneClassSymbolAlias( alias , symbol )   ) {
                return alias;
            }
        }
        return null;
 
    } 
    /** 
     * to determine a GeneAlias is a GeneClassSymbol alias
     * it has to meet these two criteria: startsWith symbol and all digits follow the symbol
     */ 
    private boolean isGeneClassSymbolAlias(TfcGeneAlias alias , String symbol){
        String aliasName  =  alias.get_alias();
        
        if ( ! aliasName.startsWith (symbol)){ return false ;}
        
        for (int index = symbol.length();index < aliasName.length(); index++){
            if (! Character.isDigit(aliasName.charAt(index))){
                return false;
            }
        } 
       
        return true;
    }

    /**
     * Retrieves all gene aliases that have an alias type that matches submitted type. 
     *
     * @return Aliases of submitted type as an <code>Iterator</code>
     * of <code>TfcGeneAlias</code> objects, or <code>null</code> 
     * if submitted type is <code>null</code> or if no gene aliases
     * of requested type exist in collection
     */
    public Iterator getAliases( String type ) {
        ArrayList tmpAliases = null;
        Iterator iter = null;
        TfcGeneAlias alias = null;
    
        if ( type != null && !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                alias = (TfcGeneAlias) iter.next();
                if ( type.equals( alias.get_alias_type() ) ) {
                    if ( tmpAliases == null ) {
                        tmpAliases = new ArrayList();
                    }
                    tmpAliases.add( alias );
                }
            }
            iter = null; // reset to return null if no results
        }
        
        if ( tmpAliases != null && !tmpAliases.isEmpty() ) {
            iter = tmpAliases.iterator();
        }
    
        return iter;
    }


    /**
     * Retrieves all gene aliases that have an alias type that matches any of submitted types.
     *
     * @return Aliases of submitted types as an <code>Iterator</code>
     * of <code>TfcGeneAlias</code> objects, or <code>null</code> 
     * if submitted types are <code>null</code> or if no gene aliases
     * of requested types exist in collection
     */  
    public Iterator getAliases( String[] types ) {
        ArrayList tmpAliases = null;
        Iterator iter = null;
        TfcGeneAlias alias = null;
    
        if ( types != null && types.length > 0 && !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                alias = (TfcGeneAlias) iter.next();
                boolean keep = false;
                for ( int i = 0; i < types.length; i++ ) {
                    if ( types[ i ].equals( alias.get_alias_type() ) ) {
                        keep = true;
                        break;
                    }
                }
        
                if ( keep ) {
                    if ( tmpAliases == null ) {
                        tmpAliases = new ArrayList();
                    }
                    tmpAliases.add( alias );
                }
            }
            iter = null; // reset to return null if no results
        }

        if ( tmpAliases != null && !tmpAliases.isEmpty() ) {
            iter = tmpAliases.iterator();
        }
        return iter;
    }

  

    /**
     * Determines if collection has elements in it or not
     *
     * @return <code>true</code> if collection has no elements in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return aliases.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return aliases.size(); }

    /**
     * Retrieves element at supplied index as a <code>TfcGeneAlias</code> object
     *
     * @return Element at supplied index, or <code>null</code> if no element at supplied index
     */
    public TfcGeneAlias get( int index ) { return (TfcGeneAlias) aliases.get( index ); }


    /**
     * Adds supplied element to collection
     * 
     * @param alias Element to add to collection
     */
    public void add( TfcGeneAlias alias ) { aliases.add( alias ); }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param alias Element to remove from collection
     */
    public void remove( TfcGeneAlias alias ) { aliases.remove( alias ); }

    /**
     * Determines if supplied element is in collection
     *
     * @param alias Element to check
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( TfcGeneAlias alias ) { return aliases.contains( alias ); }

    /**
     * Retrieves all elements in collection
     *
     * @return All elements in collection as an <code>Iterator</code> of <code>TfcGeneAlias</code>
     * objects, or <code>null</code> if no elements in collection
     */
    public Iterator iterator() { return ( !aliases.isEmpty() ) ? aliases.iterator() : null; }


    /**
     * Sorts gene aliases in collection using the submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting gene aliases
     */
    public void sort( Comparator comparator ) {
        Collections.sort( aliases, comparator );
    }



  
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GeneAliasCollection content test ******" );

        if ( !isEmpty() ) {
            Iterator iter = iterator();
            TfcGeneAlias alias = null;
            while ( iter.hasNext() ) {
                alias = (TfcGeneAlias) iter.next();
                alias.test();
            }
        }
        System.out.println( "****** GeneAliasCollection content test ******" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 26971 );
            GeneAliasCollection aliases = new GeneAliasCollection( conn, id );
            aliases.test();

        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}

  








