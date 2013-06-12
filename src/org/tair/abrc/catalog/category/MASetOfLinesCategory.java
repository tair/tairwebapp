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
import org.tair.utilities.SearchResultsCollection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;


/**
 * MASetOfLinesCategory is a concrete sub-class of CatalogCategory that defines
 * methods and properties specific to the mutant-accumulation set of lines stock
 * category
 */

public class MASetOfLinesCategory extends CatalogCategory {

  @Override
  public String getCategoryName() {
    return "ma_set_of_lines";
  }

  @Override
  public String getCategorySQL() {

    String query =
      "SELECT s.stock_id "
          + "FROM Stock s JOIN  "
          + "TairObject_Stock ts ON s.stock_id = ts.stock_id JOIN "
          + "Germplasm g ON ts.tair_object_id = g.tair_object_id JOIN "
          + "Taxon t ON g.taxon_id = t.taxon_id JOIN "
          + "Donor d ON s.stock_id = d.stock_id "
          + "WHERE s.is_obsolete = 'F' AND  " + "s.is_seed = 'T' AND  "
          + "d.stock_id = s.stock_id AND  "
          + "d.community_id = 1501433962 AND  " + "g.is_obsolete = 'F' AND  "
          + "g.germplasm_type LIKE 'set%' AND  " + "t.taxon_id = 1 ";

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
    page = doc.createElement("MASetOfLinesCatalogPage");
    Element title = doc.createElement("title");
    title.setTextContent("Sets of Mutation Accumulation Lines");
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
      xstock.setAttribute("availability",
                          stock.get_stock_availability_comment());
      String availabilityType = stock.get_stock_availability_type();
      xstock.setAttribute("availabilityType", availabilityType);

      Germplasm germplasm = stock.getGermplasm();
      xgerm = doc.createElement("germplasm");
      xgerm.setAttribute("tair_object_id",
                         Long.toString(germplasm.get_tair_object_id()));
      xgerm.setAttribute("description", germplasm.get_description());
      xstock.appendChild(xgerm);

      xdonors = doc.createElement("donors");
      xstock.appendChild(xdonors);
      Donor donor;
      for (Iterator<Donor> it = stock.getDonors(); it.hasNext();) {
        donor = it.next();
        xdonor = doc.createElement("donor");
        xdonor.setAttribute("communityType", donor.getCommunityType());
        xdonor.setAttribute("communityId",
                            donor.getCommunityID().toString());
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
