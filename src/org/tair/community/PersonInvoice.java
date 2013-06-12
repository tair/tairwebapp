// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.44 $
// $Date: 2004/02/05 18:57:15 $
// ------------------------------------------------------------------------------

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.abrc.payment.InvoiceCollection;
import org.tair.bs.community.BsAffiliation;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * PersonInvoice wraps a person with his or her invoices to link the community
 * subsystem with the invoicing subsystem for the JSPs.
 */

public class PersonInvoice {

  private BigInteger personId = null;
  private InvoiceCollection invoices;
  private ArrayList<BsAffiliation> affiliations_with_unpaid;

  /**
   * Default constructor creates an empty person record to be populated
   * externally. Creates an empty instance of <code>TfcPerson</code> and passes
   * to <code>CompositeCommunity</code> to be referenced for
   * <code>TfcCommunity</code> attributes and actions
   * @param person the person to link to the invoice
   * 
   * @throws SQLException
   */
  public PersonInvoice(BsPerson person) throws SQLException {
    if (person == null) {
      throw new RuntimeException("Null person in creating person-invoice");
    }
    personId = person.getPersonId();
    get_information(person.getCommunityId());
  }

  /**
   * Retrieves all information for person with supplied communityID. Calling
   * this method will result in a call to CompositeCommunity.get_information to
   * initialize community data.
   * 
   * @param conn An active connection to the database
   * @param communityID community id for which to get information
   * @exception SQLException thrown if a database error occurs while retrieving
   *              data
   */
  private void get_information(BigInteger communityID) throws SQLException {
    DBconnection conn = null;
    DBReadManager connectionPool = null;

    try {

      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      // get list of current (not new or canceled invoices) invoices
      invoices =
        new InvoiceCollection(conn, personId.longValue(), "person_inprogress");
      set_unpaid_parent_orgs(conn);
    } finally {
      DBReadManager.return_connection(conn);
    }
  }

  /**
   * @param conn
   * @throws SQLException
   */
  public void set_unpaid_parent_orgs(DBconnection conn) throws SQLException {
    ArrayList<BsAffiliation> active = new ArrayList<BsAffiliation>();

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(personId);
    BsPerson person = delegate.getObject((SequencePrimaryKey)key);

    if (person == null) {
      throw new RuntimeException("Could not get person associated with invoice");
    }

    if (person.getCommunity().getAffiliation().size() > 0) {
      for (BsAffiliation affiliation : person.getCommunity().getAffiliation()) {
        InvoiceCollection col = null;

        BigInteger orgId = affiliation.getOrganizationId();
        col =
          new InvoiceCollection(conn,
                                orgId.longValue(),
                                "organization_inprogress");
        if (!col.isEmpty() && col.get_hasUnpaidInvoices() == true) {
          active.add(affiliation);
        }
      }
    }
    affiliations_with_unpaid = active;
  }

  /**
   * @return
   */
  public Iterator<BsAffiliation> get_unpaid_parent_orgs() {
    return (affiliations_with_unpaid != null) ? affiliations_with_unpaid.iterator()
        : null;
  }

  /**
   * Does the person have unpaid invoices?
   * 
   * @return true if there are unpaid invoices
   */
  public boolean get_hasUnpaidInvoices() {
    if (invoices != null) {
      System.out.println(invoices.get_hasUnpaidInvoices());
      return invoices.get_hasUnpaidInvoices();
    } else {
      return false;
    }
  }
}
