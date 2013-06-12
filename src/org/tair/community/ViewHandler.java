// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.9 $
// $Date: 2003/12/03 17:56:02 $
// ------------------------------------------------------------------------------

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.TextConverter;


/**
 * ViewHandler handles requests to view a person or organization community
 * record. ViewHandler creates Composite records for the requested community ID
 * and forwards to the appropriate page for viewing the information.
 */

public class ViewHandler implements RequestHandler {

  /**
   * Retrieves community record based on "type" and "communityID" parameters in
   * <code>HttpServletRequest</code> and forwards user to page for viewing
   * community record. Valid values for "type" are "person" or "organization".
   * communityID must be a valid community ID for a community record of the
   * requested type.
   * 
   * @param request <code>HttpServletRequest</code> passed from calling servlet
   * @return <code>RequestHandlerResponse</code> containing URL of page to be
   *         forwarded to and <code>BsPerson</code> or
   *         <code>BsOrganization</code> object to be displayed.
   * @exception InvalidParameterException thrown if an invalid type or
   *              communityID is received
   * @exception SQLException thrown if an error occurs while retrieving
   *              information from the database
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidParameterException, SQLException {

    RequestHandlerResponse response = null;

    String type = request.getParameter("type");
    if (type == null || (!type.equals("person") && !type.equals("organization"))) {
      throw new InvalidParameterException("Invalid community type requested: "
                                          + type);
    }

    try {
      response = new RequestHandlerResponse();
      BigInteger communityId = null;
      if (!TextConverter.isEmpty(request.getParameter("communityID"))) {
        communityId = new BigInteger(request.getParameter("communityID"));
        if (communityId != null) {
          if (type.equals("person")) {
            PersonDelegate delegate =
              CommunityDelegateFactory.getPersonDelegate();
            BsPerson person = delegate.getPersonByCommunityId(communityId);
            response.setAttribute("detail", person);
            response.setPage(CommunityPageHolder.getPersonDetailPage());

          } else if (type.equals("organization")) {
            OrganizationDelegate delegate =
              CommunityDelegateFactory.getOrganizationDelegate();
            BsOrganization organization =
              delegate.getOrganizationByCommunityId(communityId);
            response.setAttribute("detail", organization);
            response.setPage(CommunityPageHolder.getOrgDetailPage());
          }
        }
      }

    } catch (NumberFormatException e) {
      throw new InvalidParameterException("Invalid community id: "
                                          + e.getMessage());

    }
    return response;
  }
}
