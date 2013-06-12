/**
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.germplasm;

/**
 * A data transfer object for species variant names for use in a map of such
 * names keyed on species variant id
 * 
 * @author Robert J. Muller
 */
public class SpeciesVariantNames {
  /** The base or full name of the species variant (Arabidopsis thaliana */
  private final String base;
  /** The abbreviated name of the species variant (A. thaliana) */
  private final String abbrev;

  public SpeciesVariantNames(String base, String abbrev) {
    this.base = base;
    this.abbrev = abbrev;
  }

  /**
   * Get the base (full) species variant name.
   * 
   * @return a name
   */
  public String getBase() {
    return base;
  }

  /**
   * Get the abbreviated species variant name.
   * 
   * @return a name
   */
  public String getAbbrev() {
    return abbrev;
  }
}
