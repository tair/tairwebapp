//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/05/24 23:34:16 $
//------------------------------------------------------------------------------
package org.tair.search.dna;

import java.sql.*;
import java.util.*;

import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;

 
/**
 * LibrarySummary represents the information needed to display one library 
 * record as part of the library search results returned by a library subtype
 * search of <code>DNASearcher</code>. LibrarySummary contains all fields from
 * the temp table used to hold library search results as well as collections of
 * additional information (such as stocks). LibrarySummary implements the 
 * <code>DNASummary</code> interface so that it can be used by 
 * <code>DNASearchHandler</code> to create downloads generically (regardless
 * of dna sub type)
 *
 * <p>
 * LibrarySummary implements Accessible interface to facilitate creation of
 * the object's TAIR accession number through <code>AccessionManager</code
 */

public class LibrarySummary implements DNASummary, Accessible {

    private Long tair_object_id;
    private Long library_id;
    private String name;
    private String description;

    // stocks associated w/library - stored as TfcStock
    private StockCollection stocks;

    /**
     * Creates an empty instance of LibrarySummary
     */
    public LibrarySummary() {  }

    /**
     * @return Abbreviated description for library, truncated to nearest
     * word at 100 chars.
     */
    public String get_abbrev_description() { 
        return TextConverter.truncateString( description, 100 );
    }
  
    public Long get_tair_object_id() { 
        return tair_object_id; 
    } 

    public Long get_library_id() {
        return library_id; 
    } 

    public String get_name() { 
        return name;
    } 

    public String get_description() {
        return description;
    } 

    public void set_tair_object_id( Long id ) {
        this.tair_object_id = id;
    }

    public void set_library_id( Long id ) { 
        this.library_id = id;
    }

    public void set_name( String name ) {
        this.name = name; 
    }

    public void set_description( String desc ) {
        this.description = desc;
    }

    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public final String getAccession() {
        return AccessionManager.getAccession( this ); 
    }
    
    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (cloneend) for use in creating TAIR 
     * accession
     */
    public final String getElementType() {
        return "library"; 
    }
    
    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR 
     * accession number. Implemented here to satisfy the <code>Accessible</code> 
     * interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() {
        return get_tair_object_id();
    }
    
    /**
     * Creates a tab-delimited string of this library's data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Description</li>
     * <li>Stock numbers as delimited string</li>
     * </ul>
     *
     * @return Tab-delimited string of library data
     */
    public String createExport() {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( EmptyTextConverter.convert( get_name() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_description() ) 
		       + "\t" );


        if ( stocks != null ) {
            export.append( EmptyTextConverter.convert( 
			       stocks.getStockNumberString() ) + 
			   "\n" );
        } else {
            export.append( "\n" );
        }
        return export.toString();
    }

    /**
     * @return Column order used when creating export as a tab-delimited string
     */ 
    public String getExportHeader() {
        String header = 
            "TAIR Accession\t" +
            "Name\t" +
            "Description\t" +
            "ABRC Stocks\n";
        return header;
    }


    /**
     * @return Stocks associated with this library as an <code>Iterator</code> 
     * of <code>TfcStock</code> objects, or <code>null</code> if no stocks 
     * associated with library
     */
    public Iterator get_stocks() {
        return ( stocks != null && !stocks.isEmpty() ) ? 
	    stocks.iterator() : null;
    }
  

    /**
     * Retrieves associated stocks for library
     */
    public void get_information( DBconnection conn ) throws SQLException {
	stocks = new StockCollection( conn, get_tair_object_id() );
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** LibrarySummary content test ******" );
        System.out.println( "tair_object_id: " + get_tair_object_id() );
        System.out.println( "library id: " + get_library_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "description: " + get_description() );
        System.out.println( "abbrev description: " + get_abbrev_description() );
        System.out.println( "**** LibrarySummary content test end ****" );
        
    }

}
