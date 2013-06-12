/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.AccessionManager;

/**
* Image extends <code> TfcImage </code> to present complete information
* about a given Image. In addition to image data, it also contains image
* linking information.
*/

public class Image extends TfcImage {

    /** 
    * Creates an empty instance of Image
    */
    public Image() {
        super();
    }

    /** 
    * Creates an instance of Image that reflects the data referenced by
    * submitted tair_object_id
    *
    * @param conn An active connection to the database
    * @param tair_object_id TairObject Id to retrive the data for
    * @throws SQLException thrown if a database error occurs
    */
    public Image( DBconnection conn, Long tair_object_id ) throws SQLException {
        super (conn, tair_object_id );
    }

    public Image( DBconnection conn, String image_name ) throws SQLException {
        super (conn, get_tair_object_id(conn, image_name) );
    }    
    
    public static Long get_tair_object_id( DBconnection conn, String image_name ) throws SQLException{
        Long tair_object_id = null;
        String query = "SELECT tair_object_id from Image WHERE upper(name) = upper('" + image_name + "')";
        ResultSet results = null;
        conn.setQuery( query );
        System.out.println( query );
        results = conn.getResultSet();
        if (results.next() ){
            tair_object_id = results.getLong("tair_object_id");
        }
        conn.releaseResources();
        if ( tair_object_id != null ) {
            return tair_object_id;
        }else{
            return new Long(0);
        }
    }

    /**
    * Finds all links associated to that image
    *
    * @param conn An Active connectionto the database
    * @throws SQLException thrown if a database error occurs
    */
    public Hashtable get_links( DBconnection conn ) throws SQLException {
        
        Hashtable table = new Hashtable();
        ResultSet results = null;

        try {
            String query = " SELECT t.tair_object_id, tt.tair_object_type "
                + " FROM TairObject t, TairObjectType tt, TairObject_Image ti "
                + " WHERE ti.tair_object_id = t.tair_object_id "
                + " AND t.tair_object_type_id = tt.tair_object_type_id "
                + " AND ti.image_id = " + get_image_id();
        
            conn.setQuery( query );
            results = conn.getResultSet();
            while(results.next() ){
                Long tair_object_id = results.getLong("tair_object_id");
                String tair_object_type = results.getString("tair_object_type");
                System.out.println("type : " + tair_object_type + " and id : " + tair_object_id);
                if (tair_object_type.equals("map_element") || tair_object_type.equalsIgnoreCase("host_strain") ||
                tair_object_type.equalsIgnoreCase("library") || tair_object_type.equalsIgnoreCase("stock") ||
                tair_object_type.equalsIgnoreCase("vector")){
                    
                    if (tair_object_type.equals("map_element") ){
                    ResultSet results2 = null;
                    String query2 = " SELECT mt.map_element_type FROM MapElementType mt, MapElement m "
                         + " WHERE m.map_element_type_id = mt.map_element_type_id "
                         + " AND m.tair_object_id = " + tair_object_id;
                    conn.setQuery( query2 );
                    results2 = conn.getResultSet();
                    while (results2.next() ){
                        tair_object_type = results2.getString("map_element_type");
                    }
                    }
                    tair_object_id = AccessionManager.translateID(conn, tair_object_type, tair_object_id);
                }
                System.out.println(" id : " + tair_object_id + " and type " + tair_object_type);
                String key = tair_object_id + ":" + tair_object_type;
                table.put(key, tair_object_type);
            }
            conn.releaseResources();
        } catch ( SQLException e ) {
            throw new SQLException ( "Error in Image.link_image : " + e);
        }
        System.out.println("tables : " + table.size() ); 
        return table;
    }
    
    /**
    * Delets a link made to this tairobject.
    *
    * @param tair_object_id to delete the link to
    * @throws SQLException if a database error occurs
    * @return String "deleted" if link is deleted, if not it returns error message
    */
    public String delete_link( DBconnection conn, Long tair_object_id ) throws SQLException {
        String error = "deleted";
        try {
            Long id = null;
            ResultSet results = null;
            String query = null;
            
            query = "DELETE FROM TairObject_Image "
                + " WHERE image_id = " + get_image_id()
                + " AND tair_object_id = " + tair_object_id; 
            
            System.out.println("QUERY : " + query);
            conn.setQuery ( query );
            int rowsAffected = conn.executeUpdate();
            if (rowsAffected < 1 ) {
                error = "ERROR : link does not exist";
            }
            conn.releaseResources();
        } catch ( SQLException e ) {
            throw new SQLException ( "Error in Image.make_link : " + e);
        }
        return error;
    }

    /**
    * Makes a link to a clone object. very similar to the make_link function, except it also
    * checks vector type and insert type since clone name is not unique
    *
    * @param link_type the type or table link is being searched in
    * @param link_name the name link is being searched in
    * @param clone_vec is the vector type of clone
    * @param clone_ins is the insert type of clone
    * @throws SQLException thrown if a database error occurs
    * @return String "added" if link is added, if not it returns the error message
    */
    public String make_clone_link( DBconnection conn, String table_name, String name, String clone_vec, String clone_ins) throws SQLException {
        String error = "inserted";
        try {
            Long id = null;
            ResultSet results = null;
            String query = null;

            query = "SELECT tair_object_id FROM " + table_name
                + " WHERE upper(name)='" + name.toUpperCase() + "' AND upper(vector_type) = upper('" + clone_vec + "')"
                + " AND upper(insert_type) = upper('" + clone_ins + "')";
            System.out.println(query);
            conn.setQuery( query );
            results = conn.getResultSet();
            if (results.next() ) {
                id = results.getLong("tair_object_id");
            }
            conn.releaseResources();
            if (id == null ) {
                error =  "ERROR : can not make link\n There is no object with name : " + name + " and vector type : " + clone_vec 
                + " and insert type : " + clone_ins + " in table : " + table_name;
            } else {
                try {
                    query = "INSERT INTO TairObject_Image (tair_object_id, image_id) "
                        + " VALUES (" + id + ", " + get_image_id() + ")";
                    conn.setQuery( query );
                    conn.executeUpdate();
                    conn.releaseResources();
                } catch (SQLException e ){
                    error = "ERROR : can not make link\nThe link you have entered already exists.";
                }
            }
        } catch ( SQLException e ) {
            throw new SQLException ( "Error in Image.make_link : " + e);
        }
        return error;
    }
    
    /**
    * Makes a link to this tairobject. Checks first to see if that link is already made, and
    * whether the tair_object_id is valid. If it is, the link is made
    *
    * @param tair_object_id to make the link to
    * @throws SQLExeption thown if a database error occurs
    * @return String "added" if link is added, if not it returns error message
    */
    public String make_link( DBconnection conn, String table_name, String name) throws SQLException {
        String error = "inserted";
        try {
            Long id = null;
            ResultSet results = null;
            String query = null;

            query = "SELECT tair_object_id FROM " + table_name
                + " WHERE upper(name)='" + name.toUpperCase() + "'";
            conn.setQuery( query );
            results = conn.getResultSet();
            if (results.next() ) {
                id = results.getLong("tair_object_id");
            }
            conn.releaseResources();
            if (id == null ) {
                error =  "ERROR : can not make link\n There is no object with name : " + name + " in table : " + table_name;
            } else {
                try {
                    query = "INSERT INTO TairObject_Image (tair_object_id, image_id) "
                        + " VALUES (" + id + ", " + get_image_id() + ")";
                    conn.setQuery( query );
                    conn.executeUpdate();
                    conn.releaseResources();
                } catch (SQLException e ){
                    error = "ERROR : can not make link\nThe link you have entered already exists.";
                }
            }
        } catch ( SQLException e ) {
            throw new SQLException ( "Error in Image.make_link : " + e);
        }
        return error;
    }
}


