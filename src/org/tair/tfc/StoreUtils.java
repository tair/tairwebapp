//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/06 16:32:59 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.util.Iterator;
import java.util.Map;


/**
 * StoreUtils is a utility class for persisting data to the database.  A quick
 * and dirty class for generating UPDATE or INSERT statements given a Map of
 * column name/value pairs.
 */

public class StoreUtils {



    /**
     * Utility method to create a SQL statement for updating data stored
     * in submitted table name. UPDATE statement will be created to include all
     * data as defined by submitted columnValues Map. This method in really just
     * a convenience method to avoid having to explicitly write out UPDATE 
     * statements in classes that store themselves to the database
     *
     * <p>
     * UPDATE statements will be created to use submitted primary key column
     * and value in the WHERE clause of the update.
     * 
     * <p>
     * Specific column names and values must be submitted in columnValues map, 
     * with column name as String key referencing String value to store for that
     * column.  All values must be properly quoted and escaped so they can be 
     * included in SQL created here (TextConverter.dbQuote should handle all 
     * cases). NULL values will be included in UPDATE to allow for setting
     * a column that previously had data to NULL.
     *
     * @param table Database table to be updated
     * @param primaryKeyColumn Literal name of column name to use as primary
     * key value in WHERE clause
     * @param id Primary key id value to use in WHERE clause
     * @param columnValues Map containing columns names referencing values to 
     * store for that column.  Names and values must be stored as 
     * <code>String</code>; values must be properly quoted and escaped for 
     * inclusion in UPDATE SQL.
     * @return SQL UPDATE command on table using submitted columns, values
     * and primary key values.
     */
    public static String createUpdateStatement( String table, 
						String primaryKeyColumn, 
						Long id, 
						Map<String, String> columnValues ) {
	StringBuffer query = new StringBuffer();

	// create initial update statement
	query.append( "UPDATE " + table + " SET " );

	String column = null;
	String value = null;

	Iterator<String> iter = columnValues.keySet().iterator();
	boolean first = true;
	while ( iter.hasNext() ) {
	    column = iter.next();
	    value = columnValues.get( column );

	    if ( !first ) {
		query.append( ", " );
	    }
	    query.append( column + " = " + value );

	    first = false;
	}
	
	query.append( " WHERE " + primaryKeyColumn + " = " + id.toString() );

	return query.toString();
    }      



    /**
     * Utility method to create a SQL statement for updating data stored
     * in submitted table name. UPDATE statement will be created to include all
     * data as defined by submitted columnValues Map. This method in really just
     * a convenience method to avoid having to explicitly write out UPDATE 
     * statements in classes that store themselves to the database
     *
     * <p>
     * This version of method facilitates UPDATE operations that use multiple
     * columns to define a composite primary key value.
     * 
     * <p>
     * Specific column names and values must be submitted in columnValues map, 
     * with column name as String key referencing String value to store for that
     * column.  All values must be properly quoted and escaped so they can be 
     * included in SQL created here (TextConverter.dbQuote should handle all 
     * cases).  NULL values will be included in UPDATE to allow for setting
     * a column that previously had data to NULL.
     *
     * @param table Database table to be updated
     * @param keysMap Map of column names and values to use as composite 
     * primary key in WHERE clause. Must be submitted with column name as
     * String key referencing Long value to use for that column
     * @param columnValues Map containing columns names referencing values to 
     * store for that column.  Names and values must be stored as 
     * <code>String</code>; values must be properly quoted and escaped for 
     * inclusion in UPDATE SQL.
     * @return SQL UPDATE command on table using submitted columns, values
     * and primary key values.
     */
    public static String createUpdateStatement( String table, 
						Map<String, Long> keysMap,
						Map<String, String> columnValues ) {
	StringBuffer query = new StringBuffer();

	// create initial update statement
	query.append( "UPDATE " + table + " SET " );

	String column = null;
	String value = null;

	Iterator<String> iter = columnValues.keySet().iterator();
	boolean first = true;
	while ( iter.hasNext() ) {
	    column = (String) iter.next();
	    value = (String) columnValues.get( column );

	    if ( !first ) {
		query.append( ", " );
	    }
	    query.append( column + " = " + value );

	    first = false;
	}

	// append values for composite key
	query.append( " WHERE " );

	first = true;
	Long keyID = null;

	iter = keysMap.keySet().iterator();
	while ( iter.hasNext() ) {
	    if ( !first ) {
		query.append( " AND " );
	    }
	    first = false;

	    column = (String) iter.next();
	    keyID = (Long) keysMap.get( column );
	    
	    query.append( column + " = " + keyID );
	}
	return query.toString();
    }      
    
    /**
     * Utility method to create a SQL statement for inserting a new row
     * into submitted table.  INSERT statement will be created to include
     * all data as defined by submitted columnValues Map. This method is 
     * really just a convenience method to avoid having to explicitly write
     * out INSERT statements in classes that store themselves to the database.
     *
     * <p>
     * This method allows client code the option of including a SELECT
     * statement to retrieve a newly created table primary key value (SELECT 
     * @@IDENTITY). This is done since some tables (such as many to many 
     * join tables) do not have a primary key value and SELECT @@IDENTITY
     * can cause problems if executed.
     *
     * <p>
     * Specific column names and values must be submitted in columnValues map, 
     * with column name as String key referencing String value to store for 
     * that column.  All values must be properly quoted and escaped so they 
     * can be included in SQL created here  (TextConverter.dbQuote should handle
     * all cases).  Columns with NULL values will not be included in INSERT 
     * statement.
     *
     * @param table Database table to be updated
     * @param columnValues Map containing columns names referencing values to 
     * store for that column.  Names and values must be stored as 
     * <code>String</code>; values must be properly quoted and escaped for 
     * inclusion in SQL.
     * @return SQL INSERT command on table using submitted columns, values
     * with SELECT @@IDENTITY optionally included according to submitted 
     * value of getIdentity
     */
    public static String createInsertStatement( String table, Map<String, String> columnValues ) 
    {

	StringBuffer columns = new StringBuffer();
	StringBuffer values = new StringBuffer();
	StringBuffer query = new StringBuffer();
	
	query.append( "INSERT INTO " + table + " " );
	
	String column = null;
	String value = null;

	columns.append( "( " );
	values.append( "VALUES ( " );

	Iterator<String> iter = columnValues.keySet().iterator();
	boolean first = true;
	while ( iter.hasNext() ) {
	    column = iter.next();
	    value = columnValues.get( column );

	    // only add entry if value is not NULL - do this to allow
	    // db to set default values if applicable
	    if ( value != null ) {
		if ( !first ) {
		    columns.append( ", " );
		    values.append( ", " );
		}
		first = false;
		
		columns.append( column );
		values.append( value );
	    }
	}

	columns.append( ") " );
	values.append( ") " );
	
	query.append( columns.toString() );
	query.append( values.toString() );
	

	return query.toString();
    }      


}
