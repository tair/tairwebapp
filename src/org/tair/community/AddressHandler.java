/**
 * Copyright 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.AddressDelegate;
import org.tair.bs.community.BsAddress;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsCountry;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;

import com.poesys.db.dto.DtoStatusException;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * Perform updates to a PI's labs. If PI chooses, selected lab street addresses,
 * email addresses and phone numbers can be updated to match changes in the PI's
 * personal information.
 */

public class AddressHandler implements RequestHandler {

  /** the URL of the person-committed page */
  private static final String COMMIT_PAGE =
    "/jsp/community/person_committed.jsp";

  /**
   * Processes requested updates to the address, email, and/or phone of the
   * selected labs of a PI. The handler updates the indicated element based on
   * the corresponding element currently associated with the person in the
   * session embedded in the request.
   * 
   * @param request the servlet request containing the selected lab ids and the
   *          user's session containing the address, email, and phone changes
   * @return a response pointing to a committed page
   * @throws SQLException when database error occurs while trying to update lab
   *           records
   * @throws InvalidSessionException when there is no BsPerson in session from
   *           which to update
   * @throws InvalidParameterException when invalid community ID submitted for
   *           lab
   * @throws InvalidFormException when no lab ids submitted with request
   * @throws InvalidActionException when there is a logical problem storing the
   *           changes
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidSessionException, InvalidParameterException,
      InvalidFormException {

    List<BigInteger> phoneUpdates = null;
    List<BigInteger> addressUpdates = null;
    List<BigInteger> emailUpdates = null;

    // Re-initialize the session change flag.
    SessionHandler.setPersonChanged(request, Boolean.FALSE);

    try {

      // Get the lab community ids selected for update.
      addressUpdates = getLabsToUpdate(request, "address");
      emailUpdates = getLabsToUpdate(request, "email");
      phoneUpdates = getLabsToUpdate(request, "phone");

      // Check to make sure there is at least one update.
      if (addressUpdates.size() == 0
          && emailUpdates.size() == 0
          && phoneUpdates.size() == 0) {
        throw new InvalidFormException("No labs selected for update");
      } else {
        updateLabs(request, addressUpdates, emailUpdates, phoneUpdates);
      }

    } catch (NumberFormatException e) {
      throw new InvalidParameterException("Invalid community ID for lab: "
                                          + e.getMessage());
    }

    RequestHandlerResponse response = new RequestHandlerResponse();
    SessionHandler.removeOrganization(request);
    response.setPage(COMMIT_PAGE);

    return response;
  }

  /**
   * Get a list of <code>BigInteger</code> community ids that identify a set of
   * labs to update with a particular parameter.
   * 
   * @param request the HTTP request containing the parameters
   * @param parameterName the particular parameter to get
   * @return a list of <code>BigInteger</code> community ids which may be empty
   *         but is never null
   */
  private List<BigInteger> getLabsToUpdate(HttpServletRequest request,
                                           String parameterName) {
    List<BigInteger> ids = new ArrayList<BigInteger>();
    if (!TextConverter.isEmpty(request.getParameter(parameterName))) {
      String[] values = request.getParameterValues(parameterName);
      ids = TextConverter.stringToBigIntList(values);
    }
    return ids;
  }

  /**
   * Extract the relevant current values from the person in the user's session,
   * then update the indicated labs with the appropriate values.
   * 
   * @param request the HTTP request containing updates
   * @param addressUpdates the community ids having address updates
   * @param emailUpdates the community ids having email updates
   * @param phoneUpdates the community ids having phone updates
   * @throws InvalidSessionException when the session does not contain the
   *           required object
   * @throws InvalidActionException when the person in the session has no
   *           address
   */
  private void updateLabs(HttpServletRequest request,
                          List<BigInteger> addressUpdates,
                          List<BigInteger> emailUpdates,
                          List<BigInteger> phoneUpdates)
      throws InvalidSessionException, InvalidActionException {

    // get address components from person in session
    BsPerson person = SessionHandler.getPerson(request);
    if (person == null) {
      throw new InvalidSessionException("No person in session with updates");
    }
    BsAddress addressObject = person.getCommunity().getAddress();
    String address = addressObject.getAddress();
    if (address == null && addressUpdates.size() > 0) {
      throw new InvalidActionException("No address associated with person with community id "
                                       + person.getCommunityId());
    }
    String postalCode = addressObject.getPostalCode();
    String region = addressObject.getRegion();
    String city = addressObject.getCity();
    String email = person.getCommunity().getEmail();
    String workPhone = person.getCommunity().getPhone("work");
    BsCountry countryObject = addressObject.getCountryObject();

    updateAddresses(request,
                    addressUpdates,
                    address,
                    postalCode,
                    region,
                    city,
                    countryObject);
    updateWorkPhones(phoneUpdates, workPhone);
    updateEmailAddresses(emailUpdates, email);
  }

  /**
   * Update a set of labs identified by their community ids with an address
   * represented by a set of address components. This will either update the
   * existing address of the lab or will add a new address and will reset the
   * lab's stock center to be the default for the new address country. If there
   * is at least one lab address update, the method sets the address-changed
   * flag in the session.
   * 
   * @param request the HttpServletRequest containing the session
   * 
   * @param addressUpdates a list of BigInteger community ids for updated labs
   * @param address an address
   * @param postalCode a postal code
   * @param region a region of a country
   * @param city a city
   * @param countryObject a BsCountry object
   */
  private void updateAddresses(HttpServletRequest request,
                               List<BigInteger> addressUpdates, String address,
                               String postalCode, String region, String city,
                               BsCountry countryObject) {
    if (addressUpdates != null && addressUpdates.size() > 0) {
      // Create a list to hold the updates for later delegate processing.
      List<BsOrganization> orgs =
        new ArrayList<BsOrganization>(addressUpdates.size());
      // Get the business delegates.
      OrganizationDelegate orgDelegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      AddressDelegate addrDelegate =
        CommunityDelegateFactory.getAddressDelegate();

      for (BigInteger id : addressUpdates) {
        // Get the lab.
        BsOrganization lab = orgDelegate.getOrganizationByCommunityId(id);
        // Get the current address of the lab to update.
        BsAddress currentAddress = lab.getCommunity().getAddress();
        if (currentAddress != null) {
          // Update the elements of the existing address.
          currentAddress.setAddress(address);
          currentAddress.setCity(city);
          currentAddress.setRegion(region);
          currentAddress.setCountryObject(countryObject);
          currentAddress.setPostalCode(postalCode);
        } else {
          // No current address, generate a new one.
          addrDelegate.createAddress(null,
                                     address,
                                     city,
                                     region,
                                     postalCode,
                                     countryObject.getCountryId(),
                                     lab.getCommunityId());
        }

        // Update the seed stock center (ABRC/NASC) to the default center for
        // the country by passing null to the setSeedStockCenter() method on the
        // lab.
        lab.setSeedStockCenter(null);
        // Set the address to mark the community object changed.
        // This allows processing of the community within the lab.
        List<BsAddress> addresses = new ArrayList<BsAddress>(1);
        addresses.add(currentAddress);
        lab.getCommunity().setAddresses(addresses);

        orgs.add(lab);

        // Set the address-updated flag in the session.
        SessionHandler.setPersonChanged(request, Boolean.TRUE);
      }

      // insert/update into the database and commit
      orgDelegate.process(orgs);
    }
  }

  /**
   * Update a set of labs identified by their community ids with a work phone
   * number represented by a string. This will either update the existing work
   * phone of the lab or will add a new work phone. If the input phone number is
   * null, the method deletes the indicated phone from the community.
   * 
   * @param phoneUpdates list of community ids of the labs to update
   * @param phoneNumber the phone number with which to update all the labs
   */
  private void updateWorkPhones(List<BigInteger> phoneUpdates,
                                String phoneNumber) {
    if (phoneUpdates != null && phoneUpdates.size() > 0) {
      // Create a list to hold the updates for later processing.
      List<BsCommunity> communities =
        new ArrayList<BsCommunity>(phoneUpdates.size());
      // Get the business delegate.
      CommunityDelegate delegate =
        CommunityDelegateFactory.getCommunityDelegate();

      for (BigInteger id : phoneUpdates) {
        IPrimaryKey key = CommunityFactory.getCommunityPrimaryKey(id);
        BsCommunity lab = delegate.getObject((SequencePrimaryKey)key);
        lab.setPhone("work", phoneNumber);
        communities.add(lab);
      }

      // insert/update into the database and commit.
      delegate.process(communities);
    }
  }

  /**
   * Update a set of labs identified by their community ids with an email
   * address represented by a string. This will either update the existing email
   * address of the lab or will add a new address.
   * 
   * @param emailUpdates list of community ids of the labs to update
   * @param email the string representing the new email address
   * @throws DtoStatusException
   */
  private void updateEmailAddresses(List<BigInteger> emailUpdates, String email) {
    if (emailUpdates != null && emailUpdates.size() >= 1) {
      // Create a list to hold the updates for later processing.
      List<BsOrganization> orgs = new ArrayList<BsOrganization>(emailUpdates.size());
      // Get the business delegate.
      OrganizationDelegate orgDelegate =
        CommunityDelegateFactory.getOrganizationDelegate();

      for (BigInteger id : emailUpdates) {
        BsOrganization lab = orgDelegate.getOrganizationByCommunityId(id);
        lab.setEmail(email);
        orgs.add(lab);
      }

      // Insert/update into the database and commit.
      orgDelegate.process(orgs);
    }
  }
}
