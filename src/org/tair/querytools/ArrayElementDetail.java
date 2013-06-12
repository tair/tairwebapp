//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2005/01/08 00:27:33 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcArrayElement;
import org.tair.tfc.TfcDnaFragment;
import org.tair.tfc.TfcMapElementType;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.RecordNotFoundException;

/**
 * ArrayElementDetail is a composite class to represent all information
 * associated with an entry in the ArrayElement table for display on the
 * array element detail page. ArrayElementDetail contains array element 
 * info, associated locus infor, sequences infor, asscioacted array design
 * info, associated expression sets infor 
 */

public class ArrayElementDetail extends TairObjectDetail {
    private TfcArrayElement arrayelement ;
    private LocusCollection loci; 
    private String mapElementType ;
    // for table name in "DnaFragment" and "Unknown", we need the sequence object
    private NucleotideSeqCollection  sequences ; 
    // for table_name ="clone", we need genbankAccession
    private ArrayList genbankAccessions ; 

    // flag to record whether ArrayElement has data in Expression Viewer -
    // this is used to determine whether to show a link to viewer when displaying 
    // AFGC element data
    private boolean hasViewerData = false;
    
    //has expression set or not, this is to determine if ont he detail page, to display
    //the  get button under "Expression Results using Default Search (?)" or not
    
    private boolean hasExpressionResult = false ;
    
    protected ArrayDesignCollection arrayDesigns ;
    protected ArrayElementExpressionSetCollection presentExpressionSets;
    protected ArrayElementExpressionSetCollection expressedExpressionSets;
    // the arraydesing platform this array element has. One array element can only have one type of 
    // arry desing platform 
    private String arrayDesignPlatformType;    

    private TfcTaxon taxon ;

    public ArrayElementDetail(  ){}
   

   /**
     * Creates an instance of ArrayElementDetail to represent all data referenced
     * by submitted arrayelement id.
     *
     * @param conn An active connection to the database
     * @param arrayelement_id Arrayelement id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public ArrayElementDetail( DBconnection conn, Long arrayelement_id )
	throws RecordNotFoundException, SQLException {

	get_information( conn, arrayelement_id );
    }

   /**
     * Creates an instance of ArrayElementDetail to represent all data referenced
     * by submitted arrayelement name.
     *
     * @param conn An active connection to the database
     * @param name Arrayelement name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public ArrayElementDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }

    /**
     * Populate object by retrieving all data associated to submitted
     * arrayelement name
     *
     * @param conn An active connection to the database
     * @param name Arrayelement name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {
        
	Long arrayelementID = TfcArrayElement.retrieveArrayElementID( conn, name );

	if ( arrayelementID == null ) {
	    throw new RecordNotFoundException( "No arrayelement found with " +
					       "with name: " + name );
	}
	get_information( conn, arrayelementID );
    }

    /**
     * Populate object by retrieving all data associated to submitted
     * arrayelement id.
     *
     * @param conn An active connection to the database
     * @param arreyelement_id Arrayelement id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public  void get_information( DBconnection conn, Long arrayelement_id ) 
	throws RecordNotFoundException, SQLException {  
        arrayDesignPlatformType =  TfcArrayElement. arrayDesignPlatformType( conn, arrayelement_id );              
        populateArrayElementCommInfor ( conn, arrayelement_id );
        populateTaxon( conn, arrayelement_id);	
        // super class will get counts only
        populateArrayDesigns (  conn, arrayelement_id );
        populatePresentExpressionSets ( conn, arrayelement_id );
        populateExpressedExpressionSets ( conn, arrayelement_id );
        // populate superclass data
	getTairObjectInformation( conn );
    }

    // populate the common array element information
    // includes TfcArrayElement, Loci, sequences, SUIDs, mapelementtype 
    // and check if array element has viewerdata
    private void populateArrayElementCommInfor ( DBconnection conn, Long arrayelement_id ) 
	throws RecordNotFoundException, SQLException {
	arrayelement = new TfcArrayElement( conn, arrayelement_id );
        if ( get_map_element_id() != null ) {
	    loci = new LocusCollection( conn, get_map_element_id(), "array_element" );
        }
        if ( get_table_name().equalsIgnoreCase("clone" ) ){
            populateGenbankAccessions( conn ,arrayelement_id); 
        }else{
            if ( get_map_element_id() != null ){
		sequences =  new NucleotideSeqCollection( conn, get_map_element_id() , false);
            }
        }

	// check if element has data to display in AFGC expression viewer. Only
	// check for AFGC elements to avoid expensive query against results table
	if ( arrayelement.isAfgcElement() ) {
	    hasViewerData =  TfcArrayElement.hasViewerData(conn, arrayelement_id );
	}

        hasExpressionResult = checkHasExpressionResult (conn, arrayelement_id );
        populateMapElementType( conn, get_table_name(), arrayelement_id ) ;
    } 

    //populate mapElementType for this array elemment,for table_name "clone" and "unknown", return 
    //TfcMapElementType.typeForTable( table_name), for table_name = "dnaFragment", return the type of the 
    // dnafragment : per request by marga  
    private void populateMapElementType(DBconnection conn, String table_name , Long arrayelement_id)
					 throws RecordNotFoundException, SQLException {
	if ( ! table_name.equalsIgnoreCase( "DnaFragment")){
            mapElementType = TfcMapElementType.typeForTable( get_table_name() );
        }else if ( get_map_element_id() != null ) {
            mapElementType = TfcDnaFragment.retrieveType(conn,get_map_element_id());
	    // if dnafragment type is "pcr_product", display "amplicon";
	    if (mapElementType.equals ("pcr_product")) {
		mapElementType = "amplicon";
            }
        }
    }

    // to check if this array element has expression set result or not
    private boolean checkHasExpressionResult ( DBconnection conn, Long arrayelement_id)  
          throws SQLException {
	boolean hasResult = false;
        String from_table =  arrayDesignPlatformType.equals( "dual") ? "DualChannelHybData" : "SingleChannelHybData" ; 
        String query = " SELECT count(*) " + 
	    " FROM " + from_table + " s " + 
	    " WHERE array_element_id =" + arrayelement_id.toString()+ 
	    ( ! arrayDesignPlatformType.equals("dual") ? " AND s.detection = 'P' " : " "  ) ; 
        conn.setQuery( query ); 
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( results.getInt( 1 ) > 0 ){
		hasResult = true ;
	    }             
        }
	conn.releaseResources();
        return hasResult;
    }

    public String getArrayDesignPlatformType(){
        return  arrayDesignPlatformType ;
    } 

    /**
     * Determines if this array element has expression set associate to it or not
     *
     * @return <code>true</code> if it has expression set, or <code>false</code>
     * if not
     */
    public boolean hasExpressionResult ( ){
        return  hasExpressionResult;
    }   
 
    // populateGeneBankAccesion 
    private void populateGenbankAccessions(DBconnection conn, Long arrayelement_id) 
	throws SQLException {
	
	String query =  "SELECT gen_bank_accession " + 
            "FROM ArrayElementGenBankAcc_wrk " + 
            "WHERE array_element_id = " + arrayelement_id.toString();
    	conn.setQuery( query ); 
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( genbankAccessions == null ){
		genbankAccessions = new ArrayList();
	    } 
	    genbankAccessions.add( results.getString( "gen_bank_accession" ) );
	} 
	conn.releaseResources();
    }

    // populate the taxon of this array element
    // the taxon_id can get from table_name:table_id od this array_element  entry
    private void populateTaxon(DBconnection conn, Long arrayelement_id ) 
       throws RecordNotFoundException, SQLException {
        String primary_key =  lookUpPrimaryKey( get_table_name() );  
        if ( primary_key != null ){ 
	    long taxon_id = 0 ;
	    String query = 
		"SELECT taxon_id " +
		" FROM " + get_table_name() + 
		" WHERE "+  primary_key +"="+ get_table_id();
	    conn.setQuery( query );
	    ResultSet results = conn.getResultSet();
	    while ( results.next() ) {
		taxon_id = results.getLong( "taxon_id" ) ;
	    }
	    conn.releaseResources();
	    if (taxon_id > 0 ){
		taxon =  new  TfcTaxon( conn,new Long( taxon_id) ); 
	    }	
	}
    }

    // look up the primery_key for the table 
    private String lookUpPrimaryKey( String table_name){
        String primaryKey = null ;
        HashMap primaryKeys = new HashMap();
        primaryKeys.put ("Clone", "clone_id"); 
	primaryKeys.put ("DnaFragment", "dna_fragment_id");
        primaryKeys.put ("Unknown", "unknown_id"); 
        
        if (primaryKeys.containsKey(  table_name ) ){
            primaryKey =  (String)primaryKeys.get(table_name);
        } 

        return  primaryKey ;
    }
   
    /**
     * Populate array design data for array element with submitted 
     * array_element_id. Population is done here in a separate method so 
     * that sub-classes can override method to populate array designs using
     * a specific population mode (all, counts only).  Implementation here will
     * create array designs collection in "counts" mode, meaning that only the 
     * number of associated elements for array element will be retrieved, 
     * and that no array design objects will be created
     *
     * @param conn An active connection to the database
     * @param array_element_id Array Elemeny id to retrieve data for
     * @throws SQLException thrown if a database error occurs.
     */
    protected void populateArrayDesigns( DBconnection conn, 
				         Long array_element_id ) 
	throws SQLException {
        arrayDesigns =  new ArrayDesignCollection(conn, array_element_id , "count");
    }
    /**
     * Populate present expession set data for array element with submitted 
     * array_element_id. Population is done here in a separate method so 
     * that sub-classes can override method to populate expression sets using
     * a specific population mode (all, counts only).  Implementation here will
     * create expression set collection in "counts" mode, meaning that only the 
     * number of associated elements for array element will be retrieved, 
     * and that no expression set objects will be created
     *
     * @param conn An active connection to the database
     * @param array_element_id Array Elemeny id to retrieve data for
     * @throws SQLException thrown if a database error occurs.
     */
    protected  void populatePresentExpressionSets ( DBconnection conn, Long arrayelement_id ) 
	throws SQLException {
	presentExpressionSets = new ArrayElementExpressionSetCollection (conn, arrayelement_id, "present_count" );
    }  
    /**
     * Populate expressed expession set data for array element with submitted 
     * array_element_id. Population is done here in a separate method so 
     * that sub-classes can override method to populate expression sets using
     * a specific population mode (all, counts only).  Implementation here will
     * create expression set collection in "counts" mode, meaning that only the 
     * number of associated elements for array element will be retrieved, 
     * and that no expression set objects will be created
     *
     * @param conn An active connection to the database
     * @param array_element_id Array Elemeny id to retrieve data for
     * @throws SQLException thrown if a database error occurs.
     */
    protected  void populateExpressedExpressionSets ( DBconnection conn, Long arrayelement_id ) 
	throws SQLException {
	expressedExpressionSets = new  ArrayElementExpressionSetCollection (conn, arrayelement_id, "expressed_count" );
    }
   
    /**
     * Determines if arrayelement has associated loci
     *
     * @return <code>true</code> if arrayelement has associated loci, or 
     * <code>false</code> if arrayelement has no loci associated to it
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves associated loci for arrayelement
     * 
     * @return Loci associated to arrayelement as an <code>Iterator</code>
     * of <code>Locus</code> objects, or <code>null</code> if no loci
     * associated to arrayelement.
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
    }

    /**
     * Determines if this array element has arraydesigns associate to it or not
     *
     * @return <code>true</code> if it has arraydesigns, or <code>false</code>
     * if not
     */
    public boolean hasArrayDesign() { 
	return  arrayDesigns.size() >  0 ; 
    }
    
    /**
     * Retrieves all arraydesigns associates to this array element
     *
     * @return ArrayDesigns  as an <code>Iterator</code> of <code>TfcArrayDesign</code>
     * objects, or <code>null</code> if no arraydesigns associate to it
     */
    public Iterator getArrayDesigns() {
        return  ! arrayDesigns.isEmpty() ? arrayDesigns.iterator() : null;
    }
  
    /**
     * Determines number of arraydesigns associates to this array element
     *
     * @return Number of arraydesigns
     */
    public int arrayDesignCount () { return arrayDesigns.size(); }

    /**
     * Determines if this array element has present expressionset associate to it or not
     *
     * @return <code>true</code> if it has present expressionsets, or <code>false</code>
     * if not
     */
    public boolean hasPresentExpressionSet() { 
	return  presentExpressionSets.expressionSize() > 0 ; 
    }
    
    /**
     * Retrieves all presentexpressionsets associates to this array element
     *
     * @return expressionSets as an <code>Iterator</code> of <code>TfcExpressionSet</code>
     * objects, or <code>null</code> if no expressinoset associate to it
     */
    public Iterator getPresentExpressionSets() {
        return  !presentExpressionSets.isEmpty() ? presentExpressionSets.iterator() : null;
    }
  
    /**
     * Determines number of present expressionSets associates to this array element
     *
     * @return Number of present expressionSets
     */
    public int presentExpressionSetCount () { return presentExpressionSets.expressionSize(); }

    /**
     * Determines if this array element has expressed expressionset associate to it or not
     *
     * @return <code>true</code> if it has expressed expressionsets, or <code>false</code>
     * if not
     */
    public boolean hasExpressedExpressionSet() { 
	return  expressedExpressionSets.slideSize() > 0 ;  
    }
    
    /**
     * Retrieves all expressed expressionsets associates to this array element
     *
     * @return expressionSets as an <code>Iterator</code> of <code>TfcExpressionSet</code>
     * objects, or <code>null</code> if no expressed expressinoset associate to it
     */
    public Iterator getExpressedExpressionSets() {
        return  ! expressedExpressionSets.isEmpty() ? expressedExpressionSets.iterator() : null;
    }
  
    /**
     * Determines number ofexpressed expressionSets associates to this array element
     *
     * @return Number of expressionSets
     */
    public int expressedExpressionSetCount () { return expressedExpressionSets.slideSize(); }    

    // sequences 
    /**
     * Determines if this array element has nucleotide sequence associate to it or not
     *
     * @return <code>true</code> if it has, or <code>false</code> if not
     */
    public boolean hasNucleotideSequence() { 
	return  sequences != null  && !sequences.isEmpty(); 
    }
    
    /**
     * Retrieves all NucleotideSequences associates to this array element
     *
     * @return nucleotide sequence as an <code>Iterator</code> of <code>TfcNucleotideSequence</code>
     * objects, or <code>null</code> if no nucleotide sequence associate to it
     */
    public Iterator getNucleotideSequences() {
        return  !sequences.isEmpty() ? sequences.iterator() : null;
    }
    
    /**
     * Determines if this array element has genebank accessions asscoiated to it or not
     *
     * @return <code>true</code> if it has, or <code>false</code> if not
     */
    public boolean hasGenbankAccessions() { 
	return  genbankAccessions != null  && genbankAccessions.size()>0; 
    }
    
    /**
     * Retrieves all genebank accessions associates to this array element
     *
     * @return genbank accessions  as an <code>String</code>
     * or <code>null</code> if no genbank accessions associate to it
     */
    public Iterator getGenbankAccessions() {
        return   hasGenbankAccessions() ? genbankAccessions.iterator() : null;
    }
    /**
     * Determines whether array element has data that can be displayed using
     * the AFGC expression viewer. 
     * 
     * @return <code>true</code> if array element has expression viewer data,
     * or <code>false</code> if no expression viewer data for array element
     */   
    public boolean hasViewerData(){
        return hasViewerData;
    } 

    /**
     * Retrieves map element type for array element
     *
     * @return map element type as an <code>String</code> 
     */  
    public String getMapElementType (){
	return mapElementType ;
    } 
     /**
     * Determines whether array element has taxon or not
     * 
     * @return <code>true</code> if array element has taxon data,
     * or <code>false</code> if no taxon data for array element
     */   
    public boolean hasTaxon(){
        return taxon != null;
    } 

    /**
     /**
     * Retrieves taxon information for array element
     *
     * @return taxon as an <code>TfcTaxon</code> object
     * or <code>null</code> if no taxon for array element
     */                 
    public TfcTaxon getTaxon() {
        return hasTaxon() ? taxon : null;
    }
  
    // TfcArrayElement wrapper 
    public Long get_array_element_id() {
        return arrayelement.get_array_element_id();
    }
    public String get_name() {
        return  arrayelement.get_name();
    }   
    public String get_table_name() {
        return arrayelement.get_table_name();
    }
    public Long get_table_id() {
        return  arrayelement.get_table_id();
    }
    public Boolean get_is_control(){
        return arrayelement.get_is_control();
    }
    public Float get_std_error() {
        return  arrayelement.get_std_error();
    }
    public Float get_avg_log_ratio(){
        return  arrayelement.get_avg_log_ratio();
    }
    public Float get_avg_intensity() {
        return  arrayelement.get_avg_intensity();
    } 
    public Float get_avg_intensity_std_err() {
        return  arrayelement.get_avg_intensity_std_err();
    }   
    public Long get_tair_object_id() {
        return  arrayelement.get_tair_object_id() ;
    }
    public Long get_map_element_id() {
        return arrayelement.get_map_element_id();
    }

    public String get_external_id() {
	return arrayelement.get_external_id();
    }

    public String get_manufacturer() {
	return arrayelement.get_manufacturer();
    }

    public boolean isAfgcElement() {
	return arrayelement.isAfgcElement();
    }


}
