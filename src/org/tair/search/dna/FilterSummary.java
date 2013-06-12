//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/05/24 23:34:15 $
//------------------------------------------------------------------------------

package org.tair.search.dna;

import java.sql.*;
import java.util.*;

import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * FilterSummary represents the information needed to display one filter record
 * as part of the filter search results returned by a filter subtype search of
 * <code>DNASearcher</code>. FilterSummary contains all fields from the temp 
 * table used to hold library search results. FilterSummary implements the 
 * <code>DNASummary</code> interface so that it can be used by 
 * <code>DNASearchHandler</code> to create downloads generically (regardless of 
 * dna sub type)
 *
 * <p>
 * FilterSummary implements Accessible interface to facilitate creation of 
 * the object's TAIR accession number through <code>AccessionManager</code
 */


public class FilterSummary implements DNASummary, Accessible {

    private Long tair_object_id;
    private Long stock_id;
    private String name;
    private String description;
    private Long stock_availability_type_id;
    private String stock_availability_type;

    /**
     * Creates an empty instance of FilterSummary
     */
    public FilterSummary() {  }

    /**
     * Populates stock description data for object.  This is done separately
     * here so description fields can be ommitted from a larger select 
     * statement (in the DNA search) where including a TEXT field hinders
     * performance
     *
     * @param conn An active connection to the database
     */
    public void populate( DBconnection conn ) throws SQLException {
	this.description = 
	    TfcStock.retrieveDescription( conn, get_stock_id() );
    }


    /**
     * @return Abbreviated description for filter, truncated to nearest
     * word at 100 chars.  This method returns contents of description field
     * if they exist, otherwise will return long description field.
     */
    public String get_abbrev_description() {
	// truncate to nearest word at 100 chars
	return TextConverter.truncateString( description, 100 );
    }

    public Long get_tair_object_id() {
	return tair_object_id;
    } 

    public Long get_stock_id() {
	return stock_id;
    } 

    public String get_name() {
	return name;
    } 

    public String get_description() {
	return description;
    } 

    public Long get_stock_availability_type_id() {
	return stock_availability_type_id;
    } 

    public String get_stock_availability_type() {
	return stock_availability_type;
    } 

    public void set_tair_object_id( Long id ) {
	this.tair_object_id = id;
    }

    public void set_stock_id( Long id ) {
	this.stock_id = id;
    }

    public void set_name( String name ) {
	this.name = name;
    }

    public void set_description( String desc ) {
	this.description = desc;
    }

    public void set_stock_availability_type_id( Long id ) {
	this.stock_availability_type_id = id;
    }

    public void set_stock_availability_type( String availability ) { 
	this.stock_availability_type = availability;
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
     * @return Object's element type (stock) for use in creating TAIR accession
     */
    public final String getElementType() {
	return "stock";
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
     * Creates a tab-delimited string of this filter's data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Description</li>
     * <li>Stock availability</li>
     * </ul>
     *
     * @return Tab-delimited string of library data
     */
    public String createExport() {
	StringBuffer export = new StringBuffer();
	export.append( getAccession() + "\t" );
	export.append( EmptyTextConverter.convert( get_name() ) + "\t" );
	export.append( EmptyTextConverter.convert( get_description() ) + "\t" );

	export.append( EmptyTextConverter.convert(
			   get_stock_availability_type() ) + 
		       "\n" );

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
	    "Stock Availability\n";
	return header;
    }

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** FilterSummary content test ******" );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "stock id: " + get_stock_id() );
	System.out.println( "name: " + get_name() );
	System.out.println( "stock availability type id: " + 
			    get_stock_availability_type_id() );

	System.out.println( "stock availability type: " +
			    get_stock_availability_type() );

	System.out.println( "description: " + get_description() );
	System.out.println( "abbrev descr: " + get_abbrev_description() );
	System.out.println( "**** FilterSummary content test end ****" );
        
    }

}
