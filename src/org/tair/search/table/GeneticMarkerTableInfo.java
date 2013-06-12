/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;


/**
 * GeneticMarkerTableInfo contains the type specific information
 * to create a temp table to hold results of the genetic marker search.
 * GeneticMarkerTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for genetic marker search is contained in table column
 * data returned by getTableColumns() method.
 */

public class GeneticMarkerTableInfo extends TempTableInfo {

  public GeneticMarkerTableInfo() {
    super();
  }

  /**
   * @return String defining genetic marker specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold genetic marker search results.
   */
  public String getTableColumns() {
    String columns = 
      "tair_object_id numeric(12) NOT NULL, " +
      "map_element_id numeric(12) NOT NULL, " +
      "genetic_marker_id numeric(12) NOT NULL, " +
      "name varchar(50) NULL, " +
      "type varchar(10) NULL, " +
      "chromosome varchar(25) NULL, " +
      "units char(2) NULL, " +
      "position float NULL";
    return columns;
  }

  /**
   * @return String key to use when referencing genetic marker table info.
   */
  public String getType() { return "marker"; }
}
