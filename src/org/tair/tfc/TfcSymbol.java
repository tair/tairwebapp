/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.io.Serializable;
import java.sql.*;

import org.tair.utilities.*;


/**
 * This class maps to the Symbol table in the tair database. Each instance
 * maps to one row of data in the Symbol table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 *
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */


public class TfcSymbol implements Serializable {   

    /**
     * Member variables.
     */
    private Long    symbol_id;
    private Long    pub_id;
    private String  symbol;
    private String  full_name;
    private String  is_obsolete;
    private Date    date_entered;
    private Date    date_last_modified;


    /** 
     * Table and column names.
     */
    public static final String TABLE_SYMBOL              = "Symbol_UC";
    public static final String COLUMN_SYMBOL_ID          = "symbol_id";
    public static final String COLUMN_PUB_ID             = "pub_id";
    public static final String COLUMN_SYMBOL             = "symbol";
    public static final String COLUMN_FULL_NAME          = "full_name";
    public static final String COLUMN_IS_OBSOLETE        = "is_obsolete";
    public static final String COLUMN_DATE_ENTERED       = "date_entered";
    public static final String COLUMN_DATE_LAST_MODIFIED = "date_last_modified";

    /**
     * Creates an empty instance of TfcSymbol
     */
    public TfcSymbol() {  }

    /**
     * Creates an instance of TfcSymbol that reflects data referenced by
     * submitted symbol_id
     *
     * @param conn An active connection to the database
     * @param symbol_id ID to retrieve data for
     * @exception SQLException if a database error occurs
     * @exception RecordNotFoundException if no row found for submitted
     * symbol_id
     */
    public  TfcSymbol( DBconnection conn, Long symbol_id ) throws SQLException {
        String query = null;
        boolean found = false;

        if ( symbol_id != null ) {
            query = 
		"SELECT " +
		COLUMN_SYMBOL_ID          + ", " +
		COLUMN_PUB_ID             + ", " +
		COLUMN_SYMBOL             + ", " +
		COLUMN_FULL_NAME          + ", " +
		COLUMN_IS_OBSOLETE        + ", " +
		COLUMN_DATE_ENTERED       + ", " +
		COLUMN_DATE_LAST_MODIFIED +
		" FROM " +
		TABLE_SYMBOL +
		" WHERE " + 
		COLUMN_SYMBOL_ID + " = " + symbol_id.toString();

            found = processResults( conn, query );
        }
    
        if ( !found ) {
            throw new RecordNotFoundException( "No symbol found for " + COLUMN_SYMBOL + ": " + symbol_id );
        }
    
    }
  

    /**
     *  Executes the query that should result in a single matched entry
     *  and sets the member variables accordingly.
     */
    private boolean processResults( DBconnection conn, String query ) throws SQLException {
        boolean found = false;
        ResultSet results = null;


	try {

	    conn.setQuery( query );
	    results = conn.getResultSet();

	    if ( results.next() ) {
		found = true;

		long id = results.getLong( COLUMN_SYMBOL_ID );
		if ( !results.wasNull() ) {
		    set_symbol_id( new Long( id ) );
		}
		
		id = results.getLong( COLUMN_PUB_ID );
		if ( !results.wasNull() ) {
		    set_pub_id( new Long( id ) );
		}
		
		set_symbol( results.getString( COLUMN_SYMBOL ) );
		set_full_name( results.getString( COLUMN_FULL_NAME ) );
		set_is_obsolete( results.getString( COLUMN_IS_OBSOLETE ) );
		
		set_date_entered( results.getDate( COLUMN_DATE_ENTERED ) );
		set_date_last_modified( results.getDate( COLUMN_DATE_LAST_MODIFIED ) );
	    }

	} finally {
	    conn.releaseResources();
	}

        return found;
    }

    /**
     * 
     */
    public String toString () {
	return "<" + get_symbol_id() + ":" + get_symbol() + ":" + get_full_name() + ">";
    }

    /**
     * Get and Set
     */
    public void set_symbol_id ( Long id ) { this.symbol_id = id; }
    public Long get_symbol_id() { return symbol_id; }

    public void set_pub_id ( Long id ) { this.pub_id = id; }
    public Long get_pub_id() { return pub_id; }

    public void set_symbol ( String symbol ) { this.symbol = symbol; }
    public String get_symbol() { return symbol; }

    public void set_full_name ( String full_name ) { this.full_name = full_name; }
    public String get_full_name() { return full_name; }

    public void set_is_obsolete ( String is_obsolete ) { this.is_obsolete = is_obsolete; }
    public String get_is_obsolete() { return is_obsolete; }

    public void set_date_entered ( Date date_entered ) { this.date_entered = date_entered; }
    public Date get_date_entered() { return date_entered; }

    public void set_date_last_modified ( Date date_last_modified ) { this.date_last_modified = date_last_modified; }
    public Date get_date_last_modified() { return date_last_modified; }

  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 6015 );
            TfcSymbol symbol = new TfcSymbol( conn, id );
            symbol.test();

        } catch (Exception e ) {
            e.printStackTrace();
        }
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** Symbol content test ******" );
        System.out.println( COLUMN_SYMBOL_ID + ":" + get_symbol_id() );
        System.out.println( COLUMN_PUB_ID + ":" + get_pub_id() );
        System.out.println( COLUMN_SYMBOL + ":" + get_symbol() );
        System.out.println( COLUMN_FULL_NAME + ":" + get_full_name() );
        System.out.println( COLUMN_IS_OBSOLETE + ":" + get_is_obsolete() );
        System.out.println( COLUMN_DATE_ENTERED + ":" + get_date_entered() );
        System.out.println( COLUMN_DATE_LAST_MODIFIED + ":" + get_date_last_modified() );
        System.out.println( "**** Symbol content test end ****" );      
    }

}
