package org.tair.abrc;


import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.TextConverter;


public class ProxyHandler extends HttpServlet {
  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = -6050106365212773034L;

  public void doGet(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    req.getRequestDispatcher("/jsp/abrc/curator_proxy_order.jsp").forward(req,
                                                                          res);
  }

  public void doPost(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    ServletLogger.start(getClass().getName(), req, res);
    try {
      if (!TextConverter.isEmpty(req.getParameter("personID"))) {
        OrderState state =
          OrderState.proxy(new BigInteger(req.getParameter("personID")));
        req.getSession().setAttribute(DataConstants.ORDER_STATE, state);
        res.sendRedirect("/servlets/Order/current");
      } else {
        throw new InvalidParameterException("Person ID not set for proxy");
      }
    } catch (Exception e) {
      res.sendRedirect("/servlets/Order/proxy");
    }
    ServletLogger.end(getClass().getName(), req, res);
  }
}
