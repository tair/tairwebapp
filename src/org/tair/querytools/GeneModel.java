//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.20 $
// $Date: 2004/04/05 22:43:44 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.bs.community.BsAttribution;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * GeneModel extends <code>TfcGene</code> to present complete information
 * about a given gene. In addition to gene data, GeneModel contains collections
 * of nucleotide sequences and attributions associated to the gene. GeneModel 
 * also contains a collection of gene aliases and symbols, loci and amino acid sequences 
 * for the gene; these collections are not populated through the constructor, 
 * but must be explicitly populated through the populateAliases(), 
 * populateLocus() and populateAASequences() methods. This is to minimize the
 * overhead in creating an object instance, so that this data is only retrieved
 * when it is needed for display.
 *
 * <p>
 * GeneModel can be created as an object to reflect a gene in its specific 
 * relation to a given map element id.  If object is constructed with both a gene
 * id and a map element it is associated to, join data from Gene_MapElement table 
 * (i.e. gene feature site, relationship type, etc.) will be populated. If 
 * constructor using only gene id is used, this data will not be populated
 *
 */

public class GeneModel extends TfcGene {
  
    // Nucleotide sequences for this gene - stored as Sequence objects
    private NTSequenceCollection ntSequences;

    // Amino acid sequences for this gene - stored as AASequence objects
    private AASequenceCollection aaSequences;

    // Attributions for this gene - stored as BsAttributions
    private AttributionObjectCollection attributions;

    // default attribution to display (should be where type is 
    // "described by" or "submitted by"
    private BsAttribution default_attribution;

    // gene aliases - stored as TfcGeneAlias
    private GeneAliasCollection aliases;

    // symbols for gene - stored as TfcSymbol
    private Collection<TfcSymbol> symbols;

    // loci for gene - stored as Locus, or Locus if loci populated in 
    // "aa_sequence" mode
    private LocusCollection loci;

    // flag to keep track whether we already looked for default attribution - 
    // try to minimize duplication of work
    private boolean searchedDefault = false;

    // Join info for gene to another map element, if joined to through 
    // Gene_MapElement table
    private TfcGeneMapElement geneMapElement;

    // chromosome values from AGI map assignments -- needed for creating
    // valid links to seq viewer
    private String[] agiChromosomes;


    /**
     * Creates an empty instance of GeneModel
     */ 
    public GeneModel() { 
        super();
    }


    /**
     * Creates an instance of GeneModel that represents data associated
     * to supplied gene id
     *
     * @param conn An active connection to the database
     * @param gene_id Gene id to retrieve data for
     * @throws SQLException if a databaser errors occurs
     */
    public GeneModel( DBconnection conn, Long gene_id ) throws SQLException {
        super( conn, gene_id );
        populate( conn );
    }

    /**
     * Creates an instance of GeneModel that represents data for submitted gene
     * id in its relation to submitted map element id.  Relationship must be found
     * in Gene_MapElement table, or an exception will be thrown.
     *
     * @param conn An active connection to the database
     * @param gene_id Gene id to retrieve data for
     * @param map_element_id Associated map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public GeneModel( DBconnection conn, Long gene_id, Long map_element_id ) 
	throws SQLException {

        super( conn, gene_id );
        geneMapElement = new TfcGeneMapElement( conn, gene_id, map_element_id );
        populate( conn );
    }


 
    /**
     * Get associated data for gene
     */
    private void populate( DBconnection conn ) throws SQLException {
        if ( get_map_element_id() != null ) {
	    ntSequences = new NTSequenceCollection( conn, 
						    get_map_element_id(), 
						    false ); 
        }

	attributions = new AttributionObjectCollection( conn, 
							get_tair_object_id() );
        this.agiChromosomes = 
	    TfcMapElement.getAGIChromosomes( conn, 
					     get_map_element_id() );
    }
    
    //
    // TfcGeneMapElement wrappers
    //

    /**
     * Retrieves map element id gene is associated to
     */
    public Long get_associated_map_element_id() { 
	return ( geneMapElement != null ) ? 
	    geneMapElement.get_map_element_id() : null; 
    }

    /**
     * Retrieves relationship type of gene to associated map element
     */
    public String get_relationship_type() { 
	return ( geneMapElement != null ) ? 
	    geneMapElement.get_relationship_type() : null; 
    }

    /**
     * Retrieves gene feature site of gene on associated map element
     */
    public String get_gene_feature_site() { 
	return ( geneMapElement != null ) ? 
	    geneMapElement.get_gene_feature_site() : null; 
    }

    /**
     * Sets map element id of element gene is associated to
     */
    public void set_associated_map_element_id( Long id ) { 
        createGeneMapElement();
        geneMapElement.set_map_element_id( id ); 
    }

    /**
     * Sets relationship type of gene to associated map element
     */
    public void set_relationship_type( String type ) { 
        createGeneMapElement();
        geneMapElement.set_relationship_type( type ); 
    }
  
    /**
     * Sets gene feature site of gene on associated map element
     */
    public void set_gene_feature_site( String type ) { 
        createGeneMapElement();
        geneMapElement.set_gene_feature_site( type ); 
    }

    // convenience method to create tfc object if it's null
    private void createGeneMapElement() {
        if ( geneMapElement == null ) {
            geneMapElement = new TfcGeneMapElement();
        }
    }
  
    /**
     * Retrieves nucleotide sequences for gene
     *
     * @return Nucleotide sequences for this gene model as an <code>Iterator</code>
     * of <code>Sequence</code> objects, or <code>null</code> if no
     * nt sequences associated with this gene model.
     */ 
    public Iterator get_sequences() {
        Iterator iter = null;
        if ( ntSequences != null && !ntSequences.isEmpty() ) {
            iter = ntSequences.iterator();
        }
        return iter;
    }

    /**
     * Retrieves attributions for gene
     *
     * @return Attributions for this gene model as an <code>Iterator</code> of
     * <code>BsAttribution</code>s, or <code>null</code> if no attributions
     * for this gene model.
     */ 
    public List<BsAttribution> get_attributions() {
      List<BsAttribution> list = null;
        if ( attributions != null && !attributions.isEmpty() ) {
            list = attributions.getAttributions();
        }
        return list;
    }
    
 
    /**
     * Retrieves attribution sources as delimited string
     *
     * @return All sources for attributions in collection as a semicolon delimited string
     * @throws SQLException when can't lazily load community for attribution
     */
    public String get_attribution_source_string() throws SQLException {
        return ( attributions != null ) ? attributions.get_attribution_source_string() : null;
    }
 

    // default attribution for this gene model to "described_by", otherwise
    // use "submitted by" -- per Marga 5.29.02
    private void find_default_attribution() {
        BsAttribution submitted_by = null;
        BsAttribution described_by = null;

        if ( attributions != null && !attributions.isEmpty() ) {
            for (BsAttribution attribution : attributions.getAttributions()) {
                if ( attribution.getType() != null ) {
                    if ( attribution.getType().getAttributionType().equals( "described_by" ) ) {
                        described_by = attribution;
                        break;
                    } else if ( attribution.getType().getAttributionType().equals( "submitted_by" ) ) {
                        submitted_by = attribution;
                    }
                }
            }
        }

        if ( submitted_by != null ) {
            this.default_attribution = submitted_by;
        } else if ( described_by != null ) {
            this.default_attribution = described_by;
        }

        this.searchedDefault = true; // set flag so we don't have to search again
    }
                                       
        
    /**
     * Returns the default attribution source for this gene model.  If gene
     * has attribution of type "described_by", this will be used as default, 
     * otherwise "submitted_by" will be used if it exists.
     *
     * @param Source of "submitted_by" or "described_by" attribution, or 
     * <code>null</code> if no attribution of either type exists
     * @throws SQLException when can't lazily load community for attribution
     */
    public String get_default_attribution_source() throws SQLException {
        String source = null;

        if ( default_attribution == null && !searchedDefault ) {
            find_default_attribution();
        }
    
        if ( default_attribution != null ) {
            source = default_attribution.getCommunity().getName();
        }
        return source;
    }


    /**
     * Returns the default attribution date for this gene model.  If gene
     * has attribution of type "described_by", this will be used as default, 
     * otherwise "submitted_by" will be used if it exists.
     *
     * @param Date of "submitted_by" or "described_by" attribution, or 
     * <code>null</code> if no attribution of either type exists
     */
    public java.util.Date get_default_attribution_date() {
        java.util.Date attrib_date = null;

        if ( default_attribution == null && !searchedDefault ) {
            find_default_attribution();
        }

        if ( default_attribution != null ) {
            attrib_date = default_attribution.getAttributionDate();
        }
        return attrib_date;
    }
  
  
    /**
     * Populates collection of gene aliases for this gene.  This is done
     * separate from the object constructor so that aliases are only retrieved
     * explicitly when they are needed for display (as in the locus detail page).
     * If this method is called when object's gene id is <code>null</code>, 
     * collection will not be initialized.
     *
     * @param conn An active connection to the database
     */
    public void populateAliases( DBconnection conn ) throws SQLException {
        if ( get_gene_id() != null ) {
            aliases = new GeneAliasCollection( conn, get_gene_id() );
        }
    }

    /**
     * @return Gene aliases for this gene as an <code>Iterator</code> of 
     * <code>TfcGeneAlias</code> objects, or <code>null</code> if aliases have
     * not been initialized or if no aliases exist for gene
     */
    public Iterator getAliases() {
        return ( aliases != null && !aliases.isEmpty() ) ? aliases.iterator() : null;
    }

    /**
     * Retrieves all gene aliases for gene model that have an alias 
     * type that matches submitted type. 
     *
     * @return Aliases of submitted type as an <code>Iterator</code>
     * of <code>TfcGeneAlias</code> objects, or <code>null</code> 
     * if submitted type is <code>null</code> or if no gene aliases
     * of requested type exist for gene model
     */
    public Iterator getAliases( String type ) {
        return ( aliases != null && !aliases.isEmpty() ) ? 
	    aliases.getAliases( type ) : null;
    }

  
    /**
     * Populates collection of symbols for this gene.  This is done
     * separate from the object constructor so that symbols are only retrieved
     * explicitly when they are needed for display (as in the locus detail page).
     * If this method is called when object's gene id is <code>null</code>, 
     * collection will not be initialized.
     *
     * @param conn An active connection to the database
     */
    public void populateSymbols( DBconnection conn ) throws SQLException {
        if ( get_gene_id() != null ) {
            symbols = TfcGeneSymbolReference.symbols_for_gene( conn, get_gene_id() );
        }
    }

    /**
     * @return Symbols for this gene as an <code>Iterator</code> of 
     * <code>TfcSymbol</code> objects, or <code>null</code> if symbols have
     * not been initialized or if no aliases exist for gene
     */
    public Collection<TfcSymbol> getSymbols() {
        return ( symbols != null && !symbols.isEmpty() ) ? symbols : null;
    }
      
    /**
     * Retrieves a gene's GeneClassSymbol alias that matches the submitted 
     * symbol. as a TfcGeneAlias
     */
    public TfcGeneAlias getGeneClassSymbolAlias( String symbol) { 
        if ( symbol == null || symbol.equals("") ) { 
	    return null;}
	
        return ( aliases != null && !aliases.isEmpty() ) ? 
	    aliases.getGeneClassSymbolAlias(symbol) : null;
    } 
  
    /**
     * Retrieves all gene aliases for gene model that have an alias 
     * type that matches any of submitted types.
     *
     * @return Aliases of submitted types as an <code>Iterator</code>
     * of <code>TfcGeneAlias</code> objects, or <code>null</code> 
     * if submitted types are <code>null</code> or if no gene aliases
     * of requested types exist for gene model
     */  
    public Iterator getAliases( String[] types ) {
        return ( aliases != null && !aliases.isEmpty() ) ? 
	    aliases.getAliases( types ) : null;
    }

    /**
     * Retrieves all genes aliases for gene as a delimited string
     * 
     * @return All gene aliases for this gene as a semi-colon (";") delimited
     * string, or <code>null</code> if no gene aliases for this gene
     */
    public String get_gene_alias_string() {
        StringBuffer buffer = null;
        String aliases = null;
        Iterator iter = getAliases();
        boolean first = true;

        if ( iter != null ) {
            while ( iter.hasNext() ) {
                TfcGeneAlias gene_alias = (TfcGeneAlias) iter.next();

                String new_alias = gene_alias.get_original_alias();
                if ( new_alias != null && !new_alias.equals( this.get_name() ) ) {
                    if ( buffer == null ) {
                        buffer = new StringBuffer();
                    }
                    if ( !first ) {
                        buffer.append( "; " );
                    }
                    buffer.append( new_alias );
                    first = false;
                }
            }
            if ( buffer != null ) {
                aliases = buffer.toString();
            }
        }
        return aliases;
    }

    /**
     * Retrieves all genes aliases and symbols for gene as a delimited string
     * 
     * @return All gene aliases and symbols for this gene as a semi-colon (";") delimited
     * string, or <code>null</code> if no gene aliases or symbols for this gene exist
     */
    public String get_gene_alias_symbol_string() {
        StringBuffer buffer = new StringBuffer();
        String aliases = get_gene_alias_string();
	Collection<TfcSymbol> symbols = getSymbols();
        boolean first = true;


	if ( aliases != null ) {
	    buffer.append(aliases);
	    first = false;
	}

        if ( symbols != null ) {
            for ( TfcSymbol symbol : symbols ) {

                if ( symbol.get_symbol() != null && !symbol.get_symbol().equals( this.get_name() ) ) {
                    if ( !first ) { buffer.append( "; " ); }
                    buffer.append( symbol.get_symbol() );
                    first = false;
                }

		String full_name = symbol.get_full_name();
		if ( full_name != null && !full_name.equals( this.get_name() ) ) {
                    if ( !first ) { buffer.append( "; " ); }
                    buffer.append( full_name );
                    first = false;
		}
		
            }
            if ( buffer.length() > 0 ) {
                aliases = buffer.toString();
            }
        }
	
        return aliases;
    }

    /**
     * Populates collection of amino acid sequences for this gene.  This is done
     * separate from the object constructor so that aa sequences are only 
     * retrieved explicitly when they are needed for display (as in the locus 
     * detail page). If this method is called when object's gene id is 
     * <code>null</code>, collection will not be initialized.  This method 
     * allows option of retrieving full sequence text for each sequence 
     * along with other data.
     *
     * @param conn An active connection to the database
     * @param getSequence If <code>true</code>, amino acid sequence text will be
     * retrieved for each sequence in the collection; if <code>false</code> all 
     * sequence data except sequence text itself will be retrieved
     * @throws SQLException thrown if a database error occurs
     */
    public void populateAASequences( DBconnection conn, boolean getSequence ) 
	throws SQLException {
        if ( get_gene_id() != null ) {
            aaSequences = new AASequenceCollection( conn, 
						    get_gene_id(), 
						    getSequence );
        }
    }

    /**
     * Retrieves amino acid sequences for gene
     *
     * @return Amino acid sequences for this gene as an <code>Iterator</code> of
     * <code>AASequence</code> objects, or <code>null</code> if aa sequences 
     * have not been initialized or if no aa sequences exist for gene
     */
    public Iterator getAASequences() {
        return ( aaSequences != null && !aaSequences.isEmpty() ) ? 
	    aaSequences.iterator() : null;
    }

    /**
     * Populates collection of associated loci for this gene.  This is done
     * separate from the object constructor so that loci are only retrieved
     * explicitly when they are needed for display (as in the genetic marker
     * detail page). If this method is called when object's map element id is
     * <code>null</code>, collection will not be initialized.
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public void populateLocus( DBconnection conn ) throws SQLException {
        if ( get_map_element_id() != null ) {
            loci = new LocusCollection( conn, get_map_element_id() );
        }
    }

    /**
     * Populates collection of associated loci for this gene. This version 
     * of method allows for loci to be created with type specific logic according 
     * to submitted type param.  This is useful on the aa sequence page, for 
     * example, where gene's loci must be retrieved along with AGI map info
     * for locus's representative gene model.
     *
     * @param conn An active connection to the database
     * @param type Population mode to create loci with. See LocusCollection
     * for an explanation of possible values of type
     * @throws SQLException thrown if a database error occurs
     */
    public void populateLocus( DBconnection conn, String type )
	throws SQLException {

        if ( get_map_element_id() != null ) {
            loci = new LocusCollection( conn, get_map_element_id(), type );
        }
    }


    /**
     * Determines if gene model has associated loci
     *
     * @return <code>true</code> if gene has associated loci, or 
     * <code>false</code> if gene model has no loci associated to it
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves associated loci for gene model
     * 
     * @return Loci associated to gene model as an <code>Iterator</code>
     * of <code>Locus</code> objects, or <code>null</code> if no loci
     * associated to gene model.
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
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
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GeneModel content test ******" );
        super.test();

        if ( attributions != null && !attributions.isEmpty() ) {
           // attributions.test();
        }
        if ( ntSequences != null && !ntSequences.isEmpty() ) {
            ntSequences.test();
        }

        if ( aaSequences != null && !aaSequences.isEmpty() ) {
            aaSequences.test();
        }

        if ( hasLocus() ) {
            loci.test();
        }
	
	System.out.println( "get_gene_alias_symbol_string: " + get_gene_alias_symbol_string() );
        System.out.println( "Is agi map: " + isAGIMap() );
        System.out.println( "**** GeneModel content test end ****" );
    }
  
    /**
     * For unit testing only
     */ 
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long gene_id = new Long( 30256 );
            GeneModel gene = new GeneModel( conn, gene_id );
            gene.populateAliases( conn );
	    gene.populateSymbols( conn );
            gene.populateAASequences( conn, false );
            gene.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
  








