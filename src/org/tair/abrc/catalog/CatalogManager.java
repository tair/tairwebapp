// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.

package org.tair.abrc.catalog;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeMap;

import org.jboss.logging.Logger;
import org.tair.abrc.catalog.category.CatalogCategory;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidParameterException;


/**
 * CatalogManager is a driver class to manage population and retrieval of ABRC
 * stock catalog category data using XSLT transforms.
 */

public class CatalogManager {
  private static Logger logger = Logger.getLogger(CatalogManager.class);

  /**
   * Loads the list of stock category subclasses that define all stock
   * categories from a configuration file. You can use this list of class names
   * to instantiate classes for populating stock categories or for retrieving
   * data such as the JSP to use for displaying each category. The configuration
   * file is a simple list of class names; the method treats it as a properties
   * file and builds a set of keys from the names that key to null objects.
   * @param in the input stream from the configuration file
   * 
   * @return Stock category subclass names as a Set of Strings
   * @throws InvalidParameterException when there is a problem reading the
   *           configuration file
   */
  private static Set<Object> loadCategoryClasses(InputStream in)
      throws InvalidParameterException {
    Properties classNames = null;

    try {
      classNames = new Properties();
      classNames.load(in);
    } catch (Exception ioe) {
      // Convert the IO exception to an InvalidParameterException for the
      // servlet to handle.
      throw new InvalidParameterException(ioe.getMessage());
    }

    return classNames.keySet();
  }

  /**
   * Creates an instance of class represented by submitted categoryClassName.
   * categoryClassName must be a sub-class of CatalogCategory. This class can
   * then be used for various category specific operations such as populating
   * the data for that category
   * 
   * @param categoryClassName Catalog category class name to instantiate
   * @return Instance of submitted categoryClassName as CatalogCategory;
   *         concrete type class will actually be a sub class of CatalogCategory
   * @throws InvalidParameterException if any error occurs while instantiating
   *           class
   */
  private static CatalogCategory instantiateCategory(String categoryClassName)
      throws InvalidParameterException {

    CatalogCategory category = null;

    try {
      Class<?> c = Class.forName(categoryClassName);
      category = (CatalogCategory)c.newInstance();

      // propagate class instantiation exceptions as InvalidParameter
    } catch (ClassNotFoundException cnfe) {
      throw new InvalidParameterException(cnfe.getMessage());
    } catch (InstantiationException ise) {
      throw new InvalidParameterException(ise.getMessage());
    } catch (IllegalAccessException iae) {
      throw new InvalidParameterException(iae.getMessage());
    }

    return category;
  }

  /**
   * Retrieves a Map of all CatalogCategory sub-classes, containing the category
   * name as a String key referencing an instance of the CatalogCategory
   * sub-class that represents that category. This method will load all possible
   * class names from the categories.conf config file using the
   * loadCategoryClasses method, then will instantiate each class using the
   * instantiateCategory method. Returned classes can then be used to get
   * category specific properties such as the JSP to use for displaying category
   * data, or for populating data for the category.
   * @param fname the file name of the class configuration file
   * 
   * @return Map containing instances of all CatalogCategory sub classes defined
   *         in categories config file with catalog name as String key
   *         referencing CatalogCategory object
   * @throws InvalidParameterException if any errors encountered while reading
   *           data from file or while instantiating classes
   */
  public static Map<String, CatalogCategory> getCatalogCategories(String fname)
      throws InvalidParameterException {
    TreeMap<String, CatalogCategory> catalogCategories =
      new TreeMap<String, CatalogCategory>();
    try {
      CatalogCategory category = null;
      Set<Object> classNames = loadCategoryClasses(new FileInputStream(fname));
      Iterator<Object> iter = classNames.iterator();
      while (iter.hasNext()) {
        category = instantiateCategory((String)iter.next());
        catalogCategories.put(category.getCategoryName(), category);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    return catalogCategories;
  }

  /**
   * The main() method that drives the CatalogManager Java application
   * 
   * @param args command line arguments
   * @throws Exception when something goes awry
   */
  public static void main(String[] args) throws Exception {

    if (args.length != 2) {
      System.out.println("USAGE: java CatalogManager <output directory path> <category class name>00");
    } else {

      File output = new File(args[0]);
      if (!output.exists()) {
        logger.error("Output directory does not exist: " + output);
      } else {
        CatalogCategory cat;
        try {
          logger.info("Processing category " + args[1]);
          cat = instantiateCategory(args[1]);
          logger.debug("Generating category " + args[1]);
          generate(output, cat);
          logger.debug("Generated category " + args[1]);
        } catch (Exception e) {
          // Log and continue.
          logger.error(String.format("Error instantiating category '%s': %s",
                                     args[1],
                                     e.getMessage()), e);
        }
        System.exit(0); // end all threads now! Fixes hang bug.
      }
    }
  }

  /**
   * Generate the category XML pages, creating and releasing a connection.
   * 
   * @param output the output file
   * @param cat the category name
   */
  private static void generate(File output, CatalogCategory cat) {
    DBconnection conn = null;
    try {
      conn = new DBconnection();
      cat.generateCategoryXMLPages(conn, output);
    } catch (Exception e) {
      logger.error("Error generating category xml page for category " + cat, e);
    } finally {
      if (conn != null)
        conn.releaseResources();
    }
  }
}
