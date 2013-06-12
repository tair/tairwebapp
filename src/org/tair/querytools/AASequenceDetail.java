//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2006/03/21 18:27:15 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * AASequenceDetail is a composite class to represent all information
 * associated with an entry in the AASequence table for display on the
 * amino acid sequence detail page. AASequenceDetail contains AA sequence 
 * info, data on the sequence's associated gene, any loci associated to 
 * that gene, and a collection of protein domain  matches associated to the
 * sequence in addition to all information in the <code>TairObjectDetail</code> 
 * superclass.
 */

public class AASequenceDetail extends TairObjectDetail {

    private TfcAASequence sequence;

    // genes for sequence - stored as GeneModel - each contains loci for gene
    private GeneModelCollection genes;

    // Protein domain matches for sequence - stored as DomainMatch objects
    private DomainMatchCollection domainMatches;
       
    /**
     * Creates an empty instance of AASequenceDetail
     */
    public AASequenceDetail() {  
        sequence = new TfcAASequence();
    }


    /**
     * Creates an instance of AASequenceDetail that represents the data
     * associated to the submitted tair_object_id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public AASequenceDetail( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, tair_object_id );
    }

    /**
     * Creates an instance of AASequenceDetail that represents the data
     * associated to the submitted amino acid sequence name. 
     *
     * @param conn An active connection to the database
     * @param name AA sequence name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public AASequenceDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }

    /**
     * Retrieves data for submitted amino acid sequence name and stores in 
     * member objects
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcAASequence.retrieveTairObjectID( conn, name );
	get_information( conn, id );
    }



    /**
     * Retrieves data for submitted tair object id and stores in member objects
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

	// will throw exception if invalid id
        sequence = new TfcAASequence( conn, tair_object_id, true );
        super.populateBaseObject( sequence );

        genes = new GeneModelCollection( conn, 
					 get_aa_sequence_id(), 
					 "aa_sequence" );

        // get loci for each gene using special "aa sequence" mode that
        // will retrieve rep. gene model info. for each locus
        genes.populateLocus( conn, "aa_sequence" ); 

        domainMatches = new DomainMatchCollection( conn, 
						   get_aa_sequence_id(), 
						   "sequence" );

	// populate superclass data
	getTairObjectInformation( conn );
    }
  
    //
    // TfcAASequence wrappers
    //
    public void set_aa_sequence_id ( Long value ) { 
	sequence.set_aa_sequence_id( value ); 
    }

    public void set_sequence ( String value ) { 
	sequence.set_sequence( value ); 
    }

    public void set_name ( String value ) { 
	sequence.set_name( value ); 
    }

    public void set_type ( String value ) { 
	sequence.set_type( value ); 
    }

    public void set_description ( String value ) { 
	sequence.set_description( value ); 
    }

    public void set_PIR_accession ( String value ) {
	sequence.set_PIR_accession( value ); 
    }

    public void set_genbank_definition ( String value ) { 
	sequence.set_genbank_definition( value ); 
    }

    public void set_is_obsolete ( Boolean value ) { 
	sequence.set_is_obsolete( value ); 
    }

    public void set_genbank_gi ( String value ) { 
	sequence.set_genbank_gi( value ); 
    }

    public void set_genbank_protein_id ( String value ) { 
	sequence.set_genbank_protein_id( value ); 
    }

    public void set_version ( Integer value ) { 
	sequence.set_version( value ); 
    }

    public void set_date_last_modified ( java.util.Date value ) { 
	sequence.set_date_last_modified( value ); 
    }

    public void set_date_made_public ( java.util.Date value ) { 
	sequence.set_date_made_public( value ); 
    }

    public void set_is_experimental ( Boolean value ) { 
	sequence.set_is_experimental( value ); 
    }

    public void set_is_modified ( Boolean value ) { 
	sequence.set_is_modified( value ); 
    }

    public void set_swissprot_id( String id ) { 
	sequence.set_swissprot_id( id ); 
    }  

    public void set_trembl_id( String id ) { 
	sequence.set_trembl_id( id ); 
    }

    public void set_ec_number( String number ) { 
	sequence.set_ec_number( number ); 
    }

    public void set_calc_MW( Float value ) { 
	sequence.set_calc_MW( value ); 
    }

    public void set_calc_pI( Float value ) { 
	sequence.set_calc_pI( value ); 
    }

    public void set_length( Integer value ) { 
	sequence.set_length( value ); 
    }


    public Long get_aa_sequence_id() { 
	return sequence.get_aa_sequence_id(); 
    }

    public String get_sequence() {
	return sequence.get_sequence(); 
    }

    public String get_name() { 
	return sequence.get_name(); 
    }

    public String get_type() { 
	return sequence.get_type(); 
    }

    public String get_description() { 
	return sequence.get_description(); 
    }

    public String get_PIR_accession() {
	return sequence.get_PIR_accession(); 
    }

    public String get_genbank_definition() { 
	return sequence.get_genbank_definition(); 
    }

    public Boolean get_is_obsolete() { 
	return sequence.get_is_obsolete(); 
    }

    public String get_genbank_gi() { 
	return sequence.get_genbank_gi(); 
    }

    public String get_genbank_protein_id() { 
	return sequence.get_genbank_protein_id(); 
    }

    public Integer get_version() { 
	return sequence.get_version(); 
    }

    public java.util.Date get_date_last_modified() { 
	return sequence.get_date_last_modified(); 
    }

    public java.util.Date get_date_made_public() { 
	return sequence.get_date_made_public(); 
    }

    public Boolean get_is_experimental() { 
	return sequence.get_is_experimental(); 
    }

    public Boolean get_is_modified() { 
	return sequence.get_is_modified(); 
    }

    public String get_swissprot_id() { 
    return sequence.get_swissprot_id(); 
      }

    public String get_uniprot_id() { 
    return sequence.get_uniprot_id(); 
      }

    public String get_trembl_id() { 
	return sequence.get_trembl_id(); 
    }

    public String get_ec_number() { 
	return sequence.get_ec_number(); 
    }

    public Float get_calc_MW() { 
	return sequence.get_calc_MW(); 
    }

    public Float get_calc_pI() { 
	return sequence.get_calc_pI(); 
    }

    public Integer get_length() { 
	return sequence.get_length(); 
    }

    public java.util.Date get_date_entered() { 
	return sequence.get_date_entered();
    }
    
    public String get_original_name() { 
	return sequence.get_original_name();
    }


    /**
     * Determines if AA sequence has associated genes
     *
     * @return <code>true</code> if AA sequence has genes, or 
     * <code>false</code> if no genes associated to sequence
     */
    public boolean hasGenes() {
        return ( genes != null && !genes.isEmpty() );
    }


    /**
     * Retrieve genes associated to AA sequence.
     *
     * @return Genes associated to AA sequence as an 
     * <code>Iterator</code> of <code>GeneModel</code> objects
     * or <code>null</code> if no genes for sequence
     */
    public Iterator getGenes() { 
        return ( hasGenes() ) ? genes.iterator() : null;
    }

    /**
     * Retrieves all domain matches associated with AA sequence
     *
     * @return Domain matches for sequence as an <code>Iterator</code>
     * of <code>DomainMatch</code> objects, or <code>null</code> if
     * no domain matches for sequence
     */
    public Iterator getDomainMatches() {
        return hasDomainMatches() ? domainMatches.iterator() : null;
    }
  
    /**
     * Determines if AA sequence has associated domain matches
     *
     * @return <code>true</code> if AA sequence has domain matches, 
     * <code>false</code> if no domain matches for AA sequence
     */
    public boolean hasDomainMatches() {
	return (domainMatches != null && !domainMatches.isEmpty() );
    }

   
    /**
     * get ASPD external link  if AA sequence has one
     * A AASequence object has ASPD link if it's name has this fomat : AT_G___._
     * @return ASPD link as <code>String</code> if AA sequence has ASPD link,  
     *   otherwise, return null
     */
    public String getASPDLink() {
        String base_url = 
        "http://www.plantenergy.uwa.edu.au/applications/suba/flatfile.php?id=";

        String name = get_name().toUpperCase();

        if ( name.startsWith( "AT" ) &&
         name.length() > 3 &&
	     name.charAt( 3 ) == 'G' && 
	     name.indexOf('.') > 0 ){

	    return base_url + name;
        }else {
	    return null;
        }
    }

    /**
     * For unit testing only
     */
    public void test(){
       
        super.test();
        System.out.println( "****** AASequenceDetail content test ******" );
        sequence.test();

        if ( hasGenes() ) {
            genes.test();
        }

        if ( domainMatches != null ) {
            domainMatches.test();
        }

        System.out.println( "**** AASequenceDetail content test end ****" );
    }
  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){
        try{

            DBconnection conn = new DBconnection();

            Long id = new Long( 1007316616 );
            AASequenceDetail sequence = new AASequenceDetail( conn, id );
            sequence.test();

        } catch ( Exception e) {
            e.printStackTrace();
        }
    }
        
}
