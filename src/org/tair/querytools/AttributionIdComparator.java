// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.1 $
// $Date: 2004/11/02 20:06:56 $
// ------------------------------------------------------------------------------

package org.tair.querytools;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Comparator;

import org.tair.bs.community.AttributionDelegate;
import org.tair.bs.community.BsAttribution;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.db.community.CommunityFactory;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * Comparator to sort attributions by name given attribution ids only
 */

public class AttributionIdComparator implements Comparator<BigInteger> {

  /**
   * Compares two BsAttribution objects and sorts them by attributor's community
   * name (person or organization name)
   * 
   * @param obj1 BsAttribution to compare to obj2
   * @param obj2 BsAttribution to compare to obj1
   * @return -1 if obj1 should be sorted before obj2, 0 if items are equal and 1
   *         if obj2 should be sorted before obj1
   */
  public int compare(BigInteger id1, BigInteger id2) {
    int result = 0;

    // Look up the attributions.
    BsAttribution attr1 = getAttribution(id1);
    BsAttribution attr2 = getAttribution(id2);

    if (attr1 != null && attr2 != null) {
      try {
        BsCommunity com1 = attr1.getCommunity();
        BsCommunity com2 = attr2.getCommunity();
        result = com1.getName().compareToIgnoreCase(com2.getName());
      } catch (SQLException e) {
        throw new RuntimeException("Could not lazily load community for attribution");
      }
    }
    return result;
  }

  /**
   * Get an attribution object based on the unique primary key value
   * 
   * @param id a primary key value for an attribution
   * @return an attribution object corresponding to the primary key value or
   *         null if the input id is null
   */
  private static final BsAttribution getAttribution(BigInteger id) {
    BsAttribution attribution = null;
    if (id != null) {
      AttributionDelegate delegate =
        CommunityDelegateFactory.getAttributionDelegate();
      IPrimaryKey key = CommunityFactory.getAttributionPrimaryKey(id);
      attribution = delegate.getObject((SequencePrimaryKey)key);
    }
    return attribution;
  }
}
