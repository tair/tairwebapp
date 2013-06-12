//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.9 $
// $Date: 2004/04/05 22:40:55 $
//-----------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.*;
import java.util.*;

import org.tair.utilities.RecordNotFoundException;
import org.tair.tfc.TfcTairObjectType;

/**
 * This class maps to the TairObjectType lookup table in the tair database. 
 * Each instance maps one row of data in TairObjectType table. Each data 
 * object maps to one field of a row in the table. Each field has one set 
 * method and one get method for accessing from outside of class.
 *
 * <p>
 * Unlike other Tfc classes, TfcTairObjectType will not always execute
 * a SQL query to get data from the database.  Since tair object type data
 * does not change very often, and since the string value for tair object
 * type is needed by every class that inherits from TairObject, lookup data
 * is stored in a static member variable so that once retrieved a value
 * does not need to be retrieved again. When the constructor for this class 
 * is called, member variables are populated static collection instead of 
 * from the database.
 *
 * <p>
 * This is a litle convoluted, but is done to facilitate the quick translation
 * of the tair object child table name to its type value without incurring 
 * another database query. The convention of instantiating the class using its
 * constructor is kept for consistency.
 *
 * <p>
 * Determining tair object type from child table name is a little problematic
 * for MapElement child tables, since TairObject table is stored as "MapElement",
 * whereas map element child classes will submit table name as the child table
 * of MapElement (i.e. "Clone" instead of "MapElement").  Before throwing an
 * exception if a table name is not found, TfcTairObjectType will check to
 * see if a submitted table name is a MapElementType. If submitted value is
 * a valid MapElement child table, inner collection will store an entry for 
 * that child table name with map element info. Ugly, but other solutions
 * are even uglier....
 */

public class TfcTairObjectType {   


    /**
     * Collection of tair object type data, stored with tair object child 
     * table name as String key referencing literal value of tair object type
     * for that child table. New entries will be retrieved from the database 
     * and added to collection as new values of table name are encountered 
     * through constructor
     */
    private static Map tairObjectTypes = new HashMap();

    /**
     * Collection of tair object type id data, stored with tair object
     * child table name as String key referencing tair object type id
     * as a Long value. New entries will be retrieved from the database and 
     * added to collection as new values of table name are encountered through
     * constructor
     */
    private static Map tairObjectTypeIDs = new HashMap();
    
    /**
     * Primary key value for a single type
     */
    private Long tair_object_type_id;

    /**
     * String value for type
     */
    private String tair_object_type;

    /**
     * Name of database table that holds tair objects of this type.  
     * Ideally, this value would be the value of tair_object_type,
     * but at this point we have much code relying on the literal
     * value of tair_object_type
     */
    private String table_name;


    /**
     * Creates an empty instance of TfcTairObjectType
     */
    public TfcTairObjectType( ) { }


    /**
     * Creates an instance of TfcTairObjectType that contains
     * data referenced by submitted tair object table name
     *
     * @param tableName Tair object child table name to retrieve data for
     * @throws RecordNotFoundException if no row found for table name
     * @throws SQLException in the case of an invalid operation or 
     * database error
     */
    public TfcTairObjectType( String tableName ) 
	throws SQLException {

	// Get type and type id values using utility methods that 
	// access static collection of all possible types. 
	// RecordNotFoundException will be thrown if no row found for
	// id.
	this.tair_object_type = typeForTable( tableName );
	this.tair_object_type_id = idForTable( tableName );

	// if table name is child of map element, make sure to set
	// table name as MapElement, not child table 
	if ( tair_object_type.equals( "map_element" ) ) {
	    this.table_name = "MapElement";
	} else {
	    this.table_name = tableName;
	}
    }

    /**
     * Utility method to retrieve the tair object type literal value for
     * elements stored in submitted tair object child table.  This is 
     * equivalent to creating an instance of TfcTairObjectType with table
     * name and getting the type value through get_tair_object_type
     *
     * @param tableName Table name to retrieve type literal value for
     * @return Map element type for submitted tair object child table
     * @throws RecordNotFoundException if no row found for submitted table name.
     * @throws SQLException if a database error occurs
     */
    public static String typeForTable( String tableName ) 
	throws SQLException {

	// get entry for this table name if necessary -- will throw
	// exception if no row found for table
	if ( !tairObjectTypes.containsKey( tableName ) ) {
	    loadRow( tableName );
	}

	String type = (String) tairObjectTypes.get( tableName );
	
	return type;
    }

    /**
     * Utility method to retrieve the tair object type id for submitted 
     * tair object child table.  This is equivalent to creating an 
     * instance of TfcTairObjectType with the table name and getting the 
     * id value through get_tair_object_type_id
     *
     * @param tableName Table name to retrieve type id for
     * @return Tair object type id for submitted table name
     * @throws RecordNotFoundException if no row found for submitted table
     * @throws SQLException if a database error occurs
     */
    public static Long idForTable( String tableName ) 
	throws SQLException {

	// get entry for this table name if necessary -- will throw
	// exception if no row found for table
	if ( !tairObjectTypeIDs.containsKey( tableName ) ) {
	    loadRow( tableName );
	}

	Long id = (Long) tairObjectTypeIDs.get( tableName );
	
	return id;
    }

    /**
     * Get row from database table for tair object child table and store
     * data in tairObjectTypes and tairObjectTypeIDs collections. This 
     * method should only be called once for each element child table.  
     * RecordNotFoundException will be thrown if no row found for
     * tableName.
     *
     * @param tableName Tair object child table to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted table
     * @throws SQLException if a database error occurs
     */
    private static void loadRow( String tableName ) 
	throws SQLException {
	
	DBconnection conn = null;
	DBReadManager connectionPool = null;
	boolean found = false;

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

	    String query = 
		"SELECT tair_object_type, tair_object_type_id " +
		"FROM TairObjectType " +
		"WHERE table_name = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( tableName );

	    // save data with table name as key referencing 
	    // type and id in separate collections
	    ResultSet results = conn.getResultSet();
	    found = results.next();

	    if ( found ) {
		tairObjectTypes.put( tableName,
				     results.getString( "tair_object_type" ) );

		Long id = new Long( results.getLong( "tair_object_type_id" ) );
		tairObjectTypeIDs.put( tableName, id );
	    }
	    conn.releaseResources();

	} finally {
	    connectionPool.return_connection( conn );
	}
	    
	// If not found, check to see if table is a child of MapElement.
	// If so, store table referencing MapElement's info for future use.
	// If not, throw exception
	
	if ( !found ) {
	    
	    if ( TfcMapElementType.isChildTable( tableName ) ) {
		// populate for map element using recursive calls
		// to utility translation methods
		tairObjectTypes.put( tableName,
				     typeForTable( "MapElement" ) );
		tairObjectTypeIDs.put( tableName,
				       idForTable( "MapElement" ) );
	    } else {
		throw new RecordNotFoundException( "No row found for " +
						   "tair object child table " + 
						   tableName );
	    }
	}
    }

    public void set_tair_object_type_id( Long id ) { 
	tair_object_type_id = id; 
    }

    public Long get_tair_object_type_id( ) { 
	return tair_object_type_id; 
    }
  
    public void set_tair_object_type( String type ) { 
	tair_object_type = type; 
    }

    public String get_tair_object_type( ) { 
	return tair_object_type; 
    }
    
    public void set_table_name( String table ) {
	table_name = table;
    }

    public String get_table_name() {
	return table_name;
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcTairObjectType content test ******" );	
	System.out.println( "tair_object_type_id: " + get_tair_object_type_id( ) );
	System.out.println( "tair_object_type: " + get_tair_object_type( ) ); 
	System.out.println( "table name: " + get_table_name() );
	System.out.println( "****** TfcTairObjectType content end ******" );	
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try{
	    TfcTairObjectType tair_object_type = 
		new TfcTairObjectType( "Taxon" );
	    tair_object_type.test();

	    // test caching
	    tair_object_type = new TfcTairObjectType( "SpeciesVariant" );
	    tair_object_type.test();

	    tair_object_type = new TfcTairObjectType( "Taxon" );
	    tair_object_type.test();


	    // test handling of MapElement types
	    tair_object_type = new TfcTairObjectType( "Clone" );
	    tair_object_type.test();

	    tair_object_type = new TfcTairObjectType( "GeneticMarker" );
	    tair_object_type.test();

	    tair_object_type = new TfcTairObjectType( "Clone" );
	    tair_object_type.test();
	    

	} catch (Exception e ) {
	    e.printStackTrace( );
	}
    }
}
