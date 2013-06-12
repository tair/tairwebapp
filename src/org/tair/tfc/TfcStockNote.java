/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jboss.logging.Logger;
import org.tair.utilities.RecordNotFoundException;


/**
 * This class maps to the TfcStockNote table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.

 * Implements Serializable so order session attributes can be serialized if
 * server is restarted
 */

public class TfcStockNote implements Serializable {
  private static final Logger logger = Logger.getLogger(TfcStockNote.class);
  private Long stock_note_id;
  private String name;
  private String note;

  /**
   * Creates an empty instance of TfcStockNote
   */
  public TfcStockNote() {  }


  /**
   * Creates an instance of TfcStockNote that reflects the data referenced
   * by submitted stock_note_id
   *
   * @param conn An active connection to the database
   * @param stock_note_id Stock note id to retrieve data for
   * @exception SQLException thrown if a database error occurs or if no row
   * found for submitted id
   */
  public TfcStockNote( DBconnection conn, Long stock_note_id ) throws SQLException {
    boolean found = false;
    String query = null;
    
    if ( stock_note_id != null ) {
      query = getBaseQuery() + "WHERE stock_note_id = " + stock_note_id.toString();
      found = processResults( conn, query );
    }

    if ( !found ) {
      throw new RecordNotFoundException( "No stock note entry found for stock note id: " + stock_note_id );
    }

  }
  
  private String getBaseQuery() {
    String query =
      "SELECT stock_note_id, " +
      "name, " +
      "note " +
      "FROM StockNote ";
    return query;
  }

  private boolean processResults( DBconnection conn, String query ) throws SQLException {
    boolean found = false;
    ResultSet results = null;

    try {
      conn.setQuery( query );
      results = conn.getResultSet();
      found = results.next();
      if ( found ) {
        set_stock_note_id( new Long( results.getLong( "stock_note_id" ) ) );
        set_name( results.getString( "name" ) );
        set_note( DBconnection.getClob(results, "note") );
      }
    } finally {
      conn.releaseResources();
    }

    return found;
  }

  public void set_stock_note_id( Long id ) { this.stock_note_id = id; }
  public Long get_stock_note_id() { return stock_note_id; }
  
  public void set_name( String name ) { this.name = name; }
  public String get_name() { return name; }

  public void set_note( String note ) { this.note = note; }
  public String get_note() { return note; }

  /**
   * For unit testing only
   */
  public void test() {
    logger.debug( "****** TfcStockNote content test ******" );   
    logger.debug( "stock note id: " + get_stock_note_id() );
    logger.debug( "name: " + get_name() );
    logger.debug( "note: " + get_note() );
    logger.debug( "****** TfcStockNote content end ******" );   
  }


  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try {

      DBconnection conn = new DBconnection();
      Long id = new Long( 0);
      TfcStockNote note = new TfcStockNote( conn, id );
      note.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  } 

}
