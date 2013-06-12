//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/04/07 23:01:17 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.*;
import java.util.*;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.*;
import org.tair.utilities.*;
import org.tair.querytools.Donor;

import org.w3c.dom.*;
import javax.xml.parsers.*;

/**
 * PooledGenomicCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the pooled genomic DNA
 * dna stock category
 */

public class PooledGenomicCategory extends CatalogCategory {

    /**
     * Implements abstract method defined in superclass to
     * return "pooled_genomic" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "pooled_genomic";
    }


    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up pooled genomic DNA
     * stock category.  SQL query will retrieve all stock ids that have
     * stock type of "genomic_dna_pooled", and that are fixed price
     * stocks (have fixed_price = 'T'). Stocks are sorted alphabetically 
     * by stock number
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        
        String query =
            "SELECT s.stock_id, s.name " +
            "FROM Stock s, " +
            "StockAvailabilityType sa, " +
            "StockType st " +
            "WHERE s.stock_availability_type_id = " +
	    "sa.stock_availability_type_id " +
            "AND sa.stock_availability_type = " + 
            TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
            "AND s.stock_type_id = st.stock_type_id " +
            "AND st.stock_type = 'genomic_DNA_pooled' " +
            "AND s.fixed_price = 'T' " +
            "AND s.is_obsolete = 'F' " +
            "ORDER BY s.name "; 
        
        return query;
    }

     
    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on pooled genomic
     * DNA catalog page.  Associated data for pooled genomic DNA includes stock
     * donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    

    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
	throws SQLException {

        stock.populateDonors( conn );
    }

	public Document getPage(SearchResultsCollection pageObj) throws Exception
	{
		CatalogStock[] stocks = (CatalogStock[]) pageObj.getResults();
		String scrollLinks = pageObj.getScrollLinks();
		int resultSize = pageObj.getResultSize();
		int floor = pageObj.getFloor();
		int ceiling = pageObj.getCeiling();

		Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
		Element page, xstocks, xstock, xdonor, elem;
		page = doc.createElement("PooledGenomicCatalogPage");
		elem = doc.createElement("title");
		elem.setTextContent("Pooled Genomic DNA");
		page.appendChild(elem);
		xstocks = doc.createElement("stocks");

		for(CatalogStock stock: stocks)
		{
			elem = doc.createElement("description");
			elem.setTextContent(stock.get_description());
			xstock = doc.createElement("stock");
			xstock.appendChild(elem);
			xstocks.appendChild(xstock);
			xstock.setAttribute("name", stock.get_name());
			xstock.setAttribute("stockId", Long.toString(stock.get_stock_id()));
			xstock.setAttribute("commercialPrice", stock.get_format_commercial_price( false ));
			xstock.setAttribute("basePrice", stock.get_format_base_price( false ));
			elem = doc.createElement("donors");
			xstock.appendChild(elem);

			Donor donor;
			for(Iterator<Donor> it = stock.getDonors(); it.hasNext();)
			{
				donor = it.next();
				xdonor = doc.createElement("donor");
				xdonor.setAttribute("communityType", donor.getCommunityType());
				xdonor.setAttribute("communityId", donor.getCommunityID().toString());
				xdonor.setAttribute("displayName", donor.getDisplayName());
				elem.appendChild(xdonor);
			}
		}

		page.setAttribute("resultSize", Integer.toString(resultSize));
		page.setAttribute("ceiling", Integer.toString(ceiling));
		page.setAttribute("floor", Integer.toString(floor));
		page.appendChild(xstocks);
		doc.appendChild(page);
		return doc;
	}
}
