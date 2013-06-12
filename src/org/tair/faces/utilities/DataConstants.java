/*
 * Created on Apr 29, 2008 by muller
 * 
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.faces.utilities;

import org.tair.faces.AbstractManagedBean;

/**
 * A wrapper for the TAIR Utilities data constants used in Faces pages.
 * 
 * @author Bob Muller (bmuller@stanford.edu)
 */
public final class DataConstants extends AbstractManagedBean {

  /**
   * Option to search for hits that contain the string
   */
  private String exact = org.tair.utilities.DataConstants.SEARCH_CONTAINS;
  
  /**
   * Option to search for hits that match the string exactly
   */
  private String contains = org.tair.utilities.DataConstants.SEARCH_EXACT;

  /**
   * Get the exact option.
   * 
   * @return Returns the exact option.
   */
  public String getExact() {
    return exact;
  }

  /**
   * Set the exact option (does nothing).
   * 
   * @param exact The value to set.
   */
  public void setExact(String exact) {
  }

  /**
   * Get the contains option.
   * 
   * @return Returns the contains option.
   */
  public String getContains() {
    return contains;
  }

  /**
   * Set the contains option (does nothing).
   * 
   * @param contains The value to set.
   */
  public void setContains(String contains) {
  }
}
