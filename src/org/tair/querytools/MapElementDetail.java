//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.50 $
// $Date: 2004/07/28 20:00:39 $
//----------------------------------------------------------------------------- 

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;

/**
 * MapElementDetail is a composite class to represent all information
 * associated with an entry in the Map Element table. This class is used 
 * only as a superclass for child elements (gene, clone etc).  
 * MapElementDetail contains a reference to a concrete child instance 
 * of <code>TfcMapElement</code> for referencing MapElement conceptual 
 * data as well as collections of flanking sequences, GlobalAssignments, map 
 * sub assignments and other map elements in addition to all information
 * in <code>TairObjectDetail</code> superclass.
 *
 * <p>
 * MapElementDetail overrides the getElementType() method implemented in 
 * TairObjectDetail to satisfy Accessible interface so that a type specific 
 * element type can be returned. Sub-classes of MapElementDetail must override 
 * the getElementType() method to return the proper type parameter for the 
 * sub-class
 */

public abstract class MapElementDetail extends TairObjectDetail {

    // Base reference for this object instance. Will actually reference a
    // concrete instance of a child class such as TfcClone

    private TfcMapElement mapElement;

    // flanking sequences associated with element - stored as 
    // TfcFlankingSequence objects

    private FlankingSequenceVector flankingSequences;

    // GlobalAssignments for this map element.

    private GlobalAssignmentObjectCollection globalAssignments;

    // Nucleotide sequences stored as Sequence

    private NTSequenceCollection ntSequences;

    // Chromosome values from AGI map GlobalAssignments -- needed for creating
    // valid links to seq viewer

    private String[] agiChromosomes;
    
    // Chromosome values from ALY map GlobalAssignments 

    private String[] alyChromosomes;

    // Flag to determine if link to map viewer can be made for this map element

    private boolean showMapViewerLink = false;

    /**
     * Empty constructor provided so that sub-classes can provide the no 
     * argument constructor with no problems.
     */     
      
    public MapElementDetail() { }
  
    /**
     * Creates an instance of MapElementDetail child class to represent data
     * referenced by submitted id
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve data for
     * @throws RecordNotFoundException if no record found for submitted id
     * @throws SQLException if a database error occurs
     */

    public MapElementDetail( DBconnection conn, Long id ) 
	throws RecordNotFoundException, SQLException {       

	get_information( conn, id );
    }
  
    /**
     * Retrieves object's map_element_id
     *
     * @return a <code>Long</code> value specifying the map_element_id
     */

    public Long get_map_element_id() { 
	return mapElement.get_map_element_id(); 
    }

    /**
     * Retrieves object's map_element_type_id
     *
     * @return a <code>Long</code> value specifying the map_element_type_id
     */

    public Long get_map_element_type_id() {
        return mapElement.get_map_element_type_id();
    }

    /**
     * Gets the map_element_type
     *
     * @return a <code>String</code> value specifying the map_element_type
     */

    public String get_map_element_type() {
        return mapElement.get_map_element_type();
    }

    /**
     * Determines if map element has flanking sequences
     *
     * @return <code>true</code> if map element has flanking sequences or
     * <code>false</code> if element has no flanking sequences
     */

    public boolean hasFlankingSequences() {
        return ( flankingSequences != null && !flankingSequences.isEmpty() );
    }

    /**
     * Returns the flanking sequences for this map element as an 
     * <code>Iterator</code> of <code>TfcFlankingSequence</code> objects
     *
     * @return an <code>Iterator</code> of <code>TfcFlankingSequence</code> 
     * objects value specifying the flanking_sequences for this map element, 
     * or <code>null</code> if no flanking sequences 
     */   
 
    public Iterator get_flanking_sequence() {
        return hasFlankingSequences() ? flankingSequences.iterator() : null;
    }

    /**
     * Returns an <code>Iterator</code> of <code>TfcFlankingSequence</code>s 
     * where type equals the requested type of flanking sequences
     *
     * @param type Type of Flanking Sequence to return
     * @return <code>Iterator</code> of <code>TfcFlankingSequence</code>s with 
     * the requested type, or <code>null</code> if no objects in collection 
     * have the requested type. If submitted type is <code>null</code>, all 
     * flanking sequences in the collection will be returned
     */

    public Iterator get_flanking_sequence( String type ) {
        return hasFlankingSequences() ? 
	    flankingSequences.get_flanking_sequences( type ) : null;
    }

    /**
     * Determines if map element has any global assignments
     *
     * @return <code>true</code> if map element has global assignments or
     * <code>false</code> if element has no global assignments
     */

    public boolean hasGlobalAssignments() {
        return ( globalAssignments != null && !globalAssignments.isEmpty() );
    }

    /**
     * Returns the global assigments for this map element as an 
     * <code>Iterator</code> of <code>GlobalAssignment</code>s
     *
     * @return an <code>Iterator</code> of <code>GlobalAssignment</code>s
     * for this map element, or <code>null</code> if no global assignments.
     * @see GlobalAssignment
     */  
  
    public Iterator getGlobalAssignments() {
        return ( hasGlobalAssignments() ) ? 
            globalAssignments.iterator() : null;
    }

    /**
     * Determines if map element has any sub assignments
     *
     * @return <code>true</code> if map element has sub assignments or
     * <code>false</code> if element has no sub assignments
     */

    public boolean hasSubAssignments() {

        if ( hasGlobalAssignments() ) {
            Iterator globalAssignmentIter = getGlobalAssignments();

            while  ( globalAssignmentIter.hasNext() ) { 
                GlobalAssignment globalAssignment = 
                    (GlobalAssignment) globalAssignmentIter.next();

                if ( globalAssignment.hasSubAssignments() ) { 
                    return true;
                }
            }
        }

        return false;
    }

    /**
     * Determines if map element has any assignment features
     *
     * @return <code>true</code> if map element has assignment features or
     * <code>false</code> if element has no assignment features
     */

    public boolean hasAssignmentFeatures() {

        if ( hasGlobalAssignments() ) {
            Iterator globalAssignmentIter = getGlobalAssignments();

            while  ( globalAssignmentIter.hasNext() ) { 
                GlobalAssignment globalAssignment = 
                    (GlobalAssignment) globalAssignmentIter.next();

                if ( globalAssignment.hasAssignmentFeatures() ) { 
                    return true;
                }
            }
        }

        return false;
    }

    /**
     * Determines if map element nucleotide sequences
     *
     * @return <code>true</code> if map element has nucleotide sequences or
     * <code>false</code> if element has no nucleotide sequences
     */

    public boolean hasSequences() {
        return ( ntSequences != null && !ntSequences.isEmpty() );
    }

    /**
     * Returns nucleotide_sequences for this map element as an 
     * <code>Iterator</code> of <code>Sequence</code> objects
     *
     * @return <code>Iterator</code> of <code>Sequence</code> objects, or 
     * <code>null</code> if no sequences for this MapElement
     */  

    public Iterator get_sequences() {
        return ( hasSequences() ) ? ntSequences.iterator() : null;
    }

    /**
     * Determines if map element is mapped onto the AGI map by checking
     * whether object contains any chromosome values from AGI GlobalAssignments
     *
     * @return <code>true</code> if element is mapped onto the AGI map;
     * <code>false</code> if element has no GlobalAssignments onto AGI map
     */ 

    public boolean get_is_agi_map() {
        // if list of chromosomes from AGI map GlobalAssignments is not null 
        // or empty element is mapped onto AGI map
        return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }
    
    public boolean get_is_aly_map() {
        // if list of chromosomes from LYRATA map GlobalAssignments is not null 
        // or empty element is mapped onto LYRATA map
        return ( alyChromosomes != null && alyChromosomes.length > 0 );
    }

    /**
     * Retrieves list of chromosomes from map element's GlobalAssignments onto
     * AGI map. This list is needed for creating hyperlinks to display element
     * in seq viewer, which can only display elements w/AGI map 
     * GlobalAssignments, and which can only display sequences on a single 
     * chromosome at a time. This list should be used to create multiple 
     * links to seq viewer if element has multiple chromosomes (see utility 
     * method HTMLFactory.createSeqViewerLinks() for more info on how this 
     * list is used to create hyperlinks
     *
     * @return List of chromosomes from map element's GlobalAssignments onto 
     * AGI map as a String array, or <code>null</code> if no GlobalAssignments 
     * onto AGI map found for element
     */

    public String[] getAGIChromosomes() {
        return agiChromosomes;
    }
                                       
    /**
     * Determines whether a link to map viewer can be made for this map 
     * element. This  is done according to logic in 
     * TfcMapElement.showMapViewerLink() which examines map element's 
     * globalAssignment data to make determination.
     *
     * @return <code>true</code> if a link to map viewer can be made, or 
     * <code>false</code> if no link to map viewer can be made
     */

    public boolean showMapViewerLink() {
        return showMapViewerLink;
    }
  
    /**
     * Gateway method to retrieve all MapElement level data. This method
     * uses the populateXXX methods to retrieve data. This method assumes
     * that concrete child of TfcMapElement has already been created in
     * sub-class and a reference has been set here in superclass using
     * populateBaseObject method.
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */

    public final void getMapElementInformation( DBconnection conn ) 
	throws SQLException {

	populateShowMapViewer( conn, 
			       get_map_element_id(), 
			       get_map_element_type() );

	populateIsAGIMap( conn, get_map_element_id() );
	populateIsALYMap( conn, get_map_element_id() );
	populateGlobalAssignments( conn, get_map_element_id() );
	populateFlankingSequences( conn, get_map_element_id() );
	populateNTSequences( conn, get_map_element_id() );
    }

    /**
     * Set internal reference for TfcMapElement to concrete class (inheriting
     * from TfcMapElement) created in sub-class.  After setting local 
     * reference, mapElement is submitted to TairObjectDetail so 
     * TfcTairObject reference can be set there as well.
     *
     * @param mapElement Object to set as map element reference
     */

    protected void populateBaseObject( TfcMapElement mapElement ) {
	this.mapElement = mapElement;
	super.populateBaseObject( mapElement );
    }

    /**
     * Populate collection of global assignments for submitted map element id.
     * Global assignments are those assignments of the submitted map element
     * onto any Map and are acquired from the GlobalAssignment table.
     *
     * @param conn An active connection to the database
     * @param map_element_id Identifier of the map element to retrieve 
     *                       global assignments for
     * @throws SQLException if a database error occurs
     */

    protected void populateGlobalAssignments( DBconnection conn, 
                                              Long map_element_id )
	throws SQLException {

	this.globalAssignments = 
            new GlobalAssignmentObjectCollection( conn, map_element_id );
    }

    /**
     * Populate collection of global assignments for submitted map element id.
     * Global assignments are those assignments of the submitted map element
     * onto any Map and are acquired from the GlobalAssignment table.
     *
     * @param conn An active connection to the database
     * @param map_element_id Identifier of the map element to retrieve 
     *                       global assignments for
     * @param elementType Map element type to restrict sub assignments to
     * @throws SQLException if a database error occurs
     */

    protected void populateGlobalAssignments( DBconnection conn, 
                                              Long map_element_id,
                                              String elementType )
	throws SQLException {

	this.globalAssignments = 
            new GlobalAssignmentObjectCollection( conn, map_element_id, 
                                                  elementType );
    }

    /**
     * Populate collection of flanking sequences for submitted map element id
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */

    protected void populateFlankingSequences( DBconnection conn, 
					      Long map_element_id ) 
	throws SQLException {

	this.flankingSequences = new FlankingSequenceVector( conn, 
							     map_element_id );
    }

    /**
     * Populate collection of nucleotide sequences for submitted map element 
     * id. Collection is populated so that each sequence contains all data 
     * about the sequence while omitting the actual sequence text
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */

    protected void populateNTSequences( DBconnection conn,
					Long map_element_id ) 
	throws SQLException {

	this.ntSequences = new NTSequenceCollection( conn, 
						     map_element_id, 
						     false );
    }

    /**
     * Populate collection of nucleotide sequences for submitted map element 
     * id. Collection is populated so that each sequence contains all data 
     * about the sequence while optionally including the actual sequence text 
     * according to the value of submitted getSequence flag.
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @param getSequence If <code>true</code> NT sequence text will be 
     * retrieved for each Sequence object; if <code>false</code> sequence text 
     * will be omitted
     * @throws SQLException if a database error occurs
     */

    protected void populateNTSequences( DBconnection conn, 
					Long map_element_id,
					boolean getSequence ) 
        throws SQLException {
	
	this.ntSequences = new NTSequenceCollection( conn, 
						     map_element_id, 
						     getSequence );
    }
    
    /**
     * Determines whether map element is mapped onto the AGI map by retrieving
     * a list of all chromosome values for map element's GlobalAssignments 
     * onto AGI map.  These values are needed to create valid links to seq 
     * viewer for displaying element in viewer
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws SQLException if a database error occurs
     */

    protected void populateIsAGIMap( DBconnection conn, 
                                     Long map_element_id )
	throws SQLException {

	this.agiChromosomes = TfcMapElement.getAGIChromosomes( conn, 
							      map_element_id );
    }
    
    protected void populateIsALYMap( DBconnection conn, 
            Long map_element_id )
    throws SQLException {

    this.alyChromosomes = TfcMapElement.getALYChromosomes( conn, 
	      map_element_id );
}

    /**
     * Determines whether a link to map viewer can be made for this map 
     * element. This  is done according to logic in 
     * TfcMapElement.showMapViewerLink() which examines map element's 
     * globalAssignment data to make determination.
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @param map_element_type Map element id's type
     * @throws SQLException if a database error occurs
     */

    protected void populateShowMapViewer( DBconnection conn, 
                                          Long map_element_id, 
                                          String map_element_type ) 
        throws SQLException {

	this.showMapViewerLink = 
	    TfcMapElement.showMapViewerLink( conn, 
					     map_element_id, 
					     map_element_type );
    }
 
    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> 
     * interface.  This implementation overrides that in TairObjectDetail 
     * superclass to return the more specific map element type value.
     *
     * @return Object's element type (map element type) for use in creating 
     * TAIR accession
     */

    public String getElementType() { 
        return get_map_element_type(); 
    }

    /**
     * For unit testing only
     */

    public void test() {

        super.test();
        System.out.println( "****** MapElementDetail content test ******" );

        if ( mapElement != null ) {
            mapElement.test();
        }

        if ( hasFlankingSequences() ) {
            flankingSequences.test();
        }

        if ( hasFlankingSequences() ) {
            globalAssignments.test();
        }

        if ( hasSequences() ) {
            ntSequences.test();
        }
        System.out.println( "**** MapElementDetail content test end ****" );
    }

}
