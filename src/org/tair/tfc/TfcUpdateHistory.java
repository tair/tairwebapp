//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//$Revision: 1.13 $
//$Date: 2004/06/24 16:55:51 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import java.sql.*;

/**
 * This class map to the table UpdateHistory in the tair database. Each instance
 * maps one row of data in UpdateHistory table. Each data object maps to one
 * field of a row in the table. Each field has one set method and one get method
 * for accessing from outside of class.
 * 
 * @author tair ncgr
 */

public class TfcUpdateHistory {
    private Long update_history_id;
    private Long tair_object_id;
    private Long attribution_type_id;
    private Long community_id;
    private Long affected_tair_object_id;
    private Long pub_id;
    private String type;
    private String comment;
    private java.util.Date date;

    /**
     * Creates an empty instance of TfcUpdateHistory
     */
    public TfcUpdateHistory() {}

    /**
     * Creates an instance of TfcUpdateHistory that reflects the data referenced
     * by submitted update_history_id
     * 
     * @param conn
     *            An active connection to the database
     * @param update_history_id
     *            ID to retrieve data for
     * @exception SQLException
     *                in the case of an invalid operation or database error or
     *                if no row found for update_history_id
     */
    public TfcUpdateHistory(DBconnection conn, Long update_history_id)
        throws SQLException {
        boolean found = false;
        String query = null;

        if (update_history_id != null) {
            query = "SELECT uh.tair_object_id AS tair_object_id, " 
            	+ "uh.update_history_id AS update_history_id, "
                + "uh.attribution_type_id AS attribution_type_id, " 
                + "uh.community_id AS community_id, " 
                + "uh.affected_tair_object_id AS affected_tair_object_id, " 
                + "uh.pub_id AS pub_id, " 
                + "uh.updatehistory_type AS updatehistory_type, "
                + "uh.updatehistory_comment AS updatehistory_comment, " 
                + "uh.updatehistory_date AS updatehistory_date "
                + "FROM UpdateHistory uh " 
                + "WHERE update_history_id = "
                + update_history_id.toString();
            found = processResults(conn, query);
        }
    }

    private boolean processResults(DBconnection conn, String query)
        throws SQLException {
        ResultSet results = null;
        boolean found = false;

        conn.setQuery(query);
        results = conn.getResultSet();
        if (results.next()) {
            found = true;

            long id = results.getLong("tair_object_id");
            if (!results.wasNull()) {
                set_tair_object_id(new Long(id));
            }

            id = results.getLong("update_history_id");
            if (!results.wasNull()) {
                set_update_history_id(new Long(id));
            }

            id = results.getLong("attribution_type_id");
            if (!results.wasNull()) {
                set_attribution_type_id(new Long(id));
            }

            id = results.getLong("community_id");
            if (!results.wasNull()) {
                set_community_id(new Long(id));
            }
            
            id = results.getLong("affected_tair_object_id");
            if (!results.wasNull()) {
                set_affected_tair_object_id(new Long(id));
            }
            
            id = results.getLong("pub_id");
            if (!results.wasNull()) {
                set_pub_id(new Long(id));
            }

            set_type(results.getString("updatehistory_type"));
            set_date(results.getDate("updatehistory_date"));
            set_comment(results.getString("updatehistory_comment"));
           
        }
        conn.releaseResources();
        return found;
    }

    public void set_update_history_id(Long value) {
        update_history_id = value;
    }
    public Long get_update_history_id() {
        return update_history_id;
    }

    public void set_tair_object_id(Long value) {
        tair_object_id = value;
    }
    public Long get_tair_object_id() {
        return tair_object_id;
    }

    public void set_attribution_type_id(Long value) {
        attribution_type_id = value;
    }
    public Long get_attribution_type_id() {
        return attribution_type_id;
    }

    public void set_community_id(Long value) {
        community_id = value;
    }
    public Long get_community_id() {
        return community_id;
    }
    
    public void set_affected_tair_object_id(Long value) {
        affected_tair_object_id = value;
    }
    public Long get_affected_tair_object_id() {
        return affected_tair_object_id;
    }
    
    public void set_pub_id(Long value) {
        pub_id = value;
    }
    public Long get_pub_id() {
        return pub_id;
    }

    public void set_type(String value) {
        type = value;
    }
    public String get_type() {
        return type;
    }
    
    public void set_comment(String value) {
        comment = value;
    }
    public String get_comment() {
        return comment;
    }

    public void set_date(java.util.Date value) {
        date = value;
    }
    public java.util.Date get_date() {
        return date;
    }
 
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println("****** TfcUpdateHistory content test ******");
        System.out.println("community_id: " + get_community_id());
        System.out.println("tair_object_id: " + get_tair_object_id());
        System.out.println("attribution_type_id: " + get_attribution_type_id());
        System.out.println("update_history_id: " + get_update_history_id());
        System.out.println("Date: " + get_date());
        System.out.println("type: " + get_type());
        System.out.println("comment: " + get_comment());
        System.out.println("**** TfcUpdateHistory content test end ****");

    }

    /**
     * For unit testing only
     */
    public static void main(String[] args) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long(36);
            TfcUpdateHistory update_history = new TfcUpdateHistory(conn, id);
            update_history.test();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
