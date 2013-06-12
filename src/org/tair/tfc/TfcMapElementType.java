//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/04/05 22:40:53 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.*;
import java.util.*;

import org.tair.utilities.RecordNotFoundException;

/**
 * This class maps to the MapElementType table in the tair database. Each 
 * instance maps one row of data in MapElementType table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 *
 * <p>
 * Unlike other Tfc classes, TfcMapElementType will not always execute
 * a SQL query to get data from the database.  Since map element type data
 * does not change very often, and since the string value for map element
 * type is needed by every class that inherits from MapElement, lookup data
 * is stored in a static member variable so that once retrieved a value
 * does not need to be retrieved again. When the constructor for this class 
 * is called, member variables are populated static collection instead of 
 * from the database.
 *
 * <p>
 * This is a litle convoluted, but is done to facilitate the quick translation
 * of the map element child table name to its literal type and id value without 
 * incurring another database query. The convention of instantiating the class 
 * using its constructor is kept for consistency; for table to type translation,
 * the utility method typeForTable can be used with the same effect
 */

public class TfcMapElementType {   

    /**
     * Collection of map element type data, stored with map element
     * child table name as String key referencing literal value of
     * map element type for that child table. New entries will be retrieved 
     * from the database and added to collection as new values of table name
     * are encountered through constructor
     */
    private static Map mapElementTypes = new HashMap();

    /**
     * Collection of map element type id data, stored with map element
     * child table name as String key referencing map element type id
     * as a Long value. New entries will be retrieved from the database and 
     * added to collection as new values of table name are encountered through
     * constructor
     */
    private static Map mapElementTypeIDs = new HashMap();
    

    /**
     * Primary key value for a single type
     */
    private Long map_element_type_id;

    /**
     * String value for type
     */
    private String map_element_type;

    /**
     * Name of database table that holds map elements of this type.  
     * Ideally, this value would be the value of map_element_type,
     * but at this point we have much code relying on the literal
     * value of map_element_type
     */
    private String table_name;


    /**
     * Creates an empty instance of TfcMapElementType
     */
    public TfcMapElementType() { }


    /**
     * Creates an instance of TfcMapElementType that reflects the data
     * referenced by submitted map element child table name. 
     *
     * @param conn An active connection to the database
     * @param tableName Table name to retrieve map element type data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcMapElementType( String tableName )
	throws RecordNotFoundException, SQLException {

	// Get type and type id values using utility methods that 
	// access static collection of all possible types. 
	// RecordNotFoundException will be thrown if no row found for
	// table name
	this.map_element_type = typeForTable( tableName );
	this.map_element_type_id = idForTable( tableName );
	this.table_name = tableName;
    }

    /**
     * Utility method to retrieve the map element type literal value for
     * elements stored in submitted map element child table.  This is 
     * equivalent to creating an instance of TfcMapElementType with table
     * name and getting the type value through get_map_element_type
     *
     * @param tableName Table name to retrieve type literal value for
     * @return Map element type for submitted map element child table
     * @throws RecordNotFoundException if no row found for submitted table name.
     * @throws SQLException if a database error occurs
     */
    public static String typeForTable( String tableName ) 
	throws RecordNotFoundException, SQLException {

	// get entry for this table name if necessary -- will throw
	// exception if no row found for table
	if ( !mapElementTypes.containsKey( tableName ) ) {
	    loadRow( tableName );
	}

	String type = (String) mapElementTypes.get( tableName );
	
	return type;
    }

    /**
     * Utility method to retrieve the map element type id for submitted 
     * map element child table.  This is equivalent to creating an 
     * instance of TfcMapElementType with the table name and getting the id
     * value through get_map_element_type_id
     *
     * @param tableName Table name to retrieve type id for
     * @return Map element type id for submitted table name
     * @throws RecordNotFoundException if no row found for submitted table
     * @throws SQLException if a database error occurs
     */
    public static Long idForTable( String tableName ) 
	throws RecordNotFoundException, SQLException {

	// get entry for this table name if necessary -- will throw
	// exception if no row found for table
	if ( !mapElementTypeIDs.containsKey( tableName ) ) {
	    loadRow( tableName );
	}

	Long id = (Long) mapElementTypeIDs.get( tableName );
	
	return id;
    }

    /**
     * Get row from database table for map element child table and store
     * data in mapElementTypes and mapElementTypeIDs collections. This 
     * method should only be called once for each element child table.  
     *
     * @param tableName Map element child table to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted table
     * @throws SQLException if a database error occurs
     */
    private static void loadRow( String tableName ) 
	throws RecordNotFoundException, SQLException {
	
	DBconnection conn = null;
	DBReadManager connectionPool = null;
	boolean found = false;

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

	    String query = 
		"SELECT map_element_type, map_element_type_id " +
		"FROM MapElementType " +
		"WHERE table_name = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( tableName );

	    // save data with table name as key referencing 
	    // type and id in separate collections
	    ResultSet results = conn.getResultSet();
	    found = results.next();

	    if ( found ) {
		mapElementTypes.put( tableName,
				     results.getString( "map_element_type" ) );

		Long id = new Long( results.getLong( "map_element_type_id" ) );
		mapElementTypeIDs.put( tableName, id );
	    }
	    conn.releaseResources();

	} finally {
	    connectionPool.return_connection( conn );
	}
	    
	if ( !found ) {
	    throw new RecordNotFoundException( "No row found for " +
					       "map element child table " + 
					       tableName );
	}
    }


    /**
     * Determines if submitted table name is a map element child
     * table.  This is useful in TfcTairObjectType population when
     * child table is a map element, in which case table needs
     * to be stored as tair object type of map element.
     *
     * @return <code>true</code> if submitted table is a child
     * of MapElement, or <code>false</code> if submitted table
     * is not a child of MapElement
     * @throws SQLException if a database error occurs
     */
    public static boolean isChildTable( String table ) throws SQLException {
	boolean isChild = false;
	try {
	    String type = typeForTable( table );
	    isChild = true;
	} catch ( RecordNotFoundException rnfe ) {
	    // ignore not found message in this case,
	    // just means that submitted table is *not*
	    // a map element
	}

	return isChild;
    }


    public void set_map_element_type_id( Long id ) {
	this.map_element_type_id = id;
    }

    public Long get_map_element_type_id() {
	return map_element_type_id;
    }

    public void set_map_element_type ( String type ) {
	this.map_element_type = type;
    }

    public String get_map_element_type() {
	return map_element_type;
    }

    public void set_table_name( String table ) {
	this.table_name = table;
    }

    public String get_table_name() {
	return table_name;
    }

    /**
     * For unit testing only
     */
    public void test(){
	System.out.println( "****** TfcMapElementType content test ******" );
	System.out.println( "map_element_type_id: " + get_map_element_type_id() );
	System.out.println( "map_element_type: " + get_map_element_type() ); 
	System.out.println( "table name: " + get_table_name() );
	System.out.println( "**** TfcMapElementType content test end ****");
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    TfcMapElementType map_element_type = 
		new TfcMapElementType( "Clone" );
	    map_element_type.test();

	    // test caching
	    map_element_type = 
		new TfcMapElementType( "GeneticMarker" );
	    map_element_type.test();
          
	    map_element_type = 
		new TfcMapElementType( "Clone" );
	    map_element_type.test();


	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
