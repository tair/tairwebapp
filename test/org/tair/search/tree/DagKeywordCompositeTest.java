/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import static org.junit.Assert.assertTrue;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.jboss.logging.Logger;
import org.junit.Test;


/**
 * 
 * @author Robert J. Muller
 */
public class DagKeywordCompositeTest {
  private static final Logger logger =
    Logger.getLogger(DagKeywordCompositeTest.class);


  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComposite#DagKeywordComposite(java.math.BigInteger)}
   * .
   */
  @Test
  public void testDagKeywordComposite() {
    BigInteger compositeId = new BigInteger("1");
    DagKeywordComposite composite = new DagKeywordComposite(compositeId);
    assertTrue("Could not create composite", composite != null);
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComposite#childIterator()}.
   */
  @Test
  public void testAddChildAndChildIterator() {
    BigInteger compositeId = new BigInteger("1");
    BigInteger leafId = new BigInteger("2");
    DagKeywordComposite composite = new DagKeywordComposite(compositeId);
    assertTrue("Could not create composite", composite != null);
    DagKeywordLeaf leaf = new DagKeywordLeaf(leafId);
    assertTrue("Could not create leaf", leaf != null);
    composite.addChild(leaf);
    leaf.addParent(composite);
    Iterator<DagKeywordComponent> itr = composite.childIterator();
    assertTrue("Could not create iterator", itr != null);
    assertTrue("Could not iterate over children", itr.hasNext());
    while (itr.hasNext()) {
      DagKeywordComponent retrievedComponent = itr.next();
      assertTrue("Could not retrieve component through iterator",
                 retrievedComponent != null);
      assertTrue("Did not get right component through iterator",
                 retrievedComponent.equals(leaf));
    }
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordComposite#isLeaf()}.
   */
  @Test
  public void testIsLeaf() {
    BigInteger compositeId = new BigInteger("1");
    DagKeywordComposite composite = new DagKeywordComposite(compositeId);
    assertTrue("Could not create composite", composite != null);
    assertTrue("Leaf flag set on for composite", !composite.isLeaf());
 }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComposite#getEdges(org.tair.search.tree.DagKeywordLeaf, java.util.Set)}
   * .
   */
  @Test
  public void testGetEdges() {
    // Implement a tree big enough to deal with two levels of indirect
    // parents, a single root, and two parents at one level.
    DagKeywordComposite root = new DagKeywordComposite(new BigInteger("0"));
    DagKeywordComposite level1a = new DagKeywordComposite(new BigInteger("1"));
    DagKeywordComposite level1b = new DagKeywordComposite(new BigInteger("2"));
    root.addChild(level1a);
    level1a.addParent(root);
    root.addChild(level1b);
    level1b.addParent(root);
    DagKeywordComposite level2a = new DagKeywordComposite(new BigInteger("3"));
    DagKeywordComposite level2b = new DagKeywordComposite(new BigInteger("4"));
    level1a.addChild(level2a);
    level2a.addParent(level1a);
    level1b.addChild(level2b);
    level2b.addParent(level1b);
    DagKeywordLeaf leaf1 = new DagKeywordLeaf(new BigInteger("5"));
    DagKeywordLeaf leaf2 = new DagKeywordLeaf(new BigInteger("6"));
    level2a.addChild(leaf1);
    level2b.addChild(leaf1);
    leaf1.addParent(level2a);
    leaf1.addParent(level2b);
    level2b.addChild(leaf2);
    leaf2.addParent(level2b);
    Set<DagKeywordComposite> parents = new HashSet<DagKeywordComposite>();
    Set<DagKeywordEdge> edges = leaf1.getEdges(leaf1, parents);
    assertTrue("Edges set is null", edges != null);
    assertTrue("Could not get edges", edges.size() > 0);
    logger.trace("Leaf edge expansion for leaf 5:");
    for (DagKeywordEdge edge : edges) {
      logger.trace(edge);
    }
    logger.trace("Done");
    assertTrue("Did not get correct number of edges (17): " + edges.size(),
               edges.size() == 17);
  }
}
