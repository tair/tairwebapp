//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2004/07/28 20:00:38 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * CloneEnd extends <code>TfcCloneEnd</code> to present complete information
 * about a given clone end. In addition to clone end data, CloneEnd contains 
 * collections of nucleotide sequences to the clone end. Collection of 
 * nucleotide sequences is created so that all data for each sequence is 
 * retrieved except the sequence text itself. CloneEnd also contains a 
 * collection of globalAssignments for clone end; this collection is not 
 * automatically populated through the constructor, but can be populated 
 * through the populateGlobalAssignments() method. This is done so that 
 * globalAssignments are only retrieved when explicitly needed for display 
 * (as on LocusDetail page)
 */

public class CloneEnd extends TfcCloneEnd {

    // Sequences stored as TfcNucleotideSequence objects

    private NucleotideSeqCollection sequences;

    // Chromosome values from AGI map assignments -- needed for creating
    // valid links to seq viewer

    private String[] agiChromosomes;

    // GlobalAssignments for CloneEnd stored as TfcGlobalAssignment objects

    private GlobalAssignmentCollection globalAssignments;

    /**
     * Creates an empty instance of CloneEnd
     */ 

    public CloneEnd() { 
	super();
    }

    /**
     * Creates an instance of CloneEnd that reflects the data referenced 
     * by submitted clone_end_id
     *
     * @param conn An active connection to the database
     * @param clone_end_id Clone end id to retrieve data for
     * @exception SQLException if a database error occurs
     */

    public CloneEnd( DBconnection conn, Long clone_end_id ) 
	throws SQLException {

	super( conn, clone_end_id );
	retrieveSequences( conn, get_map_element_id() );
	this.agiChromosomes = 
	    TfcMapElement.getAGIChromosomes( conn, 
					     get_map_element_id() );
    }

    /**
     * @return Nucleotide sequences associated with this clone end
     * as an <code>Iterator</code> of <code>TfcNucleotideSequence</code>
     * objects, or <code>null</code> if no nt sequences associated
     * with clone end
     */ 

    public Iterator get_nucleotide_sequences() {

	Iterator iter = null;

	if ( sequences != null && !sequences.isEmpty() ) {
	    iter = sequences.iterator();
	}

	return iter;
    }

    /**
     * Retrieves nucleotide sequences given map element id
     */

    private void retrieveSequences( DBconnection conn, Long map_element_id ) 
	throws SQLException {

	if ( map_element_id != null ) {
	    sequences = new NucleotideSeqCollection( conn, map_element_id );
	}
    }

    /**
     * Determines if clone end is mapped onto the AGI map by checking
     * whether object contains any chromosome values from AGI GlobalAssignments
     *
     * @return <code>true</code> if clone end has a GlobalAssignment on AGI 
     * map, or <code>false</code> if no GlobalAssignment exists for gene on 
     * AGI map
     */

    public boolean get_is_agi_map() {
	return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }

    /**
     * Retrieves list of chromosomes from clone end's GlobalAssignments onto
     * AGI map. This list is needed for creating hyperlinks to display element
     * in seq viewer, which can only display elements w/AGI map 
     * GlobalAssignments, and which can only display sequences on a single  
     * chromosome at a time. This list should be used to create multiple  
     * links to seq viewer if clone end has multiple chromosomes (see utility  
     * method HTMLFactory.createSeqViewerLinks() for more info on how this  
     * list is used to create hyperlinks
     *
     * @return List of chromosomes from clone end's GlobalAssignments onto 
     *         AGI map as a String array, or <code>null</code> if no 
     *         GlobalAssignments onto AGI map found for clone end
     */

    public String[] getAGIChromosomes() {
	return agiChromosomes;
    }

    /**
     * Populates collection of GlobalAssignments for clone end using clone 
     * end's map element id.  If map element id is <code>null</code> collection
     * will be empty
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */

    public void populateGlobalAssignments( DBconnection conn ) 
        throws SQLException {

	if ( get_map_element_id() != null ) {
	    globalAssignments = 
                new GlobalAssignmentCollection( conn, get_map_element_id() );
	}
    }

    /**
     * @return GlobalAssignments for this clone end as an <code>Iterator</code>
     * of <code>TfcGlobalAssignment</code> objects, or <code>null</code> if no 
     * globalAssignments for clone end, or if globalAssignment collection 
     * hasn't been explicitly populated
     */

    public Iterator getGlobalAssignments() { 
	return ( globalAssignments != null && !globalAssignments.isEmpty() ) ? 
	    globalAssignments.iterator() : null;
    }

    /**
     * For unit testing only
     */

    public void test() {

	System.out.println( "******* CloneEnd content test ******" );
	super.test();

	if ( sequences != null && !sequences.isEmpty() ) {
	    sequences.test();
	}

	System.out.println( "Is agi map: " + get_is_agi_map() );
	System.out.println( "***** CloneEnd content test end ****" );
    }

    /**
     * For unit testing only
     */

    public static void main( String[] args ) {

	try {
	    DBconnection connection = new DBconnection();
	    Long test_id = new Long( 6258 );
	    CloneEnd clone_end = new CloneEnd( connection, test_id );
	    clone_end.test();

	    test_id = new Long( 32858 );
	    clone_end = new CloneEnd( connection, test_id );
	    clone_end.test();
	} 
        catch ( Exception e ) {
	    e.printStackTrace();
	}     
    }
}
  








