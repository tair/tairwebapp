/**
 * Copyright 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsAffiliation;
import org.tair.bs.community.BsCommunity.Status;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * CommitHandler handles the storing of a person or organization record to the
 * database once user is ready to commit changes made to their profile
 */

public class CommitHandler implements RequestHandler {

  /**
   * <p>
   * Cleans up community member status information and conducts various
   * notifications, then stores community object in session to the database.
   * Method uses community state parameter "type" to determine whether to update
   * person or organization.
   * </p>
   * <p>
   * <strong>Note that all major changes to the member will already have
   * committed to the database; this commit process is just cleanup.</strong>
   * </p>
   * <p>
   * If the community member is just being created, the member status will be
   * "incomplete" and will be changed to "new".
   * </p>
   * <p>
   * If a person has just updated their address information, and is PI for any
   * labs, a collection of their labs will be added to the request and they will
   * be redirected to a page asking if they want to automatically update the
   * addresses of their labs as well.
   * </p>
   * <p>
   * If organization has just been updated, response page will give different
   * message depending on whether organization was updated as part of person
   * update (or new person registration), or as a stand alone operation.
   * </p>
   * <p>
   * If either person or organization was just deactivated (i.e. had status set
   * to "inactive"), user will be forwarded to page that allows associations to
   * deactivated record to be updated to point to a different community id. This
   * action is only accessible to TAIR curators.
   * </p>
   * 
   * @param request <code>HttpServletRequest</code> passed from calling servlet
   * @return <code>RequestHandlerResponse</code> containing URL of next page
   *         user should be forwarded to, and any request attributes for diplay
   *         on next page
   * @throws SQLException thrown if an error occurs while updating information
   *           in the database
   * @throws InvalidSessionException thrown if an object necessary for
   *           processing is not found in the user's session
   * @throws InvalidParameterException thrown if an invalid type parameter is
   *           received
   * @throws InvalidLoginException thrown if user not logged in
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidParameterException, InvalidLoginException,
      InvalidSessionException, InvalidActionException {

    CommunityState state = SessionHandler.getCommunityState(request);

    String type = state.getStringValue("type");

    if (type == null) {
      throw new InvalidSessionException("Invalid community type found");
    } else if (!type.equals("person") && !type.equals("organization")) {
      throw new InvalidParameterException("Invalid community type requested: "
                                          + type);
    }

    RequestHandlerResponse response = null;

    if (type.equals("person")) {
      response = storePerson(request);
    } else if (type != null && type.equals("organization")) {
      response = storeOrganization(request, state);
    }

    return response;
  }

  /**
   * Gets person id from session, creates BsPerson object, modifies various
   * aspects of the object based on processing done, and commits changes. If
   * person was just deactivated, user is forwarded to page to update
   * associations to a different community record. If person is PI of a lab and
   * just updated their address, user will be redirected to a page to update the
   * address data of their labs as well if desired.
   * 
   * <p>
   * TAIR curators will be redirected directly to personal home page without
   * seeing "committed" message.
   * 
   * @param request the HTTP request containing change information
   * @return a response
   * @throws SQLException when there is a database problem
   * @throws InvalidSessionException when the session doesn't contain relevant
   *           data
   * @throws InvalidLoginException when login isn't complete
   * @throws InvalidActionException when a requested action can't be done
   */
  private RequestHandlerResponse storePerson(HttpServletRequest request)
      throws SQLException, InvalidSessionException, InvalidLoginException,
      InvalidActionException {

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = SessionHandler.getPerson(request);

    List<BsPerson> list = new ArrayList<BsPerson>(1);
    list.add(person);

    // Handle new people by marking the status as new and then removing the
    // "new person" from the session.
    try {
      BsPerson newPerson = SessionHandler.getNewPerson(request);
      if (Status.INCOMPLETE.equals(newPerson.getCommunity().getMemberStatus())) {
        newPerson.getCommunity().setMemberStatus(Status.NEW.toString());
      }
      list.add(newPerson);
      SessionHandler.removeNewPerson(request);
    } catch (InvalidSessionException e) {
      // No new person in session, nothing to do
    }

    // Process the person into the database.
    delegate.process(list);
    
    // Requery the person, object was removed from cache by processing.
    person = SessionHandler.getPerson(request);
    
    // Determine address change status
    boolean isAddressChanged = SessionHandler.isPersonChanged(request);

    RequestHandlerResponse response = new RequestHandlerResponse();

    // if person was just inactivated, prompt to see if different community
    // id should be used for all attributions now -- updating of
    // attributions will be done by CuratorHandler
    if (person.getCommunity().getMemberStatus().equalsIgnoreCase("inactive")) {
      response.setPage("/jsp/community/deactivated.jsp");

      // set reference to community to simplify life at the JSP level
      response.setAttribute("community", person.getCommunity());

      // if person is pi and has changed address info, redirect to ask if
      // lab's address should be updated as well
    } else if (person.isPi() && isAddressChanged) {
      response.setAttribute("labs", getPILabs(person));
      response.setPage("/jsp/community/pi_address.jsp");

      // else show generic committed page
    } else {

      // send confirmation email if account was just activated
      if (person.getCommunity().isActivated()) {
        CommunityEmailHandler.sendPersonActivatedMessage(person);
        // Mark the individual not activated to prevent further emails.
        person.getCommunity().setActivated(false);
      }

      SessionHandler.removePerson(request);

      // Send curator directly back to welcome page w/out seeing committed
      // message
      if (LoginChecker.isTairCurator(request)) {

        Map<String, ListCommunity[]> newCommunities =
          CommunitySearcher.getNewCommunities();
        if (newCommunities != null && !newCommunities.isEmpty()) {
          response.setAttribute("newCommunities", newCommunities);
        }
        // Replace person in response with revised DTO
        if (SessionHandler.getLoginId(request) != null) {
          BigInteger loginId = SessionHandler.getLoginId(request);
          // Reset the community ID to be the login ID.
          SessionHandler.setCommunityID(request, loginId);
        }
        response.setPage(CommunityPageHolder.getWelcomePage());

      } else {
        response.setPage("/jsp/community/person_committed.jsp");
      }
    }

    return response;
  }

  /**
   * Retrieves BsOrganization from session and stores to database. If
   * organization was just deactivated, redirect to page to allow updating of
   * associations to a different community id. If organization was newly created
   * a part of a person profile maintenance "committed" page will urge user to
   * complete their person maintenance to make sure all changes are saved.
   * 
   * <p>
   * TAIR curators will be redirected to personal home page once organization is
   * stored, unless organization was created as part of person profile
   * maintenance
   * 
   * @param request the HTTP servlet request
   * @param state the current community information
   * @return a response
   * @throws SQLException when there is a database problem storing the
   *           organization
   * @throws InvalidActionException when a requested action can't be done
   * @throws InvalidLoginException when login isn't complete
   * @throws InvalidSessionException when the session doesn't contain relevant
   *           information
   * @throws InvalidParameterException when supplied information is invalid
   */
  private RequestHandlerResponse storeOrganization(HttpServletRequest request,
                                                   CommunityState state)
      throws SQLException, InvalidActionException, InvalidLoginException,
      InvalidSessionException, InvalidParameterException {

    BsOrganization organization = SessionHandler.getOrganization(request);

    if (Status.INCOMPLETE.equals(organization.getCommunity().getMemberStatus())) {
      // Creating new organization, set status to NEW
      organization.setMemberStatus(Status.NEW.toString());
    }

    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    List<BsOrganization> list = new ArrayList<BsOrganization>(1);
    list.add(organization);
    delegate.process(list);
    
    // Requery the organization
    organization = SessionHandler.getOrganization(request);

    if (organization.getCommunity().isActivated()) {
      // send confirmation to org's affiliated persons if
      // account was just activated
      CommunityEmailHandler.sendOrganizationActivatedMessage(organization);
    }

    SessionHandler.removeOrganization(request);

    RequestHandlerResponse response = new RequestHandlerResponse();

    // send all non-curator users to "committed" page
    if (!LoginChecker.isTairCurator(request)) {
      response.setPage("/jsp/community/org_committed.jsp");

    } else {

      // if organization was just deactivated, prompt to see if different
      // community id should be used for all attributions now
      if (organization.getCommunity().getMemberStatus().equalsIgnoreCase("inactive")) {
        response.setPage("/jsp/community/deactivated.jsp");

        // set reference to community to simplify life at the JSP level
        response.setAttribute("community", organization.getCommunity());

        // skip committed message if curator updating existing org
        // or adding new one separate from person registration
      } else if (!state.getBooleanValue("new_org")
                 || state.getBooleanValue("solo")) {

        response.setPage(CommunityPageHolder.getWelcomePage());
        Map<String, ListCommunity[]> newCommunities =
          CommunitySearcher.getNewCommunities();
        if (newCommunities != null && !newCommunities.isEmpty()) {
          response.setAttribute("newCommunities", newCommunities);
        }

        if (!TextConverter.isEmpty(SessionHandler.getLoginId(request).toString())) {
          BigInteger loginId =
            new BigInteger(SessionHandler.getLoginId(request).toString());
          IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(loginId);
          PersonDelegate personDelegate =
            CommunityDelegateFactory.getPersonDelegate();
          BsPerson this_person =
            personDelegate.getObject((SequencePrimaryKey)key);
          response.setAttribute("person", this_person);
          // Reset the community ID to the login ID
          SessionHandler.setCommunityID(request, loginId);
        }

        // remove CommunityState from session since completion
        // or org profile is the end of this path through profile
        // pages
        SessionHandler.removeCommunityState(request);

        // if new record created as part of person maintenance,
        // show committed page which will allow link back to
        // person profile
      } else {
        response.setPage("/jsp/community/org_committed.jsp");
      }
    }

    return response;
  }

  /**
   * Get all labs for which a person is PI. This data is needed if PI has just
   * updated their address. In this case, user will be forwarded to a page that
   * allows them to update address of their lab as well; this collection of labs
   * is used for displaying lab data on that page.
   * 
   * @param person the person for which to get labs
   * @return a collection of labs (<code>BsOrganization</code> for which the
   *         person is PI
   * @throws SQLException when there is a database problem executing the query
   */
  private Collection<BsOrganization> getPILabs(BsPerson person)
      throws SQLException {
    Collection<BsOrganization> piLabs = null;
    // Get the affiliated labs.
    Collection<BsAffiliation> labAffiliations = person.getAllLabs();
    // Extract the labs for which the person is principal investigator.
    for (BsAffiliation affiliation : labAffiliations) {
      if (affiliation.getPi()) {
        if (piLabs == null) {
          piLabs = new ArrayList<BsOrganization>();
        }
        piLabs.add(affiliation.getOrganization());
      }
    }

    return piLabs;
  }

}
