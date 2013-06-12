// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.querytools.GeneModel;
import org.tair.querytools.GeneModelCollection;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGeneAlias;
import org.tair.tfc.TfcGeneClassSymbolLocus;
import org.tair.tfc.TfcLocus;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;

/** 
 * GeneSymbolLocus is a composite class that stores GeneSymbolLocus and Locus information
 */

public class GeneSymbolLocus extends TfcLocus {

    private TfcGeneClassSymbolLocus symbolLocus ;
    private TfcGeneAlias alias ;
    // representative gene model for locus
    private GeneModel representative;
     /**
     * Creates an empty instance of GeneSymbolLocus
     */
    public GeneSymbolLocus (){
        symbolLocus = new  TfcGeneClassSymbolLocus();
    }
     /**
     * Creates an instance of GeneSymbolLocus for an given locus_id
     * @param conn An active connection to the database
     * @param locus_id the locus_id the  GeneSymbolLocus created for 
     * @throws SQLException in the case of an invalid operation or database error
     */  
    public  GeneSymbolLocus (DBconnection conn,  Long locus_id  )throws SQLException {
	super ( conn, locus_id);
        symbolLocus = new TfcGeneClassSymbolLocus();
        symbolLocus.set_locus_id(locus_id);
        populateRepGeneModel(conn, locus_id);
        populateAlias (conn );
    }
   
    /**
     * Creates an instance of GeneSymbolLocus for a given locus_id and gene_class_symbol_id
     * @param conn An active connection to the database
     * @param locus_id the locus_id the  GeneSymbolLocus created for 
     @ @param gene_class_symbol_id the gene_class_symbol_id the  GeneSymbolLocus created for 
     * @throws SQLException in the case of an invalid operation or database error
     */
    public GeneSymbolLocus( DBconnection conn, Long gene_class_symbol_id, Long locus_id )  
	throws SQLException{
    	super ( conn, locus_id);
	symbolLocus = new TfcGeneClassSymbolLocus ( conn, gene_class_symbol_id, locus_id );
        populateRepGeneModel(conn, locus_id);
        populateAlias (conn );
    }
    // populate the locus's rep gene model id
    private void  populateRepGeneModel (DBconnection conn,  Long locus_id  ) 
        throws SQLException{
        // populate associated genes and retrieve GeneSymbolAlias
        GeneModelCollection geneModels = new GeneModelCollection( conn, locus_id, "locus" );
        Long repModelID = get_rep_genemodel_id();
        if ( repModelID != null ) {
	// get reference to representative gene model
 	  if ( !geneModels.isEmpty() ) {
	    representative = geneModels.getRepresentativeGeneModel( repModelID );
	  }
        }
       
    }
    // populate the symbol's alias
    private void populateAlias (DBconnection conn ) throws SQLException{
       String symbol= null; 
       if (symbolLocus !=null &&  symbolLocus.get_symbol() !=null ){
	   symbol = symbolLocus.get_symbol();
           if (representative !=null){
	         representative.populateAliases(conn);
             alias = representative.getGeneClassSymbolAlias(symbol);
           } 
       } 
    }

    /**
     * Determines if this GeneSymbolLocus equals to another Object
     * @param symbolObject the Object this GeneSymbolLocus compares to
     * @return true if they are equals , otherwise return false
     */

    public boolean equals( Object symbolLocus){
        GeneSymbolLocus locus = (GeneSymbolLocus)symbolLocus;
        return (locusEquals( locus) &&  geneClassSymbolEquals (locus))? true: false;
    }     
    // to determine if two  GeneSymbolLocus's Locus are equal
    private boolean locusEquals ( GeneSymbolLocus locus){
       
        if (this.get_locus_id()== null && locus.get_locus_id()== null){
	    return true;
        }else if (this.get_locus_id()!=null && locus.get_locus_id()!=null ){
            return this.get_locus_id().equals(locus.get_locus_id());
        }else {
            return false;
        }
    } 
    // to determine  if two  GeneSymbolLocus's gene class symbol are equal
    private boolean geneClassSymbolEquals ( GeneSymbolLocus locus){
       
        if (this.get_gene_class_symbol_id()== null && locus.get_gene_class_symbol_id()== null){
	    return true;
        }else if (this.get_gene_class_symbol_id()!=null && locus.get_gene_class_symbol_id()!=null ){
            return this.get_gene_class_symbol_id().equals(locus.get_gene_class_symbol_id());
        }else {
            return false;
        }
    } 
    /**
     * Get this GeneSymbolLocus 's gene class symbol id
     * @return  the id
     */
    public Long get_gene_class_symbol_id (){
       
	if( symbolLocus.get_gene_class_symbol_id () != null){
	    return symbolLocus.get_gene_class_symbol_id ();
	}else {
            return null;
        }
    }

    public void set_gene_class_symbol_id ( Long id ){
        symbolLocus.set_gene_class_symbol_id (id);
    }
    /**
     * return the GeneClassSymbol's rep gene model as GeneModdel 
     * @return GeneModel
     */
    public GeneModel get_representative_gene_model (){
        return representative;
    }

    /** set this GeneSymbolLocus's alias 
     * 
     */
    // the alias has to be the format : geneclasssymbol (ABCD) followed by digits

    public void set_alias ( TfcGeneAlias value){
        this.alias = value ;
    }

    public  TfcGeneAlias get_alias(){
        return (alias != null) ? alias : null ; 
    }
   
   public String getAliasName(){
        return (alias != null)?alias.get_alias():null;
   }
   
    public Long getAliasId (){
        
	return (alias!=null)?alias.get_gene_alias_id():null;
   }
   /**
   * Retrieves name of locus's representative gene model
   *
   * @return Name for locus's representative gene model, or 
   * <code>null</code> if no representative gene model exists for locus
   */
   public String get_representative_gene_name() {
      return ( representative != null ) ? representative.get_name() : null;
   }
    /**
   * Retrieves gene id for locus's representative gene model
   *
   * @return Gene id for locus's representative gene model, or 
   * <code>null</code> if no representative gene model exists for locus.  
   */
   public Long get_representative_gene_id() { 
     return ( representative != null ) ? representative.get_gene_id() : null; 
   }
    
   public void setTfcGeneSymbolLocus( TfcGeneClassSymbolLocus value){ symbolLocus =  value; }
   public TfcGeneClassSymbolLocus getTfcGeneSymbolLocus () { return  symbolLocus; }

   public void store (DBconnection conn)  throws SQLException, InvalidActionException  {

	symbolLocus.store(conn) ;
        
        // store alias  
        // should this belongs to TfcGeneAlias?
	// no alias
        if ( getAliasName() == null ){ return; }
        
        if ( get_representative_gene_id() == null){
            throw new InvalidActionException( "db storage failed for GeneSymbolLocus " 
                 + getAliasName() + ", " +
		 "gene_id " + get_representative_gene_id()  + " - one or more ids is null" );            
        }  
        boolean exists = rowExists( conn);    
        String query = null;
	if ( !exists ) {
	    query =
		"INSERT INTO GeneAlias ( gene_alias_id, " +
		"alias, " +
		"gene_id, "+
		" alias_type," +
		" original_alias ) " +
		"VALUES ( GENEALIAS_SEQ.NEXTVAL, " +TextConverter.dbQuote( getAliasName()) + ", " +
		get_representative_gene_id() + ", " +
		TextConverter.dbQuote("symbol") + ", " +
		TextConverter.dbQuote( getAliasName()) +  
		")";
		conn.setQuery( query );
		ResultSet  results = conn.getResultSet();
		conn.releaseResources();
	}

    }

    private boolean rowExists( DBconnection conn ) throws SQLException {
	String query = null;
	ResultSet results = null;
	int count = 0;

	query = 
	    "SELECT count(*) AS row_count " +
	    "FROM GeneAlias " +
	    "WHERE gene_id = " + get_representative_gene_id() + " " +
	    "AND alias = " + TextConverter.dbQuote(getAliasName());
     
	conn.setQuery( query );
	results = conn.getResultSet();
	if ( results.next() ) {
	    count = results.getInt( "row_count" );
	}
	conn.releaseResources();

	return ( count > 0 );
    }
 
 }
