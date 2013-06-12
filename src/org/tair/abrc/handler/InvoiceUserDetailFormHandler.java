/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * Forwards the user to the user invoice form.
 * 
 * @author Robert J. Muller
 */
public class InvoiceUserDetailFormHandler extends InvoiceSearchHandler {
  /** the URI for the user invoice form JSP  */
  private static final String USER_INVOICE_FORM = "/user_invoice_form.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    
    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setPage(USER_INVOICE_FORM);

    return response;
  }
}
