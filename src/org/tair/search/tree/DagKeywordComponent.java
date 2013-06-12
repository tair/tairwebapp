/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import java.io.Serializable;
import java.math.BigInteger;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


/**
 * Implements the Component in the Composite Design Pattern for a Directed
 * Acyclic Graph (DAG). Each Component is either a CompositeDAG or a leaf
 * subclass (LeafKeyword) with no children. Each component has a set of parents
 * and a set of children. There is an iterator that iterates over the children
 * of the component, and there is a second iterator available for iterating over
 * children. There are add and remove methods for adding parents and children.
 * 
 * @author Robert J. Muller
 */
public abstract class DagKeywordComponent implements Serializable,
    Comparable<DagKeywordComponent> {

  /** Default serial version UID */
  private static final long serialVersionUID = 1L;
  /** the primary key of the keyword corresponding to the component */
  protected BigInteger keywordId;
  /** the set of parents for the keyword (may be empty for root node) */
  protected Set<DagKeywordComposite> parents =
    new HashSet<DagKeywordComposite>();

  /**
   * Create a DagKeywordComponent object.
   * 
   * @param keywordId the unique id for the keyword
   */
  public DagKeywordComponent(BigInteger keywordId) {
    this.keywordId = keywordId;
  }

  /**
   * Iterate over the children of the component.
   * 
   * @return an iterator over the children of the component
   */
  public abstract Iterator<DagKeywordComponent> childIterator();

  /**
   * Iterate over the parents of the component.
   * 
   * @return an iterator over the parents of the component
   */
  public Iterator<DagKeywordComposite> parentIterator() {
    return parents.iterator();
  }

  /**
   * Get the keyword id, the primary key for a keyword.
   * 
   * @return a keyword id
   */
  public BigInteger getKeywordId() {
    return keywordId;
  }

  /**
   * Is the component a root node (has no parents)?
   * 
   * @return true if the component is a root node, false if not
   */
  public boolean isRoot() {
    return parents.size() == 0 ? true : false;
  }

  /**
   * Is the component a leaf node (has no children)?
   * 
   * @return true if the component is a leaf node, false if not
   */
  abstract public boolean isLeaf();

  /**
   * Add a child to the node (its parent).
   * 
   * @param child the child component to add to the node (its parent)
   */
  abstract public void addChild(DagKeywordComponent child);

  /**
   * Add a parent to the node (its child).
   * 
   * @param parent the parent component to add to the node (its child)
   */
  public void addParent(DagKeywordComposite parent) {
    if (parents.contains(this)) {
      throw new RuntimeException("Cycle detected in graph from child " + this
                                 + " to parent " + parent);
    }
    parents.add(parent);
  }

  /**
   * Get the set of DAG keyword edges representing the connections between nodes
   * in the directed acyclic graph (DAG) of keywords. This set includes the self
   * link (link between the current node and itself), the link between the
   * current node and its parent, the links between the leaf and this parent,
   * and the links between the parents.
   * 
   * @param leaf the leaf currently being visited
   * @param parents the set of unvisited parents of the leaf
   * 
   * @return a set of keyword edges
   */
  abstract public Set<DagKeywordEdge> getEdges(DagKeywordLeaf leaf,
                                               Set<DagKeywordComposite> parents);

  @Override
  public int compareTo(DagKeywordComponent o) {
    // Compare primary keys
    return keywordId.compareTo(o.keywordId);
  }

  @Override
  public boolean equals(Object obj) {
    // Test primary keys for equality
    DagKeywordComponent other = (DagKeywordComponent)obj;
    return keywordId.equals(other.keywordId);
  }

  @Override
  public int hashCode() {
    // Hash primary key
    return keywordId.hashCode();
  }

  @Override
  public String toString() {
    return "DagKeywordComponent (" + keywordId.toString() + ")";
  }
}
