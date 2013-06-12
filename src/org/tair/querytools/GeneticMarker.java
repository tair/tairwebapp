//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2004/07/28 20:00:38 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * GeneticMarker extends <code>TfcGeneticMarker</code> to present more complete
 * information about a given genetic marker. In addition to marker data, 
 * GeneticMarker contains collections of assignments, aliases and map elements 
 * associated to the genetic marker
 */

public class GeneticMarker extends TfcGeneticMarker {

    // Aliases for this genetic marker - stored as TfcAlias

    private AliasVector alias_vector;

    // GlobalAssignments for genetic marker - stored as TfcGlobalAssignment

    private GlobalAssignmentCollection globalAssignments;

    // Chromosome values from AGI map assignments -- needed for creating
    // valid links to seq viewer

    private String[] agiChromosomes;

    /**
     * Creates an empty instance of GeneticMarker
     */ 

    public GeneticMarker() { 
        super();
    }

    /**
     * Creates an instance of GeneticMarker to represent the data
     * referenced by submitted genetic marker id
     *
     * @param conn An active connection to the database
     * @param genetic_marker_id Genetic marker id to retrieve data for
     * @throws SQLException if a database error occurs
     */

    public GeneticMarker( DBconnection conn, Long genetic_marker_id ) 
	throws SQLException {

        super( conn, genetic_marker_id );

	set_alias_vector( conn, super.get_tair_object_id() );
	setGlobalAssignments( conn, super.get_map_element_id() );

        if ( globalAssignments != null && !globalAssignments.isEmpty() ) {
            this.agiChromosomes = 
		TfcMapElement.getAGIChromosomes( conn, 
						 get_map_element_id() );
        }
    }

    /**
     * @return aliases as a comma delimited string, or <code>null</code> 
     * if no aliases for genetic marker
     */ 

    public String get_alias_string() {

        StringBuffer buffer = null;
        String aliases = null;
        boolean first = true;
        TfcAlias alias = null;
        Iterator iter = get_aliases();

        if ( iter != null ) {
            buffer = new StringBuffer();

            while ( iter.hasNext() ) {
                alias = (TfcAlias) iter.next();

                if ( !first ) {
                    buffer.append( ", " );
                }

                buffer.append( alias.get_alias() );
                first = false;
            }

            aliases = buffer.toString();
        }

        return aliases;
    }

    /*
     * Retrieve aliases given tair object id
     */

    private void set_alias_vector( DBconnection conn, Long tair_object_id ) 
	throws SQLException {
	alias_vector = new AliasVector( conn, tair_object_id );
    }

    /**
     * @return Aliases for this genetic marker as an <code>Iterator</code> of
     * <code>TfcAlias</code> objects, or <code>null</code> if no aliases for
     * this marker
     */ 

    public Iterator get_aliases() {

        Iterator iter = null;

        if ( alias_vector != null && !alias_vector.isEmpty() ) {
            iter = alias_vector.iterator();
        }

        return iter;
    }

    /*
     * Retrieve globalAssignments given marker's map element id
     */

    private void setGlobalAssignments( DBconnection conn, 
                                       Long map_element_id ) 
	throws SQLException {
	globalAssignments = new GlobalAssignmentCollection( conn, 
                                                            map_element_id );
    }

    /**
     * @return GlobalAssignments for this genetic marker as an 
     * <code>Iterator</code> of <code>TfcGlobalAssignment</code> objects, 
     * or <code>null</code> if no globalAssignments for this marker
     */ 

    public Iterator getGlobalAssignments() {

        Iterator iter = null;

        if ( globalAssignments != null && !globalAssignments.isEmpty() ) {
            iter = globalAssignments.iterator();
        }

        return iter;
    }
   
    /**
     * Determines if genetic marker is mapped onto the AGI map by checking
     * whether object contains any chromosome values from AGI assignments
     *
     * @return <code>true</code> if genetic marker has an assignment on AGI 
     * map, or <code>false</code> if no assignment exists for genetic marker 
     * on AGI map
     */

    public boolean get_is_agi_map() {
        return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }

    /**
     * Retrieves list of chromosomes from genetic marker's assignments onto
     * AGI map. This list is needed for creating hyperlinks to display element
     * in seq viewer, which can only display elements w/AGI map assignments, 
     * and which can only display sequences on a single chromosome at a time. 
     * This list should be used to create multiple links to seq viewer if 
     * genetic marker has multiple chromosomes (see utility method 
     * HTMLFactory.createSeqViewerLinks() for more info on how this list is
     * used to create hyperlinks
     *
     * @return List of chromosomes from genetic marker's assignments onto AGI 
     * map as a String array, or <code>null</code> if no assignments onto AGI 
     * map found for genetic marker
     */

    public String[] getAGIChromosomes() {
        return agiChromosomes;
    }
 
    /**
     * For unit testing only
     */

    public void test(){

        System.out.println( "****** Genetic Marker content test ******" );
        super.test();
        int length = 0;

        if ( alias_vector != null && alias_vector.size() != 0 ){
            alias_vector.test();
        }

        if ( globalAssignments != null && globalAssignments.size() != 0 ){
            globalAssignments.test();
        }

        System.out.println( "**** GeneticMarker content test end ****" );   
    }

    /**
     * For unit testing only
     */

    public static void main( String[] args ) {
        
        try{
            DBconnection connection = new DBconnection();
            Long test_id = new Long( 1503 );
            GeneticMarker marker = new GeneticMarker( connection, test_id );
            marker.test();
        } 
        catch( Exception e ) {
            e.printStackTrace();
        }
    }

}
  
