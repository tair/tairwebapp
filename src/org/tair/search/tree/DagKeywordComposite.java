/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import java.math.BigInteger;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.jboss.logging.Logger;


/**
 * Implements the Composite in the Composite Design Pattern for a Directed
 * Acyclic Graph (DAG). The composite is a concrete DagKeywordComponent object
 * that may have children (and thus has a set of children with at least one
 * child in the set).
 * 
 * @author Robert J. Muller
 */
public class DagKeywordComposite extends DagKeywordComponent {
  private static final Logger logger =
    Logger.getLogger(DagKeywordComposite.class);

  /** Default serial version UID */
  private static final long serialVersionUID = 1L;

  /** the set of children for the keyword (must have at least one child) */
  private Set<DagKeywordComponent> children =
    new HashSet<DagKeywordComponent>();

  /** whether the shortest path builder has already visited this node */
  boolean visited = false;

  /**
   * Create a DagKeywordComposite object.
   * 
   * @param keywordId the primary key for the keyword
   */
  public DagKeywordComposite(BigInteger keywordId) {
    super(keywordId);
  }

  @Override
  public boolean isLeaf() {
    return false;
  }

  @Override
  public Iterator<DagKeywordComponent> childIterator() {
    return children.iterator();
  }

  @Override
  public void addChild(DagKeywordComponent child) {
    if (parents.contains(child)) {
      throw new RuntimeException("Cycle detected in graph from child " + child
                                 + " to parent " + this);
    }
    children.add(child);
  }

  @Override
  public Set<DagKeywordEdge> getEdges(DagKeywordLeaf leaf,
                                      Set<DagKeywordComposite> visitedParents) {
    Set<DagKeywordEdge> edges = new HashSet<DagKeywordEdge>();
    
    // Add links to previously visited parents as children
    for (DagKeywordComposite visitedParent : visitedParents) {
      edges.add(new DagKeywordEdge(visitedParent, this));
      logger.trace("Previous parent (" + visitedParent + ", " + this + ")");
    }

    // If not visited, flag as visited and add self-link
    if (!visited) {
      visited = true;
      
      // Add link to self
      edges.add(new DagKeywordEdge(this, this));
      logger.trace("Comp Self (" + this + ", " + this + ")");

      // Add this node to the set of visited parents.
      visitedParents.add(this);
    }

    // Make copy of set of visited parents to use to reset after walking up
    // tree.
    Set<DagKeywordComposite> savedVisitedParents =
      new HashSet<DagKeywordComposite>(visitedParents);

    // Iterate through parents.
    for (DagKeywordComponent parent : parents) {
      logger.trace("Processing parent " + parent.keywordId + " for this node "
                   + keywordId);
      // Generate link of this node to its direct parent
      edges.add(new DagKeywordEdge(this, parent));
      logger.trace("this to Direct parent (" + this + ", " + parent + ")");
      // Generate link of leaf node to direct parent of this node
      edges.add(new DagKeywordEdge(leaf, parent));
      logger.trace("leaf to Direct parent (" + leaf + ", " + parent + ")");
      // Generate parent's edges to its indirect parents
      edges.addAll(parent.getEdges(leaf, visitedParents));
      logger.trace("Back to node " + this.keywordId);
      // Reset the visited parents to the saved set. This resets the list
      // to the set that should be passed to the next parents, getting rid
      // of any parents added while walking up the tree from the last parent.
      visitedParents.clear();
      visitedParents.addAll(savedVisitedParents);
    }
    return edges;
  }
}
