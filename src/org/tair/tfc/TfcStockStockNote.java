/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;


/**
 * This class maps to the TfcStockStockNote table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 */

public class TfcStockStockNote {

  private Long stock_id;
  private Long stock_note_id;

  /**
   * Creates an empty instance of TfcStockStockNote
   */
  public TfcStockStockNote() {  }


  /**
   * Creates an instance of TfcStockStockNote that reflects the data referenced
   * by combination of submitted stock_id and stock_note_id
   *
   * @param conn An active connection to the database
   * @param stock_id Stock id to retrieve data for
   * @param stock_note_id Stock note id to retrieve data for
   * @exception SQLException thrown if a database error occurs or if no row
   * found for combination of submitted ids
   */
  public TfcStockStockNote( DBconnection conn, Long stock_id, Long stock_note_id ) throws SQLException {
    boolean found = false;
    String query = null;
    ResultSet results = null;
    
    if ( stock_id != null && stock_note_id != null ) {
      query =
	"SELECT stock_note_id, " +
	"stock_id " +
	"FROM Stock_StockNote " +
	"WHERE stock_note_id = " + stock_note_id.toString() + " " +
	"AND stock_id = " + stock_id.toString();

      conn.setQuery( query );
      results = conn.getResultSet();
      found = results.next();
      if ( found ) {
	set_stock_note_id( stock_note_id );
	set_stock_id( stock_id );
      }
      conn.releaseResources();
    }
    
    if ( !found ) {
      throw new RecordNotFoundException( "No relationship found between stock id: " + stock_id + " " +
					 "and stock note id: " + stock_note_id );
    }
  }


  public void set_stock_note_id( Long id ) { this.stock_note_id = id; }
  public Long get_stock_note_id() { return stock_note_id; }
  
  public void set_stock_id( Long id ) { this.stock_id = id; }
  public Long get_stock_id() { return stock_id; }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** TfcStockStockNote content test ******" );   
    System.out.println( "stock note id: " + get_stock_note_id() );
    System.out.println( "stock id: " + get_stock_id() );
    System.out.println( "****** TfcStockStockNote content end ******" );   
  }

  
  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try {

      DBconnection conn = new DBconnection();
      Long stockID = new Long( 0);
      Long stockNoteID = new Long( 0 );
      TfcStockStockNote note = new TfcStockStockNote( conn, stockID, stockNoteID );
      note.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  } 

}
