// Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.

package org.tair.abrc.catalog.category;


import java.sql.SQLException;
import java.util.Comparator;

import javax.xml.parsers.DocumentBuilderFactory;

import org.tair.abrc.catalog.CatalogStock;
import org.tair.tfc.DBconnection;
import org.tair.utilities.SearchResultsCollection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;


/**
 * EducationKitCategory is a concrete subclass of CatalogCategory that defines
 * methods and properties specific to the education kits.
 */

public class EducationKitCategory extends CatalogCategory {

  /**
   * Implements abstract method defined in superclass to return "education_kit"
   * as the name of this category
   * 
   * @return Name of stock category
   */
  @Override
  public String getCategoryName() {
    return "education_kits";
  }

  /**
   * Implements abstract method defined in superclass to return SQL query to
   * retrieve stock ids that make up the stock category. SQL query will retrieve
   * all stock ids that are associated to germplasms of type "education_kit"
   * that is available as a stock and is not obsolete.
   * 
   * @return SQL to retrieve stock ids that make up category
   */
  @Override
  public String getCategorySQL() {

    String query =
      "SELECT s.stock_id " + "FROM Stock s JOIN "
          + "TairObject_Stock ts ON s.stock_id = ts.stock_id JOIN "
          + "Germplasm g ON ts.tair_object_id = g.tair_object_id "
          + "WHERE s.stock_availability_type_id = 1"
          + "AND s.stock_type_id = 1000200007 " + "AND s.is_obsolete = 'F'";

    return query;
  }

  @Override
  public Document getPage(SearchResultsCollection pageObj) throws Exception {
    CatalogStock[] stocks = (CatalogStock[])pageObj.getResults();
    int resultSize = pageObj.getResultSize();
    int floor = pageObj.getFloor();
    int ceiling = pageObj.getCeiling();

    Document doc =
      DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
    Element page, xstocks, xstock, elem;
    
    page = doc.createElement("EducationKitCatalogPage");
    elem = doc.createElement("title");
    elem.setTextContent("Education Kits");
    page.appendChild(elem);
    xstocks = doc.createElement("stocks");

    for (CatalogStock stock : stocks) {
      elem = doc.createElement("description");
      elem.setTextContent(stock.get_description());
      xstock = doc.createElement("stock");
      xstock.appendChild(elem);
      xstocks.appendChild(xstock);
      xstock.setAttribute("name", stock.get_name());
      xstock.setAttribute("stockId", Long.toString(stock.get_stock_id()));
      xstock.setAttribute("basePrice", stock.get_format_base_price(false));
    }

    page.setAttribute("resultSize", Integer.toString(resultSize));
    page.setAttribute("ceiling", Integer.toString(ceiling));
    page.setAttribute("floor", Integer.toString(floor));
    page.appendChild(xstocks);
    doc.appendChild(page);
    return doc;
  }

  /**
   * Implements abstract method defined by superclass to populate submitted
   * stock with associated data needed for displaying stock on catalog page.
   * There is currently no associated data.
   * 
   * @param conn An active connection to the database
   * @param stock Stock to populate
   * @throws SQLException if a database error occurs
   */
  @Override
  public void populateAssociatedData(DBconnection conn, CatalogStock stock)
      throws SQLException {

    // stock.populateGermplasm( conn );

    // clone & vector data associated to germplasm (not stock)
    // stock.populateGermplasmClone( conn );

    // get species variant through pedigree table if necessary
    // stock.populatePedigreeSpeciesVariants( conn );

  }

  /**
   * Retrieves the custom Comparator defined for this category. Comparator will
   * sort items by stock name.
   * 
   * @return Custom Comparator for sorting individual transposon stocks
   */
  protected Comparator<CatalogStock> getCustomComparator() {
    return new Comparator<CatalogStock>() {

      public int compare(CatalogStock stock_1, CatalogStock stock_2) {
        return StockCompareUtils.compareStockNames(stock_1, stock_2);
      }
    };
  }
}
