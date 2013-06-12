//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/04/07 23:01:19 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * cDNACloneCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the full length
 * cDNA clone dna stock category
 */

public class cDNACloneCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "cdna_clone" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "cdna_clone";
    }
    
    /**
     * Overrides default implementation in superclass to show
     * 500 stocks on each catalog page.
     * 
     * @return Number of stocks to show on each catalog page for this category.
     */
    protected int getPageSize() {
        return 500;
    }

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up the full length 
     * cDNA clone stock category.  SQL query will retrieve all stock 
     * ids that are associated to clones that have a NT sequence where 
     * cds_is_full_length is "T", sequence type is "mrna" and sequence 
     * class is "cDNA". Stocks are sorted alphabetically by clone's 
     * associated locus name
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        
        // join to locus may cause multiple rows for each stock/clone,
        // but getStockIDs should account for that
        String query =
            "SELECT s.stock_id, l.name " +
            "FROM Stock s, " +
            "TairObject_Stock ts, " +
            "Clone c, " +
            "MapElement_Locus ml, " +
            "Locus l, " +
            "StockAvailabilityType sa " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = c.tair_object_id " +
            "AND c.map_element_id = ml.map_element_id " +
            "AND ml.locus_id = l.locus_id " +
            "AND l.is_obsolete = 'F' " +
            "AND c.is_obsolete = 'F' " +
            "AND s.is_obsolete = 'F' " +
            "AND EXISTS ( " +
                         "SELECT 'X' " +
                         "FROM NucleotideSequence_MapElement nm, " +
	                 "NucleotideSequence n " +
                         "WHERE nm.map_element_id = c.map_element_id " +
                         "AND nm.nucleotide_seq_id = n.nucleotide_seq_id " +
                         "AND n.is_obsolete = 'F' " +
                         "AND n.cds_is_full_length = 'T' " +
                         "AND n.nucleotidesequence_type = 'mrna' " +
                         "AND n.sequence_class = 'cDNA' ) " + 
            "ORDER BY l.name "; 

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on full length 
     * cDNA clone catalog page.  Associated data for full length cDNA clones 
     * includes clone, clone's NT sequences, loci and stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */        
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
	throws SQLException {

        stock.populateClone( conn );
        stock.populateCloneNTSequences( conn );
        stock.populateCloneLocus( conn );
        stock.populateDonors( conn ); 
    }

}



