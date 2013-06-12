// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/03/02 21:42:47 $
// ------------------------------------------------------------------------------

package org.tair.utilities;


import java.io.*;
import java.util.*;

import org.jboss.logging.Logger;


/**
 * <p>
 * Centralizes literal values needed by various classes in the TAIR application.
 * TAIR stores object type info internally as a collection of classes that each
 * contain data for a specific object type. The class creates these info objects
 * and populates them with the values found in the appropriate properties file.
 * The WebApp file stores the classpath and name of each properties file.
 * The properties files are resource bundle files in the web application and
 * include:
 * </p>
 * <p>
 * <li> search </li>
 * <li> detail </li>
 * <li> general search </li>
 * <li> processor servlet handler </li>
 * </p>
 * <p>
 * <h1>Search properties file</h1>
 * 
 * <p>
 * This file contains information that SearchServlet and MasterTableInfo use to
 * create type specific SearchHandler objects, to create type specific
 * TempTableInfo objects, and to determine JSP URLs for search forms.
 * WebApp stores the classpath to the search file in the property
 * SEARCH_CONF_FILE. The search file contains a list of search types as keys
 * referencing the type specific data as a tab delimited String:
 * </p>
 * <p>
 * <ul>
 * <li>search handler class</li>
 * <li>search form page</li>
 * <li>table info class</li>
 * </ul>
 * </p>
 * <p>
 * Example search properties file entry:
 * </p>
 * <code>
 * gene = org.tair.search.GeneSearchHandler [tab] /jsp/search/gene_form.jsp [tab] org.tair.search.table.GeneTableInfo
 * </code>
 * <h1>Detail properties file</h1>
 * 
 * <p>
 * This file contains information that TairServlet and AccessionManager use to
 * create type specific Detail objects, to create TAIR accession numbers, and to
 * determine JSP URLs for displaying Detail information. WebApp stores
 * the classpath to the search file in the property DETAIL_CONF_FILE. The search
 * file contains a list of search types as keys referencing the type specific
 * data as a tab delimited String:
 * </p>
 * <p>
 * <ul>
 * <li>detail class</li>
 * <li>detail page</li>
 * <li>accession prefix</li>
 * </ul>
 * </p>
 * <p>
 * Example detail properties file entry:
 * </p>
 * <code>
 * gene = org.tair.querytools.GeneDetail [tab] /jsp/tairjsp/gene_detail.jsp [tab] Gene
 * </code>
 * <h1>General search properties file</h1>
 * <p>
 * This file contains information that GeneralSearchHandler uses to create type
 * specific GeneralSearcher objects that retrieve results counts and result sets
 * through the general search functions. WebApp stores the classpath to
 * the search file in the property GENERAL_SEARCH_CONF_FILE. The search file
 * contains a list of object types as keys referencing the GeneralSearcher class
 * name to use for doing general searches of that type.
 * </p>
 * <p>
 * Example general search properties file entry:
 * </p>
 * <code>
 * gene = org.tair.search.GeneSearcher
 * </code>
 * <h1>Processor servlet handler properties file</h1>
 * <p>
 * This file contains information that ProcessorServlet uses to create
 * type-specific RequestHandler objects that handle different classes of
 * requests such as definitions, notepad, and so on. You should use
 * ProcessorServlet to deploy all new functionality that doesn't clearly belong
 * in another existing servlet. WebApp stores the classpath to the search
 * file in the property PROCESSOR_CONF_FILE. This file contains a list of object
 * types as keys referencing the RequestHandler class name to use for handling
 * requests of that type.
 * </p>
 * <p>
 * Example processor config file entry:
 * </p>
 * <code>
 * definitions = org.tair.processor.definitions.DefinitionsHandler
 * </code>
 * <p>
 * <h1>General Remarks</h1>
 * <p>
 * You must explicitly tell ObjectInfoCollection when to load the files by
 * calling a specific loadFile() method such as loadSearchFile() or
 * loadDetailFile(). When you call a load method, ObjectInfoCollection loads the
 * properties file using standard Java properties loading.
 * </p>
 * <p>
 * ObjectTypeInfo and its inheritors store Search and Detail information. You
 * can find a full description of what each of the properties for each type in
 * ObjectTypeInfo. Not all object types will have all values for all properties
 * possible. If an object type does not have a property, the literal value
 * "NULL" should be entered in the properties file to ensure a null value in the
 * relevant ObjectTypeInfo class.
 * </p>
 * <p>
 * Different classes in the TAIR application use this data to create objects and
 * display data in a type-specific manner based on some kind of type parameter.
 * For example, SearchServlet creates RequestHandler objects to service
 * different types of search requests using the HandlerFactory. In its init()
 * method, SearchServlet populates HandlerFactory with the literal class names
 * of RequestHandler classes that handle each type of request. SearchServlet can
 * retrieve its list of class names and object types by calling the
 * getSearchHandlers() method in ObjectInfoCollection. ObjectInfoCollection
 * returns a map of search types and search handler class names based on the
 * info found in the object type config file.
 * </p>
 * <p>
 * When you request specific object data, ObjectInfoCollection returns a map
 * that contains the object type as a key referencing the literal value
 * requested. For each object data request, ObjectInfoCollection returns values
 * for all object types that have a non-null value for the requested data type.
 * </p>
 * <p>
 * The classes that use ObjectInfoCollection to get object type data are:
 * 
 * <ul>
 * <li>Search Servlet - retrieves search types and RequestHandler class names,
 * as well as JSP URLs to use for initial search forms</li>
 * 
 * <li>DetailFactory - retrieves detail object class names and detail page JSP
 * URLs for use in displaying object detail info. TairServlet then uses
 * DetailFactory to generically create Detail objects & redirect requests to
 * detail JSPs for display</li>
 * 
 * <li>AccessionManager - retrieves accession prefixes to use when creating
 * TAIR accession numbers for various object types</li>
 * 
 * <li>MasterTableInfo - retrieves TempTableInfo class names to use for
 * defining temp tables used to cache user search results for various object
 * types</li>
 * 
 * <li>GeneralSearchHandler - retrieves search types and GeneralSearch class
 * names for use in executing general searches.</li>
 * 
 * <li>ProcessorServlet - retrieves action types and RequestHandler class names</li>
 * 
 * </ul>
 * 
 * @see ObjectTypeInfo
 * @see SearchServlet
 * @see DetailFactory
 * @see AccessionManager
 * @see MasterTableInfo
 * @see HandlerFactory
 * @see TairServlet
 * @see ProcessorServlet
 * 
 */

public class ObjectInfoCollection {
  private static final Logger logger = 
    Logger.getLogger(ObjectInfoCollection.class);
  // processed contents of search config file
  private HashMap<String, ObjectTypeInfo> searchInfo;

  // processed contents of detail config file
  private HashMap<String, ObjectTypeInfo> detailInfo;

  // contents of general search config file
  private Properties generalSearchInfo;

  // contents of processor handler config file
  private Properties processorInfo;

  /**
   * Loads contents of search properties file
   * 
   * @throws IOException thrown if an error occurs while reading the file
   */
  public void loadSearchFile() throws IOException {
    parseSearchValues(WebApp.getSearchProperties());
  }

  /**
   * Loads contents of detail properties file
   * 
   * @throws IOException thrown if an error occurs while reading the file
   */
  public void loadDetailFile() throws IOException {
    parseDetailValues(WebApp.getDetailProperties());
  }

  /**
   * Loads contents of general search properties file
   * 
   * @throws IOException thrown if an error occurs while reading the file
   */
  public void loadGeneralSearchFile() throws IOException {
    this.generalSearchInfo = WebApp.getGeneralSearchProperties();
  }

  /**
   * Loads contents of processor properties file
   * 
   * @throws IOException if an error occurs while reading the file
   */
  public void loadProcessorFile() throws IOException {
    this.processorInfo = WebApp.getProcessorProperties();
  }

  /**
   * Parse delimited string from search properties file into separate values and
   * create ObjectTypeInfo objects to hold properties.
   * 
   * @param props the properties object containing the properties to parse
   */
  private void parseSearchValues(Properties props) {
    Enumeration itr = props.propertyNames();
    this.searchInfo = new HashMap<String, ObjectTypeInfo>();

    while (itr.hasMoreElements()) {
      String objectType = (String)itr.nextElement();

      // get delimited string stored in conf file
      String valueStr = props.getProperty(objectType);

      ObjectTypeInfo info = new ObjectTypeInfo();
      info.setObjectType(objectType);

      // search string format:
      // searchHandler [tab] searchPage [tab] tableInfoClass;
      //
      // NULL placeholder signifies empty value for property
      StringTokenizer t = new StringTokenizer(valueStr, "\t");
      info.setSearchHandlerClass(checkNull(t.nextToken()));
      info.setSearchPage(checkNull(t.nextToken()));
      info.setTableInfoClass(checkNull(t.nextToken()));
      searchInfo.put(info.getObjectType(), info);
    }

  }

  /**
   * Parse delimited string from detail config file into separate values and
   * create ObjectTypeInfo objects to hold properties
   * 
   * @param props the properties object containing the properties to parse
   */
  private void parseDetailValues(Properties props) {

    Enumeration itr = props.propertyNames();
    this.detailInfo = new HashMap<String, ObjectTypeInfo>();
    while (itr.hasMoreElements()) {
      String objectType = (String)itr.nextElement();

      // get delimited string stored in conf file
      String valueStr = props.getProperty(objectType);

      ObjectTypeInfo info = new ObjectTypeInfo();
      info.setObjectType(objectType);

      try {
        // search string format:
        // detail class [tab] detail jsp [tab] accession prefix
        //
        // NULL placeholder signifies empty value for property
        StringTokenizer t = new StringTokenizer(valueStr, "\t");
        info.setDetailClass(checkNull(t.nextToken()));
        info.setDetailPage(checkNull(t.nextToken()));
        info.setAccessionPrefix(checkNull(t.nextToken()));
        detailInfo.put(info.getObjectType(), info);
      } catch (NoSuchElementException e) {
        // tokenizer encountered badly formatted row, print it for debugging
        logger.debug("Format problem with detail property file: " + valueStr, e);
      }
    }
  }

  /**
   * Utility method to check whether parsed value from value is NULL placeholder --
   * if so, assign null value to property, else return value from file.
   * 
   * @param value the value to check for being NULL
   */
  private String checkNull(String value) {
    String returnStr = null;

    if (value != null && !value.equals("NULL")) {
      returnStr = value.trim();
    }
    return returnStr;
  }

  /**
   * Utility method to return collection of all matching property values.
   * Returned collection contains object type key referencing requested string
   * value, not the ObjectTypeInfo object itself.
   * 
   * @param infoMap input value map
   * @param value value to match
   */
  private Map getValues(Map infoMap, String value) {
    Map<String, String> matches = null;
    Iterator iter = null;
    ObjectTypeInfo info = null;

    if (infoMap != null && !infoMap.isEmpty()) {
      matches = new HashMap<String, String>();
      iter = infoMap.values().iterator();

      while (iter.hasNext()) {
        info = (ObjectTypeInfo)iter.next();

        if (value.equals("searchHandler")
            && info.getSearchHandlerClass() != null) {

          matches.put(info.getObjectType(), info.getSearchHandlerClass());

        } else if (value.equals("searchPage") && info.getSearchPage() != null) {

          matches.put(info.getObjectType(), info.getSearchPage());

        } else if (value.equals("tableInfo")
                   && info.getTableInfoClass() != null) {

          matches.put(info.getObjectType(), info.getTableInfoClass());

        } else if (value.equals("detailClass") && info.getDetailClass() != null) {

          matches.put(info.getObjectType(), info.getDetailClass());

        } else if (value.equals("detailPage") && info.getDetailPage() != null) {

          matches.put(info.getObjectType(), info.getDetailPage());

        } else if (value.equals("accession")
                   && info.getAccessionPrefix() != null) {

          matches.put(info.getObjectType(), info.getAccessionPrefix());
        }
      }
    }

    return matches;
  }

  /**
   * Retrieves a collection of search types and corresponding RequestHandler
   * class names used by SearchServlet to populate its HandlerFactory, which
   * then generically creates RequestHandler objects to handle specific type
   * searches as they're requested. Config file must be explicitly loaded
   * through loadSearchFile before calling this method.
   * 
   * @return Map containing String key for search type referencing String value
   *         of RequestHandler class name to use for search type
   */
  public Map getSearchHandlers() {
    return getValues(searchInfo, "searchHandler");
  }

  /**
   * Retrieves a collection of search types and corresponding search form JSP
   * names used by SearchServlet to redirect users to search form for requested
   * type. Config file must be explicitly loaded through loadSearchFile before
   * calling this method.
   * 
   * 
   * @return Map containing String key for search type referencing String value
   *         of JSP to use as search form for search type
   */
  public Map getSearchPages() {
    return getValues(searchInfo, "searchPage");
  }

  /**
   * Retrieves collection of search types and corresponding temp table info
   * class names used by MasterTableInfo to define and create user-specific temp
   * tables that cache search results for different search types. Config file
   * must be explicitly loaded through loadSearchFile before calling this
   * method.
   * 
   * 
   * @return Map containing String key for search type referencing String value
   *         of temp table info class name that defines temp table structure to
   *         use when caching search results for search type
   */
  public Map getTableInfoClasses() {
    return getValues(searchInfo, "tableInfo");
  }

  /**
   * Retrieves a collection of object types and corresponding Detail class names
   * used by DetailFactory and TairServlet to generically create Detail objects
   * that contain object specific data for display on object detail page. Config
   * file must be explicitly loaded through loadDetailFile before calling this
   * method.
   * 
   * @return Map containing String key for object type referencing String value
   *         of Detail class name to use for object type
   */
  public Map getDetailClasses() {
    return getValues(detailInfo, "detailClass");
  }

  /**
   * Retrieves a collection of object types and corresponding JSPs used by
   * DetailFactory and TairServlet to display Detail object info. Config file
   * must be explicitly loaded through loadDetailFile before calling this
   * method.
   * 
   * @return Map containing String key for object type referencing String value
   *         of JSP to use for displaying data
   */
  public Map getDetailPages() {
    return getValues(detailInfo, "detailPage");
  }

  /**
   * Retrieves a collection of object types and corresponding accession prefixes
   * used by AccessionManager to create TAIR accession numbers for data objects.
   * Config file must be explicitly loaded through loadDetailFile before calling
   * this method.
   * 
   * @return Map containing String key for object type referencing String value
   *         used as prefix when creating TAIR accession numbers
   */
  public Map getAccessionPrefixes() {
    return getValues(detailInfo, "accession");
  }

  /**
   * Retrieves a collection of search types and corresponding GeneralSearcher
   * class names used by GeneralSearchHandler to do type specific searches
   * through the general search. Config file must be explicitly loaded through
   * loadGeneralSearchFile before calling this method.
   * 
   * @return Map containing String key for object type referencing String
   *         literal value of class name to use for doing general searches of
   *         key type
   */
  public Map getGeneralSearchClasses() {
    return generalSearchInfo;
  }

  /**
   * Retrieves a collection of action types and corresponding RequestHandler
   * class names used by ProcessorServlet. Data is read from processor conf
   * file. Config file must be explicitly loaded through loadProcessorFile
   * before calling this method.
   * 
   * @return Map containing String key for object type referencing String
   *         literal value of class name to use for doing processor actions of
   *         key type
   */
  public Map getProcessorHandlerClasses() {
    return processorInfo;
  }

  /**
   * For unit testing only -- prints values of map to STDOUT for review.
   */
  public void printCollection(Map values) {
    Iterator iter = values.keySet().iterator();
    while (iter.hasNext()) {
      String type = (String)iter.next();
      String value = (String)values.get(type);
      System.out.println("Object type: " + type);
      System.out.println("Value: " + value + "\n");
    }
  }

  /**
   * For unit testing only
   */
  public static void main(String[] args) {

    try {
      ObjectInfoCollection info = new ObjectInfoCollection();

      System.out.println("Loading search config...");
      info.loadSearchFile();

      System.out.println("Loading detail config...");
      info.loadDetailFile();

      System.out.println("\nSearch handlers...");
      info.printCollection(info.getSearchHandlers());

      System.out.println("\nSearch pages...");
      info.printCollection(info.getSearchPages());

      System.out.println("\nDetail classes...");
      info.printCollection(info.getDetailClasses());

      System.out.println("\nDetail pages...");
      info.printCollection(info.getDetailPages());

      System.out.println("\nAccession prefixes...");
      info.printCollection(info.getAccessionPrefixes());

      System.out.println("\nTable info classes...");
      info.printCollection(info.getTableInfoClasses());

      System.out.println("\nLoading general search config...");
      info.loadGeneralSearchFile();

      System.out.println("\nGeneralSearcher classes...");
      info.printCollection(info.getGeneralSearchClasses());

      System.out.println("\nLoading processor config...");
      info.loadProcessorFile();

      System.out.println("\nProcessor handler classes...");
      info.printCollection(info.getProcessorHandlerClasses());

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
