/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.tree;


import java.sql.SQLException;
import java.util.ArrayList;


/** Represents a node with multiple parents (a parent list) */
public interface MultiParentNode extends Node {

  /**
   * Set a node id into the list of parent nodes.
   * 
   * @param id the id to set into the list
   * @throws SQLException when there is a problem inserting the id
   */
  public void setParentList(Long id) throws SQLException;

  /**
   * Get the list of parents.
   * 
   * @return the list of parents
   */
  public ArrayList<Long> getParentList();

  /**
   * Does this node have multiple parents?
   * 
   * @return true if there are multiple parents, false if not
   */
  public boolean hasMultipleParents();

  /**
   * Set the node and parent ids for the top node.
   * 
   * @param node_id the node id for the top node
   * @param parent_id the parent id for the top node
   * @throws SQLException when there is a problem inserting the node
   */
  public void setTopNodeData(Long node_id, Long parent_id) throws SQLException;

  /**
   * Set the depth of the node.
   * 
   * @param depth the tree depth of the node
   */
  public void setDepth(int depth);

}
