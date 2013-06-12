/**
 * Copyright 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.io.Serializable;
import java.math.BigInteger;
import java.sql.SQLException;

import org.tair.bs.community.AddressDelegate;
import org.tair.bs.community.BsAddress;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsCountry;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.utilities.RecordNotFoundException;

import com.poesys.bs.delegate.DelegateException;
import com.poesys.db.dto.DtoStatusException;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * ListCommunity is a lightweight class for displaying community information,
 * usually used to create a list of search results when minimal information is
 * needed for display. ListCommunity allows display of community information
 * when the complete information contained by the BsCommunity object is
 * unnecessary.
 * 
 * <p>
 * Implements Serializable so ListCommunity objects can be written as part of
 * serialized stock catalog data
 */

public class ListCommunity implements Serializable {

  private static final long serialVersionUID = 9204399108617825413L;
  private BigInteger communityID;
  private BigInteger specificID;
  private String displayName;
  private String displayType;
  private String communityType;
  private String email;
  private BsAddress address;

  // duplicated in displayName for person, null for org.
  private String firstName;
  private String lastName;

  // org. abbrev name - from Organization.abbrev_name, null for person.
  // Calling getAbbrevName for an organization will return this value but
  // will manually try to create an abbreviated name for person from firstName
  // and lastName values
  private String abbrevName;

  /**
   * Creates an empty instance of ListCommunity
   */
  public ListCommunity() {
    address =
      CommunityDelegateFactory.getAddressDelegate().createAddress(new BigInteger("0"), null, null, null, null, null, new BigInteger("0"));
  }

  /**
   * Create a ListCommunity object with the data contained in a BsCommunity
   * object. This constructor sets the display type, the specific ID, the
   * community ID, and the address for all objects. For persons, it sets the
   * first name and last name as well.
   * 
   * @param community the BsCommunity object
   */
  public ListCommunity(BsCommunity community) {
    displayType = community.getCommunityType();
    BsCommunity.Type type = BsCommunity.Type.valueOf(displayType.toUpperCase());
    if (type == BsCommunity.Type.PERSON) {
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      BsPerson person =
        delegate.getPersonByCommunityId(community.getCommunityId());
      if (person != null) {
        specificID = person.getPersonId();
        firstName = person.getFirstName();
        lastName = person.getLastName();
        // community.getName() is firstName + " " + lastName
        displayName = lastName + ", " + firstName;
      } else {
        throw new DelegateException("Could not get person by community id "
                                    + community.getCommunityId());
      }
    } else if (type == BsCommunity.Type.ORGANIZATION) {
      // Community name already set to organization name
      displayName = community.getName();
      OrganizationDelegate delegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      BsOrganization org =
        delegate.getOrganizationByCommunityId(community.getCommunityId());
      if (org != null) {
        specificID = org.getOrganizationId();
      } else {
        throw new DelegateException("Could not get organization by community id "
                                    + community.getCommunityId());
      }
    }

    communityID = community.getCommunityId();
    address = community.getAddress();
  }

  /**
   * Creates an instance of ListCommunity that reflects data referenced by
   * submitted community ID. Community ID may be for either a person or
   * organization - constructor will determine by querying the database.
   * 
   * @param conn An active connection to the database
   * @param communityID The community ID to use for retrieving data
   * @throws SQLException thrown if a database error occurs while retrieving
   *           data, including if no community record is found for communityID
   */
  public ListCommunity(BigInteger communityID) throws SQLException {

    // don't know whether we have a person or org. Check person first
    boolean found = retrievePersonInfo(communityID);

    if (!found) { // if no results, check organization
      found = retrieveOrganizationInfo(communityID);
    }

    if (!found) { // still no results, bad ID
      throw new RecordNotFoundException("No community exists "
                                        + "with id: "
                                        + communityID);
    }

    this.communityID = communityID;
    queryAddressByCommunityId(communityID);
  }

  /**
   * @param communityID
   */
  private void queryAddressByCommunityId(BigInteger communityID) {
    // Query the address given the community id.
    AddressDelegate delegate = CommunityDelegateFactory.getAddressDelegate();
    address = delegate.getAddressByCommunityId(communityID);
  }

  /**
   * Creates an instance of ListCommunity that reflects data referenced by
   * submitted community ID. This version of the constructor can be used when it
   * is known beforehand whether communityID is for a person or an organization
   * 
   * @param conn An active connection to the database
   * @param communityID The community ID to use for retrieving data
   * @param isPerson If <code>true</code> communityID should be for a Person
   *          record; if <code>false</code> communityID should be for an
   *          Organization record.
   * @throws SQLException thrown if a database error occurs while retrieving
   *           data, including if no community record of submitted type is found
   *           for communityID
   */
  public ListCommunity(BigInteger communityID, boolean isPerson)
      throws SQLException {

    boolean found = false;

    if (isPerson) {
      found = retrievePersonInfo(communityID);
    } else {
      found = retrieveOrganizationInfo(communityID);
    }

    if (!found) { // still no results, bad ID
      throw new RecordNotFoundException("No community exists "
                                        + "with id: "
                                        + communityID);
    }

    this.communityID = communityID;
    queryAddressByCommunityId(communityID);
  }

  /**
   * Get data from Person if communityID found - returns true if record found to
   * notify constructor that communityID is valid
   */
  private boolean retrievePersonInfo(BigInteger communityID)
      throws SQLException {

    boolean found = false;

    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(communityID);
    if (person != null) {
      found = true;
      this.specificID = person.getPersonId();
      this.firstName = person.getFirstName();
      this.lastName = person.getLastName();
      this.displayName = firstName + " " + lastName;
      this.displayType = "person";
      this.communityType = person.getCommunity().getCommunityType();
      this.email = person.getCommunity().getEmail();
    }

    return found;
  }

  /**
   * Get data from Organization if communityID found - returns true if record
   * found to notify constructor that communityID is valid
   */
  private boolean retrieveOrganizationInfo(BigInteger communityID)
      throws SQLException {

    boolean found = false;
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    BsOrganization organization =
      delegate.getOrganizationByCommunityId(communityID);

    if (organization != null) {
      found = true;
      this.specificID = organization.getOrganizationId();
      this.displayName = organization.getName();
      this.abbrevName = organization.getAbbrevName();
      this.displayType = organization.getOrganizationType();
      this.communityType = organization.getCommunity().getCommunityType();
      this.email = organization.getCommunity().getEmail();
    }
    return found;
  }

  public BigInteger getCommunityID() {
    return communityID;
  }

  /**
   * Retrieves community record's type specific id (i.e. person_id or
   * organization_id)
   * 
   * @return Person or organization ID for community record
   */
  public BigInteger getSpecificID() {
    return specificID;
  }

  /**
   * Retrieves organization name, or combination of person's first and last name
   * 
   * @return Organization name, or combination of person's first & last name
   */
  public String getDisplayName() {
    return displayName;
  }

  /**
   * Retrieves organization type, or "person"
   */
  public String getDisplayType() {
    return displayType;
  }

  //
  // address wrappers
  //

  public String getCountry() {
    return address != null && address.getCountryObject() != null ? address.getCountryObject().getName()
        : null;
  }

  public Long getCountryID() {
    return address != null ? address.getCountryId().longValue() : null;
  }

  public String getRegion() {
    return address != null ? address.getRegion() : null;
  }

  public String getPostalCode() {
    return address != null ? address.getPostalCode() : null;
  }

  public String getAddress() {
    return address != null ? address.getAddress() : null;
  }

  public String getCity() {
    return address != null ? address.getCity() : null;
  }

  public String getFirstName() {
    return firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public String getEmail() {
    return email;
  }

  /**
   * Returns community type (person/organization) this object represents
   * 
   * @return Community type for object
   */
  public String getCommunityType() {
    return communityType;
  }

  /**
   * Returns type needed for creating links to Community servlet for displaying
   * community record (organization or person)
   * 
   * @return type to use as param when creating link to Community servlet for
   *         displaying detail page for community
   */
  public String getLinkType() {
    return (getCommunityType().equals("person")) ? "person" : "organization";
  }

  public static String getLinkType(String type) {
    return ("person".equalsIgnoreCase(type)) ? "person" : "organization";
  }

  /**
   * Returns an abbreviated name for this community record. For Organizations,
   * this will be the value of the abbrev_name field in the Organization table;
   * for Persons, this will be person's first initial followed by last name
   * 
   * @return Abbreviated name for community record
   */
  public String getAbbrevName() {
    String abbrev = null;

    if (getCommunityType().equals("person")
        && getFirstName() != null
        && getLastName() != null) {

      String firstInitial = getFirstName().substring(0, 1);
      abbrev = firstInitial + ". " + getLastName();

    } else {
      abbrev = abbrevName;
    }

    return abbrev;
  }

  /**
   * Returns the best non-null value for community's abbreviated name. If
   * getAbbrevName() method returns <code>null</code>, the value of
   * getDisplayName() will be returned. This allows JSPs to easily get a
   * non-null display value for community abbreviated name without doing if/else
   * logic in JSP
   * 
   * @return Abbreviated name for community record according to logic of
   *         getAbbrevName, or value of getDisplayName() if no abbreviated name
   *         can be determined for community
   */

  public String getFormatAbbrevName() {
    String formatAbbrev = getAbbrevName();

    if (formatAbbrev == null) {
      formatAbbrev = getDisplayName();
    }
    return formatAbbrev;
  }

  /**
   * Returns best non-null value to use for sorting community records. For
   * person this will be last name, for organization this will be organization
   * name.
   * 
   * @return Name to use for sorting community record
   */
  public String getSortName() {
    String sortName = null;

    if (getCommunityType().equals("person")) {
      sortName = getLastName();
    } else {
      sortName = getDisplayName();
    }

    return sortName;
  }

  public void setCommunityID(BigInteger id) {
    communityID = id;
  }

  public void setSpecificID(BigInteger id) {
    specificID = id;
  }

  public void setDisplayName(String name) {
    displayName = name;
  }

  public void setDisplayType(String type) {
    displayType = type;
  }

  public void setAddress(String addressStr) throws DtoStatusException {
    address.setAddress(addressStr);
  }

  public void setAddress(BsAddress address) {
    this.address = address;
  }

  public void setPostalCode(String code) throws DtoStatusException {
    address.setPostalCode(code);
  }

  public void setCountryID(Long id) throws DtoStatusException {
    // query the country object and set it.
    CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
    IPrimaryKey key =
      CommunityFactory.getCountryPrimaryKey(new BigInteger(id.toString()));
    BsCountry country = delegate.getObject((SequencePrimaryKey)key);
    address.setCountryObject(country);
  }

  public void setRegion(String region) throws DtoStatusException {
    address.setRegion(region);
  }

  public void setCity(String city) throws DtoStatusException {
    address.setCity(city);
  }

  public void setFirstName(String name) {
    firstName = name;
  }

  public void setLastName(String name) {
    lastName = name;
  }

  public void setCommunityType(String type) {
    this.communityType = type;
  }

  public void setEmail(String mail) {
    this.email = mail;
  }

  public void setAbbrevName(String abbrev) {
    this.abbrevName = abbrev;
  }
}
