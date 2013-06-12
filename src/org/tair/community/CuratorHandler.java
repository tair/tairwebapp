// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.19 $
// $Date: 2003/12/05 16:52:13 $
// ------------------------------------------------------------------------------

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.BooleanWebFormField;
import org.tair.utilities.DefaultWebFormField;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.WebFormField;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * CuratorHandler processes requests for curator specific Community tasks, such
 * as automatically emailing a user their login information, or updating curator
 * fields such as "is_obsolete"
 */

public class CuratorHandler implements RequestHandler {

  // form fields for organization and person
  private DefaultWebFormField status;
  private BooleanWebFormField isObsolete;
  private BooleanWebFormField NASCFeePaid;
  private BooleanWebFormField ABRCFeesWaived;
  private BooleanWebFormField isUserFocus;
  private BooleanWebFormField isExternalCurator;
  private BooleanWebFormField isTairCurator;
  private BooleanWebFormField commercial;
  private WebFormField seedStockCenter;

  /**
   * Uses "curator_action" parameter in request to either update the curator
   * fields of a community record directly to the database, or emails a login
   * reminder to a specified person.
   * 
   * @param request HttpServletRequest passed from CommunityServlet
   * @return RequestHandlerResponse containing page to forward request to for
   *         display
   * @throws SQLException thrown if database errors occur while updating or
   *           retrieving data
   * @throws InvalidParameter thrown if invalid community ID supplied
   * @throws UnauthorizedRequestException thrown if user is not a TAIR curator
   * @throws InvalidSessionException thrown if BsCommunity object not found in
   *           user's session
   * @throws InvalidActionException thrown if trying to do action that violates
   *           business rules, such as incorrectly updating community's status
   * @throws InvalidFormException thrown if no email address submitted when
   *           trying to send reminder, or if community ID submitted for
   *           attribution updating is invalid
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidParameterException,
      UnauthorizedRequestException, InvalidSessionException,
      InvalidActionException, InvalidFormException, InvalidLoginException {

    BsCommunity.Type type = null;
    String curator_action = request.getParameter("curator_action");
    RequestHandlerResponse response = null;

    if (!LoginChecker.isTairCurator(request)) {
      throw new UnauthorizedRequestException("Not authorized for this action");
    }

    CommunityState state = SessionHandler.getCommunityState(request);
    if (state != null) {
      String typeStr = state.getStringValue("type");
      if (typeStr == null || typeStr.length() == 0) {
        throw new InvalidParameterException("Empty community type");
      }
      type =
        BsCommunity.Type.valueOf(state.getStringValue("type").toUpperCase());
      if (type == null) {
        throw new InvalidSessionException("Invalid community type: "
                                          + state.getStringValue("type"));
      }

      if (curator_action != null && curator_action.equals("update")) {
        if (type == BsCommunity.Type.PERSON) {
          response = updatePerson(request);
        } else if (type == BsCommunity.Type.ORGANIZATION) {
          response = updateOrg(request);
        }
      } else if (curator_action != null && curator_action.equals("email")) {
        response = emailReminder(request);
      } else if (curator_action != null && curator_action.equals("deactivate")) {
        response = deactivateCommunity(request, type);
      } else if (curator_action != null && curator_action.equals("delete")) {
        response = deleteCommunity(request, type);
      } else {
        throw new InvalidParameterException("Invalid curator action requested: "
                                            + curator_action);
      }
    } else {
      throw new InvalidParameterException("Empty community state");
    }

    return response;
  }

  /**
   * Update the organization with curator-specific data and commit changes.
   * 
   * @param request the HTTP request containing updates
   * @return a request handler response
   * @throws SQLException when there is a database problem
   * @throws InvalidSessionException when the organization is not in the session
   * @throws InvalidActionException when the update is not valid
   * @throws InvalidParameterException when the data is not valid
   * @throws InvalidLoginException when there is no logged-in user
   */
  private RequestHandlerResponse updateOrg(HttpServletRequest request)
      throws SQLException, InvalidSessionException, InvalidActionException,
      InvalidParameterException, InvalidLoginException {

    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();

    RequestHandlerResponse response = null;
    BsOrganization organization = null;

    createOrgFields();
    organization = SessionHandler.getOrganization(request);
    if (organization != null) {
      organization.getCommunity().setMemberStatus((String)status.validate(request));
      organization.getCommunity().setObsolete((Boolean)isObsolete.validate(request));
      organization.setNascFeePaid((Boolean)NASCFeePaid.validate(request));
      organization.setAbrcFeesWaived((Boolean)ABRCFeesWaived.validate(request));
      organization.setSeedStockCenter((String)seedStockCenter.validate(request));
      organization.setCommercial((Boolean)commercial.validate(request));
      delegate.update(organization);
      // Re-query the organization after cache removal.
      organization = SessionHandler.getOrganization(request);
      // Remove organization from session.
      SessionHandler.removeOrganization(request);
      response = new RequestHandlerResponse();

      if (organization.getCommunity().isInactivated()) {
        // prompt for attribution update
        response.setPage("/jsp/community/deactivated.jsp");

        // set as community to simplify life at the JSP
        response.setAttribute("community", organization.getCommunity());

      } else {
        if (organization.getCommunity().isActivated()) {
          CommunityEmailHandler.sendOrganizationActivatedMessage(organization);
        }
        returnToWelcomePage(request, response);
      }
    } else {
      throw new InvalidSessionException("No organization in session");
    }

    return response;
  }

  /**
   * Update the person with curator-specific data and commit changes.
   * 
   * @param request the HTTP request containing updates
   * @return a request handler response
   * @throws SQLException when there is a database problem
   * @throws InvalidSessionException when the person is not in the session
   * @throws InvalidActionException when the update is not valid
   * @throws InvalidParameterException when the data is not valid
   * @throws InvalidLoginException when there is no logged-in user
   */
  private RequestHandlerResponse updatePerson(HttpServletRequest request)
      throws SQLException, InvalidSessionException, InvalidActionException,
      InvalidParameterException, InvalidLoginException {

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = null;
    RequestHandlerResponse response = null;

    createPersonFields();
    person = SessionHandler.getPerson(request);
    if (person != null) {
      BsCommunity community = person.getCommunity();
      community.setMemberStatus((String)status.validate(request));
      community.setObsolete((Boolean)isObsolete.validate(request));
      person.setUserFocus((Boolean)isUserFocus.validate(request));
      person.setExternalCurator((Boolean)isExternalCurator.validate(request));
      person.setTairCurator((Boolean)isTairCurator.validate(request));
      delegate.update(person);
      // Re-query person after cache removal.
      person = SessionHandler.getPerson(request);
      // Remove the person from the session.
      SessionHandler.removePerson(request);
      response = new RequestHandlerResponse();

      if (community.isInactivated()) {
        // prompt for attribution update
        response.setPage("/jsp/community/deactivated.jsp");

        // set as community to simplify life in JSP
        response.setAttribute("community", person.getCommunity());
      } else {
        if (community.isActivated()) {
          CommunityEmailHandler.sendPersonActivatedMessage(person);
        }
        returnToWelcomePage(request, response);
      }
    } else {
      throw new InvalidSessionException("No person in session");
    }

    return response;

  }

  // 
  /**
   * Send an email reminder of login information to person in session.
   * 
   * @param request the request containing the email address to which to send
   * @return the request handler response
   * @throws InvalidParameterException when there is invalid data
   * @throws InvalidSessionException when the object is not in the session
   * @throws InvalidFormException when the email address is invalid
   */
  private RequestHandlerResponse emailReminder(HttpServletRequest request)
      throws InvalidParameterException, InvalidSessionException,
      InvalidFormException {

    BsPerson person = null;
    RequestHandlerResponse response = null;
    String formEmail = null;

    person = SessionHandler.getPerson(request);
    formEmail = request.getParameter("email");

    if (TextConverter.isEmpty(formEmail)) {
      throw new InvalidFormException("No email address entered");
    } else if (!CommunityFormValidator.validEmail(formEmail)) {
      throw new InvalidFormException("The email address " + formEmail
                                     + " is invalid");

    }
    CommunityEmailHandler.sendPasswordReminder(person, formEmail);
    response = new RequestHandlerResponse();
    response.setPage(CommunityPageHolder.getEmailSentPage());

    return response;
  }

  /**
   * Deactivate the community member and commit changes to the database.
   * 
   * @param request the request containing the session
   * @param type the type of community member
   * @return the request handler response
   * @throws InvalidParameterException when there is no community id in the
   *           request
   * @throws SQLException when there is a database problem
   * @throws InvalidLoginException when there is no logged-in user
   * @throws InvalidFormException when input data is not valid
   * @throws SQLException when there is a problem querying new community members
   *           for the home page redirect
   */
  private RequestHandlerResponse deactivateCommunity(
                                                     HttpServletRequest request,
                                                     BsCommunity.Type type)
      throws InvalidParameterException, InvalidLoginException,
      InvalidFormException, SQLException {

    BigInteger oldCommunityId = null;
    BigInteger newCommunityId = null;
    RequestHandlerResponse response = null;

    if (TextConverter.isEmpty(request.getParameter("community_id"))) {
      throw new InvalidParameterException("Invalid community ID");
    }

    try {

      oldCommunityId = new BigInteger(request.getParameter("community_id"));
      if (!TextConverter.isEmpty(request.getParameter("new_community_id"))) {
        newCommunityId =
          new BigInteger(request.getParameter("new_community_id"));
      } // leave new ID null if no submission

    } catch (NumberFormatException nfe) {
      throw new InvalidParameterException(nfe.getMessage());
    }

    // Get the two community members if there is a new id.
    if (newCommunityId != null) {
      CommunityDelegate delegate =
        CommunityDelegateFactory.getCommunityDelegate();
      IPrimaryKey oldKey =
        CommunityFactory.getCommunityPrimaryKey(oldCommunityId);
      BsCommunity oldCommunity = delegate.getObject((SequencePrimaryKey)oldKey);
      IPrimaryKey newKey =
        CommunityFactory.getCommunityPrimaryKey(newCommunityId);
      BsCommunity newCommunity = delegate.getObject((SequencePrimaryKey)newKey);

      // Merge the attributions, annotations, and reference links.
      newCommunity.mergeAttributions(oldCommunity.getAttributeesLinks());
    }
    response = new RequestHandlerResponse();
    returnToWelcomePage(request, response);

    return response;
  }

  /**
   * Delete a community member from the database and commit.
   * 
   * @param request the HTTP request containing the community id
   * @param type the type of community member (person or organization)
   * @return the request handler response
   * @throws SQLException when there is a database problem
   * @throws InvalidSessionException when the member is not in the session
   * @throws InvalidLoginException when there is no logged-in user
   */
  private RequestHandlerResponse deleteCommunity(HttpServletRequest request,
                                                 BsCommunity.Type type)
      throws SQLException, InvalidSessionException, InvalidLoginException {

    RequestHandlerResponse response = null;

    if (type == BsCommunity.Type.PERSON) {
      BsPerson person = SessionHandler.getPerson(request);
      person.delete();
      person.getCommunity().delete();
      List<BsPerson> list = new ArrayList<BsPerson>(1);
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      list.add(person);
      delegate.process(list);
    } else if (type == BsCommunity.Type.ORGANIZATION) {
      BsOrganization organization = SessionHandler.getOrganization(request);
      organization.delete();
      organization.getCommunity().delete();
      List<BsOrganization> list = new ArrayList<BsOrganization>(1);
      OrganizationDelegate delegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      list.add(organization);
      delegate.process(list);
    }

    response = new RequestHandlerResponse();
    returnToWelcomePage(request, response);

    return response;
  }

  /**
   * Return to the user's home page, querying new community members.
   * 
   * @param request the HTTP request containing the community id
   * @param response the request handler response
   * @throws SQLException when there is a problem querying from the database
   * @throws InvalidLoginException when there is no logged-in user
   */
  private void returnToWelcomePage(HttpServletRequest request,
                                   RequestHandlerResponse response)
      throws SQLException, InvalidLoginException {

    Map<String, ListCommunity[]> newCommunities = null;

    newCommunities = CommunitySearcher.getNewCommunities();
    if (newCommunities != null && !newCommunities.isEmpty()) {
      response.setAttribute("newCommunities", newCommunities);
    }

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BigInteger loginId = SessionHandler.getLoginId(request);
    // reset the community id in the session to the login id
    SessionHandler.setCommunityID(request, loginId);

    response.setPage(CommunityPageHolder.getWelcomePage());

    // clean up community state now that we're exiting profile maintenance
    SessionHandler.removeCommunityState(request);
  }

  /** Initialize the web form fields for the person update. */
  private void createPersonFields() {
    status = new DefaultWebFormField("status", "new");
    isObsolete = new BooleanWebFormField("is_obsolete", "T");
    isUserFocus = new BooleanWebFormField("is_user_focus", "T");
    isExternalCurator = new BooleanWebFormField("is_external_curator", "T");
    isTairCurator = new BooleanWebFormField("is_tair_curator", "T");
  }

  /** initialize web form fields for the organization update. */
  private void createOrgFields() {
    status = new DefaultWebFormField("status", "new");
    isObsolete = new BooleanWebFormField("is_obsolete", "T");
    NASCFeePaid = new BooleanWebFormField("NASC_fee_paid", "T");
    ABRCFeesWaived = new BooleanWebFormField("ABRC_fees_waived", "T");
    seedStockCenter = new WebFormField("seed_stock_center", false, 4);
    commercial = new BooleanWebFormField("commercial", "T");
  }

}
