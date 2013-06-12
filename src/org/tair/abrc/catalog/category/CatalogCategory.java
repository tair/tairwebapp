// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.8 $
// $Date: 2006/02/16 00:22:25 $
// ------------------------------------------------------------------------------

package org.tair.abrc.catalog.category;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.jboss.logging.Logger;
import org.tair.abrc.catalog.CatalogStock;
import org.tair.abrc.catalog.PageGenerator;
import org.tair.tfc.DBconnection;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;


/**
 * CatalogCategory is a template superclass to handle the creation of static
 * HTML files for ABRC stock categories. CatalogCategory implements methods to
 * handle the common tasks of generating these files, while defining abstract
 * methods that must be implemented by concrete sub-classes. Each stock category
 * is represented by a concrete class that implements these methods to define
 * the category specific properties or actions needed. These category specific
 * actions include defining the SQL needed to specify the resultset of the
 * category, as well as defining the associated data (donors, clone info. etc.)
 * that is needed for each category.
 * 
 * <p>
 * This approach allows us to centralize all common population code here in the
 * superclass while leaving all category specific data in the concrete
 * subclasses. New categories can be easily added by sub-classing
 * CatalogCategory.
 */

public abstract class CatalogCategory {

  private static final Logger logger = Logger.getLogger(CatalogCategory.class);

  /**
   * Retrieves the literal String used to represent this category. Sub classes
   * must implement this method to return the correct value for identifying a
   * particular category
   * 
   * @return String representing category name
   */
  public abstract String getCategoryName();

  /**
   * Retrieves the SQL needed to get stock ids that make up a particular stock
   * category. Sub classes must implement this method to retrieve the result set
   * for each category. SQL must return stock ids as "stock_id", or an error
   * will occur. SQL should also return stocks in whatever sort order the
   * category requires. Processing of result set returned by executing SQL will
   * automatically allow for the possibility of multiple rows containing the
   * same stock id (which can happen depending on what value is being used to
   * sort result set).
   * 
   * @return SQL to retrieve stock ids for a stock category
   */
  public abstract String getCategorySQL();

  /**
   * Populates associated data for submitted stock specific to each category.
   * All data beyond basic stock data must be populated through this method.
   * This associated data consists of things like clone, vector and stock donor
   * data. Each sub-class must implement this method to retrieve the category
   * specific data needed for displaying the stock on the category display page
   * 
   * @param conn An active connection to the database
   * @param stock Stock to populate
   * @throws SQLException if a database error occurs
   */
  public abstract void populateAssociatedData(DBconnection conn,
                                              CatalogStock stock)
      throws SQLException;

  /**
   * Retrieves the number of stocks to show on each catalog page for a specific
   * category. This default implementation will show 200 stocks on each page;
   * this method can be overridden by sub classes if a different number of
   * stocks should be shown on each page of a category.
   * 
   * @return Number of stocks to show on each catalog page for a specific
   *         category
   */
  protected int getPageSize() {
    return 200;
  }

  /**
   * Creates display values for hyperlinks that allow user to scroll through
   * catalog pages. This default implementation returns display values simply as
   * the string version of the numeric page number. This method can be
   * overridden by sub classes to show different display values for each page
   * (the first and last elements on the page, for example)
   * 
   * @param stocks All stocks for category
   * @totalPages Total number of catalog pages needed to display stocks
   * @return Map containing each page number as an <code>Integer</code> key
   *         referencing a <code>String</code> value to use when displaying
   *         scrolling hyperlinks
   */
  protected Map getPageLabels(CatalogStock[] stocks, int totalPages) {
    HashMap<Integer, String> labels = new HashMap<Integer, String>();
    for (int i = 1; i <= totalPages; i++) {
      Integer pageNumber = new Integer(i);
      labels.put(pageNumber, String.valueOf(i));
    }
    return labels;
  }

  /**
   * Determines if stock category defines a custom Comparator for sorting items
   * within category by logic in addition to the ORDER BY clause in the SQL that
   * retrieved the category stock ids. This is done to allow sorting of
   * categories by methods that are difficult, or not possible with SQL ordering
   * alone.
   * 
   * @return <code>true</code> if stock category has custom sorting logic
   *         defined, or <code>false</code> if no custom sorting logic used for
   *         sorting category
   */
  private boolean hasCustomSort() {
    return (getCustomComparator() != null);
  }

  /**
   * Sorts stocks by retrieving the custom Comparator defined by stock category
   * sub class. This method assumes that sub class defines a Comparator. This
   * method does not return any value, since stocks array is physically
   * re-arranged in this method, references in external code should adjust
   * accordingly
   * 
   * @param stocks Stocks is category to sort using custom Comparator defined by
   *          sub class
   */
  private void sort(CatalogStock[] stocks) {

    // translate array into a list and back for easy sorting
    // with Comparator. A little wasteful, but should be no big deal
    ArrayList<CatalogStock> sortStocks = new ArrayList<CatalogStock>();
    for (int i = 0; i < stocks.length; i++) {
      sortStocks.add(stocks[i]);
    }

    Collections.sort(sortStocks, getCustomComparator());

    int counter = 0;
    for (CatalogStock stock : sortStocks) {
      stocks[counter++] = stock;
    }
  }

  /**
   * Retrieves the custom Comparator defined by a specific stock category. This
   * method should be overridden by any sub-class that defines a Comparator to
   * return an instance of the custom Comparator that contains the category
   * specific logic required for sorting a given category. The default
   * implementation here is to return <code>null</code>
   * 
   * @return Custom Comparator for sorting items in a specific stock category,
   *         or <code>null</code> if no Comparator defined for this category.
   */
  protected Comparator<CatalogStock> getCustomComparator() {
    return null;
  }

  /**
   * Get the page.
   * 
   * @param pageObj the search collection
   * @return the Document to transform to HTML
   * @throws Exception when there was a problem creating the document
   */
  public Document getPage(SearchResultsCollection pageObj) throws Exception {
    Element page, elem;
    Document doc =
      DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
    page = doc.createElement("CatalogPage");
    elem = doc.createElement("description");
    elem.setTextContent("The base class " + getClass().getName()
                        + " generated this blank catalog xml page.");
    page.appendChild(elem);
    doc.appendChild(page);
    return doc;
  }

  /**
   * Retrieves stocks for this category from the database and generates xml
   * pages for the stocks into the outputDir.
   * 
   * @param conn the JDBC connection wrapper
   * @param outputDir the output file
   * @throws Exception when there is a problem generating the pages
   */
  public void generateCategoryXMLPages(DBconnection conn, File outputDir)
      throws Exception {
    CatalogStock[] stocks =
      createStocks(conn, getStockIDs(conn, getCategorySQL()));
    int len = stocks.length;
    logger.info("Transforming " + len + " stocks for category " + getCategoryName());
    for (CatalogStock stock : stocks) {
      if (len < 100 || len % 100 == 0) {
        logger.debug(getCategoryName() + ": " + (len--)
                    + " stocks to be populated");
      } else {
        len--;
      }
      populateAssociatedData(conn, stock);
    }
    if (hasCustomSort()) {
      logger.info("Sorting stocks with comparator "
                  + getCustomComparator().getClass().getName());
      sort(stocks);
      logger.info("Sorted.");
    }
    int totalPages =
      ScrollCalculator.getTotalPages(getPageSize(), stocks.length);
    Map pageLabels = getPageLabels(stocks, totalPages);

    Transformer serializer = TransformerFactory.newInstance().newTransformer();
    serializer.setOutputProperty(OutputKeys.INDENT, "yes");
    serializer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount",
                                 "2");

    int page = 1;
    logger.info("Serializing and transforming a total of " + totalPages
                + " pages.");
    while (page <= totalPages) {
      File pageFile =
        new File(outputDir, getCategoryName() + "_" + page + ".xml");
      OutputStream out =
        new BufferedOutputStream(new FileOutputStream(pageFile));
      try {
        logger.info("Serializing and transforming page " + page);
        Document doc = getPage(createPageCollection(stocks, pageLabels, page));
        serializer.transform(new DOMSource(doc), new StreamResult(out));
      } catch (TransformerException e) {
        // Log and continue
        logger.error("Transformer exception getting catalog page " + 1, e);
      } finally {
        try {
          out.flush();
          out.close();
        } catch (Exception e) {
          // Log and rethrow.
          logger.error("Exception closing output stream for page " + page, e);
          throw e;
        }
      }
      page++;
    }
    logger.info("Page serialization complete");
  }

  /**
   * Retrieves stocks for this category from the database and generates html
   * pages for the stocks into the outputDir.
   */
  public final void generateCategoryPages(DBconnection conn, File outputDir)
      throws SQLException, IOException {
    logger.info("Creating HTML pages for category " + getCategoryName());
    CatalogStock[] stocks =
      createStocks(conn, getStockIDs(conn, getCategorySQL()));
    int len = stocks.length;
    logger.info("Category contains " + len + " stocks.");
    for (CatalogStock stock : stocks) {
      if (stocks.length < 100 || len % 100 == 0) {
        logger.debug(getCategoryName() + ": " + (len--)
                           + " stocks to be populated");
      } else {
        len--;
      }
      populateAssociatedData(conn, stock);
    }
    logger.debug("sorting");
    if (hasCustomSort())
      sort(stocks);
    int totalPages =
      ScrollCalculator.getTotalPages(getPageSize(), stocks.length);
    Map pageLabels = getPageLabels(stocks, totalPages);
    int page = 1;
    while (page <= totalPages) {
      writePage(new File(outputDir, getCategoryName() + "_" + page + ".html"),
                createPageCollection(stocks, pageLabels, page));
      page++;
    }
  }

  /**
   * Writes a single catalog page.
   */
  public void writePage(File f, SearchResultsCollection pageObj) {
    logger.debug("writing " + f);
    try {
      PageGenerator g =
        (PageGenerator)Class.forName(this.getClass().getSimpleName()
                                     + "Generator").newInstance();
      PrintWriter out = new PrintWriter(f);
      g.generate(out, pageObj);
      out.flush();
      out.close();
    } catch (Exception e) {
      e.printStackTrace(System.err);
    }
  }

  /**
   * Retrieves unique stock ids and returns as a List of Long objects in the
   * order they are sorted by query. This list can then be used to populate a
   * single stock category
   * 
   * @param conn An active connection to the database
   * @param query SELECT statement to retrieve and sort stock ids for submitted
   *          category
   * @return List of stock ids as <code>Long</code> objects
   * @throws SQLException if a database error occurs
   */
  private List<Long> getStockIDs(DBconnection conn, String query)
      throws SQLException {

    long lastID = 0;
    long currentID = 0;
    ResultSet results = null;
    Long stockID = null;
    List<Long> ids = new ArrayList<Long>();

    conn.setQuery(query);
    results = conn.getResultSet();
    while (results.next()) {
      currentID = results.getLong("stock_id");
      if (lastID != currentID) {
        // only add if id is not in list yet -- this is to
        // handle multiple rows for stock id in result set
        stockID = new Long(currentID);
        if (!ids.contains(stockID)) {
          ids.add(stockID);
        }
        lastID = currentID;
      }
    }
    conn.releaseResources();

    return ids;
  }

  /**
   * Utility method to create array of CatalogStock objects populated with only
   * basic stock info. A stock object is created for each stock id in list of
   * Long ids.
   * 
   * @param conn An active connection to the database
   * @param ids Stock ids as a list of <code>Long</code> objects
   * @return Array CatalogStock objects
   * @throws SQLException if a database error occurs
   */
  private CatalogStock[] createStocks(DBconnection conn, List<Long> ids)
      throws SQLException {

    ArrayList<CatalogStock> stockList = new ArrayList<CatalogStock>();

    for (Long id : ids) {
      stockList.add(new CatalogStock(conn, id));
    }

    // translate List into typed array
    return stockList.toArray(new CatalogStock[stockList.size()]);
  }

  /**
   * Creates a SearchResultsCollection that holds all information needed for
   * displaying one page of stock catalog.
   * 
   * Collection will contain subset of stocks to display on one page as an array
   * of CatalogStock objects, as well as floor & ceiling params which define
   * where subset of stocks falls in category. Collection also contains total
   * number of stocks in category and HTML links for scrolling through multiple
   * page categories.
   * 
   * @param stocks All stocks in category
   * @param pageLabels Display labels to use when creating scroll links
   * @param currentPage Page number results collection will represent
   * @return SearchResultsCollection containing all data needed for displaying a
   *         single page of stock catalog
   */
  private SearchResultsCollection createPageCollection(CatalogStock[] stocks,
                                                       Map pageLabels,
                                                       int currentPage) {
    SearchResultsCollection pageObj = new SearchResultsCollection();
    pageObj.setResultSize(stocks.length); // total # of stocks in category

    // get subset of stock objects to write to requested page; use
    // scrollparams to calculate start/end point of stock subset given
    // page size
    ScrollParams scrollParams =
      ScrollCalculator.getScrollParams(currentPage, getPageSize());

    CatalogStock[] pageStocks = getArraySlice(stocks, scrollParams);
    pageObj.setResults(pageStocks);

    // increment subset positions by one to move to "real" numbers
    // from array indexes for display
    pageObj.setFloor(scrollParams.getFloor() + 1);
    pageObj.setCeiling(scrollParams.getFloor() + pageStocks.length);

    // create scrolling links as links to static html pages, where each
    // page is named [category_name]_[page_number].html. All links need
    // to be prefaced by relative path to catalog HTML directory.
    String links =
      ScrollCalculator.createStaticNumericScrollLinks(currentPage,
                                                      getCategoryName() + "_",
                                                      "html",
                                                      pageLabels);

    pageObj.setScrollLinks(links);
    pageObj.setPageLinks(ScrollCalculator.createPageLinks(currentPage,
                                                          getCategoryName()
                                                              + "_",
                                                          "html",
                                                          pageLabels));

    return pageObj;
  }

  /**
   * Retrieves subset of stocks in category as defined by floor and ceiling
   * params in ScrollParams object. Method has protected access to allow
   * sub-classes to use it, but is declared final to avoid overriding.
   * 
   * @param stocks All stocks in a category
   * @param scrollParams ScrollParams object that defines subset of stocks to
   *          show on on catalog page
   * @return Subset of category as an array of CatalogStock objects
   */
  protected final CatalogStock[] getArraySlice(CatalogStock[] stocks,
                                               ScrollParams scrollParams) {
    // get params that define what page, and which subset of
    // stocks to write to current page
    int floor = scrollParams.getFloor();
    int ceiling = scrollParams.getCeiling();

    // extract stocks for current page into List, then
    // transform into type-specific array
    List<CatalogStock> fileStocks = new ArrayList<CatalogStock>();
    while (floor <= ceiling && floor < stocks.length) {
      fileStocks.add(stocks[floor++]);
    }

    CatalogStock[] stockArr = new CatalogStock[fileStocks.size()];
    stockArr = (CatalogStock[])fileStocks.toArray(stockArr);

    return stockArr;
  }
}
