/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.processor.transposonfamily;

import java.sql.*;
import java.util.*;
import java.text.*;
import org.tair.tfc.*;
import org.tair.utilities.*;
import org.tair.querytools.*;

/** 
 * TransposonFamilyCollection is a collection class that stores
 * all <code>TransposonFamily</code> objects.
 */

public class TransposonFamilyCollection {
    private ArrayList families;
   
    /**
     * Creates an empty instance of TransposonFamilyCollection
     */
    public TransposonFamilyCollection() {
	families= new ArrayList();
    }
    
    /**
     * Creates an instance of TransposonFamilyCollection that contains all TransposonFamily
     *
     * @param conn An active connection to the database
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TransposonFamilyCollection( DBconnection conn) throws SQLException {
	    families = new ArrayList();
	    populate( conn,"all");
    }
    
    /**
     * Creates an instance of TransposonFamilyCollection that contains all TransposonFamily
     * currently ignores type and takes all, but it could be used later to look for a type
     *
     * @param conn An active connection to the database
     * @param type that is not being used
     * @throws SQLException in the case of an invalid operation or database error
     */
    private void populate( DBconnection conn, String type ) throws SQLException {
      
	StringBuffer  query = new StringBuffer( 
	    "SELECT transposon_family_id "+
	    "FROM TransposonFamily  " );
	    populateCollection (conn, query.toString());
    }

    /**
    * utility method that is used to create the transposon family objects from an sql query
    *
    * @param conn An active connection to the database
    * @query SQL to be run to retrieve TransposonFamilies
    * @throws SQLException in the case of an invalid operation or database error
    */
    private void populateCollection(DBconnection conn, String query) throws SQLException{
	ArrayList ids = null;
	ResultSet results = null;
	Iterator iter = null;
	TransposonFamily transposon_family = null;
   
	conn.setQuery( query );
	results = conn.getResultSet();
	while( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }
	    ids.add( new Long( results.getLong( "transposon_family_id" ) ) );
	}
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {
	    iter = ids.iterator();
	    while ( iter.hasNext() ) {
	    	transposon_family = getTransposonFamily(conn, (Long) iter.next());
		add( transposon_family );
	    }
	}

    } 

    /**
    * Retrieve transposon family for a supplied id
    *
    * @param DBconnection connection of an active database
    * @param id for a transposon_family to be retrieved
    * @return transposonfamily for that id or <code>null</code> if no element is supplied
    */
    private TransposonFamily getTransposonFamily(DBconnection conn, Long id) throws SQLException{
        return new TransposonFamily(conn, id);
    }

    /**
    * Retrieve transposon family for a supplied id at the supplied index
    *
    * @param DBconnection connection of an active database
    * @param index for a transposon_family to be retrieved
    * @return transposonfamily for that id or <code>null</code> if no element is supplied
    * at the index
    */
    public TransposonFamily get(int index) { return (TransposonFamily) families.get(index); }

    /**                                                                                                                                                                                                             
    * Retrieve all elements in collection                                                                                                                                                                          
    *                                                                                                                                                                                                              
    * @return All transposons in collection as an <code>Iterator</code> of <code>Transposon</code>                                                                                                                  
    * objects, or <code>null</code> if no transposons in collection                                                                                                                                                
    */  
    public Iterator iterator() { return (!families.isEmpty() ) ? families.iterator() : null; }
    
    /**
    * utility method to add a transposon_family to the TransposonFamilyColllection arraylist
    *
    * @param TransposonFamily to be added
    */
    private void add( TransposonFamily transposon_family ){
        if ( ! families.contains(transposon_family) ){
            families.add(transposon_family);
        }
    }
   
    /**
    * Retrieve all elements in collection that starts with a prefix
    *
    * @param String for the prefix to get the elements that starts with
    * @return All transposons in a collection as an <code>Iterator</code> of 
    * <code>TransposonFamily</code> objects, or <code>null</code> if no element exit in the
    * collection starts with this prefix
    */
    public Iterator iteratorDisplayValueStartsWith(String prefix) {
        List l = new ArrayList();
        for (int i=0; i< families.size(); i++){
            TransposonFamily fam = (TransposonFamily) families.get(i);
            if (fam.get_name() != null && fam.get_name().toUpperCase().startsWith(prefix.toUpperCase())){
                l.add(fam);
            }
        }
        return (!l.isEmpty() ) ? l.iterator() : null;
    }
    
    /**
    * For unit testing only
    */
    public void test(){
        System.out.println( "**** TransposonFamilyCollection content test ****");
        System.out.println( "**** TransposonFamilyCollection content test end ****");
    }

    /**
    * For unit testing only
    */
    public static void main( String[] args){
        try{
            DBconnection conn = new DBconnection();
            TransposonFamilyCollection tc = new TransposonFamilyCollection(conn);
            tc.test();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
