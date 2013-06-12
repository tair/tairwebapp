// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.31 $
// $Date: 2005/09/14 16:22:19 $
// ------------------------------------------------------------------------------

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.utilities.DataConstants;
import org.tair.utilities.DateWebFormField;
import org.tair.utilities.DefaultWebFormField;
import org.tair.utilities.DelimitedWebFormField;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.WebFormField;


/**
 * CommunityFormValidator handles retrieval and validation of submitted HTML
 * form parameters for different Community update functions. Common community
 * form fields are abstracted and stored as
 * <code>org.tair.utilities.WebFormField</code> objects that contain information
 * such as the form field name, maximum length, default value, required field
 * for submission and others.
 * 
 * @see org.tair.utilities.WebFormField
 * @see org.tair.utilities.DefaultWebFormField
 * @see org.tair.utilities.DelimitedWebFormField
 */

public class CommunityFormValidator {

  // fields common to all communities, person & organization
  private static final WebFormField[] commFields = new WebFormField[19];

  // fields specifically for organizations
  private static final WebFormField[] orgFields = new WebFormField[7];

  // fields specific to persons
  private static final WebFormField[] personFields = new WebFormField[17];

  // total number of person fields, calculate once & save
  private static final int PERSON_SIZE =
    commFields.length + personFields.length;

  // total number of organization fields, calculate once & save
  private static final int ORG_SIZE = commFields.length + personFields.length;

  static {

    // fieldName, required, length
    commFields[0] = new WebFormField("address", true, 255);
    commFields[1] = new WebFormField("city", true, 30);

    // manually check - one or other must be filled
    commFields[2] = new WebFormField("region", false, 30);
    commFields[3] = new WebFormField("region_other", false, 30);

    commFields[4] = new WebFormField("country", true);
    commFields[5] = new WebFormField("postal_code", true, 20);

    commFields[6] = new WebFormField("keyword", false, 200);
    commFields[6].setMultiple(true);

    commFields[7] = new WebFormField("url_1", false, 255);
    commFields[8] = new WebFormField("web_site_name_1", false, 100);
    commFields[9] = new WebFormField("url_2", false, 255);
    commFields[10] = new WebFormField("web_site_name_2", false, 100);
    commFields[11] = new WebFormField("phone_work", false, 20);
    commFields[12] = new WebFormField("phone_lab", false, 20);
    commFields[13] = new WebFormField("phone_mobile", false, 20);
    commFields[14] = new WebFormField("phone_fax", false, 20);
    commFields[15] = new WebFormField("author_name", false, 50);
    commFields[16] = new DelimitedWebFormField("alias", false, 50, "\n");
    commFields[17] =
      new DefaultWebFormField("status", DataConstants.getNewStatus());
    commFields[18] = new DefaultWebFormField("is_obsolete", "F");

    orgFields[0] = new WebFormField("email", false, 100);
    orgFields[1] = new WebFormField("name", true, 100);
    orgFields[2] = new WebFormField("org_type", true, 30);
    orgFields[3] = new WebFormField("description", false, 255);
    orgFields[4] = new DefaultWebFormField("NASC_fee_paid", "F");
    orgFields[5] = new DefaultWebFormField("ABRC_fees_waived", "F");
    orgFields[6] = new DefaultWebFormField("commercial", "F");

    personFields[0] = new WebFormField("email", true, 100);
    personFields[1] = new WebFormField("last_name", true, 30);
    personFields[2] = new WebFormField("first_name", true, 30);
    personFields[3] = new WebFormField("user_name", true, 30);
    personFields[4] = new WebFormField("password", true, 30);
    personFields[5] = new WebFormField("password_confirm", true, 30);
    personFields[6] = new WebFormField("password_hint", false, 100);
    personFields[7] = new WebFormField("middle_name", false, 30);
    personFields[8] = new WebFormField("suffix", false, 10);
    personFields[9] = new DateWebFormField("birthdate", false);
    personFields[10] = new DefaultWebFormField("is_user_focus", "F");
    personFields[11] = new DefaultWebFormField("is_external_curator", "F");
    personFields[12] = new DefaultWebFormField("is_tair_curator", "F");
    personFields[13] = new WebFormField("research_interest", false, 255);
    personFields[14] = new WebFormField("organism", false, 200);
    personFields[14].setMultiple(true);
    personFields[15] = new WebFormField("primary_job_title", true, 60);
    personFields[16] = new DefaultWebFormField("send_mail", "F");
  }

  /**
   * Checks submitted information for a <code>BsPerson</code> record for
   * presence of required fields, & valid field values
   * 
   * @param request HttpServletRequest containing submitted form field values
   * @param conn An active connection to the database
   * @param community ID Community ID of given person, may be null if person is
   *          just being created
   * @return HashMap containing validated form field values, using field name as
   *         key for retrieving
   * @exception InvalidFormException thrown if one or more submitted values are
   *              invalid
   * @exception SQLException thrown if an error occurs while retrieving
   *              information from the database
   */
  @SuppressWarnings("unchecked")
  public static HashMap validatePersonInfo(HttpServletRequest request,
                                           BigInteger communityID)
      throws InvalidFormException {

    HashMap personParams = new HashMap(PERSON_SIZE);
    TreeMap errors = new TreeMap();
    boolean hasError = false;
    boolean localError = false;

    localError = validateFields(request, commFields, personParams, errors);
    if (localError && !hasError) {
      hasError = true;
    }
    localError = validateFields(request, personFields, personParams, errors);
    if (localError && !hasError) {
      hasError = true;
    }

    if (!passwordsMatch(personParams)) {
      errors.put("password", "Passwords don't match");
      hasError = true;
    }

    String userName = (String)personParams.get("user_name");
    if (!isUniqueUserName(userName, communityID)) {
      errors.put("user_name", "The username " + userName
                              + " is already in use. Choose another.");
      hasError = true;
    }

    String region =
      getRegion((String)personParams.get("region"),
                (String)personParams.get("region_other"),
                (String)personParams.get("country"),
                errors);

    personParams.remove("region_other");
    personParams.put("region", region);
    personParams.put("country", (String)personParams.get("country"));

    // only validate email if value submitted - blank value will already be
    // caught above.
    String email = (String)personParams.get("email");
    if (email != null) {
      if (!validEmail(email)) {
        errors.put("email", "Invalid email address");
        hasError = true;
      }
    }

    if (hasError) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

    return personParams;

  }

  // make sure user entered same password twice when changing
  @SuppressWarnings("unchecked")
  private static boolean passwordsMatch(Map params) {
    boolean match = true;
    String password = (String)params.get("password");
    String confirm = (String)params.get("password_confirm");

    // only call error if password & confirm are not null --
    // if empty, separate error will already be generated
    if (password != null && confirm != null && !password.equals(confirm)) {
      match = false;
    }
    return match;
  }

  /**
   * Checks submitted information for a <code>BsOrganization</code> record for
   * presence of required fields, & valid field values
   * 
   * @param request HttpServletRequest containing submitted form field values
   * @param conn An active connection to the database
   * @param community ID Community ID of given organization, may be null if
   *          organization is just being created
   * @return HashMap containing validated form field values, using field name as
   *         key for retrieving
   * @exception InvalidFormException thrown if one or more submitted values are
   *              invalid
   * @exception SQLException thrown if an error occurs while retrieving
   *              information from the database
   * @throws InvalidSessionException when the session is not set up completely
   */
  @SuppressWarnings("unchecked")
  public static HashMap validateOrganizationInfo(HttpServletRequest request,
                                                 BigInteger communityID)
      throws InvalidFormException, SQLException, InvalidLoginException,
      InvalidSessionException {

    HashMap orgParams = new HashMap(ORG_SIZE);
    TreeMap errors = new TreeMap();

    validateFields(request, commFields, orgParams, errors);
    validateFields(request, orgFields, orgParams, errors);

    String region =
      getRegion((String)orgParams.get("region"),
                (String)orgParams.get("region_other"),
                (String)orgParams.get("country"),
                errors);

    orgParams.remove("region_other");
    orgParams.put("region", region);

    // email can be blank for org so only check if value was submitted
    String email = (String)orgParams.get("email");
    if (email != null) {
      if (!validEmail(email)) {
        errors.put("email", "Invalid email address");
      }
    }

    String name = (String)orgParams.get("name");
    if (name != null) {
      if (!isUniqueOrgName(name, communityID)) {
        errors.put("name", "An organization with the name \"" + name
                           + "\" already exists. Please choose another name.");
      }
    }

    /*
     * Determine whether person updating record has requested to be contact
     * person. For an existing person, set the community id for the contact
     * person. Set is contact person value to t/f based on value of form
     * submission. This is necessary so we can set value back to false if was
     * previously true and is now changing. If not chosen here, contact person
     * may be declared as part of member search for org
     * 
     * Set whether person updating record is curator or not. Needed because
     * additional logic happens to determine whether or not to pay attention to
     * contact person value for curators (since they might be entering org. info
     * for which they're not necessarily meaning to be affiliated to it).
     */
    
    // Get the checkbox value ("true" or null) and set flag in params.
    String selfContact = request.getParameter("is_contact_person");
    if (!TextConverter.isEmpty(selfContact) && selfContact.equals("true")) {
      orgParams.put("is_contact_person", Boolean.TRUE);
    } else {
      orgParams.put("is_contact_person", Boolean.FALSE);
    }

    // Set the updater-as-curator flag in the params.
    orgParams.put("is_updater_curator",
                  new Boolean(LoginChecker.isTairCurator(request)));
    
    // Only set the updater id for existing updaters, not newly registering
    // updaters; these will update the contact person affiliation later after
    // the person is stored to the database.
    
    // Get the person doing the updating (community ID in session).
    BsPerson updater = SessionHandler.getPerson(request);
    
    // If the updater is there, set the id into the params.
    if (updater != null) {
      orgParams.put("updater_id", updater.getCommunityId());
    } else {
      orgParams.put("updater_id", null);
    }

    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

    return orgParams;

  }

  // decide which region is valid from 2 boxes submitted
  private static String getRegion(String USregion, String otherRegion,
                                  String country, Map<String, String> errors) {
    String region = null;
    if (!TextConverter.isEmpty(USregion)) {
      region = USregion;

    } else if (!TextConverter.isEmpty(otherRegion)) {
      region = otherRegion;
    }

    // blank country error should already be recorded
    if (country != null) {

      // region must be submitted if US or Canada
      if (country.equals("USA") || country.equals("Canada")) {
        if (region == null) {
          errors.put("region", "State/Province cannot be blank is country is "
                               + country);
          // if region is not one of acceptable regions, error
        } else if (!DataConstants.getRegions().containsKey(region)) {
          errors.put("region", "Country cannot be " + country
                               + " if State/Province is " + region);
        }
      } else {
        // if other country, just make sure not US/Canada region - blanks ok
        if (region != null && DataConstants.getRegions().containsKey(region)) {
          errors.put("region", "Country cannot be " + country
                               + " if State/Province is "
                               + (String)DataConstants.getRegions().get(region));
        }
      }
    }

    return region;
  }

  // iterate through fields & validate according to each fields rules
  @SuppressWarnings("unchecked")
  private static boolean validateFields(HttpServletRequest request,
                                     WebFormField[] formFields, Map target,
                                     Map errors) {
    boolean hasErrors = false;
    
    for (int i = 0; i < formFields.length; i++) {
      try {
        target.put(formFields[i].getFieldName(),
                   formFields[i].validate(request));

      } catch (InvalidParameterException ipe) {
        errors.put(formFields[i].getFieldName(), ipe.getMessage());
        hasErrors = true;
      }
    }
    return hasErrors;
  }

  /**
   * Retrieves and validates affiliation parameters including new affiliations,
   * affiliations to be deleted, PI status, primary affiliations, contact
   * persons, and job titles; the ids are either organization ids for a list
   * of the affiliations of a person or community ids for a list of the
   * affiliations of an organization or lab (the community id of the person
   * affiliated with the lab)
   * 
   * @param request HttpServletRequest containing submitted form field values
   * @param type <code>String</code> that is either "person" or "organization"
   *          and flags what type of community these parameters are for.
   * @return HashMap containing validated affiliation parameters, using field
   *         name as key for retrieving
   * @exception InvalidParameterException thrown if invalid id submitted as
   *              parameter
   */
  @SuppressWarnings("unchecked")
  public static HashMap validateAffiliationInfo(HttpServletRequest request,
                                                String type)
      throws InvalidParameterException {

    // structures to hold retrieved values in
    Long[] deleteIDs = null;
    Long[] affiliateOrgIDs = null;
    Long[] affiliateLabIDs = null;
    Long[] affiliatePersonIDs = null;
    Long[] piIDs = null;
    Long[] primaryIDs = null;
    Long[] contactIDs = null;
    HashMap<BigInteger, String> titleIDs = null;
    HashMap affParams = null;

    // retrieve values from request
    try {
      if (request.getParameter("delete") != null) {
        deleteIDs =
          TextConverter.stringToLongArray(request.getParameterValues("delete"));
      }

      if (request.getParameter("affiliateLab") != null) {
        affiliateLabIDs =
          TextConverter.stringToLongArray(request.getParameterValues("affiliateLab"));
      }

      if (request.getParameter("affiliateOrg") != null) {
        affiliateOrgIDs =
          TextConverter.stringToLongArray(request.getParameterValues("affiliateOrg"));
      }

      if (request.getParameter("affiliatePerson") != null) {
        affiliatePersonIDs =
          TextConverter.stringToLongArray(request.getParameterValues("affiliatePerson"));
      }

      if (request.getParameter("pi") != null) {
        piIDs =
          TextConverter.stringToLongArray(request.getParameterValues("pi"));
      }

      if (request.getParameter("primary") != null) {
        primaryIDs =
          TextConverter.stringToLongArray(request.getParameterValues("primary"));
      }

      if (request.getParameter("contact") != null) {
        contactIDs =
          TextConverter.stringToLongArray(request.getParameterValues("contact"));
      }

      // in HTML form, titles are named "title_<org_id_number>" Iterate through all
      // form fields & parse out organization ID from field name if matches this format --
      // save value (title) with newly parsed organization ID in titleIDs
      Enumeration itr = request.getParameterNames();
      while (itr.hasMoreElements()) {
        String field = (String)itr.nextElement();
        if (field.startsWith("title_")
            && !request.getParameter(field).trim().equals("")) {

          BigInteger affID = null;
          // Extract organization id from field name
          if (!field.substring(6).equalsIgnoreCase("null")) {
            affID = new BigInteger(field.substring(6));
          }
          if (titleIDs == null) {
            titleIDs = new HashMap();
          }
          titleIDs.put(affID, request.getParameter(field));
        }
        field = null;
      }

      // use affParams to hold all other collections of params -- make sure
      // to only add items that are not null - person & organization objects
      // will look for presence or absence of key, not value
      affParams = new HashMap();

      if (deleteIDs != null && deleteIDs.length > 0) {
        affParams.put("deleted", deleteIDs);
      }

      if (affiliateOrgIDs != null && affiliateOrgIDs.length > 0) {
        affParams.put("affiliateOrgs", affiliateOrgIDs);
      }

      if (affiliateLabIDs != null && affiliateLabIDs.length > 0) {
        affParams.put("affiliateLabs", affiliateLabIDs);
      }

      if (affiliatePersonIDs != null && affiliatePersonIDs.length > 0) {
        affParams.put("affiliatePersons", affiliatePersonIDs);
      }

      if (piIDs != null && piIDs.length > 0) {
        affParams.put("pi", piIDs);
      }

      if (primaryIDs != null && primaryIDs.length > 0) {
        affParams.put("primary", primaryIDs);
      }

      if (contactIDs != null && contactIDs.length > 0) {
        affParams.put("contact", contactIDs);
      }

      if (titleIDs != null && !titleIDs.isEmpty()) {
        affParams.put("titles", titleIDs);
      }

      affParams.put("type", type);
      affParams.put("aff_action", request.getParameter("aff_action"));

    } catch (NumberFormatException e) {
      throw new InvalidParameterException(e.getMessage());
    }

    return affParams;
  }

  /**
   * Retrieves and validates parameters for different affiliation searches,
   * whether for person or organization. Retrieved values are "first_name",
   * "last_name" and "name". Any search must have at least one of these
   * parameters submitted, or <code>InvalidFormException</code> will be thrown
   * 
   * @return Map containing form field value using field name as key to
   *         reference
   * @param request HttpServletRequest containing affiliation parameters
   * @exception InvalidFormException thrown if no parameters submitted
   */
  @SuppressWarnings("unchecked")
  public static Map validateAffiliationSearchInfo(HttpServletRequest request)
      throws InvalidFormException {

    HashMap params = null;

    if (!TextConverter.isEmpty(request.getParameter("last_name"))) {
      params = new HashMap();
      params.put("last_name", request.getParameter("last_name").trim());
      params.put("last_name_method", request.getParameter("last_name_method"));
    }

    if (!TextConverter.isEmpty(request.getParameter("first_name"))) {
      if (params == null) {
        params = new HashMap();
      }
      params.put("first_name", request.getParameter("first_name").trim());
      params.put("first_name_method", request.getParameter("first_name_method"));
    }

    if (!TextConverter.isEmpty(request.getParameter("name"))) {
      if (params == null) {
        params = new HashMap();
      }
      params.put("name", request.getParameter("name").trim());
      params.put("name_method", request.getParameter("name_method"));
    }

    if (params == null || params.isEmpty()) {
      throw new InvalidFormException("No search parameters entered");
    }
    return params;
  }

  /**
   * Retrieves and validates login parameters. Both username and password must
   * not be null or empty, or <code>InvalidFormException</code> will be thrown
   * 
   * @param username User Name submitted for login
   * @param password Password submitted for login
   * @exception InvalidFormException thrown if no parameters submitted
   */
  @SuppressWarnings("unchecked")
  public static void validateLoginInfo(String username, String password)
      throws InvalidFormException {

    TreeMap errors = null;
    if (TextConverter.isEmpty(username)) {
      if (errors == null) {
        errors = new TreeMap();
      }
      errors.put("user_name", "Username cannot be blank");
    }

    if (TextConverter.isEmpty(password)) {
      if (errors == null) {
        errors = new TreeMap();
      }
      errors.put("password", "Password cannot be blank");
    }

    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

  }

  /**
   * Is the specified user name a unique user name in the database? If there is
   * a specified community ID, the check verifies the existing community member
   * has that id; otherwise, the name would not be unique. If there is a
   * database member with the user name but the specified ID is null, it means
   * the insertion of the member would result in a duplicate name.
   * 
   * @param userName the user name to look up in the database
   * @param communityID the optional community ID being updated
   * @return true if the update would result in a unique user name, false if it
   *         would result in a duplciate user name
   */
  private static boolean isUniqueUserName(String userName,
                                          BigInteger communityID) {

    boolean unique = true;
    if (!TextConverter.isEmpty(userName)) {
      CommunityDelegate delegate =
        CommunityDelegateFactory.getCommunityDelegate();
      BsCommunity member = delegate.getCommunityByUsername(userName);
      if (member != null) {
        if (communityID == null) {
          // Database member exists but community ID from client is null,
          // so adding a new member with this username means it's not unique.
          unique = false;
        } else if (!member.getCommunityId().equals(communityID)) {
          // Database member exists but the database id is not the same as the
          // input id, so this would be a duplicate insert of the name.
          unique = false;
        }
      }
    }
    return unique;
  }

  /**
   * Is the specified organization name a unique name in the database? If there
   * is a specified community ID, the check verifies the existing community
   * member has that id; otherwise, the name would not be unique. If there is a
   * database member with the user name but the specified ID is null, it means
   * the insertion of the member would result in a duplicate name.
   * 
   * @param orgName the organization name to look up in the database
   * @param communityID the optional community ID being updated
   * @return true if the update would result in a unique org name, false if it
   *         would result in a duplicate org name
   */
  private static boolean isUniqueOrgName(String name, BigInteger communityID) {

    boolean unique = true;
    if (!TextConverter.isEmpty(name)) {
      OrganizationDelegate delegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      BsOrganization org = delegate.getOrganizationByName(name);
      if (org != null) {
        if (communityID == null) {
          // Database org exists but community ID from client is null,
          // so adding a new org with this username means it's not unique.
          unique = false;
        } else if (!org.getCommunityId().equals(communityID)) {
          // Database org exists but the database id is not the same as the
          // input id, so this would be a duplicate insert of the name.
          unique = false;
        }
      }
    }
    return unique;
  }

  /**
   * Validates submitted <code>String</code> to ensure that string passes
   * general test of characteristics for a valid email address. Method cannot
   * guarantee that submitted address is valid, but makes general assumption of
   * validity if address:
   * 
   * <ul>
   * <li>Does not contain any illegal characters such as blank spaces, commas,
   * colons etc.
   * <li>Contains one, and only one @ symbol
   * <li>Contains at least one "." after @ symbol
   * <li>Contains at least two characters after the dot
   * </ul>
   * 
   * @param email <code>String</code> containing address to be validated
   * @return <code>true</code> if email passes all tests or <code>false</code>
   *         if email does not pass all tests
   */
  public static boolean validEmail(String email) {

    // invalidate if address has any junk characters
    char[] invalidChars = new char[] { ' ', '/', '\\', ';', ':', ',' };
    for (int i = 0; i < invalidChars.length; i++) {
      if (email.indexOf(invalidChars[i]) >= 0) {
        return false;
      }
    }

    // if no @ sign in address
    int atPos = email.indexOf('@');
    if (atPos == -1) {
      return false;
    }

    // if more than 1 @ sign in address
    if (email.indexOf('@', atPos + 1) != -1) {
      return false;
    }

    // if no dot in address
    int periodPos = email.indexOf('.', atPos);
    if (periodPos == -1) {
      return false;
    }

    // if there aren't at least 2 characters after dot
    if (periodPos + 3 > email.length()) {
      return false;
    }

    return true;
  }

}
