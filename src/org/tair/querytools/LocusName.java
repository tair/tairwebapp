/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.querytools;

/**
 * A helper class that contains just the locus name for use in displays of lists
 * of loci. Examples of current use are locus_detail.jsp and
 * publication_detail.jsp.
 * 
 * @author Robert J. Muller
 */
public class LocusName {
  String name;

  /**
   * Create a LocusName object supplying the locus name.
   * 
   * @param name the locus name
   */
  public LocusName(String name) {
    this.name = name;
  }

  /**
   * Get the locus name.
   * 
   * @return
   */
  public String getName() {
    return name;
  }

  /**
   * Set the locus name.
   * 
   * @param name the locus name
   */
  public void setName(String name) {
    this.name = name;
  }

}
