/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.dna;

/**
 * Interface to define methods that allow DNASummary objects to be handled generically 
 * for downloading of requested items.
 */

public interface DNASummary {

  /**
   * @return Tab delimited string containing type specific export info. for this summary object
   */
  public String createExport();

  /**
   * @return Tab delimited string of column headers for each data field contained in export string
   */
  public String getExportHeader();
}
