// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.catalog;


import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.abrc.catalog.category.CatalogCategory;
import org.tair.tfc.DBconnection;
import org.tair.utilities.SearchResultsCollection;


/**
 * Abstract superclass for Java-based catalog page classes; contains the main
 * driver and shared methods and the abstract generate() method to be 
 * implemented by the concrete subclasses.
 */
public abstract class PageGenerator {
  /** Log4j lagger for this class */
  private static final Logger logger = Logger.getLogger(PageGenerator.class);

  /**
   * Main function driver
   * 
   * @param args command line arguments
   * @throws Exception when there is a problem with page generation
   */
  public static void main(String[] args) throws Exception {
    if (args.length != 3) {
      System.out.println("USAGE: java PageGenerator <categories property file> <output directory> <category>");
      return;
    }

    File output = new File(args[1]);
    if (!output.exists()) {
      logger.error("Output directory does not exist: " + output);
      return;
    }

    List<CatalogCategory> cats = new ArrayList<CatalogCategory>();
    Map<String, CatalogCategory> all_cats =
      CatalogManager.getCatalogCategories(args[0]);
    if ("all".equals(args[2])) {
      cats.addAll(all_cats.values());
      logger.info("Generating all categories");
    } else if (all_cats.containsKey(args[2])) {
      cats.add(all_cats.get(args[2]));
      logger.info("Generating category " + args[2]);
    } else {
      logger.error("Unknown category " + args[2]);
    }

    logger.info("Generating HTML pages");
    makeHTML(cats, output);
    logger.info("Generation complete");
    
    // Kill all hanging threads so the JVM can exit; fixes JVM bug?
    System.exit(0);
  }

  /**
   * Make the HTML pages for a list of categories.
   * 
   * @param categories the list of categories
   * @param output the output directory
   * @throws Exception when there is a problem creating the HTML
   */
  public static void makeHTML(List<CatalogCategory> categories, File output)
      throws Exception {
    DBconnection conn = null;
    try {
      conn = new DBconnection();
      for (CatalogCategory cat : categories) {
        logger.info("Making HTML pages for category " + cat.getCategoryName());
        cat.generateCategoryPages(conn, output);
      }
    } finally {
      if (conn != null)
        conn.releaseResources();
    }
  }

  /**
   * Abstract method to be implemented by the concrete subclass; generate the
   * catalog page for the categories.
   * 
   * @param out the output directory
   * @param pageObj the search results collection to use to generate the pages
   */
  abstract public void generate(PrintWriter out, SearchResultsCollection pageObj);
}
