//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
//$Revision: 1.3 $
//$Date: 2004/06/16 17:30:53 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;

/**
 * UpdateHistoryCollection is a custom collection that stores the update history
 * of a given tair object as a collection of <code>UpdateHistory</code>
 * objects.
 */

public class UpdateHistoryCollection {
    private ArrayList histories;

    /**
     * Creates an empty instance of UpdateHistoryCollection
     */
    public UpdateHistoryCollection() {
        histories = new ArrayList();
    }

    /**
     * Creates an instance of UpdateHistoryCollection that contains the update
     * history of the submitted tair object id as <code>UpdateHistory</code>
     * objects
     * 
     * @param conn
     *            An active connection to the database
     * @param tair_object_id
     *            Tair object id to retrieve update history for
     * @exception SQLException
     *                in the case of an invalid operation or database error
     */
    public UpdateHistoryCollection
        (DBconnection conn, Long tair_object_id, boolean affectedTairObject )
        throws SQLException {
        histories = new ArrayList();
        if (tair_object_id != null) {
            populate(conn, tair_object_id, affectedTairObject);
        }
    }

    // retrieve update history ids associated to tair_object_id and create
    // UpdateHistory objects for each
    private void populate(DBconnection conn, Long tair_object_id,
                          boolean affectedTairObject) throws SQLException {
        String query = null;
        ArrayList ids = null;
        ResultSet results = null;
        Iterator iter = null;
        UpdateHistory history = null;
        if (affectedTairObject) {
            query = "SELECT update_history_id " + "FROM UpdateHistory "
                + "WHERE affected_tair_object_id = "
                + tair_object_id.toString();
        } else {
            query = "SELECT update_history_id " + "FROM UpdateHistory "
                + "WHERE tair_object_id = " + tair_object_id.toString();
        }
        conn.setQuery(query);
        results = conn.getResultSet();
        while (results.next()) {
            if (ids == null) {
                ids = new ArrayList();
            }
            ids.add(new Long(results.getLong("update_history_id")));
        }
        conn.releaseResources();

        if (ids != null && !ids.isEmpty()) {
            iter = ids.iterator();
            while (iter.hasNext()) {
                history = new UpdateHistory(conn, (Long) iter.next());
                add(history);
            }
        }
        Collections.sort( histories, new UpdateHistoryComparator() );
    }

    /**
     * Determines if collection has elements in it or not
     * 
     * @return <code>true</code> if collection has no elements in it;
     *         <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() {
        return histories.isEmpty();
    }

    /**
     * Retrieves number of elements in collection
     * 
     * @return Number of elements in collection
     */
    public int size() {
        return histories.size();
    }

    /**
     * Retrieves element at supplied index as a <code>UpdateHistory</code>
     * object
     * 
     * @return Element at supplied index, or <code>null</code> if no element
     *         at supplied index
     */
    public UpdateHistory get(int index) {
        return (UpdateHistory) histories.get(index);
    }

    /**
     * Adds supplied element to collection
     * 
     * @param history
     *            Element to add to collection
     */
    public void add(UpdateHistory history) {
        histories.add(history);
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     * 
     * @param history
     *            Element to remove from collection
     */
    public void remove(UpdateHistory history) {
        histories.remove(history);
    }

    /**
     * Determines if supplied element is in collection
     * 
     * @param history
     *            Element to check
     * @return <code>true</code> if supplied element is in collection;
     *         <code>false</code> if element is not found
     */
    public boolean contains(UpdateHistory history) {
        return histories.contains(history);
    }

    /**
     * Retrieves all elements in collection
     * 
     * @return All elements in collection as an <code>Iterator</code> of
     *         <code>TfcUpdateHistory</code> objects, or <code>null</code>
     *         if no elements in collection
     */
    public Iterator iterator() {
        return (!histories.isEmpty()) ? histories.iterator() : null;
    }
    
    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be
     * sorted by
     */
    public void sort( Comparator comparator ) {
        Collections.sort( histories, comparator );
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out
            .println("****** UpdateHistoryCollection content test ******");
        if (!isEmpty()) {
            Iterator iter = iterator();
            UpdateHistory history = null;
            while (iter.hasNext()) {
                history = (UpdateHistory) iter.next();
                history.test();
            }
        }
        System.out
            .println("**** UpdateHistoryCollection content test end ****");
    }

    /**
     * For unit testing only
     */
    public static void main(String[] args) {
        try {

            DBconnection conn = new DBconnection();
            Long id = new Long(1000022522);
            UpdateHistoryCollection update_history = 
                new UpdateHistoryCollection( conn, id, false );
            update_history.test();
            update_history = new UpdateHistoryCollection(
                                                         conn, id, true );
            update_history.test();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

