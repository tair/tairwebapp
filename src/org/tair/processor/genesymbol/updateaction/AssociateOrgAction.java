// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandlerResponse;
import org.tair.processor.genesymbol.CompositeGeneClassSymbol;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.WebFormField;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * Action class to associate organization with gene symbol submission
 */
public class AssociateOrgAction extends UpdateAction {
  /**
   * Create a AssociateOrgAction object.
   */
  public AssociateOrgAction() {
    super("associate_org");
  }

  /**
   * execute the associate organization function, the submitter can associate
   * himself to some other organization other than his affiliation
   * 
   * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
   * @return RequestHandlerResponse containing URL to forward user to
   * @exception InvalidLoginException thrown if user is not logged in
   * @exception SQLException thrown if a database error occurs
   * @exception InvalidParameter exception thrown if invalid update_action, id
   *              or data received
   * @exception UnauthorizedRequestException thrown if non-curator user attempts
   *              to access
   * @exception SessionOutOfTimeException thrown if session out of time
   * @exception InvalidFormException thrown if invalid or incomplete form data
   *              is received
   */

  public RequestHandlerResponse execute(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidParameterException,
      UnauthorizedRequestException, InvalidLoginException,
      SessionOutOfTimeException {
    CompositeGeneClassSymbol compSymbol =
      getCompositeGeneSymbolFromSession(request);
    BsOrganization org = null;
    HashMap<String, String> errors = new HashMap<String, String>();

    field = new WebFormField("id", true);
    BigInteger communityId = null;
    try {
      communityId = new BigInteger((String)field.validate(request));
    } catch (InvalidParameterException ipe) {
      String errMessage =
        "You must select a organization for affiliation . "
            + "Please go back and select the organization you want to associate. ";

      errors.put("id", errMessage);
      throw new InvalidFormException(errors);
    }

    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    org = delegate.getOrganizationByCommunityId(communityId);
    if (org != null) {
      compSymbol.setAssociatedOrg(org);
    } else {
      // No such community id
      String errMessage =
        communityId.toString() + " is not a community id for an organization";
      errors.put("id", errMessage);
      throw new InvalidFormException(errors);
    }

    RequestHandlerResponse response = new RequestHandlerResponse();

    request.setAttribute("symbol", compSymbol);
    String action_from_who = getActionFromWhoFromSession(request);

    if (action_from_who.equals("curator")) {
      response.setPage("/jsp/processor/genesymbol/curator_modify_symbol.jsp");
      response.setAttribute("from_who", "curator");
    } else {
      response.setPage("/jsp/processor/genesymbol/symbol_registration.jsp");
    }
    return response;

  }
}
