//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 19:18:17 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.util.*;
import java.sql.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * LocalAssignment is a composite class that extends
 * <code>TfcLocalAssignment</code> to present map element information about a
 * LocalAssignment. Two map elements are referenced by all LocalAssignments but
 * this composite class is designed to make available the information about 
 * only one of these two map elements because the objects that instantiate 
 * this class should already know about one of the map elements.  For example, 
 * a Gene detail page will typically instantiate an object of this class to 
 * provide information about which map elements this Gene is assigned onto.  
 * Therefore, the default map element retrieved is the map element onto which 
 * another map element is assigned onto.  In other situations, like 
 * AssemblyUnits, it may be desired to retrieve map element information about 
 * elements assigned onto the AssemblyUnit.  In this case, the sub map 
 * element data is retrieved.  Use the alternate constructor that includes 
 * the <code>getSubMapElementInfo</code> flag in its signature to specify 
 * which map element to retrieve information for.
 */

public class LocalAssignment extends TfcLocalAssignment {

    // Private instance variables.

    private String mapElementName;
    private String mapElementType;
    private String mapElementChromosome;
    private String mapElementDescription;
    private Long mapElementTairObjectId;
    private String linkType;
    private Long linkId;

    /**
     * Creates an empty instance of LocalAssignment
     */

    public LocalAssignment() {}

    /**
     * Creates an instance of LocalAssignment that contains data for the
     * submitted LocalAssignment id. By default, this constructor retrieves 
     * information for the map element onto which an assignment has been made. 
     * In other words, it retrieves the MapElement information for the 
     * super_map_element_id for the specified row in the LocalAssignment table.
     * 
     * @param conn An active connection to the database
     * @param localAssignmentId LocalAssignment id to retrieve data for
     * @exception SQLException In the case various exceptions
     */

    public LocalAssignment( DBconnection conn, Long localAssignmentId )
        throws SQLException {

        // Build the TfcLocalAssigment object via the super class.

        super( conn, localAssignmentId );

        // Retrieve the super map element data. 

	getMapElementInfo( conn, getSuperMapElementId() );
    }

    /**
     * Creates an instance of LocalAssignment that contains data for the
     * submitted LocalAssignment id. This constructor retrieves information 
     * for the map element of choice, depending on the value of the boolean 
     * flag <code>getSubMapElementInfo</code>. If the flag is 
     * <code>true</code>, it retrieves the MapElement information for the 
     * sub_map_element_id for the specified row in the LocalAssignment table.  
     * If the flag is <code>false</code>, it retrieves the MapElement 
     * information for the super_map_element_id for the specified row in the 
     * LocalAssignment table.  Note that a <code>false</code> value is 
     * equivalent to calling the previous constructor with no flag.
     * 
     * @param conn An active connection to the database
     * @param localAssignmentId LocalAssignment id to retrieve data for
     * @param getSubMapElementInfo Boolean flag indicating which MapElement 
     *                             information is to be retrieved for this 
     *                             LocalAssignment.  If <code>true</code>, 
     *                             the information retrieved is for the 
     *                             MapElement for which the assignment is 
     *                             for, whereas if the flag is 
     *                             <code>false</code>, the information 
     *                             retrieved is for the MapElement onto which 
     *                             the assignment is on.
     * @exception SQLException In the case various exceptions
     */

    public LocalAssignment( DBconnection conn, Long localAssignmentId,
			    boolean getSubMapElementInfo )
        throws SQLException {

        // Build the TfcLocalAssigment object via the super class.

        super( conn, localAssignmentId );

        // Retrieve the MapElement information depending on the value of the
	// getSubMapElementInfo flag.  If the flag = true, the information
	// retrieved is for the MapElement for which the assignment is for,
	// whereas if the flag is false, the information retrieved is for the
	// MapElement onto which the assignment is on.

	if ( getSubMapElementInfo ) {
	    getMapElementInfo( conn, getSubMapElementId() );
	}
	else {
	    getMapElementInfo( conn, getSuperMapElementId() );
	}
    }

    /*
     * Retrieves info for map element LocalAssignment points to by
     * determining which child table of map element to query
     */

    private void getMapElementInfo( DBconnection conn, Long mapElementId )
        throws SQLException {

        // Local instance variables.

        StringBuffer query = null;
        ResultSet results = null;
        String table = null;

        // Get map element child table to go to for other info

        table = ObjectTyper.getMapElementTable( conn, mapElementId, false );

        // Save map_element_type as linkType for creating links to detail
        // pages

        linkType = ObjectTyper.getMapElementType( conn, mapElementId, false );

        // Primary key field should always be type literal value followed 
        // by "_id"
        // ugh.. kinda gross, but should always work.

        String idColumn = linkType + "_id";

        // Begin building the query string.

        query = new StringBuffer();
        query.append( "SELECT tair_object_id, " + 
                      idColumn + " AS link_id, " + 
		      "name, chromosome, " );

        // Get description for genes, else plant null value for everyone
        // else.

        if ( table.equals( "Gene" ) ) {
            query.append( "description, " );
        } 
        else {
            query.append( "NULL AS description, " );
        }

        // Get type as element type for Maps, else plant map element
        // type for everyone else.

        if ( table.equals( "Map" ) ) {
            query.append( "map_type AS map_type " );
        } 
        else {
            query.append( TextConverter.dbQuote( linkType ) + 
                          " AS map_type " );
        }

        // Construct remainder of query string.

        query.append( "FROM " + table + " " );
        query.append( "WHERE map_element_id = " + 
                      mapElementId.toString() );

        // Query the database.

        conn.setQuery( query.toString() );
        results = conn.getResultSet();

        // Populate the instance variables for MapElement info.

        if ( results.next() ) {
            this.mapElementTairObjectId = 
                new Long( results.getLong( "tair_object_id" ) );
            this.linkId = new Long( results.getLong( "link_id" ) );
            this.mapElementName = results.getString( "name" );
            this.mapElementType = results.getString( "map_type" );
            this.mapElementDescription = 
                results.getString( "description" );
            this.mapElementChromosome = 
                results.getString( "chromosome" );
        }

        conn.releaseResources();
    }

    /**
     * Retrieves name of map or map feature of LocalAssignment
     * 
     * @return Name of map or map feature of LocalAssignment. Value comes from
     *         child table (i.e. gene, clone etc. not map element)
     */

    public String getMapElementName() {
        return mapElementName;
    }

    /**
     * Retrieves map element type associated map element
     * 
     * @return Display type for map element.
     */

    public String getMapElementType() {
        return mapElementType;
    }

    /**
     * Retrieves chromosome for associated map element
     * 
     * @return chromosome that map element has from LocalAssignment
     */

    public String getMapElementChromosome() {
        return mapElementChromosome;
    }

    /**
     * Retrieves description for map element - should be null unless map 
     * element is a gene
     * 
     * @return type specific descriptive field for map element
     */

    public String getMapElementDescription() {
        return mapElementDescription;
    }

    /**
     * Retrieves map or map feature's tair object id
     * 
     * @return tair object id of map or map feature
     */

    public Long getMapElementTairObjectId() {
        return mapElementTairObjectId;
    }

    /**
     * Retrieves type value to use for creating links to TairServlet. This
     * should be the same value as map element type with one exception.
     *
     * @return Type to pass to TairServlet for display of linked element detail
     */

    public String getLinkType() { 
        return linkType; 
    }

    /**
     * Retrieves id to use for creating links to TairServlet for linked element
     * detail.
     * 
     * @return id to pass to TairServlet for display of linked element detail
     */

    public Long getLinkId() {
        return linkId;
    }

    /**
     * For unit testing only
     */

    public void test() {

        System.out.println( "***** LocalAssignment content test *****" );
        super.test();
        System.out.println( "map element name: " + getMapElementName() );
        System.out.println( "map element type: " + getMapElementType() );
        System.out.println( "map element tair object id: " + 
                            getMapElementTairObjectId() );
        System.out.println( "link id: " + getLinkId() );
        System.out.println( "map element chromosome: " + 
                            getMapElementChromosome() );
        System.out.println( "map element description: " + 
                            getMapElementDescription() );
        System.out.println( "**** LocalAssignment content test end ****" );
    }

    /**
     * For unit testing only
     */

    public static void main( String[] args ) {

        try {
            DBconnection conn = new DBconnection();

            // Long id = new Long( 960330 );

            Long id = new Long( 1785767 ); // polymorphism

            // get map info.

            //LocalAssignment assignment = new LocalAssignment(
            // connection, id );

            // get map feature info

            LocalAssignment assignment = 
                new LocalAssignment( conn, id, true );
            assignment.test();
        }
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}

