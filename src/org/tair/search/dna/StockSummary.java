//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/05/24 23:34:16 $
//------------------------------------------------------------------------------

package org.tair.search.dna;

import java.sql.*;
import java.util.*;

import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * StockSummary represents the information needed to display one stock record
 * as part of the search results returned by dna stock or pooled genomic DNA 
 * subtype searches of <code>DNASearcher</code>. StockSummary contains all 
 * fields from the temp tables used to hold dna stock/pooled genomic DNA search 
 * results. StockSummary implements the <code>DNASummary</code> interface so 
 * that it can be used by <code>DNASearchHandler</code> to create downloads 
 * generically (regardless of dna sub type)
 *
 * <p>
 * StockSummary implements Accessible interface to facilitate creation of the
 * object's TAIR accession number through <code>AccessionManager</code
 *
 * <p>
 * StockSummary contains a collection of stock donors.  This is only populated
 * when the populateDonors() method is called. This is done so that this summary
 * object can be used by both the pooled genomic DNA search (which doesn't need
 * donors for display) and the generic DNA stock search (which does need them).
 */

public class StockSummary implements DNASummary, Accessible {

    private Long tair_object_id;
    private Long stock_id;
    private String name;
    private String description;
    private Long stock_availability_type_id;
    private String stock_availability_type;
    private Long stock_type_id;
    private String stock_type;

    // stock donors - stored as Donor objects
    private ListCommunityCollection donors;
  
    // associated data type name (from Clone, Library, Vector, HostStrain
    // table etc. according to stock type)
    private String dataTypeName;

    // associated data type description (from Clone, Library, HostStrain
    // Vector table etc. according to stock type)
    private String dataTypeDescription;

    /**
     * Creates an empty instance of StockSummary
     */
    public StockSummary() { }

    /**
     * Populates ancillary data for object (including stock description and
     * name/description for any associated data element like Clone).  
     *
     * @param conn An active connection to the database
     */
    public void populate( DBconnection conn ) throws SQLException {
        this.description = 
	    TfcStock.retrieveDescription( conn, get_stock_id() );

        populateDataTypeInfo( conn );
    }


    /**
     * Populates name and description for associated data element according
     * to value of stock type.  This data will only be populated for clones,
     * clone sets, host strains, vectors and libraries.  All other elements
     * will use values from Stock table.
     * 
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populateDataTypeInfo( DBconnection conn ) throws SQLException {
        String tableName = null;
        String descrColumn = null;

        // if/else on stock type to determine table name and 
        // description column for querying (yuk...)

        // clones don't have description, sub in NULL value as description
        if ( stock_type.equals( "clone" ) || 
	     stock_type.equals( "clone_set" ) ) {

            tableName = "Clone";
            descrColumn = "NULL AS description";

        } else if ( stock_type.equals( "vector" ) ) {
            tableName = "Vector";
            descrColumn = "dt.description";

        } else if ( stock_type.equals( "library" ) ) {
            tableName = "Library";
            descrColumn = "dt.description";
            
        }  else if ( stock_type.equals( "host_strain" ) ) {
            tableName = "HostStrain";
            descrColumn = "dt.description";
        }

        if ( tableName != null ) {
            String query =
                "SELECT dt.name, " + descrColumn + " " +
                "FROM " + tableName + " dt, TairObject_Stock ts " +
                "WHERE ts.tair_object_id = dt.tair_object_id " +
                "AND dt.is_obsolete = 'F' " +
                "AND ts.stock_id = " + get_stock_id().toString();

            conn.setQuery( query );
            ResultSet results = conn.getResultSet();
            if ( results.next() ) { // assume only one associated element
                this.dataTypeName = results.getString( "name" );
                this.dataTypeDescription = results.getString( "description" );
            }
            conn.releaseResources();
        }
    }


    /**
     * Populates the stock's collection of donors. This is done separately from
     * the main populate() method so that donors are only retrieved when they 
     * are needed for display (since pooled genomic DNA search results don't 
     * display this data and generic dna search results do).  This method 
     * assumes basic stock info. (such as stock_id) has already been populated.
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public void populateDonors( DBconnection conn ) throws SQLException {
	donors = new ListCommunityCollection( conn, 
					      get_stock_id(), 
					      "donor" );
    }

    /**
     * Determines if stock has associated donors
     *
     * @return <code>true</code> if stock has associated donors, or 
     * <code>false</code> if no donors for stock, or if that data hasn't yet
     * been retrieved
     */
    public boolean hasDonors() { 
        return ( donors != null && !donors.isEmpty() );
    }

    /**
     * Retrieves stock donors
     *
     * @return Stock donors as an <code>Iterator</code> of <code>Donor</code>
     * objects, or <code>null</code> if no donors for stock
     */
    public Iterator getDonors() {
        return ( hasDonors() ) ? donors.iterator() : null;
    }

    /**
     * Retrieves abbreviated description for stock
     *
     * @return Abbreviated description for stock, truncated to nearest
     * word at 100 chars.  This method returns contents of description field
     * if they exist, otherwise will return long description field.
     */
    public String get_abbrev_description() {
        return TextConverter.truncateString( get_description(), 100 );
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

    public Long get_stock_type_id() {
        return stock_type_id;
    }

    public String get_stock_type() {
        return stock_type;
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

    public void set_stock_type( String type ) {
        this.stock_type = type;
    }

    public void set_stock_type_id( Long id ) {
        this.stock_type_id = id;
    }

    /**
     * Returns name of data element associated to stock from associated
     * element's table (i.e. from Clone, Library, Vector etc.) according
     * to stock type.  If stock type does not have an associated table,
     * the stock's name/stock number will be returned as if get_name() were
     * called
     *
     * @return Name of associated data element according to stock type
     */
    public String getDataTypeName() {
        return dataTypeName != null ? dataTypeName : get_name();
    }

    /**
     * Returns associated data type description (from Clone, Library,
     * Vector table etc. according to stock type). Returned value will 
     * be abbreviated so that only the first 100 characters are shown.
     * If no associated element's description can be found, stock description
     * will be returned as if get_abbrev_description() were called.
     *
     * @return Description for associated data element according to stock
     * type
     */
    public String getAbbrevDataTypeDescription() {
        String descr = null;

        if ( dataTypeDescription != null ) {
            descr = TextConverter.truncateString( dataTypeDescription, 100 ); 
        } else {
            descr = get_abbrev_description();
        }

        return descr;
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
     * Creates a tab-delimited string of this pool's data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Stock Number</li>
     * <li>Associated Data Type Name</li>
     * <li>Stock Type</li>
     * <li>Associated Data Type Description</li>
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
        export.append( EmptyTextConverter.convert( getDataTypeName() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_stock_type() ) + "\t" );
        export.append( EmptyTextConverter.convert( 
			   getAbbrevDataTypeDescription() ) + 
		       "\t" );

        export.append( EmptyTextConverter.convert( 
			   get_stock_availability_type() ) + 
		       "\n" );
        return export.toString();
    }

    /**
     * Retrieves column order used when creating tab-delimited exports
     *
     * @return Column order used when creating export as a tab-delimited string
     */ 
    public String getExportHeader() {
        String header = 
            "TAIR Accession\t" +
            "Stock Number\t" +
            "Name\t" +
            "Stock Type\t" +
            "Description\t" +
            "Stock Availability\n";
        return header;
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** StockSummary content test ******" );
        System.out.println( "tair_object_id: " + get_tair_object_id() );
        System.out.println( "stock id: " + get_stock_id() );
        System.out.println( "name: " + get_name() );

        System.out.println( "stock availability type id: " + 
			    get_stock_availability_type_id() );

        System.out.println( "stock availability type: " + 
			    get_stock_availability_type() );

        System.out.println( "description: " + get_description() );
        System.out.println( "abbrev descr: " + get_abbrev_description() );
        System.out.println( "stock type id: " + get_stock_type_id() );
        System.out.println( "stock type: " + get_stock_type() );
        System.out.println( "data type name: " + getDataTypeName() );

        System.out.println( "data type descr: " + 
			    getAbbrevDataTypeDescription() );

        System.out.println( "**** StockSummary content test end ****" );
        
    }

}
