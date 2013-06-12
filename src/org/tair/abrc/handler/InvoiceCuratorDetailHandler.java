/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceDetail;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * Query the invoice detail for an order based on the orders id and redirect to
 * the detail page for the invoice.
 * 
 * @author Robert J. Muller
 */
public class InvoiceCuratorDetailHandler extends InvoiceSearchHandler {
  /** the URI for the curator invoice detail page */
  private static final String DETAIL =
    "/jsp/abrc/payment/curator_invoice_detail.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    extractParameters(request);

    if (ordersId == null) {
      throw new InvalidParameterException("No orders id submitted");
    }

    InvoiceDetail detail = new InvoiceDetail(ordersId);

    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setAttribute("detail", detail);
    response.setPage(DETAIL);

    return response;
  }
}
