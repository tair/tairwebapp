//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/04/07 23:01:16 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.TextConverter;


/**
 * CloneSetCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the clone set
 * dna stock category
 */

public class CloneSetCategory extends CatalogCategory {
  private static final Logger logger = Logger.getLogger(CloneSetCategory.class);

    /**
     * Implements abstract method defined in superclass to
     * return "clone_set" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "clone_set";
    }
    

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up clone set
     * stock category.  SQL query will retrieve all stock ids that 
     * have stock type clone set. Stocks are sorted alphabetically 
     * by donor name.
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        

        String query =

	    // Is there a better way to sort by donor name?
	    "SELECT sq1.stock_id, sq1.name, sq2.last_name " +
	    "FROM " +
	    "(SELECT s.stock_id, s.name " +
	    "FROM Stock s, StockAvailabilityType sa, StockType st " +
	    "WHERE s.stock_availability_type_id = sa.stock_availability_type_id " +
	    "AND sa.stock_availability_type = " +
	    TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
	    "AND s.stock_type_id = st.stock_type_id " +
	    "AND s.is_obsolete = 'F' " +
	    "AND st.stock_type = 'clone_set') sq1 " +
	    "LEFT JOIN " +
	    "(SELECT d.stock_id, pe.last_name " +
	    "FROM Donor d, Community c, Person pe " +
	    "WHERE d.community_id = c.community_id " +
	    "AND c.is_obsolete = 'F' " +
	    "AND c.community_id = pe.community_id ) sq2 " +
	    "ON sq1.stock_id = sq2.stock_id " +
	    "ORDER BY sq2.last_name";

        return query;
    }
    

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on clone set
     * catalog page.  Associated data includes stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {
        stock.populateDonors( conn );
    }
    
}



