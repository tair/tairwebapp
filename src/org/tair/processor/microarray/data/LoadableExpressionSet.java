//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.4 $
// $Date: 2004/11/18 20:35:44 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.data;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.tair.bs.community.AttributionDelegate;
import org.tair.bs.community.BsAttribution;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.processor.genesymbol.TairObjectPublication;
import org.tair.processor.genesymbol.TairObjectPublicationCollection;
import org.tair.querytools.AttributionObjectCollection;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcExpressionSet;
import org.tair.tfc.TfcRelationshipType;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;
/**
 * LoadableExpressionSet extends TfcExpressionSet to contain detailed 
 * data on an expression set, including its associated bio samples,
 * hyb descriptions, labeled samples and keywords.  LoadableExpressionSet
 * exists specifically to handle microarray data loading and curation
 * tasks.
 */

public class LoadableExpressionSet extends TfcExpressionSet {

    // bio samples to be associated with expression set -
    // each element will contain environmental conditions and
    // germplasm data defined for that sample
    private LoadableBioSampleCollection bioSamples;

    // replicate sets (hyb descriptions) to be associated with
    // expression set - each element will contain hyb data slides
    // defined for that set
    private LoadableHybDescriptionCollection hybDescriptions;

    // labeled samples - stored as associations between bio sample
    // and hyb description recrords in above collections
    private LoadableLabeledSampleCollection labeledSamples;

    // experiment category keywords
    private LoadableTairObjectKeywordCollection categories;

    // experimental goal keywords
    private LoadableTairObjectKeywordCollection goals;

    // experimental factory keywords
    private LoadableTairObjectKeywordCollection factors;

    // publications associated to expression set
    private TairObjectPublicationCollection publications;

    // community attributions - experimenters etc.
    private AttributionObjectCollection attributions;

    // number of hyb descriptions, bio samples and hyb data slides associated
    // to expression set as entered in data file used to populate expression 
    // set - these number should ultimately be the same as the size of 
    // collections used to hold each type of data, but may not match up 
    // depending on where in expression set's population cycle we are at a 
    // given moment
    private int numberHybDescriptions;
    private int numberBioSamples;
    private int numberHybDataSlides;


    /**
     * Creates an empty instance of LoadableExpressionSet
     */
    public LoadableExpressionSet() {
	super();
    }

    /**
     * Creates an instance of LoadableExpressionSet that reflects all data
     * referenced by submitted expression set tair_object_id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableExpressionSet( DBconnection conn, Long tair_object_id )
	throws SQLException {

	super( conn, tair_object_id );

	bioSamples = 
	    new LoadableBioSampleCollection( conn, 
					     get_expression_set_id() );

	hybDescriptions = 
	    new LoadableHybDescriptionCollection( conn,
						  get_expression_set_id() );

	labeledSamples = 
	    new LoadableLabeledSampleCollection( conn, 
						 get_expression_set_id() );

	publications = new TairObjectPublicationCollection( conn, 
							    tair_object_id );

	attributions = new AttributionObjectCollection( conn, tair_object_id );

	populateKeywords( conn );
    }
   
    /**
     * Gateway method to populate keyword collections for existing
     * expression set.  Each collection must be created with a specific
     * relationship type that defines the type of keywords in collection
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populateKeywords( DBconnection conn ) throws SQLException {
	
	// create relationship type object to get id literals needed 
	// for creating keyword type specific collections
	TfcRelationshipType relType = null;
	Long relTypeID = null;

	relType = getCategoryRelType( conn );
	relTypeID = relType.get_relationship_type_id();

	categories = 
	    new LoadableTairObjectKeywordCollection( conn,
						     get_tair_object_id(),
						     relTypeID );

	relType = getGoalRelType( conn );
	relTypeID = relType.get_relationship_type_id();
	goals = new LoadableTairObjectKeywordCollection( conn,
							 get_tair_object_id(),
							 relTypeID );


	relType = getFactorRelType( conn );
	relTypeID = relType.get_relationship_type_id();	
	factors = new LoadableTairObjectKeywordCollection( conn,
							   get_tair_object_id(),
							   relTypeID );
    }

    /**
     * Adds a publication to be associated to expression set
     *
     * @param publication Publication to associate to expression set
     */
    public void addPublication( TairObjectPublication publication ) {
	if ( publications == null ) {
	    publications = new TairObjectPublicationCollection();
	}
	publications.add( publication );
    }

    /**
     * Removes publication association to expression set
     *
     * @param publication Publication to remove
     */
    public void removePublication( TairObjectPublication publication ) {
	if ( hasPublications() ) {
	    publications.remove( publication );
	}
    }

    /**
     * Determines if expression set has associated publications
     *
     * @return <code>true</code> if expression set has associated publications,
     * <code>false</code> if no publications associated to expression set
     */
    public boolean hasPublications() {
	return ( publications != null && !publications.isEmpty() );
    }


    /**
     * Retrieves publications associated to expression set
     *
     * @return publications associated to expression set as an 
     * <code>Iterator</code> of <code>TairObjectPublication</code> objects
     * or <code>null</code> if no publications associated to expression set
     */
    public Iterator getPublications() {
	return hasPublications() ? publications.iterator() : null;
    }


    /**
     * Adds a bio sample to expression set
     *
     * @param bioSample Bio sample to add to expression set
     */
    public void addBioSample( LoadableBioSample bioSample ) {
	if ( bioSamples == null ) {
	    bioSamples = new LoadableBioSampleCollection();
	}
	bioSamples.add( bioSample );
    }

    /**
     * Removes bio sample from expression set
     *
     * @param bioSample Bio Sample to remove
     */
    public void removeBioSample( LoadableBioSample bioSample ) {
	if ( hasBioSamples() ) {
	    bioSamples.remove( bioSample );
	}
    }

    /**
     * Determines if expression set has bio samples
     *
     * @return <code>true</code> if expression set has bio samples,
     * <code>false</code> if no bio samples for expression set
     */
    public boolean hasBioSamples() {
	return ( bioSamples != null && !bioSamples.isEmpty() );
    }


    /**
     * Retrieves bio samples for expression set
     *
     * @return bio samples associated to expression set as an 
     * <code>Iterator</code> of <code>LoadableBioSample</code> objects
     * or <code>null</code> if no bio samples associated to expression set
     */
    public Iterator getBioSamples() {
	return hasBioSamples() ? bioSamples.iterator() : null;
    }

    /**
     * Retrieves bio sample with submitted name
     *
     * @param name Name of bio sample to retrieve
     * @return Bio sample in expression set with submitted name, or 
     * <code>null</code> if no bio sample found with name
     */
    public LoadableBioSample getBioSample( String name ) {
	return hasBioSamples() ? bioSamples.get( name ) : null;
    }


    /**
     * Gets number of bio sample objects actually in expression set's collection
     * of bio sample data.  This is different from getNumberBioSamples which 
     * returns the number of data items as entered on the data sheet used to 
     * populate expression set
     *
     * @return Number of bio samples in expression set's collection of bio 
     * sample data
     */
    public int getBioSampleCollectionSize() {
	return hasBioSamples() ? bioSamples.size() : 0;
    }


    /**
     * Sets the number of bio samples associated to expression set. This number
     * comes directly from data sheet used to populate expression set and may 
     * not immediately agree with with getBioSampleCollectionSize, which returns
     * the number of bio sample data objects currently in expression set's 
     * collection.
     *
     * @param number Number of bio samples for expression set
     */

    public void setNumberBioSamples( int number ) {
	this.numberBioSamples = number;
    }

    /**
     * Gets number of bio samples associated with expression set as entered in
     * data sheet used to populate expression set. This may be different from 
     * getBioSampleCollectionSize, which returns the number of bio sample 
     * objects actually in expression set's collection.
     *
     * @return Number of bio samples associated with expression set as entered 
     * in data sheet used to populate expression set
     */
    public int getNumberBioSamples() {
	return numberBioSamples;
    }


    /**
     * Adds a hyb description to expression set
     *
     * @param hybDescription hyb description to add to expression set
     */
    public void addHybDescription( LoadableHybDescription hybDescription ) {
	if ( hybDescriptions == null ) {
	    hybDescriptions = new LoadableHybDescriptionCollection();
	}
	hybDescriptions.add( hybDescription );
    }

    /**
     * Removes hyb description from expression set
     *
     * @param hybDescription Hyb Description to remove
     */
    public void removeHybDescription( LoadableHybDescription hybDescription ) {
	if ( hasBioSamples() ) {
	    hybDescriptions.remove( hybDescription );
	}
    }

    /**
     * Determines if expression set has associated hyb descriptions
     *
     * @return <code>true</code> if expression set has associated hyb descriptions,
     * <code>false</code> if no hyb descriptions associated to expression set
     */
    public boolean hasHybDescriptions() {
	return ( hybDescriptions != null && !hybDescriptions.isEmpty() );
    }


    /**
     * Retrieves hyb descriptions associated to expression set
     *
     * @return hyb descriptions associated to expression set as an 
     * <code>Iterator</code> of <code>LoadableHybDescription</code> objects
     * or <code>null</code> if no hyb descriptions associated to expression set
     */
    public Iterator getHybDescriptions() {
	return hasHybDescriptions() ? hybDescriptions.iterator() : null;
    }

    /**
     * Retrieves hyb description with submitted name
     *
     * @param name Name of hyb description to retrieve
     * @return Hyb description in expression set with submitted name, or 
     * <code>null</code> if no hyb description found with name
     */
    public LoadableHybDescription getHybDescription( String name ) {
	return hasHybDescriptions() ? hybDescriptions.get( name ) : null;
    }

    /**
     * Sets the number of hyb descriptions (replicate sets) associated
     * with expression set. This number comes directly from data sheet used
     * to populate expression set and may not immediately agree with
     * with getHybDescriptionCollectionSize, which returns the number of
     * hyb description data objects currently in expression set's collection.
     *
     * @param number Number of hyb descriptions for expression set
     */

    public void setNumberHybDescriptions( int number ) {
	this.numberHybDescriptions = number;
    }

    /**
     * Gets number of hyb descriptions (replicate sets) associated with
     * expression set as entered in data sheet used to populate expression set.
     * This may be different from getHybDescriptionCollectionSize, which returns
     * the number of hyb description objects actually in expression set's 
     * collection.
     *
     * @return Number of hyb descriptions associated with expression set as
     * entered in data sheet used to populate expression set
     */
    public int getNumberHybDescriptions() {
	return numberHybDescriptions;
    }

    /**
     * Gets number of hyb description objects actually in expression set's 
     * collection of hyb description data.  This is different from 
     * getNumberHybDescriptions which returns the number of data items as
     * entered on the data sheet used to populate expression set
     *
     * @return Number of hyb descriptions in expression set's collection of
     * hyb description data
     */
    public int getHybDescriptionCollectionSize() {
	return hasHybDescriptions() ? hybDescriptions.size() : 0;
    }

    /**
     * Gets number of hyb data slides actually in expression set's collection
     * of slide data.  This is different from getNumberHybDataSlides which 
     * returns the number of data items as entered on the data sheet used to 
     * populate expression set
     *
     * @return Number of hyb data slides in expression set's collection of 
     * slide data
     */
    public int getHybDataCollectionSize() {
	return hasHybDescriptions() ? hybDescriptions.getNumberHybData() : 0;
    }

    
    /**
     * Sets the number of hyb data slides associated with expression set. This 
     * number comes directly from data sheet used to populate expression set and
     * may not immediately agree with with getHybDataCollectionSize, which 
     * returns the number of hyb data objects currently in expression set's 
     * collections.
     *
     * @param number Number of hyb data slides for expression set
     */

    public void setNumberHybDataSlides( int number ) {
	this.numberHybDataSlides = number;
    }

    /**
     * Gets number of hyb data slides associated with expression set as entered
     * in data sheet used to populate expression set. This may be different from 
     * getHybDataCollectionSize, which returns the number of hyb data slides
     * actually in expression set's collection of data.
     *
     * @return Number of hyb data slides associated with expression set as 
     * entered in data sheet used to populate expression set
     */
    public int getNumberHybDataSlides() {
	return numberHybDataSlides;
    }


   /**
     * Adds a labeled sample to expression set
     *
     * @param labeledSample labeled sample to add to expression set
     */
    public void addLabeledSample( LoadableLabeledSample labeledSample ) {
	if ( labeledSamples == null ) {
	    labeledSamples = new LoadableLabeledSampleCollection();
	}
	labeledSamples.add( labeledSample );
    }

    /**
     * Removes labeled sample from expression set
     *
     * @param labeledSample Labeled Sample to remove
     */
    public void removeLabeledSample( LoadableLabeledSample labeledSample ) {
	if ( hasLabeledSamples() ) {
	    labeledSamples.remove( labeledSample );
	}
    }

    /**
     * Determines if expression set has labeled samples
     *
     * @return <code>true</code> if expression set has labeled samples,
     * <code>false</code> if no labeled samples for expression set
     */
    public boolean hasLabeledSamples() {
	return ( labeledSamples != null && !labeledSamples.isEmpty() );
    }


    /**
     * Retrieves labeled samples for expression set
     *
     * @return labeled samples associated to expression set as an 
     * <code>Iterator</code> of <code>LoadableLabeledSample</code> objects
     * or <code>null</code> if no labeled samples associated to expression set
     */
    public Iterator getLabeledSamples() {
	return hasLabeledSamples() ? labeledSamples.iterator() : null;
    }

    /**
     * Retrieves labeled sample with submitted name.  This may result in
     * multiple values if same bio sample associated to multiple hyb
     * descriptions through single labeled sample name.
     *
     * @param name Name of labeled sample to retrieve
     * @return labeled samples in expression set with submitted name as 
     * an <code>Iterator</code> of <code>LoadableLabeledSample</code> objects,
     * or  <code>null</code> if no labeled sample found with name
     */
    public Iterator getLabeledSamples( String name ) {
	return hasLabeledSamples() ? labeledSamples.get( name ) : null;
    }

    /**
     * Retrieves a single labeled sample with submitted name. If 
     * multiple labeled samples exist with same name, majority of information
     * (except for associated hyb description) should be the same. This
     * method provides an easy way to get a single representative object
     * for displaying labeled sample data.
     * 
     *
     * @param name Name of labeled sample to retrieve
     * @return First labeled sample in expression set found with submitted name
     * or <code>null</code> if no labeled sample found with name
     */
    public LoadableLabeledSample getFirstLabeledSample( String name ) {
	return hasLabeledSamples() ? labeledSamples.getFirst( name ) : null;
    }


    /**
     * Retrieves all hyb description names associated to labeled sample with
     * submitted name.  This is a convenience method for easily displaying 
     * different hyb descriptions without going through each labeled sample
     * (since majority of info. should be the same.
     *
     * @param name Labeled sample name to get hyb descriptions for
     * @return Names of hyb descriptions associated to labeled sample(s) with
     * submitted name as an <code>Iterator</code> of Strings, or <code>null</code>
     * if no hyb description data found for labeled sample name
     */
    public Iterator getLabeledSampleHybDescriptions( String name ) {
	return hasLabeledSamples() ? 
	    labeledSamples.getLabeledSampleHybDescriptions( name ) : null;
    }



    /**
     * Adds an experiment category keyword to be associated to expression set
     *
     * @param category Experiment category keyword to associate to 
     * expression set
     */
    public void addExperimentCategory( LoadableTairObjectKeyword category ) {
	if ( categories == null ) {
	    categories = new LoadableTairObjectKeywordCollection();
	}
	categories.add( category );
    }

    /**
     * Removes experiment category keyword association to expression set
     *
     * @param category Experiment category keyword to remove
     */
    public void removeExperimentCategory( LoadableTairObjectKeyword category ) {
	if ( hasExperimentCategories() ) {
	    categories.remove( category );
	}
    }

    /**
     * Determines if expression set has associated categories
     *
     * @return <code>true</code> if expression set has associated experiment 
     * category keywords, <code>false</code> if no experiment category keywords 
     * associated to expression set
     */
    public boolean hasExperimentCategories() {
	return ( categories != null && !categories.isEmpty() );
    }


    /**
     * Retrieves experiment category keywords associated to expression set
     *
     * @return experiment category keywords associated to expression set as an 
     * <code>Iterator</code> of <code>LoadableTairObjectKeyword</code> objects
     * or <code>null</code> if no experiment category keywords associated to 
     * expression set
     */
    public Iterator getExperimentCategories() {
	return hasExperimentCategories() ? categories.iterator() : null;
    }
    
	
    /**
     * Adds an experimental goal keyword to be associated to expression set
     *
     * @param goal experimental goal keyword to associate to 
     * expression set
     */
    public void addExperimentalGoal( LoadableTairObjectKeyword goal ) {
	if ( goals == null ) {
	    goals = new LoadableTairObjectKeywordCollection();
	}
	goals.add( goal );
    }

    /**
     * Removes experimental goal keyword association to expression set
     *
     * @param goal experimental goal keyword to remove
     */
    public void removeExperimentalGoal( LoadableTairObjectKeyword goal ) {
	if ( hasExperimentalGoals() ) {
	    goals.remove( goal );
	}
    }

    /**
     * Determines if expression set has associated goals
     *
     * @return <code>true</code> if expression set has associated experimental
     * goal keywords, <code>false</code> if no experimental goal keywords 
     * associated to expression set
     */
    public boolean hasExperimentalGoals() {
	return ( goals != null && !goals.isEmpty() );
    }


    /**
     * Retrieves experimental goal keywords associated to expression set
     *
     * @return experimental goal keywords associated to expression set as an 
     * <code>Iterator</code> of <code>LoadableTairObjectKeyword</code> objects
     * or <code>null</code> if no experimental goal keywords associated to 
     * expression set
     */
    public Iterator getExperimentalGoals() {
	return hasExperimentalGoals() ? goals.iterator() : null;
    }


    /**
     * Adds an experimental factor keyword to be associated to expression set
     *
     * @param factor experimental factor keyword to associate to 
     * expression set
     */
    public void addExperimentalFactor( LoadableTairObjectKeyword factor ) {
	if ( factors == null ) {
	    factors = new LoadableTairObjectKeywordCollection();
	}
	factors.add( factor );
    }

    /**
     * Removes experimental factor keyword association to expression set
     *
     * @param factor experimental factor keyword to remove
     */
    public void removeExperimentalFactor( LoadableTairObjectKeyword factor ) {
	if ( hasExperimentalFactors() ) {
	    factors.remove( factor );
	}
    }

    /**
     * Determines if expression set has associated factors
     *
     * @return <code>true</code> if expression set has associated experimental
     * factor keywords, <code>false</code> if no experimental factor keywords 
     * associated to expression set
     */
    public boolean hasExperimentalFactors() {
	return ( factors != null && !factors.isEmpty() );
    }


    /**
     * Retrieves experimental factor keywords associated to expression set
     *
     * @return experimental factor keywords associated to expression set as an 
     * <code>Iterator</code> of <code>LoadableTairObjectKeyword</code> objects
     * or <code>null</code> if no experimental factor keywords associated to 
     * expression set
     */
    public Iterator getExperimentalFactors() {
	return hasExperimentalFactors() ? factors.iterator() : null;
    }

    /**
     * Adds an attribution to be associated to expression set
     *
     * @param attribution attribution to associate to 
     * expression set
     */
    public void addAttribution( BsAttribution attribution ) {
	if ( attributions == null ) {
	    attributions = new AttributionObjectCollection();
	}
	attributions.add( attribution );
    }

    /**
     * Removes attribution for expression set
     *
     * @param attribution attribution to remove
     */
    public void removeAttribution( BsAttribution attribution ) {
	if ( hasAttributions() ) {
	    attributions.remove( attribution );
	}
    }

    /**
     * Determines if expression set has associated attributions
     *
     * @return <code>true</code> if expression set has attributions, 
     & <code>false</code> if no attributions for expression set
     */
    public boolean hasAttributions() {
	return ( attributions != null && !attributions.isEmpty() );
    }


    /**
     * Retrieves attributions associated to expression set
     *
     * @return attributions associated to expression set as an 
     * <code>Iterator</code> of <code>BsAttribution</code> objects
     * or <code>null</code> if no attributions for expression set
     */
    public List<BsAttribution> getAttributions() {
	return hasAttributions() ? attributions.getAttributions() : null;
    }


    /**
     * Stores all data for expression set. This will create or update
     * rows for expression set, bio samples (including keyword associations,
     * extraction protocol, germplasm and clone data), hyb descriptions 
     * (including scanning software and hybridization protocol), hyb data 
     * slides, labeled samples (including labeling protocol) and associations 
     * to keywords for expression set.
     *
     * <p>
     * Store operation is done within a single transaction, meaning that all
     * data is successfully stored, or entire operation is aborted. May need
     * to change this to have smaller granularity of transactions if this
     * causes problems.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data has not been properly set
     * for storing
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {


	// store all data for expression set as single transaction and
	// back out if there are any errors
	try {
	    
	    // remove auto-commit to handle manual transaction
	    conn.remove_auto_commit_mode();
	    
	    super.store( conn );

	    // store community attributions
	    storeAttributions( conn );

	    // store keyword associations
	    storeKeywords( conn );

	    // store publications
	    storePublications( conn );
  
	    // store hyb descriptions & set new ids for labeled samples
	    storeHybDescriptions( conn );

	    // store bio samples & set new ids for labeled samples
	    storeBioSamples( conn );
	    
	    // store labeled samples
	    storeLabeledSamples( conn );
	    
	    conn.commit(); // commit changes if no errors

	} catch ( Exception e ) { // rollback changes if any errors
            if ( conn != null ) {
                conn.rollback();
            }
	    
	    e.printStackTrace();
            String stackMsg =  TextConverter.getStackTrace( e ); 
            // propagate exception as SQLException
            throw new SQLException ( "Error storing expression set: " + 
				      e.getMessage() + "\n" + stackMsg );
	    
        } finally {
            if ( conn != null ) { // set auto-commit back on
                conn.set_auto_commit_mode();
            }
        }
	
	// validate numbers of slides, samples, replicates???

    }

    
    /**
     * Deletes all data for expression set. This will delete rows for expression set, 
     * bio samples (including keyword associations, Environmental conditions), 
     * hyb descriptions, hyb data , labeled samples and associatated keywords.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */

    public void delete ( DBconnection conn ) throws SQLException {
       	try {
	    // remove auto-commit to handle manual transaction
	    conn.remove_auto_commit_mode();
            // delete labled samples
            deleteLabeledSamples( conn ); 
            // delete bio samples 
	    deleteBioSamples( conn );
	    // delete hyb descriptions 
	    deleteHybDescriptions( conn );
            // delete publications association
	    deletePublications( conn );  
            // store keyword associations  
            deleteKeywords( conn );
           // delete attributions associations
	    deleteAttributions( conn );
	   
            super.delete ( conn );

	    conn.commit(); // commit changes if no errors

	} catch ( Exception e ) { // rollback changes if any errors
            if ( conn != null ) {
                conn.rollback();
            }
	    
	    e.printStackTrace();
            String stackMsg =  TextConverter.getStackTrace( e ); 
            // propagate exception as SQLException
            throw new SQLException ( "Error deleting expression set: " + 
				     e.getMessage() + "\n" + stackMsg );
	    
        } finally {
            if ( conn != null ) { // set auto-commit back on
                conn.set_auto_commit_mode();
            }
        }
	

    }


    /**
     * Sets tair object id of expression set for all attributions and 
     * stores associations to expression set.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data has not been properly set
     * for storing
     * @throws SQLException if a database error occurs
     */
    private void storeAttributions( DBconnection conn )
	throws InvalidActionException, SQLException {

	if ( hasAttributions() ) {
	    attributions.setTairObjectID( get_tair_object_id() );
	    attributions.store( conn );
	}
    }


    /**
     * Sets tair object id of expression set for all publications and 
     * stores associations to expression set.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data has not been properly set
     * for storing
     * @throws SQLException if a database error occurs
     */
    private void storePublications( DBconnection conn )
	throws InvalidActionException, SQLException {

	if ( hasPublications() ) {
	    publications.set_tair_object_id( get_tair_object_id() );
	    publications.store( conn );
	}
    }

    /**
     * Sets relationship and annotation types for all keywords along with
     * tair object id for expression set and stores associations 
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data has not been properly set
     * for storing
     * @throws SQLException if a database error occurs
     */
    private void storeKeywords( DBconnection conn )
	throws InvalidActionException, SQLException {
	
	// all keyword associations to expression set should
	// have same annotation type
	TfcAnnotationType annotationType = 
	    new TfcAnnotationType( conn, "ExpressionSet" );
	
	TfcRelationshipType relationshipType = null;

	if ( hasExperimentCategories() ) {
	    categories.setTairObjectID( get_tair_object_id() );
	    relationshipType = getCategoryRelType( conn );
	    categories.setRelationshipType( relationshipType );
	    categories.setAnnotationType( annotationType );
	    categories.store( conn );
	}
	
	if ( hasExperimentalFactors() ) {
	    factors.setTairObjectID( get_tair_object_id() );
	    relationshipType = getFactorRelType( conn );
	    factors.setRelationshipType( relationshipType );
	    factors.setAnnotationType( annotationType );
	    factors.store( conn );
	}
	
	if ( hasExperimentalGoals() ) {
	    goals.setTairObjectID( get_tair_object_id() );
	    relationshipType = getGoalRelType( conn );
	    goals.setRelationshipType( relationshipType );
	    goals.setAnnotationType( annotationType );
	    goals.store( conn );
	}
    }


    /**
     * Creates TfcRelationshipType object for "experiment category"
     * keywords associated to ExpressionSet. This data is needed for 
     * creating keyword collections for new and existing expression sets
     *
     * @param conn An active connection to the database
     * @return TfcRelationshipType object for experiment category
     * keywords
     * @throws SQLException if a database error occurs
     */
    private TfcRelationshipType getCategoryRelType( DBconnection conn )
	throws SQLException {

	TfcRelationshipType relationshipType = 
	    new  TfcRelationshipType( conn, 
				      "experiment category", 
				      "ExpressionSet" );

	return relationshipType;
    }



    /**
     * Creates TfcRelationshipType object for "experiment goal"
     * keywords associated to ExpressionSet. This data is needed for 
     * creating keyword collections for new and existing expression sets
     *
     * @param conn An active connection to the database
     * @return TfcRelationshipType object for experimental goal keywords
     * @throws SQLException if a database error occurs
     */
    private TfcRelationshipType getGoalRelType( DBconnection conn )
	throws SQLException {

	TfcRelationshipType relationshipType = 
	    new  TfcRelationshipType( conn, 
				      "experiment goal", 
				      "ExpressionSet" );

	return relationshipType;
    }

    /**
     * Creates TfcRelationshipType object for "experimental factor"
     * keywords associated to ExpressionSet. This data is needed for 
     * creating keyword collections for new and existing expression sets
     *
     * @param conn An active connection to the database
     * @return TfcRelationshipType object for experimental factor keywords
     * @throws SQLException if a database error occurs
     */
    private TfcRelationshipType getFactorRelType( DBconnection conn )
	throws SQLException {

	TfcRelationshipType relationshipType = 
	    new  TfcRelationshipType( conn, 
				      "experimental factor", 
				      "ExpressionSet" );

	return relationshipType;
    }


    /**
     * Sets expression set id for all hyb descriptions and stores items
     * to database.  After hyb descriptions have been stored, newly created
     * hyb description ids are set for labeled samples.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data has not been properly set
     * for storing
     * @throws SQLException if a database error occurs
     */
    private void storeHybDescriptions( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	if ( hasHybDescriptions() ) {
	    hybDescriptions.setExpressionSetID( get_expression_set_id() );
	    hybDescriptions.store( conn );

	    // set ids for labeleds samples
	    setHybDescriptionIDs();

	    // must have hyb descriptions to store expression set
	} else {
	    throw new InvalidActionException( "No hyb descriptions for " +
					      "expression set" );
	}
    }

    /**
     * Sets expression set id for all bio samples and stores items
     * to database.  After bio samples have been stored, newly created
     * bio sample ids are set for labeled samples.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data has not been properly set
     * for storing
     * @throws SQLException if a database error occurs
     */
    private void storeBioSamples( DBconnection conn )
	throws InvalidActionException, SQLException {
	
	if ( hasBioSamples() ) {
	    bioSamples.setExpressionSetID( get_expression_set_id() );
	    bioSamples.store( conn );

	    // set ids for labeled samples
	    setBioSampleIDs();

	// must have bio samples to store expression set
	} else {
	    throw new InvalidActionException( "No bio samples for " +
					      "expression set" );
	}
    }

    /**
     * Stores labeled samples for expression set.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data has not been properly set
     * for storing
     * @throws SQLException if a database error occurs
     */
    private void storeLabeledSamples( DBconnection conn )
	throws InvalidActionException, SQLException {
	
	if ( hasLabeledSamples() ) {
	    labeledSamples.setExpressionSetID( get_expression_set_id() );
	    labeledSamples.store( conn );

	    // must have labeled samples to store expression set
	} else {
	    throw new InvalidActionException( "No labeled samples for " +
					      "expression set" );
	}
    }


    /**
     * Sets hyb description ids for all labeled samples. This must be done after
     * new hyb description rows have been INSERTed to properly set newly created
     * ids for each hyb description set referred to by labeled sample.
     */
    private void setHybDescriptionIDs() {
	
	// go through hyb description collection and update labeled samples
	// for each with new id
	LoadableHybDescription hybDescription = null;
	Long id = null;
	String name = null;
	for ( Iterator iter = getHybDescriptions(); iter.hasNext(); ) {
	    hybDescription = ( LoadableHybDescription) iter.next();
	    id = hybDescription.get_hyb_description_id();
	    name = hybDescription.get_name();
            //System.out.println( "setting hyb_id for " + name + " " + id  );
	    labeledSamples.setHybDescriptionID( id, name );
	}
    }
	    

    /**
     * Sets bio sample ids for all labeled samples. This must be done after
     * new bio sample rows have been INSERTed to properly set newly created
     * ids for each bio sample referred to by labeled sample.
     */
    private void setBioSampleIDs() {
	
	// go through bio sample collection and update labeled samples
	// for each with new id
	LoadableBioSample bioSample = null;
	Long id = null;
	String name = null;
	for ( Iterator iter = getBioSamples(); iter.hasNext(); ) {
	    bioSample = (LoadableBioSample) iter.next();
	    id = bioSample.get_bio_sample_id();
	    name = bioSample.get_name();
	    labeledSamples.setBioSampleID( id, name );
	}
    }
	    
    // delete labled samples
    private void  deleteLabeledSamples( DBconnection conn ) throws SQLException {
	if ( hasLabeledSamples()){
	    labeledSamples.delete( conn ); 
        }
    }
    // delete bio samples 
    private void  deleteBioSamples(DBconnection conn ) throws SQLException {
        if ( hasBioSamples() ){
	    for ( Iterator iter = getBioSamples(); iter.hasNext();) {
		LoadableBioSample  bioSample = (LoadableBioSample) iter.next();
		bioSample.delete( conn );
	    }
	}
    }
					     
    // delete hyb descriptions 
    private void  deleteHybDescriptions (DBconnection conn ) throws SQLException {
        if( hasHybDescriptions()){ 
	    for (Iterator iter = getHybDescriptions(); iter.hasNext(); ) {
		LoadableHybDescription hybDescription = (LoadableHybDescription) iter.next();	
		hybDescription.delete( conn );
	    }     
        }
    }
    // delete publications association
    private void  deletePublications( DBconnection conn ) throws SQLException {
        if ( hasPublications() ){
	    for (Iterator iter = getPublications(); iter.hasNext(); ) {
		TairObjectPublication pub = (TairObjectPublication)iter.next();
                pub.delete( conn );
            }
        }       
    }   

    // delete keyword associations  
    private void  deleteKeywords(DBconnection conn )throws SQLException {
     	if ( hasExperimentCategories() ) {
	    categories.delete( conn );
	}
	
	if ( hasExperimentalFactors() ) {
	    factors.delete( conn );
	}
	
	if ( hasExperimentalGoals() ) {
	    goals.delete( conn );
	}
    }

  // delete attributions associations
  private void deleteAttributions(DBconnection conn) throws SQLException {
    List<BsAttribution> list = new ArrayList<BsAttribution>();
    if (hasAttributions()) {
      for (BsAttribution attribution : getAttributions()) {
        list.add(attribution);
        attribution.delete();
      }
    }
    AttributionDelegate delegate =
      CommunityDelegateFactory.getAttributionDelegate();
    delegate.deleteBatch(list);
  }

}

