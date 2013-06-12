/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceSearcher;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.SearchSession;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * Do a user lab invoice search based on a lab id supplied by the user.
 * 
 * @author Robert J. Muller
 */
public class InvoiceLabSearchHandler extends InvoiceSearchHandler {

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    extractParameters(request);

    InvoiceSearcher searcher = new InvoiceSearcher(params);
    SearchSession searchSession = SessionHandler.getSearchSession(request, type);
    
    setQueryId(searcher);
    RequestHandlerResponse response =
      search(searchSession, searcher, USER_SUMMARY);
    
    // Set the person.
    response.setAttribute("person", person);
    // Set the lab-search flag in the response for a PI lab search.
    response.setAttribute("is_lab_search", "true");
    // Set the lab parameter in the response with the lab object.
    response.setAttribute("lab", getOrganizationFromParameters(request));

    return response;
  }

  /**
   * Get the organization object corresponding to the lab specified in the
   * search parameters.
   * 
   * @param request the request containing the lab_id parameter
   * @return the organization object
   * @throws InvalidFormException when no lab id specified in parameters
   */
  private BsOrganization getOrganizationFromParameters(
                                                       HttpServletRequest request)
      throws InvalidFormException {
    BsOrganization organization = null;
    String labIdStr = request.getParameter("lab_id");
    BigInteger labId = null;
    if (!TextConverter.isEmpty(labIdStr)) {
      labId = new BigInteger(labIdStr);
    }

    if (labId != null) {
      OrganizationDelegate delegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      IPrimaryKey key = CommunityFactory.getOrganizationPrimaryKey(labId);
      organization = delegate.getObject((SequencePrimaryKey)key);
    } else {
      throw new InvalidFormException("Search for lab did not specify lab id");
    }
    return organization;
  }
}
