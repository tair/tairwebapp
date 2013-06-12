// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.3 $
// $Date: 2005/09/14 16:21:09 $
// ------------------------------------------------------------------------------

package org.tair.abrc.catalog.category;


import java.sql.SQLException;
import java.util.Comparator;
import java.util.Iterator;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.querytools.Donor;
import org.tair.querytools.Germplasm;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;
import org.w3c.dom.Document;
import org.w3c.dom.Element;


/**
 * SetOfLinesCategory is a concrete sub-class of CatalogCategory that defines
 * methods and properties specific to the set of lines stock category
 */

public class SetOfLinesCategory extends CatalogCategory {

  @Override
  public String getCategoryName() {
    return "set_of_lines";
  }

  @Override
  public String getCategorySQL() {

    String query =
      "SELECT distinct(s.stock_id) " + "FROM Stock s, "
          + "StockAvailabilityType sa, " + "TairObject_Stock ts, "
          + "Germplasm g, " + "Taxon t, " + "Donor d "
          + "WHERE s.stock_availability_type_id = "
          + "sa.stock_availability_type_id "
          + "AND sa.stock_availability_type = "
          + TextConverter.dbQuote(DataConstants.getAvailableStock()) + " "
          + "AND s.stock_id = ts.stock_id " + "AND s.is_obsolete = 'F' "
          + "AND s.is_seed = 'T' " + "AND d.stock_id = s.stock_id "
          + "AND d.community_id = 1501426537 "
          + "AND ts.tair_object_id = g.tair_object_id "
          + "AND g.is_obsolete = 'F' " + "AND g.germplasm_type = 'set_of_lines' "
          + "AND g.taxon_id = t.taxon_id "
          + "AND t.scientific_name = 'Arabidopsis thaliana' ";

    return query;
  }

  @Override
  public void populateAssociatedData(DBconnection conn, CatalogStock stock)
      throws SQLException {

    stock.populateGermplasm(conn);

    // clone & vector data associated to germplasm (not stock)
    stock.populateGermplasmClone(conn);

    // get species variant through pedigree table if necessary
    stock.populatePedigreeSpeciesVariants(conn);

    stock.populateDonors(conn);
  }

  @SuppressWarnings("unchecked")
  @Override
  public Document getPage(SearchResultsCollection pageObj)
      throws ParserConfigurationException {
    CatalogStock[] stocks = (CatalogStock[])pageObj.getResults();
    int resultSize = pageObj.getResultSize();
    int floor = pageObj.getFloor();
    int ceiling = pageObj.getCeiling();

    Document doc =
      DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
    Element page, xstocks, xstock, xgerm, xdonors, xdonor;
    page = doc.createElement("SetOfLinesCatalogPage");
    Element title = doc.createElement("title");
    title.setTextContent("Sets of Confirmed T-DNA Insertion Lines");
    page.appendChild(title);
    xstocks = doc.createElement("stocks");

    for (CatalogStock stock : stocks) {
      xstock = doc.createElement("stock");
      xstocks.appendChild(xstock);
      
      xstock.setAttribute("name", stock.get_name());
      xstock.setAttribute("stockId", Long.toString(stock.get_stock_id()));
      xstock.setAttribute("commercialPrice",
                          stock.get_format_commercial_price(false));
      xstock.setAttribute("basePrice", stock.get_format_base_price(false));

      Germplasm germplasm = stock.getGermplasm();
      xgerm = doc.createElement("germplasm");
      xgerm.setAttribute("tair_object_id", Long.toString(germplasm.get_tair_object_id()));
      xgerm.setAttribute("description", germplasm.get_description());
      xstock.appendChild(xgerm);

      xdonors = doc.createElement("donors");
      xstock.appendChild(xdonors);
      Donor donor;
      for(Iterator<Donor> it = stock.getDonors(); it.hasNext();)
      {
          donor = it.next();
          xdonor = doc.createElement("donor");
          xdonor.setAttribute("communityType", donor.getCommunityType());
          xdonor.setAttribute("communityId", donor.getCommunityID().toString());
          xdonor.setAttribute("displayName", donor.getDisplayName());
          xdonor.setAttribute("donorStockNumber", donor.getDonorStockNumber());
          xdonors.appendChild(xdonor);
      }
    }

    page.setAttribute("resultSize", Integer.toString(resultSize));
    page.setAttribute("ceiling", Integer.toString(ceiling));
    page.setAttribute("floor", Integer.toString(floor));
    page.appendChild(xstocks);
    doc.appendChild(page);
    return doc;
  }

  @Override
  protected Comparator<CatalogStock> getCustomComparator() {
    return new Comparator<CatalogStock>() {

      public int compare(CatalogStock stock_1, CatalogStock stock_2) {
        return StockCompareUtils.compareStockNames(stock_1, stock_2);
      }

    };
  }
}
