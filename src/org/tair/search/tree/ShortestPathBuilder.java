/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search.tree;


import org.jboss.logging.Logger;



/*  TODO this is still a work in progress; I need to figure out why certain
  branches aren't getting into the new tree and why many links are that
  weren't in the old tree (aside from the ones not directly used).
  
  TODO Add logic to set the has_direct_links flag in the Keyword table, another
  part of the ShortestPath script in pub2tair (updateShortestPath.pl script).
  This flag is set for each keyword to which an object links (the link
  tables include TairObject_Keyword, Community_Keyword, Reference_Keyword,
  BioSample_Keyword). These need to be updated when the underlying links are
  created and destroyed (part of the pub2tair ETL synch, I think).
  
  TODO Add logic to set the has_child_links flag on the Keyword. This flag
  is set for each shortest-path link (TairDbLib.pm populateShortestPath()).
*/ 

/**
 * Build the ShortestPath work table, which contains all the paths from a
 * keyword to its parents, expanding the keyword DAG to facilitate semantic
 * queries of a keyword and its descendants. This class contains the main
 * driver callable from an external environment such as ant.
 * 
 * @author Robert J. Muller
 */
public class ShortestPathBuilder {
  /** log4j logger */
  private static final Logger logger =
    Logger.getLogger(ShortestPathBuilder.class);

  /**
   * Run the table building program to build the ShortestPath table.
   * 
   * @param args ignored parameter
   */
  public static void main(String[] args) {
    long start = System.nanoTime();
    ShortestPathDelegate.insertShortestPath();
    logger.debug("Built table in " + ((System.nanoTime() - start) / 1000000000)
                 + " seconds");
  }
}
