/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * Redirect to the user laboratory search using the selected organization. This
 * is called from the search-choice page when the PI or contact person clicks on
 * one of the lab-search buttons.
 * 
 * @author Robert J. Muller
 */
public class InvoiceRedirectToLabSearchHandler extends InvoiceSearchHandler {
  /** URI for user-lab-search JSP */
  private static final String USER_LAB_SEARCH =
    "/jsp/abrc/payment/pi_search_invoices.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    RequestHandlerResponse response = new RequestHandlerResponse();

    extractParameters(request);

    // make sure requesting user is a pi of org, contact person or curator
    if (!(pi || curator || contact)) {
      throw new UnauthorizedRequestException("Not authorized for this resource");
    }

    response.setAttribute("organization",
                          getOrganization(new BigInteger(request.getParameter("communityID"))));
    response.setPage(USER_LAB_SEARCH);

    return response;
  }

  /**
   * Get the organization based on the community id .
   * 
   * @param organizationCommunityId the community id of the organization
   * 
   * @return the organization for the search
   * @throws InvalidFormException when the user did not select an organization
   */
  protected BsOrganization getOrganization(BigInteger organizationCommunityId)
      throws InvalidFormException {
    if (organizationCommunityId == null) {
      throw new InvalidFormException("No organization selected");
    }
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    return delegate.getOrganizationByCommunityId(organizationCommunityId);
  }

}
