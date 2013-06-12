/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import org.jboss.logging.Logger;


/**
 * Implements the Leaf in the Composite Design Pattern for a Directed Acyclic
 * Graph (DAG). Each keyword leaf is a node that has no children. The node may
 * or may not have parents.
 * 
 * @author Robert J. Muller
 */
public class DagKeywordLeaf extends DagKeywordComponent {
  private static final Logger logger = Logger.getLogger(DagKeywordLeaf.class);

  /** Default serial version UID */
  private static final long serialVersionUID = 1L;

  /**
   * Create a DagKeywordLeaf object.
   * 
   * @param keywordId the primary key of the keyword corresponding to the leaf
   */
  public DagKeywordLeaf(BigInteger keywordId) {
    super(keywordId);
  }

  @Override
  public Iterator<DagKeywordComponent> childIterator() {
    return new ArrayList<DagKeywordComponent>(1).iterator();
  }

  @Override
  public boolean isLeaf() {
    return true;
  }

  @Override
  public void addChild(DagKeywordComponent child) {
    throw new RuntimeException("Cannot add child to leaf node keyword");
  }

  @Override
  public Set<DagKeywordEdge> getEdges(DagKeywordLeaf leaf,
                                      Set<DagKeywordComposite> visitedParents) {
    Set<DagKeywordEdge> edges = new TreeSet<DagKeywordEdge>();

    // Add link to self
    edges.add(new DagKeywordEdge(this, this));
    logger.trace("leaf Self (" + this + ", " + this + ")");

    // Iterate through parents
    for (DagKeywordComposite parent : parents) {
      // Add link from leaf to direct parent.
      edges.add(new DagKeywordEdge(this, parent));
      logger.trace("leaf Direct parent (" + this + ", " + parent + ")");
      // Clear the visited list, start from scratch with an empty set.
      visitedParents.clear();
      // Add links from indirect parents.
      edges.addAll(parent.getEdges(this, visitedParents));
      logger.trace("Back to leaf " + keywordId);
    }
    return edges;
  }
}
