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
 * HostStrainCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the host strain
 * dna stock category
 */

public class HostStrainCategory extends CatalogCategory {
  private static final Logger logger = Logger.getLogger(HostStrainCategory.class);

    /**
     * Implements abstract method defined in superclass to
     * return "host_strain" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "host_strain";
    }
    

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up host strain
     * stock category.  SQL query will retrieve all stock ids that 
     * have stock type host strain and are available. Stocks are 
     * sorted by host strain name.
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        

        String query =
	    
	    "SELECT s.stock_id, s.name, hs.name " +   
            "FROM Stock s, " +                  
            "StockAvailabilityType sa, " +      
            "StockType st, " +
	    "TairObject_Stock ts, " +
	    "HostStrain hs " +
	    "WHERE s.stock_availability_type_id = " +  
	    "sa.stock_availability_type_id " +                               
            "AND sa.stock_availability_type = " +       
	    TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +       
            "AND s.stock_type_id = st.stock_type_id " +     
            "AND st.stock_type = 'host_strain' " +
	    "AND s.stock_id = ts.stock_id " +
	    "AND ts.tair_object_id = hs.tair_object_id " +
	    "AND s.is_obsolete = 'F' " +
	    "AND hs.is_obsolete = 'F' " +
	    "ORDER BY hs.name, s.name"; 
	 
        return query;
    }
    

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on host strain
     * catalog page.  Associated data includes stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {

	stock.populateHostStrain( conn );
      	stock.populateHostStrainTaxon( conn ); 
        stock.populateDonors( conn );



    }
    
}



