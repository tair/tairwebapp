// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/11/02 20:06:56 $
// ------------------------------------------------------------------------------

package org.tair.querytools;


import java.sql.SQLException;
import java.util.Comparator;

import org.tair.bs.community.BsAttribution;
import org.tair.bs.community.BsCommunity;


/**
 * Comparator to sort attribution objects by name
 */

public class AttributionComparator implements Comparator<BsAttribution> {

  /**
   * Compares two BsAttribution objects and sorts them by attributor's community
   * name (person or organization name)
   * 
   * @param obj1 BsAttribution to compare to obj2
   * @param obj2 BsAttribution to compare to obj1
   * @return -1 if obj1 should be sorted before obj2, 0 if items are equal and 1
   *         if obj2 should be sorted before obj1
   */
  public int compare(BsAttribution obj1, BsAttribution obj2) {
    int result = 0;

    if (obj1 != null && obj2 != null) {
      try {
        BsCommunity com1 = obj1.getCommunity();
        BsCommunity com2 = obj2.getCommunity();
        result = com1.getName().compareToIgnoreCase(com2.getName());
      } catch (SQLException e) {
        throw new RuntimeException("Could not lazily load community for attribution");
      }
    }
    return result;
  }
}
