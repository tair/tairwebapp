/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

/**
 * CommunityTableInfo contains the type specific information
 * to create a temp table to hold results of the community search.
 * CommunityTableInfo uses default implementations of all methods 
 * in <code>TempTableInfo</code> superclass. Type specific
 * information for community search is contained in table column
 * data returned by getTableColumns() method.
 */

public class CommunityTableInfo extends TempTableInfo {

  public CommunityTableInfo() {
    super();
  }


  /**
   * @return String defining community specific temp table columns
   * that can be used as part of CREATE TABLE SQL command when
   * creating a table to hold community search results.
   */
  public String getTableColumns() {
    String columns = 
      "community_id numeric(12) NOT NULL, " +
      "table_id numeric(12) NULL, " +
      "type varchar(30) NULL, " +
      "email varchar(100) NULL,  " +
      "last_name varchar(100) NULL, " +
      "last_name_uc varchar(100) NULL, " +
      "first_name varchar(100) NULL, " +
      "first_name_uc varchar(100) NULL, " +
      "region varchar(30) NULL, " +
      "country varchar(30) NULL, " +
      "sub_type varchar(60) NULL ";
    return columns;
  }

  /**
   * @return String key to use when referencing community table info.
   */
  public String getType() { return "community"; }
}
