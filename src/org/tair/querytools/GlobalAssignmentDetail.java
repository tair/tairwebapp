//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 19:18:17 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.tair.bs.community.BsAttribution;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGlobalAssignment;
import org.tair.utilities.Accessible;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.RecordNotFoundException;


/**
 * GlobalAssignmentDetail represents all information needed to show 
 * attributions, annotatations and publications for a global assignment.
 *
 * <p>
 * GlobalAssignmentDetail implements Accessible interface to facilitate 
 * creation of the object's TAIR accession number through 
 * <code>AccessionManager</code>.  
 */

public class GlobalAssignmentDetail implements Detail, Accessible {

    // base instance of asssignment

    private TfcGlobalAssignment globalAssignment;

    // Attributions for GlobalAssignment - stored as AttributionObject

    private AttributionObjectCollection attributions;

    // Annotations - stored as AnnotationObjects

    private AnnotationObjectCollection annotations;

    // A collection of external links associated to a GlobalAssignment - 
    // stored as ExternalLinkObjects 

    private ExternalLinkObjectCollection externalLinks; 

    // Publications associated to GlobalAssignment - stored as 
    // PublicationObject.

    protected PublicationObjectCollection publications;
    
    // Communications associated to GlobalAssignment - stored as 
    // CommunicationObject

    private CommunicationObjectCollection communications;
  
    /**
     * Creates an empty instance of GlobalAssignmentDetail
     */

    public GlobalAssignmentDetail() {}

    /**
     * Creates an instance of GlobalAssignmentDetail that represents the data
     * associated to the submitted globalAssignmentId.
     *
     * @param conn An active connection to the database
     * @param globalAssignmentId GlobalAssignment id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */

    public GlobalAssignmentDetail( DBconnection conn, 
                                   Long globalAssignmentId ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, globalAssignmentId );
    }

    /**
     * Implementation of name population method to satisfy the Detail
     * interface. However, retrieving assignments by name is impossible, 
     * so RecordNotFoundException will always be thrown if attempting to 
     * populate with this method.
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve data for
     * @throws RecordNotFoundException ---- WILL ALWAYS BE THROWN if this
     * method is invoked, since population by name is not possible in this
     * context
     */

    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	throw new RecordNotFoundException( "Cannot populate " +
					   "GlobalAssignmentDetail by name" );
    }



    /**
     * Retrieves data for submitted GlobalAssignment id and stores in member 
     * objects
     *
     * @param conn An active connection to the database
     * @param globalAssignmentId ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */

    public void get_information( DBconnection conn, Long globalAssignmentId ) 
	throws RecordNotFoundException, SQLException {
	
	this.globalAssignment = 
            new TfcGlobalAssignment( conn, globalAssignmentId );

	this.attributions =
	    new AttributionObjectCollection( conn, 
					     getTairObjectId() );

	this.annotations = 
	    new AnnotationObjectCollection( conn, 
					    getTairObjectId() );

	this.externalLinks =
	    new ExternalLinkObjectCollection( conn, 
					      getTairObjectId() );
	this.publications = 
	    new PublicationObjectCollection( conn, 
					     getTairObjectId(),
					     "tair_object" );
	this.communications = 
	    new CommunicationObjectCollection( conn, 
					       getTairObjectId() );
    }

    // TfcGlobalAssignment wrappers

    public Long getGlobalAssignmentId() {
	return globalAssignment.getGlobalAssignmentId();
    }

    public Long getTairObjectId() {
	return globalAssignment.get_tair_object_id();
    }

    public java.util.Date getDateEntered() { 
	return globalAssignment.getDateEntered();
    }

    /**
     * Determines if GlobalAssignment has associated attributions
     *
     * @return <code>true</code> if tair object has associated attributions, or
     * <code>false</code> if no attributions exist for tair object
     */

    public boolean hasAttributions() {
        return( attributions != null && !attributions.isEmpty() );
    }

    /**
     * Gets attributions for this GlobalAssignment as an <code>Iterator</code>
     * of <code>BsAttribution</code> objects.
     *
     * @return an <code>Iterator</code>of <code>BsAttribution</code> 
     * objects, or <code>null</code> if no attributions for this 
     * GlobalAssignment
     * @see BsAttribution
     */

    public List<BsAttribution> getAttributions() {
        return hasAttributions() ? attributions.getAttributions() : null;
    }

    /**
     * Retrieves all attributions of submitted type associated to 
     * GlobalAssignment
     *
     * @return Attributions of submitted type associated to GlobalAssignment 
     * as an <code>Iterator</code> of <code>BsAttribution</code> objects, 
     * or <code>null</code> if no attributions of attributionType are 
     * associated to GlobalAssignment
     * @see BsAttribution
     */

    public List<BsAttribution> getAttributions( String attributionType ) {
        return hasAttributions() ? 
	    attributions.getAttributions( attributionType ) : null;
    }

    /**
     * Determines if GlobalAssignment has associated publications
     *
     * @return <code>true</code> if tair object has associated publications, or
     * <code>false</code> if no publications exist for tair object
     * @see PublicationObject
     */

    public boolean hasPublications() {
        return ( publications != null && !publications.isEmpty() );
    }

    /**
     * Gets Publications as an <code>Iterator</code> of 
     * <code>PublicationObject</code>s.
     *
     * @return <code>Iterator</code> of <code>PublicationObject</code>s, or 
     * <code>null</code> if no publications associated to tair object
     */

    public Iterator getPublications() {
        return hasPublications() ? publications.iterator() : null;
    }

    /**
     * Determines if GlobalAssignment has associated communication references
     *
     * @return <code>true</code> if tair object has associated communication 
     * references, or <code>false</code> if no communication references exist 
     * for tair object
     */

    public boolean hasCommunicationReferences() {
        return ( communications != null && !communications.isEmpty() );
    }  

    
    /**
     * Gets communication references as an <code>Iterator</code> of 
     * <code>CommunicationObject</code> objects.
     *
     * @return <code>Iterator</code> of <code>CommunicationObject</code> 
     * objects, or <code>null</code> if no communications associated to tair 
     * object
     * @see CommunicationObject
     */

    public Iterator getCommunicationReferences() {
        return hasCommunicationReferences() ? communications.iterator() : null;
    }

    /**
     * Determines if GlobalAssignment has associated annotations
     *
     * @return <code>true</code> if tair object has associated annotations, or 
     * <code>false</code> if no annotations exist for tair object
     */

    public boolean hasAnnotations() {
        return( annotations != null && !annotations.isEmpty() );
    }  


    /**
     * Gets annotations for this GlobalAssignment as an <code>Iterator</code> 
     * of <code>AnnotationObject</code>s
     *
     * @return <code>Iterator</code> of <code>AnnotationObject</code>s or 
     * <code>null</code> if no annotations for this tair object.
     * @see AnnotationObject
     */

    public Iterator getAnnotations() {
        return hasAnnotations() ? annotations.iterator() : null;
    }

    /**
     * Determines if tair object has any external links associated to it
     *
     * @return <code>true</code> if tair object has external links associated
     * with it, or <code>false</code> if no external links for tair object
     */

    public boolean hasExternalLinks() { 
        return ( externalLinks != null && !externalLinks.isEmpty() );
    }

    /**
     * Gets external links for this GlobalAssignment as an 
     * <code>Iterator</code> of <code>ExternalLinkObject</code>s
     *
     * @return <code>Iterator</code> of <code>ExternalLinkObject</code>s or 
     * <code>null</code> if no external links for this tair object.
     * @see ExternalLinkObject
     */

    public Iterator getExternalLinks() {
        return hasExternalLinks() ? externalLinks.iterator() : null;
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
     * Retrieves element type of this object for use in creating TAIR 
     * accession number. Implemented here to satisfy the 
     * <code>Accessible</code> interface.
     * This implementation returns "global_assignment"
     *
     * @return Object's element type (tair object type) for use in creating 
     * TAIR accession
     */

    public String getElementType() { 
	return "global_assignment";
    }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR 
     * accession number. Implemented here to satisfy the 
     * <code>Accessible</code> interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */

    public final Long getSuperID() { 
	return getTairObjectId(); 
    }

    /**
     * For unit testing only
     */

    public void test() {

        System.out.println( "****** GlobalAssignmentDetail " +
                            "content test ******" );

	globalAssignment.test();

	if ( hasAttributions() ) {
	    // attributions.test();
	}

	if ( hasAnnotations() ) {
	    annotations.test();
	}
	
	if ( hasExternalLinks() ) {
	    externalLinks.test();
	}
	
	if ( hasPublications() ) {
	    publications.test();
	}

	if ( hasCommunicationReferences() ) {
	    communications.test();
	}
					     
        System.out.println( "**** GlobalAssignmentDetail " +
                            "content test end ****" );
    }
    
    /**
     * For unit testing only
     */

    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 933226 );
            GlobalAssignmentDetail detail = 
		new GlobalAssignmentDetail( conn, id );
            detail.test();
        } 
        catch ( Exception e) {
            e.printStackTrace();
        }
    }   
}
