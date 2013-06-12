//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 18:59:36 $
//-----------------------------------------------------------------------------

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the AssignmentFeature table in the tair database. Each 
 * instance maps one row of data in AssignmentFeature table. Each data object 
 * maps to one field of a row in the table.
 */


public class TfcAssignmentFeature {   
    private Long assignmentFeatureId;
    private Long globalAssignmentId;
    private String type;
    private Float startPosition;
    private Float endPosition;
    private Float length;

    /**
     * Creates an empty instance of TfcAssignmentFeature
     */

    public TfcAssignmentFeature() { }

    /**
     * Creates an instance of TfcAssignmentFeature that contains an exact 
     * copy of all values in submitted feature assignment.  This constructor 
     * is used to quickly clone a feature assignment
     *
     * @param feature Feature assignment to clone
     */

    public TfcAssignmentFeature( TfcAssignmentFeature feature ) {
        this.assignmentFeatureId = feature.getAssignmentFeatureId();
        this.type = feature.getType();
        this.globalAssignmentId = feature.getGlobalAssignmentId();
        this.startPosition = feature.getStartPosition();
        this.endPosition = feature.getEndPosition();
        this.length = feature.getLength();
    }

    /**
     * Creates an instance of TfcAssignmentFeature that reflects the data
     * referenced by submitted assignmentFeatureId
     *
     * @param conn An active connection to the database
     * @param assignmentFeatureId Feature assignment id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database 
     * error
     */

    public TfcAssignmentFeature( DBconnection conn, 
                                 Long assignmentFeatureId ) 
        throws SQLException {
        String query = null;

        if ( assignmentFeatureId != null ) {
            query =
                "SELECT assignment_feature_id, "+
                "assignmentfeature_type, "+
                "global_assignment_id, "+
                "start_position, "+
                "end_position, "+
                "length "+
                "FROM AssignmentFeature "+
                "WHERE assignment_feature_id = " + 
                assignmentFeatureId.toString();
            processResults( conn, query );
        }
    }

    private void processResults( DBconnection conn, String query ) 
        throws SQLException {
        ResultSet results = null;

        conn.setQuery( query );
        results = conn.getResultSet();	       

        if ( results.next() ) {
            long id = results.getLong( "assignment_feature_id" );
            if ( !results.wasNull() ) {
                assignmentFeatureId = new Long( id );
            }

            id = results.getLong( "global_assignment_id" );
            if ( !results.wasNull() ) {
                globalAssignmentId = new Long( id );
            }
      
            type = results.getString( "assignmentfeature_type" );
      
            float f = results.getFloat( "start_position" );
            if ( !results.wasNull() ) {
                startPosition = new Float( f );
            }
      
            f = results.getFloat( "end_position" );

            if ( !results.wasNull() ) {
                endPosition = new Float( f );
            }
      
            f = results.getFloat( "length" );

            if ( !results.wasNull() ) {
                length = new Float( f );
            }

            conn.releaseResources();
        }
    }

    public void setAssignmentFeatureId ( Long value ) { 
        assignmentFeatureId = value; 
    }

    public Long getAssignmentFeatureId() { 
        return assignmentFeatureId; 
    }

    public void setType ( String value ) { 
        type = value; 
    }

    public String getType() { 
        return type; 
    }

    public void setGlobalAssignmentId ( Long value ) { 
        globalAssignmentId = value; 
    }

    public Long getGlobalAssignmentId() { 
        return globalAssignmentId; 
    }

    public void setStartPosition ( Float value ) { 
        startPosition = value; 
    }

    public Float getStartPosition() { 
        return startPosition; 
    }

    public void setEndPosition ( Float value ) { 
        endPosition = value; 
    }

    public Float getEndPosition() { 
        return endPosition; 
    }

    /**
     * @return End position as a formatted string ( rounded int value for 
     * float ), or <code>null</code> if no end position for feature assignment
     */

    public String getFormatEndPosition() {
        String formatPos = ( getEndPosition() != null ) ? 
            Integer.toString( getEndPosition().intValue() ) : null;
        return formatPos;
    }
  
    /**
     * @return Start position as a formatted string ( rounded int value for 
     * float ), or <code>null</code> if no start position for feature 
     * assignment
     */

    public String getFormatStartPosition() {
        String formatPos = ( getStartPosition() != null ) ? 
            Integer.toString( getStartPosition().intValue() ) : null;
        return formatPos;
    }
  
    public void setLength ( Float value ) { 
        length = value; 
    }

    public Float getLength() { 
        return length; 
    }

    /**
     * Recalculates value of feature assignment length using current
     * values for start and stop position. This method is offered since
     * assignment positions can be changed when manually calculating UTRs
     * and exons and it's helpful to have an easy way to update length.
     */

    public void calculateLength() {
        int start = getStartPosition().intValue();
        int end = getEndPosition().intValue();
        setLength( new Float( end - start + 1 ) );
    }

    /**
     * Determines if this feature assignment instance is equal to submitted 
     * feature.  Features are considered equal if they have the same 
     * start & end positions and feature types
     */

    public boolean equals( TfcAssignmentFeature feature ) {
        boolean retval = false;
        if ( feature == null ) {
            return retval;
        } 
        else {
            if ( startPosition.equals( feature.getStartPosition() ) && 
                 endPosition.equals( feature.getEndPosition() ) && 
                 type. equals( feature.getType() ) ) {
                retval = true;
            }
        }
        return retval;
    }
    
    /**
     * For unit testing only
     */

    public void test() {
        System.out.println( "***** TfcAssignmentFeature content test *****" );
        System.out.println( "assignment_feature_id: " + 
                            getAssignmentFeatureId() );
        System.out.println( "type: " + getType() );
        System.out.println( "global_assignment_id: " + 
                            getGlobalAssignmentId() );
        System.out.println( "start_position: " + getStartPosition() );
        System.out.println( "end_position: " + getEndPosition() );
        System.out.println( "length: " + getLength() );
        System.out.println( "*** TfcAssignmentFeature content test end ***" );
    }
  
    /**
     * For unit testing only
     */

    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 642 );
            TfcAssignmentFeature feature = 
                new TfcAssignmentFeature( conn, id );
            feature.test();
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
