/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

//import java.util.Date;

public class TairObjIdCollection implements Collection {

    public static final int GERMPLASM_LOCUS_ALL = 1;
    public static final int GERMPLASM_GENE_ALL = 2;

    private Vector collection;

    public TairObjIdCollection(DBconnection conn, Long id, int type) throws SQLException {
        this.collection = new Vector();
        if (id != null) {
            populate( conn, id, type );
        }
    }
    
    
    private void populate(DBconnection conn, Long id, int type) throws SQLException {
	
	switch (type) { 
	    case GERMPLASM_LOCUS_ALL: getGermplasmLocusAll(conn, id);
	    break;
	    case GERMPLASM_GENE_ALL: getGermplasmGeneAll(conn, id);
	}
    }

    private void getGermplasmLocusAll(DBconnection conn, Long id) throws SQLException {

	String query =
	    "SELECT distinct(g.tair_object_id), max(g.name), max(ti.image_id) " + 
        " FROM (SELECT germ.tair_object_id, germ.name " + 
        " FROM Germplasm_Locus_wrk glw, " + 
        " Locus l, " + 
        " Germplasm germ " + 
        " WHERE germ.germplasm_id = glw.germplasm_id " + 
        " AND glw.locus_id = l.locus_id " + 
        " AND l.locus_id =  " + id.toString() +  
        " AND l.is_obsolete = 'F' " + 
        " AND germ.is_obsolete = 'F') g LEFT JOIN TairObject_Image ti " + 
        " ON g.tair_object_id = ti.tair_object_id " + 
        " GROUP BY g.tair_object_id " + 
        " ORDER BY max(ti.image_id) desc, max(g.name) asc ";

	conn.setQuery( query );
        ResultSet rs = conn.getResultSet();

		while(rs.next())
			this.add(new Long(rs.getLong(1)));
    }
    
    private void getGermplasmGeneAll(DBconnection conn, Long id) throws SQLException {
    	
        String query = 
            "SELECT DISTINCT germ.tair_object_id, germ.name " +
            " FROM " +
            "  Germplasm germ, " +
            "  Germplasm_MapElement germ_me, " +
            "  Polymorphism poly, " +
            "  (SELECT * FROM MapElement WHERE map_element_type_id = 20) me, " +
            "  Gene_MapElement gme " +
            " WHERE germ.germplasm_id = germ_me.germplasm_id " +
            "  AND germ_me.map_element_id = poly.map_element_id " +
            "  AND poly.tair_object_id = me.tair_object_id " +
            "  AND me.map_element_id = gme.map_element_id " +
            "  AND gme.gene_id = " + id.toString() + 
            " ORDER BY germ.name ASC ";
            
    	conn.setQuery( query );
            ResultSet rs = conn.getResultSet();
    	
		while(rs.next())
			this.add(new Long(rs.getLong(1)));
        }


    public int size() {
	return collection.size();
    }

    public boolean isEmpty() {
	return collection.isEmpty();
    }

    public boolean contains(Object o) {
	return collection.contains(o);
    }

    public Iterator iterator() {
	return collection.iterator();
    }

    public Object[] toArray() {
	return collection.toArray();
    }

    public Object[] toArray(Object[] a) {
	return collection.toArray(a);
    }

    public boolean add(Object o) {
	return collection.add(o);
    }

    public boolean remove(Object o) {
	return collection.remove(o);
    }

    public boolean containsAll(Collection c) {
	return collection.containsAll(c);
    }

    public boolean addAll(Collection c) {
	return collection.addAll(c);
    }

    public boolean removeAll(Collection c) {
	return collection.removeAll(c);
    }

    public boolean retainAll(Collection c) {
	return collection.retainAll(c);
    }

    public void clear() {
	collection.clear();
    }

    public boolean equals(Object o) {
	return collection.equals(o);
    }

    public int hashCode() {
	return collection.hashCode();
    }
	
}
