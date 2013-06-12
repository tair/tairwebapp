// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tair.abrc.order.Order;
import org.tair.abrc.order.Orders;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.community.LoginChecker;
import org.tair.db.DB;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.SessionHandler;


public class OrderPlacer extends HttpServlet {
  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = 6980504460979166735L;

  public void doGet(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    ServletLogger.start(getClass().getName(), req, res);
    showOrderPlaced(req, res);
    ServletLogger.end(getClass().getName(), req, res);
  }

  public void doPost(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    ServletLogger.start(getClass().getName(), req, res);
    OrderState state = OrderBuilder.getState(req);
    Order order = state.getOrder();
    doPlace(order, req, res);
    ServletLogger.end(getClass().getName(), req, res);
  }

  private void showOrderPlaced(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    DBconnection conn = DB.getRead();
    try {
      Long id = new Long(req.getParameter("order"));
      CompositeOrder order = new CompositeOrder(conn, id);
      if (SessionHandler.getTairCurator(req) || allow_view(order, req)) {
        req.setAttribute("order", order);
        req.getRequestDispatcher("/jsp/abrc/order_placed.jsp").forward(req, res);
        return;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DB.release(conn);
    }
    res.sendError(HttpServletResponse.SC_NOT_FOUND);
  }

  /**
   * Returns true if the logged in user has permission to view the order. A user
   * has permission if: - the session has the ORDER_PLACED attribute - the
   * current user is a TAIR curator - the current user is affiliated with the
   * order's organization
   */
  private boolean allow_view(CompositeOrder order, HttpServletRequest req) {
    boolean allowed = false;
    Long id = (Long)req.getSession().getAttribute(DataConstants.ORDER_PLACED);
    if (id != null && id.equals(order.get_orders_id())) {
      // the session has the ORDER_PLACED attribute
      allowed = true;
    } else if (LoginChecker.isTairCurator(req)) {
      // current user is a TAIR curator
      allowed = true;
    } else {
      try {
        BsPerson person = SessionHandler.getPerson(req);
        BsOrganization orgg = order.get_organization();
        allowed = orgg.hasAffiliate(person);
        // current user is affiliated with order's organization if true
      } catch (Exception e) {
        // Ignore and return false
      }
    }
    return allowed;
  }

  // Place an order without a po number (does not create an Invoice). This is
  // only done when an order has all charges waived.
  public void doPlace(Order order, HttpServletRequest req,
                      HttpServletResponse res) throws IOException,
      ServletException {
    try {
      CompositeOrder comp = Orders.placeOrder(order);
      if (comp != null && comp.get_orders_id() != null) {
        Orders.delete(order);
        OrderBuilder.clearState(req);
        req.getSession().setAttribute(DataConstants.ORDER_PLACED,
                                      comp.get_orders_id());
        res.sendRedirect("/servlets/Order/placed?order=" + comp.get_orders_id());
        return;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    res.sendRedirect(req.getServletPath());
  }
}
