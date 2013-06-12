/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.util.Comparator;
import org.tair.tfc.TfcSymbol;


public class SymbolComparator implements Comparator {


    /**
     * Compares two TfcSymbol objects and sorts them by symbol
     * which should never be null. 
     *
     * @return -1 if o1 should sort before o2, 1 if o2 should
     * sort before o1, or 0 if items are equal
     */
    public int compare( Object o1, Object o2 ) {

	TfcSymbol s1 = (TfcSymbol) o1;
	TfcSymbol s2 = (TfcSymbol) o2;

	String symbol1 = s1.get_symbol();
	String symbol2 = s2.get_symbol();

	int result = symbol1.compareTo(symbol2);

	return result;
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            org.tair.tfc.DBconnection conn = new org.tair.tfc.DBconnection();
	    java.util.TreeSet<TfcSymbol> lst = new java.util.TreeSet (new SymbolComparator());

	    int[] ids = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
			  15, 16, 17, 18 };

	    System.out.println( "****** SymbolComparator test ****** " );

	    for (int i=0; i < ids.length; i++) {
		Long id = new Long( ids[i] );
		TfcSymbol symbol = new TfcSymbol( conn, id );
		System.out.println("adding type:" + symbol);
		lst.add(symbol);
	    }
            
	    System.out.println( "****** ordered? ****** " );
	    
	    for (TfcSymbol symbol : lst) {
		System.out.println(symbol);
	    }

	    System.out.println( "****** SymbolComparator test Complete!****** " );


        } catch (Exception e ) {
            e.printStackTrace();
        }
    }

}
