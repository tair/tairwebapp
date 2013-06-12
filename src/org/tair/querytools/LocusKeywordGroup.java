/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.querytools;


import java.util.List;

import org.tair.utilities.StringList;


/**
 * An intermediate user-interface object that aggregates a group of locus
 * annotations. The groups have a distinct category and relationship type and a
 * set of keywords (not URL links as in LocusAnnotationGroup) as a
 * comma-separated string aggregation. The base for this group is the category
 * string, the relationship type string, and a list of the keywords. This
 * representation is intended for use in a locus summary page where the linking
 * is done by the header to the annotation detail page (one big link).
 * 
 * @author Robert J. Muller
 */
public class LocusKeywordGroup {
  private String category;
  private String relationshipType;
  private String keywords;

  /**
   * Create a LocusAnnotationGroup object.
   * 
   * @param category the annotation category
   * @param relationshipType the annotation relationshipType
   * @param keywords a list of string k
   */
  public LocusKeywordGroup(String category,
                           String relationshipType,
                           List<String> keywords) {
    this.category = category;
    this.relationshipType = relationshipType;
    this.keywords = StringList.listToCommaString(keywords);
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
   * Get the comma-delimited list of keywords for display.
   * 
   * @return the keywords
   */
  public String getKeywords() {
    return keywords;
  }
}
