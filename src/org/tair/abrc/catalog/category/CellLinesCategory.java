//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/04/07 23:01:16 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog.category;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
import org.tair.abrc.catalog.CatalogStock;
import org.tair.querytools.Donor;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * CellLinesCategory is a concrete sub-class of CatalogCategory
 * that defines methods and properties specific to the cell lines
 * stock category
 */

public class CellLinesCategory extends CatalogCategory {
  private static final Logger logger = Logger.getLogger(CellLinesCategory.class);

    /**
     * Implements abstract method defined in superclass to
     * return "cell_lines" as the name of this category
     *
     * @return Name of stock category
     */
    public String getCategoryName() {
        return "cell_lines";
    }
    

    /**
     * Implements abstract method defined in superclass to return
     * SQL query to retrieve stock ids that make up cell lines
     * stock category.  SQL query will retrieve all stock ids that 
     * have stock type individual_line.
     *
     * @return SQL to retrieve stock ids that make up category
     */
    public String getCategorySQL() {        

        String query =
	    " SELECT distinct(s.stock_id) " +
	    " FROM Stock s " +
	    " JOIN StockAvailabilityType sa ON s.stock_availability_type_id = sa.stock_availability_type_id " +
	    " JOIN StockType st ON s.stock_type_id = st.stock_type_id " +
	    " JOIN TairObject_Stock ts ON s.stock_id = ts.stock_id " +
	    " JOIN Germplasm g ON ts.tair_object_id = g.tair_object_id " +
	    " WHERE st.stock_type = 'individual_line' " +
	    " AND s.is_seed = 'F' " +
	    " AND ( sa.stock_availability_type = " + TextConverter.dbQuote( DataConstants.getAvailableStock() ) + " " +
	    "       OR " +
	    "       sa.stock_availability_type = " + TextConverter.dbQuote( DataConstants.getAvailableSoonStock() ) + " ) " +
	    " AND s.is_obsolete = 'F' " +
	    " AND g.is_obsolete = 'F' ";

        logger.debug(query);

        return query;
    }
    

    /**
     * Implements abstract method defined by superclass to populate submitted
     * stock with associated data needed for displaying stock on cell lines
     * catalog page.  Associated data includes stock donors.
     *
     * @param conn An active connection to the database
     * @param stock Stock to populate
     * @throws SQLException if a database error occurs
     */    
    public void populateAssociatedData( DBconnection conn, CatalogStock stock ) 
        throws SQLException {

	stock.populateGermplasm( conn );

        stock.populateDonors( conn );
    }


    /**
     * Retrieves the custom Comparator defined for this category.  Comparator
     * will sort items by germplasm name.
     *
     * @return Custom Comparator for sorting stocks
     */
    protected Comparator getCustomComparator() {
        return new Comparator() {

	        public int compare( Object o1, Object o2 ) {

		    CatalogStock stock_1 = (CatalogStock) o1;
		    CatalogStock stock_2 = (CatalogStock) o2;
		    
		    int result = StockCompareUtils.compareGermplasmNames(stock_1, stock_2);

		    return result;
		}

	};
    }


    /**
     * Generates the xml document for this category
     */
    public Document getPage(SearchResultsCollection pageObj) throws Exception {

	CatalogStock[] stocks = (CatalogStock[]) pageObj.getResults();
	String scrollLinks = pageObj.getScrollLinks();
	int resultSize = pageObj.getResultSize();
	int floor = pageObj.getFloor();
	int ceiling = pageObj.getCeiling();
	
	Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
	Element page, xstocks, xstock, xdonor, elem;
	page = doc.createElement("CellLinesCatalogPage");
	elem = doc.createElement("title");
	elem.setTextContent("Cell Lines");
	page.appendChild(elem);
	xstocks = doc.createElement("stocks");
	
	for(CatalogStock stock: stocks) {
	    elem = doc.createElement("description");
	    String description = "";
	    if (stock.getGermplasm() != null &&
		stock.getGermplasm().get_description() != null) {
		description = stock.getGermplasm().get_description(); 
	    }
	    elem.setTextContent(description);
	    xstock = doc.createElement("stock");
	    xstock.appendChild(elem);
	    xstocks.appendChild(xstock);
	    xstock.setAttribute("name", stock.get_name());
	    xstock.setAttribute("stockId", Long.toString(stock.get_stock_id()));
	    xstock.setAttribute("commercialPrice", stock.get_format_commercial_price( false ));
	    xstock.setAttribute("basePrice", stock.get_format_base_price( false ));
	    xstock.setAttribute("availability", stock.get_stock_availability_type());
	    elem = doc.createElement("donors");
	    xstock.appendChild(elem);
	    
	    Donor donor;
	    List distinct = new ArrayList(); // display unique donor stock numbers
	    for(Iterator<Donor> it = stock.getDonors(); it != null && it.hasNext();) {
		donor = it.next();
		xdonor = doc.createElement("donor");
		xdonor.setAttribute("communityType", donor.getCommunityType());
		xdonor.setAttribute("communityId", donor.getCommunityID().toString());
		xdonor.setAttribute("displayName", donor.getDisplayName());
		if (donor.getDonorStockNumber() != null && !distinct.contains(donor.getDonorStockNumber())) { 
		    xdonor.setAttribute("donorStockNumber", donor.getDonorStockNumber());
		    distinct.add(donor.getDonorStockNumber());
		}
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



