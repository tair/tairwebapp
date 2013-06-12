/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;


/**
 * <p>DefinitionsLookup is a map-like object that, given a table_name
 * and table_row of the database, gives us an appropriate
 * definitions_id that can be used to construct a new Defintions
 * object.  If no such definition exists for the (table_name,
 * field_name), we return null.</p>
 *
 * <p>Since we don't want to hit the database on a simple lookup like
 * this, DefinitionsLookup populates itself with all the information it
 * needs on startup, and ties itself to DataPopulatorThread to keep
 * itself up-to-date.</p>
 */


public class DefinitionsLookup {

    /** 
     * Maps table names to another Map for the field
     * names. (FieldNames to a list of Longs).
     */
    private Map tableNamesToFieldNames;


    /**
     * Sentinel string used in place of "null" when we stuff
     * definitions of tables into our two-level Map.  Although
     * HashMaps support the insertion of a null key, I don't feel
     * comfortable with it.
     */
    private final String NULL_SENTINEL = "** NULL SENTINEL **";




    /**
     * This is a convenience function that creates a small javascript
     * HREF if the combination of tableName/fieldName has a non-null
     * entry in the Definitions table.
     *
     * Note that, since this method is a static method, we grab the
     * singleton instance of the DefinitionsLookup class from
     * DynamicData.
     *
     * @param tableName The name of a table in the database
     * @param fieldName The name of a field within the table
     * @return HTML image url that will open a new popup Definitions
     * window if a definition exists.  Otherwise, returns the empty
     * string "".
     */
    public static String createPopupLink(String tableName, 
					 String fieldName)
	throws SQLException {

	DefinitionsLookup finder = DynamicData.getDefinitionsLookup();
	Long id = finder.lookupDefinitionsId(tableName, fieldName);
	String url = "";
	if (id != null) {
	    url =
	    " <a href=\"javascript:void(0);\" "
		+ " onMouseover=\"window.status=''\""
		+ " onClick=\""
		+ "javascript:launchDefinitions("
		+ id
		+ ");"
		+ "\">"
		+ "<img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'>"
		+ "</a>";
	}
	return url;
    }


    /**
     * Constructor
     */
    public DefinitionsLookup() {
	tableNamesToFieldNames = new HashMap();
    }


    /**
     * Given a table_name and a field_name, returns the corresponding
     * definition_id in the Definitions table.  If no such
     * correspondence exists, returns null.
     *
     * Note: although table_name should never be null, the user is
     * allowed to pass null or the empty string ("") as a field_name.
     * In this particular case, we return the definition_id of the table.
     *
     * @param table_name The name of the table
     *
     * @param field_name The name of the field.  A null value
     * indicates that we are looking up the table definition.
     *
     * @return The definition_id as a java.lang.Long, or null if a
     * definition can't be found.
     */
    public Long lookupDefinitionsId(String table_name, String field_name) {
	Iterator iter = lookupDefinitionsIds(table_name, field_name);
	Long id = null;
	if (iter != null) {
	    id = (Long) iter.next();
	}
	return id;
    }



    /**
     * Given a table_name and a field_name, returns the corresponding
     * definition_ids in the Definitions table, providing sequential
     * access through an iterator.  If no such correspondence exists,
     * returns null.
     *
     * Note: although table_name should never be null, the user is
     * allowed to pass null or the empty string ("") as a field_name.
     * In this particular case, we return the definition_id of the table.
     *
     * @param table_name The name of the table
     *
     * @param field_name The name of the field.  A null value
     * indicates that we are looking up the table definition.
     *
     * @return An iterator to definition_id Longs, or null on
     * unsuccessful lookup.
     */
    public Iterator lookupDefinitionsIds(String table_name, 
					 String field_name) {
	if (TextConverter.isEmpty(field_name)) {
	    field_name = NULL_SENTINEL;
	}

	Map fieldNamesToDefn = (Map) tableNamesToFieldNames.get(table_name);
	if (fieldNamesToDefn == null) {
	    return null;
	}

	List defns = (List) fieldNamesToDefn.get(field_name);
	// we have to check both conditions, since it's very possible
	// that the list that we've just looked up is empty.
	if (defns == null) 
	    return null;
	if (defns.size() == 0) {
	    return null;
	}

	return defns.iterator();
    }



    /**
     * Refreshes our cached view of the available definitions.
     *
     *
     * Note: we do the query in two steps to handle the situation
     * where a table_name/field_name may correspond to multiple
     * field_value entries.  (Gene/gene_model_type_id is a concrete
     * example of this.)
     *
     * We only want to keep definitions that are non-null, so the
     * first step adds all the "parent" definitions (those that have
     * no field_value), and then we run through the definitions that
     * do have field values, but only inserting into our map if the
     * parent definition was inserted.
     *
     * @param conn An active connection to the database
     */
    public void refresh(DBconnection conn) throws SQLException {
	tableNamesToFieldNames = new HashMap();  // necessary to clear
						 // out the old map.
	try {
	    String query_parents = 
		"SELECT definitions_id, table_name, field_name " +
		" FROM Definitions " + 
		" WHERE CAST(definition as varchar(100)) IS NOT NULL " +
		// That conversion above is necessary in Sybase since
		// definition is a TEXT field.
		" and table_name is not null " +
		" and field_value is null";
	    conn.setQuery(query_parents);

	    ResultSet results = conn.getResultSet();
	    while (results.next()) {
		updateTheMap(results.getLong("definitions_id"),
			     results.getString("table_name"),
			     results.getString("field_name"),
			     false);
	    }
	    conn.releaseResources();



	    String query_field_values = 
		"SELECT definitions_id, table_name, field_name " +
		" FROM Definitions " + 
		" WHERE CAST(definition as varchar(100)) IS NOT NULL " +
		// That conversion above is necessary in Sybase since
		// definition is a TEXT field.
		" and table_name is not null " +
		" and field_value is not null";
	    conn.setQuery(query_field_values);
	    results = conn.getResultSet();
	    while (results.next()) {
		// for these "children" definition entries with
		// field_values, we insert into our definitions map
		// only if we had previously inserted one for the
		// parent definition (the one with no field_value).
		updateTheMap(results.getLong("definitions_id"),
			     results.getString("table_name"),
			     results.getString("field_name"),
			     true);
	    }
	    conn.releaseResources();
	} finally {
	    conn.releaseResources();
	}
    }



    /**
     * Adds a new table_name / field name / definitions_id into our
     * internal map. */
    private void updateTheMap(long definition_id, 
			      String table_name,
			      String field_name,
			      boolean only_add_if_parent_exists)
	throws SQLException {

	// Note: field_name CAN be null in the case where we want the definition
	// of the table.  In that case, we'll translate
	if (field_name == null) {
	    field_name = NULL_SENTINEL;
	}

	// memory optimization: since many of the field names
	// are shared between tables, I'll use String.intern().
	table_name = table_name.intern();
	field_name = field_name.intern();

	if (tableNamesToFieldNames.get(table_name) == null) {
	    tableNamesToFieldNames.put(table_name, new HashMap());
	}
	Map fieldNamesToDefns = (Map) tableNamesToFieldNames.get(table_name);
	if (fieldNamesToDefns.get(field_name) == null) {
	    fieldNamesToDefns.put(field_name, new ArrayList());
	}

	List definitions = (List) fieldNamesToDefns.get(field_name);
	if (definitions == null) {
	  return;
	}
	if (only_add_if_parent_exists && definitions.size() == 0) {
	    return;
	}
	definitions.add(new Long(definition_id));
    }





    //////////////////////////////////////////////////////////////////////

    /**
     * small test case class for a few of the definitions.
     */
    public static void main(String[] args) {
	DBconnection conn = null;
	DBReadManager connectionPool = null;
	
	try {
	    DBReadManager.init();
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
	    DefinitionsLookup defn_finder = 
		new DefinitionsLookup();
	    defn_finder.refresh(conn);


	    testLookup(defn_finder, conn);
	    testNegativeExistance(defn_finder);
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    if ( conn != null ) {
		conn.releaseResources();
		connectionPool.return_connection( conn );
	    }
	}
    }

    /**
     * Test for simple lookup
     */
    private static void testLookup(DefinitionsLookup defn_finder, DBconnection conn) throws Exception {
	Long defn_id = defn_finder.lookupDefinitionsId("Gene", "chromosome");
	org.tair.tfc.TfcDefinitions defn = new org.tair.tfc.TfcDefinitions(conn, defn_id);
	if(defn.get_table_name().equals("Gene")
	   && defn.get_field_name().equals("chromosome")) {
	    System.err.println("1... Looks ok");
	}
	else {
	    System.err.println("1... Problem!  Lookup failure.");
	}
    }


    /**
     * Test to see that nonexistant defns return null
     */
    private static void testNegativeExistance(DefinitionsLookup defn_finder) throws Exception {
	// Test for nonexistant tables
	Long test_null = defn_finder.lookupDefinitionsId("foobarish", "fobbby");
	if (test_null == null) {
	    System.err.println("2... Looks ok");
	}
	else {
	    System.err.println("2... Problem!  Null is not being generated.");
	}
    }


}
