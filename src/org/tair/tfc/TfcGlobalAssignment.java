//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/12/01 23:47:55 $
//-----------------------------------------------------------------------------

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the table GlobalAssignment in the tair database. Each 
 * instance maps one row of data in GlobalAssignment table. Each data object 
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.
 */

public class TfcGlobalAssignment extends TfcTairObject implements Comparable {
    
    private Long globalAssignmentId;
    private Long mapElementId;
    private Long mapId;
    private String assignmentBasis;
    private Float globalassignment_range;
    private Character orientation;
    private Double startPosition;
    private Double endPosition;
    private Boolean isDerived;
    private Float length;
    private String units;
    private Boolean isObsolete;
    private java.util.Date dateLastModified;
    private java.util.Date dateEntered;

    /**
     * Creates an empty instance of TfcGlobalAssignment
     */

    public TfcGlobalAssignment() { 
	super();
    }

    /**
     * Creates an instance of TfcGlobalAssignment that reflects the data
     * referenced by submitted globalAssignmentId

     * @param conn An active connection to the database
     * @param globalAssignmentId GlobalAssignment id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException thrown if a database error occurs
     */
    
    public TfcGlobalAssignment( DBconnection conn, 
				Long globalAssignmentId ) 
	throws RecordNotFoundException, SQLException {

        super( conn, globalAssignmentId );
    }

    /**
     * Implements abstract method in superclass to return "GlobalAssignment" 
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */

    public final String getTableName() {
	return "GlobalAssignment";
    }

    /**
     * Implements abstract method in superclass to return 
     * "global_assignment_id" as name of primary key column to use when 
     * creating SQL statement for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */

    public final String getKeyColumn() {
	return "global_assignment_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all GlobalAssignment specific columns to be included in SQL SELECT 
     * statement when populating object.
     *
     * @return String array of all table specific columns to include in SELECT 
     * statement when populating object.
     */

    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "global_assignment_id",
	    "map_id", 
	    "map_element_id", 
	    "start_position",
	    "end_position",
	    "length",
	    "units",
	    "orientation",
	    "assignment_basis",
	    "globalassignment_range",
	    "is_derived",
	    "is_obsolete",
	    "date_entered",
	    "date_last_modified"
	};	    
	
	return localClassColumns;
    }

    /**
     * Retrieves GlobalAssignment specific data from result set and store in 
     * member variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */

    public final void populate( ResultSet results ) 
        throws SQLException {

 	setGlobalAssignmentId( new Long( results.
                                         getLong( "global_assignment_id" ) ) );

	setMapId( new Long( results.getLong( "map_id" ) ) );

	setMapElementId( new Long( results.getLong( "map_element_id" ) ) );
	
	double d = results.getDouble( "start_position" );
	if ( !results.wasNull() ) {
	    setStartPosition( new Double( d ) );
	}
	
	d = results.getDouble( "end_position" );
	if ( !results.wasNull() ) {
            setEndPosition( new Double( d ) );
        }
	
	float f = results.getFloat( "length" );
	if ( !results.wasNull() ) {
	    setLength( new Float( f ) );
	}
        
	setUnits( results.getString( "units" ) );

	String s = results.getString( "orientation" );
	if ( s != null ) {
	    setOrientation( new Character( s.charAt( 0 ) ) );
	}
        
	setAssignmentBasis( results.getString( "assignment_basis" ) );

	f = results.getFloat( "globalassignment_range" );
	if ( !results.wasNull() ) {
	    setRange( new Float( f ) );
	}

	setIsDerived( TextConverter.
                      stringToBoolean( results.getString( "is_derived" ) ) );
        
	setIsObsolete( TextConverter.
                       stringToBoolean( results.
                                        getString( "is_obsolete" ) ) );
                
	setDateEntered( results.getDate( "date_entered" ) );

	setDateLastModified( results.getDate( "date_last_modified" ) );
    }

    public void setGlobalAssignmentId ( Long id ) { 
	this.globalAssignmentId = id; 
    }

    public Long getGlobalAssignmentId() { 
	return globalAssignmentId; 
    }

    public void setMapElementId ( Long id ) { 
	this.mapElementId = id; 
    }

    public Long getMapElementId() { 
	return mapElementId; 
    }

    public void setMapId ( Long id ) { 
	this.mapId = id; 
    }

    public Long getMapId() { 
	return mapId; 
    }

    public void setAssignmentBasis ( String basis ) { 
	this.assignmentBasis = basis; 
    }

    public String getAssignmentBasis() { 
	return assignmentBasis; 
    }

    public void setRange ( Float globalassignment_range ) { 
	this.globalassignment_range = globalassignment_range; 
    }

    public Float getRange() { 
	return globalassignment_range;
    }

    public void setOrientation ( Character orientation ) { 
	this.orientation = orientation; 
    }

    public Character getOrientation() {
	return orientation; 
    }

    public void setIsDerived ( Boolean isDerived ) { 
	this.isDerived = isDerived;
    }

    public Boolean getIsDerived() { 
	return isDerived; 
    }

    public void setUnits ( String units ) {
	this.units = units; 
    }

    public String getUnits() { 
	return units; 
    }

    public void setIsObsolete ( Boolean isObsolete ) {
	this.isObsolete = isObsolete; 
    }

    public Boolean getIsObsolete() { 
	return isObsolete; 
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
      
	    // convert to float -- shouldn't ever cause truncation
            safeLength = new Float( length ); 
        } 
        else {
            safeLength = new Float( 0.0 );
        }

        return safeLength;
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

    /*
     * Utility method to translate position into string value using 
     * units as determination for returning value as a floating point number
     * or integer
     */

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
    
    public int compareTo( Object tfcGlobalAssignment ) {

        int result = -1; 

        if ( tfcGlobalAssignment != null ) {
            TfcGlobalAssignment another = 
                ( TfcGlobalAssignment ) tfcGlobalAssignment;     
            if ( another.getStartPosition() != null && 
		 getStartPosition() != null ) {
                result = getStartPosition().
                    compareTo( another.getStartPosition() );

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

        super.test();         
        System.out.println( "****** TfcGlobalAssignment content test ******" );
        System.out.println( "map_element_id: " + getMapElementId() );
        System.out.println( "map_id: " + getMapId() );
        System.out.println( "global_assignment_id: " + 
                            getGlobalAssignmentId() );
        System.out.println( "start_position: " + getStartPosition() );
        System.out.println( "format start position: " + 
                            getFormatStartPosition() );
        System.out.println( "end_position: " + getEndPosition() );
        System.out.println( "format end position: " + 
                            getFormatEndPosition() );
        System.out.println( "orientation: " + getOrientation() );
        System.out.println( "format orientation: " + 
                            getFormatOrientation() );
        System.out.println( "assignment_basis " + getAssignmentBasis() );
        System.out.println( "is_derived: " + getIsDerived() );
        System.out.println( "units: " + getUnits() );
        System.out.println( "length: " + getLength() );
        System.out.println( "safe length: " + getSafeLength() );
        System.out.println( "is_obsolete: " + getIsObsolete() );
        System.out.println( "date_last_modified: " + 
                            getDateLastModified() );
        System.out.println( "date_entered " + getDateEntered() );
        System.out.println( "**** TfcGlobalAssignment content test end ****" );
    }

    /**
     * For unit testing only
     */

    public static void main( String[] args ) {

        try {
            DBconnection conn = new DBconnection();
            Long testId = new Long( 21831 );
            TfcGlobalAssignment globalAssignment = 
                new TfcGlobalAssignment( conn, testId ); 
            globalAssignment.test();
        } 
        catch ( Exception e ) {
                e.printStackTrace();
        }
    }

}
