/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;

/**
 * The basic interface for search result classes.
 * 
 * @author Robert J. Muller
 * @param <K> the type of the unique key for the result
 */
public interface ISearchResult<K> {
  /**
   * Get the unique identifier for the search result.
   * 
   * @return an id
   */
  K getId();

  /**
   * Get the text, tab-delimited header for an export file.
   * 
   * @param builder a string builder into which to put the header text
   * 
   * @return the header
   */
  StringBuilder getExportHeader(StringBuilder builder);

  /**
   * Get the line of tab-delimited values for the export file.
   * 
   * @param builder a string builder into which to put the export text
   * 
   * @return the export line
   */
  StringBuilder getExport(StringBuilder builder);
  
  /**
   * Set the order identifier for a sorted result object (the index of the
   * result in a sorted list of results).
   * @param id the sort row id for this result
   */
  void setSortRowId(Integer id);
}
