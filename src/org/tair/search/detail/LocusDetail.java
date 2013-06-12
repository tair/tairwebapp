/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.detail;


import java.io.IOException;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import org.tair.utilities.TextConverter;


/**
 * A Faces managed bean that provides the backing for the Locus Detail page.
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="locus")
@SessionScoped
public class LocusDetail implements Serializable {
  /** Generated Serializable version id */
  private static final long serialVersionUID = 5710201323969647553L;
  /** The TAIR locus id passed in as a parameter */
  private BigInteger id;
  /** String for the current value of the customized view dropdown */
  @ManagedProperty(value="#[customizedView)")
  private String customizedView;
  /** Map of the set of keys and values in the customized view dropdown */
  private Map<String, String> customizedViewSuggestions;
  /** String for the current jump-to target menu group */
  private String jumpTarget;
  /** Map of key-value pairs for jump-to drop-down */
  @ManagedProperty(value="#{jump}")
  private Map<String, String> jump;
  /** Map of flags indicating whether menu groups are expanded */
  @ManagedProperty(value="#{expanded}")
  private Map<String, Boolean> expanded;
  /** Map of counts for key associations for use in UI displays */
  private Map<String, Integer> counts;

  /**
   * Create a LocusDetail object.
   */
  public LocusDetail() {
  }

  /**
   * Get the customized-view value
   * 
   * @return the customized-view value
   */
  public java.lang.String getCustomizedView() {
    return customizedView;
  }

  /**
   * Set the customized-view value from the form.
   * 
   * @param customizedView the value
   */
  public void setCustomizedView(java.lang.String customizedView) {
    this.customizedView = customizedView;
  }

  /**
   * Get the map with the set of drop-down suggestions for the customized-view
   * drop-down list.
   * 
   * @return the map with keys and values for the drop-down list
   */
  public Map<String, String> getCustomizedViewSuggestions() {
    return customizedViewSuggestions;
  }

  /**
   * Set the map with the set of drop-down suggestions for the customized-view
   * drop-down list.
   * 
   * @param customizedViewSuggestions the map
   */
  public void setCustomizedViewSuggestions(
                                           Map<String, String> customizedViewSuggestions) {
    this.customizedViewSuggestions = customizedViewSuggestions;
  }

  /**
   * Get the jumpTarget.
   * 
   * @return Returns the jumpTarget.
   */
  public String getJumpTarget() {
    return jumpTarget;
  }

  /**
   * Set the jumpTarget.
   * 
   * @param jumpTarget The jumpTarget to set.
   */
  public void setJumpTarget(String jumpTarget) {
    this.jumpTarget = jumpTarget;
  }

  /**
   * Get the current value for the jump-to combo box, a string with the name of
   * the section to which to move.
   * 
   * @return the jump-to value
   */
  public Map<String, String> getJump() {
    return jump;
  }

  /**
   * Set the current value for the jump-to combo box.
   * 
   * @param jump the value
   */
  public void setJump(Map<String, String> jump) {
    this.jump = jump;
  }

  /**
   * Get the map of expanded flags for the menu groups.
   * 
   * @return the flag map
   */
  public Map<String, Boolean> getExpanded() {
    return expanded;
  }

  /**
   * Set the map of expanded flags for the menu groups.
   * 
   * @param expanded
   */
  public void setExpanded(Map<String, Boolean> expanded) {
    this.expanded = expanded;
  }

  /**
   * Set the expanded state of all menu groups to true, then redisplay the page.
   * 
   * @return null
   * @throws IOException when there is a problem redirecting back to the detail
   *           page
   */
  public String openAll() throws IOException {
    for (String key : expanded.keySet()) {
      expanded.put(key, true);
    }
    return null; // redisplay page with open groups
  }

  /**
   * Set the expanded state of all menu groups to false, then redisplay the
   * page.
   * 
   * @return null
   * @throws IOException when there is a problem redirecting back to the detail
   *           page
   */
  public String closeAll() throws IOException {
    for (String key : expanded.keySet()) {
      expanded.put(key, false);
    }
    return null; // redisplay page with closed groups
  }

  /**
   * Get the map of counts of associated objects.
   * 
   * @return the map of counts
   */
  public Map<String, Integer> getCounts() {
    return counts;
  }

  /**
   * Set the map of counts of associated objects.
   * 
   * @param counts the map of counts
   */
  public void setCounts(Map<String, Integer> counts) {
    this.counts = counts;
  }

  /**
   * Get the locus id as a string.
   * 
   * @return an integer in string representation that uniquely identifies the
   *         locus
   */
  public String getId() {
    if (id == null) {
      load();
    }
    return id.toString();
  }

  /**
   * Set the locus id from a string representation passed as a URL parameter.
   * 
   * @param id an integer that uniquely identifies the locus
   */
  public void setId(String id) {
    if (!TextConverter.isEmpty(id)) {
      this.id = new BigInteger(id);
    }
  }

  /**
   * Load the locus object using the locus id. This is a Faces action method
   * called by the PrettyFaces mapping to initialize the locus.
   * 
   * @return null (display the page)
   */
  public String load() {
    // TODO add Business Delegate for locus here to initialize data for detail
    // page
    // TODO for now just set the id to a locus id
    id = new BigInteger("2063835");
    return null;
  }
}
