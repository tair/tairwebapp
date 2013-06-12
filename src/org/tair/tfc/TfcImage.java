//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2004/04/12 17:31:30 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;


/**
 * This class maps to the Image table in the tair database. Each instance
 * maps one row of data. Each data object maps to one field of a row in the 
 * table. Each field has one set method and one get method for accessing 
 * from outside of class.
 */


public class TfcImage extends TfcTairObject {

    private Long image_id;
    private String name;
    private String type;
    private String description;
    private Integer image_size;
    private String file_format;
    private Integer pixel_width;
    private Integer pixel_height;
    private String original_name;
    private java.util.Date date_entered;

    // flag if image has an associated thumbnail image
    private boolean hasThumbnail = false;


    /**
     * Creates an empty instance of TfcImage
     */
    public TfcImage() {
	super();
    }


    /**
     * Creates an instance of TfcImage that reflects the data for image with
     * supplied tair_object_id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException in the case of an invalid operation or database
     *  error
     */
    public  TfcImage( DBconnection conn, Long tair_object_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, tair_object_id );
	
	// check ImageThumbnail table to see if a thumbnail image exists
	// for this image
	checkThumbnail( conn );
    }

    /**
     * Implements abstract method in superclass to return "Image"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Image";
    }

    /**
     * Implements abstract method in superclass to return "tair_object_id"
     * as name of primary key column to use when creating SQL statement for 
     * object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "tair_object_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Image specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all Image specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "image_id",
	    "name",
	    "image_type",
	    "date_entered",
	    "original_name",
	    "description",
	    "image_size",
	    "file_format",
	    "pixel_width",
	    "pixel_height"
	};

	return localClassColumns;
    }

    /**
     * Retrieves Image specific data from result set and stores in member
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	long id = results.getLong( "image_id" );
	if ( !results.wasNull() ) {
	    set_image_id( new Long( id ) );
	}
	
	int size = results.getInt( "image_size" );
	if ( !results.wasNull() ) {
	    set_image_size( new Integer( size ) );
	}
	
	size = results.getInt( "pixel_width" );
	if ( !results.wasNull() ) {
	    set_pixel_width( new Integer( size ) );
	}
	
	size = results.getInt( "pixel_height" );
	if ( !results.wasNull() ) {
	    set_pixel_height( new Integer( size ) );
	}
	
	set_name( results.getString( "name" ) );
	set_type( results.getString( "image_type" ) );
	set_description( results.getString( "description" ) );
	set_file_format( results.getString( "file_format" ) );
	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }

    /**
     * Queries ImageThumbnail table to see if image has an associated
     * thumbnail image.  Result stored in boolean variable hasThumbnail.
     * This information can then be used at the JSP to show the image 
     * thumbnail when creating links to the full image
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void checkThumbnail( DBconnection conn ) throws SQLException {
	String query = null;
	ResultSet results = null;

	if ( get_image_id() != null ) {
	    query = 
		"SELECT count(*) " +
		"FROM ImageThumbnail " +
		"WHERE image_id = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( get_image_id() );

	    results = conn.getResultSet();
	    if ( results.next() ) {
		int count = results.getInt( 1 );
		if ( count > 0 ) {
		    setHasThumbnail( true );
		}
	    }
	    conn.releaseResources();
	}
    }


    // 
    // Get 'em and set 'em
    //

    public void set_image_id( Long id ) { 
	this.image_id = id; 
    }

    public Long get_image_id() { 
	return image_id; 
    }

    public void set_name( String name ) { 
	this.name = name; 
    }

    public String get_name() { 
	return name; 
    }

    public void set_type( String type ) { 
	this.type = type; 
    }

    public String get_type() { 
	return type; 
    }

    public void set_description( String description ) { 
	this.description = description; 
    }

    public String get_description() { 
	return description; 
    }

    public void set_image_size( Integer size ) {
	this.image_size = size; 
    }

    public Integer get_image_size() {
	return image_size; 
    }

    public void set_file_format( String format ) { 
	this.file_format = format; 
    }

    public String get_file_format() { 
	return file_format; 
    }

    public void set_pixel_width( Integer width ) { 
	this.pixel_width = width; 
    }

    public Integer get_pixel_width() { 
	return pixel_width; 
    }

    public void set_pixel_height( Integer height ) { 
	this.pixel_height = height; 
    }

    public Integer get_pixel_height() { 
	return pixel_height; 
    }

    public void setHasThumbnail( boolean hasThumbnail ) { 
	this.hasThumbnail = hasThumbnail; 
    }

    public boolean hasThumbnail() { 
	return hasThumbnail; 
    }

    public void set_original_name ( String name ) { 
	this.original_name = name; 
    }

    public String get_original_name() { 
	return original_name; 
    }

    public void set_date_entered ( java.util.Date date ) { 
	this.date_entered = date;
    }

    public java.util.Date get_date_entered() { 
	return date_entered; 
    }


    /**
     * Retrieve web-friendly suffix that corresponds to stored file format
     * for image.  This can then be used to create "filenames" containing
     * image id and format that are passed to TairImageServlet for retrieving
     * & displaying binary image data
     *
     * @return Suffix (gif/jpg/tiff etc.) for stored image file format, or 
     * <code>null</code> if image format is null, or not a commonly used web 
     * image format
     */
    public final String getLinkSuffix() {
	String suffix = null;

	suffix = getLinkSuffix(get_file_format());

	return suffix;
    }

    public static final String getLinkSuffix(String format) {
	String suffix = null;

	if ( format != null ) {
	    if ( format.equals( "GIF" ) ) {
		suffix = "gif";
	    } else if ( format.equals( "JPEG" ) ) {
		suffix = "jpg";
	    } else if ( format.equals( "TIFF" ) ) {
		suffix = "tiff";
	    } else if ( format.equals( "BMP" ) ) {
		suffix = "bmp";
	    }
	}

	return suffix;
    }

    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** TfcImage content test ******" );
	System.out.println( "image_id: " + get_image_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "type: " + get_type() );
	System.out.println( "description: " + get_description() );
	System.out.println( "image_size: " + get_image_size() );
	System.out.println( "file_format: " + get_file_format() );
	System.out.println( "pixel_width: " + get_pixel_width() );
	System.out.println( "pixel_height: " + get_pixel_height() );
	System.out.println( "has thumbnail: " + hasThumbnail() );
	System.out.println( "link suffix: " + getLinkSuffix() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
	System.out.println( "**** TfcImage content test end ****" );
    }

  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 1005823625 );
	    TfcImage image = new TfcImage( conn, id );
	    image.test();
      
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
