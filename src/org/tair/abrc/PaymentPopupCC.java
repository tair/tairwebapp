// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc;


import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tair.abrc.order.Customers;
import org.tair.abrc.order.Order;
import org.tair.abrc.order.Orders;
import org.tair.abrc.order.PendingPayment;
import org.tair.bs.community.BsOrganization;
import org.tair.utilities.MD5;


public class PaymentPopupCC extends HttpServlet {
  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = 2484159392017287224L;

  public void doGet(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    OrderState state = OrderBuilder.getState(req);
    Order order = state.getOrder();
    BsOrganization _org = order.getOrganization();
    if (order != null && _org != null && Orders.placeCreditCardOrder(order)) {
      BigInteger pid = order.getPersonId();
      req.setAttribute("order", order);
      req.setAttribute("orgName", _org.getName());
      req.setAttribute("person", Customers.getPerson(pid));
      req.setAttribute("addr", Customers.getShippingAddress(pid));
      String digest =
        MD5.hexDigest(Long.toString(order.getOrderNumber())
                      + Long.toString(new java.util.Date().getTime()));
      PendingPayment pending = new PendingPayment();
      pending.setToken(digest);
      pending.setStatus("PENDING");
      pending.setOrderNumber(order.getOrderNumber());
      pending.save();
      req.setAttribute("paymentToken", pending.getToken());
    }
    req.getRequestDispatcher("/jsp/abrc/payment_popup_cc.jsp").forward(req, res);
  }
}
