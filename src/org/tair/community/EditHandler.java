/**
 * Copyright 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsAffiliation;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.bs.delegate.DelegateException;
import com.poesys.db.InvalidParametersException;
import com.poesys.db.dto.DtoStatusException;


/**
 * EditHandler retrieves Community record (new or existing) for editing,
 * redirecting user to forced duplicate searches as necessary. EditHandler
 * creates an instance of either <code>BsPerson</code> or
 * <code>BsOrganization</code> depending on the value of "type" parameter in the
 * referenced <code>HttpServletRequest</code> (must be either "person" or
 * "organization"). Once the business object has been created, it is stored in
 * user's <code>HttpSession</code> using <code>SessionHandler</code> object so
 * multiple page edits and updates can occur without retrieving new copy of the
 * object every time.
 * 
 * <p>
 * When requesting that a new person or organization be created, EditHandler
 * first checks to make sure that the "searched" parameter in the
 * <code>HttpServletRequest</code> has been set to true before creating the
 * object and redirecting to the edit page(s). If "searched" is not "true",
 * non-curator users are redirected to a duplicate search where they must enter
 * values to ensure their record does not already exist in the database. Curator
 * user is not forced to do this search since it is assumed they know for
 * certain that the record does not exist.
 * 
 * <p>
 * When requesting that an existing record be created for editing, EditHandler
 * first determines whether user has correct permissions to edit this record
 * through <code>LoginChecker</code>. Only authorized users will be able to edit
 * a record.
 * 
 * <p>
 * If a user requests that a new lab or organization be created, that user is
 * automatically affiliated to the new organization. If new organization is a
 * lab, user is automatically declared PI for that lab.
 * 
 * <p>
 * Since EditHandler is the first step in all state-dependent maintenance
 * operations, EditHandler will initialize CommunityState object with various
 * request params that are used throughout process to make decisions on UI and
 * redirection (such as whether record being edited is new or not)
 * 
 * @see SessionHandler
 * @see LoginChecker
 * @see CommunityState
 */

public class EditHandler implements RequestHandler {

  /**
   * Process an edit request from the user to set up all necessary data
   * structures for the editing process. Any database objects created or updated
   * are committed to the database immediately.
   * 
   * @param request <code>HttpServletRequest</code> passed from CommunityServlet
   * @return RequestHandlerResponse with next page to which to forward
   * @throws InvalidParameterException when not person or organization type
   * @throws SQLException when there is a database error
   * @throws InvalidLoginException when there is no logged-in user
   * @throws UnauthorizedRequestException when the logged-in user does not have
   *           permission to edit the object
   * @throws InvalidSessionException when no community member in session
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidFormException, InvalidLoginException, SQLException,
      UnauthorizedRequestException, InvalidParameterException,
      InvalidSessionException {

    CommunityState state = initializeCommunityState(request);
    String type = getType(request, state);

    // Determine whether there is a new person or organization being created.
    boolean isNewPerson = state.getBooleanValue("new_person");
    boolean isNewOrganization = state.getBooleanValue("new_org");

    RequestHandlerResponse response = null;
    if (type.equals("person") && isNewPerson) {
      response = getNewPerson(request);
    } else if (type.equals("organization") && isNewOrganization) {
      response = getNewOrganization(request, state);
    } else { // else get existing record, passing in type to differentiate
      response = getExisting(request, type);
    }

    return response;
  }

  /**
   * Get the type of object being edited.
   * 
   * @param request the HTTP request containing the session
   * @param state the community state from the session
   * @return the type of object to edit (person or organization)
   * @throws InvalidSessionException when there is no type in the session
   * @throws InvalidParameterException when not person or organization type
   */
  private String getType(HttpServletRequest request, CommunityState state)
      throws InvalidSessionException, InvalidParameterException {
    String type = state.getStringValue("type");
    if (type == null) {
      throw new InvalidSessionException("No community type found");
    } else if (!type.equals("person") && !type.equals("organization")) {
      throw new InvalidParameterException("Invalid community type requested: "
                                          + type);
    }
    return type;
  }

  /**
   * <p>
   * Initializes the community state object that controls processing of the
   * requested editing, including the kind of object (person or organization)
   * and whether the object is new.
   * </p>
   * <p>
   * If a new record is being created, method initializes the "first_person" or
   * "first_org" parameters to flag that the user is proceeding through the
   * community registration page sequence for the first time. These flags
   * determine redirection of the user to different pages at different times in
   * the process. Once the user reaches the main profile page for either type,
   * the page resets the first parameter and all subsequent operations occur
   * with the same flow as the updating of an existing record.
   * </p>
   * <p>
   * When new records are first created, request parameters differentiate a
   * "lab" from other organizations. This value is stored in CommunityState for
   * reference throughout organization maintenance process
   * </p>
   * <p>
   * New organizations can be created as part of a person's profile maintenance
   * or as a standalone operation. The application sets the community state
   * parameter "solo" to flag when the organization is being created separately
   * from a person update. This is determined through presence or absence of the
   * person in the session.
   * 
   * @param request HttpServletRequest from CommunityServlet
   * @return CommunityState object containing various state properties
   *         initialized according to user's submission
   */
  private CommunityState initializeCommunityState(HttpServletRequest request) {

    CommunityState state = SessionHandler.getCommunityState(request);

    String type = request.getParameter("type");
    state.setStateValue("type", type);

    String newStr = request.getParameter("new");
    boolean isNew = CommunityState.translateBooleanValue(newStr);

    if (type.equals("person") && !isNew)
      state.removeStateValue("new_person");
    else if (type.equals("person") && isNew) {
      state.setStateValue("new_person", "true");

      // record that this is first time through registration
      state.setStateValue("first_person", "true");

    } else if (type.equals("organization")) {
      if (isNew) {
        state.setStateValue("new_org", "true");

        // record that this is first time through registration
        state.setStateValue("first_org", "true");
      }

      // record whether organization is a lab or "other" organization
      state.setStateValue("lab", request.getParameter("lab"));

      // record whether organization update is being done on its
      // own, or as part of a person update.
      String solo = SessionHandler.hasPerson(request) ? "false" : "true";
      state.setStateValue("solo", solo);
    }

    return state;
  }

  /**
   * Creates BsPerson object to be used in new person registration and stores in
   * database (with id in session) for use throughout maintenance pages.
   * Non-curator users will be redirected to do a search for duplicate records
   * before object is actually created. Method determines whether user has
   * already done duplicate search or not by looking at the "searched" request
   * parameter.
   * 
   * @param request HttpServletRequest from CommunityServlet
   * @return RequestHandlerResponse with URL of JSP to redirect user to (will be
   *         either duplicate search page, or new person form)
   */
  private RequestHandlerResponse getNewPerson(HttpServletRequest request) {

    RequestHandlerResponse response = new RequestHandlerResponse();

    boolean searched =
      CommunityState.translateBooleanValue(request.getParameter("searched"));

    // force duplication search for new person - assume curator knows
    // there is no duplicate & skip for them
    if (searched || LoginChecker.isTairCurator(request)) {
      // Create the community object first with suitable defaults.
      Timestamp today = new Timestamp(System.currentTimeMillis());
      CommunityDelegate commDelegate =
        CommunityDelegateFactory.getCommunityDelegate();
      BsCommunity community =
        commDelegate.createCommunity(null, // creates new sequence id
                                     BsCommunity.Type.PERSON.toString(),
                                     null,
                                     today,
                                     today,
                                     null,
                                     null,
                                     false,
                                     null,
                                     null,
                                     BsCommunity.Status.INCOMPLETE.toString(),
                                     0);
      // Create the person with suitable defaults and add the community to it.
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      /*
       * The "Enter Last Name" in the createPerson call that follows is because
       * this new person must be saved to the database, and the last name column
       * is NOT NULL. The string may therefore show up on the data entry form.
       * In any case, you can't use an empty string "" here because Oracle
       * translates those to NULL and then throws an error on insert.
       */
      BsPerson person = delegate.createPerson(null, // creates new sequence id
                                              "Enter Last Name",
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              false,
                                              false,
                                              false,
                                              null,
                                              null,
                                              null,
                                              true,
                                              community.getCommunityId());
      try {
        person.setCommunity(community);
      } catch (InvalidParametersException e) {
        // community is null
        throw new DelegateException("Could not create community member object for person");
      } catch (DtoStatusException e) {
        // couldn't change status to changed, ignore as undo this anyway
      }
      // Store the new person and cache it for later use.
      List<BsPerson> list = new ArrayList<BsPerson>(1);
      list.add(person);
      delegate.insert(list);
      // Set the new person id into the session for later access.
      SessionHandler.setNewPerson(request, person);
      // Set the community id into the session as a "person" id.
      SessionHandler.setPerson(request, person);
      response.setPage(CommunityPageHolder.getEditPersonPage());

    } else {
      response.setPage("/jsp/community/new_person_search.jsp");
    }

    return response;
  }

  /**
   * <p>
   * Creates BsOrganization object to be used in new organization registration
   * and stores in session for use throughout maintenance pages. Non-curator
   * users will be redirected to do a search for duplicate records before object
   * is actually created. Method determines whether user has already done
   * duplicate search or not by looking at the "searched" request parameter.
   * </p>
   * <p>
   * Labs are treated differently throughout the process. If user is requesting
   * a new lab be created, they will be redirected to a specialized duplicate
   * lab search, or to the new lab registration form. All other organizations
   * will be redirected to organization duplication search and registration
   * form. Also, for a new lab, the system uses the current user's name and
   * address for the new lab--"<name> Laboratory" and the various address
   * fields.
   * </p>
   * 
   * @param request HttpServletRequest from CommunityServlet
   * @param state
   * @return RequestHandlerResponse with URL of JSP to redirect user to (will be
   *         lab/org duplicate search page, or lab/org new registration form)
   * @throws InvalidSessionException
   * @throws SQLException
   * @throws InvalidLoginException
   */
  private RequestHandlerResponse getNewOrganization(HttpServletRequest request,
                                                    CommunityState state)
      throws InvalidSessionException, SQLException, InvalidLoginException {

    RequestHandlerResponse response = new RequestHandlerResponse();

    boolean searched =
      CommunityState.translateBooleanValue(request.getParameter("searched"));

    // if user has already done a duplicate search, or if is curator (who
    // by assumption knows there is not a duplicate org.), create organization
    // object, store in session and forward to new registration page
    if (searched || LoginChecker.isTairCurator(request)) {
      // Create the community object first with suitable defaults.
      Timestamp today = new Timestamp(System.currentTimeMillis());
      CommunityDelegate commDelegate =
        CommunityDelegateFactory.getCommunityDelegate();
      BsCommunity community =
        commDelegate.createCommunity(null, // creates new sequence id
                                     BsCommunity.Type.ORGANIZATION.toString(),
                                     null,
                                     today,
                                     today,
                                     null,
                                     null,
                                     false,
                                     null,
                                     null,
                                     BsCommunity.Status.INCOMPLETE.toString(),
                                     0);
      // Create the organization with suitable defaults and add the community to
      // it.
      OrganizationDelegate orgDelegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      String type = BsOrganization.Type.OTHER.toString();
      if (state.getBooleanValue("lab")) {
        type = BsOrganization.Type.LAB.toString();
      }
      // Create the organization, generating a new id with null.
      BsOrganization organization =
        orgDelegate.createOrganization(null,
                                       "Name",
                                       type,
                                       null,
                                       false,
                                       false,
                                       false,
                                       "ABRC",
                                       null,
                                       null,
                                       community.getCommunityId(),
                                       null);
      try {
        organization.setCommunity(community);
      } catch (InvalidParametersException e) {
        // null community
        throw new DelegateException("Could not create community for organization");
      }

      // Store the organization.
      List<BsOrganization> list = new ArrayList<BsOrganization>(1);
      list.add(organization);
      orgDelegate.insert(list);

      // Remove the default name for display.
      organization.setName("");

      // Set the community id into the session for later use.
      SessionHandler.setOrganization(request, organization);

      // Create affiliation between person and new organization
      setPhantomAffiliation(request, state);

      if (state.getBooleanValue("lab")) {
        response.setPage(CommunityPageHolder.getEditLabPage());

        // set "default" flag for JSP so that person's name & address
        // will be used as default values for lab - will only be used
        // first time person sees new lab page
        if (SessionHandler.hasPerson(request)) {
          response.setAttribute("default", new Boolean(true));
        }

      } else {
        response.setPage(CommunityPageHolder.getEditOrgPage());
      }

      // if user not curator, force duplication search
    } else {

      if (state.getBooleanValue("lab")) {
        response.setPage("/jsp/community/new_lab_search.jsp");
      } else {
        response.setPage("/jsp/community/new_org_search.jsp");
      }
    }

    return response;
  }

  /**
   * Creates Composite object for existing community record and stores in
   * session. Object will be for a person or organization depending on submitted
   * value of type and will be created for community id submitted in
   * "communityID" request parameter. Method will check to make sure that user
   * is authorized to update requested record before allowing access to object.
   * 
   * @param request HttpServletRequest from CommunityServlet
   * @param type Community type of object to create
   * @return RequestHandlerResponse containing URL of JSP to redirect user to
   * @throws InvalidFormException if no community id submitted for editing
   * @throws InvalidParameterException if community id is invalid
   * @throws InvalidLoginException if user is not logged in
   * @throws InvalidSessionException if no object found in session when expected
   * @throws SQLException if a database error occurs while initializing object
   * @throws UnauthorizedRequestException when user is not authorized to update
   *           requested community record
   */
  private RequestHandlerResponse getExisting(HttpServletRequest request,
                                             String type)
      throws InvalidFormException, InvalidParameterException, SQLException,
      UnauthorizedRequestException, InvalidLoginException,
      InvalidSessionException {

    // determine which community id is to be updated
    BigInteger communityId = null;
    if (!TextConverter.isEmpty(request.getParameter("communityID"))) {
      try {
        communityId = new BigInteger(request.getParameter("communityID"));
      } catch (NumberFormatException e) {
        throw new InvalidParameterException(e.getMessage());
      }
    } else {
      throw new InvalidFormException("No profile selected");
    }

    // make sure user is logged in and has authority to update
    // requested record
    if (!LoginChecker.checkAuthorization(request, communityId)) {
      throw new UnauthorizedRequestException("Not authorized to update this community member: "
                                             + communityId);
    }

    // create editable objects from community ID & save in session
    RequestHandlerResponse response = new RequestHandlerResponse();
    if (type.equals("person")) {
      // create object & store in session - ignore return value
      SessionHandler.getPerson(request, communityId);
      if (request.getParameter("continue_order") != null)
        SessionHandler.setContinueOrder(request, true);
      response.setPage(CommunityPageHolder.getPersonProfilePage());

    } else if (type.equals("organization")) {
      // create object & store in session - ignore return value
      SessionHandler.getOrganization(request, communityId);

      response.setPage(CommunityPageHolder.getOrgProfilePage());
    }

    return response;
  }

  /**
   * Creates automatic affiliation to new organization if user is creating one.
   * If new organization is a lab, user is declared pi for that lab. If lab is
   * being created as part of a new person registration, the "phantom" community
   * state parameter will be set to true. This is used for UI decisions
   * throughout registration process.
   * 
   * @param request Request from CommunityServlet
   * @param state Community state object containing various state params
   * @throws InvalidLoginException if user is not logged in
   * @throws InvalidSessionException if an object is not found in session
   * @throws SQLException when the community member can't be lazily loaded
   */
  private void setPhantomAffiliation(HttpServletRequest request,
                                     CommunityState state)
      throws InvalidSessionException, InvalidLoginException, SQLException {

    BsPerson person = null;

    // if new org/affiliation is being created as part of person
    // profile maintenance, there should be a person object already
    // in session - use it to populate affiliation info.
    if (SessionHandler.hasPerson(request)) {
      person = SessionHandler.getPerson(request);

      // if curator and no person already created, skip automatic
      // affiliation to new org -- assumption is that curator is
      // creating an organization w/out meaning to make a specific
      // person a member. Otherwise, create a person object from
      // community id in session and use it to populate affiliation info.
    } else if (!LoginChecker.isTairCurator(request)) {
      person =
        SessionHandler.getPerson(request,
                                 SessionHandler.getCommunityID(request));
    }

    if (person != null) {
      BsOrganization organization = SessionHandler.getOrganization(request);
      if (organization != null) {
        // Both person and organization are in the session, affiliate them.
        affiliate(person, organization);
      }

      // if creating new org as part of new person registration,
      // set "phantom" flag in CommunityState to record condition -
      // this value is used later to redirect user to complete
      // person profile after completing org profile to make sure
      // affiliation is complete
      String phantomStr =
        state.getBooleanValue("new_person") ? "true" : "false";
      state.setStateValue("phantom", phantomStr);
    }
  }

  /**
   * Affiliate a person with an organization. Create an affiliation and add it
   * to the person and organization. For new labs, set the person as the PI of
   * the lab and set the job title with the primary job title of the person.
   * Commit the new affiliation change to the database.
   * 
   * @param person a person to affiliate to the organization
   * @param organization an organization to which to affiliate the person
   * @throws SQLException if there is a problem storing the affiliation
   */
  private void affiliate(BsPerson person, BsOrganization organization)
      throws SQLException {

    if (person == null) {
      throw new RuntimeException("Person is required for affiliation");
    }
    if (organization == null) {
      throw new RuntimeException("Organization is required for affiliation");
    }

    boolean isLab =
      BsOrganization.Type.LAB.equals(organization.getOrganizationType());
    boolean isPi = isLab ? true : false;
    String jobTitle = isLab ? person.getPrimaryJobTitle() : null;

    CommunityDelegate delegate =
      CommunityDelegateFactory.getCommunityDelegate();

    BsAffiliation affiliation =
      delegate.createAffiliation(person.getCommunity(),
                                 organization,
                                 person.getCommunityId(),
                                 organization.getOrganizationId(),
                                 jobTitle,
                                 isPi,
                                 false,
                                 false,
                                 null);

    // Set the new affiliation into the person and organization.
    person.getCommunity().addAffiliationAffiliation(affiliation);
    person.getCommunity().addOrganizationOrganization(organization);
    organization.addMemberCommunity(person.getCommunity());
    organization.addAffiliationAffiliation(affiliation);

    // Process the community object to insert the affiliation within it.
    List<BsCommunity> list = new ArrayList<BsCommunity>(1);
    list.add(person.getCommunity());
    delegate.process(list);
  }
}
