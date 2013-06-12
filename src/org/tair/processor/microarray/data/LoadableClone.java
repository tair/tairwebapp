//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:28:39 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGermplasm;
import org.tair.tfc.TfcClone;
import org.tair.tfc.TfcGene;
import org.tair.tfc.TfcGeneMapElement;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.InvalidActionException;


/**
 * LoadableClone extends TfcClone to contain detailed information about a clone.
 * LoadableClone is used by the microarray data loading tool to handle the 
 * insertion of new clone data and its association to taxon and gene info. as 
 * needed when parsing data files to populate an expression set.
 */
 
public class LoadableClone extends TfcClone {

    // 
    // gene data for clone along with join info. for clone to gene -- less 
    // cumbersome to just keep these objects here rather than create another 
    // Loadable object for gene
    //
    private TfcGene gene;
    private TfcGeneMapElement geneMapElement;

    // taxon data for clone
    private TfcTaxon taxon;


    /**
     * Creates an empty instance of LoadableClone
     */
    public LoadableClone() {
	super();
    }


    /**
     * Creates an instance of LoadableClone that reflects the data referenced
     * by submitted clone id
     *
     * @param conn An active connection to the database
     * @param clone_id Clone id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableClone( DBconnection conn, Long clone_id ) 
	throws SQLException {

	super( conn, clone_id );

	if ( get_taxon_id() != null ) {
	    taxon = new TfcTaxon( conn, get_taxon_id() );
	}
    }


    
    //
    // TfcTaxon wrappers
    //
    public String get_taxon_original_name() { 
	return hasTaxon() ? taxon.get_original_name() : null;
    }

    public String get_genus() { 
	return hasTaxon() ? taxon.get_genus() : null;
    }

    public String get_species() {
	return hasTaxon() ? taxon.get_species() : null;
    }

    public String get_division_code() { 
	return hasTaxon() ? taxon.get_division_code() : null;
    }

    public String get_scientific_name() { 
	return hasTaxon() ? taxon.get_scientific_name() : null;
    }

    public String get_common_name() {
	return hasTaxon() ? taxon.get_common_name() : null;
    }

    public String get_taxonomy() {
	return hasTaxon() ? taxon.get_taxonomy() : null; 
    }

    public String get_genbank_taxonomy_id() { 
	return hasTaxon() ? taxon.get_genbank_taxonomy_id() : null;
    }

    /**
     * Determines if clone has associated taxon data
     *
     * @return <code>true</code> if clone has taxon data, 
     * <code>false</code> if no taxon data for clone
     */
    public boolean hasTaxon() {
	return ( taxon != null );
    }
    
    /**
     * Sets taxon object.  When loading from external data file, this object 
     & is assembled externally and then set with clone
     *
     * @param taxon Taxon for clone
     */
    public void setTaxon( TfcTaxon taxon ) {
	this.taxon = taxon;

	// set foreign key in superclass
	super.set_taxon_id( taxon.get_taxon_id() );
    }


    //
    // TfcGene wrappers
    //

    public Long get_gene_id() {
	return hasGene() ? gene.get_gene_id() : null;
    }

    public String get_gene_model_type() {
        return hasGene() ? gene.get_gene_model_type() : null;
    }

    public String get_gene_name() {
        return hasGene() ? gene.get_name() : null;
    }

    public String get_gene_name_type() {
        return hasGene() ? gene.get_name_type() : null;
    }

     
    /**
     * Determines if clone has associated gene data
     *
     * @return <code>true</code> if clone has gene data, 
     * <code>false</code> if no gene data for clone
     */
    public boolean hasGene() {
	return ( gene != null );
    }
    
    /**
     * Sets gene object.  When loading from external data file, this object 
     & is assembled externally and then set with clone
     *
     * @param gene Gene for clone
     */
    public void setGene( TfcGene gene ) {
	this.gene = gene;

	// set foreign key in join class
	if ( geneMapElement == null ) {
	    geneMapElement = new TfcGeneMapElement();
	    geneMapElement.set_gene_id( gene.get_gene_id() );

	    // if clone is new, map element id will be null until data is
	    // stored; new id will be set at that point
	    geneMapElement.set_map_element_id( get_map_element_id() );
	    
	}
    }

    
    /**
     * Stores clone data and association to gene to database.  
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	super.store( conn );
	
	// set newly created map element id and store association to gene
	if ( hasGene() ) {
	    geneMapElement.set_map_element_id( get_map_element_id() );
	    geneMapElement.store( conn );
	}
    }
}
