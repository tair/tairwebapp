// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.bs.community.BsAttribution;
import org.tair.querytools.TairObjectDetail;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGeneClassSymbol;

/**
 * GeneClassSymbolDetail is a composite class to represent all information
 * associated with an entry in the GeneClassSymbol table for display on the
 * symbol detail page. 
 */

public class GeneClassSymbolDetail extends TairObjectDetail {
    private TfcGeneClassSymbol symbol;
    private GeneSymbolLocusCollection loci;


    public GeneClassSymbolDetail (){
 	symbol = new TfcGeneClassSymbol ();
    }

    /**
     * Creates an instance of  GeneClassSymbolDetail that represents the data
     * associated to the submitted tair_object_id. <code>RecordNotFoundException</code>
     * thrown if no entry found in GeneClassSymbol for tair_object_id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data
     * @exception SQLException in the case of an invalid operation or database error
     */
    public GeneClassSymbolDetail( DBconnection conn, Long tair_object_id ) throws SQLException {
	if ( tair_object_id != null ){
	    get_information (conn, tair_object_id );    
	}
    }

    
    /**
     * Retrieves data for submitted tair object id and stores in member objects
     * <code>RecordNotFoundException</code> (sub-class of SQLException) thrown if no
     * gene class symbol  found with submitted id
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public void get_information( DBconnection conn, Long tair_object_id ) throws SQLException {
	symbol = new TfcGeneClassSymbol( conn, tair_object_id ); 
	loci = new GeneSymbolLocusCollection( conn, symbol.get_gene_class_symbol_id() );

	// populate superclass
	super.populateBaseObject( symbol );
	getTairObjectInformation( conn );
    }


    /**
     * Empty implementation to satisfy Detail interface
     */
    public void get_information( DBconnection conn, String name ) 
	throws SQLException {
	
    }


    // wrapper around TfcGeneClassSymbol
    
    public void set_gene_class_symbol_id ( Long value ) { symbol.set_gene_class_symbol_id(value); }
    public Long get_gene_class_symbol_id (){ return  symbol.get_gene_class_symbol_id (); }
     
    public void set_tair_object_id(Long value){  symbol.set_tair_object_id(value); }
    public Long get_tair_object_id(){ return  symbol. get_tair_object_id(); }
   
    public void set_symbol(String value){  symbol.set_symbol(value); } 
    public String get_symbol() { return  symbol.get_symbol(); } 

    public void set_descriptive_symbol (String value){  symbol.set_descriptive_symbol(value) ;} 
    public String get_descriptive_symbol() { return  symbol.get_descriptive_symbol();}

    public void set_description (String value){  symbol.set_description(value) ;} 
    public String get_description() { return  symbol.get_description();}
      
    public void set_has_mutant_phenotype ( Boolean value ) {  symbol.set_has_mutant_phenotype(value); }
    public Boolean get_has_mutant_phenotype() { return  symbol.get_has_mutant_phenotype() ; } 

    public void set_mutant_phenotype_class (String value){  symbol.set_mutant_phenotype_class(value);} 
    public String get_mutant_phenotype_class () { return  symbol.get_mutant_phenotype_class() ; }
 
    public void set_comments (String value){  symbol.set_comments( value) ;} 
    public String get_comments () { return  symbol.get_comments () ;  }

    public void set_date_last_modified (java.util.Date value ) {  symbol. set_date_last_modified(value); }
    public java.util.Date get_date_last_modified() { return  symbol.get_date_last_modified(); }
  
    public void set_status ( String value ) {  symbol.set_status(value); }
    public String get_status () { return  symbol.get_status () ; }

    public void set_associated_loci_count(String value){  symbol.set_associated_loci_count(value); }
    public String get_associated_loci_count(){ return  symbol.get_associated_loci_count(); }

    public void set_submitter_info ( String value ) { symbol.set_submitter_info( value ) ; }
    public String get_submitter_info() { return  symbol.get_submitter_info();  }
  
    public void set_all_submitter_names (ArrayList<String> value) { symbol.set_all_submitter_names(value); }
    public ArrayList<String> get_all_submitter_names() {return symbol.get_all_submitter_names(); }

    public void set_all_submitter_ids (ArrayList<BigInteger> value) {symbol.set_all_submitter_ids(value); }
    public ArrayList<BigInteger> get_all_submitter_ids() {return symbol.get_all_submitter_ids(); }
    
    public void set_all_submitter_dates (ArrayList<java.sql.Date> value) { symbol.set_all_submitter_dates(value); }
    public ArrayList<java.sql.Date> get_all_submitter_dates() {return symbol.get_all_submitter_dates(); }
    
    public void set_reservation_date ( java.util.Date value ) { symbol.set_reservation_date( value ); }
    public java.util.Date get_reservation_date() { return symbol.get_reservation_date() ; }
    
    public void set_all_reviewer_ids(ArrayList<BigInteger> value) {symbol.set_all_reviewer_ids(value); }
    public ArrayList<BigInteger> get_all_reviewer_ids() {return symbol.get_all_reviewer_ids(); }

    public void set_all_reviewer_names (ArrayList<String> value) {symbol.set_all_reviewer_names(value); }
    public ArrayList<String> get_all_reviewer_names() {return symbol.get_all_reviewer_names(); }

    public void set_all_reviewer_dates (ArrayList<java.sql.Date> value) {symbol.set_all_reviewer_dates(value); }
    public ArrayList<java.sql.Date> get_all_reviewer_dates() {return symbol.get_all_reviewer_dates(); }



    /**
     * Returns loci as an iterator of GeneSymbolLocus objects
     */
    @SuppressWarnings("unchecked")
    public Iterator getLoci() {
	return ( hasLoci() ) ? loci.iterator() : null;
 
    }

    public boolean hasLoci() {
	return (loci != null && !loci.isEmpty() );
    }
    /**
     * Return the newest  BsAttribution for a GeneClassSymbol for a given attribution type, 
     * @param attributiontype as a String  
     * @return a BsAttribution  
     */
    @SuppressWarnings("unchecked")
    public  BsAttribution getLastAttribution ( String type ){
	Iterator  attrs  = get_attributions(type).iterator();
      
	BsAttribution lastAttr = null ;
        boolean first = true ; 
       
        if(attrs != null ){        
	    while ( attrs.hasNext() ) {
		if ( first ){
		    lastAttr = (BsAttribution) attrs .next(); 
		}else { 
		    BsAttribution thisAttr = (BsAttribution) attrs .next();
		    if ( thisAttr.getAttributionDate().compareTo(lastAttr.getAttributionDate()) > 0 ){
			lastAttr = thisAttr;
		    }
		}
		first  = false ;
	    }
        }
        return lastAttr ;

    }
 
    /**
     * Get the last reviewer BsAttribution for GeneClassSymbol
     */
    
    public  BsAttribution  getLastReviewerAttribution(){
        BsAttribution approver = getLastAttribution("approved_by");
        BsAttribution reviewer = getLastAttribution("reviewed_by");
        
        if( approver!= null &&  reviewer != null){
            return approver.getAttributionDate().compareTo(reviewer.getAttributionDate()) > 0 ? approver: reviewer;   
        } else if (  approver!= null &&  reviewer == null){
            return  approver; 
        } else {
            return reviewer;
        }
 
    }

}
