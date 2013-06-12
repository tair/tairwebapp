/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.CompositeOrder;
import org.tair.abrc.order.Orders;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * Query the order indicated by the orders id parameter and process any pending
 * payment, then display the user detail page for the invoice.
 * 
 * @author Robert J. Muller
 */
public class InvoiceUserDetailSearchHandler extends InvoiceSearchHandler {
  /** the URI for the invoice detail page for a user mode search */
  private static final String USER_DETAIL =
    "/jsp/abrc/payment/user_invoice_detail.jsp";

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {
    DBconnection conn = null;
    CompositeOrder order = null;

    extractParameters(request);

    if (ordersId == null) {
      throw new InvalidParameterException("No orders id submitted");
    }

    try {
      conn = DBWriteManager.getInstance().getSearchConnection();
      order = new CompositeOrder(conn, ordersId);
      Orders.processPendingPayment(order);
    } finally {
      DBWriteManager.return_connection(conn);
    }

    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setAttribute("order", order);
    response.setAttribute("show-err-msg", Orders.hasPaymentError(order));
    response.setAttribute("show-payment-button", Orders.readyForPayment(order));
    response.setAttribute("show-wait", Orders.paymentInProgress(order));
    response.setPage(USER_DETAIL);

    return response;
  }

}
