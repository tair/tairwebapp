//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2006/03/02 19:54:54 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcBioSample;
import org.tair.tfc.TfcGermplasm;
import org.tair.tfc.TfcProtocol;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.TextConverter;


/**
 * BioSampleObject is a composite class that extends <code>TfcBioSample</code>
 * to present detailed information about a biosample. 
 */


public class BioSampleObject extends TfcBioSample {

    private TfcProtocol protocol;
    private TfcTaxon taxon;
    private TfcGermplasm germplasm;

    // LabeledSampleCollection - stored as LabeledSample objects - collection
    // must be populated explicitly through populateLabeledSamples method
    private LabeledSampleCollection labeledSamples;
  
    // associated environmental condition data - stored as BioSamEnvConObject
    // objects
    private BioSamEnvConObjectCollection envConds;

    // keywords associated to bio sample - stored as BioSampleKeyword objects
    private KeywordCollection keywords;

    /**
     * Creates an empty instance of BioSampleObject
     */         
    public BioSampleObject() {
	super();
    }

    /**
     * Creates an instance of BioSampleObject to reflect data
     * referenced by submitted bio_sample id.
     *
     * @param conn An active connection to the database
     * @param bio_sample_id BioSample id to retrieve data for
     * @throws SQLException if a database error occurs
     */      
    public BioSampleObject( DBconnection conn, Long bio_sample_id ) 
	throws SQLException {

	super( conn, bio_sample_id );
  
	envConds = new BioSamEnvConObjectCollection( conn, bio_sample_id );

	if ( get_taxon_id() != null ) {
	    taxon = new TfcTaxon( conn, get_taxon_id() );
	}
    
	if ( super.get_germplasm_id() != null ) {
	    Long tairObjID = 
		TfcGermplasm.retrieveTairObjectID( conn, get_germplasm_id() );

	    germplasm = new TfcGermplasm( conn, tairObjID );
	}
    
	if ( get_extraction_protocol_ref_id() != null ) {
	    protocol = 
		new TfcProtocol( conn, get_extraction_protocol_ref_id() );
	}

    	keywords = new KeywordCollection( conn, bio_sample_id, "BioSample" );
    }
  

    /**
     * Populates collection of labeled samples for bio sample. This is done
     * separately from constructor to avoid duplication of data in some contexts
     * BioSampleObject is used (in particular in the microarray data loading
     * tools).
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateLabeledSamples( DBconnection conn )
	throws SQLException {

        labeledSamples =
            new LabeledSampleCollection( conn, 
					 get_bio_sample_id(), 
					 "bio_sample" );
    }
    

    //
    // TfcProtocol wrappers 
    //
    public String get_protocol_title() {
	return ( protocol != null ) ? protocol.get_title() : null;
    }

    public Integer get_protocol_pubmed_id() { 
	return ( protocol != null ) ? protocol.get_pubmed_id() : null;
    }

    public String get_protocol_description() { 
	return ( protocol != null ) ? protocol.get_description() : null;
    }

    public String get_protocol_authors() {
	return ( protocol != null ) ? protocol.get_authors() : null; 
    }

    public String get_protocol_usage() {
	return ( protocol != null ) ? protocol.get_usage() : null;
    }

    public String get_protocol_methods() {
	return ( protocol != null ) ? protocol.get_methods() : null;
    }

    public String get_protocol_status() {
	return ( protocol != null ) ? protocol.get_status() : null;
    }

    //
    // TfcTaxon wrappers
    //
    public String get_taxon_original_name() { 
	return ( taxon != null ) ? taxon.get_original_name() : null;
    }

    public String get_genus() { 
	return ( taxon != null ) ? taxon.get_genus() : null;
    }

    public String get_species() {
	return ( taxon != null ) ? taxon.get_species() : null;
    }

    public String get_division_code() { 
	return ( taxon != null ) ? taxon.get_division_code() : null;
    }

    public String get_scientific_name() { 
	return ( taxon != null ) ? taxon.get_scientific_name() : null;
    }

    public String get_common_name() {
	return ( taxon != null ) ? taxon.get_common_name() : null;
    }

    public String get_taxonomy() {
	return ( taxon != null ) ? taxon.get_taxonomy() : null; 
    }

    public String get_genbank_taxonomy_id() { 
	return ( taxon != null ) ? taxon.get_genbank_taxonomy_id() : null;
    }

    //
    // TfcGermplasm wrappers
    //
    public Long get_germplasm_tair_object_id() { 
	return ( germplasm != null ) ? germplasm.get_tair_object_id() : null;
    }

    public String get_germplasm_original_name() { 
	return ( germplasm != null ) ? germplasm.get_original_name() : null;
    }

    public Long get_germplasm_species_variant_id() {
	return ( germplasm != null ) ? 
	    germplasm.get_species_variant_id() : null;
    }

    public String get_germplasm_name() {
	return ( germplasm != null ) ? germplasm.get_name() : null; 
    }

    public String get_germplasm_type() { 
	return ( germplasm != null ) ? germplasm.get_germplasm_type() : null;
    }

    public Boolean get_foreign_dna() {
	return ( germplasm != null ) ? germplasm.get_has_foreign_dna() : null;
    }

    public Boolean get_is_mutant() {
	return ( germplasm != null ) ? germplasm.get_is_mutant() : null;
    }

    public Boolean get_has_polymorphisms() {
	return ( germplasm != null ) ? germplasm.get_has_polymorphisms() : null;
    }

    public Boolean get_is_natural_variant() {
	return ( germplasm != null ) ?
	    germplasm.get_is_natural_variant() : null;
    }

    public Boolean get_is_mapping_strain() {
	return ( germplasm != null ) ? germplasm.get_is_mapping_strain() : null;
    }

    public String get_special_growth_conditions() {
	return ( germplasm != null ) ? 
	    germplasm.get_special_growth_conditions() : null;
    }

    public String get_ploidy() { 
	return ( germplasm != null ) ? germplasm.get_ploidy() : null;
    }

    public String get_mutagen() {
	return ( germplasm != null ) ? germplasm.get_mutagen() : null; 
    }

    public String get_germplasm_description() { 
	return ( germplasm != null ) ? germplasm.get_description() : null; 
    }

    public Boolean get_is_aneuploid() {
	return ( germplasm != null ) ? germplasm.get_is_aneuploid() : null; 
    }

    public Integer get_aneuploid_chromosome() {
	return ( germplasm != null ) ? 
	    germplasm.get_aneuploid_chromosome() : null;
    }
  
    /**
     * Retrieves labeled samples associated to this BioSample object
     *
     * @returns Labeled samples for this BioSample as an <code>Iterator</code>
     * of <code>LabeledSample</code> objects, or <code>null</code> if no
     * labeled samples associated to hyb description
     */
    public Iterator getLabeledSamples() {
	return hasLabeledSamples() ? labeledSamples.iterator() : null;
    }

    /**
     * Determines if at least one labeled sample  has associated labeling 
     *
     * @return <code>true</code> if at least one LabeledSamnple  has labeling 
     * protocol data, or <code>false</code> if no LabeledSample has labeling 
     * protocol.
     */
    public boolean hasLabelingProtocol() {
	return hasLabeledSamples() ? 
	    labeledSamples.hasLabelingProtocol() : false;
    }

    /**
     * Retrieves the unique labeling protocols of LabeledSamples for this 
     * BioSample
     *
     * @return  labeling protocols for this BioSample's LabeledSamples as an 
     * <code>Iterator</code> of <code>TfcProtocol</code>s or <code>null</code>
     * if this BioSample has no LabeledSamnples or the labeledSamples have no 
     * labeling protocols 
     */ 
    public Iterator getLabelingProtocols(){

	Iterator iter = null;
	ArrayList labeling_protocol_ids = new ArrayList();
	ArrayList labeling_protocols  =  new ArrayList();

	if ( hasLabelingProtocol() ){
	    Iterator lsampleIter = getLabeledSamples();
	    while (lsampleIter.hasNext() ){
		LabeledSample lsample =  (LabeledSample) lsampleIter.next();
		if ( lsample.hasProtocol() &&
		     (! labeling_protocol_ids.contains( lsample.get_labeling_protocol_ref_id()) ) ){
		    labeling_protocol_ids.add( lsample.get_labeling_protocol_ref_id() );
		    labeling_protocols.add(lsample.getLabelingProtocol() ); 
		}
	    }
	}
      
	iter =  labeling_protocols.iterator(); 
      
	return iter;
    }

    /**
     * Determines if Sample  has labeled samples associated to it
     *
     * @return <code>true</code> if has labeled samples associated with it, 
     * or <code>false</code> if no 
     */ 
    public boolean hasLabeledSamples() { return ( labeledSamples != null && 
						  !labeledSamples.isEmpty() ); }



    /**
     * JSP helper method to return "reference" or "test" based on value of 
     * is_control flag in superclass.
     * 
     * @return "reference" if is_control flag is <code>true</code>, or "test".
     */
    public String getIsReferenceText() {
	return ( get_is_control() != null && 
		 get_is_control().booleanValue() ) ?

	    "reference" : "test";
    }
  

    /**
     * Determines if bio sample has associated environmental condition data
     *
     * @return <code>true</code> if bio sample has env condition data,
     * or <code>false</code> if no env condition data for biosample
     */ 
    public boolean hasEnvConds() {
	return ( envConds != null && !envConds.isEmpty() ); 
    }

    /**
     * Retrieves environmental conditions for this bio sample
     *
     * @returns <code>Iterator</code> of <code>BioSamEnvConObject</code> objects
     * for this BioSample
     */
    public Iterator getEnvConds() { 
	return hasEnvConds() ? envConds.iterator() : null;
    } 

  
    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the condition value field. This is useful at the JSP level for 
     * determining whether this data column can be excluded or not when 
     * displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all 
     * environmental conditions
     */
    public boolean hasConditionValue() {
	return ( hasEnvConds() ) ? envConds.hasConditionValue() : false;
    }

    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the condition duration field. This is useful at the JSP level for 
     * determining whether this data column can be excluded or not when 
     * displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all 
     * environmental conditions
     */
    public boolean hasConditionDuration() {
	return ( hasEnvConds() ) ? envConds.hasConditionDuration() : false;
    }

    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the application frequency field. This is useful at the JSP level for 
     * determining whether this data column can be excluded or not when 
     * displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all 
     * environmental conditions
     */
    public boolean hasApplicationFrequency() {
	return ( hasEnvConds() ) ? envConds.hasApplicationFrequency() : false;
    }

    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the order number field. This is useful at the JSP level for 
     * determining whether this data column can be excluded or not when 
     * displaying the collection
     *
     * @return <code>true</code> if at least one object has data for this field,
     * or <code>false</code> if this field is <code>null</code> for all 
     * environmental conditions
     */
    public boolean hasOrderNumber() {
	return ( hasEnvConds() ) ? envConds.hasOrderNumber() : false;
    }



    /**
     * Determines if bio sample has associated keywords
     * 
     * @return <code>true</code> if bio sample has associated keywords, or 
     * <code>false</code> if no keywords for bio sample
     */
    public boolean hasKeywords() {
	return ( keywords != null && !keywords.isEmpty() );
    }


    /**
     * Retrieves all keywords associated to this bio sample
     * 
     * @return Keywords associated to bio sample as an <code>Iterator</code>
     * of <code>BioSampleKeyword</code> object, or <code>null</code> if no 
     * keywords found for bio sample
     */
    public Iterator getKeywords() {
	return ( hasKeywords() ) ? keywords.iterator() : null;
    }

    /**
     * Utility method to retrieve all keywords in collection of submitted 
     * keyword type
     */
    private Iterator getKeywordType( String keywordType ) {
	return hasKeywords() ? keywords.getKeywordType( keywordType ) : null;
    }
    
    /**
     * Retrieves all plant structure (formerly anatomy) keywords for bio sample
     *
     * @return Plant structure keywords as an <code>Iterator</code> of 
     * <code>BioSampleKeyword</code> objects, or <code>null</code> if bio sample
     * has no plant structure keywords
     */
    public Iterator getPlantStructureKeywords() {
	return getKeywordType( "plant structure" );
    }

    /**
     * Retrieves all developmental stage keywords for bio sample.
     *
     * @return Developmental stage keywords as an <code>Iterator</code> of 
     * <code>BioSampleKeyword</code> objects, or <code>null</code> if bio sample
     * has no developmental stage keywords
     */
    public Iterator getDevelopmentalStageKeywords() {
	return getKeywordType( "growth and developmental stages" );
    }
    
    /** 
     * get the measurement of biosample as string, when the measurement is 
     * empty in database, return "unknown", this is for the easy display for 
     * jsp page
     *
     *  @return a String 
     */ 
    public String get_measurement (){
	return TextConverter.isEmpty( super.get_measurement () ) ? 
	    "unknown" : super.get_measurement();
    }

 
    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** BioSampleObject content test ******" );

	if ( taxon != null ) {
	    taxon.test();
	}

	if ( germplasm != null ) {
	    germplasm.test();
	}

	if ( protocol != null ) { 
	    protocol.test();
	}

	if ( hasEnvConds() ) {
	    envConds.test();
	}

	if ( hasKeywords() ) {
	    keywords.test();
	}
	System.out.println( "**** BioSampleObject content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 2 );
	    BioSampleObject object = new BioSampleObject( conn, id );
	    object.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}
    }

}
