//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2006/01/18 00:13:35 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.SQLException;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.TextConverter;

/**
 * OtherMappingCategory is a concrete sub-class of CatalogCategory that defines
 * methods and properties specific to the other mapping lines seed stock
 * category
 */

public class OtherMappingCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to return
     * "other_mapping" as the name of this category
     * 
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "other_mapping";
    }

    /**
     * Implements abstract method defined in superclass to return SQL query to
     * retrieve stock ids that make up other mapping lines seed stock category.
     * SQL query will retrieve all stock ids that are associated to germplasms
     * that have associated polymorphisms, have the Germplasm.is_mapping_strain
     * flag set to true, whose taxon is Arabidopsis thaliana and are individual
     * lines (not members of sets). Stocks are sorted alphabetically by donor
     * last name and allele name
     * 
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {

        // Cardinality of stock to polymorphism will cause
        // multiple rows to be returned for each stock id
        // w/more than 1 allele , but duplicate filtering
        // should handle that when ids are saved from initial query
        String query = "SELECT s.stock_id, p.name, pe.last_name_uc "
                       + "FROM Stock s, "
                       + "StockAvailabilityType sa, "
                       + "TairObject_Stock ts, "
                       + "Germplasm g, "
                       + "Taxon t, "
                       + "Germplasm_MapElement gm, "
                       + "Polymorphism p, "
                       + "Donor d, "
                       + "Community c, "
                       + "Person pe "
                       + "WHERE s.stock_availability_type_id = "
                       + "sa.stock_availability_type_id "
                       + "AND sa.stock_availability_type = "
                       + TextConverter
                                      .dbQuote( DataConstants
                                                             .getAvailableStock() )
                       + " "
                       + "AND s.stock_id = ts.stock_id "
                       + "AND ts.tair_object_id = g.tair_object_id "
                       + "AND g.taxon_id = t.taxon_id "
                       + "AND g.germplasm_id = gm.germplasm_id "
                       + "AND gm.map_element_id = p.map_element_id "
                       + "AND s.stock_id = d.stock_id "
                       + "AND d.stock_id = ts.stock_id "
                       + "AND d.community_id = c.community_id "
                       + "AND c.community_id = pe.community_id "
                       + "AND d.community_id = pe.community_id "
                       + "AND c.is_obsolete = 'F' "
                       + "AND c.status = "
                       + TextConverter
                                      .dbQuote( DataConstants.getActiveStatus() )
                       + " "
                       + "AND p.is_obsolete = 'F' "
                       + "AND s.is_seed = 'T' "
                       + "AND s.is_obsolete = 'F' "
                       + "AND g.is_obsolete = 'F' "
                       + "AND t.scientific_name = 'Arabidopsis thaliana' "
                       + "AND g.is_mapping_strain = 'T' "
                       + "AND g.germplasm_type = 'individual_line' "
                       + "AND s.stock_id NOT IN ("
                       + "SELECT ts.stock_id "
                       + "FROM TairObject_Stock ts "
                       + "WHERE ts.stock_id = s.stock_id "
                       + "AND ts.relationship_type = 'member_of_set' "
                       + ") "
                       + "ORDER BY pe.last_name_uc, p.name ";

        return query;
    }

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on other mapping
     * lines catalog page. Associated data for this category includes germplasm,
     * species variants, polymorphisms, genes, gene aliases, loci, stock donors
     * and germplasm images
     * 
     * @param conn
     *            An active connection to the database
     * @param stock
     *            Stock to populate
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateAssociatedData( DBconnection conn, CatalogStock stock )
        throws SQLException {

        stock.populateGermplasm( conn );

        // get species variant through pedigree table if necessary
        stock.populatePedigreeSpeciesVariants( conn );

        // get polymorphisms for germplasm along w/genes and
        // gene full_name/alt_fullname aliases for each gene -
        // genes are retrieved through germplasm's polymorphisms
        // & are contained by GermplasmPolymorphism (subclass of 
        // PolymorphismObject)
        stock.populateGermplasmPolymorphisms( conn );
        stock.populateDonors( conn );

        stock.populateImages( conn );
    }

}
