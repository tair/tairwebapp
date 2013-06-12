// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.47 $
// $Date: 2006/05/25 20:16:03 $
// ------------------------------------------------------------------------------

package org.tair.abrc;


import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.tair.handler.HandlerFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.utilities.DatabaseServerOfflineException;
import org.tair.utilities.EmptyOrderException;
import org.tair.utilities.EmptyPaymentException;
import org.tair.utilities.HTMLFactory;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * OrderServlet is the main servlet for ABRC stock order creation and editing.
 * This servlet receives HTTP requests and distributes them off to one of
 * several objects that implement the <code>RequestHandler</code> interface to
 * handle the request. OrderServlet uses a parameter from the
 * <code>HttpServletRequest</code> called <code>state</code> as a key to
 * determine which RequestHandler should be used to process the request.
 * <p>
 * RequestHandlers are created by <code>HandlerFactory</code>, which creates
 * instances of handler classes according to the state key it receives.
 * 
 * @see RequestHandler
 * @see HandlerFactory
 */

public class OrderServlet extends HttpServlet {

  /**
   * 
   */
  private static final long serialVersionUID = -197400019481358164L;
  private HandlerFactory factory;
  private static final Logger logger = Logger.getLogger(OrderServlet.class);

  /**
   * Populates handler factory with action keys and associated class names for
   * creating RequestHandler objects to service requests for specific actions.
   * This method also initializes both <code>DBWriteManager</code> and
   * <code>DBReadManager</code> connection pools to ensure they are available
   * when accessed directly by RequestHandler objects.
   * 
   * @param config An instance of ServletConfig that contains configuration
   *          information for this servlet
   * @throws ServletException If any errors encountered in initializing servlet
   */
  public void init(ServletConfig config) throws ServletException {
    super.init(config);

    // intialize db connection pools
    try {
      DBReadManager.init();
      DBWriteManager.init();

    } catch (Exception e) {
      e.printStackTrace();
    }

    // populate factory with state keys & associated class names
    factory = new HandlerFactory();

    factory.addHandler("catalog", "org.tair.abrc.catalog.CatalogHandler");

    factory.addHandler("confirmRecent",
                       "org.tair.abrc.handler.ConfirmRecentHandler");

    factory.addHandler("constant",
                       "org.tair.abrc.handler.ConstantMaintenanceHandler");

    factory.addHandler("download", "org.tair.abrc.handler.DownloadHandler");

    factory.addHandler("maintain",
                       "org.tair.abrc.handler.OrderMaintenanceHandler");

    factory.addHandler("search", "org.tair.abrc.handler.OrderSearchHandler");

    factory.addHandler("searchUserInvoice",
                       "org.tair.abrc.handler.InvoiceSearchHandler");

    factory.addHandler("updateCharges",
                       "org.tair.abrc.handler.UpdateChargesHandler");

    factory.addHandler("updateStock",
                       "org.tair.abrc.handler.UpdateStockHandler");

  }

  /**
   * Handles all requests (GET & POST) for this servlet. Method passes request
   * off to one of several RequestHandler objects for processing and receives a
   * RequestHandlerResponse object containing a <code>String</code> for what URL
   * the request should be forwarded to, and any newly created objects to be
   * translated to the user's HttpServletRequest for display to the user. Except
   * for IOExceptions, all exceptions generated by processing are caught by this
   * method and the request is forwarded to one of several error pages to give
   * feedback to the user.
   * 
   * <p>
   * Service looks for a state parameter in the HttpServletRequest to decide
   * which RequestHandler to use for processing.
   * 
   * @param request HttpServletRequest being serviced that contains all
   *          parameters submitted by user
   * @param response HttpServletResponse for this request
   * @see RequestHandler
   * @see RequestHandlerResponse
   */
  public void service(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    ServletLogger.start(getClass().getName(), request, response);

    RequestHandler handler = null;
    RequestHandlerResponse resp = null;
    String state = null;

    try {
      // retrieve action request from state param -
      // pass off processing to handler for that action
      state = request.getParameter("state");

      if (state == null || !factory.containsKey(state)) {
        throw new InvalidParameterException("Invalid action " + "requested: "
                                            + state);
      }

      handler = factory.getHandler(state);
      resp = handler.process(request);

      // translate any attributes in response to request for
      // display on next page
      if (resp.hasAttributes()) {
        Iterator<String> iter = resp.getAttributeKeys();
        while (iter.hasNext()) {
          String key = iter.next();
          request.setAttribute(key, resp.getAttribute(key));
        }
      }

      // Process download as a straight file download by the servlet.
      String downloadText = (String)request.getAttribute("downloadText");
      String downloadName = (String)request.getAttribute("downloadName");
      if (downloadName == null || downloadName.length() == 0) {
        downloadName = "download.csv";
      }
      if (downloadText != null && downloadText.length() > 0) {
        // Write out the download text directly through the servlet.
        response.setHeader("Content-length", "" + downloadText.length());
        // Use "invalid" MIME type to force browser to use name as is
        // without attaching some extension or other
        response.setContentType("application/tair-download; charset=utf-8");
        response.setHeader("Content-Disposition",
                           "attachment; filename=" + downloadName);
        byte[] bytes = downloadText.getBytes();
        try {
          response.getOutputStream().write(bytes);
          ServletLogger.end(getClass().getName(), request, response);
          return; // don't forward, already committed
        } catch (IOException e) {
          logger.error(e.getMessage(), e);
          request.setAttribute("exception", e);
          resp.setPage("/jsp/common/error.jsp");
        }
      }

      // forward to JSP returned by RequestHandlerResponse
      forward(request, response, resp.getPage());

      // if somewhere user needs to be logged in
    } catch (InvalidLoginException ile) {

      // if request doesn't already have originalPage defined
      // to redirect user to after login, recreate it from current
      // contents of request

      if (request.getAttribute("originalPage") == null) {
        String originalPage = (String)request.getParameter("originalPage");

        if (originalPage == null || originalPage.equals("")) {
          originalPage = HTMLFactory.getRequestURL(request);
        }

        request.setAttribute("originalPage", originalPage);

      }
      request.setAttribute("exception", ile);
      forward(request, response, "/jsp/community/login.jsp");

      /* Specialized SQL Exceptions */

      // if database server offline as part of planned downtime
    } catch (DatabaseServerOfflineException dso) {
      request.setAttribute("exception", dso);
      forward(request, response, "/jsp/common/database_offline.jsp");

      // if any other database error
    } catch (SQLException se) {
      log(se.getMessage(), se);
      request.setAttribute("error_source", "Order Servlet");
      request.setAttribute("message", "Database error");
      request.setAttribute("exception", se);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

      // if bad form data was passed in
    } catch (InvalidFormException ife) {
      request.setAttribute("exception", ife);
      forward(request, response, "/jsp/common/gen_form_error.jsp");

      // if trying to do something that violates business rules
      // (like trying to place an order without person or lab)
    } catch (InvalidActionException iae) {
      request.setAttribute("exception", iae);
      forward(request, response, "/jsp/common/invalid_action_error.jsp");

      // if order is empty when it should have stocks to continue
    } catch (EmptyOrderException eoe) {
      request.setAttribute("exception", eoe);
      forward(request, response, "/jsp/abrc/empty_order.jsp");

      // if payment is empty when it should have invoices to continue
    } catch (EmptyPaymentException epe) {
      request.setAttribute("exception", epe);
      forward(request, response, "/jsp/abrc/payment/empty_payment.jsp");

      // if bad state was passed in, or invalid id
    } catch (InvalidParameterException ipe) {
      log(ipe.getMessage(), ipe);
      request.setAttribute("error_source", "Order Servlet");
      request.setAttribute("message", "Invalid parameter");
      request.setAttribute("exception", ipe);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

      // if Person/Org/Order not in session when they should be
    } catch (InvalidSessionException ise) {
      request.setAttribute("exception", ise);
      forward(request, response, "/jsp/common/session_error.jsp");

      // if requesting resource not authorized for
    } catch (UnauthorizedRequestException ure) {
      request.setAttribute("exception", ure);
      forward(request, response, "/jsp/common/unauthorized_error.jsp");
    }
    ServletLogger.end(getClass().getName(), request, response);
  }

  /**
   * Convenience method to handle all forwarding to JSPs for display
   * 
   * @param request the HTTP request
   * @param response the HTTP resonse
   * @param nextPage the page to which to forward
   */
  private void forward(HttpServletRequest request,
                       HttpServletResponse response, String nextPage) {
    try {
      RequestDispatcher dispatcher =
        getServletContext().getRequestDispatcher(nextPage);

      dispatcher.forward(request, response);

    } catch (IOException e) {
      ServletContext context = getServletContext();
      context.log(e.getMessage());

    } catch (ServletException e) {
      ServletContext context = getServletContext();
      context.log(e.getMessage());
    }
  }

}
