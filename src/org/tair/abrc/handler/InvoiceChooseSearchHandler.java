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
 * A request handler for invoice searching that forwards the PI or contact
 * person to a page asking whether to search personal invoices or lab invoices;
 * users who are not PIs or contact persons get forwarded to the home page.
 * 
 * @author Robert J. Muller
 */
public class InvoiceChooseSearchHandler extends InvoiceSearchHandler {
  /** the search-choice page URI */
  private static final String SEARCH_CHOICE =
    "/jsp/abrc/payment/invoice_search_choice.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    extractParameters(request);
    RequestHandlerResponse response = new RequestHandlerResponse();

    response.setAttribute("person", person);
    if (person.isPi()) {
      response.setPage(SEARCH_CHOICE);
    } else if (person.isContactPerson()) {
      response.setPage(SEARCH_CHOICE);
    } else {
      response.setPage("/");
    }
    return response;
  }
}
