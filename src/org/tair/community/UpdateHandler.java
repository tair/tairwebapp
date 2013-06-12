// ------------------------------------------------------------------------------
// Copyright: (c) 2006 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.23 $
// $Date: 2006/02/15 01:56:42 $
// ------------------------------------------------------------------------------

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCommunityKeyword;
import org.tair.bs.community.BsCountry;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.bs.community.UrlDelegate;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;

import com.poesys.db.InvalidParametersException;
import com.poesys.db.dto.DtoStatusException;


/**
 * UpdateHandler handles the updating of a person or organization community
 * record with the values submitted in the <code>HttpServletRequest</code>.
 * UpdateHandler updates the object, commits the changes, and redirects control
 * to a page that displays the updated data.
 */

public class UpdateHandler implements RequestHandler {

  /**
   * Updates community member based on parameters in the
   * <code>HttpServletRequest</code>. The community state parameter "first_org"
   * or "first_person" determines whether this is the first time the user is
   * going through new registration process or whether they've already gone
   * through process to reach the main profile page and have returned to the
   * form to make further edits; this determines the page to which to redirect
   * the user.
   * 
   * @param request <code>HttpServletRequest</code> passed from calling servlet
   * @return <code>RequestHandlerResponse</code> containing URL of next page to
   *         which to redirect and any request attributes for display on that
   *         page
   * @throws InvalidFormException when there is missing or invalid data in the
   *           requested updates
   * @throws SQLException when a database error occurs during update
   * @throws InvalidSessionException when the object is not in the session
   * @throws InvalidParameterException when the object is not a user or
   *           organization
   * @throws InvalidLoginException when there is no logged-in user
   * 
   * @see CommunityFormValidator
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidFormException, SQLException, InvalidSessionException,
      InvalidParameterException, InvalidLoginException {

    CommunityState state = SessionHandler.getCommunityState(request);

    String type = state.getStringValue("type");
    if (type == null) {
      throw new InvalidSessionException("Invalid community type found");

    } else if (!type.equals("person") && !type.equals("organization")) {
      throw new InvalidParameterException("Invalid community type "
                                          + "requested: "
                                          + type);
    }

    RequestHandlerResponse response = null;

    try {
      if (type.equals("person")) {
        response = updatePerson(request, state);
      } else if (type.equals("organization")) {
        response = updateOrganization(request, state);
      }
    } catch (InvalidParametersException e) {
      throw new InvalidParameterException(e.getMessage(), e);
    } catch (DtoStatusException e) {
      throw new SQLException(e.getMessage());
    }
    return response;
  }

  /**
   * Update person record in session with all parameters from person
   * registration form. Retrieve form params using CommunityFormValidator
   * 
   * @param request the request from the Community servlet
   * @param state the collection of community state flags
   * @return a RequestHandlerResponse containing JSP to which to forward
   * @throws InvalidSessionException
   * @throws InvalidFormException
   * @throws InvalidActionException
   * @throws InvalidParametersException
   * @throws DtoStatusException
   * @throws SQLException
   */
  @SuppressWarnings("unchecked")
  private RequestHandlerResponse updatePerson(HttpServletRequest request,
                                              CommunityState state)
      throws InvalidSessionException, InvalidFormException,
      InvalidActionException, InvalidParametersException, DtoStatusException,
      SQLException {

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();

    // Get the person from the session.
    BsPerson person = SessionHandler.getPerson(request);

    // Get valid updates from the request.
    Map<String, ?> params =
      CommunityFormValidator.validatePersonInfo(request,
                                                person.getCommunityId());

    // Initialize the session change flag.
    SessionHandler.setPersonChanged(request, Boolean.FALSE);
    
    // Do the updates to the person object based on the parameters.
    boolean personChanged = updatePerson(person, params);

    // If the address changed, set the session flag to tell the next page
    // to ask whether to propagate the change to the lab.
    if (personChanged) {
      SessionHandler.setPersonChanged(request, personChanged);
    }

    // Update the person and community and commit the changes.
    // Construct a one-element list for process(). This allows for either
    // inserting a new person or updating an existing one.
    List<BsPerson> list = new ArrayList<BsPerson>(1);
    list.add(person);
    delegate.process(list);

    RequestHandlerResponse response = new RequestHandlerResponse();
    if (state.getBooleanValue("first_person")) {
      // If this is a new person and this is the first time through, redirect
      // to the add-affiliations page.
      response.setPage("/jsp/community/add_person_affiliations.jsp");
    } else {
      // Otherwise, redirect to the person-profile page.
      response.setPage(CommunityPageHolder.getPersonProfilePage());
    }

    return response;
  }

  /**
   * Update a person object with arguments corresponding to the various scalar
   * attributes and collections that are part of the person.
   * 
   * @param person the person in which to update values
   * @param args the values with which to update the person
   * @return true if the address, email, or work phone for the person changed
   * @throws DtoStatusException when the person status can't be set to CHANGED
   * @throws InvalidParametersException when the input person is null
   * @throws SQLException when a component can't be lazily loaded
   */
  private boolean updatePerson(BsPerson person, Map<String, ?> args)
      throws InvalidParametersException, DtoStatusException, SQLException {
    // Tracks whether address, email, or work phone updated
    boolean updated = false;
    
    // Update user name, password, and email
    person.setUserName((String)args.get("user_name"));
    person.setPassword((String)args.get("password"));
    person.setPasswordHint((String)args.get("password_hint"));
    String currentEmail = person.getCommunity().getEmail();
    // Test for change in email taking nulls into account.
    updated = fieldUpdated(currentEmail, (String)args.get("email"));
    person.setEmail((String)args.get("email"));

    // Update user status
    person.setMemberStatus((String)args.get("status"));
    String isObsolete = (String)args.get("is_obsolete");
    person.setObsolete(TextConverter.stringToBoolean(isObsolete));

    // Update multiple organisms
    person.updateKeywords((String[])args.get("organism"),
                          BsCommunityKeyword.Type.ORGANISM);

    // Update multiple aliases
    person.updateAliases((String[])args.get("alias"));

    // Update the single author name alias
    person.setAuthorName((String)args.get("author_name"));

    // Update the phone numbers if not null.
    String workPhone = (String)args.get("phone_work");
    String currentPhone = person.getCommunity().getPhone("work");
    String labPhone = (String)args.get("phone_lab");
    String mobilePhone = (String)args.get("phone_mobile");
    String faxPhone = (String)args.get("phone_fax");

    // Update the phones; if number is null, it means delete the phone.
    // Test for update of work phone taking nulls into account.
    if (!updated) {
      updated = fieldUpdated(currentPhone, workPhone);
    }
    person.setPhone("work", workPhone);
    person.setPhone("lab", labPhone);
    person.setPhone("mobile", mobilePhone);
    person.setPhone("fax", faxPhone);

    // Update 2 URLs
    String url1 = (String)args.get("url_1");
    String site1 = (String)args.get("web_site_name_1");
    String url2 = (String)args.get("url_2");
    String site2 = (String)args.get("web_site_name_2");
    // Query or create the two URL objects. URLs are unique on the URL string.
    UrlDelegate urlDelegate = CommunityDelegateFactory.getUrlDelegate();
    BsUrl urlObject1 = null;
    BsUrl urlObject2 = null;
    List<BsUrl> urlList = new ArrayList<BsUrl>(2);
    if (url1 != null) {
      urlObject1 = urlDelegate.getUrlByUrl(url1);
      if (urlObject1 == null) {
        // Create URL using null to generate id.
        urlObject1 = urlDelegate.createUrl(null, url1, site1, null);
        urlList.add(urlObject1);
      }
    }
    if (url2 != null) {
      urlObject2 = urlDelegate.getUrlByUrl(url1);
      if (urlObject2 == null) {
        // Create URL using null to generate id.
        urlObject2 = urlDelegate.createUrl(null, url2, site2, null);
        urlList.add(urlObject2);
      }
    }
    person.updateUrls(urlObject1, urlObject2);

    // Update multiple keywords
    person.updateKeywords((String[])args.get("keyword"),
                          BsCommunityKeyword.Type.COMMUNITY);
    person.setLastName((String)args.get("last_name"));
    person.setFirstName((String)args.get("first_name"));
    person.setMiddleName((String)args.get("middle_name"));
    person.setSuffix((String)args.get("suffix"));
    person.setResearchInterest((String)args.get("research_interest"));
    person.setUserFocus(TextConverter.stringToBoolean((String)args.get("is_user_focus")));
    person.setExternalCurator(TextConverter.stringToBoolean((String)args.get("is_external_curator")));
    person.setTairCurator(TextConverter.stringToBoolean((String)args.get("is_tair_curator")));
    // set the birthdate only if it is not null, otherwise set it to null
    java.util.Date birthdate = (java.util.Date)args.get("birthdate");
    if (birthdate != null) {
      person.setBirthdate(new java.sql.Timestamp(birthdate.getTime()));
    } else {
      person.setBirthdate(null);
    }
    person.setPrimaryJobTitle((String)args.get("primary_job_title"));
    person.setSendMail(TextConverter.stringToBoolean((String)args.get("send_mail")));
    // Update the internal address object.
    boolean addressUpdated =
      person.updateAddress(TextConverter.textToDB((String)args.get("address")),
                           (String)args.get("city"),
                           (String)args.get("region"),
                           (String)args.get("country"),
                           (String)args.get("postal_code"));
    if (!updated) {
      updated = addressUpdated;
    }
    
    // If status is "incomplete" reset the updated status to false, as this is
    // an insert of a new user, not an update of an existing one.
    String status = (String)args.get("status");
    if (status != null && status.equalsIgnoreCase("incomplete")) {
      updated = false;
    }
    
    return updated;
  }

  /**
   * Test whether a field has been updated from its current value taking nulls
   * into account.
   * 
   * @param currentValue the current value of the field
   * @param newValue the new value of the field
   * @return true if the new value is different from the old value
   */
  private boolean fieldUpdated(String currentValue, String newValue) {
    boolean updated = false;
    if ((currentValue != null && newValue != null && !currentValue.equalsIgnoreCase(newValue))
        || (currentValue == null && newValue != null)
        || (currentValue != null && newValue == null)) {
      updated = true;
    }
    return updated;
  }

  /**
   * Update an organization object with arguments corresponding to the various
   * scalar attributes and collections that are part of the organization.
   * 
   * @param organization the organization in which to update values
   * @param args the values with which to update the organization
   * @throws DtoStatusException when the status can't be set to CHANGED
   * @throws SQLException when there is a problem lazily loading affiliations
   * @throws InvalidParametersException when the input organization is null
   */
  private void updateOrganization(BsOrganization organization,
                                  Map<String, ?> args) throws SQLException,
      DtoStatusException {
    // Update user name, password, and email
    organization.setUserName((String)args.get("user_name"));
    organization.setPassword((String)args.get("password"));
    organization.setPasswordHint((String)args.get("password_hint"));
    organization.setEmail((String)args.get("email"));

    // Update user status
    organization.setMemberStatus((String)args.get("status"));
    String isObsolete = (String)args.get("is_obsolete");
    organization.setObsolete(TextConverter.stringToBoolean(isObsolete));

    // Update multiple organisms
    organization.updateKeywords((String[])args.get("organism"),
                                BsCommunityKeyword.Type.ORGANISM);

    // Update multiple aliases
    organization.updateAliases((String[])args.get("alias"));

    // Update the single author name alias
    organization.setAuthorName((String)args.get("author_name"));

    // Update the phone numbers if the phone number is not null.
    String work_phone = (String)args.get("phone_work");
    String lab_phone = (String)args.get("phone_lab");
    String mobile_phone = (String)args.get("phone_mobile");
    String fax_phone = (String)args.get("phone_fax");

    if (work_phone != null) {
      organization.setPhone("work", work_phone);
    }
    if (lab_phone != null) {
      organization.setPhone("lab", (String)args.get("phone_lab"));
    }
    if (mobile_phone != null) {
      organization.setPhone("mobile", (String)args.get("phone_mobile"));
    }
    if (fax_phone != null) {
      organization.setPhone("fax", (String)args.get("phone_fax"));
    }

    // Update 2 URLs
    String url1 = (String)args.get("url_1");
    String site1 = (String)args.get("web_site_name_1");
    String url2 = (String)args.get("url_2");
    String site2 = (String)args.get("web_site_name_2");
    // Query or create the two URL objects. URLs are unique on the URL string.
    UrlDelegate urlDelegate = CommunityDelegateFactory.getUrlDelegate();
    BsUrl urlObject1 = null;
    BsUrl urlObject2 = null;
    List<BsUrl> urlList = new ArrayList<BsUrl>(2);
    if (url1 != null) {
      urlObject1 = urlDelegate.getUrlByUrl(url1);
      if (urlObject1 == null) {
        // Create URL using null to generate id.
        urlObject1 = urlDelegate.createUrl(null, url1, site1, null);
        urlList.add(urlObject1);
      }
    }
    if (url2 != null) {
      urlObject2 = urlDelegate.getUrlByUrl(url1);
      if (urlObject2 == null) {
        // Create URL using null to generate id.
        urlObject2 = urlDelegate.createUrl(null, url2, site2, null);
        urlList.add(urlObject2);
      }
    }
    organization.updateUrls(urlObject1, urlObject2);

    // Update multiple keywords
    organization.updateKeywords((String[])args.get("keyword"),
                                BsCommunityKeyword.Type.COMMUNITY);
    organization.setName((String)args.get("name"));
    organization.setOrganizationType((String)args.get("org_type"));
    organization.setDescription((String)args.get("description"));

    String nascPaid = (String)args.get("NASC_fee_paid");
    organization.setNascFeePaid(TextConverter.stringToBoolean(nascPaid));

    String feesWaived = (String)args.get("ABRC_fees_waived");
    organization.setAbrcFeesWaived(TextConverter.stringToBoolean(feesWaived));

    String commercial = (String)args.get("commercial");
    organization.setCommercial(TextConverter.stringToBoolean(commercial));

    // Update the internal address object. Do this before the seed stock center.
    organization.updateAddress(TextConverter.textToDB((String)args.get("address")),
                               (String)args.get("city"),
                               (String)args.get("region"),
                               (String)args.get("country"),
                               (String)args.get("postal_code"));

    organization.setSeedStockCenter((String)args.get("seed_stock_center"));

    // Update the contact person in the affiliation.
    setContactPerson(organization, args);
  }

  /**
   * <p>
   * Retrieve community id of person updating organization info and set whether
   * they should be contact person for organization or not. This must be done
   * explicitly every time org info. is updated so that contact person value is
   * kept up to date for updater (e.g. to make sure that a previously "true"
   * value is set to "false" if person requests it. If not done here, contact
   * person can be set through update affiliation methods. If this is a new
   * organization being created during a new-person registration, updater id
   * will be null and the system will not set the contact person or affiliation
   * in this method but later when it has access to the community id for the
   * registered person.
   * </p>
   * <p>
   * If no affiliation exists for person, one will be created automatically for
   * all non-curator updaters, and selectively for curators - see comments at
   * BsOrganization.setContactAndAffiliate() for gory details...
   * </p>
   * 
   * @param organization the organization to which to affiliate the updater
   * @param args the "updater_id" (a person community id) and
   *          "is_contact_person" (true or false boolean) arguments
   * @throws SQLException when there is a problem setting the affiliation
   * @throws DtoStatusException when the status can't be set to CHANGED
   */
  private void setContactPerson(BsOrganization organization, Map<String, ?> args)
      throws SQLException, DtoStatusException {
    BigInteger updaterID = (BigInteger)args.get("updater_id");
    Boolean isContact = (Boolean)args.get("is_contact_person");
    organization.setContactAndAffiliate(updaterID, isContact);
  }

  /**
   * Update organization record in session with all parameters from person
   * registration form. Retrieve form params using CommunityFormValidator
   * 
   * @param request Request from CommunityServlet
   * @param conn An active connection to the database
   * @param state Collection of community state flags
   * @return RequestHandlerResponse containing JSP to forward to
   * @throws InvalidSessionException
   * @throws InvalidActionException
   * @throws SQLException
   * @throws InvalidFormException
   * @throws InvalidLoginException
   * @throws DtoStatusException
   */
  @SuppressWarnings("unchecked")
  private RequestHandlerResponse updateOrganization(HttpServletRequest request,
                                                    CommunityState state)
      throws InvalidSessionException, InvalidActionException, SQLException,
      InvalidFormException, InvalidLoginException, DtoStatusException {

    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();

    // Get the organization from the session.
    BsOrganization organization = SessionHandler.getOrganization(request);
    BigInteger communityID = organization.getCommunityId();

    // Get the valid updates from the request.
    Map<String, String> params =
      CommunityFormValidator.validateOrganizationInfo(request, communityID);

    // Explicitly set stock center for organization separate from form validator
    params.put("seed_stock_center",
               getStockCenter(request, organization, params));

    // Apply the updates.
    updateOrganization(organization, params);

    // Process the organization and community into the database and commit.
    List<BsOrganization> list = new ArrayList<BsOrganization>(1);
    list.add(organization);
    delegate.process(list);

    RequestHandlerResponse response = new RequestHandlerResponse();
    if (state.getBooleanValue("first_org")) {
      // If this is a new organization and the first time through, redirect to
      // the member-search page to add members if needed.
      response.setPage("/jsp/community/member_search.jsp");
    } else {
      // Otherwise, display the organization-profile page.
      response.setPage(CommunityPageHolder.getOrgProfilePage());
    }

    return response;
  }

  /**
   * Determine correct value (ABRC or NASC) for seed stock center of
   * organization based on organization's country
   * 
   * @param request Request from CommunityServlet
   * @param organization Organization to determine stock center for
   * @param updateParams Form field values submitted from main organization
   *          registration form
   * @return Stock center to use for organization
   */
  public static String getStockCenter(HttpServletRequest request,
                                      BsOrganization organization,
                                      Map<String, ?> updateParams) {
    CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
    String seed_stock_center = null;

    String name = (String)updateParams.get("country");
    BsCountry country = null;

    if (name != null) {
      // Get the country by name.
      country = delegate.getCountryByName(name);
      if (country != null) {
        /*
         * If country does not have choice (i.e. is N/S America or Europe) set
         * stock center to appropriate value regardless of any curator input
         * from form (per Debbie 4.12.04)
         */
        if (!BsCountry.StockCenter.OPTIONAL.equals(country.getStockCenter())) {
          seed_stock_center = country.getStockCenter();
        } else {
          // If curator is updating account, set stock center to whatever
          // curator chose on the update form
          if (LoginChecker.isTairCurator(request)) {

            String formValue = request.getParameter("seed_stock_center");

            seed_stock_center =
              !TextConverter.isEmpty(formValue) ? formValue
                  : DataConstants.getABRCStockCenter();
          } else {
            // Otherwise, set the stock center to ABRC.
            seed_stock_center = DataConstants.getABRCStockCenter();
          }
        }
      }
    }

    return seed_stock_center;
  }
}
