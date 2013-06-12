//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/12/01 23:47:55 $
//-----------------------------------------------------------------------------

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the table LocalAssignment in the TAIR database. Each 
 * instance maps one row of data in LocalAssignment table. Each data object 
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.
 */

public class TfcLocalAssignment implements Comparable {
    
    private Long localAssignmentId;
    private Long globalAssignmentId;
    private Long superMapElementId;
    private Long subMapElementId;
    private Character orientation;
    private Double startPosition;
    private Double endPosition;
    private Float length;
    private String units;
    private java.util.Date dateLastModified;
    private java.util.Date dateEntered;

    /**
     * Creates an empty instance of TfcLocalAssignment
     */

    public TfcLocalAssignment() {}

    /**
     * Creates an instance of TfcLocalAssignment that contains an exact copy 
     * of all values in submitted sub assignment.  This constructor is used to 
     * quickly clone a sub assignment.
     *
     * @param sub Sub assignment to be cloned
     */

    public TfcLocalAssignment( TfcLocalAssignment sub ) {

        this.localAssignmentId = sub.getLocalAssignmentId();
        this.globalAssignmentId = sub.getGlobalAssignmentId();
        this.superMapElementId = sub.getSuperMapElementId();
        this.subMapElementId = sub.getSubMapElementId();
        this.startPosition = sub.getStartPosition();
        this.endPosition = sub.getEndPosition();
        this.length = sub.getLength();
        this.units = sub.getUnits();
	this.orientation = sub.getOrientation();
        this.dateLastModified = sub.getDateLastModified();
        this.dateEntered = sub.getDateEntered();
    }

    /**
     * Creates an instance of TfcLocalAssignment that reflects the data
     * referenced by submitted localAssignmentId
     *
     * @param conn An active connection to the database
     * @param localAssignmentId LocalAssignment id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException thrown if a database error occurs
     */

    public  TfcLocalAssignment( DBconnection conn, 
				Long localAssignmentId ) 
	throws RecordNotFoundException, SQLException {

        String query =
	    "SELECT local_assignment_id, " +
	    "global_assignment_id, " +
	    "super_map_element_id, " +
	    "sub_map_element_id, " +
	    "start_position, " +
	    "end_position, " +
	    "orientation, " +
	    "length, " +
	    "units, " +
	    "date_entered, " +
	    "date_last_modified " +
	    "FROM LocalAssignment " +
	    "WHERE local_assignment_id = " + localAssignmentId.toString();

	boolean found = processResults( conn, query );

	if ( !found ) {
	    throw new RecordNotFoundException( "No row found for " +
					       "local_assignment_id: " +
					       localAssignmentId );
	}
		       
    }

    
    /**
     * Executes JDBC SQL query on LocalAssignment table and stores data in 
     ** member variables.
     */
    private boolean processResults( DBconnection conn, String query ) 
        throws SQLException {

        conn.setQuery( query );

        ResultSet results = conn.getResultSet();	       

	boolean found = results.next();

        if ( found ) {
            long id = results.getLong( "local_assignment_id" );
            if ( !results.wasNull() ) {
                localAssignmentId = new Long( id );
            }

            id = results.getLong( "global_assignment_id" );
            if ( !results.wasNull() ) {
                globalAssignmentId = new Long( id );
            }
      
            id = results.getLong( "super_map_element_id" );
            if ( !results.wasNull() ) {
                superMapElementId = new Long( id );
            }
      
            id = results.getLong( "sub_map_element_id" );
            if ( !results.wasNull() ) {
                subMapElementId = new Long( id );
            }
      
            double d = results.getDouble( "start_position" );
            if ( !results.wasNull() ) {
                startPosition = new Double( d );
            }
      
            d = results.getDouble( "end_position" );
            if ( !results.wasNull() ) {
                endPosition = new Double( d );
            }
      
            float f = results.getFloat( "length" );
            if ( !results.wasNull() ) {
                setLength( new Float( f ) );
            }

	    String s = results.getString( "orientation" );
	    if ( s != null ) {
		setOrientation( new Character( s.charAt( 0 ) ) );
	    }
        
	    setUnits( results.getString( "units" ) );

            setDateEntered( results.getDate( "date_entered" ) );

            setDateLastModified( results.getDate( "date_last_modified" ) );
        }
	conn.releaseResources();

	return found;
    }

    public void setLocalAssignmentId ( Long id ) { 
	this.localAssignmentId = id; 
    }

    public Long getLocalAssignmentId() { 
	return localAssignmentId; 
    }

    public void setGlobalAssignmentId ( Long id ) { 
	this.globalAssignmentId = id; 
    }

    public Long getGlobalAssignmentId() { 
	return globalAssignmentId; 
    }

    public void setSuperMapElementId ( Long id ) { 
	this.superMapElementId = id; 
    }

    public Long getSuperMapElementId() { 
	return superMapElementId; 
    }

    public void setSubMapElementId ( Long id ) { 
	this.subMapElementId = id; 
    }

    public Long getSubMapElementId() { 
	return subMapElementId; 
    }

    public void setDateLastModified ( java.util.Date dateModified ) { 
	this.dateLastModified = dateModified; 
    }

    public java.util.Date getDateLastModified() { 
	return dateLastModified; 
    }

    public void setLength ( Float length ) { 
	this.length = length; 
    }

    public Float getLength() { 
	return length; 
    }

    public void setUnits ( String units ) {
	this.units = units; 
    }

    public String getUnits() { 
	return units; 
    }

    public void setDateEntered ( java.util.Date date ) { 
	this.dateEntered = date;
    }

    public java.util.Date getDateEntered() { 
	return dateEntered; 
    }

    /**
     * Returns a non-null value for assignment length.  This is done since not 
     * all assignments have a recorded length in the length field; since length
     * can be easily calculated using start and end positions, this method will
     * calculate the value and return it if length field in the db is null.
     *
     * <p>
     * If length cannot be calculated, a Float value of 0 (rather than null) 
     * will be returned
     *
     * @return Length of assignment (calculated if necessary), or 0 if length 
     * cannot be calculated
     */

    public Float getSafeLength() {

        Float safeLength = null;

        if ( getStartPosition() != null && getEndPosition() != null ) {
            double start = getStartPosition().doubleValue();
            double end = getEndPosition().doubleValue();
            double length = end - start + 1;
      
	    // Convert to float -- shouldn't ever cause truncation

            safeLength = new Float( length ); 
        } 
        else {
            safeLength = new Float( 0.0 );
        }

        return safeLength;
    }

    public void setOrientation ( Character orientation ) { 
	this.orientation = orientation; 
    }

    public Character getOrientation() {
	return orientation; 
    }

    public void setStartPosition ( Double position ) { 
	this.startPosition = position; 
    }

    public Double getStartPosition() { 
	return startPosition; 
    }

    public void setEndPosition ( Double position ) { 
	this.endPosition = position; 
    }

    public Double getEndPosition() { 
	return endPosition; 
    }
  
    /**
     * Returns start position as a string.  This is a convenience method for
     * displaying the position as a floating point number or as an integer,
     * depending on the units of assignment (bp = integer, all others = float).
     *
     * @return String representing start position, or <code>null</code> if
     * start position is <code>null</code>
     */

    public String getFormatStartPosition() {
        return getFormatPosition( getStartPosition() );
    }

    /**
     * Returns end position as a string.  This is a convenience method for
     * displaying the position as a floating point number or as an integer,
     * depending on the units of assignment 
     * ( bp = integer, all others = float ).
     *
     * @return String representing end position, or <code>null</code> if
     * end position is <code>null</code>
     */

    public String getFormatEndPosition() {
        return getFormatPosition( getEndPosition() );
    }

    // Utility method to translate position into string value using 
    // units as determination for returning value as a floating point number
    // or integer

    private String getFormatPosition( Double position ) {

        String formatPos = null;

        if ( position != null ) {
            if ( getUnits() == null || 
                 getUnits().equalsIgnoreCase( "bp" ) ) {
                formatPos = Integer.toString( position.intValue() );
            } 
            else {
                formatPos = position.toString();
            }
        }

        return formatPos;
    }


    /**
     * Returns a formatted display value for orientation, which
     * is stored in the database as simply "F" or "R".  This
     * method translates that value to be "forward" or "reverse";
     * a null value for orientation will result in "unknown" being
     * returned
     *
     * @return formatted display value for assignment orientation
     */

    public String getFormatOrientation() {

        String formatOrientation = null;

        if ( getOrientation() != null ) {
            if ( getOrientation().charValue() == 'F' ) {
                formatOrientation = "forward";
            } 
            else if ( getOrientation().charValue() == 'R' ) {
                formatOrientation = "reverse";
            }
        } 
        else {
            formatOrientation = "unknown";
        }
        
        return formatOrientation;
    }

    public int compareTo( Object tfcLocalAssignment ) {

        int result = -1; 

        if ( tfcLocalAssignment != null ) {
            TfcLocalAssignment another = 
                ( TfcLocalAssignment ) tfcLocalAssignment;     
            if ( another.getStartPosition() != null && 
		 getStartPosition() != null ) {
                result = 
                    getStartPosition().compareTo( another.getStartPosition() );
            } 
            else if ( getStartPosition() != null ) {
                result = 1;
            } 
            else if ( another.getStartPosition() != null ) {
                result = -1;
            }
        } 
        else { // nulls
            result = -1;
        }

        return result;
    }

    /**
     * For unit testing only
     */

    public void test() {

        System.out.println( "****** TfcLocalAssignment content test ******" );
        System.out.println( "local_assignment_id: " + getLocalAssignmentId() );
        System.out.println( "global_assignment_id: " + 
                            getGlobalAssignmentId() );
        System.out.println( "sub_map_element_id: " + getSubMapElementId() );
        System.out.println( "super_map_element_id: " + 
                            getSuperMapElementId() );
        System.out.println( "start_position: " + getStartPosition() );
        System.out.println( "format start position: " + 
                            getFormatStartPosition() );
        System.out.println( "end_position: " + getEndPosition() );
        System.out.println( "format end position: " + getFormatEndPosition() );
        System.out.println( "length: " + getLength() );
        System.out.println( "units: " + getUnits() );
        System.out.println( "safe length: " + getSafeLength() );
	System.out.println( "orientation: " + getOrientation() );
	System.out.println( "format orientation: " + getFormatOrientation() );
        System.out.println( "date_last_modified: " + getDateLastModified() );
        System.out.println( "date_entered " + getDateEntered() );
        System.out.println( "**** TfcLocalAssignment content test end ****" );
    }

    /**
     * For unit testing only
     */

    public static void main( String[] args ) {

        try {
            DBconnection conn = new DBconnection();
            Long testId = new Long( 28191 );
            TfcLocalAssignment localAssignment = 
                new TfcLocalAssignment( conn, testId ); 
            localAssignment.test();
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
