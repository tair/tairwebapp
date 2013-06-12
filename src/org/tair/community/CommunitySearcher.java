/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.jboss.logging.Logger;
import org.tair.bs.community.BsAddress;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsLab;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

import com.poesys.bs.delegate.DelegateException;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * CommunitySearcher holds search methods for all affiliation and duplicate
 * searches done as part of Community registration. Most search methods can
 * return either a <code>org.tair.utilities.SearchResultsCollection</code> that
 * contains a slice of the result set (i.e. 26-50 of 100 results ) defined by
 * parameters "floor" and "ceiling" or a full array of all search results
 * 
 * @see SearchResultsCollection
 * @see ScrollParams
 * @see CommunityFormValidator
 */

public class CommunitySearcher {
  private static final Logger logger = Logger.getLogger(CommunitySearcher.class);
  /**
   * Returns organizations in Organization and CommunityAlias who match
   * submitted criteria
   * 
   * @param conn An active connection to the database
   * @param params A Map containing all submitted search parameters - expects
   *          key "name" to reference search value for organization name
   * @param scrollParams ScrollParams object that contains information on what
   *          page of results to return
   * @param excludeLabs if <code>true</code>, only organizations that are not
   *          labs will be returned, if <code>false</code>, all organizations
   *          matching criteria will be returned
   * @return SearchResultsCollection containing array of
   *         <code>ListCommunity</code>s along with values for floor, ceiling &
   *         page
   * @exception SQLException thrown if database error occurs while retrieving
   *              data.
   */
  @SuppressWarnings("unchecked")
  public static SearchResultsCollection searchOrganizations(
                                                            DBconnection conn,
                                                            Map params,
                                                            ScrollParams scrollParams,
                                                            boolean excludeLabs)
      throws SQLException {

    boolean alias = true;
    String query = createOrganizationQuery(params, excludeLabs, alias);
    SearchResultsCollection searchResults =
      getResults(conn, query, scrollParams);
    return searchResults;
  }

  /**
   * Returns organizations in Organization and CommunityAlias who match
   * submitted criteria
   * 
   * @param conn An active connection to the database
   * @param params A Map containing all submitted search parameters - expects
   *          key "name" to reference search value for organization name
   * @param excludeLabs if <code>true</code>, only organizations that are not
   *          labs will be returned, if <code>false</code>, all organizations
   *          matching criteria will be returned
   * @return Array of <code>ListCommunity</code>s
   * @exception SQLException thrown if database error occurs while retrieving
   *              data.
   */
  @SuppressWarnings("unchecked")
  public static ListCommunity[] searchOrganizations(DBconnection conn,
                                                    Map params,
                                                    boolean excludeLabs)
      throws SQLException {

    String query = createOrganizationQuery(params, excludeLabs, true);
    ListCommunity[] searchResults = getResults(conn, query);

    return searchResults;
  }

  /**
   * Returns persons in Person and CommunityAlias who match submitted criteria
   * 
   * @param conn An active connection to the database
   * @param params A Map containing all submitted search parameters using field
   *          name as a key to the value - expects keys first_name, last_name
   *          and communityID
   * @param scrollParams ScrollParams object that contains information on what
   *          page of results to return
   * @return SearchResultsCollection containing array of
   *         <code>ListCommunity</code> along with values for floor, ceiling &
   *         page
   * @exception SQLException thrown if database error occurs while retrieving
   *              data.
   */
  @SuppressWarnings("unchecked")
  public static SearchResultsCollection searchPersons(DBconnection conn,
                                                      Map params,
                                                      ScrollParams scrollParams)
      throws SQLException {

    boolean alias = true;
    String query = createPersonQuery(params, alias);
    SearchResultsCollection searchResults =
      getResults(conn, query, scrollParams);
    return searchResults;
  }

  /**
   * Returns persons in Person and CommunityAlias who match submitted criteria
   * 
   * @param conn An active connection to the database
   * @param params A Map containing all submitted search parameters using field
   *          name as a key to the value - expects keys first_name, last_name
   *          and communityID
   * @return Array of <code>ListCommunity</code>s
   * @exception SQLException thrown if database error occurs while retrieving
   *              data.
   */
  @SuppressWarnings("unchecked")
  public static ListCommunity[] searchPersons(DBconnection conn, Map params)
      throws SQLException {

    boolean alias = true;
    ListCommunity[] searchResults =
      getResults(conn, createPersonQuery(params, alias));
    return searchResults;
  }

  /**
   * Returns possible duplicates of a Person record in both Person &
   * CommunityAlias by comparing firstName, lastName and communityID
   * 
   * @param conn An active connection to the database
   * @param params Map of duplicate search params, including last_name,
   *          first_name and communityID
   * @param scrollParams ScrollParams object that contains information on what
   *          page of results to return
   * @return SearchResultsCollection containing array of
   *         <code>ListCommunity</code> along with values for floor, ceiling &
   *         page
   * @exception SQLException thrown if database error occurs while retrieving
   *              data.
   */
  @SuppressWarnings("unchecked")
  public static SearchResultsCollection getPersonDuplicates(
                                                            DBconnection conn,
                                                            Map params,
                                                            ScrollParams scrollParams)
      throws SQLException {

    Long communityID = (Long)params.get("communityID");
    String val = (String)params.get("last_name");
    String lastName = TextConverter.stripWildcards(val);

    val = (String)params.get("first_name");
    String firstName = TextConverter.stripWildcards(val);
    String lastMethod = (String)params.get("last_name_method");
    String firstMethod = (String)params.get("first_name_method");
    boolean alias = true;
    String query =
      createPersonQuery(TextConverter.convertEnds(lastName, lastMethod),
                        TextConverter.convertEnds(firstName, firstMethod),
                        communityID,
                        alias);
    return getResults(conn, query, scrollParams);
  }

  /**
   * Returns possible lab duplicates by comparing submitted lab name to labs
   * already in the database
   * 
   * @param params Map containing search criteria including name
   * @param scrollParams ScrollParams object that contains information on what
   *          page of results to return
   * @return SearchResultsCollection containing array of <code>BsLab</code>s
   *         along with values for floor, ceiling & page
   */
  @SuppressWarnings("unchecked")
  public static SearchResultsCollection getLabDuplicates(
                                                         Map params,
                                                         ScrollParams scrollParams) {

    int floor = scrollParams.getFloor();
    String nameMethod = (String)params.get("name_method");
    String val = (String)params.get("name");
    String name =
      TextConverter.convertEnds(TextConverter.stripWildcards(val), nameMethod);

    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    List<BsLab> labs = delegate.getDuplicateLabs(name, 10);
    BsLab[] searchResults = getLabsArray(labs);
    SearchResultsCollection searchCollection = null;
    if (searchResults != null) {

      searchCollection = new SearchResultsCollection();
      searchCollection.setResults(searchResults);
      searchCollection.setResultSize(labs.size());

      // increment floor & ceiling to match real (not array) numbers
      searchCollection.setFloor(floor + 1);
      searchCollection.setCeiling(floor + labs.size());
    }
    return searchCollection;
  }

  /**
   * Create an array of BsLab objects from a list of such objects. If the list
   * is null or empty, the method returns a null.
   * 
   * @param labs the list of objects
   * @return an array of the objects in the list in the same order or null if
   *         there are no inputs
   */
  private static BsLab[] getLabsArray(List<BsLab> labs) {
    BsLab[] array = null;
    if (labs != null && labs.size() > 0) {
      array = new BsLab[labs.size()];
      int i = 0;
      for (BsLab lab : labs) {
        array[i] = lab;
        i++;
      }
    }
    return array;
  }

  /**
   * Create SQL query to select orgs based on criteria
   * @param params the search criteria
   * @param excludeLabs whether to exclude labs
   * @param alias whether there is an alias
   * @return the organization query
   */
  @SuppressWarnings("unchecked")
  private static String createOrganizationQuery(Map params,
                                                boolean excludeLabs,
                                                boolean alias) {
    String nameMethod = (String)params.get("name_method");

    String val = TextConverter.stripWildcards((String)params.get("name"));

    String name = TextConverter.convertEnds(val, nameMethod);

    StringBuffer query = new StringBuffer();

    if (alias) {
      query.append("SELECT org.name_uc, org.name, org.community_type,"
                   + " org.specific_id, org.community_id FROM ( ");
    }
    query.append("SELECT o.name_uc, " + "o.name, "
                 + "o.organization_type as community_type, "
                 + "o.organization_id AS specific_id, " + "c.community_id "
                 + "FROM Community c, Organization o "
                 + "WHERE c.is_obsolete = 'F' " + "AND c.status = "
                 + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
                 + "AND c.community_id = o.community_id ");

    if (excludeLabs) {
      String labType = TextConverter.dbQuote(DataConstants.getLabType());

      query.append("AND o.organization_type != " + labType);
    }

    if (name != null && !name.trim().equals("")) {
      query.append("AND o.name_uc LIKE "
                   + TextConverter.dbQuote(name.toUpperCase()) + " ESCAPE '\\\' ");
    }

    // combine results from Organization & CommunityAlias if desired
    if (alias) {
      String activeStatus = DataConstants.getActiveStatus();

      query.append(" UNION ");

      query.append("SELECT o.name_uc, " + "o.name, "
                   + "o.organization_type as community_type, "
                   + "o.organization_id AS specific_id, " + "c.community_id "
                   + "FROM Community c, " + "Organization o, "
                   + "CommunityAlias ca " + "WHERE c.is_obsolete = 'F' "
                   + "AND c.status = " + TextConverter.dbQuote(activeStatus)
                   + " " + "AND c.community_id = o.community_id "
                   + "AND ca.community_id = c.community_id ");

      if (excludeLabs) {
        String labType = DataConstants.getLabType();
        query.append("AND o.organization_type != "
                     + TextConverter.dbQuote(labType) + " ");
      }

      if (name != null && !name.trim().equals("")) {
        query.append("AND ca.alias_uc LIKE "
                     + TextConverter.dbQuote(name.toUpperCase()) + " ESCAPE '\\\' ");
      }
    }
    if (alias) {
      query.append(" ) org ORDER BY org.name_uc ");
    } else {
      query.append("order by o.name_uc");
    }
    return query.toString();
  }

  /**
   * Populate address for each search result in array, as the search query does
   * not use the data access layer to populate it automatically.
   * @param conn the JDBC connection wrapper
   * @param communities the array of communities
   */
  private static void getAddressData(DBconnection conn,
                                     ListCommunity[] communities) {
    CommunityDelegate delegate =
      CommunityDelegateFactory.getCommunityDelegate();
    IPrimaryKey key = null;
    if (communities != null && communities.length > 0) {
      for (int i = 0; i < communities.length; i++) {
        if (communities[i].getCommunityID() != null) {
          // Look up the community, then get its address.
          BigInteger communityId =
            new BigInteger(communities[i].getCommunityID().toString());
          key = CommunityFactory.getCommunityPrimaryKey(communityId);
          BsCommunity community = delegate.getObject((SequencePrimaryKey)key);
          BsAddress address = community.getAddress();
          communities[i].setAddress(address);
        }
      }
    }
  }

  /**
   * Resultset processor - return collection w/results & scrolling parameters
   * 
   * @param conn the JDBC connection wrapper
   * @param query the query to execute
   * @param scrollParams the scrolling parameters
   * @return the search results collection
   * @throws SQLException when there is a database problem
   */
  @SuppressWarnings("unchecked")
  private static SearchResultsCollection getResults(DBconnection conn,
                                                    String query,
                                                    ScrollParams scrollParams)
      throws SQLException {

    int floor = scrollParams.getFloor();
    int ceiling = scrollParams.getCeiling();

    conn.setQuery(query);
    ResultSet results = conn.getResultSet();
    Vector found = null;
    ListCommunity[] searchResults = null;
    SearchResultsCollection searchCollection = null;
    int recordCounter = 0;
    while (results.next()) {
      if (found == null) {
        found = new Vector();
      }
      if (recordCounter >= floor && recordCounter <= ceiling) {
        ListCommunity comm = new ListCommunity();
        comm.setDisplayType(results.getString("community_type"));
        comm.setDisplayName(results.getString("name"));

        BigInteger id = results.getBigDecimal("community_id").toBigInteger();
        comm.setCommunityID(id);

        id = results.getBigDecimal("specific_id").toBigInteger();
        comm.setSpecificID(id);
        found.addElement(comm);
      }
      recordCounter++;
    }

    conn.releaseResources();

    if (found != null && !found.isEmpty()) {
      searchResults = new ListCommunity[found.size()];
      found.copyInto(searchResults);
      getAddressData(conn, searchResults);

      searchCollection = new SearchResultsCollection();
      searchCollection.setResults(searchResults);
      searchCollection.setResultSize(recordCounter);

      // increment floor & ceiling to match real (not array) numbers
      searchCollection.setFloor(floor + 1);
      searchCollection.setCeiling(floor + searchResults.length);
    }
    return searchCollection;
  }

  /**
   * Resultset processor - return all results as array
   * 
   * @param conn the JDBC wrapper
   * @param query the query to execute
   * @return the array of ListCommunity objects
   * @throws SQLException
   */
  @SuppressWarnings("unchecked")
  private static ListCommunity[] getResults(DBconnection conn, String query)
      throws SQLException {

    conn.setQuery(query);
    ResultSet results = conn.getResultSet();
    Vector found = null;
    ListCommunity[] searchResults = null;

    while (results.next()) {
      if (found == null) {
        found = new Vector();
      }

      ListCommunity comm = new ListCommunity();
      comm.setDisplayType(results.getString("community_type"));
      comm.setDisplayName(results.getString("name"));
      comm.setCommunityID(results.getBigDecimal("community_id").toBigInteger());
      comm.setSpecificID(results.getBigDecimal("specific_id").toBigInteger());
      found.addElement(comm);
    }

    conn.releaseResources();

    if (found != null && !found.isEmpty()) {
      searchResults = new ListCommunity[found.size()];
      found.copyInto(searchResults);
      getAddressData(conn, searchResults);
    }
    return searchResults;
  }

  /**
   * Construct the array of ListCommunity objects from the input list of
   * communities.
   * 
   * @param communities the list of communities
   * @return the ListCommunity array
   */
  @SuppressWarnings("unused")
  private static ListCommunity[] getResults(List<BsCommunity> communities) {
    ListCommunity[] searchResults = new ListCommunity[communities.size()];
    int i = 0;
    for (BsCommunity community : communities) {
      searchResults[i] = new ListCommunity(community);
      i++;
    }
    return searchResults;
  }

  /**
   * Retrieve all organizations & person whose status is new, along with a list
   * of possible duplicate records for each new record. Used to create list of
   * new registrations for TAIR curator
   * 
   * @return Map containing two arrays of <code>ListCommunity</code>s,
   *         "newPersons" and "newOrgs". These keys should be used to retrieve
   *         the arrays of search results from the returned Map.
   * @exception SQLException thrown if database error occurs while retrieving
   *              data
   */
  public static Map<String, ListCommunity[]> getNewCommunities()
      throws SQLException {
    CommunityDelegate delegate =
      CommunityDelegateFactory.getCommunityDelegate();
    List<BsCommunity> communities = new ArrayList<BsCommunity>(0);
    try {
      communities = delegate.getNewCommunities(10);
    } catch (DelegateException e1) {
      // Log this and continue with an empty communities list.
      logger.error("Community delegate exception getting new communities", e1);
      communities = new ArrayList<BsCommunity>(0);
    } catch (RuntimeException e2) {
      // Log this and continue with an empty communities list.
      logger.error("Runtime exception getting new communities", e2);
      communities = new ArrayList<BsCommunity>(0);
    }
    List<BsCommunity> newOrgList = new ArrayList<BsCommunity>();
    List<BsCommunity> newPersonList = new ArrayList<BsCommunity>();
    ListCommunity[] newOrgs = null;
    ListCommunity[] newPersons = null;

    // Split the communities list into the org and person lists.
    for (BsCommunity community : communities) {
      BsCommunity.Type type =
        BsCommunity.Type.valueOf(community.getCommunityType().toUpperCase());
      if (type == BsCommunity.Type.PERSON) {
        newPersonList.add(community);
      } else if (type == BsCommunity.Type.ORGANIZATION) {
        newOrgList.add(community);
      }
    }

    // Create the ListCommunity objects and put them into the arrays.
    newOrgs = new ListCommunity[newOrgList.size()];
    int o = 0;
    orgLoop: for (BsCommunity org : newOrgList) {
      try {
        newOrgs[o] = new ListCommunity(org);
      } catch (DelegateException e) {
        // Community doesn't have an organization, log it and continue.
        logger.warn("Community " + org.getCommunityId() + " doesn't have a corresponding organization.");
        // Go to next organization without incrementing o.
        continue orgLoop;
      }
      o++;
    }

    newPersons = new ListCommunity[newPersonList.size()];
    int p = 0;
    personLoop: for (BsCommunity person : newPersonList) {
      try {
        newPersons[p] = new ListCommunity(person);
      } catch (DelegateException e) {
        // Community doesn't have an organization, log it and continue.
        logger.warn("Community " + person.getCommunityId() + " doesn't have a corresponding organization.");
        // Go to next person without incrementing o.
        continue personLoop;
      }
      p++;
    }

    HashMap<String, ListCommunity[]> results = null;

    if (newOrgs != null && newOrgs.length > 0) {
      if (results == null) {
        results = new HashMap<String, ListCommunity[]>();
      }
      results.put("newOrgs", newOrgs);
    }

    // check for possible duplicates of each new person
    if (newPersons != null && newPersons.length > 0) {
      if (results == null) {
        results = new HashMap<String, ListCommunity[]>();
      }
      results.put("newPersons", newPersons);
    }

    return results;
  }

  /**
   * Overridden version to create SQL query to select persons based on criteria
   * @param params the search criteria
   * @param alias whether there is an alias
   * @return the person query
   */
  @SuppressWarnings("unchecked")
  private static String createPersonQuery(Map params, boolean alias) {
    String val = (String)params.get("last_name");
    String lastName = TextConverter.stripWildcards(val);
    String lastMethod = (String)params.get("last_name_method");

    val = (String)params.get("first_name");
    String firstName = TextConverter.stripWildcards(val);

    String firstMethod = (String)params.get("first_name_method");
    Long communityID = (Long)params.get("communityID");
    return createPersonQuery(TextConverter.convertEnds(lastName, lastMethod),
                             TextConverter.convertEnds(firstName, firstMethod),
                             communityID,
                             alias);
  }

  /**
   * Create SQL query to look for persons based on last name first name & ID
   * @param lastName the last name of the person
   * @param firstName the first name of the person
   * @param communityID the community ID
   * @param alias whether there is an alias
   * @return the person query
   */
  private static String createPersonQuery(String lastName, String firstName,
                                          Long communityID, boolean alias) {

    StringBuffer query = new StringBuffer();
    // if requested, combine matches from Person and CommunityAlias
    if (alias) {
      query.append("SELECT pers.community_id, pers.community_type, pers.last_name_uc, pers.last_name, pers.first_name, pers.name, pers.specific_id FROM ( ( ");
    }

    query.append("SELECT c.community_id, " + "c.community_type, "
                 + "p.last_name_uc, " + "p.last_name, " + "p.first_name, "
                 + "p.last_name || ', ' || p.first_name AS name, "
                 + "p.person_id AS specific_id "
                 + "FROM Person p, Community c "
                 + "WHERE c.community_id = p.community_id " + "AND c.status= "
                 + TextConverter.dbQuote(DataConstants.getActiveStatus()) + " "
                 + "AND c.is_obsolete = 'F' ");

    if (communityID != null) {
      query.append("AND c.community_id != " + communityID.toString() + " ");
    }

    if (lastName != null) {
      query.append("AND p.last_name_uc LIKE "
                   + TextConverter.dbQuote(lastName.toUpperCase()) + " ESCAPE '\\\' ");
    }

    if (firstName != null) {
      query.append("AND p.first_name_uc LIKE "
                   + TextConverter.dbQuote(firstName.toUpperCase()) + " ESCAPE '\\\' ");
    }

    if (alias) {
      query.append(" ) UNION ( ");
      String active = DataConstants.getActiveStatus();
      query.append("SELECT c.community_id, " + "c.community_type, "
                   + "p.last_name_uc, " + "p.last_name, " + "p.first_name, "
                   + "p.last_name  || ', ' || p.first_name AS name, "
                   + "p.person_id AS specific_id "
                   + "FROM Person p, Community c, CommunityAlias ca "
                   + "WHERE c.community_id = ca.community_id "
                   + "AND c.community_id = p.community_id " + "AND c.status = "
                   + TextConverter.dbQuote(active) + " "
                   + "AND c.is_obsolete = 'F' ");

      if (communityID != null) {
        query.append("AND c.community_id != " + communityID.toString() + " ");
      }

      // Aliases almost always = lastname, firstname - make best guess on
      // what to search for based on submitted values of lastName &
      // firstName
      String combinedAlias = null;
      if (lastName != null && firstName != null) {
        combinedAlias = lastName + ", " + firstName;
      } else if (lastName != null && firstName == null) {
        combinedAlias = lastName;
      } else if (lastName == null && firstName != null) {
        combinedAlias = firstName;
      }

      if (combinedAlias != null) {
        query.append("AND ca.alias_uc LIKE "
                     + TextConverter.dbQuote(combinedAlias.toUpperCase()) + " ESCAPE '\\\' ");
      }
      query.append(" ) ");
    }
    if (alias) {
      query.append(" ) pers ORDER BY pers.last_name_uc, pers.first_name ");

    } else {
      query.append(" ORDER BY p.last_name_uc, p.first_name");
    }
    return query.toString();
  }

  /**
   * Returns persons whose last name or community alias matches (case
   * insensitively) a search criterion; use the nested affiliations to determine
   * PI status.
   * 
   * @param params Map containing last name or alias, possibly with SQL wildcard
   *          characters (LIKE expression)
   * @param scrollParams ScrollParams object that contains information on what
   *          page of results to return
   * @return SearchResultsCollection containing array of <code>BsPerson</code>s
   *         along with values for floor, ceiling & page
   * @throws SQLException when there is a database problem
   */
  @SuppressWarnings("unchecked")
  public static SearchResultsCollection searchPIs(Map params,
                                                  ScrollParams scrollParams)
      throws SQLException {

    SearchResultsCollection searchCollection = null;
    String lastMethod = (String)params.get("last_name_method");

    String val = (String)params.get("last_name");
    String lastName =
      TextConverter.convertEnds(TextConverter.stripWildcards(val), lastMethod);

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    List<BsPerson> persons = delegate.getPersonsByName(lastName);

    int floor = scrollParams.getFloor();

    if (persons != null && persons.size() > 0) {
      BsPerson[] searchResults = persons.toArray(new BsPerson[persons.size()]);
      searchCollection = new SearchResultsCollection();
      searchCollection.setResults(searchResults);
      searchCollection.setResultSize(persons.size());

      // increment floor & ceiling to match real (not array) numbers
      searchCollection.setFloor(floor + 1);
      searchCollection.setCeiling(floor + persons.size());
    }

    return searchCollection;
  }

  /**
   * Delete any existing results for a specified query already searched. This
   * special-purpose removal gets rid of existing search results for any new
   * search rather than reusing old results, as community members tend to change
   * much faster than other objects in the Search system. The community search
   * handler should call this method once it has retrieved a valid query id. The
   * method assumes the connection has autocommit set on.
   * 
   * @param connection the JDBC connection wrapper
   * @param queryId the unique identifier for the search
   * @throws SQLException when there is a database problem
   * @throws InvalidParameterException when the connection or query id is null
   */
  public void deleteSearch(DBconnection connection, String queryId)
      throws SQLException, InvalidParameterException {
    if (connection == null) {
      throw new InvalidParameterException("No connection for community member search result removal");
    }
    if (queryId == null) {
      throw new InvalidParameterException("No query id for community member search result removal");
    }
    try {
      connection.setQuery("DELETE FROM RESULT_COMMUNITY WHERE query_id = ?");
      connection.setQueryVariable(queryId);
      connection.executeUpdate();
    } finally {
      if (connection != null) {
        connection.releaseResources();
      }
    }
  }
}
