package org.tair.utilities;

/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 * 
 * Accessible is an interface that guarantees accessor methods to object
 * properties needed for creation of TAIR accession numbers.  By implementing
 * this interface, objects of different types can use <code>AccessionManager</code>
 * for the creation and translation of TAIR accession numbers for display, or 
 * for creation of <code>Detail</code> objects by <code>DetailFactory</code>
 *
 * @see AccessionManager
 * @see DetailFactory
 */


public interface Accessible {

  /**
   * Retrieves the object's top most, or super id (i.e. tair_object_id,
   * reference_id or community_id)
   *
   * @return Object's super id
   */
  public Long getSuperID();

  /**
   * Retrieves object's simple element type, used by DetailFactory
   * for object creation (i.e. "marker")
   *
   * @return Object's simple element type
   */
  public String getElementType();

  /**
   * Retrieves object's TAIR accession number (usually created by
   * AccessionManager using super id & formatted element type), that
   * can be used by TairServlet to create a Detail object for display
   *
   * @return Object's TAIR accession number
   */
  public String getAccession();

}
