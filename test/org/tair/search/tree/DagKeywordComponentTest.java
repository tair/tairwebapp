/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import static org.junit.Assert.assertTrue;

import java.math.BigInteger;
import java.util.Iterator;

import org.junit.Test;


/**
 * Tests the methods implemented in the abstract class DagKeywordComponent; uses
 * the DatKeywordLeaf concrete class to instantiate the class but tests only the
 * superclass methods.
 * 
 * @author Robert J. Muller
 */
public class DagKeywordComponentTest {

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComponent#DagKeywordComponent(java.math.BigInteger)}
   * .
   */
  @Test
  public void testDagKeywordComponent() {
    BigInteger id = new BigInteger("1001");
    createComponent(id);
  }

  /**
   * Create a component using a BigInteger keyword id
   * 
   * @param id the id to use to create the component
   * @return a new leaf component embedding the id
   */
  private DagKeywordComponent createComponent(BigInteger id) {
    DagKeywordComponent component = new DagKeywordLeaf(id);
    assertTrue("Could not create component", component != null);
    assertTrue("Component not created with correct id",
               id.equals(component.keywordId));
    return component;
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordComponent#hashCode()}
   * .
   */
  @Test
  public void testHashCode() {
    BigInteger id = new BigInteger("1001");
    DagKeywordComponent component = createComponent(id);
    int hashCode = component.hashCode();
    assertTrue("Component hash code not of keyword id",
               hashCode == id.hashCode());
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComponent#parentIterator()}.
   * {@link org.tair.search.tree.DagKeywordComponent#addParent(org.tair.search.tree.DagKeywordComposite)}
   */
  @Test
  public void testAddParentAndParentIterator() {
    BigInteger id1 = new BigInteger("1");
    DagKeywordComponent component = createComponent(id1);
    BigInteger id2 = new BigInteger("2");
    DagKeywordComposite parent = new DagKeywordComposite(id2);
    component.addParent(parent);
    Iterator<DagKeywordComposite> itr = component.parentIterator();
    assertTrue("Cound not create iterator", itr != null);
    assertTrue("Iterator had no objects", itr.hasNext());
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComponent#getKeywordId()}.
   */
  @Test
  public void testGetKeywordId() {
    BigInteger id = new BigInteger("1001");
    DagKeywordComponent component = new DagKeywordLeaf(id);
    int hashCode = component.hashCode();
    assertTrue("Component hash code not of keyword id",
               hashCode == id.hashCode());
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordComponent#isRoot()}.
   */
  @Test
  public void testIsRoot() {
    BigInteger id1 = new BigInteger("1");
    DagKeywordComponent component = createComponent(id1);
    assertTrue("root not flagged as root", component.isRoot());
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordComponent#isLeaf()}.
   */
  @Test
  public void testIsLeaf() {
    BigInteger id1 = new BigInteger("1");
    // Create leaf component
    DagKeywordComponent component = createComponent(id1);
    assertTrue("leaf not flagged as leaf", component.isLeaf());
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComponent#compareTo(org.tair.search.tree.DagKeywordComponent)}
   * .
   */
  @Test
  public void testCompareTo() {
    BigInteger id1 = new BigInteger("1");
    // Create leaf component
    DagKeywordComponent component = createComponent(id1);
    BigInteger id2 = new BigInteger("2");
    // Create leaf component
    DagKeywordComponent component2 = createComponent(id2);
    assertTrue("compare to failed",
               component.compareTo(component2) == id1.compareTo(id2));
  }

  /**
   * Test method for
   * {@link org.tair.search.tree.DagKeywordComponent#equals(java.lang.Object)}.
   */
  @Test
  public void testEqualsObject() {
    BigInteger id1 = new BigInteger("1");
    // Create leaf component
    DagKeywordComponent component = createComponent(id1);
    // Create leaf component with same keyword id
    DagKeywordComponent component2 = createComponent(id1);
    assertTrue("equals of same keyword id failed", component.equals(component2));
  }

  /**
   * Test method for {@link org.tair.search.tree.DagKeywordComponent#toString()}
   * .
   */
  @Test
  public void testToString() {
    BigInteger id1 = new BigInteger("1");
    // Create leaf component
    DagKeywordComponent component = createComponent(id1);
    assertTrue("Wrong string generated for component: " + component.toString(),
               component.toString().equals("DagKeywordComponent (1)"));
  }

}
