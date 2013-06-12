/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * If the person is a pi (and hasn't already chosen the desired view), redirect
 * to the PI search choice page, which lets the PI choose to view his own
 * invoices or any invoice. Non-PIs redirect to the user search page.
 * 
 * @author Robert J. Muller
 */
public class InvoiceUserSearchHandler extends InvoiceSearchHandler {
  /** URI for search-choice JSP */
  private static final String SEARCH_CHOICE =
    "/jsp/abrc/payment/invoice_search_choice.jsp";
  /** URI for user-search-invoices JSP */
  private static final String USER_SEARCH =
    "/jsp/abrc/payment/user_search_invoices.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    extractParameters(request);

    // Get the login community id and the corresponding person.
    BigInteger loginCommunityId = SessionHandler.getCommunityID(request);
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(loginCommunityId);

    // Has PI user already confirmed search for own items?
    String piChoice = request.getParameter("pi_user_confirm");
    boolean piChoiceMade = !TextConverter.isEmpty(piChoice);

    RequestHandlerResponse response = new RequestHandlerResponse();

    response.setAttribute("person", person);
    if (person.isPi() && !piChoiceMade) {
      response.setPage(SEARCH_CHOICE);
    } else {
      response.setPage(USER_SEARCH);
    }
    return response;
  }
}
