/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoicePayer;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;

/**
   * Pay the searched invoices, then forward to the payment confirmation page.
 * 
 * @author Robert J. Muller
 */
public class InvoicePaymentHandler extends InvoiceSearchHandler {
  /** the URI for the curator payment confirmation JSP */
  private static final String PAYMENT_CONFIRMATION =
    "/jsp/abrc/payment/curator_payment_confirmation.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    extractParameters(request);
    InvoicePayer invoicePayer = new InvoicePayer();
    invoicePayer.pay(params);

    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setPage(PAYMENT_CONFIRMATION);

    return response;
  }
}
