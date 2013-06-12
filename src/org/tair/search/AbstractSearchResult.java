/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;


import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;


/**
 * Abstract implementation class for all search result classes; provides shared
 * code that all search result classes use.
 * 
 * @author Robert J. Muller
 * @param <K> the type of the key for the search result
 */
public abstract class AbstractSearchResult<K> implements ISearchResult<K>,
    Serializable {

  /** Default serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;

  /**
   * Get a string representation of a Long number, translating null numbers to
   * an empty string.
   * 
   * @param number a Long number
   * @return a string representation or an empty string
   */
  protected String getLongString(Long number) {
    return number != null ? number.toString() : "";
  }

  /**
   * Get a string representation of a BigDecimal number, translating null
   * numbers to an empty string.
   * 
   * @param number a BigDecimal number
   * @return a string representation or an empty string
   */
  protected String getBigDecimalString(BigDecimal number) {
    return number != null ? number.toString() : "";
  }

  /**
   * Translate the date into a standard date format mm/dd/yyyy, no time.
   * 
   * @param timestamp the timestamp to convert to a string
   * @return a formatted date or an empty string
   */
  protected String getDateString(Timestamp timestamp) {
    Format format = new SimpleDateFormat("MM/dd/yyyy");
    return timestamp != null ? format.format(timestamp) : "";
  }
}
