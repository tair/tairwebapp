/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.abrc;


import java.io.IOException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.tair.abrc.order.Customers;
import org.tair.abrc.order.Order;
import org.tair.abrc.order.Orders;
import org.tair.abrc.order.Storage;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.SessionHandler;

public class OrderBuilder extends HttpServlet
{
  /**
   * Logger for this class
   */
  private static final Logger logger = Logger.getLogger(OrderBuilder.class);
  /**
   * Generated serial version UID for Serializable object
   */
  private static final long serialVersionUID = 1940026127527702228L;

  public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		ServletLogger.start(getClass().getName(), req, res);
		OrderState state = getState(req);
		String cur = state.getCurrentState();

    if ("ERROR".equals(cur))
      forwardToError(state, req, res);

    else if ("ORDER_COMPLETE".equals(cur))
      redirectToPlaced(state, req, res);

    else if ("WAIT_FOR_LOGIN".equals(cur))
      res.sendRedirect("/servlets/Community?action=login&originalPage=/servlets/Order/current");

    else if ("WAIT_FOR_ACCEPT".equals(cur))
      forwardToConfirm(state, req, res);

    else if ("WAIT_FOR_CONFIRM_RECENT".equals(cur))
      forwardToConfirmRecent(state, req, res);

    else if ("PAYMENT_IN_PROGRESS".equals(cur))
      forwardToWait(state.getOrder(), req, res);

    else if ("PO_PAYMENT".equals(cur))
      forwardToPO(state, req, res);

    else if ("CC_PAYMENT".equals(cur))
      forwardToCC(state, req, res);

    else
      forwardToOrder(state, req, res);

    ServletLogger.end(getClass().getName(), req, res);
  }

  @SuppressWarnings("unchecked")
  public void doPost(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    ServletLogger.start(getClass().getName(), req, res);
    OrderState state = getState(req);
    Map<String, String[]> map = new HashMap<String,String[]>(req.getParameterMap());
    try {
      state.change(map);
    } catch (Exception e) {
      throw new ServletException("Exception building order", e);
    }
    req.getSession().setAttribute(DataConstants.ORDER_STATE, state);
    res.sendRedirect(req.getServletPath());
    ServletLogger.end(getClass().getName(), req, res);
  }
	/** Retrieve the OrderState from the HttpSession or reconstruct OrderState from previously saved data (if any). */
  public static OrderState getState(HttpServletRequest req) {
    System.out.println("get to getState");
    HttpSession session = req.getSession();
    OrderState state =
      (OrderState)session.getAttribute(DataConstants.ORDER_STATE);
    String currentState = null;

    if (state == null) {
      state = new OrderState();
      session.setAttribute(DataConstants.ORDER_STATE, state);
      currentState = state.currentState();
    } else {
      currentState = state.currentState();
    }
    
    if (currentState != null && !currentState.equals("ORDER_COMPLETE")) {
      if (state.getOrder() != null) {
        Order o = state.getOrder();
        if (o.hasStocks() && Storage.orderDataById(o.getId()) == null) {
          state = new OrderState();
          session.setAttribute(DataConstants.ORDER_STATE, state);
        }
      }
    }

    if (state != null && state.getPersonId() == null)
      try {
        state.setPersonId(SessionHandler.getPersonID(req));
      } catch (InvalidLoginException e) {
        // Ignore this exception and continue
      } catch (Exception e) {
        // Log the exception as a warning and continue
        logger.warn("Error while setting order state person id", e);
      }

    return state;
  }

	public static void clearState(HttpServletRequest req)
	{
		req.getSession().removeAttribute(DataConstants.ORDER_STATE);
	}

  public static void cancelOrder(HttpServletRequest req) {
    HttpSession session = req.getSession();
    OrderState state =
      (OrderState)session.getAttribute(DataConstants.ORDER_STATE);
    if (state != null)
      try {
        Orders.removePendingOrder(state.getOrder());
      } catch (Exception e) {
        e.printStackTrace();
      }
    req.getSession().removeAttribute(DataConstants.ORDER_STATE);
  }

  static void redirectToPlaced(OrderState state, HttpServletRequest req,
                               HttpServletResponse res) {
    try {
      clearState(req);
      req.getSession().setAttribute(DataConstants.ORDER_PLACED,
                                    state.getCompositeOrderId());
      res.sendRedirect("/servlets/Order/placed?order="
                       + state.getCompositeOrderId());
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void forwardToError(OrderState state, HttpServletRequest req,
                             HttpServletResponse res) {
    try {
      req.getRequestDispatcher("/jsp/abrc/order_builder_error.jsp").forward(req,
                                                                            res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void forwardToCC(OrderState state, HttpServletRequest req,
                          HttpServletResponse res) {
    try {
      req.setAttribute("order", state.getOrder());
      req.getRequestDispatcher("/jsp/abrc/payment/place_cc.jsp").forward(req,
                                                                         res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void forwardToPO(OrderState state, HttpServletRequest req,
                          HttpServletResponse res) {
    try {
      req.setAttribute("msg", state.getMsg());
      req.setAttribute("order", state.getOrder());
      req.getRequestDispatcher("/jsp/abrc/payment/place_po.jsp").forward(req,
                                                                         res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void forwardToConfirmRecent(OrderState state, HttpServletRequest req,
                                     HttpServletResponse res) {
    try {
      req.setAttribute("recentStocks", state.getRecent());
      req.setAttribute("comment_missing", state.isCommentMissing());
      req.getRequestDispatcher("/jsp/abrc/confirm_recent_stock.jsp").forward(req,
                                                                             res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void forwardToWait(Order order, HttpServletRequest req,
                            HttpServletResponse res) {
    try {
      req.setAttribute("order", order);
      req.getRequestDispatcher("/jsp/abrc/payment_pending.jsp").forward(req,
                                                                        res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void forwardToConfirm(OrderState state, HttpServletRequest req,
                               HttpServletResponse res) {
    try {
      BigInteger pid = state.getPersonId();
      System.out.println("customer id : " + pid);
      req.setAttribute("shipping", Customers.getShippingAddress(pid));
      req.setAttribute("person", Customers.getPerson(pid));
      Map<BigInteger, String> aff = Customers.getAffiliations(pid);
      if (aff == null || aff.size() == 0) {
        req.getRequestDispatcher("/jsp/abrc/no_affiliates.jsp").forward(req,
                                                                        res);
        return;
      }
      req.setAttribute("affiliations", aff);
      req.getRequestDispatcher("/jsp/abrc/confirm_profile.jsp").forward(req,
                                                                        res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  static void forwardToOrder(OrderState state, HttpServletRequest req,
                             HttpServletResponse res) {
    try {
      Order order = state.getOrder();
      req.setAttribute("failed", state.clearFailed());
      req.setAttribute("order", order == null ? new Order(state.getPersonId())
          : order);
      req.getRequestDispatcher("/jsp/abrc/order.jsp").forward(req, res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
