/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * DefinitionsCollection is a custom collection class that stores all
 * definitions for a given table as a collection of <code>Definitions</code>
 * objects. 
 */


public class DefinitionsCollection {
    private ArrayList definitions;

    // table name for all definitions
    private String tableName;

    // field name for all definitions
    private String fieldName;

    /**
     * Creates an empty instance of DefinitionsCollection
     */
    public DefinitionsCollection()  {
	definitions = new ArrayList();
    }

    /**
     * Creates an instance of DefinitionsCollection that contains all
     * definition records associated to submitted table name, where
     * table name is the literal value of the db table name
     * if the table_name is "glossary", it will return all the entries from Definitions with is_glossary='T'
     * @param conn An active connection to the database
     * @param table_name Table name to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public DefinitionsCollection( DBconnection conn, String table_name ) throws SQLException {
	definitions = new ArrayList();
	if ( table_name == null ) {
	    return;
	}

	this.tableName = table_name;
	if (table_name.equals("glossary")) {
	    populateGlossary(conn);
	}
	else {
	    populateTableDefinitions( conn, table_name );
	}
    }


    /**
     * Creates an instance of DefinitionsCollection that contains all
     * definition records associated to submitted table name and field
     * name, where table name is the literal value of the db table
     * name, and field_value is the literal value of the db field value.
     *
     * @param conn An active connection to the database
     * @param table_name Table name to retrieve data for
     * @param field_name Field name to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public DefinitionsCollection( DBconnection conn,
				  String table_name,
				  String field_name ) throws SQLException {
	definitions = new ArrayList();
	if ( table_name == null ) {
	    return;
	}

	this.tableName = table_name;
	this.fieldName = field_name;
	populateTableDefinitions( conn, table_name, field_name );
    }






    /**
     * Populate collection with all definitions for submitted table
     * name.
     */
    private void populateTableDefinitions( DBconnection conn, String table_name ) throws SQLException {
	String query =
	    "SELECT definitions_id " +
	    "FROM Definitions " + 
	    "WHERE UPPER( table_name ) = " + TextConverter.dbQuote( table_name.toUpperCase() ) + " " +
	    "ORDER BY Upper(table_name), upper( field_name ), upper(field_value)";
	populateHelper(conn, query);
    }


    /**
     * Populate collection with all definitions for submitted table
     * name and field name.
     */
    private void populateTableDefinitions( DBconnection conn,
					   String table_name,
					   String field_name) throws SQLException {
	String query =
	    "SELECT definitions_id " +
	    "FROM Definitions " + 
	    "WHERE UPPER( table_name ) = " + TextConverter.dbQuote( table_name.toUpperCase() ) + 
	    " AND UPPER( field_name ) = " + TextConverter.dbQuote( field_name.toUpperCase() ) + 
	    " " +
	    "ORDER BY Upper(table_name), upper( field_name ), upper(field_value)";
	populateHelper(conn, query);
    }




    /**
     * Populate collection with all definitions from submitted glossary
     * term.
     */
    private void populateGlossary( DBconnection conn ) throws SQLException {
	String query = 
	    "SELECT definitions_id " +
	    "FROM Definitions " + 
	    "WHERE is_glossary = 'T' " + 
	    "ORDER BY upper(display_value), upper(table_name), upper( field_name ), upper(field_value)";
	populateHelper(conn, query);
    }

  
    private void populateHelper(DBconnection conn, String query) throws SQLException {
	ResultSet results = null;

	conn.setQuery( query );
	results = conn.getResultSet();
	List ids = new ArrayList();
	while ( results.next() ) {
	    ids.add(new Long(results.getLong( "definitions_id")));
	}
	conn.releaseResources();


	for (int i = 0; i < ids.size(); i++) {
	    add(new Definitions(conn, (Long)ids.get(i)));
	}
    }


    /**
     * Retrieves table name value used to populate collection. Value should be a valid
     * database literal name value (if population succeeded)
     *
     * @return Table name used to populate collection */
    public String getTableName() { return tableName; }

  
    /**
     * Determines if collection has elements in it
     *
     * @return <code>true</code> if collection has no definitions in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return definitions.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return definitions.size(); }

    /**
     * Retrieves element at supplied index
     *
     * @return Definitions at supplied index, or <code>null</code> if no element at supplied index
     */
    public Definitions get( int index ) { return (Definitions) definitions.get( index ); }


    /**
     * Adds supplied element to collection
     * 
     * @param definition Definitions to add to collection
     */
    public void add( Definitions definition ) { definitions.add( definition ); }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     *
     * @param definition Definitions to remove from collection
     */
    public void remove( Definitions definition ) { definitions.remove( definition ); }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( Definitions definition ) { return definitions.contains( definition ); }


    /**
     * Retrieves all elements in collection
     *
     * @return All definitions in collection as an <code>Iterator</code> of <code>Definitions</code>
     * objects, or <code>null</code> if no definitions in collection
     */
    public Iterator iterator() { return ( !definitions.isEmpty() ) ? definitions.iterator() : null; }



    /**
     * Retrieves all elements in collection that starts with a certain string
     *
     * @return All definitions in collection as an
     * <code>Iterator</code> of <code>Definitions</code> objects, or
     * <code>null</code> if no definitions in collection
     */
    public Iterator iteratorDisplayValueStartsWith(String prefix) { 
	List l = new ArrayList();
	for(int i = 0; i < definitions.size(); i++) {
	    Definitions d = (Definitions) definitions.get(i);
	    if (d.get_display_value() != null
                && d.get_display_value().toUpperCase().startsWith(prefix.toUpperCase())) {
		l.add(d);
	    }
	}
	return ( !l.isEmpty() ) ? l.iterator() : null; 
    }







    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be sorted by
     */
    public void sort( Comparator comparator ) {
	Collections.sort( definitions, comparator );
    }



    /**
     * For unit testing only
     */
    public void test() {
	      
	System.out.println( "****** DefinitionsCollection content test ******" );
	Iterator iter = iterator();
	if ( iter != null ) {
	    while ( iter.hasNext() ) {
		Definitions definition = (Definitions) iter.next();
		definition.test();
	    }
	}
	System.out.println( "**** DefinitionsCollection content test end ****" );
    }

    /**
     * For unit testing only
     */ 
    public static void main( String[] args ) {
	try{
	    DBconnection conn = new DBconnection();
	    String tableName = "AASequence";
	    DefinitionsCollection definitions = new DefinitionsCollection( conn, tableName );
	    definitions.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
