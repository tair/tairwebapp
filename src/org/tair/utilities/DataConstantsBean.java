/*
 * Created on Apr 29, 2008 by muller
 * 
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;

import java.io.Serializable;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import org.tair.faces.AbstractManagedBean;

/**
 * A wrapper for the TAIR Utilities data constants used in Faces pages.
 * 
 * @author Bob Muller (bmuller@stanford.edu)
 */
@ManagedBean(name="constants")
@ApplicationScoped
public final class DataConstantsBean extends AbstractManagedBean implements Serializable {

  /** Default serial version UID */
  private static final long serialVersionUID = 1L;

  /**
   * Option to search for hits that contain the string
   */
  @ManagedProperty(value="#{exact}")
  private String exact = org.tair.utilities.DataConstants.SEARCH_CONTAINS;
  
  /**
   * Option to search for hits that match the string exactly
   */
  @ManagedProperty(value="#{contains}")
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
   * @return a contains option string
   */
  public String getContains() {
    return contains;
  }

  /**
   * Set the contains option string.
   * @param contains a contains option string
   */
  public void setContains(String contains) {
    this.contains = contains;
  }

}
