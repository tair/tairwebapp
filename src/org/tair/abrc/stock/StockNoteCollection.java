// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.3 $
// $Date: 2005/09/14 16:21:59 $
// ------------------------------------------------------------------------------
package org.tair.abrc.stock;


import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcStockNote;


/**
 * StockNoteCollection is a custom collection that contains stock notes for a
 * stock as <code>TfcStockNote</code> objects.
 * 
 * <p>
 * Implements Serializable so order session attributes can be serialized if
 * server is restarted
 */

public class StockNoteCollection implements Serializable,
    Iterable<TfcStockNote> {
  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;
  private static final Logger logger =
    Logger.getLogger(StockNoteCollection.class);
  private ArrayList<TfcStockNote> stockNotes;

  /**
   * Creates an empty instance of StockNoteCollection
   */
  public StockNoteCollection() {
    stockNotes = new ArrayList<TfcStockNote>();
  }

  /**
   * Creates an instance of StockNoteCollection that contains all stock notes
   * for submitted stock id
   * 
   * @param conn An active connection to the database
   * @param stock_id Stock id to retrieve stock notes for
   * @exception SQLException thrown if a database error occurs
   */
  public StockNoteCollection(DBconnection conn, Long stock_id)
      throws SQLException {

    stockNotes = new ArrayList<TfcStockNote>();
    populate(conn, stock_id);
  }

  /**
   * Retrieve all stock note ids associated to stock id & create TfcStockNote
   * objects for each
   * 
   * @param conn An active connection the database
   * @param stock_id Stock id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  private void populate(DBconnection conn, Long stock_id) throws SQLException {

    ArrayList<Long> ids = null;

    String query =
      "SELECT sn.stock_note_id "
          + "FROM Stock_StockNote sn "
          + "WHERE sn.stock_id = ?";

    try {
      conn.setQuery(query);
      conn.setQueryVariable(stock_id);

      ResultSet results = conn.getResultSet();
      while (results.next()) {
        if (ids == null) {
          ids = new ArrayList<Long>();
        }
        ids.add(new Long(results.getLong("stock_note_id")));
      }
    } finally {
      conn.releaseResources();
    }

    if (ids != null && !ids.isEmpty()) {
      Iterator<Long> iter = ids.iterator();
      while (iter.hasNext()) {
        add(new TfcStockNote(conn, (Long)iter.next()));
      }

    }
  }

  /**
   * Determines if collection contains elements or not
   * 
   * @return <code>true</code> if collection has no elements in it, or
   *         <code>false</code> if collection has at least one element in it
   */
  public boolean isEmpty() {
    return stockNotes.isEmpty();
  }

  /**
   * Determines number of elements in collection
   * 
   * @return Number of elements in collection
   */
  public int size() {
    return stockNotes.size();
  }

  /**
   * Retrieves all elements in collection
   * 
   * @return Elements in collection as an <code>Iterator</code> of
   *         <code>TfcStockNote</code> objects, or <code>null</code> if no
   *         elements in collection
   */
  public Iterator<TfcStockNote> iterator() {
    return !isEmpty() ? stockNotes.iterator() : null;
  }

  /**
   * Retrieves element at submitted index
   * 
   * @param index Index of item to retrieve
   * @return Element at submitted index, or <code>null</code> if no element at
   *         requested index
   */
  public TfcStockNote get(int index) {
    return (TfcStockNote)stockNotes.get(index);
  }

  /**
   * Determines index of submitted object in collection
   * 
   * @param stockNote TfcStockNote object to retrieve index of
   * @return index of TfcStockNote within collection
   */
  public int indexOf(TfcStockNote stockNote) {
    return stockNotes.indexOf(stockNote);
  }

  /**
   * Adds supplied element to collection
   * 
   * @param stockNote TfcStockNote to add to collection
   */
  public void add(TfcStockNote stockNote) {
    stockNotes.add(stockNote);
  }

  /**
   * Removes supplied element from collection.
   * 
   * @param stockNote TfcStockNote to remove from collection
   */
  public void remove(TfcStockNote stockNote) {
    stockNotes.remove(stockNote);
  }

  /**
   * Determines if supplied element is in collection
   * 
   * @param stockNote the stock note for which to test the collection
   * 
   * @return <code>true</code> if supplied element is in collection;
   *         <code>false</code> if element is not found
   */
  public boolean contains(TfcStockNote stockNote) {
    return stockNotes.contains(stockNote);
  }

  /**
   * For unit testing only
   */
  public void test() {
    logger.debug("*** StockNoteCollection content test ***");
    if (!isEmpty()) {
      Iterator<TfcStockNote> iter = iterator();
      while (iter.hasNext()) {
        TfcStockNote stockNote = (TfcStockNote)iter.next();
        stockNote.test();
      }
    }
    logger.debug("*** StockNoteCollection content test end ***");
  }

  /**
   * For unit testing only
   * 
   * @param args command line args
   */
  public static void main(String[] args) {
    try {
      DBconnection conn = new DBconnection();
      Long stockID = new Long(203301);
      StockNoteCollection stockNotes = new StockNoteCollection(conn, stockID);
      stockNotes.test();

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
