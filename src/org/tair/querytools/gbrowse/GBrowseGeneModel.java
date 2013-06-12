//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
//------------------------------------------------------------------------------
package org.tair.querytools.gbrowse;

import java.sql.*;
import java.util.*;

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

public class GBrowseGeneModel extends TfcGene {
  
    // symbols for gene - stored as TfcSymbol
    private Collection<TfcSymbol> symbols;

    /**
     * Creates an empty instance of GeneModel
     */ 
    public GBrowseGeneModel() { 
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
    public GBrowseGeneModel( DBconnection conn, Long gene_id ) throws SQLException {
        super( conn, gene_id );
        populateSymbols(conn);
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
      
}
  
