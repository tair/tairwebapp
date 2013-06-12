//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2004/11/02 20:13:56 $
//-----------------------------------------------------------------------------
package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.community.*;
import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;
 

/**
 * ExprSummary represents the information needed to display one expression set 
 * record as part of the expression set search results. ExprSummary contains all
 * fields from the temp table used to hold search results
 *
 * <p>
 * ExprSummary implements Accessible interface to facilitate creation of the 
 * object's TAIR accession number through <code>AccessionManager</code>
 */

public class ExprSummary implements Accessible {

    private Long expressionSetID;
    private Long tairObjectID;
    private String name;
    private String originalName;
    private String submissionNumber;
    private String manufacturer;
    // description is only populated when downloading summary
    private String description;

    private ListCommunityCollection experimenters ;

    private ListCommunityCollection submitOrganizations ;

    // keywords for expression set - stored as TairObjectKeyword objects
    private KeywordCollection keywords;

    /**
     * Creates an empty instance of ExprSummary
     */
    public ExprSummary() {  }


    /**
     * Creates an instance of ExprSummary that reflects data for the 
     * expressionm set with submitted tair object id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Expression set tair_object_id to retrieve 
     *  information for
     * @exception SQLException in the case of an invalid operation or database 
     * error, or if no row can be found for tair_object_id
     */
    public ExprSummary( DBconnection conn, Long tair_object_id ) 
	throws SQLException {   

	if ( tair_object_id != null ) {
	    populateExpressionSet( conn, tair_object_id );
	    populate( conn, true ); // populate w/all info.
	}
    }

    public final Long getExpressionSetID() { 
	return expressionSetID; 
    }

    public final Long getTairObjectID() { 
	return tairObjectID; 
    }

    public final String getName() { 
	return name; 
    }

    public final String getOriginalName() {
	return originalName; 
    }

    public final String getSubmissionNumber() { 
	return submissionNumber; 
    }

    public final String getDescription() { 
	return description; 
    }

    public final String getManufacturer(){
        return  manufacturer;
    }

    public final void setExpressionSetID( Long id ) { 
	this.expressionSetID = id; 
    }

    public final void setTairObjectID( Long id ) { 
	this.tairObjectID = id; 
    }

    public final void setName( String name ) { 
	this.name = name; 
    }

    public final void setOriginalName( String name ) { 
	this.originalName = name; 
    }

    public final void setSubmissionNumber( String number ) { 
	this.submissionNumber = number; 
    }

    public final void setDescription( String descr ) { 
	this.description = descr; 
    }
    
    public final void setManufacturer( String manufacturer){
        this.manufacturer = manufacturer;
    }   
    
    /**
     * Populate basic expression set info. - if summary object is created 
     * through ExprSearcher (which it almost always is), this info is populated 
     * by Searcher directly
     */
    private void populateExpressionSet( DBconnection conn, Long tair_object_id ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	boolean found = false;
    
	query = 
	    "SELECT e.tair_object_id, " +
	    "e.expression_set_id, " +
	    "e.name, " +
	    "e.submission_number, " +
	    "e.original_name " +
	    "FROM ExpressionSet e " +
	    "WHERE e.tair_object_id = " + tair_object_id.toString();

	conn.setQuery( query );
	results = conn.getResultSet();
	if ( results.next() ) {
	    found = true;
	    setTairObjectID( tair_object_id );
	    setExpressionSetID( new Long( results.getLong( "expression_set_id" ) ) );
	    setName( results.getString( "name" ) );
	    setOriginalName( results.getString( "original_name" ) );
	    setSubmissionNumber( results.getString( "submission_number" ) );
	}

        conn.releaseResources();
        if ( !found ) {
	    throw new RecordNotFoundException( "No expression set found with " +
					       "tair object id: " + 
					       tair_object_id );
	}
    }


    /**
     * Retrieves associated data for expression set including keywords and
     * experimenters. This method assumes tair object and basic expression set
     * info has already been populated for the object. 
     *
     * <p>
     * Description info is populated according to value of getDescription. This
     * data is only used when creating downloads.
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public void populate( DBconnection conn, boolean getDescription ) 
	throws SQLException {

	if ( getTairObjectID() != null  ) {
	    experimenters = new ListCommunityCollection( conn, 
							 getTairObjectID(), 
							 "experimenter" );
   
            submitOrganizations = new ListCommunityCollection( conn, 
							 getTairObjectID(), 
							 "submitOrganization"); 
	    keywords = new KeywordCollection( conn, 
					      getTairObjectID(), "ExpressionSet" ); 
	    
	    manufacturer =  TfcExpressionSet.retrieveManufacturer(conn, getTairObjectID()  ) ;  
                    
	    if ( getDescription ) {
		String descr = 
		    TfcExpressionSet.retrieveDescription( conn,
							  getTairObjectID() );
		setDescription( descr );
	    }
	}
    }
  
    /**
     * Determines if expression set has associated organization
     *
     * @return <code>true</code> if expression set has associated organization, or 
     * <code>false</code>
     * if no organization associated to expression set
     */
    public final boolean hasSubmitOrganizations() {
	return ( submitOrganizations != null && !submitOrganizations.isEmpty() );
    }   
    /**
     * Retrieves organizations for expression set
     *
     * @return Organizations associated to expression set as an 
     * <code>Iterator</code> of <code>ListCommunity</code> objects, or
     * <code>null</code> if no organizations associated to expression set
     */
    public final Iterator getSubmitOrganizations() {
	return ( hasSubmitOrganizations() ) ? submitOrganizations.iterator() : null;
    }
   
    /**
     * Determines if expression set has associated experimenters
     *
     * @return <code>true</code> if expression set has experimenters, or 
     * <code>false</code>
     * if no experimenters associated to expression set
     */
    public final boolean hasExperimenters() {
	return ( experimenters != null && !experimenters.isEmpty() );
    }

    /**
     * Retrieves experimenters for expression set
     *
     * @return Experimenters associated to expression set as an 
     * <code>Iterator</code> of <code>ListCommunity</code> objects, or
     * <code>null</code> if no experimenters associated to expression set
     */
    public final Iterator getExperimenters() {
	return ( hasExperimenters() ) ? experimenters.iterator() : null;
    }
   

    /**
     * Retrieves all keywords in collection that are joined to expression 
     * set with submitted relationship type
     *
     * @param relationshipType Relationship type to find keywords by
     * @return keywords joined to expression set with relationship type as an 
     * <code>Iterator</code> of <code>BioSampleKeyword</code> objects, or
     * <code>null</code> if no keywords found with submitted relationship type
     */
    public Iterator getRelationshipType( String relationshipType ) {
	return ( keywords != null && !keywords.isEmpty() ) ? 
	    keywords.getRelationshipType( relationshipType ) : null;
    }

    
    /**
     * Retrieves experiment category keywords. This is a convenience method to 
     * retrieve all keywords with a given hardcoded relationship type; retrieval 
     * is done using the generic getRelationshipType() method
     *
     * @return Experiment categories as an <code>Iterator</code> of 
     * <code>TairObjectKeyword</code> objects, or <code>null</code> if expression 
     * set has no experiment category keywords
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
     * <code>TairObjectKeyword</code> objects, or <code>null</code> if expression 
     * set has no experiment goal keywords
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
     * <code>TairObjectKeyword</code> objects, or <code>null</code> if expression 
     * set has no experimental factor keywords
     */
    public Iterator getExperimentFactors() {
	return getRelationshipType( "experimental factor" );
    }




    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public final String getAccession() { 
	return AccessionManager.getAccession( this ); 
    }

    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (ecotype) for use in creating TAIR accession
     */
    public final String getElementType() { 
	return "expression_set"; 
    }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR 
     * accession number. Implemented here to satisfy the <code>Accessible</code> 
     * interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { 
	return getTairObjectID(); 
    }



    /**
     * Creates a tab-delimited string of data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>Accession</li>
     * <li>Name</li>
     * <li>Experimenter(s)</li>
     * <li>Experiment categories</li>
     * <li>Experiment goals</li>
     * <li>Experimental factors</li>
     * <li>Description</li>
     * </ul>
     *
     * @return Tab-delimited string of ecotype data
     */     
    public final String createExport() {
	StringBuffer export = new StringBuffer();
	export.append( getAccession() + "\t" );
	export.append( EmptyTextConverter.convert( getOriginalName() ) + "\t" );
	export.append( getExperimenterNameString() + "\t" );
	export.append( getKeywordString( getExperimentCategories() ) + "\t" );
	export.append( getKeywordString( getExperimentGoals() ) + "\t" );
	export.append( getKeywordString( getExperimentFactors() ) + " \t" );
	export.append( EmptyTextConverter.convert( getDescription() ) + "\n" );
	return export.toString();
    }


    /**
     * Convenience method to create comma delimited string out of experimenter 
     * names. Used exclusively for creating tab-delimited exports - will return
     * empty string if no experimenters associated w/expression set
     */
    private String getExperimenterNameString() {
	StringBuffer names = new StringBuffer();
	Iterator iter = getExperimenters();
	ListCommunity experimenter = null;
	boolean first = true;

	if ( iter != null ) { 
            while ( iter.hasNext() ) {
		if ( !first ) {
		    names.append( ", " );
		}
		experimenter = (ListCommunity) iter.next();
		names.append( experimenter.getDisplayName() );
		first = false;
            }
	}

        // append organizaions
        iter = getSubmitOrganizations();
        first = true;

	if ( iter != null ) {
            names.append("("); 
            while ( iter.hasNext() ) {
		if ( !first ) {
		    names.append( ", " );
		}
		ListCommunity org = (ListCommunity) iter.next();
		names.append( org.getDisplayName() );
		first = false;
            }
            names.append(")"); 
	}
     
	return names.toString();
    }

    /**
     * Convenience method to create comma delimited string of keywords in 
     * submitted Iterator.  Used for creating tab-delimited exports using any
     * of keyword types - will return empty string if no keywords in iterator
     */
    private String getKeywordString( Iterator keywordIter ) {
	boolean first = true;
	KeywordLite keyword = null;
	StringBuffer keywordStr = new StringBuffer();

	if ( keywordIter != null ) {
	    if ( !first ) {
		keywordStr.append( ", " );
	    }
	    keyword = (KeywordLite) keywordIter.next();
	    keywordStr.append( keyword.getKeywordName() );
	    first = false;
	}
	return keywordStr.toString();
    }


    /**
     * Retrieve column order of download file
     *
     * @return Column order used when creating export as a tab-delimited string
     */ 
    public final String getExportHeader() {
	String header = 
	    "TAIR Accession\t" +
	    "Name\t" +
	    "Authors(Organization)\t" +
	    "Experiment categories\t" +
	    "Experiment goals\t" +
	    "Experimental factors\t" +
	    "Description\n";
	return header;
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** ExprSummary content test ******" );
	System.out.println( "tair object id: " + getTairObjectID() );
	System.out.println( "expression set id: " + getExpressionSetID() );
	System.out.println( "name: " + getName() );
	System.out.println( "original name: " + getOriginalName() );
	System.out.println( "description: " + getDescription() );

	/*if ( hasExperimenters() ) {
	    experimenters.test();
	}*/
	System.out.println( "**** ExprSummary content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    ExprSummary expr = new ExprSummary( conn, new Long( 1005252254 ) );
	    expr.test();

	} catch( Exception e ) {
	    e.printStackTrace();
	}
      
    }

}
