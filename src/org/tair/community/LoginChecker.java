/**
 * Copyright 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.community;


import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.tair.abrc.CompositeOrder;
import org.tair.bs.community.BsAffiliation;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnactivatedUserException;

import com.poesys.db.Message;


/**
 * LoginChecker contains all functions relating to a user's login status,
 * including whether user is a TAIR curator, or has authorization to update a
 * given community record. For initial login, LoginChecker compares submitted
 * values with Community table in the database, then stores user attributes in
 * session for easy future retrieval. All methods use current
 * <code>HttpServletRequest</code> to gain access to user's
 * <code>HttpSession</code>, or pass request to <code>SessionHandler</code> to
 * access session.
 * 
 * @see SessionHandler
 */

public class LoginChecker {
  private static final Logger logger = Logger.getLogger(LoginChecker.class);

  /**
   * Checks whether user is logged in or not by checking if there is a community
   * ID currently stored in user's session.
   * 
   * @param request <code>HttpServletRequest</code> passed from calling servlet
   * @return <code>true</code> if user is logged in; <code>false</code> if user
   *         is not logged in.
   */
  public static boolean isLoggedIn(HttpServletRequest request) {
    boolean loggedIn = false;
    try {
      if (SessionHandler.getLoginId(request) != null) {
        logger.info("Logged in with community ID "
                    + SessionHandler.getLoginId(request)
                    + " and session id "
                    + request.getSession().getId());
        loggedIn = true;
      }
    } catch (InvalidLoginException e) {
      loggedIn = false;
    }
    return loggedIn;
  }

  /**
   * Logs user in by searching for username/password combination in the
   * database. Username/password combination must be associated with a community
   * record that is not obsolete, and has a status of "active". If the valid
   * combination is found, user's community ID, name and whether they are a TAIR
   * or External curator is stored in user's <code>HttpSession</code> for future
   * reference. This login sets both the loginId and the communityID in the
   * session.
   * 
   * <p>
   * If user's account is found in the database, but has a status of "new",
   * UnactivatedUserException is thrown to flag the special case where login
   * fails because user's account hasn't yet been activated by curator. All
   * other login failures throw InvalidLoginException
   * 
   * @param request <code>HttpServletRequest</code> passed from calling servlet
   * @param username Submitted username for login
   * @param password Submitted password for login
   * @param conn An active connection to the database
   * @exception SQLException thrown if an error occurs while retrieving
   *              information from the database
   * @exception UnactivatedUserException if username/password combination is
   *              found, but user account has not yet been activated by curator
   * @exception InvalidLoginException thrown if username/password combination
   *              does not match to a valid Community entry
   */
  public static void login(HttpServletRequest request, String username,
                           String password, DBconnection conn)
      throws SQLException, UnactivatedUserException, InvalidLoginException {

    String status = null;
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person =
      delegate.getPersonByUsernameAndPassword(username, password);
    if (person != null) {
      try {
        BigInteger communityID = person.getCommunityId();
        status = person.getCommunity().getMemberStatus();
        // only save info in session if user is active
        if (status != null && BsCommunity.Status.ACTIVE.equals(status)) {
          logger.debug("Logging in user with community ID " + communityID);
          SessionHandler.setLoginID(request, communityID);
          SessionHandler.setCommunityID(request, communityID);
          SessionHandler.setTairCurator(request, person.getTairCurator());
          SessionHandler.setExternalCurator(request,
                                            person.getExternalCurator());
          SessionHandler.setPersonName(request, person.getFirstName());
          SessionHandler.setPersonID(request, person.getPersonId());

          // check if newly logged in user is a stock donor
          checkDonorStatus(request, conn, communityID);

          // check if user is PI/contact person for a stock donor lab
          checkLabDonorStatus(request, conn, communityID);

          // check if user is PI for any labs
          checkPIStatus(request, conn, communityID);

          // check if user is Contact Person for any labs
          checkContactPersonStatus(request, conn, communityID);
        } else if (status != null && BsCommunity.Status.NEW.equals(status)) {
          // A new registration, not activated yet
          throw new UnactivatedUserException("User account not activated yet");
        } else if (status != null) {
          throw new InvalidLoginException("User account has status "
                                          + status
                                          + " and cannot log in; please contact curator@arabidopsis.org for assistance.");
        }
      } catch (Exception e) {
        // Convert any Poesys/DB messages to bundled text.
        String msg = Message.getMessage(e.getMessage(), null);
        throw new InvalidLoginException(msg, e);
      }
    } else {
      // no person found, invalid login
      throw new InvalidLoginException("The username/password combination "
                                      + "supplied is not valid. Please enter "
                                      + "new values and resubmit");
    }
  }

  // determine if user w/community ID is a stock donor by looking for id in
  // Donor table
  private static void checkDonorStatus(HttpServletRequest request,
                                       DBconnection conn, BigInteger communityID)
      throws SQLException {

    ResultSet results = null;
    int count = 0;
    Boolean donor = null;
    String query =
      "SELECT count( d.community_id ) AS donor_count "
          + "FROM Donor d, Stock s "
          + "WHERE d.stock_id = s.stock_id "
          + "AND d.community_id = "
          + communityID.toString();
    conn.setQuery(query);
    results = conn.getResultSet();
    if (results.next()) {
      count = results.getInt("donor_count");
    }
    conn.releaseResources();
    donor = new Boolean((count > 0));
    SessionHandler.setDonorStatus(request, donor);
  }

  // determine if user w/community ID is PI/contact person of a stock donor lab;
  // if so, save community ids of donor labs in session for reference later
  private static void checkLabDonorStatus(HttpServletRequest request,
                                          DBconnection conn,
                                          BigInteger communityID)
      throws SQLException {

    ResultSet results = null;
    Long[] donorCommunityIDs = null;
    ArrayList<Long> tmpIDs = null;

    String query =
      "SELECT distinct d.community_id "
          + "FROM Donor d, Stock s, Affiliation a, Organization o "
          + "WHERE d.stock_id = s.stock_id "
          + "AND d.community_id = o.community_id "
          + "AND o.organization_id = a.organization_id "
          + "AND (a.is_pi = 'T' OR a.is_contact_person = 'T') "
          + "AND a.community_id = "
          + communityID.toString();
    conn.setQuery(query);
    results = conn.getResultSet();
    while (results.next()) {
      if (tmpIDs == null) {
        tmpIDs = new ArrayList<Long>();
      }
      tmpIDs.add(results.getLong("community_id"));
    }
    conn.releaseResources();

    // set donor lab community ids
    if (tmpIDs != null && !tmpIDs.isEmpty()) {
      donorCommunityIDs = new Long[tmpIDs.size()];
      donorCommunityIDs = (Long[])tmpIDs.toArray(donorCommunityIDs);
      SessionHandler.setDonorLabIDs(request, donorCommunityIDs);
    }
  }

  private static void checkContactPersonStatus(HttpServletRequest request,
                                               DBconnection conn,
                                               BigInteger communityID)
      throws SQLException {

    String query = null;
    ResultSet results = null;
    Boolean isContactPerson = null;
    int labCount = 0;

    query =
      "SELECT COUNT( o.organization_id ) "
          + "FROM Affiliation a, Organization o, Community c "
          + "WHERE a.organization_id = o.organization_id "
          + "AND o.organization_type = "
          + TextConverter.dbQuote(DataConstants.getLabType())
          + " "
          + "AND o.community_id = c.community_id "
          + "AND c.is_obsolete = 'F' "
          + "AND c.status = "
          + TextConverter.dbQuote(DataConstants.getActiveStatus())
          + " "
          + "AND a.is_contact_person = 'T' "
          + "AND a.community_id = "
          + communityID.toString();
    conn.setQuery(query);
    results = conn.getResultSet();
    if (results.next()) {
      labCount = results.getInt(1);
    }
    conn.releaseResources();

    isContactPerson = new Boolean(labCount > 0);

    SessionHandler.setIsContactPerson(request, isContactPerson);

  }

  // check if user is PI for any active labs. If so, save boolean flag in
  // session
  // for creating custom links for searching order histories
  private static void checkPIStatus(HttpServletRequest request,
                                    DBconnection conn, BigInteger communityID)
      throws SQLException {

    String query = null;
    ResultSet results = null;
    Boolean isPI = null;
    int labCount = 0;

    query =
      "SELECT COUNT( o.organization_id ) "
          + "FROM Affiliation a, Organization o, Community c "
          + "WHERE a.organization_id = o.organization_id "
          + "AND o.organization_type = "
          + TextConverter.dbQuote(DataConstants.getLabType())
          + " "
          + "AND o.community_id = c.community_id "
          + "AND c.is_obsolete = 'F' "
          + "AND c.status = "
          + TextConverter.dbQuote(DataConstants.getActiveStatus())
          + " "
          + "AND a.is_pi = 'T' "
          + "AND a.community_id = "
          + communityID.toString();

    conn.setQuery(query);
    results = conn.getResultSet();
    if (results.next()) {
      labCount = results.getInt(1);
    }
    conn.releaseResources();

    isPI = new Boolean(labCount > 0);

    SessionHandler.setIsPI(request, isPI);
  }

  /**
   * Determines wheter user is PI for an active lab by checking value stored in
   * user's session. This value is populated when user first logs in
   * 
   * @return <code>true</code> if user is PI for an active lab, or
   *         <code>false</code> if user is not a PI or is not logged in
   */
  public static boolean isPI(HttpServletRequest request) {
    Boolean sessionValue = SessionHandler.getIsPI(request);
    return (sessionValue != null && sessionValue.booleanValue());
  }

  public static boolean isContactPerson(HttpServletRequest request) {
    Boolean sessionValue = SessionHandler.getIsContactPerson(request);
    return (sessionValue != null && sessionValue.booleanValue());
  }

  /**
   * Determines whether user is a stock donor by checking for value in user's
   * session. This value is populated when user first logs in
   * 
   * @return <code>true</code> if user is a stock donor, or <code>false</code>
   *         if user is not a stock donor, or if user is not logged in
   */
  public static boolean isDonor(HttpServletRequest request) {
    Boolean sessionValue = SessionHandler.getDonorStatus(request);
    return (sessionValue != null && sessionValue.booleanValue());
  }

  /**
   * Determines whether user is PI or contact person for a stock donor lab by
   * checking for donor lab ids in user's session. These values are populated
   * when user first logs in
   * 
   * @return <code>true</code> if user is PI or contact person for a stock donor
   *         lab, or <code>false</code> if user is not a PI or contact person
   *         for a stock donor lab, or if user is not logged in
   */
  public static boolean hasDonorLab(HttpServletRequest request) {
    Long[] labIDs = SessionHandler.getDonorLabIDs(request);
    return (labIDs != null && labIDs.length > 0);
  }

  /**
   * Checks whether current user is a TAIR curator or not by checking the value
   * in user's session.
   * 
   * @param request <code>HttpServletRequest</code> passed from calling JSP
   * @return <code>true</code> if user is a TAIR curator; <code>false</code> if
   *         user is not a TAIR curator.
   */
  public static boolean isTairCurator(HttpServletRequest request) {
    boolean tairCurator = false;
    Boolean sessionValue = SessionHandler.getTairCurator(request);
    if (sessionValue != null && sessionValue.booleanValue()) {
      tairCurator = true;
    }
    return tairCurator;
  }

  /**
   * Checks whether current user is an External curator or not by checking the
   * value in user's session.
   * 
   * @param request <code>HttpServletRequest</code> passed from calling JSP
   * @return <code>true</code> if user is a External curator; <code>false</code>
   *         if user is not a External curator.
   */
  public static boolean isExternalCurator(HttpServletRequest request) {
    boolean externalCurator = false;
    Boolean sessionValue = SessionHandler.getExternalCurator(request);
    if (sessionValue != null && sessionValue.booleanValue()) {
      externalCurator = true;
    }
    return externalCurator;
  }

  /**
   * Checks whether current user has authorization to edit/update the community
   * record with community ID matching targetID. User has permission to edit the
   * requested record if:
   * 
   * <ul>
   * <li>User is TAIR curator</li>
   * <li>User is trying to update his or her own personal record</li>
   * <li>User is trying to update a lab or organization that they are PI, or
   * contact person for.</li>
   * </ul>
   * 
   * @param request <code>HttpServletRequest</code> passed from calling JSP
   * @param connectionPool A reference to a pool of active connections to the
   *          database
   * @param targetID The community ID for the record to be edited
   * @return <code>true</code> if user has authorization to update record;
   *         <code>false</code> if user does not have authorization
   * @exception SQLException thrown if an error occurs while retrieving
   *              information from the database
   * @exception InvalidLoginException thrown if user is not logged in when
   *              making request
   */
  public static boolean checkAuthorization(HttpServletRequest request,
                                           BigInteger targetID)
      throws SQLException, InvalidLoginException {

    boolean authorized = false;
    BigInteger updaterID = null;

    // curator has free reign
    if (isTairCurator(request)) {
      authorized = true;
    } else {

      // will throw exception if not logged in at all
      updaterID = SessionHandler.getLoginId(request);

      // can always update your own record
      if (updaterID.equals(targetID)) {
        authorized = true;
      } else {
        if (isPI(updaterID, targetID) || isContactPerson(updaterID, targetID)) {
          authorized = true;
        }
      }
    }
    return authorized;
  }

  /**
   * Checks whether ID of person requesting update is listed as contact person
   * for organization with target ID
   * 
   * @param updaterID The community ID of the user to check
   * @param targetID The community ID of the organization to check
   * @return <code>true</code> if updater ID is contact person for organization;
   *         <code>false</code> if user is not contact person, or if one or both
   *         IDs are null
   * @exception SQLException thrown if an error occurs while retrieving
   *              information from the database
   */
  public static boolean isContactPerson(BigInteger updaterID,
                                        BigInteger targetID)
      throws SQLException {

    boolean contactPerson = false;

    if (updaterID != null && targetID != null) {
      // Get the person identified by the updaterID.
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      BsPerson person = delegate.getPersonByCommunityId(updaterID);

      // See if there is a PI affiliation for the person.
      for (BsAffiliation affiliation : person.getCommunity().getAffiliation()) {
        // Get the affiliated organization's community ID.
        BigInteger orgId = affiliation.getOrganization().getCommunityId();
        // If this is the target organization and the person is PI, set the
        // flag.
        if (targetID.equals(orgId) && affiliation.getContactPerson()) {
          contactPerson = true;
          break; // no need to check other affiliations.
        }
      }
    }

    return contactPerson;
  }

  /**
   * Checks whether ID of person requesting update is listed as PI for
   * organization with target ID
   * 
   * @param updaterID The community ID of the user to check
   * @param targetID The community ID of the organization to check
   * @return <code>true</code> if updater ID is PI for organization;
   *         <code>false</code> if user is not PI, or if one or both IDs are
   *         null information from the database
   * @throws SQLException when the affiliation can't be lazily loaded
   */
  public static boolean isPI(BigInteger updaterID, BigInteger targetID)
      throws SQLException {
    boolean pi = false;

    // Get the person identified by the updaterID.
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(updaterID);

    // See if there is a PI affiliation for the person.
    for (BsAffiliation affiliation : person.getCommunity().getAffiliation()) {
      // Get the affiliated organization's community ID.
      BigInteger orgId = affiliation.getOrganization().getCommunityId();
      // If this is the target organization and the person is PI, set the flag.
      if (targetID.equals(orgId) && affiliation.getPi()) {
        pi = true;
        break; // no need to check other affiliations.
      }
    }
    return pi;
  }

  /**
   * Checks whether current user has authorization to edit/update the submitted
   * stock order. User has permission to edit the requested record if:
   * <ul>
   * <li>User is TAIR curator
   * <li>User is trying to update an order he or she placed
   * <li>User is trying to update an order placed by a member of a lab or
   * organization that they are PI for.
   * </ul>
   * 
   * @param updaterID The community ID of the user trying to update the order
   * @param order The stock order to be updated
   * @return <code>true</code> if user has authorization to update order;
   *         <code>false</code> if user does not have authorization
   * @throws SQLException when the affiliation can't be lazily loaded from the
   *           database
   */
  public static boolean hasOrderPermissions(BigInteger updaterID,
                                            CompositeOrder order)
      throws SQLException {
    boolean hasPermission = false;
    if (order.get_person_community_id() != null
        || order.get_organization_community_id() != null) {
      BigInteger personId =
        new BigInteger(order.get_person_community_id().toString());
      BigInteger orgId =
        new BigInteger(order.get_organization_community_id().toString());
      if (updaterID != null
          && personId != null
          && orgId != null
          && (updaterID.equals(personId) || isPI(updaterID, orgId))) {
        hasPermission = true;
      }
    }
    return hasPermission;
  }
}
