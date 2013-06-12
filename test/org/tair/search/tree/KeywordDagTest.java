/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import static org.junit.Assert.assertTrue;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Map;
import java.util.Set;

import org.jboss.logging.Logger;
import org.junit.Test;


/**
 * Test the KeywordDag class.
 * 
 * @author Robert J. Muller
 */
public class KeywordDagTest {
  private static final Logger logger = Logger.getLogger(KeywordDagTest.class);

  /**
   * Test method for {@link org.tair.search.tree.KeywordDag#getKeywords()}.
   * 
   * @throws SQLException when there is a database problem with the query
   */
  @Test
  public void testGetKeywords() throws SQLException {
    long start = System.currentTimeMillis();
    Runtime run = Runtime.getRuntime();
    long startMem = run.totalMemory();
    Map<BigInteger, DagKeywordComponent> map = KeywordDag.getKeywords();
    long time = System.currentTimeMillis() - start;
    long endMem = run.totalMemory();
    long addedMem = endMem - startMem;
    logger.info("Time to query keywords: " + time + "ms");
    logger.info("Starting memory: " + startMem);
    logger.info("Ending memory: " + endMem);
    logger.info("Total memory added: " + addedMem + " bytes");
    logger.info("Mapped and linked " + map.size()
                + " distinct composite keywords");
    assertTrue("Couldn't get keyword map", map != null);
    assertTrue("Map had no elements", map.size() > 0);
  }

  /**
   * Test method for {@link org.tair.search.tree.KeywordDag#getLeaves()}.
   * 
   * @throws SQLException when there is a database problem with the query
   */
  @Test
  public void testGetLeaves() throws SQLException {
    long start = System.currentTimeMillis();
    Set<DagKeywordLeaf> leaves = KeywordDag.getLeaves();
    long time = System.currentTimeMillis() - start;
    logger.info("Queried " + leaves.size() + " distinct leaf keywords");
    logger.info("Time to query leaves: " + time + "ms");
    assertTrue("Could not get leaves set", leaves != null);
    assertTrue("Leaves set empty", leaves.size() > 0);
  }
}
