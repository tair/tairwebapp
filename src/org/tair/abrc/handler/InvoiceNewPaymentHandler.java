/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceDetail;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * Set up a response that redirects to a credit-card or purchase-order check
 * payment page with the set of selected line items for payment and the invoice
 * detail.
 * 
 * @author Robert J. Muller
 */
public class InvoiceNewPaymentHandler extends InvoiceSearchHandler {
  /** the URI for the add-credit-card-payment page */
  private static final String CREDIT_PAYMENT =
    "/jsp/abrc/payment/add_credit_card_payment.jsp";
  /** the URI for the add-check-payment page (for a purchase order) */
  private static final String CHECK_PAYMENT =
    "/jsp/abrc/payment/add_check_payment.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    RequestHandlerResponse response = new RequestHandlerResponse();

    extractParameters(request);

    // Get the invoice payment method.
    String method = request.getParameter("method");

    if (ordersId != null && !TextConverter.isEmpty(method)) {
      // Put the orders id into the response.
      response.setAttribute("orders_id", ordersId);

      // The formIds data member contains the set of selected ids, which in
      // this case are line item ids. Construct an array list of these ids and
      // put it into the response.

      ArrayList<Long> lineItemIDs = new ArrayList<Long>(formIds.length);
      if (formIds != null && formIds.length > 0) {
        for (int i = 0; i < formIds.length; i++) {
          lineItemIDs.add(new Long(formIds[i]));
        }
      }
      response.setAttribute("ids", lineItemIDs);

      // Query the invoice detail and put it into the response.
      InvoiceDetail detail = new InvoiceDetail(ordersId);
      response.setAttribute("detail", detail);

      // Redirect to the indicated payment type page.
      if (method.equalsIgnoreCase("credit")) {
        response.setPage(CREDIT_PAYMENT);
      } else if (method.equalsIgnoreCase("check")) {
        response.setPage(CHECK_PAYMENT);
      } else {
        throw new InvalidParameterException("Invalid payment method: " + method);
      }
    } else {
      // User did not select any rows for payment.
      throw new InvalidFormException("No items selected for payment. Use Back to return to the page to select items.");
    }

    return response;
  }

}
