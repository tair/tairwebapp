/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * GeneModelLite presents minimal information on a gene record;
 * this class is used for display on search results pages, where 
 * a listing of associated genes is shown for each search result.
 * This class is used to avoid the overhead of more heavyweight objects
 * such as org.tair.querytools.GeneModel which contains many attributes that 
 * aren't needed.
 *
 * <p>
 * GeneModelLite contains a collection of associated loci; this collection 
 * is not regularly populated through object's constructor, but must be
 * populated through the populateLocus() method. This is to allow flexibility
 * of including associated locus information without requiring that it
 * be retrieved every time, even if current display context does not need the
 * information.
 *
 * <p>
 * GeneModelLite also contains chromosome values for gene's assignments onto
 * AGI map.  These values must also be explicitly populated, since they
 * are not needed on every page.
 *
 * <p>
 * Implements Serializable so GeneModelLite objects can be written as
 * part of serialized stock catalog data
 *
 */


public class GeneModelLite implements Serializable {

    // loci associated to gene - stored as Locus
    private LocusCollection loci;

    private String name;
    private Long tairObjectID;
    private Long mapElementID;
    private Long geneID;
    private String chromosome;
    private String description;
    private boolean isObsolete;

    // chromosome values from AGI map assignments -- needed for creating
    // valid links to seq viewer
    private String[] agiChromosomes;
  
    // gene aliases -- needed for displaying gene info. 
    // in ABRC stock catalog; aliases stored as TfcGeneAlias
    // objects.  Collection must be populated explicitly using
    // populateAliases method(s)
    private GeneAliasCollection aliases;

    // some kinds of aliases are now symbols
    private Collection<TfcSymbol> symbols;

    /**
     * Creates an instance of GeneModelLite that reflects the data referenced
     * by submitted geneID
     *
     * @param conn An active connection to the database
     * @param geneID Gene id to retrieve data for
     * @exception SQLException thrown if a database error occurs, or if no
     * gene model found with submitted id
     */
    public GeneModelLite( DBconnection conn, Long geneID ) throws SQLException {
        if ( geneID != null ) {
            populate( conn, geneID );
        }
    }

    // get basic info from Gene table, then if record found, get  AGI map info.
    private void populate( DBconnection conn, Long geneID ) throws SQLException {
        String query = null;
        ResultSet results = null;
        boolean found = false;
    
        query = 
            "SELECT gene_id, " +
            "map_element_id, " +
            "tair_object_id, " +
            "name, " +
            "description, " +
            "chromosome, " +
	    "is_obsolete " +
            "FROM Gene " +
            "WHERE gene_id = " + geneID.toString();
        conn.setQuery( query );
        results = conn.getResultSet();
        if ( results.next() ) {
            found = true;
            setTairObjectID( new Long( results.getLong( "tair_object_id" ) ) );
            setDescription( results.getString( "description" ) );
            setMapElementID( new Long( results.getLong( "map_element_id" ) ) );
            setGeneID( new Long( results.getLong( "gene_id" ) ) );
            setName( results.getString( "name" ) );
            setChromosome( results.getString( "chromosome" ) );
	    if ( "t".equalsIgnoreCase(results.getString( "is_obsolete" )) ) {
		setIsObsolete(true);
	    } else {
		setIsObsolete(false);
	    }

        }
        conn.releaseResources();

        if ( !found ) {
            throw new RecordNotFoundException( "No gene found with gene id: " + geneID );
        }


    }


    public String getName() { return name; }
    public Long getTairObjectID() { return tairObjectID; }
    public Long getMapElementID() { return mapElementID; }
    public Long getGeneID() { return geneID; }
    public String getChromosome() { return chromosome; }
    public String getDescription() { return description; }
    public boolean getIsObsolete() { return isObsolete; }

    public void setName( String name ) { this.name = name; }
    public void setTairObjectID( Long id ) { this.tairObjectID = id; }
    public void setMapElementID( Long id ) { this.mapElementID = id; }
    public void setGeneID( Long id ) { this.geneID = id; }
    public void setChromosome( String chromosome ) { this.chromosome = chromosome; }
    public void setDescription( String descr ) { this.description = descr; }
    public void setIsObsolete( boolean isObsolete ) { this.isObsolete = isObsolete; }
  

    /**
     * Populates gene's list of chromosomes from assignments onto AGI map. This is 
     * done separately from constructor since it is not always needed and the
     * overhead required to retrieve the data would be wasted effort. This
     * method assumes basic gene information has already been populated
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public void populateAGIChromosomes( DBconnection conn ) throws SQLException {
        this.agiChromosomes = TfcMapElement.getAGIChromosomes( conn, getMapElementID() );
    }


    /**
     * Determines if gene is mapped onto the AGI map by checking
     * whether object contains any chromosome values from AGI assignments
     *
     * @return <code>true</code> if gene has an assignment on AGI map,
     * or <code>false</code> if no assignment exists for gene on AGI map
     */
    public boolean isAGIMap() {
        return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }

    /**
     * Retrieves list of chromosomes from gene's assignments onto
     * AGI map. This list is needed for creating hyperlinks to display element
     * in seq viewer, which can only display elements w/AGI map assignments, and
     * which can only display sequences on a single chromosome at a time. This list
     * should be used to create multiple links to seq viewer if gene has multiple
     * chromosomes (see utility method HTMLFactory.createSeqViewerLinks() for more
     * info on how this list is used to create hyperlinks
     *
     * @return List of chromosomes from gene's assignments onto AGI map as
     * a String array, or <code>null</code> if no assignments onto AGI map found
     * for gene
     */
    public String[] getAGIChromosomes() {
        return agiChromosomes;
    }


    /**
     * Populates gene's collection of associated loci. This is done separately
     * from constructor since locus information is not always needed and the
     * overhead required to create the collection would be wasted effort. This
     * method assumes basic gene information has already been populated
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public void populateLocus( DBconnection conn, String flag ) throws SQLException {
        System.out.println("gene model lite populate locus : " + flag);
        if (flag.equals("with_symbols") ){
            this.loci = new LocusCollection ( conn, mapElementID, flag );
        } else {
            this.loci = new LocusCollection( conn, mapElementID );
        }
    }
    public void populateLocus( DBconnection conn ) throws SQLException {
        this.loci = new LocusCollection( conn, mapElementID );
    }


    /**
     * Determines if gene has associated loci
     *
     * @return <code>true</code> if gene has associated loci,
     * or <code>false</code> if gene has no associated loci
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves all loci associated to gene
     * 
     *@return Loci associated to gene as an <code>Iterator</code> of
     * <code>Locus</code> objects or <code>null</code> if no loci
     * associated to gene
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
    }


    /**
     * Populates gene's collection of gene aliases
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateGeneAliases( DBconnection conn ) throws SQLException {
        this.aliases = new GeneAliasCollection( conn, getGeneID() );
    }

    /**
     * Populates gene's collection of gene aliases to contain only aliases
     * whose alias type is one of submitted alias types.
     *
     * @param conn An active connection to the database
     * @param aliasTypes Alias types to retrieve
     * @throws SQLException if a database error occurs
     */
    public void populateGeneAliases( DBconnection conn, String[] aliasTypes ) throws SQLException {
        this.aliases = new GeneAliasCollection();
        aliases.populateAliasTypes( conn, getGeneID(), aliasTypes );
    }

    /**
     * Retrieves gene aliases for gene
     * 
     *@return Gene aliases associated to gene as an <code>Iterator</code> of
     * <code>TfcGeneAlias</code> objects or <code>null</code> if no gene aliases
     * associated to gene
     */
    public Iterator getGeneAliases() {
        return hasGeneAliases() ? aliases.iterator() : null;
    }

    /**
     * Determines if gene has associated gene aliases
     *
     * @return <code>true</code> if gene has associated gene aliases
     * or <code>false</code> if gene has no associated gene aliases
     */
    public boolean hasGeneAliases() {
        return ( aliases != null && !aliases.isEmpty() );
    }

    /**
     * Sorts gene aliases for gene using the submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting gene aliases
     */
    public void sortGeneAliases( Comparator comparator ) {
        aliases.sort( comparator );
    }

    /**
     * Populates gene's collection of symbols
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateSymbols( DBconnection conn ) throws SQLException {
        this.symbols = TfcGeneSymbolReference.symbols_for_gene( conn, getGeneID() );
    }

    /**
     * Retrieves symbols for gene
     * 
     *@return Symbols associated to gene as a <code>Collection</code> of
     * <code>TfcSymbol</code> objects or <code>null</code> if no symbol
     * associated to gene
     */
    public Collection<TfcSymbol> getSymbols() {
        return hasSymbols() ? this.symbols : null;
    }

    /**
     * Determines if gene has associated symbols
     *
     * @return <code>true</code> if gene has associated symbols
     * or <code>false</code> if gene has no associated symbols
     */
    public boolean hasSymbols() {
        return ( symbols != null && !symbols.isEmpty() );
    }

    /**
     * Sorts symbols for gene using the submitted Comparator. 
     *
     * @param comparator Comparator to use for sorting symbols
     */
    public void sortSymbols( Comparator comparator ) {
	this.symbols = new ArrayList(symbols);
	Collections.sort( (ArrayList) symbols,  comparator );
    }

    


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "name: " + getName() );
        System.out.println( "tair object id: " + getTairObjectID() );
        System.out.println( "map element id: " + getMapElementID() );
        System.out.println( "gene id: " + getGeneID() );
        System.out.println( "chromosome: " + getChromosome() );
        System.out.println( "description: " + getDescription() );
        if ( hasLocus() ) {
            Iterator iter = getLocus();
            TfcLocus locus = null;
            while ( iter.hasNext() ) {
                locus = (TfcLocus) iter.next();
                locus.test();
	    }
        }

        if ( hasGeneAliases() ) {
            Iterator iter = getGeneAliases();
            TfcGeneAlias alias = null;
            while ( iter.hasNext() ) {
                alias = (TfcGeneAlias) iter.next();
                alias.test();
            }
        }

	if ( hasSymbols() ) {
	    Collection<TfcSymbol> symbols = getSymbols();
	    for ( TfcSymbol symbol : symbols ) {
		symbol.test();
	    }
	}
    }

}
