//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2006/01/18 00:13:35 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.SQLException;
import java.util.Comparator;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.TextConverter;

/**
 * TDNAConfirmedCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the confirmed
 * TDNA line stock category
 */

public class TDNAConfirmedCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "tdna_confirmed" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "tdna_confirmed";
    }
    
    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up TDNA confirmed line stock
     * category.  SQL query will retrieve all stock ids that are associated to
     * individual line germplasms that have taxon Arabidopsis thaliana,  
     * have mutagen of TDNA insertion, and have "confirmed line isolated from
     * original SALK/SAIL/WiscDsLox line" in the description.
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {
        
        String criteria = 
            "CONFIRMED LINE ISOLATED FROM ORIGINAL";

        String query =
            "SELECT distinct(s.stock_id) " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "TairObject_Stock ts, " +
            "Germplasm g, " +
            "Taxon t " +
            "WHERE g.taxon_id = t.taxon_id " +
            "AND t.scientific_name = 'Arabidopsis thaliana' " + 
            "AND s.stock_availability_type_id = " +
            "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_id = ts.stock_id " +
            "AND ts.tair_object_id = g.tair_object_id " +
            "AND s.is_seed = 'T' " +
            "AND s.is_obsolete = 'F' " +
            "AND g.is_obsolete = 'F' " +
            "AND g.mutagen = 'T-DNA insertion' " +
            "AND g.germplasm_type = 'individual_line' " +
            "AND g.description_uc LIKE '%" + criteria + "%' ESCAPE '\\\'";
        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on confirmed TDNA
     * catalog page.  Associated data for confirmed TDNA lines includes 
     * germplasm, polymorphisms, genes, loci, stock donors and germplasm 
     * parents from pedigree
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {

        stock.populateGermplasm( conn );
        
        // get polymorphisms for germplasm along w/genes and
        // gene full_name/alt_fullname aliases for each gene - 
        // genes are retrieved through germplasm's polymorphisms 
        // & are contained by GermplasmPolymorphism --- Don't actually need
        // polymorphisms for display, but they must be retrieved to
        // get gene & locus associations for germplasm
        stock.populateGermplasmPolymorphisms( conn );

        stock.populateDonors( conn );
        
        stock.populateGermplasmParents( conn, "purification" );
    }

    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items first by locus then by germplasm name. 
     *
     * @return Custom Comparator for sorting confirmed TDNA line stocks
     */
    protected Comparator getCustomComparator() {
        return new TDNAConfirmedComparator();
    }
}



