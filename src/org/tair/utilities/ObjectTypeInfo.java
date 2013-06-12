/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**
 * ObjectTypeInfo is a data class to hold literal values for a given object type. The
 * values contained include:
 *
 * <ul>
 * <li>object type - the string key used throughout the site & application to reference
 * objects of this type, such as in a URL to TairObject servlet ( TairObject?type=? )</li>
 *
 * <li>search handler class - class name used by SearchServlet to create a search RequestHandler,
 * using HandlerFactory, to handle searches for object type. For example "org.tair.search.GeneSearchHandler"
 * is the class used to handle gene searches.</li>
 *
 * <li>search page - JSP used as search input form for searches of object type. This value is used
 * by SearchServlet to handle simple page redirects without creating a full RequestHandler when user
 * requests a new search</li>
 *
 * <li>table info class - class name used by MasterTableInfo to create and define database temp tables
 * that cache a user's search results for object type.  For example, "org.tair.search.table.GeneTableInfo"
 * is the data class that contains column definitions and other info used to create gene search results
 * temp tables</li>
 *
 * <li>detail class - class name used by DetailFactory and TairServlet to create Detail objects for
 * for object type. For example "org.tair.querytools.GeneDetail" is the class used to display data on the
 * gene detail page</li>
 * 
 * <li>detail page - JSP used by DetailFactory and TairServlet to display detail data for object type.
 * For example "/jsp/tairjsp/gene_detail.jsp" is the page that displays gene detail data</li>
 *
 * <li>accession prefix - Formatted value used by AccessionManager to create TAIR accession numbers for 
 * object type. For example, gene TAIR accessions are of the form "Gene:12345"; accession prefix in this
 * case would be "Gene".</li>
 *
 * </ul>
 *
 * ObjectTypeInfo objects are created by ObjectInfoCollection, which populates the objects with data
 * values found in two config files - search config and detail config. The locations of both of these
 * files are stored in WebApp as SEARCH_CONF_FILE and DETAIL_CONF_FILE, but they should be at
 * $HOME/conf/search.conf and $HOME/conf/detail.conf respectively. Although it complicates things a 
 * little on the back end, using these files greatly simplifies the deployment of different object 
 * searches/detail pages etc. over the different environments now in use.  Collection object definition
 * info in this config file means that new object types can be added or removed through the config files,
 * instead of recompilation of one or more  classes that need the literal values stored in the config files.
 *
 * <p>
 * Not all object types will have values for all properties. For instance, the TAIR site has an analysis
 * reference detail page and object, but there is no actual analysis reference search (meaning that there
 * will be a null value for searchHandlerClass and tableInfoClass if objectType is "analysis_reference"
 *
 * @see ObjectInfoCollection
 */
	
public class ObjectTypeInfo {

  private String objectType;
  private String searchHandlerClass;
  private String searchPage;
  private String detailClass;
  private String detailPage;
  private String accessionPrefix;
  private String tableInfoClass;


  /**
   * Creates an empty instance of ObjectTypeInfo
   */
  public ObjectTypeInfo() { }

  public final String getObjectType() { return objectType; }
  public final String getSearchHandlerClass() { return searchHandlerClass; }
  public final String getSearchPage() { return searchPage; }
  public final String getDetailClass() { return detailClass; }
  public final String getDetailPage() { return detailPage; }
  public final String getAccessionPrefix() { return accessionPrefix; }
  public final String getTableInfoClass() { return tableInfoClass; }

  public final void setObjectType( String type ) { this.objectType = type; }
  public final void setSearchHandlerClass( String className ) { this.searchHandlerClass = className; }
  public final void setSearchPage( String page ) { this.searchPage = page; }
  public final void setDetailClass( String className ) { this.detailClass = className; }
  public final void setDetailPage( String page ) { this.detailPage = page; }
  public final void setAccessionPrefix( String prefix ) { this.accessionPrefix = prefix; }
  public final void setTableInfoClass( String className ) { this.tableInfoClass = className; }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "ObjectType: " + getObjectType() );
    System.out.println( "SearchHandlerClass: " + getSearchHandlerClass() );
    System.out.println( "SearchPage: " + getSearchPage() );
    System.out.println( "DetailClass: " + getDetailClass() );
    System.out.println( "DetailPage: " + getDetailPage() );
    System.out.println( "AccessionPrefix: " + getAccessionPrefix() );
    System.out.println( "TableInfoClass: " + getTableInfoClass() + "\n" );
  }
    
}
