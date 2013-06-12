/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.jboss.logging.Logger;
import org.junit.Test;


/**
 * Test the DagKeywordLeaf class, a subclass of the DagKeywordComponent abstract
 * class.
 * 
 * @author Robert J. Muller
 */
public class DagKeywordLeafTest {
  private static final Logger logger =
    Logger.getLogger(DagKeywordLeafTest.class);

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordLeaf#DagKeywordLeaf(java.math.BigInteger)}
   * .
   */
  @Test
  public void testDagKeywordLeaf() {
    DagKeywordLeaf leaf = new DagKeywordLeaf(new BigInteger("1"));
    assertTrue("Couldn't create leaf", leaf != null);
    assertTrue("Did not set keyword id properly",
               leaf.keywordId.longValue() == 1);
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordLeaf#addChild(org.tair.search.tree.DagKeywordComponent)}
   * .
   */
  @Test
  public void testAddChild() {
    DagKeywordLeaf leaf = new DagKeywordLeaf(new BigInteger("1"));
    assertTrue("Couldn't create leaf", leaf != null);
    DagKeywordComponent child = new DagKeywordLeaf(new BigInteger("2"));
    try {
      leaf.addChild(child);
      fail("Did not throw exception adding child to leaf node");
    } catch (Exception e) {
      // Should throw exception
      assertTrue(true);
    }
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordLeaf#childIterator()}
   * .
   */
  @Test
  public void testChildIterator() {
    DagKeywordLeaf leaf = new DagKeywordLeaf(new BigInteger("1"));
    assertTrue("Couldn't create leaf", leaf != null);
    Iterator<DagKeywordComponent> itr = leaf.childIterator();
    assertTrue("Leaf iterator has a child", !itr.hasNext());
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordLeaf#isLeaf()}.
   */
  @Test
  public void testIsLeaf() {
    DagKeywordLeaf leaf = new DagKeywordLeaf(new BigInteger("1"));
    assertTrue("Couldn't create leaf", leaf != null);
    assertTrue("Test for being leaf failed", leaf.isLeaf());
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordLeaf#getEdges(org.tair.search.tree.DagKeywordLeaf, java.util.Set)}
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

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordLeaf#getEdges(org.tair.search.tree.DagKeywordLeaf, java.util.Set)}
   * Test with a cycle to ensure no infinite loops are present.
   * .
   */
  @Test
  public void testGetEdgesCyclic() {
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
    
    // Add cycle.
    level1b.addParent(level2b);
    try {
      level2b.addChild(level1b);
      fail("Failed to detect cycle");
    } catch (Exception e) {
      assertTrue("Failed to throw exception", true);
      logger.info(e.getMessage());
    }
  }
}
