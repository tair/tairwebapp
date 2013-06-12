/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import static org.junit.Assert.assertTrue;

import java.math.BigInteger;

import org.junit.Test;


/**
 * Test the methods in the DagKeywordEdge class.
 * 
 * @author Robert J. Muller
 */
public class DagKeywordEdgeTest {

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordEdge#hashCode()}.
   */
  @Test
  public void testHashCode() {
    DagKeywordComponent child = new DagKeywordLeaf(new BigInteger("12345"));
    DagKeywordComponent parent =
      new DagKeywordComposite(new BigInteger("23456"));
    DagKeywordEdge edge = new DagKeywordEdge(child, parent);
    assertTrue("Could not create edge", edge != null);
    int hashCode = edge.hashCode();
    // Hard-code computed hash code from algorithm in test
    assertTrue("Invalid hash code: " + hashCode, hashCode == 911704);
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordEdge#DagKeywordEdge(org.tair.search.tree.DagKeywordComponent, org.tair.search.tree.DagKeywordComponent)}
   * .
   */
  @Test
  public void testDagKeywordEdge() {
    BigInteger childId = new BigInteger("12345");
    BigInteger parentId = new BigInteger("23456");
    DagKeywordComponent child = new DagKeywordLeaf(childId);
    DagKeywordComponent parent = new DagKeywordComposite(parentId);
    DagKeywordEdge edge = new DagKeywordEdge(child, parent);
    assertTrue("Could not create edge", edge != null);
    assertTrue("Child id not registered",
               edge.getChild().getKeywordId().equals(childId));
    assertTrue("Parent id not registered",
               edge.getParent().getKeywordId().equals(parentId));
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordEdge#getChild()}.
   */
  @Test
  public void testGetChild() {
    BigInteger childId = new BigInteger("12345");
    BigInteger parentId = new BigInteger("23456");
    DagKeywordComponent child = new DagKeywordLeaf(childId);
    DagKeywordComponent parent = new DagKeywordComposite(parentId);
    DagKeywordEdge edge = new DagKeywordEdge(child, parent);
    assertTrue("Could not create edge", edge != null);
    assertTrue("Child id not registered",
               edge.getChild().getKeywordId().equals(childId));
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordEdge#setChild(org.tair.search.tree.DagKeywordComponent)}
   * .
   */
  @Test
  public void testSetChild() {
    BigInteger childId = new BigInteger("12345");
    BigInteger childId2 = new BigInteger("87654");
    BigInteger parentId = new BigInteger("23456");
    DagKeywordComponent child = new DagKeywordLeaf(childId);
    DagKeywordComponent child2 = new DagKeywordLeaf(childId2);
    DagKeywordComponent parent = new DagKeywordComposite(parentId);
    DagKeywordEdge edge = new DagKeywordEdge(child, parent);
    assertTrue("Could not create edge", edge != null);
    assertTrue("Child id not registered",
               edge.getChild().getKeywordId().equals(childId));
    // Test setter
    edge.setChild(child2);
    assertTrue("Replacement child id not registered",
               edge.getChild().keywordId.equals(childId2));
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordEdge#getParent()}.
   */
  @Test
  public void testGetParent() {
    BigInteger childId = new BigInteger("12345");
    BigInteger parentId = new BigInteger("23456");
    DagKeywordComponent child = new DagKeywordLeaf(childId);
    DagKeywordComponent parent = new DagKeywordComposite(parentId);
    DagKeywordEdge edge = new DagKeywordEdge(child, parent);
    assertTrue("Could not create edge", edge != null);
    assertTrue("Parent id not registered",
               edge.getParent().getKeywordId().equals(parentId));
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordEdge#setParent(org.tair.search.tree.DagKeywordComponent)}
   * .
   */
  @Test
  public void testSetParent() {
    BigInteger childId = new BigInteger("12345");
    BigInteger parentId2 = new BigInteger("87654");
    BigInteger parentId = new BigInteger("23456");
    DagKeywordComponent child = new DagKeywordLeaf(childId);
    DagKeywordComponent parent = new DagKeywordComposite(parentId);
    DagKeywordComponent parent2 = new DagKeywordComposite(parentId2);
    DagKeywordEdge edge = new DagKeywordEdge(child, parent);
    assertTrue("Could not create edge", edge != null);
    assertTrue("Parent id not registered",
               edge.getParent().getKeywordId().equals(parentId));
    // Test setter
    edge.setParent(parent2);
    assertTrue("Replacement parent id not registered",
               edge.getParent().keywordId.equals(parentId2));
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordEdge#compareTo(org.tair.search.tree.DagKeywordEdge)}
   * .
   */
  @Test
  public void testCompareTo() {
    BigInteger childId1 = new BigInteger("1");
    BigInteger parentId2 = new BigInteger("2");
    BigInteger childId3 = new BigInteger("3");
    BigInteger parentId4 = new BigInteger("4");
    DagKeywordComponent child1 = new DagKeywordLeaf(childId1);
    DagKeywordComponent parent2 = new DagKeywordComposite(parentId2);
    DagKeywordComponent child3 = new DagKeywordLeaf(childId3);
    DagKeywordComponent parent4 = new DagKeywordComposite(parentId4);

    // Test cases 1-5
    // Parents the same, child a > child b
    DagKeywordEdge edge1a = new DagKeywordEdge(child3, parent2);
    assertTrue("Could not create edge", edge1a != null);
    DagKeywordEdge edge1b = new DagKeywordEdge(child1, parent2);
    assertTrue("Could not create edge", edge1b != null);
    assertTrue("child a > child b failed: " + edge1a.compareTo(edge1b), edge1a.compareTo(edge1b) > 0);
    // Parents the same, child a < child b
    DagKeywordEdge edge2a = new DagKeywordEdge(child1, parent2);
    assertTrue("Could not create edge", edge2a != null);
    DagKeywordEdge edge2b = new DagKeywordEdge(child3, parent2);
    assertTrue("Could not create edge", edge2b != null);
    assertTrue("child a < child b failed: " + edge2a.compareTo(edge2b), edge2a.compareTo(edge2b) < 0);
    // Parents the same, child a == child b
    DagKeywordEdge edge3a = new DagKeywordEdge(child1, parent2);
    assertTrue("Could not create edge", edge3a != null);
    DagKeywordEdge edge3b = new DagKeywordEdge(child1, parent2);
    assertTrue("Could not create edge", edge3b != null);
    assertTrue("child a == child b failed: " + edge3a.compareTo(edge3b), edge3a.compareTo(edge3b) == 0);
    // parent a > parent b
    DagKeywordEdge edge4a = new DagKeywordEdge(child1, parent4);
    assertTrue("Could not create edge", edge4a != null);
    DagKeywordEdge edge4b = new DagKeywordEdge(child1, parent2);
    assertTrue("Could not create edge", edge4b != null);
    assertTrue("parent a > parent b failed: " + edge4a.compareTo(edge4b), edge4a.compareTo(edge4b) > 0);
    // parent a < parent b
    DagKeywordEdge edge5a = new DagKeywordEdge(child1, parent2);
    assertTrue("Could not create edge", edge5a != null);
    DagKeywordEdge edge5b = new DagKeywordEdge(child1, parent4);
    assertTrue("Could not create edge", edge5b != null);
    assertTrue("parent a > parent b failed: " + edge5a.compareTo(edge5b), edge5a.compareTo(edge5b) < 0);
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordEdge#equals(java.lang.Object)}.
   */
  @Test
  public void testEqualsObject() {
    BigInteger childId1 = new BigInteger("1");
    BigInteger parentId2 = new BigInteger("2");
    BigInteger parentId4 = new BigInteger("4");
    DagKeywordComponent child1 = new DagKeywordLeaf(childId1);
    DagKeywordComponent parent2 = new DagKeywordComposite(parentId2);
    DagKeywordComponent parent4 = new DagKeywordComposite(parentId4);
    
    // test case equals
    DagKeywordEdge edge1 = new DagKeywordEdge(child1, parent2);
    DagKeywordEdge edge2 = new DagKeywordEdge(child1, parent2);
    assertTrue("equal test failed", edge1.equals(edge2));
    
    // test case not equals
    DagKeywordEdge edge3 = new DagKeywordEdge(child1, parent4);
    assertTrue("not-equal test failed", !edge1.equals(edge3));
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordEdge#toString()}.
   */
  @Test
  public void testToString() {
    BigInteger childId = new BigInteger("12345");
    BigInteger parentId = new BigInteger("23456");
    DagKeywordComponent child = new DagKeywordLeaf(childId);
    DagKeywordComponent parent = new DagKeywordComposite(parentId);
    DagKeywordEdge edge = new DagKeywordEdge(child, parent);
    assertTrue("Could not create edge", edge != null);
    assertTrue("String not correct: " + edge.toString(), edge.toString().equals("Edge (child 12345, parent 23456)"));
  }
}
