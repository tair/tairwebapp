/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.table;

public class PolyAlleleTableInfo extends TempTableInfo {

 private String[] column_names = new String[] { "id","name","tair_object_id","type","chromosome","map_element_id","is_allele","position_requested","units_requested","map_type_requested","row_id" };

  public PolyAlleleTableInfo() {
    super();
  }

  public String getTableColumns() {
    String columns =
      "id numeric(12) NOT NULL, " +
      "name varchar(50) NOT NULL, " +
      "tair_object_id numeric(12) NOT NULL, " +
      "type varchar(20) NULL, " +
      "chromosome varchar(10) NULL, " +
      "map_element_id numeric(12) NOT NULL, " +
      "is_allele  char(1) NULL, " +
      "position_requested float NULL, " +
      "units_requested char(2) NULL, " +
      "map_type_requested varchar(20) NOT NULL, " +
      "row_id numeric IDENTITY ";
    return columns;
  }

  public String getType() { return "polyallele"; }

  public String[] getColumnNames() { return column_names; }

}
