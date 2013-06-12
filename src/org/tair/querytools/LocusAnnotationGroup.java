/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.querytools;


import java.util.List;

import org.tair.utilities.StringList;


/**
 * An intermediate user-interface object that aggregates a group of locus
 * annotations. The groups have a distinct category and relationship type and a
 * set of keyword links as a comma-separated string aggregation. The base for
 * this group is the category string, the relationship type string, and a list
 * of the keyword links.
 * 
 * @author Robert J. Muller
 */
public class LocusAnnotationGroup {
  private String category;
  private String relationshipType;
  private String links;

  /**
   * Create a LocusAnnotationGroup object.
   * 
   * @param category the annotation category
   * @param relationshipType the annotation relationshipType
   * @param links a list of string <a> links
   */
  public LocusAnnotationGroup(String category,
                              String relationshipType,
                              List<String> links) {
    this.category = category;
    this.relationshipType = relationshipType;
    this.links = StringList.listToCommaString(links);
  }

  /**
   * Get the annotation category.
   * 
   * @return the category
   */
  public String getCategory() {
    return category;
  }

  /**
   * Get the annotation relationship type.
   * 
   * @return the relationship type
   */
  public String getRelationshipType() {
    return relationshipType;
  }

  /**
   * Get the annotation links for the category and relationship type.
   * 
   * @return the links
   */
  public String getLinks() {
    return links;
  }
}
