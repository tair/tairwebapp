// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.32 $
// $Date: 2004/05/03 22:46:24 $
// ------------------------------------------------------------------------------

package org.tair.utilities;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.tair.abrc.CompositeOrder;
import org.tair.abrc.order.Orders;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.community.CommunityServlet;
import org.tair.community.CommunityState;
import org.tair.community.LoginChecker;
import org.tair.querytools.Notepad;
import org.tair.search.ExpressionSearchSession;
import org.tair.search.SearchSession;
import org.tair.tfc.DBconnection;


/**
 * SessionHandler is a utility class for setting & getting common elements &
 * from a user's <code>HttpSession</code>. Localizing access to session here
 * allows clients of <code>SessionHandler</code> to get & set elements simply,
 * without needing to explicitly retrieve the user's session or cast elements as
 * they are retrieved from session. Several methods will throw
 * <code>InvalidSessionException</code>, or <code>InvalidLoginException</code>
 * if the requested element is not found, since it is assumed that client code
 * expects the value to be present and should be notified if it is missing.
 * 
 * @see javax.servlet.http.HttpSession
 * @see javax.servlet.http.HttpServletRequest
 */

public class SessionHandler {
  private static final Logger logger = Logger.getLogger(SessionHandler.class);

  /**
   * Determines whether user has an ABRC Stock Order in progress stored in
   * session
   * 
   * @param req HTTP request containing the session
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return <code>true</code> if session contains an order; <code>false</code>
   *         if no order is in session
   */
  public static boolean orderInProgress(HttpServletRequest req) {
    try {
      BigInteger pid = getPersonID(req);
      return null != Orders.byPersonId(pid);
    } catch (Exception e) {
      // Ignore any exceptions and continue.
    }
    return false;
  }

  /**
   * Is the address, email, or work phone of the user changed during the current
   * transaction?
   * 
   * @param req the request containing the session
   * @return true if the person has changed, false if not
   */
  public static boolean isPersonChanged(HttpServletRequest req) {
    Boolean changed =
      (Boolean)req.getSession().getAttribute("is_person_changed");
    if (changed == null) {
      // variable not set in session, default to FALSE
      changed = Boolean.FALSE;
    }
    return changed;
  }

  /**
   * Set the "is person changed" boolean flag in the session.
   * 
   * @param req the HTTP request containing the user's session
   * @param changed the flag value to set
   */
  public static void setPersonChanged(HttpServletRequest req, Boolean changed) {
    req.getSession().setAttribute("is_person_changed", changed);
  }

  /**
   * Checks whether there is a person community id in the session for the
   * current user. The community id may be the same as the login id or it may be
   * different, indicating operations apply to a person other than the logged in
   * person. All Person update functions accessed by
   * <code>CommunityServlet</code> store an instance of <code>BsPerson</code> in
   * session for processing across multiple requests. Method will return false
   * if session attribute is null, even if a stock order that contains a person
   * is in progress.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return <code>true</code> if session contains a person; <code>false</code>
   *         if no person is in session
   * @see CommunityServlet
   */
  public static boolean hasPerson(HttpServletRequest request) {
    BigInteger sessionId = null;
    try {
      sessionId = getCommunityID(request);
    } catch (InvalidLoginException e) {
      // Ignore, just leave the sessionId null.
    }
    return sessionId == null ? false : true;
  }

  /**
   * Checks whether user has a Community organization community id stored in
   * session. All Organization update functions accessed by
   * <code>CommunityServlet</code> store an id for a <code>BsOrganization</code>
   * in session for processing across multiple requests. Method will return
   * false if session attribute is null, even if a stock order that contains an
   * organization is in progress.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return <code>true</code> if session contains an organization id;
   *         <code>false</code> if no organization is in session
   * @see CommunityServlet
   */
  public static boolean hasOrganization(HttpServletRequest request) {
    return (request.getSession().getAttribute("organization") != null);
  }

  /**
   * Removes person in user's session. This is done if user has just completed
   * editing the person object and the person is no longer needed for
   * processing.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @see CompositeOrder
   */
  public static void removePerson(HttpServletRequest request) {
    // Does nothing now as person no longer stored in session.
  }

  /**
   * Removes organization in user's session. This is done if user has just
   * completed editing the person object and the organization is no longer
   * needed for processing.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @see CompositeOrder
   */
  public static void removeOrganization(HttpServletRequest request) {
    request.getSession().removeAttribute("organization");
  }

  /**
   * Retrieves a person based on user's session. Non-curator users should never
   * have any person id in their session but their own (that is, the login id
   * and the community id in the session are the same), but curators may have
   * another user's person community id in the session if they are editing that
   * person, with the login id remaining the community id of the curator doing
   * the editing. This method replaces the current community id in the session
   * with the input community id.
   * 
   * <p>
   * Since stock orders depend on update functions of community module, if this
   * method is called while the session attribute is null, but there is a stock
   * order in progress that contains a person, that person object will be
   * returned because the id is in the session.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param communityId The community ID that the person in session should have.
   *          If a person is stored in session that does not have this community
   *          ID, a new object will be created with this ID and stored in the
   *          old object's place.
   * @return BsPerson for community id that is stored in session for user
   * @exception SQLException thrown if a database error occurs while retrieving
   *              information
   */
  public static BsPerson getPerson(HttpServletRequest request,
                                   BigInteger communityId) {

    BigInteger sessionId = null;

    if (communityId == null) {
      throw new RuntimeException("No community id supplied for person");
    }

    // Get the person's community id if logged in.
    try {
      sessionId = getCommunityID(request);
      if (sessionId != null && !sessionId.equals(communityId)) {
        // input community id different, replace in session
        setCommunityID(request, communityId);
      }
    } catch (InvalidLoginException e) {
      // Ignore, just leave the sessionId null.
    }

    // Look up person in database or data access cache.
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(communityId);
    if (person == null) {
      try {
        person = getNewPerson(request);
      } catch (InvalidSessionException e) {
        // Nothing there, proceed with null person.

      } catch (RuntimeException r) {
        // Nothing there, proceed with null person.
      }

      if (person == null) {
        throw new RuntimeException("Community id "
                                   + communityId
                                   + " not found in database or as new person in progress in session");
      }
    }

    return person;
  }

  /**
   * Retrieves a person based on user's session. If there is no community id in
   * the session or the query based on the community id returns no object, the
   * method returns a new person object previously stored in the session.
   * 
   * <p>
   * Since stock orders depend on update functions of community module, if this
   * method is called while the session attribute is null, but there is a stock
   * order in progress that contains a person, that person object will be
   * returned.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return BsPerson stored in session for user
   * @exception InvalidSessionException thrown if no person found in user's
   *              session
   */
  public static BsPerson getPerson(HttpServletRequest request)
      throws InvalidSessionException {
    BigInteger sessionId = null;

    // Get the person's community id if logged in.
    try {
      sessionId = getCommunityID(request);
      if (sessionId == null) {
        throw new InvalidSessionException("No person in session for this user");
      }
    } catch (InvalidLoginException e) {
      throw new InvalidSessionException("No person logged in for this user");
    }

    // Look up person in database or data access cache.
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(sessionId);
    if (person == null) {
      logger.debug("Could not find person by community id: " + sessionId);
      person = getNewPerson(request);
      if (person == null) {
        throw new RuntimeException("No existing or new person in session; community id is "
                                   + (sessionId == null ? "null" : sessionId));
      }
    }
    return person;
  }

  /**
   * Retrieves a person's name stored in user's session. This value is set,
   * along with user's community ID and curator status, when user logs in.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return Name stored in session for user
   * @exception InvalidSessionException thrown if no name found in user's
   *              session
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static String getPersonName(HttpServletRequest request)
      throws InvalidSessionException {

    String name = (String)request.getSession().getAttribute("name");
    if (name == null) {
      throw new InvalidSessionException("No person name in session for this user");
    }
    return name;
  }

  /**
   * Retrieves an organization based on the id in the user's session. The
   * session stores the community ID for the organization, which the handler
   * uses to query the complete organization business object.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return BsOrganization currently set into session
   * @exception InvalidSessionException thrown if no organization found in
   *              user's session
   */
  public static BsOrganization getOrganization(HttpServletRequest request)
      throws InvalidSessionException {

    BigInteger communityId =
      (BigInteger)request.getSession().getAttribute("organization");

    // Look up organization in database or data access cache.
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    BsOrganization organization =
      delegate.getOrganizationByCommunityId(communityId);
    if (organization == null) {
      throw new RuntimeException("No organization in session");
    }
    return organization;
  }

  /**
   * Retrieves an organization based on the id in the user's session taking into
   * account an optional community ID. If the community ID is null but there is
   * a community ID in the session, the method instantiates a new
   * <code>BsOrganization</code> object using the session community id. If there
   * is a community ID but no session community ID, the method instantiates a
   * new <code>BsOrganization</code> object from the supplied community ID and
   * stores the community ID in the session. If both IDs are there but are
   * different, the method instantiates a new <code>BsOrganization</code> object
   * using the supplied community ID, ignoring the session ID and replacing it
   * in the session with the supplied ID. If there is no supplied ID or session
   * ID, the method returns a null object.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param communityId The community ID that the organization in session should
   *          have. If an organization is stored in session that does not have
   *          this community ID, a new object will be created with this ID and
   *          stored in the old object's place.
   * @return BsOrganization for communityID that is stored in session for user
   * @exception SQLException thrown if a database error occurs while retrieving
   *              information
   */
  public static BsOrganization getOrganization(HttpServletRequest request,
                                               BigInteger communityId) {
    BsOrganization organization = null;
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();

    BigInteger sessionCommunityId =
      (BigInteger)request.getSession().getAttribute("organization");

    if (communityId == null && sessionCommunityId != null) {
      // Use the session community ID to get the object.
      organization =
        delegate.getOrganizationByCommunityId(new BigInteger(sessionCommunityId.toString()));
      SessionHandler.setOrganization(request, organization);
    } else if (communityId != null && sessionCommunityId == null) {
      // Use the community ID to get the object and store that ID in the
      // session as the organization.
      organization =
        delegate.getOrganizationByCommunityId(new BigInteger(communityId.toString()));
      SessionHandler.setOrganization(request, organization);
    } else if (!sessionCommunityId.equals(communityId)) {
      // IDs are different, instantiate from supplied ID and store that ID in
      // the session.
      organization =
        delegate.getOrganizationByCommunityId(new BigInteger(communityId.toString()));
      SessionHandler.setOrganization(request, organization);
    } else {
      // Just instantiate the object, both IDs are the same.
      organization =
        delegate.getOrganizationByCommunityId(new BigInteger(communityId.toString()));
    }

    setOrganization(request, organization);
    return organization;
  }

  /**
   * Retrieves a person's community ID stored in user's session. This value is
   * set, along with user's name and curator status, when user logs in. The user
   * must be logged in to call this method or it throws an
   * InvalidLoginException.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return BigInteger Community ID stored in session for user
   * @exception InvalidLoginException thrown if no ID found in user's session
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static BigInteger getCommunityID(HttpServletRequest request)
      throws InvalidLoginException {

    BigInteger communityID =
      (BigInteger)request.getSession().getAttribute("communityID");
    if (communityID == null) {
      throw new InvalidLoginException("User not logged in");
    }
    return communityID;
  }

  /**
   * Retrieves the community ID of the person logged in to the current session.
   * This ID is set at login and doesn't change until logout.
   * 
   * @param request the HTTP request containing the current session
   * @return the community ID of the currently logged in person
   * @throws InvalidLoginException when the current session does not contain a
   *           logged-in user
   */
  public static BigInteger getLoginId(HttpServletRequest request)
      throws InvalidLoginException {

    BigInteger communityID =
      (BigInteger)request.getSession().getAttribute("loginId");
    if (communityID == null) {
      throw new InvalidLoginException("User not logged in");
    }
    return communityID;
  }

  /**
   * Return the NEW person (if any) stored in the session earlier.
   * 
   * @param request the request giving access to the session attributes
   * @return the just-created person, or null if there is none
   * @throws InvalidSessionException when there is no new person in the session
   */
  public static BsPerson getNewPerson(HttpServletRequest request)
      throws InvalidSessionException {
    BigInteger sessionId = null;

    // Get the new person's community id.
    sessionId = (BigInteger)request.getSession().getAttribute("newPerson");
    if (sessionId == null) {
      throw new InvalidSessionException("No new person id in session for this user");
    }

    // Look up person in database or data access cache.
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(sessionId);
    if (person == null) {
      throw new RuntimeException("Could not find new person in database with community id "
                                 + (sessionId == null ? "null" : sessionId));
    }

    return person;
  }

  /**
   * Determines whether person has a community ID in session. User will not have
   * an ID in session if they are not logged in, or if they are a new user who
   * is in the middle of the registration process. This method is helpful to
   * determine whether an id is in session without being forced to handle an
   * <code>InvalidLoginException</code> if it's missing (as in getCommunityID()
   * );
   * 
   * @param request HTTP request
   * 
   * @return <code>true</code> if user has a community ID stored in session, or
   *         <code>false</code> if no community ID found in session
   */
  public static boolean hasCommunityID(HttpServletRequest request) {
    return (request.getSession().getAttribute("communityID") != null);
  }

  /**
   * Determines whether person has a login ID (the community ID of the logged-in
   * user) in session. User will not have an ID in session if they are not
   * logged in, or if they are a new user who is in the middle of the
   * registration process. This method is helpful to determine whether an id is
   * in session without being forced to handle an
   * <code>InvalidLoginException</code> if it's missing (as in getLoginId() );
   * 
   * @param request HTTP request
   * 
   * @return <code>true</code> if user has a community ID stored in session as
   *         the login id, or <code>false</code> if no login ID found in session
   */
  public static boolean hasLoginId(HttpServletRequest request) {
    return (request.getSession().getAttribute("loginId") != null);
  }

  /**
   * Retrieves a person's person ID stored in user's session. This value is set,
   * along with user's name and curator status, when user logs in.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return Person ID stored in session for user
   * @exception InvalidLoginException thrown if no ID found in user's session
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static BigInteger getPersonID(HttpServletRequest request)
      throws InvalidLoginException {
    BigInteger personID = personId(request);
    if (personID == null)
      throw new InvalidLoginException("User not logged in");
    return personID;
  }

  /**
   * Get the current person id from the session.
   * 
   * @param request the HTTP request containing the session
   * @return the person id
   */
  public static BigInteger personId(HttpServletRequest request) {
    BigInteger id = null;
    if (request.getSession().getAttribute("personID") != null) {
      id = (BigInteger)request.getSession().getAttribute("personID");
    }
    return id;
  }

  /**
   * Stores a person's community ID in user's session.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param communityID Community ID to be stored for user
   */
  public static void setCommunityID(HttpServletRequest request,
                                    BigInteger communityID) {
    request.getSession().setAttribute("communityID", communityID);
    logger.debug("Setting communityID to " + communityID);
  }

  /**
   * Set the community ID of the logged-in user in the user's session.
   * 
   * @param request the servlet request containing the session
   * @param communityId the community id for the logged-in user
   */
  public static void setLoginID(HttpServletRequest request,
                                BigInteger communityId) {
    request.getSession().setAttribute("loginId", communityId);
    logger.debug("Setting loginId to " + communityId);
  }

  /**
   * Stores a person's person ID in user's session.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param personID Person ID to be stored for user
   */
  public static void setPersonID(HttpServletRequest request, BigInteger personID) {
    request.getSession().setAttribute("personID", personID);
  }

  /**
   * Stores an organization's community id in user's session. All Organization
   * update functions accessed by <code>CommunityServlet</code> store the
   * community id of an <code>BsOrganization</code> in session for processing
   * across multiple requests.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param organization Organization to be stored for user
   * @see CommunityServlet
   */
  public static void setOrganization(HttpServletRequest request,
                                     BsOrganization organization) {
    if (organization != null) {
      request.getSession().setAttribute("organization",
                                        organization.getCommunityId());
    }
  }

  /**
   * Stores a person's community id in user's session. All Person update
   * functions accessed by <code>CommunityServlet</code> operate on the person
   * using this community id to identify it over multiple requests.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param person the person to store
   * @param organization Organization to be stored for user
   * @see CommunityServlet
   */
  public static void setPerson(HttpServletRequest request, BsPerson person) {
    setCommunityID(request, person.getCommunityId());
  }

  /**
   * Set a NEW person object (an object created but not yet inserted into the
   * database) into the session. Another client can extract the newly created
   * person from the session without needing to create yet another one.
   * 
   * @param request the request with the session
   * @param person the newly created person object
   */
  public static void setNewPerson(HttpServletRequest request, BsPerson person) {
    request.getSession().setAttribute("newPerson", person.getCommunityId());
  }

  /**
   * Remove the BsPerson id that represents a NEW person from the session. You
   * should call this method after persisting the new person.
   * 
   * @param request the request giving access to the session
   */
  public static void removeNewPerson(HttpServletRequest request) {
    request.getSession().removeAttribute("newPerson");
  }

  /**
   * Stores a person's name in user's session. This value is set, along with
   * user's community ID and curator status, when user logs in.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param name the name to store
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static void setPersonName(HttpServletRequest request, String name) {
    request.getSession().setAttribute("name", name);
  }

  /**
   * Stores a person's TAIR curator status in user's session. This value is set,
   * along with user's community ID and name, when user logs in. If this value
   * is <code>true</code> user is a TAIR curator and will be granted access to
   * protected areas and functionality of the TAIR website; if
   * <code>false</code> user is not a TAIR curator and will only be able to
   * access normal user functions. As a convenience, TAIR curators have their
   * session expiration set to 4 hours to minimize the number of times they need
   * to log in.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param isTairCurator status to be stored in session for user
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static void setTairCurator(HttpServletRequest request,
                                    Boolean isTairCurator) {
    HttpSession session = request.getSession();
    session.setAttribute("isTairCurator", isTairCurator);

    // if curator, set session expire time to 4 hrs. (14400 seconds)
    if (isTairCurator.booleanValue()) {
      session.setMaxInactiveInterval(14400);
    }
  }

  /**
   * Stores a person's External curator status in user's session. This value is
   * set, along with user's community ID and name, when user logs in. If this
   * value is <code>true</code> user is an External curator; if
   * <code>false</code> user is not an External curator. This value is not
   * currently used by the TAIR website to grant or restrict access in any way
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param isExternalCurator status to be stored in session for user
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static void setExternalCurator(HttpServletRequest request,
                                        Boolean isExternalCurator) {
    request.getSession().setAttribute("isExternalCurator", isExternalCurator);
  }

  /**
   * Retrieves a person's TAIR curator status stored in user's session. This
   * value is set, along with user's community ID and name when user logs in. If
   * this value is <code>true</code> user is a TAIR curator and will be granted
   * access to protected areas and functionality of the TAIR website; if
   * <code>false</code> user is not a TAIR curator and will only be able to
   * access normal user functions.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return Boolean representing person's TAIR curator status stored in user's
   *         session. If <code>true</code>, user is a TAIR curator; if
   *         <code>false</code>, user is not a TAIR curator
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static Boolean getTairCurator(HttpServletRequest request) {
    Boolean b = (Boolean)request.getSession().getAttribute("isTairCurator");
    return b == null ? new Boolean(false) : b;
  }

  /**
   * Retrieves a person's External curator status stored in user's session. This
   * value is set, along with user's community ID and name when user logs in. If
   * this value is <code>true</code> user is an External curator; if
   * <code>false</code> user is not an External curator. This value is not
   * currently used by the TAIR website to grant or restrict access in any way
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return Boolean representing person's External curator status stored in
   *         user's session. If <code>true</code>, user is an External curator;
   *         if <code>false</code>, user is not an External curator
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static Boolean getExternalCurator(HttpServletRequest request) {
    return (Boolean)request.getSession().getAttribute("isExternalCurator");
  }

  /**
   * Retrieves a person's donor status stored in user's session. This value is
   * set, along with user's community ID and name when user logs in. If this
   * value is <code>true</code> user is a stock donor; if <code>false</code>
   * user is not a stock donor. This value is used to allow stock donors to
   * search for orders placed for stocks from the donor's collection
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return Boolean representing person's donor status stored in user's
   *         session. If <code>true</code>, user is a donor; if
   *         <code>false</code>, user is not a donor
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static Boolean getDonorStatus(HttpServletRequest request) {
    return (Boolean)request.getSession().getAttribute("isDonor");
  }

  /**
   * Stores a person's donor status in user's session. This value is set, along
   * with user's community ID and name, when user logs in. If this value is
   * <code>true</code> user is a donor; if <code>false</code> user is not a
   * donor.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param isDonor donor status to be stored in session for user
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static void setDonorStatus(HttpServletRequest request, Boolean isDonor) {
    request.getSession().setAttribute("isDonor", isDonor);
  }

  /**
   * Retrieves community IDs for any stock donor labs person is PI or contact
   * person for. These are values are set in user's session when user logs in.
   * If array returned is not <code>null</code> user is PI or contact person of
   * a stock donor lab; otherwise user is not PI or contact person of a stock
   * donor lab. These values * are used to allow stock donors to search for
   * orders placed for stocks from the donor lab's collection
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return List of donor lab community ids person is PI or contact person for,
   *         or <code>null</code> if user is not a PI or contact person of a
   *         donor lab
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static Long[] getDonorLabIDs(HttpServletRequest request) {
    return (Long[])request.getSession().getAttribute("donorLabIDs");
  }

  /**
   * Stores list of communityIDs of any stock donor labs user is PI or contact
   * person for in user's session. This value is set, along with user's
   * community ID and name, when user logs in. If this list is not null, user is
   * a PI or contact person for a donor lab; if <code>null</code> user is not PI
   * or contact person of a donor lab.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param donorLabIDs community ids for which to store donor lab status
   * @see LoginChecker#login(HttpServletRequest, String, String, DBconnection )
   */
  public static void setDonorLabIDs(HttpServletRequest request,
                                    Long[] donorLabIDs) {
    request.getSession().setAttribute("donorLabIDs", donorLabIDs);
  }

  /**
   * Stores whether a person is PI for any labs or not. This value is set, along
   * with user's community ID and name, when user logs in. If this value is
   * <code>true</code> user is a PI; if <code>false</code> user is not a PI.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param isPI whether the person is PI, true or false
   */
  public static void setIsPI(HttpServletRequest request, Boolean isPI) {
    request.getSession().setAttribute("isPI", isPI);
  }

  /**
   * Set the current user as contact person in the session.
   * 
   * @param request the HTTP request containing the session
   * @param isContactPerson whether the person is a contact person true or false
   */
  public static void setIsContactPerson(HttpServletRequest request,
                                        Boolean isContactPerson) {
    request.getSession().setAttribute("isContactPerson", isContactPerson);
  }

  /**
   * Retrieves session value for whether a person is PI for any labs or not.
   * 
   * @param request HTTP request
   * 
   * @return Boolean value w/simple value of <code>true</code> if user is PI for
   *         at least one active lab; returns <code>null</code> or boolean value
   *         of <code>false</code> if user is not a PI, or if user isn't yet
   *         logged in
   */
  public static Boolean getIsPI(HttpServletRequest request) {
    return (Boolean)request.getSession().getAttribute("isPI");
  }

  /**
   * Is the current user a contact person?
   * 
   * @param request the HTTP request containing the session
   * @return true or false
   */
  public static Boolean getIsContactPerson(HttpServletRequest request) {
    return (Boolean)request.getSession().getAttribute("isContactPerson");
  }

  /**
   * Retrieves a users's SearchSession object. If no existing object is found,
   * <code>null</code> is returned. No new object will be created.
   * 
   * @param request HttpServletRequest used to retrieve user's session data
   * @return SearchSession object containing info on all searches in progress
   */
  public static SearchSession getSearchSession(HttpServletRequest request) {
    return (SearchSession)request.getSession().getAttribute("searchSession");
  }

  /**
   * <p>
   * Retrieves a user's SearchSession object from session, creating a new search
   * session if none is in progress.
   * </p>
   * <p>
   * This version of the method is provided for cases where client code relies
   * on SearchSession to obtain a db connection and return it to the pool
   * independently from client code. If client code already has a connection
   * checked out from connection pool when calling this method, search session
   * should be retrieved in the method version that explicitly takes connection
   * as a parameter to ensure that code does not inadvertently check out two
   * connections at once.
   * </p>
   * 
   * @param request HttpServletRequest used to retrieve user's session data
   * @param type Search type requested
   * @return SearchSession object containing info on all searches in progress
   * @throws SQLException when there is a database problem
   */
  public static SearchSession getSearchSession(HttpServletRequest request,
                                               String type) throws SQLException {

    HttpSession session = request.getSession();
    SearchSession searchSession =
      (SearchSession)session.getAttribute("searchSession");

    if (searchSession == null) {
      searchSession = new SearchSession();

      // save for next time
      session.setAttribute("searchSession", searchSession);
    }
    searchSession.registerSearch(type, session.getId());

    return searchSession;
  }

  /**
   * <p>
   * Retrieves a user's SearchSession object from session, creating a new search
   * session if none is in progress.
   * </p>
   * <p>
   * This version of the method is provided for cases where client code relies
   * on SearchSession to obtain a db connection and return it to the pool
   * independently from client code. If client code already has a connection
   * checked out from connection pool when calling this method, search session
   * should be retrieved in the method version that explicitly takes connection
   * as a parameter to ensure that code does not inadvertently check out two
   * connections at once. This version also uses a user-supplied query id
   * instead of the session id GUID (usually a hash of the type).
   * </p>
   * 
   * @param request HttpServletRequest used to retrieve user's session data
   * @param type Search type requested
   * @param queryId the session query id for the search in progress
   * @return SearchSession object containing info on all searches in progress
   * @throws SQLException when there is a database problem
   */
  public static SearchSession getSearchSession(HttpServletRequest request,
                                               String type, String queryId)
      throws SQLException {

    HttpSession session = request.getSession();
    SearchSession searchSession =
      (SearchSession)session.getAttribute("searchSession");

    if (searchSession == null) {
      searchSession = new SearchSession();

      // save for next time
      session.setAttribute("searchSession", searchSession);
    }
    searchSession.registerSearch(type, queryId);

    return searchSession;
  }

  /**
   * Retrieves a user's SearchSession object from session. If no existing object
   * is found, a new one is created and stored in session for future use. In
   * either case, the submitted search type is registered with the SearchSession
   * object so that any necessary temp tables for searching will be created or
   * cleaned up.
   * 
   * @param request HttpServletRequest used to retrieve user's session data
   * @param conn An active connection to the database
   * @param type Search type requested
   * @return SearchSession object containing info on all searches in progress
   * @throws SQLException when there is a database problem
   */
  public static SearchSession getSearchSession(HttpServletRequest request,
                                               DBconnection conn, String type)
      throws SQLException {

    HttpSession session = request.getSession();
    SearchSession searchSession =
      (SearchSession)session.getAttribute("searchSession");

    if (searchSession == null) {
      searchSession = new SearchSession();
      // save for next time
      session.setAttribute("searchSession", searchSession);
    }
    searchSession.registerSearch(type, session.getId());

    return searchSession;
  }

  /**
   * Returns a tair accession number stored in session. This is useful for
   * Notepad functions, where we want to return user to page they initiated an
   * action on several screens ago
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return URL to return user to, or <code>null</code> if no value found
   *         stored for this user
   */
  public static String getReturnAccession(HttpServletRequest request) {
    return (String)request.getSession().getAttribute("returnAccession");
  }

  /**
   * Stores a tair accession number in session. This is useful for Notepad
   * functions, where we want to return user to detail page they initiated an
   * action on several screens ago
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param accession TAIR accession to store for user
   */
  public static void setReturnAccession(HttpServletRequest request,
                                        String accession) {
    request.getSession().setAttribute("returnAccession", accession);
  }

  /**
   * Removes tair accession number stored in user's session. This is done after
   * user has been redirected to original detail page using stored accession, so
   * that accession no longer needs to be stored.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   */
  public static void removeReturnAccession(HttpServletRequest request) {
    request.getSession().removeAttribute("returnAccession");
  }

  /**
   * Determines if a tair accession number is stored in user's session for use
   * in returning user to original detail page after completing Notepad
   * functions
   * 
   * @param request the HTTP request containing the session
   * 
   * @return <code>true</code> if non-null value is found for tair accession
   *         number in user's session; <code>false</code> if no accession number
   *         found
   */
  public static boolean hasReturnAccession(HttpServletRequest request) {
    String accession = getReturnAccession(request);
    return (accession != null);
  }

  /**
   * Returns a notepad entry stored in session. This is useful for Notepad
   * functions, where creation and storage of notepad entry takes place over
   * multiple pages.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return Notepad object stored in session, or <code>null</code> if no
   *         notepad object found
   */
  public static Notepad getNotepad(HttpServletRequest request) {
    Notepad note = (Notepad)request.getSession().getAttribute("notepad");
    return note;
  }

  /**
   * Stores a notepad entry in session. This is useful for Notepad functions,
   * where creation and storage of notepad entry takes place over multiple
   * pages.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's <
   *   code>HttpSession</code>
   * @param notepad Notepad object to store in session
   */
  public static void setNotepad(HttpServletRequest request, Notepad notepad) {
    request.getSession().setAttribute("notepad", notepad);
  }

  /**
   * Removes notepad entry stored in user's session. This is done after notepad
   * entry has been stored to the database.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   */
  public static void removeNotepad(HttpServletRequest request) {
    request.getSession().removeAttribute("notepad");
  }

  /**
   * Determines if a notepad entry is stored in user's session
   * 
   * @param request the HTTP request containing the session
   * 
   * @return <code>true</code> if non-null value is found for notepad entry in
   *         user's session; <code>false</code> if no accession number found
   */
  public static boolean hasNotepad(HttpServletRequest request) {
    Notepad note = getNotepad(request);
    return (note != null);
  }

  /**
   * Returns a community state object stored in session. Community state tracks
   * various info. for a user as they proceed through community profile
   * maintenance pages. If no community state is found in session, a new, empty
   * object will be created and returned.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @return CommunityState object stored in session
   */
  public static CommunityState getCommunityState(HttpServletRequest request) {
    CommunityState state =
      (CommunityState)request.getSession().getAttribute("communityState");

    // if not found, create new state object & save for future use
    if (state == null) {
      state = new CommunityState();
      request.getSession().setAttribute("communityState", state);
    }

    return state;
  }

  /**
   * Stores a community state object in session. Community state tracks various
   * info. for a user as they proceed through community profile maintenance
   * pages
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param state CommunityState object to store in session
   */
  public static void setCommunityState(HttpServletRequest request,
                                       CommunityState state) {
    request.getSession().setAttribute("communityState", state);
  }

  /**
   * Removes community state entry stored in user's session.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   */
  public static void removeCommunityState(HttpServletRequest request) {
    request.getSession().removeAttribute("communityState");
  }

  /**
   * Stores an expression search session object in user's session. This object
   * holds expression search data needed for persisting user's input between
   * multiple views of expression search form.
   * 
   * @param request <code>HttpServletRequest</code> used to retrieve user's
   *          <code>HttpSession</code>
   * @param expressionSearchSession Expression search session object to store in
   *          session
   */
  public static void setExpressionSearchSession(HttpServletRequest request,
                                                ExpressionSearchSession expressionSearchSession) {
    request.getSession().setAttribute("expressionSearchSession",
                                      expressionSearchSession);
  }

  /**
   * Retrieves an expression search session object previously stored in user's
   * session
   * 
   * @param request <code>HttpServletRequest</code> used to access user's
   *          <code>HttpSession</code>
   * @return ExpressionSearchSession previously stored for user, or
   *         <code>null</code> if no expresion search session data found.
   */
  public static ExpressionSearchSession getExpressionSearchSession(HttpServletRequest request) {
    return (ExpressionSearchSession)request.getSession().getAttribute("expressionSearchSession");
  }

  /**
   * Removes an expression search session object previously stored in user's
   * session. This should be done by expression search when search is finally
   * executed
   * 
   * @param request <code>HttpServletRequest</code> used to access user's
   *          <code>HttpSession</code>
   */
  public static void removeExpressionSearchSession(HttpServletRequest request) {
    request.getSession().removeAttribute("expressionSearchSession");
  }

  /**
   * Set the flag to continue the order (true) or finish it (false).
   * 
   * @param req the HTTP request containing the session
   * @param b true to continue, false to finish
   */
  public static void setContinueOrder(HttpServletRequest req, boolean b) {
    req.getSession().setAttribute("doContinueOrder", (Boolean)b);
  }

  /**
   * Get the "doContinueOrder" flag setting from the session to determine
   * whether to show a Continue Order button or an alternative navigational
   * choice. If the flag is set to null, this method returns FALSE.
   * 
   * @param req the HTTP request containing the session
   * @return the setting for the session attribute or FALSE if null
   */
  public static boolean getContinueOrder(HttpServletRequest req) {
    Boolean b = (Boolean)req.getSession().getAttribute("doContinueOrder");
    return b == null ? Boolean.FALSE : b.booleanValue();
  }

  /**
   * Get the universally unique TAIR session identifier (UUID) from the current
   * session in a specified request. If this is the first time, there will be no
   * uuid in the session and this method creates it and stores it in the
   * session.
   * 
   * @param req the request containing the session
   * @return a uuid as a string
   */
  public static String getSessionUuid(HttpServletRequest req) {
    String uuid = (String)req.getSession().getAttribute("tairUuid");
    if (uuid == null) {
      uuid = UUID.randomUUID().toString();
      req.getSession().setAttribute("tairUuid", uuid);
    }
    return uuid;
  }

}
