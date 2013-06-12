/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;


import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;
import java.util.*;

import org.jboss.logging.Logger;
import org.tair.community.*;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * ListCommunityCollection is a custom collection class that stores community
 * records associated to a given element as a collection of
 * <code>ListCommunity</code> objects.
 * 
 * <p>
 * If ListCommunityCollection is created using "donor" as the mode for
 * populating the collection, the concrete type of items in the collection will
 * be <code>Donor</code> which inherits from <code>ListCommunity</code>. This is
 * done so that if creating collection of donors, date that community record
 * donated submitted stock id is retrieved.
 * 
 * <p>
 * Implements Serializable so ListCommunity objects can be written as part of
 * serialized stock catalog data
 */

public class ListCommunityCollection implements Serializable {
  private static final Logger logger = 
    Logger.getLogger(ListCommunityCollection.class);
  private ArrayList<ListCommunity> communities;

  /**
   * Creates an empty instance of ListCommunityCollection
   */
  public ListCommunityCollection() {
    communities = new ArrayList<ListCommunity>();
  }

  /**
   * Creates an instance of ListCommunityCollection that contains community
   * records associated to id, where type of id (and what table to search for
   * associations) is determined by type. Valid values for type are:
   * <ul>
   * <li>reference - id should be reference_id</li>
   * <li>donor - id should be stock_id. If "donor", concrete type of elements in
   * collection will be <code>Donor</code>, which inherits from
   * <code>ListCommunity</code></li>
   * <li>germplasm_donor - id should be germplasm's tair_object_id; donors
   * retrieved will actually be donors of stocks associated to germplasm</li>
   * <li>collector - id should be species variant id
   * <li>affiliate_org - retrieves person's affiliated organizations - id should
   * be person's community id</li>
   * <li>experimenter - retrieves persons associated to ExpressionSet through
   * Attribution where attribution type is "experiment_done_by" - id should be
   * expression set's tair_object_id
   * 
   * @param conn An active connection to the database
   * @param id Element id to retrieve communities for
   * @param type Object type of id
   * @exception SQLException in the case of an invalid operation or database
   *              error
   */
  public ListCommunityCollection(DBconnection conn, Long id, String type)
      throws SQLException {
    communities = new ArrayList<ListCommunity>();
    if (id != null && type != null) {
      if (type.equals("reference")) {
        populateReferenceCommunities(conn, id);
      } else if (type.equals("donor")) {
        populateDonors(conn, id);
      } else if (type.equals("germplasm_donor")) {
        populateGermplasmDonors(conn, id);
      } else if (type.equals("collector")) {
        populateSpeciesVariantCollectors(conn, id);
      } else if (type.equals("affiliate_org")) {
        populateAffiliateOrganizations(conn, id);
      } else if (type.equals("experimenter")) {
        populateExperimenters(conn, id);
      } else if (type.equals("submitOrganization")) {
        populateSubmitOrganization(conn, id);
      }
    }
  }

  /*
   * Populate collection with all community records associated to reference id
   * that have status of "active" and are not obsolete.
   * 
   * Store person and organization ids separately -- this simplifies creation of
   * ListCommunity objects by allowing us to specify in the constructor whether
   * community record is for a person or org (meaning that ListCommunity doesn't
   * to waste a db query to check)
   */
  private void populateReferenceCommunities(DBconnection conn, Long reference_id)
      throws SQLException {
    ArrayList<BigInteger> personIDs = null;
    ArrayList<BigInteger> orgIDs = null;
    BigInteger id = null;
    ResultSet results = null;
    String query = null;

    if (reference_id != null) {
      query =
        "SELECT c.community_id, c.community_type "
            + "FROM Reference_Community r, Community c "
            + "WHERE r.community_id = c.community_id " + "AND c.status = "
            + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
            + "AND c.is_obsolete = 'F' " + "AND r.reference_id = "
            + reference_id.toString();
      conn.setQuery(query);
      results = conn.getResultSet();

      while (results.next()) {
        BigDecimal idDecimal = results.getBigDecimal("community_id");
        if (idDecimal != null) {
          id = idDecimal.toBigInteger();
        }
        if (results.getString("community_type").equals("person")) {
          if (personIDs == null) {
            personIDs = new ArrayList<BigInteger>();
          }
          personIDs.add(id);
        } else {
          if (orgIDs == null) {
            orgIDs = new ArrayList<BigInteger>();
          }
          orgIDs.add(id);
        }
      }
      conn.releaseResources();

      boolean personRecords = true;
      if (personIDs != null && !personIDs.isEmpty()) { // create person records
                                                       // from found ids
        createRecords(conn, personIDs, personRecords);
      }

      if (orgIDs != null && !orgIDs.isEmpty()) { // create organization records
                                                 // from found ids
        personRecords = false;
        createRecords(conn, orgIDs, personRecords);
      }
    }
  }

  /*
   * Populate collection w/community records associated to any stocks associated
   * to germplasm. Community records must be non-obsolete and have status of
   * "active"
   */
  private void populateGermplasmDonors(DBconnection conn, Long tair_object_id)
      throws SQLException {
    ArrayList<BigInteger> personIDs = null;
    ArrayList<BigInteger> orgIDs = null;
    BigInteger id = null;
    ResultSet results = null;
    String query = null;

    if (tair_object_id != null) {
      query =
        "SELECT c.community_id, c.community_type "
            + "FROM Donor d, Community c, TairObject_Stock ts, Stock s "
            + "WHERE d.community_id = c.community_id "
            + "AND ts.stock_id = s.stock_id " + "AND s.stock_id = d.stock_id "
            + "AND s.is_obsolete = 'F' " + "AND c.status = "
            + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
            + "AND c.is_obsolete = 'F' " + "AND ts.tair_object_id = "
            + tair_object_id.toString() + " " + "ORDER BY d.display_number ";
      conn.setQuery(query);
      results = conn.getResultSet();

      while (results.next()) { // store ids for full object creation below
        BigDecimal decimalId = results.getBigDecimal("community_id");
        if (decimalId != null) {
          id = decimalId.toBigInteger();
        }
        if (results.getString("community_type").equals("person")) {
          if (personIDs == null) {
            personIDs = new ArrayList<BigInteger>();
          }
          personIDs.add(id);
        } else {
          if (orgIDs == null) {
            orgIDs = new ArrayList<BigInteger>();
          }
          orgIDs.add(id);
        }
      }
      conn.releaseResources();

      boolean personRecords = true;
      if (personIDs != null && !personIDs.isEmpty()) { // create person records
                                                       // from found ids
        createRecords(conn, personIDs, personRecords);
      }

      if (orgIDs != null && !orgIDs.isEmpty()) { // create organization records
                                                 // from found ids
        personRecords = false;
        createRecords(conn, orgIDs, personRecords);
      }
    }
  }

  /*
   * Populate collection with all community records associated to stock id as
   * stock donor that have status of "active" and are not obsolete. Create
   * community records as Donor objects (which inherit from ListCommunity)
   */
  private void populateDonors(DBconnection conn, Long stock_id)
      throws SQLException {
    ArrayList<BigInteger> personIDs = null;
    ArrayList<BigInteger> orgIDs = null;
    BigInteger id = null;
    ResultSet results = null;
    String query = null;

    if (stock_id != null) {
      query =
        "SELECT c.community_id, c.community_type "
            + "FROM Donor d, Community c "
            + "WHERE d.community_id = c.community_id " + "AND c.status = "
            + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
            + "AND c.is_obsolete = 'F' " + "AND d.stock_id = "
            + stock_id.toString() + " " + "ORDER BY d.display_number ";
      conn.setQuery(query);
      results = conn.getResultSet();

      while (results.next()) { // store ids for full object creation below
        BigDecimal decimalId = results.getBigDecimal("community_id");
        if (decimalId != null) {
          id = decimalId.toBigInteger();
        }
        if (results.getString("community_type").equals("person")) {
          if (personIDs == null) {
            personIDs = new ArrayList<BigInteger>();
          }
          personIDs.add(id);
        } else {
          if (orgIDs == null) {
            orgIDs = new ArrayList<BigInteger>();
          }
          orgIDs.add(id);
        }
      }
      conn.releaseResources();

      boolean personRecords = true;
      if (personIDs != null && !personIDs.isEmpty()) { // create person records
                                                       // from found ids
        createDonors(conn, stock_id, personIDs, personRecords);
      }

      if (orgIDs != null && !orgIDs.isEmpty()) { // create organization records
                                                 // from found ids
        personRecords = false;
        createDonors(conn, stock_id, orgIDs, personRecords);
      }
    }
  }

  /*
   * Populate collection with all community records associated to species
   * variant id as collector that have status of "active" and are not obsolete.
   * Create community records as ListCommunity records
   */
  private void populateSpeciesVariantCollectors(DBconnection conn,
                                                Long speciesVariantID)
      throws SQLException {
    ArrayList<BigInteger> personIDs = null;
    ArrayList<BigInteger> orgIDs = null;
    BigInteger id = null;
    ResultSet results = null;
    String query = null;

    if (speciesVariantID != null) {
      query =
        "SELECT cm.community_id, cm.community_type "
            + "FROM Collector cl, Community cm "
            + "WHERE cl.community_id = cm.community_id " + "AND cm.status = "
            + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
            + "AND cm.is_obsolete = 'F' " + "AND cl.species_variant_id = "
            + speciesVariantID.toString();
      conn.setQuery(query);
      results = conn.getResultSet();

      while (results.next()) { // store ids for full object creation below
        BigDecimal decimalId = results.getBigDecimal("community_id");
        if (decimalId != null) {
          id = decimalId.toBigInteger();
        }
        if (results.getString("community_type").equals("person")) {
          if (personIDs == null) {
            personIDs = new ArrayList<BigInteger>();
          }
          personIDs.add(id);
        } else {
          if (orgIDs == null) {
            orgIDs = new ArrayList<BigInteger>();
          }
          orgIDs.add(id);
        }
      }
      conn.releaseResources();

      boolean personRecords = true;
      if (personIDs != null && !personIDs.isEmpty()) { // create person records
                                                       // from found ids
        createRecords(conn, personIDs, personRecords);
      }

      if (orgIDs != null && !orgIDs.isEmpty()) { // create organization records
                                                 // from found ids
        personRecords = false;
        createRecords(conn, orgIDs, personRecords);
      }
    }
  }

  // retrieve affiliated organizations for submitted person's community id
  private void populateAffiliateOrganizations(DBconnection conn,
                                              Long personCommunityID)
      throws SQLException {
    ResultSet results = null;
    String query = null;
    ArrayList<BigInteger> orgCommunityIDs = null;
    boolean personRecords = false;

    if (personCommunityID != null) {
      query =
        "SELECT o.community_id "
            + "FROM Affiliation a, Community c, Organization o "
            + "WHERE a.organization_id = o.organization_id "
            + "AND o.community_id = c.community_id "
            + "AND c.is_obsolete = 'F' " + "AND c.status = "
            + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
            + "AND a.community_id = " + personCommunityID.toString();

      conn.setQuery(query);
      results = conn.getResultSet();
      while (results.next()) {
        if (orgCommunityIDs == null) {
          orgCommunityIDs = new ArrayList<BigInteger>();
        }

        BigDecimal decimalId = results.getBigDecimal("community_id");
        if (decimalId != null) {
          orgCommunityIDs.add(decimalId.toBigInteger());
        }
      }
      conn.releaseResources();

      if (orgCommunityIDs != null && !orgCommunityIDs.isEmpty()) {
        createRecords(conn, orgCommunityIDs, personRecords);
      }
    }
  }

  /*
   * Populate collection with all community records associated to expression set
   * through Attribution where attribution type is "experiment_done_by" and
   * community_type is person
   */
  private void populateExperimenters(DBconnection conn, Long tairObjectID)
      throws SQLException {

    String query = null;

    if (tairObjectID != null) {
      query =
        "SELECT cm.community_id, p.first_name_uc "
            + "FROM Attribution a, Community cm, AttributionType ay, Person p "
            + "WHERE a.community_id = cm.community_id "
            + "AND a.attribution_type_id = ay.attribution_type_id "
            + "AND ay.attribution_type = 'experiment_done_by' "
            + "AND cm.status = "
            + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
            + "AND cm.is_obsolete = 'F' "
            + "AND p.community_id =  cm.community_id "
            + "AND a.tair_object_id = " + tairObjectID.toString()
            + "ORDER BY p.first_name_uc ";

      boolean personRecords = true;
      populateRecords(query, conn, personRecords);
    }
  }

  // helper function to populate the records
  private void populateRecords(String query, DBconnection conn, boolean isPerson)
      throws SQLException {
    ArrayList<BigInteger> ids = null;
    BigInteger id = null;
    ResultSet results = null;
    conn.setQuery(query);
    results = conn.getResultSet();

    while (results.next()) { // store ids for full object creation below
      BigDecimal decimalId = results.getBigDecimal("community_id");
      if (decimalId != null) {
        id = decimalId.toBigInteger();
      }
      if (ids == null) {
        ids = new ArrayList<BigInteger>();
      }
      ids.add(id);
    }

    conn.releaseResources();

    if (ids != null && !ids.isEmpty()) { // create person records from found ids
      createRecords(conn, ids, isPerson);
    }
  }

  /*
   * Populate collection with all community records associated to expression set
   * through Attribution where attribution type is "experiment_done_by" and
   * community_ty is organization
   */
  private void populateSubmitOrganization(DBconnection conn, Long tairObjectID)
      throws SQLException {
    String query = null;
    if (tairObjectID != null) {
      query =
        "SELECT cm.community_id, org.name_uc "
            + "FROM Attribution a, Community cm, AttributionType ay, Organization org "
            + "WHERE a.community_id = cm.community_id "
            + "AND a.attribution_type_id = ay.attribution_type_id "
            + "AND ay.attribution_type = 'experiment_done_by' "
            + "AND cm.status = "
            + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
            + "AND cm.is_obsolete = 'F' "
            + "AND org.community_id =  cm.community_id "
            + "AND a.tair_object_id = " + tairObjectID.toString()
            + "ORDER BY org.name_uc ";

      boolean personRecords = false;
      populateRecords(query, conn, personRecords);
    }
  }

  /*
   * utility method to iterate through collection of ids & create ListCommunity
   * objects to be stored in ListCommunityCollection -- personRecords determines
   * if ids are for persons or organizations
   */
  private void createRecords(DBconnection conn, ArrayList<BigInteger> ids,
                             boolean personRecords) throws SQLException {
    ListCommunity community = null;

    if (ids != null) {
      for (BigInteger id : ids) {
        community = new ListCommunity(id, personRecords);
        add(community);
      }
    }
  }

  /*
   * slightly different method to create Donor objects from submitted collection
   * of ids. ids in this case is a map that contains id as a Long key
   * referencing the date that community id donated a given stock id. Create
   * Donor object to just reflect community data and then manually populate date
   * since we already have it from retrieving community ids from Donor table
   */
  private void createDonors(DBconnection conn, Long stock_id,
                            ArrayList<BigInteger> ids, boolean personRecords)
      throws SQLException {
    Donor donor = null;

    for (BigInteger id : ids) {
      try {
        donor = new Donor(conn, id, stock_id, personRecords);
        add(donor);
      } catch (RecordNotFoundException e) {
        // Bad community id, log it and continue
        logger.warn("Could not populate a donor: " + e.getMessage(), e);
      }
    }
  }

  /**
   * Determines if collection has elements in it
   * 
   * @return <code>true</code> if collection has no communities in it;
   *         <code>false</code> if collection has at least one element in it
   */
  public boolean isEmpty() {
    return communities.isEmpty();
  }

  /**
   * Retrieves number of elements in collection
   * 
   * @return Number of elements in collection
   */
  public int size() {
    return communities.size();
  }

  /**
   * Retrieves element at supplied index. Element will be ListCommunity object,
   * or Donor object, if collection created to contain donors of a given stock
   * id
   * 
   * @return element at supplied index, or <code>null</code> if no element at
   *         supplied index
   */
  public ListCommunity get(int index) {
    return (ListCommunity)communities.get(index);
  }

  /**
   * Adds supplied element to collection
   * 
   * @param community element to add to collection
   */
  public void add(ListCommunity community) {
    communities.add(community);
  }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   * 
   * @param community element to remove from collection
   */
  public void remove(ListCommunity community) {
    communities.remove(community);
  }

  /**
   * Determines if supplied element is in collection
   * 
   * @return <code>true</code> if supplied element is in collection;
   *         <code>false</code> if element is not found
   */
  public boolean contains(ListCommunity community) {
    return communities.contains(community);
  }

  /**
   * Retrieves all elements in collection. If collection was populated to
   * contain stock donors, concrete type of elements will be <code>Donor</code>,
   * which inherits from <code>ListCommunity</code>
   * 
   * @return All communities in collection as an <code>Iterator</code> of
   *         <code>ListCommunity</code> objects, or <code>null</code> if no
   *         communities in collection. If collection was populated to contain
   *         stock donors, elements will be of type <code>Donor</code> which
   *         inherits from <code>ListCommunity</code>
   */
  public Iterator<ListCommunity> iterator() {
    return (!communities.isEmpty()) ? communities.iterator() : null;
  }

  /**
   * Sorts all elements in collection according to criteria set in comparator
   * 
   * @param comparator Comparator that defines criteria collection should be
   *          sorted by
   */
  public void sort(Comparator<ListCommunity> comparator) {
    Collections.sort(communities, comparator);
  }
}
