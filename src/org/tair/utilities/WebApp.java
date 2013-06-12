/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.poesys.db.Message;


/**
 * WebApp is the central repository for web application properties. All access
 * to such properties should go through this class. The class generates certain
 * properties dynamically and others through reading the webapp.properties file
 * in the conf directory under the web root. You can also set properties
 * dynamically in an internal map for testing purposes so that you can test
 * objects that access properties without having to change the properties file.
 * This testing feature works only with the getProperty method. The class
 * implements the ServletContextListener and you register it in web.xml so that
 * a servlet call automatically sets the context. If you use this class with
 * JUnit tests, it doesn't read the webapp.properties file, so make sure the
 * properties are in the static map of default values.
 */

public class WebApp implements ServletContextListener {
  /** The current servlet context used by the ServletContextListener impl */
  private static ServletContext context;
  /** The internal properties object */
  private static Properties values;
  /** The web root path */
  private static String webRoot = "";
  /** The application root path */
  private static String appRoot = "";
  /** The static web doc path */
  private static String wwwRoot = "/var/www/tair/htdocs";
  /** The map of values to use for testing */
  private static final Map<String, String> testMap =
    new ConcurrentHashMap<String, String>();

  private static final String NO_SERVLET_CONTEXT =
    "No ServletContext for logging, log to stdout instead: ";

  /**
   * The static init block that initializes the values Property object from the
   * webapp.properties file or from the static default values map
   */
  static {
    /** The static map of default values; use these with JUnit tests */
    final Map<String, String> m = new HashMap<String, String>() {
      /**
       * Generated serial version UID for serialized object
       */
      private static final long serialVersionUID = -4551256282563242701L;

      {
        put("PAYMENT_PAGE_URL", "");
        put("DYN_IMAGE_DIR", "/i/d/");
        put("SV_DATA_DIR", "/data/seqviewer/");
        put("MAP_DATA_DIR", "/data/map/");
        put("FILE_UPLOADS_DIR", "/tmp/file_uploads/");
        put("CATALOG_DATA_DIR", "/data/catalog/");
        put("CATALOG_REL_PATH", "/abrc/catalog/");
        put("IMAGE_REL_PATH", "/images/");
        put("PENDING_ORDERS_FILE", "/tmp/orders");
        put("DETAIL_CONF_FILE", "org.tair.conf.Detail");
        put("SEARCH_CONF_FILE", "org.tair.conf.Search");
        put("PROCESSOR_CONF_FILE", "org.tair.conf.Processor");
        put("CYBERSOURCE_CONF_FILE", "org.tair.conf.cybersource");
        put("GENERAL_SEARCH_CONF_FILE", "org.tair.conf.General");
        put("SERVER_NAME", "");
        put("FASTA_META_CONF_FILE", "org/tair/conf/fastaMetaData");
        put("SEND_MAIL", "none");
        put("MAIL_HOST", "localhost");
        put("FROM_ADDRESS", "curator@arabidopsis.org");
        put("DRIVER_NAME", "oracle.jdbc.driver.OracleDriver");
        put("CONNECTION_NAME", "readonly");
        put("CONNECTION_PASSWORD", "readonly");
        put("MAX_CONNECTIONS", "50");
      }
    };
    /** The default properties object initialized with the static map */
    Properties defaultProps = new Properties() {
      /**
       * Generated serial version UID for serialized object
       */
      private static final long serialVersionUID = -4371264167340490467L;

      {
        putAll(m);
      }
    };

    try {
      values =
        PropertiesLoader.loadProperties("org.tair.conf.webapp.properties",
                                        defaultProps);
      // Set the special app and web root properties.
      appRoot = values.getProperty("APP_ROOT");
      webRoot = appRoot + "/WebRoot";
      wwwRoot = values.getProperty("WWW_ROOT");
    } catch (Exception e) {
      log("Error loading system properties file", e);
    }

    List<String> names = new ArrayList<String>(1);
    names.add("com.poesys.db.PoesysDbBundle");
    names.add("com.poesys.bs.PoesysBsBundle");
    // Initialize Poesys/DB messages
    Message.initializePropertiesFiles(names);
  }

  /*
   * (non-Javadoc)
   * 
   * @seejavax.servlet.ServletContextListener#contextDestroyed(javax.servlet.
   * ServletContextEvent)
   */
  public void contextDestroyed(ServletContextEvent sce) {
  }

  /*
   * (non-Javadoc)
   * 
   * @seejavax.servlet.ServletContextListener#contextInitialized(javax.servlet.
   * ServletContextEvent)
   */
  public void contextInitialized(ServletContextEvent sce) {
    context = sce.getServletContext();
    webRoot = context.getRealPath("/");
  }

  /**
   * Set the application root (the full server path to the web application).
   * 
   * @param root the root path
   */
  public static void setAppRoot(String root) {
    appRoot = root;
  }

  /**
   * Get the application root.
   * 
   * @return the application root
   */
  public static String getAppRoot() {
    return appRoot;
  }

  /**
   * Get the web root (the absolute path to the web root directory).
   * 
   * @return the web root path
   */
  public static String getWebRoot() {
    return webRoot;
  }

  /**
   * Get the www root (the absolute path to the static web files directory,
   * usually /var/www/tair/htdocs).
   * 
   * @return the www root
   */
  public static String getWwwRoot() {
    return wwwRoot;
  }

  /**
   * Get the set of detail configuration properties.
   * 
   * @return a properties object
   */
  public static Properties getDetailProperties() {
    return PropertiesLoader.loadProperties(values.getProperty("DETAIL_CONF_FILE"));
  }

  /**
   * Get the set of search configuration properties.
   * 
   * @return a properties object
   */
  public static Properties getSearchProperties() {
    return PropertiesLoader.loadProperties(values.getProperty("SEARCH_CONF_FILE"));
  }

  /**
   * Get the set of processor configuration properties. These are properties
   * related to the generic servlet processor for TAIR.
   * 
   * @return a properties object
   */
  public static Properties getProcessorProperties() {
    return PropertiesLoader.loadProperties(values.getProperty("PROCESSOR_CONF_FILE"));
  }

  /**
   * Get the set of CyberSource credit card processing configuration properties.
   * 
   * @return a properties object
   */
  public static Properties getCyberSourceProperties() {
    return PropertiesLoader.loadProperties(values.getProperty("CYBERSOURCE_CONF_FILE"));
  }

  /**
   * Get the set of general search configuration properties.
   * 
   * @return a properties object
   */
  public static Properties getGeneralSearchProperties() {
    return PropertiesLoader.loadProperties(values.getProperty("GENERAL_SEARCH_CONF_FILE"));
  }

  /**
   * Get the path to the directory containing SeqViewer data.
   * 
   * @return a path
   */
  public static String getSeqViewerDataDir() {
    return values.getProperty("SV_DATA_DIR");
  }

  /**
   * Get the path to the directory containing MapViewer data.
   * 
   * @return a path
   */
  public static String getMapDataDir() {
    return values.getProperty("MAP_DATA_DIR");
  }

  /**
   * Get a non-secure HTTP URL to the current server.
   * 
   * @return a URL
   */
  public static String getServerURL() {
    return "http://" + getServerName();
  }

  /**
   * Get an SSL HTTPS URL to the current server.
   * 
   * @return
   */
  public static String getSecureServerURL() {
    return "https://" + getServerName();
  }

  /**
   * Get the name of the current server from the webapp properties file.
   * 
   * @return a server name
   */
  public static String getServerName() {
    return values.getProperty("SERVER_NAME");
  }

  /**
   * Get the path to the directory containing Catalog data.
   * 
   * @return a path
   */
  public static String getCatalogDataDir() {
    return appRoot + values.getProperty("CATALOG_DATA_DIR");
  }

  /**
   * Get the path to the directory containing the Catalog HTML files.
   * 
   * @return a path
   */
  public static String getCatalogHTMLDir() {
    return values.getProperty("CATALOG_REL_PATH");
  }

  /**
   * Get the absolute path to the directory that contains dynamically generated
   * images. Use this method to get the path for writing files. Use the
   * getDynImageDir method to get the relative path for URLs.
   * 
   * @see #getDynImageDir()
   * 
   * @return the absolute path to the dynamic image directory
   */
  public static String getAbsDynImageDir() {
    return wwwRoot + getDynImageDir();
  }

  /**
   * Get the relative path to the directory that contains dynamically generated
   * images. Call this method when you want to construct a URL that gets an
   * image in the dynamic image directory; use getAbsDynImageDir to get the
   * absolute path to the image directory for writing.
   * 
   * @see #getAbsDynImageDir()
   * 
   * @return a path
   */
  public static String getDynImageDir() {
    return values.getProperty("DYN_IMAGE_DIR");
  }

  /**
   * Get the path to the directory that contains static images.
   * 
   * @return a path
   */
  public static String getImageDir() {
    return values.getProperty("IMAGE_REL_PATH");
  }

  /**
   * Get the URL for the CyberSource payment page.
   * 
   * @return a URL
   */
  public static String getPaymentPageURL() {
    return values.getProperty("PAYMENT_PAGE_URL");
  }

  /**
   * Log a message to the servlet context or dump to stdout if there is no
   * servlet context.
   * 
   * @param msg the message to log
   */
  public static void log(String msg) {
    if (context != null)
      context.log(msg);
    else
      System.out.println(NO_SERVLET_CONTEXT + msg);
  }

  /**
   * Log a message to the servlet context or dump to stdout if there is no
   * servlet context.
   * 
   * @param msg the message to log
   * @param cause the exception being logged
   */
  public static void log(String msg, Throwable cause) {
    if (context != null)
      context.log(msg, cause);
    else
      System.out.println(NO_SERVLET_CONTEXT + msg);
  }

  /**
   * Get a specified property by name. Use this method for properties other than
   * the ones that have specific methods. If you set a test value with the
   * setTestProperty method, this method returns the value you set rather than
   * the value currently in the properties file.
   * 
   * @param key the property key string (case sensitive)
   * @param def the default value to supply if the property isn't in the
   *          webapp.properties file
   * @return a property value
   */
  public static String getProperty(String key, String def) {
    String value = testMap.get(key);
    if (value != null) {
      return value;
    } else {
      return values.getProperty(key, def);
    }
  }

  /**
   * Get a specified property by name. If the property doesn't exist, the method
   * returns null.
   * 
   * @param key the property key string (case sensitive)
   * @return a property value or null if the property doesn't exist
   */
  public static String getProperty(String key) {
    String value = testMap.get(key);
    if (value != null) {
      return value;
    } else {
      return values.getProperty(key);
    }
  }

  /**
   * Set a specific property in the internal test property map.
   * 
   * @param key the property key string
   * @param value the property value
   */
  public static void setTestProperty(String key, String value) {
    testMap.put(key, value);
  }

  /**
   * Clear a specific property you've previously set in the internal test
   * property map.
   * 
   * @param key the property key string (case sensitive)
   */
  public static void clearTestProperty(String key) {
    testMap.remove(key);
  }

  /**
   * Clear all the properties you've previously set in the internal test
   * property map.
   */
  public static void clearTestPropertyMap() {
    testMap.clear();
  }
}
