//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/05/24 23:34:15 $
//------------------------------------------------------------------------------
package org.tair.search.dna;

import java.sql.*;
import java.util.*;

import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;

 
/**
 * HostStrainSummary represents the information needed to display one host 
 * strain record as part of the host strain search results returned by a 
 * host strain subtype search of <code>DNASearcher</code>. HostStrainSummary 
 * contains all fields from the temp table used to hold search results as well
 * as additional information (such as stocks and taxon). HostStrainSummary 
 * implements the <code>DNASummary</code> interface so that it can be used by
 * <code>DNASearchHandler</code> to create downloads generically (regardless
 * of dna sub type)
 *
 * <p>
 * HostStrainSummary implements Accessible interface to facilitate creation 
 * of the object's TAIR accession number through <code>AccessionManager</code
 */

public class HostStrainSummary implements DNASummary, Accessible {

    private Long hostStrainID;
    private Long tairObjectID;
    private Long taxonID;
    private String name;
    private String originalName;
    private String description;


    // scientific name of taxon associated to host strain
    private String scientificName;

    // stocks associated w/host strain - stored as StockObject
    private StockCollection stocks;

    /**
     * Creates an empty instance of HostStrainSummary
     */
    public HostStrainSummary() {  }


    /**
     * Retrieves additional data needed for displaying search results beyond
     * minimum info. stored in temp table.  For host strains, this includes
     * stocks associated to the host strain, taxon and description.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populate( DBconnection conn ) throws SQLException {
	stocks = new StockCollection( conn, getTairObjectID() );

	String descr = TfcHostStrain.retrieveDescription( conn, 
							  getHostStrainID() );
	setDescription( descr );
	
	if ( getTaxonID() != null ) {
	    this.scientificName = 
		TfcTaxon.get_scientific_name( conn, getTaxonID() );
	}
    }


    /**
     * Retrieves description abbreviated to nearest word at 100 chars.
     
     * @return Abbreviated description for host strain, truncated to nearest
     * word at 100 chars.
     */
    public String getAbbrevDescription() { 
	return TextConverter.truncateString( description, 100 ); 
    }
  

    public void setHostStrainID( Long id ) { 
	this.hostStrainID = id; 
    }

    public Long getHostStrainID() { 
	return hostStrainID; 
    } 
 
    public void setTairObjectID( Long id ) {
	this.tairObjectID = id;
    }

    public Long getTairObjectID() {
	return tairObjectID;
    }

    public void setTaxonID( Long id ) { 
	this.taxonID = id; 
    }

    public Long getTaxonID() { 
	return taxonID;
    } 

    public void setName( String name ) { 
	this.name = name; 
    }

    public String getName() { 
	return name;
    }
    
    public void setOriginalName( String name ) {
	this.originalName = name;
    }

    public String getOriginalName() {
	return originalName;
    }

    public void setDescription( String desc ) { 
	this.description = desc;
    }

    public String getDescription() { 
	return description; 
    }
    
    public void setScientificName( String name ) {
	this.scientificName = name;
    }

    public String getScientificName() {
	return scientificName;
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
     * @return Object's element type (cloneend) for use in creating TAIR accession
     */
    public final String getElementType() { 
	return "host_strain"; 
    }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR accession
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { 
	return getTairObjectID(); 
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
        export.append( EmptyTextConverter.convert( getOriginalName() ) + "\t" );
        export.append( EmptyTextConverter.convert( getDescription() ) + "\t" );


        if ( stocks != null ) {
            export.append( EmptyTextConverter.convert( stocks.getStockNumberString() ) + "\n" );
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
     * @return Stocks associated with this library as an <code>Iterator</code> of
     * <code>TfcStock</code> objects, or <code>null</code> if no stocks associated
     * with library
     */
    public Iterator getStocks() {
        return hasStocks() ? stocks.iterator() : null;
    }

    /**
     * Determines if host strain has associated stocks
     *
     * @return <code>true</code> if host strain has associated stocks or 
     * <code>false</code> if no stocks associated to host strain
     */
    public boolean hasStocks() {
	return ( stocks != null && !stocks.isEmpty() );
    }


}
