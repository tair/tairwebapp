//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/05/18 21:01:04 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGene;
import org.tair.tfc.TfcLocus;
import org.tair.tfc.TfcMapElement;
import org.tair.tfc.TfcSymbol;

/**
 * Locus is a composite class that extends <code>TfcLocus</code>
 * to present detailed information about a locus, usually for display
 * in a band as part of a larger detail page.
 */

public class Locus extends TfcLocus {

    // AGI chromosome mappings for locus's representative gene model
    private String[] agiChromosomes;

    // a list of all associated genes' primary symbols
    private ArrayList<Long> primarySymbols;
    private String symbolDisplay;

    // tair object id of representative gene model
    private Long repTairObjectID;

    private String repGeneDescription = null ;
    private String repGeneName = null ;
    private Long repGeneID = null ; 
    /**
     * Creates an empty instance of Locus
     */
    public Locus() {
        super();
    }

    /**
     * Creates an instance of Locus that reflects the data referenced by
     * submitted locus_id
     *
     * @param conn An active connection to the database
     * @param locus_id Locus id to retrieve data for
     * @exception SQLException thrown if a database error occurs
     */
    public Locus( DBconnection conn, Long locus_id ) throws SQLException {
        super( conn, locus_id );
    }

    /**
     * Retrieves specific info. for locus's representative gene model including
     * tair object id and chromosomes from AGI mapping - this data
     * can then be used to create seq viewer links for locus.  This data must be
     * populated explicitly using this method to minimize overhead in object creation
     * when data is not needed.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateRepGeneModelData( DBconnection conn ) throws SQLException {
        // representative gene model id is stored as map_element_id of gene - use
        // to get agi chromosome mappings and tair object id for creating valid links to seq viewer
        Long repID = get_rep_genemodel_id();
       
        this.agiChromosomes = TfcMapElement.getAGIChromosomes( conn, repID );    
        this.repTairObjectID = TfcMapElement.get_super_id( conn, repID );
    }

    /**
    * Retrieves specific info. for locus's primary Symbols. This is calculated by 
    * taking all genes associated to the locus and looking up their primary
    * symbols. If the different associated genes have different primary symbols
    * then multiple symbols will be found. Most of the time this will only be
    * one
    * 
    * @param conn An active connection to the database
    * @throws SQLException if a database error occurs
    */
    public void populatePrimarySymbolData( DBconnection conn ) throws SQLException { 
        primarySymbols = new ArrayList();
        GeneModelCollection genes = new GeneModelCollection( conn, get_locus_id(), "locus" ); 
        if (genes != null) {
          Iterator iter = genes.iterator();
          while (iter != null && iter.hasNext()) {
            TfcGene gene = (TfcGene)iter.next();
            if (!primarySymbols.contains(gene.get_primary_symbol_id())) {
              primarySymbols.add(new Long(gene.get_primary_symbol_id()));
            }
          }
        }        
        
        String slink = "";
        Iterator symbolIter = getPrimarySymbols();
        while (symbolIter.hasNext() ){
            Long symbol_id = (Long) symbolIter.next();
            if (symbol_id != 0 ) { 
                TfcSymbol sym = new TfcSymbol(conn, symbol_id);
                if (sym.get_symbol() != null ) { 
                    slink = slink + sym.get_symbol();
                }
                if (sym.get_full_name() != null ) {
                    slink = slink + "/ " + sym.get_full_name();
                }
            }
        } 
        System.out.println("display : " + symbolDisplay);
        symbolDisplay = slink;  
    }   
    
    /**
     * Retrieves specific info. for locus's representative gene model including
     * name , description - This data must be
     * populated explicitly using this method to minimize overhead in object creation
     * when data is not needed.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateRepGeneModelForArrayElement( DBconnection conn ) throws SQLException {
        Long repGeneMapElementID = get_rep_genemodel_id();
        this.repGeneID =   TfcGene.retrieveGeneIDUsingMapElementID ( conn, repGeneMapElementID ) ;
        this.repGeneDescription = TfcGene.retrieveDescription( conn, repGeneID );    
        this.repGeneName = TfcGene.retrieveGeneName( conn, repGeneID );
        
    }

    /**
     * Sets AGI chromosome mapping(s) for locus's representative gene model
     */
    public void setAGIChromosomes( String[] chr ) { this.agiChromosomes = chr; }

    /**
     * Retrieves AGI chromosome mapping(s) for locus's representative gene model. This
     * info. can then be used to create valid links to seq viewer for locus
     */
    public String[] getAGIChromosomes() { return agiChromosomes; }

    public Iterator getPrimarySymbols() { return primarySymbols.iterator(); } 
    
    public String getSymbolDisplay() { return symbolDisplay; }
    /*
     * Sets tair object id for locus's representative gene model. 
     */
    public void setRepresentativeTairObjectID( Long id ) { this.repTairObjectID = id; }

    /**
     * Retrieves tair object id for locus's representative gene model. This
     * info. can then be used to create valid links to seq viewer for locus
     */
    public Long getRepresentativeTairObjectID() { return repTairObjectID; }

    /**
     * Determines if seq viewer link can be made for locus by checking whether
     * locus's representative gene model has AGI chromosome mappings
     *
     * @return <code>true</code> if representative gene model is on AGI map,
     * or <code>false</code> if no AGI mapping exists for locus's representative
     * gene model.
     */
    public boolean isAGIMap() {
        return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }
    public Long getRepGeneId (){
        return  repGeneID != null ? repGeneID : null ;
    }
   
    public String getRepGeneName (){
        return  repGeneName != null ? repGeneName : "";
    }
    
    public String getRepGeneDescription (){
        return  repGeneDescription != null ? repGeneDescription : "";
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** Locus content test ******" );
        super.test();

        if ( isAGIMap() ) {
            System.out.println( "**agi chromosomes** " );
            String[] chr = getAGIChromosomes();
            for ( int i = 0; i < chr.length; i++ ) {
                System.out.println( chr[ i ] );
            }
        }

        System.out.println( "rep tair object id: " + getRepresentativeTairObjectID() );
        System.out.println( "****** Locus content end ******" );
    }
    

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 26629 );
            Locus locus = new Locus( conn, id );
            locus.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}




