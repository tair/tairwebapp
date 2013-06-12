/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.sql.*;
import java.util.ArrayList; 
import java.util.Collection;
import org.tair.utilities.*;

/** 
 * TfcGeneSymbolReference is a static class used to generate
 * collections based on the relationships embodied by
 * the Gene_Symbol_Reference table. 
 *
 */ 

public class TfcGeneSymbolReference  {

    public static final String TABLE_GENE_SYMBOL_REFERENCE = "Gene_Symbol_Reference";
    public static final String COLUMN_GENE_ID              = "gene_id";
    public static final String COLUMN_SYMBOL_ID            = "symbol_id";
    public static final String COLUMN_REFERENCE_ID         = "reference_id";
    public static final String COLUMN_IS_OBSOLETE          = "is_obsolete";
    public static final String COLUMN_DATE_ENTERED         = "date_entered";
    public static final String COLUMN_DATE_LAST_MODIFIED   = "date_last_modified";


    /**
     *
     * Generates a collection of distinct symbols for a particular gene.
     *
     * @param conn An active connection to the database
     * @param symbol_id ID to retrieve data for
     * @exception SQLException if a database error occurs
     * @exception RecordNotFoundException if no row found for submitted
     * symbol_id
     *
     */
    public static Collection<TfcSymbol> symbols_for_gene ( DBconnection conn, Long gene_id ) throws SQLException {

	Collection<TfcSymbol> symbols = new ArrayList();
	Collection<Long> ids = new ArrayList();

        String query =
            " SELECT "         +
	    " DISTINCT ("      + COLUMN_SYMBOL_ID + ") " +
	    " FROM "           +
            TABLE_GENE_SYMBOL_REFERENCE   +
	    " WHERE "          +
            COLUMN_IS_OBSOLETE + " = 'F'" +
            " AND "            +
	    COLUMN_GENE_ID     + " = "    + gene_id.toString();

	try {

	    conn.setQuery( query );
	    ResultSet results = conn.getResultSet();                  
	    
	    while ( results.next() ) {
		ids.add( new Long( results.getLong( COLUMN_SYMBOL_ID ) ) );
	    }

	} finally {
	    conn.releaseResources();
	}

	for ( Long symbol_id : ids ) {
	    symbols.add( new TfcSymbol(conn, symbol_id) );
	}
			 
	
	return symbols;
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();

	    System.out.println( "****** symbols_for_gene test ******" );
	    Long id = new Long( 26821 );
            Collection symbols = TfcGeneSymbolReference.symbols_for_gene( conn, id );
	    test(symbols);
	    System.out.println( "****** symbols_for_gene test end ******" );

        } catch (Exception e ) {
            e.printStackTrace();
        }
    }

    public static void test ( Collection objs ) {

	for ( Object obj : objs ) {
	    System.out.println( obj );
	}
    }




}
