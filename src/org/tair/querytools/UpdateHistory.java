//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.2 $
// $Date: 2004/11/02 20:03:32 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * UpdateHistory extends TfcUpdateHistory to show more complete information
 * about an UpdateHistory entry on another element's detail page (such as gene,
 * locus or sequence). UpdateHistory contains display information based on the
 * type and auxilliary tair object information like type and name.
 * 
 * Display text and affected object disaply text are provided here based 
 * on the type vaule in UPdateHistory table -- would be nice to have this 
 * as a lookup in an UpdateHistoryType table so if new types are added 
 * the corresponding display text can be obtained from a table instead of
 * this java class - mhm   
 */

public class UpdateHistory extends TfcUpdateHistory {

    private String tairObjectName;
    private String tairObjectType;
    private String affectedTairObjectName;
    private String affectedTairObjectType;
    private String displayText;
    private String affectedObjectDisplayText;

    /**
     * Creates an empty instance of UpdateHistory
     */
    public UpdateHistory() {
        super();
    }
	
    /**
     * Creates an instance of UpdateHistory that reflects the data referenced
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
	
    public UpdateHistory( DBconnection conn, Long update_history_id )
	throws RecordNotFoundException, SQLException {
        super( conn, update_history_id );
        if ( get_tair_object_id() != null ) {
            set_tair_object_name( conn, get_tair_object_id() );
            set_tair_object_type( conn, get_tair_object_id() );
        }
        if ( get_affected_tair_object_id() != null ) {
            set_affected_tair_object_name( conn, get_affected_tair_object_id() );
            set_affected_tair_object_type( conn, get_affected_tair_object_id() );
        }
        set_display_text();
    }
	
    private void set_tair_object_type( DBconnection conn, Long tair_object_id) 
	throws SQLException {
        tairObjectType = ObjectTyper.getTairObjectType( conn,
                                                        get_tair_object_id() );
    }
	
    public String get_tair_object_type() {
        return tairObjectType;
    }
	
    private void set_tair_object_name( DBconnection conn, Long tair_object_id )
	throws SQLException {
        tairObjectName = ObjectTyper.getTairObjectName
            ( conn, ObjectTyper
              .getTairObjectTable(conn, get_tair_object_id() ),
              get_tair_object_id() );
    }

    public String get_tair_object_name() {
        return tairObjectName;
    }
	
    private void set_affected_tair_object_type
        ( DBconnection conn,
          Long affected_tair_object_id) throws SQLException {
        affectedTairObjectType = ObjectTyper.getTairObjectType
            ( conn,
              get_affected_tair_object_id() );
    }

    public String get_affected_tair_object_type() {
        return affectedTairObjectType;
    }
	
    private void set_affected_tair_object_name
        ( DBconnection conn,
          Long affected_tair_object_id ) throws SQLException {
        affectedTairObjectName = ObjectTyper.getTairObjectName
            ( conn,
              ObjectTyper.getTairObjectTable( conn,
                                              get_affected_tair_object_id() ),
              get_affected_tair_object_id() );
    }
	
    public String get_affected_tair_object_name() {
        return affectedTairObjectName;
    }

    private void set_display_text() {
        if ( get_type().equalsIgnoreCase("obsoletion") ) {
            displayText = "obsoleted";
            affectedObjectDisplayText = "";
        } else if ( get_type().equalsIgnoreCase("addition") ) {
            displayText = "added";
            affectedObjectDisplayText = "";
        } else if ( get_type().equalsIgnoreCase("substitution") ) {
            displayText = "replaces";
            affectedObjectDisplayText = "";
        } else if ( get_type().equalsIgnoreCase("split_insert") ) {
            displayText = "split and added";
            affectedObjectDisplayText = "added from split";
        } else if ( get_type().equalsIgnoreCase("merge_obsoletion") ) {
            displayText = "obsolete and replaced by";
            affectedObjectDisplayText = "replaces";
        } else if ( get_type().equalsIgnoreCase("update") ) {
            displayText = "updated";
            affectedObjectDisplayText = "";
        } else if ( get_type().equalsIgnoreCase("replacement") ) {
            displayText = "replaced";
            affectedObjectDisplayText = "";
        } else if ( get_type().equalsIgnoreCase("restoration") ) {
            displayText = "restored";
            affectedObjectDisplayText = "";
        } else {
            displayText = "";
            affectedObjectDisplayText = "";
        }
    }
	
    public String get_display_text() {
        return displayText;
    }
	
    public String get_affected_object_display_text() {
        return affectedObjectDisplayText;
    }

    /**
     * For unit testing only
     */
    public void test() {

        System.out.println("****** UpdateHistory content test ******");
        super.test();
        System.out.println("tair_object_name: " + get_tair_object_name() );
        System.out.println("tair_object_type: " + get_tair_object_type() );
        System.out.println("affectd_tair_object_name: " + 
                           get_affected_tair_object_name() );
        System.out.println("affected_tair_object_type: " + 
                           get_affected_tair_object_type() );
        System.out.println("display_text: " + 
                           get_display_text() );
        System.out.println("affected_object_display_text: " + 
                           get_affected_object_display_text() );

        System.out.println("**** UpdateHistory content test end ****");
    }

    /**
     * For unit testing only
     */
    public static void main(String[] args) {
        try {

            DBconnection conn = new DBconnection();
            UpdateHistory history = null;
            Long id = new Long( 14631 );
            history = new UpdateHistory( conn, id );
            history.test();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
