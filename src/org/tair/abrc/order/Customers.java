/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.abrc.order;


import java.math.BigInteger;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.tair.bs.community.BsAddress;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.DB;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


public class Customers {
  /**
   * Get a BsPerson object given the person id for the person.
   * 
   * @param pid a BigInteger identifier for the person
   * @return the BsPerson object
   */
  public static BsPerson getPerson(BigInteger pid) {
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(pid);
    return delegate.getObject((SequencePrimaryKey)key);
  }

  /**
   * Get a person's shipping address given the person id for the person.
   * @param pid a BigInteger identifier for the person
   * @return the BsAddress address for the person
   */
  public static BsAddress getShippingAddress(BigInteger pid) {
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(pid);
    BsPerson person = delegate.getObject((SequencePrimaryKey)key);
    return person.getCommunity().getAddress();
  }

  public static Map<BigInteger, String> getAffiliations(BigInteger person) {
    // TODO replace with custom query on PersonDelegate
    String query =
      "SELECT o.organization_id, o.name " + "  FROM Organization o "
          + "  JOIN Affiliation a1 ON o.organization_id = a1.organization_id "
          + "  JOIN Affiliation a2 ON o.organization_id = a2.organization_id "
          + "  JOIN Community c ON c.community_id = o.community_id "
          + "  JOIN Person p ON a2.community_id = p.community_id "
          + " WHERE p.person_id = ? " + "   AND c.status = '"
          + DataConstants.getActiveStatus() + "' "
          + "   AND o.organization_type = 'lab' " + "   AND a1.is_pi = 'T'";
    DBconnection conn = DB.getRead();
    try {
      conn.setQuery(query);
      conn.setQueryVariable(1, person);
      ResultSet rs = conn.getResultSet();
      Map<BigInteger, String> orgs = new HashMap<BigInteger, String>();
      while (rs.next())
        orgs.put(rs.getBigDecimal("organization_id").toBigInteger(), rs.getString("name"));
      return orgs;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } finally {
      DB.release(conn);
    }
  }
}
