//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/09/30 21:09:09 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.util.*;
import java.sql.*;

import org.tair.bs.community.BsAttribution;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * GlobalAssignment is a composite class that extends
 * <code>TfcGlobalAssignment</code> to present detailed information about a
 * GlobalAssignment. Since GlobalAssignments can be made to any type of map
 * element, this object contains properties that are child specific for 
 * creating links to TairObject detail pages (i.e. map element name, map  
 * element type link type, link name). These values can be for either the  
 * map element of the GlobalAssignment or for the Map of the  
 * GlobalAssignment. Which values are retrieved is determined by which  
 * constructor is used to create the object. These values will only  
 * represent the map element if the GlobalAssignment( connection,  
 * id, mapSubAssignment) constructor is used and mapSubAssignment is true. All  
 * other constructors will cause this info to be retrieved for the Map  
 * used for GlobalAssignment.
 * 
 * <p. In addition to GlobalAssignment information, GlobalAssignment
 * contains collections of LocalAssignments, AssignmentFeatures, 
 * Annotations and Attributions.
 */

public class GlobalAssignment extends TfcGlobalAssignment {

    // Detail information about the Map onto which the assignment is on.

    private TfcMap map;

    // Name of map or map feature used in GlobalAssignment

    private String mapElementName;

    // Display type for map or map element. For maps, this
    // is Map.type value, for all others should equal
    // map element type from MapElementType table

    private String mapElementType;

    // Value to use for type when creating links to TairServlet
    // for displaying detail pages This should always equal
    // value in MapElementType

    private String linkType;

    // Tair object id of map or map element

    private Long mapElementTairObjectId;

    // Id to pass to TairServlet for display of linked feature detail

    private Long linkId;

    // Value for chromosome in map element (comes from child table)

    private String mapElementChromosome;

    // Description for map element - contents vary depending on type

    private String mapElementDescription;

    // Super assignments of type LocalAssignment associated with this 
    // GlobalAssignment.

    private LocalAssignmentObjectCollection superAssignments;

    // Sub assignments of type LocalAssignment associated with this 
    // GlobalAssignment.

    private LocalAssignmentObjectCollection subAssignments;

    // Feature assignments associated to this GlobalAssignment stored as
    // TfcAssignmentFeature objects.

    private AssignmentFeatureCollection assignmentFeatures;

    // Annotations associated to this GlobalAssignment stored as
    // AnnotationObject
    // objects

    private AnnotationObjectCollection annotations;

    // Attributions for this GlobalAssignment stored as BsAttribution
    // objects

    private AttributionObjectCollection attributions;

    /**
     * Creates an empty instance of GlobalAssignment
     */

    public GlobalAssignment() {}

    /**
     * Creates an instance of GlobalAssignment that contains data for the
     * submitted GlobalAssignment id. Associated map element info. is retrieved
     * for the map GlobalAssignment is onto.
     * 
     * @param conn An active connection to the database
     * @param globalAssignmentId GlobalAssignment id to retrieve data for
     * @exception SQLException In the case various exceptions
     */

    public GlobalAssignment( DBconnection conn, Long globalAssignmentId )
        throws SQLException {

        // Build the TfcGlobalAssigment object in the super class.

        super( conn, globalAssignmentId );

        // Retrieve the Map information in a TfcMap object.

        map = new TfcMap( conn, getMapId() );

        // Retrieve the collection of super assignments of type 
        // LocalAssignment. 

        this.superAssignments = 
            new LocalAssignmentObjectCollection( conn, globalAssignmentId );

        // Retrieve the collection of sub assignments of type LocalAssignment. 

        this.subAssignments = 
            new LocalAssignmentObjectCollection( conn, getMapElementId(), 
                                                 true );

        // Retrieve the collection of AssignmentFeatures. Note that we use
        // getSafeLength() to make sure length is non-null.

        this.assignmentFeatures = 
            new AssignmentFeatureCollection( conn,
                                             globalAssignmentId );

        // Populate the MapElement information variables.  In this case the
        // data is for the Map.

        getMapElementInfo( conn, getMapElementId() );

        // Collect any Attribution objects associated with this 
        // GlobalAssignment.

        attributions = new AttributionObjectCollection( conn, 
                                                        get_tair_object_id() );

        // Collect any Annotation objects associated with this 
        // GlobalAssignment.

        annotations = new AnnotationObjectCollection( conn, 
                                                      get_tair_object_id() );
    }

    /**
     * Creates an instance of GlobalAssignment that contains data for the
     * submitted GlobalAssignment id. Associated map element info. is retrieved
     * for the map GlobalAssignment is onto.
     * 
     * @param conn An active connection to the database
     * @param globalAssignmentId GlobalAssignment id to retrieve data for
     * @param elementType Map element type to restrict sub assignments to
     * @exception SQLException In the case various exceptions
     */

    public GlobalAssignment( DBconnection conn, Long globalAssignmentId,
                             String elementType )
        throws SQLException {

        // Build the TfcGlobalAssigment object in the super class.

        super( conn, globalAssignmentId );

        // Retrieve the Map information in a TfcMap object.

        map = new TfcMap( conn, getMapId() );

        // Retrieve the collection of super assignments of type 
        // LocalAssignment. 

        this.superAssignments = 
            new LocalAssignmentObjectCollection( conn, getMapElementId() );

        // Retrieve the collection of sub assignments of type LocalAssignment. 

        this.subAssignments = 
            new LocalAssignmentObjectCollection( conn, getMapElementId(), 
                                                 elementType );

        // Retrieve the collection of AssignmentFeatures. Note that we use
        // getSafeLength() to make sure length is non-null.

        this.assignmentFeatures = 
            new AssignmentFeatureCollection( conn, globalAssignmentId );

        // Populate the MapElement information variables.  In this case the
        // data is for the Map.

        getMapElementInfo( conn, getMapElementId() );

        // Collect any Attribution objects associated with this 
        // GlobalAssignment.

        attributions = new AttributionObjectCollection( conn, 
                                                        get_tair_object_id() );

        // Collect any Annotation objects associated with this 
        // GlobalAssignment.

        annotations = new AnnotationObjectCollection( conn, 
                                                      get_tair_object_id() );
    }

    /*
     * Retrieves info for map element GlobalAssignment points to by
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

        linkType = ObjectTyper.getMapElementType( conn, mapElementId,
                                                  false );

        // Primary key field should always be type literal value followed 
        // by "_id"
        // ugh.. kinda gross, but should always work.

        String idColumn = linkType + "_id";

        // Begin building the query string.

        query = new StringBuffer();
        query.append( "SELECT tair_object_id, " + idColumn + 
                      " AS link_id, " + "name, " + "chromosome, " );

        // Get description for genes, else plant null value for everyone
        // else.

        if ( table.equals( "Gene" ) ) {
            query.append( "description, " );
        } 
        else {
            query.append( "NULL AS description, " );
        }

        // Get map_type as element type for Maps, else plant map element
        // type (saved as linkType) for everyone else.

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
     * Determines if map element has any sub assignments, i.e. any assignments
     * of the current map element onto any other map element other than Maps.
     *
     * @return <code>true</code> if map element has sub assignments or
     * <code>false</code> if element has no sub assignments
     */

    public boolean hasSuperAssignments() {
        return ( superAssignments != null && !superAssignments.isEmpty() );
    }

    /**
     * Returns super assignments for this map element as an 
     * <code>Iterator</code> of <code>LocalAssignment</code>s
     *
     * @return an <code>Iterator</code> of <code>LocalAssignment</code>s
     * for this map element, or <code>null</code> if no super assignments.
     * @see SuperAssignment
     */  
  
    public Iterator getSuperAssignments() {
        return ( hasSuperAssignments() ) ? superAssignments.iterator() : null;
    }

    /**
     * Determines if map element has any sub assignments, i.e. any assignments
     * onto the current map element
     *
     * @return <code>true</code> if map element has sub assignments or
     * <code>false</code> if element has no sub assignments
     */

    public boolean hasSubAssignments() {
        return ( subAssignments != null && !subAssignments.isEmpty() );
    }

    /**
     * Returns sub assigments for this map element as an <code>Iterator</code>
     * of <code>LocalAssignment</code>s
     *
     * @return an <code>Iterator</code> of <code>LocalAssignment</code>s
     * for this map element, or <code>null</code> if no sub assignments
     * @see SubAssignment
     */  
  
    public Iterator getSubAssignments() {
        return ( hasSubAssignments() ) ? subAssignments.iterator() : null;
    }

    /**
     * Retrieves features assignments of GlobalAssignment
     * 
     * @return Feature assignments for this GlobalAssignment as an
     *         <code>Iterator</code> of <code>TfcAssignmentFeature</code>
     *         objects, or <code>null</code> if no feature assingments for
     *         this GlobalAssignment object
     */

    public Iterator getAssignmentFeatures() {
        return hasAssignmentFeatures() ? assignmentFeatures.iterator() : null;
    }

    /**
     * Returns AssignmentFeatures for GlobalAssignment object. This version
     * allows option of excluding cds 
     * (assignmentFeatureType = "coding_region" )
     * from returned values
     * 
     * @param checkCDs If <code>true</code>, AssignmentFeature collection
     *            will first be examined to see if it contains an ORF; if so,
     *            cds will be excluded from Iterator, since they are redundant
     *            at that point; if <code>false</code>, all features will be
     *            returned
     * @return Feature assignments for this GlobalAssignment as an
     *         <code>Iterator</code> of <code>TfcAssignmentFeature</code>
     *         objects, or <code>null</code> if no AssignmentFeatures for this
     *         GlobalAssignment object.
     */

    public Iterator getAssignmentFeatures( boolean checkCDs ) {
        return hasAssignmentFeatures() ? 
            assignmentFeatures.iterator( checkCDs ) : null;
    }

    /**
     * Retrieves all AssignmentFeatures of submitted AssignmentFeature type
     * associated to GlobalAssignment
     * 
     * @return Feature assignments of submitted type as an 
     *         <code>Iterator</code> of <code>TfcAssignmentFeature</code> 
     *         objects or <code>null</code> if no features of requested 
     *         type are in collection
     */

    public Iterator getAssignmentFeatures( String assignmentFeatureType ) {
        return hasAssignmentFeatures() ? 
            assignmentFeatures.iterator( assignmentFeatureType ) : null;
    }

    /**
     * Determines if GlobalAssignment has AssignmentFeatures
     * 
     * @return <code>true</code> if GlobalAssignment has AssignmentFeatures,
     *         or <code>false</code> if no AssignmentFeatures for
     *         GlobalAssignment
     */

    public boolean hasAssignmentFeatures() {
        return ( assignmentFeatures != null && !assignmentFeatures.isEmpty() );
    }

    /**
     * Retrieves annotations for this GlobalAssignment
     * 
     * @return Annotations for this GlobalAssignment as an 
     *         <code>Iterator</code> of <code>AnnotationObject</code>s, 
     *         or <code>null</code> if no annotations for this GlobalAssignment
     */

    public Iterator getAnnotations() {
        return ( annotations != null && !annotations.isEmpty() ) ? 
            annotations.iterator() : null;
    }

    /**
     * Retreives attributions for this GlobalAssignment
     * 
     * @return Attributions for this GlobalAssignment as an
     *         <code>Iterator</code> of <code>BsAttribution</code>s, or
     *         <code>null</code> if no attributions for this GlobalAssignment
     */

    public List<BsAttribution> getAttributions() {
        return ( attributions != null && !attributions.isEmpty() ) ? 
            attributions.getAttributions() : null;
    }

    /**
     * Retrieves attribution submitted by source
     * 
     * @return Source for "submitted by" attribution for this GlobalAssignment,
     *         or <code>null</code> if no attribution of this type exists for
     *         GlobalAssignment.
     * @throws SQLException when can't lazily load community for attribution
     */

    public String getSubmittedBySource() throws SQLException {
        Iterator<BsAttribution> iter = getAttributions().iterator();
        String source = null;
        BsAttribution attribution = null;

        if ( iter != null ) {
            while ( iter.hasNext() ) {
                attribution = iter.next();
                if ( attribution.getType().getAttributionType() != null && 
                     attribution.getType().getAttributionType().
                     equals( "submitted_by" ) ) {
                    source = attribution.getCommunity().getName();
                    break;
                }
            }
        }
        return source;
    }

    /**
     * Retrieves date for submitted by attribution
     * 
     * @return Date for "submitted by" attribution for this GlobalAssignment, 
     *         or <code>null</code> if no attribution of this type exists for
     *         GlobalAssignment
     */

    public java.util.Date getSubmittedByDate() {
        Iterator<BsAttribution> iter = getAttributions().iterator();
        java.util.Date attributionDate = null;
        BsAttribution attribution = null;

        if ( iter != null ) {
            while ( iter.hasNext() ) {
                attribution = (BsAttribution) iter.next();
                if ( attribution.getType().getAttributionType() != null
                    && attribution.getType().getAttributionType()
                            .equals( "submitted_by" ) ) {
                    attributionDate = attribution.getAttributionDate();
                    break;
                }
            }
        }
        return attributionDate;
    }

    /**
     * Retrieves name of map or map feature of GlobalAssignment
     * 
     * @return Name of map or map feature of GlobalAssignment. Value comes from
     *         child table (i.e. gene, clone etc. not map element)
     */

    public String getMapElementName() {
        return mapElementName;
    }

    /**
     * Retrieves map element type associated map element
     * 
     * @return Display type for map element. If map element is a Map, this is
     *         the value in map.type, for all others this is mapElementType.
     */

    public String getMapElementType() {
        return mapElementType;
    }

    /**
     * Retrieves type value to use for creating links to TairServlet. This
     * should be the same value as map element type
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
     * Retrieves chromosome for associated map element
     * 
     * @return chromosome that map element has from GlobalAssignment
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
     * Determines is GlobalAssignment has attributions or annotations
     * 
     * @return <code>true</code> if GlobalAssignment has attributions or
     *         annotations associated with it or <code>false</code> if no
     *         attributions or annotations for GlobalAssignment
     */

    public boolean hasDetails() {
        return ( getAttributions() != null || getAnnotations() != null );
    }

    // TfcMap wrappers

    public String getMapName() {
        return map.get_name();
    }

    public String getMapType() {
        return map.get_map_type();
    }

    public Long getMapTairObjectId() {
        return map.get_tair_object_id();
    }

    public String getMapChromosome() {
        return map.get_chromosome();
    }

    /**
     * For unit testing only
     */

    public void test() {
        System.out
                .println( "***** GlobalAssignment content test *****" );
        super.test();
        System.out.println( "map element name: " + getMapElementName() );
        System.out.println( "map element type: " + getMapElementType() );
        System.out.println( "map element tair object id: " + 
                            getMapElementTairObjectId() );
        System.out.println( "link type: " + getLinkType() );
        System.out.println( "link id: " + getLinkId() );
        System.out.println( "map element chromosome: " + 
                            getMapElementChromosome() );
        System.out.println( "map element description: " + 
                            getMapElementDescription() );

        if ( hasSuperAssignments() ) {
            superAssignments.test();
        }

        if ( hasAssignmentFeatures() ) {
            assignmentFeatures.test();
        }

        if ( annotations != null && !annotations.isEmpty() ) {
            annotations.test();
        }
        if ( attributions != null && !attributions.isEmpty() ) {
            // attributions.test();
        }

        try {
          System.out.println( "submitted by: " + getSubmittedBySource() );
        } catch (SQLException e) {
          e.printStackTrace();
        }
        System.out.println( "submission date: " + getSubmittedByDate() );
        System.out.println( "**** GlobalAssignment " +
                            "content test end ****" );
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

            //GlobalAssignment assignment = new GlobalAssignment(
            // connection, id );

            // get map feature info

            GlobalAssignment assignment = new GlobalAssignment( conn, id );
            assignment.test();
        }
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}

