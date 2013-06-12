/**
 * Copyright 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsAffiliation;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;

import com.poesys.db.dto.DtoStatusException;


/**
 * AffiliateHandler handles requests to update a community's affiliation data
 */

public class AffiliateHandler implements RequestHandler {

  /**
   * <p>
   * Processes a request for an update to a community member based on changes in
   * the HTTP request
   * </p>
   * <p>
   * This rewrite of the handler removes the dependency to AffiliateUpdator and
   * moves all affiliation-related interface and handling to this class. The
   * system now uses the business DTOs to represent the person and organization
   * data structures rather than "Composite" objects. All changes commit
   * immediately to the database.
   * </p>
   * 
   * @param request HttpServletRequest from CommunityServlet
   * @return RequestHandlerResponse with next page to be forwarded to
   * @throws InvalidParameterException thrown if invalid id passed for
   *           affiliation
   * @throws SQLException thrown if database error occurs while creating or
   *           updating affiliations
   * @throws InvalidSessionException thrown if necessary BsCommunity object not
   *           found in user's session
   * 
   * @see CommunityFormValidator
   */
  @SuppressWarnings("unchecked")
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidParameterException, SQLException, InvalidSessionException,
      InvalidLoginException {

    String type = getType(request);

    RequestHandlerResponse response = new RequestHandlerResponse();
    // Get the requested changes from the request. Cannot make the map generic.
    HashMap<String, Object> affParams =
      CommunityFormValidator.validateAffiliationInfo(request, type);

    // retrieve type specific object from session and set redirection
    // JSP to type specific profile page which will display the
    // newly added affiliation(s)
    if (type.equals("person")) {
      updatePerson(request, response, affParams);
    } else if (type.equals("organization")) {
      updateOrganization(request, response, affParams);
    }

    return response;
  }

  /**
   * Extract the update request type from the request (person or organization);
   * the type is in the state variable type in the user's session.
   * 
   * @param request the HTTP request
   * @return the object type being updated (person or organization)
   * @throws InvalidSessionException no community type in session
   * @throws InvalidParameterException not person or organization
   */
  private String getType(HttpServletRequest request)
      throws InvalidSessionException, InvalidParameterException {
    String type = null;
    CommunityState state = SessionHandler.getCommunityState(request);

    if (!TextConverter.isEmpty(request.getParameter("type"))) {
      type = request.getParameter("type");
      state.setStateValue("type", type);

    } else {
      type = state.getStringValue("type");
    }

    if (type == null) {
      throw new InvalidSessionException("Invalid community type found");
    } else if (!type.equals("person") && !type.equals("organization")) {
      throw new InvalidParameterException("Invalid community type requested: "
                                          + type);
    }
    return type;
  }

  /**
   * Update a person based on information in an HTTP request and a parameter map
   * and commit the changes to the database.
   * 
   * @param request the HTTP request
   * @param response the HTTP response
   * @param affParams the parameter map
   * @throws SQLException when there is a database issue
   * @throws InvalidLoginException when the user is not logged in
   * @throws InvalidSessionException when there is a problem accessing the
   *           session
   */
  private void updatePerson(HttpServletRequest request,
                            RequestHandlerResponse response,
                            HashMap<String, Object> affParams)
      throws SQLException, InvalidLoginException, InvalidSessionException {

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = null;

    /*
     * If the session does not contain a person object, the user is creating a
     * new lab or organization outside of personal profile maintenance and is
     * now affiliating to an organization after finding it in the forced
     * duplication search that precedes organization creation. If so, create a
     * person object from the community id in the session to make affiliations
     * to the logged-in user. All actions from here will be done as if personal
     * profile maintenance was already underway.
     */

    if (!SessionHandler.hasPerson(request)) {
      person =
        SessionHandler.getPerson(request,
                                 SessionHandler.getCommunityID(request));
    } else {
      person = SessionHandler.getPerson(request);
    }

    Collection<BsAffiliation> affiliations =
      person.getCommunity().getAffiliation();

    if (person != null) {
      updatePersonAffiliations(affParams, person, affiliations);
      delegate.update(person);
    }

    response.setPage(CommunityPageHolder.getPersonProfilePage());
  }

  /**
   * Updates affiliations to labs and parent organizations including job titles,
   * is_pi status and is_primary status. updateAffiliations takes community IDs
   * to reference affiliate organizations and retrieves information about new
   * affiliations from the database.
   * 
   * @param affParams <code>HashMap</code> containing affiliation parameters
   *          referenced by the following <code>String</code> keys:
   *          <ul>
   *          <li>deleted - Array of <code>Long</code> ids to remove from
   *          affiliations collection</li>
   *          <li>affiliateOrgs - Array of <code>Long</code> ids to add to
   *          affiliations collection as parent organizations</li>
   *          <li>affiliateLabs - Array of <code>Long</code> ids to add to
   *          affiliations collection as labs</li>
   *          <li>aff_action - <code>String</code> flagging what affiliation
   *          action is being taken. If aff_action equals "update_lab", it is
   *          assumed that is_pi and is_primary status is being updated, meaning
   *          that any ids not appearing in the PI collection in this submission
   *          will have these values set to <code>false</code></li>
   *          <li>pi - Array of <code>Long</code> lab ids that this person
   *          should be declared pi for</li>
   *          <li>primary - Array of <code>Long</code> lab ids that this person
   *          calls their primary affiliation</li>
   *          <li>titles - <code>HashMap</code> containing <code>Long</code>
   *          organization id as a key to reference the selected title person
   *          should have for their affiliation to that organization</li>
   *          </ul>
   * @param person the person being updated
   * @param affiliations the collection of <code>BsAffiliation</code> objects
   * 
   * @exception SQLException thrown if any errors encountered while retrieving
   *              organization data from the database.
   * @throws DtoStatusException
   * @see CommunityFormValidator
   */
  public void updatePersonAffiliations(HashMap<String, Object> affParams,
                                       BsPerson person,
                                       Collection<BsAffiliation> affiliations)
      throws SQLException, DtoStatusException {
    deleteAffiliatedOrganization(affParams, affiliations);
    addPersonAffiliatedOrganization(affParams, person, affiliations);
    addPersonAffiliatedLab(affParams, person, affiliations);

    updatePersonAffiliationProperties(affParams, affiliations);
  }

  /**
   * Add a lab as an affiliate to a person. This extracts the community id of
   * the lab to affiliate and queries the object from the database, then creates
   * the affiliation and adds it to the person. This method does not process the
   * insert into the database; the owner of the affiliation map should do that.
   * 
   * @param affParams a map of user interface parameters containing the
   *          community id for the affiliated organization
   * @param person the person to which to affiliate the labs
   * @param affiliations a Collection of <code>BsAffiliation</code> objects
   * @throws SQLException when there is a problem adding the affiliation
   */
  private void addPersonAffiliatedLab(HashMap<String, Object> affParams,
                                      BsPerson person,
                                      Collection<BsAffiliation> affiliations)
      throws SQLException {
    // Add affiliated labs
    if (affParams.containsKey("affiliateLabs")) {
      Long[] params = (Long[])affParams.get("affiliateLabs");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          // If not affiliated, query and add.
          BigInteger communityId = new BigInteger(params[i].toString());

          if (!isAffiliated(communityId, affiliations)) {
            OrganizationDelegate delegate =
              CommunityDelegateFactory.getOrganizationDelegate();
            CommunityDelegate communityDelegate =
              CommunityDelegateFactory.getCommunityDelegate();
            BsOrganization org =
              delegate.getOrganizationByCommunityId(communityId);
            // Create an affiliation between the person and the organization.
            BsAffiliation affiliation =
              communityDelegate.createAffiliation(person.getCommunity(),
                                                  org,
                                                  person.getCommunityId(),
                                                  org.getOrganizationId(),
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null);
            person.getCommunity().addAffiliationAffiliation(affiliation);
            // Add the new affiliation to the collection for later processing.
            affiliations.add(affiliation);
          }
        }
      }
    }
  }

  /**
   * Add an organization as an affiliate to a person. This extracts the
   * community id of the organization to affiliate and queries the object from
   * the database, then creates the affiliation and adds it to the person. This
   * method does not process the insert into the database; the owner of the
   * affiliation map should do that.
   * 
   * @param affParams a map of user interface parameters containing the
   *          community id for the affiliated organization
   * @param person the person to which to affiliate the organizations
   * @param affiliations a Collection of <code>BsAffiliation</code> objects
   * @throws SQLException when there is a problem adding the affiliation
   */
  private void addPersonAffiliatedOrganization(
                                               HashMap<String, Object> affParams,
                                               BsPerson person,
                                               Collection<BsAffiliation> affiliations)
      throws SQLException {
    // Add affiliated organizations
    if (affParams.containsKey("affiliateOrgs")) {
      Long[] params = (Long[])affParams.get("affiliateOrgs");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          // If not affiliated, query and add.
          BigInteger communityId = new BigInteger(params[i].toString());

          if (!isAffiliated(communityId, affiliations)) {
            OrganizationDelegate delegate =
              CommunityDelegateFactory.getOrganizationDelegate();
            CommunityDelegate communityDelegate =
              CommunityDelegateFactory.getCommunityDelegate();
            BsOrganization org =
              delegate.getOrganizationByCommunityId(communityId);
            // Create an affiliation between the person and the organization.
            BsAffiliation affiliation =
              communityDelegate.createAffiliation(person.getCommunity(),
                                                  org,
                                                  person.getCommunityId(),
                                                  org.getOrganizationId(),
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null);
            person.getCommunity().addAffiliationAffiliation(affiliation);
            // Add the new affiliation to the collection for later processing.
            affiliations.add(affiliation);
          }
        }
      }
    }
  }

  /**
   * <p>
   * Update an organization based on information in an HTTP request and a
   * parameter map and commit the change to the database.
   * </p>
   * 
   * @param request the HTTP request
   * @param response the HTTP response
   * @param affParams the parameter map
   * @throws SQLException when there is a database issue
   * @throws InvalidLoginException when the user is not logged in
   * @throws InvalidSessionException when there is a problem accessing the
   *           session
   */
  private void updateOrganization(HttpServletRequest request,
                                  RequestHandlerResponse response,
                                  HashMap<String, Object> affParams)
      throws SQLException, InvalidLoginException, InvalidSessionException {

    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    BsOrganization organization = SessionHandler.getOrganization(request);
    Collection<BsAffiliation> affiliations = organization.getAffiliation();

    if (organization != null) {
      updateOrganizationAffiliations(affParams, organization, affiliations);
      // Process all the changes (insert, update, delete).
      List<BsOrganization> list = new ArrayList<BsOrganization>(1);
      list.add(organization);
      delegate.process(list);
    }

    response.setPage(CommunityPageHolder.getOrgProfilePage());
  }

  /**
   * Updates affiliations for an organization to labs and parent organizations
   * including job titles, is_pi status and is_primary status.
   * updateAffiliations takes community IDs to reference affiliate organizations
   * and retrieves information about new affiliations from the database.
   * 
   * @param affParams <code>HashMap</code> containing affiliation parameters
   *          referenced by the following <code>String</code> keys:
   *          <ul>
   *          <li>deleted - Array of <code>Long</code> ids to remove from
   *          affiliations collection</li>
   *          <li>affiliateOrgs - Array of <code>Long</code> ids to add to
   *          affiliations collection as parent organizations</li>
   *          <li>affiliateLabs - Array of <code>Long</code> ids to add to
   *          affiliations collection as labs</li>
   *          <li>aff_action - <code>String</code> flagging what affiliation
   *          action is being taken. If aff_action equals "update_lab", it is
   *          assumed that is_pi and is_primary status is being updated, meaning
   *          that any ids not appearing in the PI collection in this submission
   *          will have these values set to <code>false</code></li>
   *          <li>pi - Array of <code>Long</code> lab ids that this person
   *          should be declared pi for</li>
   *          <li>primary - Array of <code>Long</code> lab ids that this person
   *          calls their primary affiliation</li>
   *          <li>titles - <code>HashMap</code> containing <code>Long</code>
   *          organization id as a key to reference the selected title person
   *          should have for their affiliation to that organization</li>
   *          </ul>
   * @param org the organization being updated
   * @param affiliations the collection of <code>BsAffiliation</code> objects
   * @throws SQLException
   * 
   * @exception SQLException thrown if any errors encountered while retrieving
   *              organization data from the database.
   * @throws DtoStatusException
   * @see CommunityFormValidator
   */
  private void updateOrganizationAffiliations(
                                              HashMap<String, Object> affParams,
                                              BsOrganization org,
                                              Collection<BsAffiliation> affiliations)
      throws SQLException, DtoStatusException {
    deleteAffiliatedOrganization(affParams, affiliations);
    addOrganizationAffiliatedPerson(affParams, org, affiliations);
    addOrganizationAffiliatedOrganization(affParams, org, affiliations);
    addOrganizationAffiliatedLab(affParams, org, affiliations);

    updateOrganizationAffiliationProperties(affParams, affiliations);
  }

  /**
   * Add a person as an affiliate to an organization. This extracts the
   * community id of the person to affiliate and queries the object from the
   * database, then creates the affiliation and adds it to the organization.
   * This method does not process the insert into the database; the owner of the
   * affiliation map should do that.
   * 
   * @param affParams a map of user interface parameters containing the
   *          community id for the affiliated person
   * @param org the organization to which to affiliation the person
   * @param affiliations a collection of <code>BsAffiliation</code> objects
   * @throws SQLException when there is a problem adding the affiliation
   */
  private void addOrganizationAffiliatedPerson(
                                               HashMap<String, Object> affParams,
                                               BsOrganization org,
                                               Collection<BsAffiliation> affiliations)
      throws SQLException {
    // Add affiliated people
    if (affParams.containsKey("affiliatePersons")) {
      Long[] params = (Long[])affParams.get("affiliatePersons");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          // Look up in affiliations, if not there query and add.
          BigInteger communityId = new BigInteger(params[i].toString());

          if (!isAffiliated(communityId, affiliations)) {
            CommunityDelegate communityDelegate =
              CommunityDelegateFactory.getCommunityDelegate();
            PersonDelegate personDelegate =
              CommunityDelegateFactory.getPersonDelegate();
            BsPerson affiliatedPerson =
              personDelegate.getPersonByCommunityId(communityId);
            // Create an affiliation between the person and the organization.
            BsAffiliation affiliation =
              communityDelegate.createAffiliation(affiliatedPerson.getCommunity(),
                                                  org,
                                                  affiliatedPerson.getCommunityId(),
                                                  org.getOrganizationId(),
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null);
            org.getCommunity().addAffiliationAffiliation(affiliation);
            // Add the new affiliation to the collection for later processing.
            affiliations.add(affiliation);
          }
        }
      }
    }
  }

  /**
   * Add a lab as an affiliate to an organization. This extracts the community
   * id of the lab to affiliate and queries the object from the database, then
   * creates the affiliation and adds it to the organization. This method does
   * not process the insert into the database; the owner of the affiliation map
   * should do that.
   * 
   * @param affParams a map of user interface parameters containing the
   *          community id for the affiliated lab
   * @param org the organization to which to affiliation the lab
   * @param affiliations a collection of <code>BsAffiliation</code> objects
   * @throws SQLException when there is a problem adding the affiliation
   */
  private void addOrganizationAffiliatedLab(
                                            HashMap<String, Object> affParams,
                                            BsOrganization org,
                                            Collection<BsAffiliation> affiliations)
      throws SQLException {
    // Add affiliated labs
    if (affParams.containsKey("affiliateLabs")) {
      Long[] params = (Long[])affParams.get("affiliateLabs");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          // Look up in affiliations, if not there query and add.
          BigInteger communityId = new BigInteger(params[i].toString());

          if (!isAffiliated(communityId, affiliations)) {
            OrganizationDelegate delegate =
              CommunityDelegateFactory.getOrganizationDelegate();
            CommunityDelegate communityDelegate =
              CommunityDelegateFactory.getCommunityDelegate();
            BsOrganization affiliatedOrg =
              delegate.getOrganizationByCommunityId(communityId);
            // Create an affiliation between the lab and the organization.
            BsAffiliation affiliation =
              communityDelegate.createAffiliation(affiliatedOrg.getCommunity(),
                                                  org,
                                                  affiliatedOrg.getCommunityId(),
                                                  org.getOrganizationId(),
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null);
            org.getCommunity().addAffiliationAffiliation(affiliation);
            // Add the new affiliation to the collection for later processing.
            affiliations.add(affiliation);
          }
        }
      }
    }
  }

  /**
   * Add an organization as an affiliate to an organization. This extracts the
   * community id of the organization to affiliate and queries the object from
   * the database, then creates the affiliation and adds it to the organization.
   * This method does not process the insert into the database; the owner of the
   * affiliation map should do that.
   * 
   * @param affParams a map of user interface parameters containing the
   *          community id for the affiliated organization
   * @param org the organization to which to affiliate the organization
   * @param affiliations a Collection of <code>BsAffiliation</code> objects
   * @throws SQLException when there is a problem adding the affiliation
   */
  private void addOrganizationAffiliatedOrganization(
                                                     HashMap<String, Object> affParams,
                                                     BsOrganization org,
                                                     Collection<BsAffiliation> affiliations)
      throws SQLException {
    // Add affiliated organizations
    if (affParams.containsKey("affiliateOrgs")) {
      Long[] params = (Long[])affParams.get("affiliateOrgs");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          // Look up in map, if not there query and add.
          BigInteger communityId = new BigInteger(params[i].toString());

          if (!isAffiliated(communityId, affiliations)) {
            OrganizationDelegate delegate =
              CommunityDelegateFactory.getOrganizationDelegate();
            CommunityDelegate communityDelegate =
              CommunityDelegateFactory.getCommunityDelegate();
            BsOrganization affiliatedOrg =
              delegate.getOrganizationByCommunityId(communityId);
            // Create an affiliation between the organization and the
            // organization.
            BsAffiliation affiliation =
              communityDelegate.createAffiliation(affiliatedOrg.getCommunity(),
                                                  org,
                                                  affiliatedOrg.getCommunityId(),
                                                  org.getOrganizationId(),
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null);
            org.getCommunity().addAffiliationAffiliation(affiliation);
            // Add the new affiliation to the collection for later processing.
            affiliations.add(affiliation);
          }
        }
      }
    }
  }

  /**
   * Is an organization identified by a community id affiliated to the current
   * person represented by a list of affiliations to the person?
   * 
   * @param communityId community ID of an organization
   * @param affiliations a list of affiliations to a person
   * @return true if the organization appears in the affiliations, false if not
   */
  private boolean isAffiliated(BigInteger communityId,
                               Collection<BsAffiliation> affiliations) {
    if (communityId == null) {
      throw new RuntimeException("Affiliation test with null community ID");
    }
    if (affiliations == null) {
      throw new RuntimeException("Affiliaton test with null list of affiliations");
    }

    boolean affiliated = false;
    for (BsAffiliation affiliation : affiliations) {
      if (communityId.equals(affiliation.getOrganization().getCommunityId())) {
        affiliated = true;
      }
    }
    return affiliated;
  }

  /**
   * Mark affiliations deleted based on the presence of the community id for the
   * affiliated organization being in a parameter map. This method does not
   * delete the underlying organization, just the association to it. It also
   * removes the deleted affiliations from the input collection so that later
   * processing ignores them.
   * 
   * @param affParams a map of parameters from the user interface that may
   *          contain some number of community ids of affiliated persons to
   *          delete
   * @param affiliations the set of affiliations from which to delete
   * @throws DtoStatusException if the status can't be set to DELETED
   */
  private void deleteAffiliatedOrganization(
                                            HashMap<String, Object> affParams,
                                            Collection<BsAffiliation> affiliations)
      throws DtoStatusException {
    // Delete affiliated organizations
    if (affParams.containsKey("deleted")) {
      List<BsAffiliation> deleted = new ArrayList<BsAffiliation>();
      Long[] params = (Long[])affParams.get("deleted");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          BigInteger organizationId = new BigInteger(params[i].toString());
          for (BsAffiliation affiliation : affiliations) {
            if (organizationId.equals(affiliation.getOrganizationId())) {
              affiliation.delete(); // mark deleted for later processing
              deleted.add(affiliation); // add to deleted list
            }
          }
          // Remove the deleted affiliations from the collection.
          affiliations.removeAll(deleted);
        }
      }
    }
  }

  /**
   * <p>
   * Update the various properties of an affiliation (person or organization).
   * </p>
   * <ul>
   * <li>sets pi and primary affiliation to false</li>
   * <li>sets pi flag</li>
   * <li>sets primary flag</li>
   * <li>sets job title</li>
   * </ul>
   * 
   * @param affParams a map of arrays of Long parameter values keyed on the
   *          specific attribute to set (pi, primary, contact, titles); the
   *          parameter values identify the community members for which to set
   *          the flags or other values (title).
   * @param affiliations a collection of all the affiliations for the community
   *          member
   * @throws DtoStatusException
   */
  @SuppressWarnings("unchecked")
  private void updatePersonAffiliationProperties(
                                                 HashMap<String, Object> affParams,
                                                 Collection<BsAffiliation> affiliations)
      throws DtoStatusException {
    if (affParams.containsKey("aff_action")
        && affParams.get("aff_action").equals("update_lab")) {
      // If updating, clear the PI and primary-contact flags (set to false)
      for (BsAffiliation affiliation : affiliations) {
        affiliation.setPi(false);
        affiliation.setPrimary(false);
      }
    }

    if (affParams.containsKey("pi")) {
      Long[] params = (Long[])affParams.get("pi");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          BigInteger key = new BigInteger(params[i].toString());
          for (BsAffiliation affiliation : affiliations) {
            if (key.equals(affiliation.getOrganizationId())) {
              affiliation.setPi(true);
            }
          }
        }
      }
    }

    if (affParams.containsKey("primary")) {
      Long[] params = (Long[])affParams.get("primary");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          BigInteger key = new BigInteger(params[i].toString());
          for (BsAffiliation affiliation : affiliations) {
            if (key.equals(affiliation.getOrganizationId())) {
              affiliation.setPrimary(true);
            }
          }
        }
      }
    }

    // Need to process both checked and unchecked boxes, and the latter
    // don't come through as ids, so we need two sets of loops.
    if (affParams.containsKey("contact")) {
      Long[] params = (Long[])affParams.get("contact");
      // Set indicated affiliations to be contacts.
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          BigInteger key = new BigInteger(params[i].toString());
          for (BsAffiliation affiliation : affiliations) {
            if (key.equals(affiliation.getOrganizationId())) {
              affiliation.setContactPerson(true);
            }
          }
        }
      }

      // Set non-indicated affiliations to be not contacts.
      for (BsAffiliation affiliation : affiliations) {
        boolean set = false;
        for (int i = 0; i < params.length; i++) {
          BigInteger key = new BigInteger(params[i].toString());
          if (affiliation.getOrganizationId().equals(key)) {
            set = true;
            break;
          }
        }
        if (!set) {
          // No contact checkbox set for this affiliation, make it not a
          // contact.
          affiliation.setContactPerson(false);
        }
      }
    } else {
      // A contact might have been unchecked, just set all flags false.
      for (BsAffiliation affiliation : affiliations) {
        affiliation.setContactPerson(false);
      }
    }

    if (affParams.containsKey("titles")) {
      Map<BigInteger, String> titles =
        (HashMap<BigInteger, String>)affParams.get("titles");
      for (BigInteger organizationId : titles.keySet()) {
        for (BsAffiliation affiliation : affiliations) {
          if (affiliation.getOrganizationId().equals(organizationId)) {
            affiliation.setJobTitle(titles.get(organizationId));
          }
        }
      }
    }
  }

  /**
   * <p>
   * Update the various properties of an organization's affiliated members.
   * </p>
   * <ul>
   * <li>sets pi and primary affiliation to false</li>
   * <li>sets pi flag</li>
   * <li>sets primary flag</li>
   * <li>sets job title</li>
   * </ul>
   * 
   * @param affParams a map of arrays of Long parameter values keyed on the
   *          specific attribute to set (pi, primary, contact, titles); the
   *          parameter values identify the community members for which to set
   *          the flags or other values (title) by community id.
   * @param affiliations a collection of all the affiliations for the community
   *          member
   * @throws DtoStatusException
   */
  @SuppressWarnings("unchecked")
  private void updateOrganizationAffiliationProperties(
                                                       HashMap<String, Object> affParams,
                                                       Collection<BsAffiliation> affiliations)
      throws DtoStatusException {
    if (affParams.containsKey("aff_action")
        && affParams.get("aff_action").equals("update_lab")) {
      // If updating, clear the PI and primary-contact flags (set to false)
      for (BsAffiliation affiliation : affiliations) {
        affiliation.setPi(false);
        affiliation.setPrimary(false);
      }
    }

    if (affParams.containsKey("pi")) {
      Long[] params = (Long[])affParams.get("pi");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          BigInteger key = new BigInteger(params[i].toString());
          for (BsAffiliation affiliation : affiliations) {
            if (key.equals(affiliation.getCommunityId())) {
              affiliation.setPi(true);
            }
          }
        }
      }
    }

    if (affParams.containsKey("primary")) {
      Long[] params = (Long[])affParams.get("primary");
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          BigInteger key = new BigInteger(params[i].toString());
          for (BsAffiliation affiliation : affiliations) {
            if (key.equals(affiliation.getCommunityId())) {
              affiliation.setPrimary(true);
            }
          }
        }
      }
    }

    // Need to process both checked and unchecked boxes, and the latter
    // don't come through as ids, so we need two sets of loops.
    if (affParams.containsKey("contact")) {
      Long[] params = (Long[])affParams.get("contact");
      // Set indicated affiliations to be contacts.
      for (int i = 0; i < params.length; i++) {
        if (!TextConverter.isEmpty(params[i].toString())) {
          BigInteger key = new BigInteger(params[i].toString());
          for (BsAffiliation affiliation : affiliations) {
            if (key.equals(affiliation.getCommunityId())) {
              affiliation.setContactPerson(true);
            }
          }
        }
      }

      // Set non-indicated affiliations to be not contacts.
      for (BsAffiliation affiliation : affiliations) {
        boolean set = false;
        for (int i = 0; i < params.length; i++) {
          BigInteger key = new BigInteger(params[i].toString());
          if (affiliation.getCommunityId().equals(key)) {
            set = true;
            break;
          }
        }
        if (!set) {
          // No contact checkbox set for this affiliation, make it not a
          // contact.
          affiliation.setContactPerson(false);
        }
      }
    } else {
      // A contact might have been unchecked, just set all flags false.
      for (BsAffiliation affiliation : affiliations) {
        affiliation.setContactPerson(false);
      }
    }

    if (affParams.containsKey("titles")) {
      Map<BigInteger, String> titles =
        (HashMap<BigInteger, String>)affParams.get("titles");
      for (BigInteger communityId : titles.keySet()) {
        for (BsAffiliation affiliation : affiliations) {
          if (affiliation.getCommunityId().equals(communityId)) {
            affiliation.setJobTitle(titles.get(communityId));
          }
        }
      }
    }
  }
}
