//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/04/05 22:44:48 $
//------------------------------------------------------------------------------ 
package org.tair.utilities;

import java.sql.*;
import org.tair.tfc.*;

/**
 * ObjectTyper is a utility class to determine object specific characteristics
 * given a tair object id.  ObjectTyper provides methods to determine specific
 * object type as well as literal database table name of specific object.  
 * This is helpful for quickly determining what table to query for an object 
 * name when starting with the tair object id, or map element id.
 *
 * <p>
 * Object type and table name returned will always be the most specific value 
 * possible. For example, if a supplied tair object id is determined to be tair 
 * object type "map element", ObjectTyper will then determine what specific type 
 * of map element the object is (such as "clone").
 *
 * <p>
 * ObjectTyper also supplies methods to determine map element type and table 
 * given map element id, since there are many cases in which generic map element
 * id is known when tair object id is not
 */

public class ObjectTyper {

    /**
     * Retrieves the specific database table name for submitted tairObjectID's
     * object type
     *
     * @param conn An active connection to the database
     * @param tairObjectID Tair object id to retrieve table name for
     * @throws SQLException if a database error occurs
     * @return Object specific table name for tairObjectID (i.e. "Clone" )
     */
    public static String getTairObjectTable( DBconnection conn, 
					     Long tairObjectID )
	throws SQLException {

	String childTable = null;
    
	if ( tairObjectID != null ) {
	    childTable = getTairObjectInfo( conn, tairObjectID, false );
      
	    if ( childTable != null && childTable.equals( "MapElement" ) ) {
		childTable = getMapElementInfo( conn, 
						tairObjectID, 
						true, 
						false );
	    }
	}
    
	return childTable;
    }


    /**
     * Retrieves the specific object type for submitted tairObjectID 
     *
     * @param conn An active connection to the database
     * @param tairObjectID Tair object id to retrieve object type for
     * @return Object specific type for tairObjectID (i.e. "clone" )
     */
    public static String getTairObjectType( DBconnection conn, 
					    Long tairObjectID ) 
	throws SQLException {

	String type = null;

	if ( tairObjectID != null ) {
	    type = getTairObjectInfo( conn, tairObjectID, true );
      
	    if ( type != null && type.equals( "map_element" ) ) {
		type = getMapElementInfo( conn, tairObjectID, true, true );
	    }
	}

	return type;
    }

  
    /**
     * Retrieves the specific database table name for submitted tairObjectID.
     * This method differs from getTairObjectTable() in that it assumes that 
     * tair_object_type has already been determined to be "map_element" and 
     * more specific table is required
     *
     * @param conn An active connection to the database
     * @param tairObjectID Tair object id to retrieve table name for
     * @return Object specific table name for tairObjectID (i.e. "Clone" )
     */
    public static String getMapElementTable( DBconnection conn, 
					     Long tairObjectID ) 
	throws SQLException {

	String table = null;

	if ( tairObjectID != null ) {
	    table = getMapElementInfo( conn, tairObjectID, true, false );
	}
	return table;
    }

    /**
     * Retrieves the specific database table name for id, where id can either
     * be tair object id or a map element id according to value of 
     * isTairObjectID.  This method assumes that tair_object_type has already 
     * been determined to be "map_element" and more specific table is required
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve table name for
     * @param isTairObjectID If <code>true</code> id should be tair_object_id, 
     * if <code>false</code> id should be map_element_id
     * @return Object specific table name for id (i.e. "Clone" )
     */
    public static String getMapElementTable( DBconnection conn, 
					     Long id, 
					     boolean isTairObjectID ) 
	throws SQLException {

	String table = null;
    
	if ( id != null ) {
	    table = getMapElementInfo( conn, id, isTairObjectID, false );
	}
	return table;
    }


    /**
     * Retrieves the specific object type for submitted tairObjectID.  This
     * method differs from getTairObjectType() in that it assumes that 
     * tair_object_type has already been determined to be "map_element" and 
     * more specific object type is required
     *
     * @param conn An active connection to the database
     * @param tairObjectID Tair object id to retrieve table name for
     * @return Object specific table name for tairObjectID (i.e. "Clone" )
     */
    public static String getMapElementType( DBconnection conn, 
					    Long tairObjectID ) 
	throws SQLException {

	String type = null;
	if ( tairObjectID != null ) {
	    type = getMapElementInfo( conn, 
				      tairObjectID, 
				      true, 
				      true );
	}
	return type;
    }

    /**
     * Retrieves the specific object type for submitted id, where id is 
     * tair_object_id or map_element_id according to the value of 
     * isTairObjectID.  This method assumes that tair_object_type has 
     * already been determined to be "map_element" and more specific object
     * type is required
     *
     * @param conn An active connection to the database
     * @param id ID to retrieve table name for
     * @param isTairObjectID If <code>true</code> id should be tair_object_id,
     * if <code>false</code> id should be map_element_id
     * @return Object specific table name for id (i.e. "Clone" )
     */
    public static String getMapElementType( DBconnection conn, 
					    Long id, 
					    boolean isTairObjectID ) 
	throws SQLException {

	String type = null;
	if ( id != null ) {
	    type = getMapElementInfo( conn, id, isTairObjectID, true );
	}
	return type;
    }
  

  
  
    /**
     * Utility method to get type or table name from tair object type
     */
    private static String getTairObjectInfo( DBconnection conn, 
					     Long tairObjectID, 
					     boolean getType ) 
	throws SQLException {

	String childTable = null;
	String type = null;

	String query = 
	    "SELECT ty.tair_object_type, ty.table_name " +
	    "FROM TairObject t, TairObjectType ty " +
	    "WHERE ty.tair_object_type_id = t.tair_object_type_id " +
	    "AND t.tair_object_id = " + tairObjectID.toString();
    
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    childTable = results.getString( "table_name" );
	    type = results.getString( "tair_object_type" );
	}
	conn.releaseResources();
    
	if ( getType ) {
	    return type;
	} else {
	    return childTable;
	}
    }


    /**
     * Utility method to get table name or object type from MapElementType
     * given id. ID will be tair_object_id or map_element_id depending on 
     * value of isTairObjectID
     */
    private static String getMapElementInfo( DBconnection conn, 
					     Long id, 
					     boolean isTairObjectID, 
					     boolean getType ) 
	throws SQLException {

	String childTable = null;
	String type = null;

	StringBuffer query = new StringBuffer();
	query.append( "SELECT m.map_element_type, m.table_name " +
		      "FROM MapElementType m, MapElement me " +
		      "WHERE m.map_element_type_id = me.map_element_type_id " 
		      );

	if ( isTairObjectID ) {
	    query.append( "AND me.tair_object_id = " + id.toString() );
	} else {
	    query.append( "AND me.map_element_id = " + id.toString() );
	}
	
	conn.setQuery( query.toString() );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    childTable = results.getString( "table_name" );
	    type = results.getString( "map_element_type" );
	}
	conn.releaseResources();
	
	if ( getType ) {
	    return type;
	} else {
	    return childTable;
	}
    }

    /**
     * Retrieves a tair object's name or original name given the child table 
     * name for the object, and the object's tair object id.  If child table 
     * does not have columns for both "name" or "original_name", or does not 
     * inherit from TairObject, an error will occur (all TairObject child tables
     * should have both columns, though). Original name will be returned value
     * unless it is null, in which case the value from name will be returned.
     *
     * <p>
     * This is useful for situations when minimal information is required for 
     * an object, probably joined through tair object id to some larger detail 
     * object
     *
     * @param conn An active connection to the database
     * @param tableName Child table name to retrieve data from
     * @param tairObjectID Tair object id to retrieve data from
     * @return Name from child table record with supplied ID, or 
     * <code>null</code> if no row found in child table for tairObjectID
     * @throws SQLException thrown if a database error occurs, or if 
     * submitted tableName is not a TairObject or has no "original_name" column
     */
    public static String getTairObjectName( DBconnection conn, 
					    String tableName, 
					    Long tairObjectID ) 
	throws SQLException {

	String returnName = null;

	String query = 
	    "SELECT name, original_name " +
	    "FROM " + tableName + " " +
	    "WHERE tair_object_id = " + tairObjectID.toString();

	conn.setQuery( query );

	String name = null;
	String originalName = null;

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    originalName = results.getString( "original_name" );
	    name = results.getString( "name" );
	}
	conn.releaseResources();

	// return originalName unless it's null
	returnName = originalName != null ? originalName : name;

	return returnName;
    }

    
    /**
     * Retrieves an object's name or original name given the child table name
     * for the object, and the object's id, where id is tair_object_id or 
     * map_element_id according to the value of isTairObjectID.  If child table 
     * does not have columns for both "name" or "original_name", or does not 
     * inherit from TairObject, an error will occur (all TairObject child tables
     * should have both columns, though). Original name will be returned value
     * unless it is null, in which case the value from name will be returned.
     *
     * <p>
     * This is useful for situations when minimal information is required for 
     * an object, probably joined through tair object id to some larger detail 
     * object
     *
     * @param conn An active connection to the database
     * @param tableName Child table name to retrieve data from
     * @param id ID to retrieve data for
     * @param isTairObjectID If <code>true</code> id should be tair_object_id,
     * if  <code>false</code> id should be map_element_id
     * @return Name from child table record with supplied ID, or 
     * <code>null</code> if no row found in child table for id
     * @throws SQLException thrown if a database error occurs, or if submitted
     * tableName is not a MapElement or has no "original_name" column
     */
    public static String getMapElementName( DBconnection conn, 
					    String tableName, 
					    Long id, 
					    boolean isTairObjectID ) 
	throws SQLException {

	String returnName = null;

	StringBuffer query = new StringBuffer();
	query.append( "SELECT name, original_name " +
		      "FROM " + tableName + " " );

	if ( isTairObjectID ) {
	    query.append( "WHERE tair_object_id = " + id.toString() );
	} else {
	    query.append( "WHERE map_element_id = " + id.toString() );
	}
	conn.setQuery( query.toString() );

	String name = null;
	String originalName = null;

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    originalName = results.getString( "original_name" );
	    name = results.getString( "name" );
	}
	conn.releaseResources();

	// return originalName unless it's null
	returnName = originalName != null ? originalName : name;

	return returnName;
    }

    /**
     * Retrieves a tair object's date entered given the child table name for 
     * the object, and the object's tair object id.  If child table does not 
     * have a column for "date_entered", or does not inherit from TairObject, 
     * an error will occur.  This is useful for situations when this information
     * is required for an object where the exact concrete type of the object
     * is not known.
     *
     * @param conn An active connection to the database
     * @param tableName Child table name to retrieve data from
     * @param tairObjectID Tair object id to retrieve data from
     * @return Date entered from child table record with supplied ID, or 
     * <code>null</code> if no row found in child table for tairObjectID
     * @throws SQLException thrown if a database error occurs, or if 
     * submitted tableName is not a TairObject or has no date entered column
     */
    public static java.util.Date getTairObjectDateEntered( DBconnection conn, 
							   String tableName, 
							   Long tairObjectID )
	throws SQLException {
	
	java.util.Date dateEntered = null;

	String query = 
	    "SELECT date_entered " +
	    "FROM " + tableName + " " +
	    "WHERE tair_object_id = " + tairObjectID.toString();

	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    dateEntered = results.getDate( "date_entered" );
	}
	conn.releaseResources();

	return dateEntered;
    }




}
