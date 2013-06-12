//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.24 $
// $Date: 2004/07/28 20:00:38 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * AssemblyUnitReferenceDetail is a composite class to represent all 
 * information associated with an entry in the AssemblyUnit table for 
 * display on the assembly unit detail page. AssemblyUnitDetail contains
 * an instance of <code>TfcAssemblyUnit</code>, a collection of all clones
 * associated with assembly unit, and a collection of counts for various 
 * element types that are mapped onto assembly unit (clone, EST, genetic 
 * marker).  AssemblyUnitDetail also contains all information from the
 * <code>MapElementDetail</code> and <code>TairObjectDetail</code> 
 * superclasses, although the collection of map feature assignments 
 * (elements mapped onto assembly unit) in this case will only contain gene 
 * assignments since all others are contained in collection of element counts.
 */

public class AssemblyUnitDetail extends MapElementDetail {

    private TfcAssemblyUnit assembly_unit;

    // Contains clones associated with AssemblyUnit as Clone objects

    private CloneCollection clones;

    // Simple counts of map features assigned onto assembly unit - used
    // instead of full AssignmentObjectCollection of map features normally 
    // populated in MapElementDetail since the number of elements can be so 
    // large for assembly units -- AssignmentObjectCollection will still be 
    // created, though it will only contain genes assigned onto assembly unit

    private ElementCountCollection elementCounts;

    /**
     * Creates an empty instance of AssemblyUnitDetail
     */

    public AssemblyUnitDetail() {
	super();
    }
    
    /**
     * Creates an instance of AssemblyUnitDetail that represents all 
     * information for the assembly unit with supplied assembly unit id.
     *
     * @param conn An active connection to the database
     * @param assembly_unit_id The assembly unit id to retrieve data for.
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */

    public AssemblyUnitDetail( DBconnection conn, Long assembly_unit_id ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, assembly_unit_id );
    }

    /**
     * Creates an instance of AssemblyUnitDetail that represents all 
     * information for the assembly unit with supplied assembly unit name
     *
     * @param conn An active connection to the database
     * @param name The assembly unit name to retrieve data for.
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */

    public AssemblyUnitDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }

    //
    // TfcAssemblyUnit wrappers
    //

    public Long get_assembly_unit_id() {
	return assembly_unit.get_assembly_unit_id();
    }

    public String get_name() { 
	return assembly_unit.get_name();
    }

    public String get_chromosome() {
	return assembly_unit.get_chromosome();
    }

    public String get_seq_status() {
	return assembly_unit.get_seq_status();
    }

    public String get_seq_status_translation() { 
	return assembly_unit.get_seq_status_translation();
    }

    public Float get_length() { 
	return assembly_unit.get_length();
    }

    public String get_units() { 
	return assembly_unit.get_units();
    }

    public String get_ic_accession() {
	return assembly_unit.get_ic_accession(); 
    }

    public Character get_orientation() {
	return assembly_unit.get_orientation();
    }

    public String get_right_overlap_clone() { 
	return assembly_unit.get_right_overlap_clone();
    }

    public Integer get_right_overlap_size() {
	return assembly_unit.get_right_overlap_size();
    }

    public String get_left_overlap_clone() { 
	return assembly_unit.get_left_overlap_clone(); 
    }

    public Integer get_left_overlap_size() {
	return assembly_unit.get_left_overlap_size();
    }

    public String get_note() { 
	return assembly_unit.get_note(); 
    }

    public java.util.Date get_date_last_modified() {
	return assembly_unit.get_date_last_modified();
    }

    public java.util.Date get_date_entered() { 
        return assembly_unit.get_date_entered();
    }
    
    public String get_original_name() { 
        return assembly_unit.get_original_name();
    }

    /**
     * Retrieves right overlap size of assembly unit
     *
     * @return Right overlap size of Assembly Unit as a String with 
     * "bp" units appended to it.
     */

    public String get_format_right_overlap_size() {
        return ( get_right_overlap_size() != null ) ? 
	    get_right_overlap_size().toString() + " bp" : null;
    }

    /**
     * Retrieves left overlap size of assembly unit
     *
     * @return Left overlap size of Assembly Unit as a String with 
     * "bp" units appended to it.
     */

    public String get_format_left_overlap_size() {
        return ( get_left_overlap_size() != null ) ? 
	    get_left_overlap_size().toString() + " bp" : null;
    }

    /**
     * Determines if assembly unit has any associated clones
     *
     * @return <code>true</code> if assembly unit has associated clones, or 
     * <code>false</code> if no clones associated to assembly unit
     */

    public boolean hasClones() {
        return ( clones != null && !clones.isEmpty() );
    }

    /**
     * Retrieves clones associated to assembly unit
     *
     * @return Clones associated with this AssemblyUnit as an 
     * <code>Iterator</code> of <code>TfcClone</code> objects, or 
     * <code>null</code> if no clones associated with assembly unit
     */ 

    public Iterator get_clone() {
        return ( hasClones() ) ? clones.iterator() : null;
    }

    /**
     * Retrieves information to populate object using submitted 
     * assembly unit name
     *
     * @param conn An active connection to the database
     * @param name Assembly unit name to retrieve data for
     * @throws SQLException if a database error occurs
     */

    public void get_information( DBconnection conn, String name ) 
	throws SQLException {

	Long id = TfcAssemblyUnit.retrieveAssemblyUnitID( conn, name );
	get_information( conn, id );
    }

    /**
     * Retrieves information to populate object using submitted assembly unit 
     * id
     *
     * @param conn An active connection to the database
     * @param assembly_unit_id Assembly unit id to retrieve data for
     * @throws SQLException if a database error occurs
     */

    public void get_information( DBconnection conn, Long assembly_unit_id ) 
	throws SQLException {            

	assembly_unit = new TfcAssemblyUnit( conn, assembly_unit_id );
	super.populateBaseObject( assembly_unit );

	clones = 
	    new CloneCollection( conn, assembly_unit_id, "assembly_unit" ); 

	// Manually populate MapElementDetail & TairObjectDetail elements so we
	// can substitute ElementCountCollection for feature assignment 
	// AssignmentObjectCollection and only populate feature assignments 
	// with genes

	Long mapElementID = get_map_element_id();
	Long tairObjectID = get_tair_object_id();

	// Map element info

	super.populateShowMapViewer( conn, mapElementID, 
				     get_map_element_type() );
	
	super.populateIsAGIMap( conn, mapElementID );
	super.populateFlankingSequences( conn, mapElementID );
	super.populateNTSequences( conn, mapElementID );
	
	// TAIR object info

	super.populateAliases( conn, tairObjectID );
	super.populateAttributions( conn, tairObjectID );
	super.populateUpdateHistory( conn, tairObjectID );
	super.populateAnnotations( conn, tairObjectID );
	super.populateExternalLinks( conn, tairObjectID );
	super.populateNotepad( conn, tairObjectID );
	super.populateImages( conn, tairObjectID );
	super.populatePublications( conn, tairObjectID );
	super.populateAnalysisReferences( conn, tairObjectID );
	super.populateDatabaseReferences( conn, tairObjectID );
	super.populateCommunications( conn, tairObjectID );
        super.populateGlobalAssignments( conn, mapElementID, "gene" );

	// Get map features assigned onto assembly unit as simple 
	// element counts.
	//
	// Each ElementCount object contains the number of that type of objects
	// assigned onto assembly unit as well as a URL that can be used to 
	// link to the search results pages for that element type

	this.elementCounts = new ElementCountCollection( conn, 
							 mapElementID, 
							 "assembly_unit" );
    }

    /**
     * Determines if assembly unit has a count of associated elements of 
     * submitted type
     *
     * @return <code>true</code> If assembly unit has a count of associated 
     * elements of submitted type of <code>false</code> if assembly unit has
     * no associated elements of submitted type
     */

    public boolean hasElementCount( String type ) {
        return ( elementCounts != null && 
		 elementCounts.hasElementCount( type ) );
    }

    /**
     * Retrieves number of elements of submitted type associated to 
     * assembly unit
     *
     * @return Number of elements of submitted type associated to 
     * assembly unit
     */

    public ElementCount getElementCount( String type ) {
        return hasElementCounts() ? elementCounts.get( type ) : null;
    }

    /**
     * Retrieves counts of all associated elements to assembly unit
     *
     * @return Counts of associated elements to assembly unit as an 
     * <code>Iterator</code> of <code>ElementCount</code> objects, or 
     * <code>null</code> if no associated elements to assembly unit
     */

    public Iterator getElementCounts() {
        return ( elementCounts != null && !elementCounts.isEmpty() ) ? 
	    elementCounts.getElementCounts() : null;
    }
  
    /**
     * Determines whether assembly unit has any associated element counts
     *
     * @return <code>true</code> if assembly unit has associated element 
     * counts, or  <code>false</code> if assembly unit has no associated 
     * element counts
     */

    public boolean hasElementCounts() {
        return ( elementCounts != null && !elementCounts.isEmpty() );
    }

    /**
     * For unit testing only
     */

    public void test() {

        super.test();
        if ( assembly_unit != null ) {
            assembly_unit.test();
        }
        if ( hasClones() ) {
            clones.test();
        }
    }

    /**
     * main function is used to for testing only 
     */

    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 1 );
            AssemblyUnitDetail object = new AssemblyUnitDetail( conn, 
								test_id );
            object.test();
            object = new AssemblyUnitDetail( conn, "TEL1N" );
            object.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
