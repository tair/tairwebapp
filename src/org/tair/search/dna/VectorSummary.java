//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/05/24 23:34:17 $
//------------------------------------------------------------------------------
package org.tair.search.dna;

import java.sql.*;
import java.util.*;

import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * VectorSummary represents the information needed to display one vector record
 * as part of the vector search results returned by a vector subtype search of
 * <code>DNASearcher</code>. VectorSummary contains all fields from the temp 
 * table used to hold library search results as well as a collection of all 
 * aliases associated with vector. VectorSummary implements the 
 * <code>DNASummary</code> interface so that it can be used by 
 * <code>DNASearchHandler</code> to create downloads generically (regardless
 * of dna sub type)
 *
 * <p>
 * VectorSummary implements Accessible interface to facilitate creation of the
 * object's TAIR accession number through <code>AccessionManager</code
 */

public class VectorSummary implements DNASummary, Accessible {
    
    private Long tair_object_id;
    private Long vector_id;
    private String name;
    private String type;

    // aliases for vector - stored as TfcAlias
    private AliasVector aliases;

    // stocks associated w/library - stored as TfcStock
    private StockCollection stocks;


    /**
     * Creates an empty instance of VectorSummary
     */
    public VectorSummary() {  }
 
  
    public Long get_tair_object_id() {
	return tair_object_id;
    } 

    public Long get_vector_id() {
	return vector_id;
    } 

    public String get_name() {
	return name;
    } 

    public String get_type() {
	return type;
    } 
  
    public void set_tair_object_id( Long id ) { 
	this.tair_object_id = id; 
    }

    public void set_vector_id( Long id ) {
       this.vector_id = id; 
    }

    public void set_name( String name ) {
	this.name = name; 
    }

    public void set_type( String type ) { 
	this.type = type; 
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
     * @return Object's element type (vector) for use in creating TAIR accession
     */
    public final String getElementType() { 
	return "vector"; 
    }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR 
     * accession number. Implemented here to satisfy the <code>Accessible</code> 
     * interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { return get_tair_object_id(); }

    /**
     * Creates a tab-delimited string of this filter's data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Aliases as delimited string</li>
     * <li>Type</li>
     * </ul>
     *
     * @return Tab-delimited string of library data
     */  
    public String createExport() {
	StringBuffer export = new StringBuffer();
	export.append( getAccession() + "\t" );
	export.append( EmptyTextConverter.convert( get_name() ) + "\t" );
	export.append( EmptyTextConverter.convert( get_alias_string() ) +
		       "\t" );

	export.append( EmptyTextConverter.convert( get_type() ) + "\n" );
	return export.toString();
    }
  
    /**
     * @return Column order used when creating export as a tab-delimited string
     */ 
    public String getExportHeader() {
	String header = 
	    "TAIR Accession\t" +
	    "Name\t" +
	    "Aliases\t" +
	    "Vector Type\n";
	return header;
    }

    /**
     * Populates aliases for vector
     *
     * @param conn An active connection to the database
     */
    public void get_information( DBconnection conn ) throws SQLException {
	if ( get_tair_object_id() != null ) {
	    aliases = new AliasVector( conn, get_tair_object_id() );
	    stocks = new StockCollection( conn, get_tair_object_id() );
	}
    }

    /**
     * Retrieve all aliases as a delimited string
     *
     * @return Delimited string of all aliases for vector, or <code>null</code>
     * if no aliases exist
     */
    public String get_alias_string() { 
	return ( aliases != null ) ? aliases.get_alias_string() : null;  
    }


    /**
     * Retrieves aliases for vector as TfcAlias objects
     * 
     * @return Aliases as an <code>Iterator</code> of <code>TfcAlias</code>
     * objects, or <code>null</code> if no aliases exist for vector
     */
    public Iterator get_aliases() {
	Iterator iter = null;
	if ( aliases != null && !aliases.isEmpty() ) {
	    iter = aliases.iterator();
	}
	return iter;
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
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** VectorSummary content test ******" );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "vector id: " + get_vector_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "type: " + get_type() );
	if ( stocks != null && !stocks.isEmpty() ) {
	    stocks.test();
	}
	System.out.println( "**** VectorSummary content test end ****" );
        
    }
}
