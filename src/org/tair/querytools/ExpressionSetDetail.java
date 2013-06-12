//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.21 $
// $Date: 2005/09/14 15:42:57 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;
import java.util.*;
import java.net.*;

import org.tair.bs.community.BsAttribution;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * ExpressionSetDetail is a composite class to represent all information
 * associated with an entry in the ExpressionSet table for display
 * on the ExpressionSet detail page which displays detail information about 
 * expression sets. ExpressionSetDetail contains instances of 
 * <code>TfcExpressionSet</code>, <code>BioSampleObjectCollection</code> 
 * lists all information pertaining to associated bio samples, and 
 * <code>HybDescriptionObjectCollection</code> lists all information pertaining
 * to associated hyb descriptions.  Information up the hierachy is also 
 * available from <code>TairObjectDetail</code>
 *
 * <p>
 * ExpressionSetDetail has an involved inheritance hierarchy that is designed to
 * address the number of hyb descriptions and bio samples that can be associated
 * to expression set.  Since this number can be so large as to make object 
 * instantiation expensive and slow, as well as to make display overwhelming,
 * this object will automatically create bio sample and hyb description 
 * collections using "count" mode, meaning that the total number of associated 
 * elements will be retrieved, but the individual data objects will not be 
 * created. The initial view of the expression set detail page is this count 
 * view.  If collections were abbreviated, user will see links that allow them 
 * to view all bio samples on a separate page (in which case child class 
 * BioSampleCollectionDetail will be instantiated), or all hyb descriptions on 
 * a separate page (HybDescriptionCollectionDetail will be instantiated) or to 
 * view all info. together on the expression set detail page (in which case
 * child class ExpressionSetFullDetail will be instantiated). This inheritance 
 * scheme is set up to allow TairObject servlet to continue to create objects 
 * generically using the get_information() method - otherwise, we'd have to 
 * either start inserting custom if/else logic in the servlet for each object 
 * type, or start implementing versions of get_information() that take these 
 * different modes into account.  By using inheritance, we can keep the detail 
 * factory as is, and have the additional benefit of keeping majority of 
 * ExpressionSet code here in superclass, with the only differences in the
 * child class being the population modes.
 */

public class ExpressionSetDetail extends TairObjectDetail {

   // base URL for FTP links
    private static final String baseURL = 
        "ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/";
  
    private TfcExpressionSet expressionSet;

    // bio samples associated to this expression set - stored as 
    // BioSampleObjects protected access so child classes can populate 
    // according to context specific rules
    protected BioSampleObjectCollection bioSamples;

    // hyb descriptions associated to this expression set - stored as 
    // HybDescriptionObjects - protected access so child classes can populate 
    // according to context specific rules
    protected HybDescriptionObjectCollection hybDescriptions;
   
    protected ExpressionSetArrayDesignCollection arrayDesigns ;

    // keywords for expression set - stored as TairObjectKeyword objects
    private KeywordCollection keywords;
   
    private String manufacturer ;
     
    private AttributionObjectCollection personAttributions ;
    
    private AttributionObjectCollection organizationAttributions ;
    
    /**
     * Creates an empty instance of ExpressionSetDetail
     */
    public ExpressionSetDetail() {
        super();
    }


    /**
     * Creates an instance of ExpressionSetDetail that represents
     * all data referenced by submitted tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id tair object id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public ExpressionSetDetail( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, tair_object_id );
    } 

    /**
     * Creates an instance of ExpressionSetDetail that represents
     * all data referenced by submitted expression set name.
     *
     * @param conn An active connection to the database
     * @param name ExpressionSet name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public ExpressionSetDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }


    /** 
     * Populates object with data referenced by submitted expression set name
     *
     * @param conn An active connection to the database
     * @param name ExpressionSet name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name )
	throws RecordNotFoundException, SQLException {

	Long id = TfcExpressionSet.nameToTairObjectID( conn, name );
        
	if ( id == null ) {
	    throw new RecordNotFoundException( "No expression set found " +
					       "with name: " + name );
	}
			   
	get_information( conn, name );
    }

    /**
     * Populates object with data referenced by submitted tair object_id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public  void get_information( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

        populateExpressionSet( conn, tair_object_id );

	// super class will get counts only
        populateBioSamples( conn, get_expression_set_id() ); 
        populateHybDescriptions( conn, get_expression_set_id() ); 

        populateKeywords( conn, tair_object_id );

	// populate superclass data
	getTairObjectInformation( conn );
        // separete organization attribution and person attribution
        // can be moved to super class if this will be widely used
        seperateAttributions ();
    }


    /**
     * Populate expression set data for submitted tair_object_id. After 
     * expression set object is created, a reference to it is passed to 
     * TairObjectDetail superclass for use with tair object code.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Expression set tair_object_id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException thrown if a database error occurs.
     */
    protected void populateExpressionSet( DBconnection conn, 
					  Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

	this.expressionSet = new TfcExpressionSet( conn, tair_object_id );
        manufacturer  =  TfcExpressionSet.retrieveManufacturer( conn, tair_object_id);
	super.populateBaseObject( expressionSet );
       
    }


    /**
     * Populate bio sample data for expression set with submitted 
     * expression_set_id. Population is done here in a separate method so 
     * that sub-classes can override method to populate bio sample data using
     * a specific population mode (all, counts only).  Implementation here will
     * create bio sample collection in "counts" mode, meaning that only the 
     * number of associated elements for expression set will be retrieved, 
     * and that no bio sample objects will be created
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @throws SQLException thrown if a database error occurs.
     */
    protected void populateBioSamples( DBconnection conn, 
				       Long expression_set_id ) 
	throws SQLException {


	bioSamples = new BioSampleObjectCollection( conn, 
						    expression_set_id, 
						    "count" );
    }

    /**
     * Populate hyb description data for expression set with submitted 
     * expression_set_id. Population is done here in a separate method so that 
     * sub-classes can override method to populate hyb description data 
     * using a specific population mode (all, counts only).  Implementation
     * here will create collection in "count" mode, meaning that only number
     * of associated elements will be retrieved, and that no hyb description 
     * objects will be created
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @throws SQLException thrown if a database error occurs.
     */
    protected void populateHybDescriptions( DBconnection conn, 
					    Long expression_set_id ) 
        throws SQLException {

	hybDescriptions = 
	    new HybDescriptionObjectCollection( conn, 
						expression_set_id, 
						"count" );
    }


    /**
     * Populate keyword data for expression set with submitted 
     * expression_set_id. Population is done here in a separate method so 
     * that sub-classes can use it to populate keyword data without 
     * populating all objects created in get_information().
     *
     * @param conn An active connection to the database
     * @param tair_object_id Expression set tair object id to retrieve data for
     * @throws SQLException thrown if a database error occurs.
     */
    protected void populateKeywords( DBconnection conn, Long tair_object_id ) 
	throws SQLException {

	keywords = new KeywordCollection( conn, 
					  tair_object_id, 
					  "ExpressionSet" );
    }

   
    /**
     * Returns FTP URL that can be used to download expressionset data file.
     * This data is stored on the production FTP site using the naming
     * convention:<br><br>
     *
     * [ baseURL for FTP site ]/Microarrays/Datasets/ExpressionSet_[ submission_number ]/
     *
     * <p>
     * This method returns a fully qualified URL in the above format that can 
     * be directly inserted into the "href" attribute of an HTML hyperlink to 
     * create a link that user can use to /browse/download the expressionset
     * data file using their browser.
     *
     * @return FTP URL to use to download raw data file for this expression set 
     * object, or <code>null</code> if object doesn't have data needed (such as
     * expression set accession) to create URL
     */
    public String getFtpURL() {
        String url = null;

        if ( get_submission_number() != null  ) {
            url = 
                baseURL + "ExpressionSet_" + 
                URLEncoder.encode( get_submission_number() ) + "/"  ;
        }

        return url;
    }

    //
    // TfcExpressionSet wrappers
    //
    public Long get_expression_set_id() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_expression_set_id() : null; 
    }

    public String get_expression_set_name() { 
	return ( expressionSet != null ) ? expressionSet.get_name() : null;  
    }
    
    public String get_description() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_description() : null; 
    }

    public java.util.Date get_exp_date() { 
	return ( expressionSet != null ) ? expressionSet.get_exp_date() : null;
    }

    public String get_status() {
	return ( expressionSet != null ) ? expressionSet.get_status() : null; 
    }

    public String get_submission_number() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_submission_number() : null; 
    }

    public Boolean get_is_published() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_is_published() : null;
    }

    public java.util.Date get_date_last_modified() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_date_last_modified() : null; 
    }
    
    public String get_series_type() {
	return ( expressionSet != null ) ? 
	    expressionSet.get_series_type() : null; 
    }

    public Boolean get_is_series() { 
	return ( expressionSet != null ) ? expressionSet.get_is_series() : null; 
    }

    public Boolean get_is_obsolete() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_is_obsolete() : null; 
    }

    public Boolean get_plant_material_is_variable() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_plant_material_is_variable() : null;
    }
    
    public Boolean get_probe_type_is_variable() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_probe_type_is_variable() : null; 
    }

    public Boolean get_harvesting_is_variable() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_harvesting_is_variable() : null; 
    }

    public Boolean get_environment_is_variable() { 
	return ( expressionSet != null ) ? 
	    expressionSet.get_environment_is_variable() : null; 
    }

    public java.util.Date get_date_entered() { 
	return expressionSet.get_date_entered();
    }
    
    public String get_original_name() { 
	return expressionSet.get_original_name();
    }


    /**
     * Determines if expression set object has associated biosamples stored 
     * internally. NOTE: this method only determines if current object 
     * instance contains bio samples, not if expression set has any bio 
     * samples associated to it.
     *
     * @return <code>true</code> if expression set contains bio sample objects 
     * or <code>false</code> if no bio sample objects for expression set
     */
    public boolean hasBioSamples() { 
        return ( bioSamples != null && !bioSamples.isEmpty() );
    }

    /**
     * Retrieves bio samples associated to expression set.  This method will
     * return <code>null</code> even if getNumberBioSamples() returns greater
     * than zero if bio sample collection was created in "count" mode (as done
     * by local implementation of populateBioSamples method).
     *
     * @return Bio samples as an <code>Iterator</code> of 
     * <code>BioSampleObject</code>s  or <code>null</code> if no bio samples 
     * associated to expression set
     */ 
    public Iterator getBioSamples() {
        return ( hasBioSamples() ) ? bioSamples.iterator() : null;
    }

    /**
     * Retrieves number of bio samples associated to expression set, though not
     * necessarily the number of bio sample object contained by a current 
     * instance of object. This method may return a non-zero number even if 
     * hasBioSamples() returns false if bio sample collectino was created in 
     * "count" mode.
     *
     * @return number of bio samples associated to expression set, or zero if
     * no bio samples for expression set
     */
    public int getNumberBioSamples() {
        return ( bioSamples != null ) ? bioSamples.fullSize() : 0;
    }

    /**
     * Determines if expression set has associated hyb descriptions.  NOTE: 
     * this method only determines if current object instance contains hyb 
     * descriptions, not if expression set has any hyb descriptions associated
     * to it. This can be determined through the getNumberHybDescriptions() 
     * method which returns number of hyb descriptions for expression set 
     * regardless of current object's contents.
     *
     * @return <code>true</code> if expression set has hyb description objects 
     * associated with it, or <code>false</code> if no hyb description objects 
     * for expression set
     */
    public boolean hasHybDescriptions() { 
        return ( hybDescriptions != null && !hybDescriptions.isEmpty() ); 
    }


    /**
     * Retrieves hyb descriptions associated to expression set.  This method 
     * will return <code>null</code> even if getNumberHybDescriptions() returns 
     * greater than zero if collection of hyb descriptions was created in 
     * "count" mode (as in local implementationof populateHybDescriptions)
     *
     * @return hyb descriptions as an <code>Iterator</code> of 
     * <code>HybDescriptionObject</code>s or <code>null</code> if no hyb 
     * descriptions associated with expression set
     */ 
    public Iterator getHybDescriptions() {
        return ( hasHybDescriptions() ) ? hybDescriptions.iterator() : null;
    }

    /**
     * Retrieves number of hyb descriptions associated to expression set, though
     * not necessarily the number of hyb description objects contained by a 
     * current instance of object. This method will return a non-zero number 
     * even if hasHybDescriptions() returns false if collection of hyb 
     * descriptions was created in "count" mode.
     *
     * @return number of hyb descriptions associated to expression set, or zero
     * if no hyb descriptions for expression set
     */
    public int getNumberHybDescriptions() {
        return ( hybDescriptions != null ) ? hybDescriptions.fullSize() : 0;
    }


    /**
     * Determines whether object is full version of data, or if data is 
     * abbreviated. This data is used to determine what params and display 
     * text to use when displaying a control to toggle between full and 
     * abbreviated versions of display.  This implementation will always return
     * <code>false</code>, while ExpressionSetFullDetail child class will
     * override this method to always return <code>true</code>
     *
     * @return <code>true</code> if object is full representation of data, 
     * or <code>false</code> if data in object is abbreviated.  This 
     * implementation will always return <code>false</code> since this object
     * will always be created in abbreviated mode through detail page requests
     */
    public boolean isFullVersion() {
        return false;
    }



    /**
     * Retrieves total number of hyb data entries associated to hyb descriptions
     * associated to expression set
     *
     * @return Total number of hyb data entries associated to hyb descriptions 
     * that are associated to expression set
     */
    public int getNumberHybData() {
        return ( hybDescriptions != null ) ? 
	    hybDescriptions.getNumberHybData() : 0;
    }


    /**
     * Determines if expression set has associated keywords
     * 
     * @return <code>true</code> if expression set has associated keywords, or
     * <code>false</code> if no keywords for expression set
     */
    public boolean hasKeywords() {
        return ( keywords != null && !keywords.isEmpty() );
    }


    /**
     * Retrieves all keywords associated to this expression set
     * 
     * @return Keywords associated to expression set as an <code>Iterator</code>
     * of <code>BioSampleKeyword</code> object, or <code>null</code> if no 
     * keywords found for expression set
     */
    public Iterator getKeywords() {
        return ( hasKeywords() ) ? keywords.iterator() : null;
    }

    /**
     * Retrieves all keywords in collection that are joined to expression set 
     * with submitted relationship type
     *
     * @param relationshipType Relationship type to find keywords by
     * @return keywords joined to expression set with relationship type as an
     * <code>Iterator</code> of <code>BioSampleKeyword</code> objects, or
     * <code>null</code> if no keywords found with submitted relationship type
     */
    public Iterator getRelationshipType( String relationshipType ) {
        return ( hasKeywords() ) ? 
	    keywords.getRelationshipType( relationshipType ) : null;
    }
    
    /**
     * Retrieves experiment category keywords. This is a convenience method to 
     * retrieve all keywords with a given hardcoded relationship type; retrieval
     * is done using the generic getRelationshipType() method
     *
     * @return Experiment categories as an <code>Iterator</code> of 
     * <code>TairObjectKeyword</code> objects, or <code>null</code> if 
     * expression set has no experiment category keywords
     */
    public Iterator getExperimentCategories() {
        return getRelationshipType( "experiment category" );
    }

    /**
     * Retrieves experiment goal keywords. This is a convenience method to 
     * retrieve all keywords with a given hardcoded relationship type; retrieval
     * is done using the generic getRelationshipType() method
     *
     * @return Experiment goals as an <code>Iterator</code> of 
     * <code>TairObjectKeyword</code> objects, or <code>null</code> if 
     * expression set has no experiment goal keywords
     */
    public Iterator getExperimentGoals() {
        return getRelationshipType( "experiment goal" );
    }

    /**
     * Retrieves experimental factor keywords. This is a convenience method to 
     * retrieve all keywords with a given hardcoded relationship type; retrieval 
     * is done using the generic getRelationshipType() method
     *
     * @return Experimental factors as an <code>Iterator</code> of 
     * <code>TairObjectKeyword</code> objects, or <code>null</code> if 
     * expression set has no experimental factor keywords
     */
    public Iterator getExperimentFactors() {
        return getRelationshipType( "experimental factor" );
    }

    /**
     * Returns a single hybDescription that can used to display common data for 
     * experiment's entire collection of hybridizations.  Since much information
     * is common to all hybDescriptions, this allows the JSP to just display 
     * the data once, rather than several times while iterating through the 
     * full collection. 
     *
     * <p>
     * Data that might be common for a hybDescription collection includes 
     * scanning software, scanning hardware, normalization function, array 
     * design, and protocol info. Client code should use the appropriate 
     * hasCommonXXX() method to determine if data can be displayed as common 
     * before using the representative object to display it. Since data is 
     * common, any hybDescription in the collection should be able to be used
     * as the representative;  this method will always return the first object 
     * in the collection (i.e. object at index 0)
     *
     * @return HybDescription object that can be used to display data common to 
     * the experiment's entire collection of hyb descriptions, or 
     * <code>null</code> if no hybDescriptions exist for this expression set
     */
    public HybDescriptionObject getRepresentativeHybDescription() {
        return ( hasHybDescriptions() ) ? hybDescriptions.get( 0 ) : null;
    }

  
    /*
     * Determines if array design info. of experiment's hybridizations is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in experiment have the
     * same array design id (even if that id is <code>null</code>), or 
     * <code>false</code> if hybDescriptions do not share the same array design
     * id
     */
    public boolean hasCommonArrayDesign() {
        return ( hasHybDescriptions() ) ? 
	    hybDescriptions.hasCommonArrayDesign() : false;
    }
  
    /**
     * Determines if protocol info. of experiment's hybridizations is common, 
     * and can therefore just be displayed once for all hybridizations, rather 
     * than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in experiment have the 
     * same protocol reference id (even if that id is <code>null</code>), or 
     * <code>false</code> if hybDescriptions do not share the same protocol 
     * reference id
     */
    public boolean hasCommonProtocol() {
        return ( hasHybDescriptions() ) ? 
	    hybDescriptions.hasCommonProtocol() : false;
    }


    /**
     * Determines if scanning software of experiment's hybridizations is common,
     * and can therefore just be displayed once for all hybridizations, rather 
     * than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in experiment have the 
     * same scanning software id (even if that id is <code>null</code>), or 
     * <code>false</code> if hybDescriptions do not share the same scannning 
     * software id
     */
    public boolean hasCommonScanningSoftware() {
        return ( hasHybDescriptions() ) ? 
	    hybDescriptions.hasCommonScanningSoftware() : false;
    }


    /**
     * Determines if scanning hardware of experiment's hybridizations is common,
     * and can therefore just be displayed once for all hybridizations, rather 
     * than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in experiment have the 
     * same scanning hardware description, or <code>false</code> if 
     * hybDescriptions do not share the same scannning hardware description
     */
    public boolean hasCommonScanningHardware() {
        return ( hasHybDescriptions() ) ? 
	    hybDescriptions.hasCommonScanningHardware() : false;
    }

    /**
     * Determines if normalizing description of experiment's hybridizations is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in experiment have the 
     * same normalizing description, or <code>false</code> if  hybDescriptions 
     * do not share the same normalizing description
     */
    public boolean hasCommonNormalizationDesc() {
        return ( hasHybDescriptions() ) ? 
	    hybDescriptions.hasCommonNormalizationDesc() : false;
    }
   
    public String getManufacturer () {
	return  manufacturer ; 
    }

    // separate person attribution from organization attribution
    private void seperateAttributions() throws SQLException {
	if ( organizationAttributions == null ){
            organizationAttributions = new AttributionObjectCollection() ;
        }
        if ( personAttributions == null ){
            personAttributions = new AttributionObjectCollection() ;
        }

	Iterator<BsAttribution> contactIter = super.get_attributions( "experiment_done_by" ).iterator();

        if ( contactIter != null ) {   
	    BsAttribution attrib = null;
	    while ( contactIter.hasNext() ) {
		attrib = contactIter.next();
		if(attrib.getCommunity().getCommunityType().equalsIgnoreCase("organization")){
		    organizationAttributions.add( attrib ); 
		}else if (attrib.getCommunity().getCommunityType().equalsIgnoreCase("person")){
		    personAttributions.add( attrib );  
		}
	    }
	}
    } 
    /**
     * Determines if TairObject has associated attributions as type of organization
     *
     * @return <code>true</code> if tair object has associated organization attributions, or 
     * <code>false</code> if no organization attributions exist for tair object
     */
    public boolean hasOrganizationAttributions() {
        return( organizationAttributions != null && !organizationAttributions.isEmpty() );
    }

     /**
     * Determines if TairObject has associated attributions as type of person
     *
     * @return <code>true</code> if tair object has associated person attributions, or 
     * <code>false</code> if no person attributions exist for tair object
     */
    public boolean hasPersonAttributions() {
        return( personAttributions != null && !personAttributions.isEmpty() );
    }

    /**
     * Gets organization attributors for this TairObject as an <code>Iterator</code>
     * of <code>BsAttribution</code> objects.
     *
     * @return an <code>Iterator</code>of <code>BsAttribution</code> 
     * objects, or <code>null</code> if no organization attributions for this TairObject
     * @see BsAttribution
     */
    public List<BsAttribution> getOrganizationAttributions(){
	if ( hasOrganizationAttributions() ){
            organizationAttributions.sort( new AttributionIdComparator() );
            return organizationAttributions.getAttributions();
        }
        return  null;       
    }
   
     /**
     * Gets person attributors for this TairObject as an <code>Iterator</code>
     * of <code>BsAttribution</code> objects.
     *
     * @return an <code>Iterator</code>of <code>BsAttribution</code> 
     * objects, or <code>null</code> if no person attributors for this TairObject
     * @see BsAttribution
     */
    public List<BsAttribution> getPersonAttributions(){
	if ( hasPersonAttributions() ){
            personAttributions.sort( new AttributionIdComparator() );
            return personAttributions.getAttributions();
        }
        return  null;   
    }
    
    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** ExpressionSetDetail content test ******" );
        expressionSet.test();

        if ( hasBioSamples() ) {
            bioSamples.test();
        }

        if ( hasHybDescriptions() ) {
            hybDescriptions.test();
        }
    
        System.out.println( " element type = " + getElementType() );

        System.out.println( "**** ExpressionSetDetail content test end ****" );
    }
            
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long id = new Long( 1005823504 );
            ExpressionSetDetail exd = new ExpressionSetDetail( conn, id );
            exd.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}



