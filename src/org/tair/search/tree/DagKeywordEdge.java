/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import java.io.Serializable;

import org.tair.utilities.HashCodeGenerator;


/**
 * A Directed Acyclic Graph (SAG) edge that represents a link between a child
 * and one of its parents in the keyword DAG. Each edge has a parent node and a
 * child node (<code>DagComponent</code> objects). The parent node is a
 * component higher in the tree at some level (not necessarily immediate),
 * including the child component itself and the root of the tree.
 * 
 * @author Robert J. Muller
 */
public class DagKeywordEdge implements Serializable, Comparable<DagKeywordEdge> {
  /** Default serial version UID */
  private static final long serialVersionUID = 1L;
  /** the child component node of the edge */
  private DagKeywordComponent child;
  /** the parent component node of the edge to which the child links */
  private DagKeywordComponent parent;

  /**
   * Create a ShortestPathEdge object.
   * 
   * @param child the child component
   * @param parent the parent component to which to link the child
   */
  public DagKeywordEdge(DagKeywordComponent child, DagKeywordComponent parent) {
    this.child = child;
    this.parent = parent;
  }

  /**
   * Get the child.
   * 
   * @return a child
   */
  public DagKeywordComponent getChild() {
    return child;
  }

  /**
   * Set the child.
   * 
   * @param child a child
   */
  public void setChild(DagKeywordComponent child) {
    this.child = child;
  }

  /**
   * Get the parent.
   * 
   * @return a parent
   */
  public DagKeywordComponent getParent() {
    return parent;
  }

  /**
   * Set the parent.
   * 
   * @param parent a parent
   */
  public void setParent(DagKeywordComponent parent) {
    this.parent = parent;
  }

  @Override
  public int compareTo(DagKeywordEdge other) {
    int compare = 0;
    if (parent.getKeywordId().equals(other.parent.getKeywordId())) {
      // Same parent, compare children
      compare = child.getKeywordId().compareTo(other.child.getKeywordId());
    } else {
      // Compare parents
      compare = parent.getKeywordId().compareTo(other.parent.getKeywordId());
    }
    return compare;
  }

  @Override
  public boolean equals(Object arg0) {
    DagKeywordEdge other = (DagKeywordEdge)arg0;
    return parent.getKeywordId().equals(other.parent.getKeywordId())
           && child.getKeywordId().equals(other.child.getKeywordId());
  }

  @Override
  public int hashCode() {
    int result = HashCodeGenerator.SEED;
    result = HashCodeGenerator.hash(result, parent);
    result = HashCodeGenerator.hash(result, child);
    return result;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder("Edge (child ");
    builder.append(child.getKeywordId().toString());
    builder.append(", parent ");
    builder.append(parent.getKeywordId().toString());
    builder.append(")");
    return builder.toString();
  }
}
