// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.4 $
// $Date: 2005/09/14 16:22:51 $
// ------------------------------------------------------------------------------

package org.tair.abrc.handler;


import javax.servlet.http.HttpServletRequest;

import org.tair.community.LoginChecker;
import org.tair.handler.HandlerFactory;
import org.tair.handler.RequestHandler;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * InvoiceHandlerFactory creates <code>RequestHandler</code> objects for
 * processing invoice search servlet requests. This subclass of the generic
 * HandlerFactory implements a simple, hard-coded factory method pattern for
 * creating the request handlers in the invoice handler subsystem. These
 * handlers are much more narrow in scope than the typical TAIR handlers, which
 * are very monolithic in nature. This factory should be the model for future
 * revisions to the search (and other) request-handler system. The main
 * difference is that this handler gets the HTTP request in its constructor and
 * sets up the internal elements that determine the handler, such as type,
 * action, and search-function. This logic moves into the constructor in this
 * class from the process method in the handler class, enabling that process
 * method to be much more focused on doing just what the handler is supposed to
 * do.
 */

public class InvoiceHandlerFactory extends HandlerFactory {

  /** the select function chosen on the invoice search summary page */
  private String selectFunction;
  /** the invoice search action */
  private String action;
  /** the invoice search mode (user or curator modes) */
  private String mode;

  /**
   * Creates an instance of HandlerFactory. Check whether the user is logged in
   * with appropriate privileges for the requested action.
   * 
   * @param request the request that contains parameters that determine which
   *          handler to return
   * @throws InvalidParameterException when there is a problem parsing the
   *           request parameters
   * @throws InvalidLoginException when the user is not logged in
   * @throws UnauthorizedRequestException when the user is not authorized to
   *           perform the requested action
   */
  public InvoiceHandlerFactory(HttpServletRequest request)
      throws InvalidParameterException, UnauthorizedRequestException,
      InvalidLoginException {
    getActionAndSelectFunction(request);
    getSearchMode(request);
    if (!action.equals("user_cc_payment")) {
      // Check appropriate login for anything other than credit card payment.
      checkLogin(request, action);
    }
  }

  @Override
  public boolean containsKey(String key) {
    // Exists for compatibility with SearchServlet initialization
    // return true for "invoice" and "userinvoice"
    if ("invoice".equals(key) || "userinvoice".equals(key)) {
      return true;
    } else {
      return super.containsKey(key);
    }
  }

  @Override
  public RequestHandler getHandler(String key) throws InvalidParameterException {
    // key is ignored, the factory already has the information needed.

    RequestHandler handler = null;

    if (mode.equals("user")) {
      if (action.equals("search")) {
        handler = new InvoiceUserSearchHandler();
      } else if (action.equals("choose_search")) {
        handler = new InvoiceChooseSearchHandler();
      } else if (action.equals("user_person_search")) {
        handler = new InvoicePersonSearchHandler();
      } else if (action.equals("user_lab_search")) {
        handler = new InvoiceLabSearchHandler();
      } else if (action.equals("labsearch")) {
        handler = new InvoiceRedirectToLabSearchHandler();
      } else if (action.equals("userdetail")) {
        handler = new InvoiceUserDetailSearchHandler();
      }
    }

    if (handler == null) {
      if (action.equals("search")) {
        handler = new InvoiceCuratorSearchHandler();
      } else if (action.equals("re_search")) {
        handler = new InvoiceNewPageHandler();
      } else if (action.equals("new_payment")) {
        handler = new InvoiceNewPaymentHandler();
      } else if (action.equals("detail")) {
        handler = new InvoiceCuratorDetailHandler();
      } else if (action.equals("userdetail")) {
        handler = new InvoiceUserDetailSearchHandler();
      } else if (action.equals("userdetailform")) {
        handler = new InvoiceUserDetailFormHandler();
      } else if (action.equals("payment")) {
        handler = new InvoicePaymentHandler();
      } else if (action.equals("re_sort")) {
        handler = new InvoiceSortResultsHandler();
      } else if (action.equals("selectFunction")) {
        if (selectFunction.equals("process")) {
          handler = new InvoiceProcessHandler();
        }
        if (selectFunction.equals("download")) {
          handler = new InvoiceDownloadHandler();
        }
        if (selectFunction.equals("downloadlineitems")) {
          handler = new InvoiceDownloadItemHandler();
        }
        if (selectFunction.equals("sendpastdue")) {
          handler = new InvoicePastDueHandler();
        }
        if (selectFunction.equals("set_paid_in_full")) {
          handler =
            new InvoiceStatusHandler(DataConstants.INVOICE_STATUS_PAID_IN_FULL);
        }
        if (selectFunction.equals("set_in_progress")) {
          handler =
            new InvoiceStatusHandler(DataConstants.INVOICE_STATUS_IN_PROGRESS);
        }
        if (selectFunction.equals("set_cancelled")) {
          handler =
            new InvoiceStatusHandler(DataConstants.INVOICE_STATUS_CANCELLED);
        }
        if (handler == null) {
          throw new InvalidParameterException("Invalid select function "
                                              + selectFunction);
        }
      }
    }

    if (handler == null) {
      throw new InvalidParameterException("Invalid invoice search parameter "
                                          + action
                                          + " in "
                                          + mode
                                          + " mode");
    }

    return handler;
  }

  /**
   * Check appropriate login for the requested action. This checks the following
   * actions that are limited to curators:
   * <ul>
   * <li>search</li>
   * <li>re_search</li>
   * <li>new_payment</li>
   * <li>process</li>
   * <li>detail</li>
   * <li>payment</li>
   * <li>download</li>
   * <li>re_sort</li>
   * </ul>
   * 
   * @param request Servlet request
   * @param action Requested action
   * @throws UnauthorizedRequestException when non-curator user requests a
   *           curator resource
   * @throws InvalidLoginException when user is not logged in
   */
  private void checkLogin(HttpServletRequest request, String action)
      throws UnauthorizedRequestException, InvalidLoginException {

    if (!LoginChecker.isLoggedIn(request)) {
      throw new InvalidLoginException("User not logged in");

      // make sure only curators can access the listed actions
      // in user mode we don't need to check curator
    } else if (!mode.equals("user")
               && (action.equals("search")
                   || action.equals("re_search")
                   || action.equals("new_payment")
                   || action.equals("process")
                   || action.equals("detail")
                   || action.equals("payment")
                   || action.equals("download") || action.equals("re_sort"))) {

      if (!LoginChecker.isTairCurator(request)) {
        String msg = "Only curators may request " + action;
        throw new UnauthorizedRequestException(msg);
      }
    }
  }

  /**
   * Get the action and select function that determine what to do. The action
   * parsing is a little complex because of historical interface support; the
   * action may be in the "action" parameter after a login redirection, or it
   * may be in the "search_action" parameter if there is no action parameter.
   * 
   * @param request the HTTP session containing the parameters
   * @throws InvalidParameterException when there is no action
   */
  private void getActionAndSelectFunction(HttpServletRequest request)
      throws InvalidParameterException {
    // Get the action, which may be in "action" after a redirection through
    // login or set directly or may be in "search_action". Summary pages use
    // search action because of conflicts with form.action attribute in
    // javascript in Mac IE 4.5

    if (!TextConverter.isEmpty(request.getParameter("action"))) {
      // May be multiple action parameters after login redirection
      String[] requestVals = request.getParameterValues("action");

      for (int i = 0; i < requestVals.length; i++) {
        if (!requestVals[i].equals("login")) {
          // primary action rather than "login" after redirection from login
          action = requestVals[i];
        }
      }
    }

    // action may be in single-valued "search_action" parameter, use that
    // if there was no "action" parameter.
    if (action == null) {
      action = request.getParameter("search_action");
    }

    // if still null, no action specified
    if (action == null) {
      throw new InvalidParameterException("Invalid action received: null");
    }

    // Get the select function used to decide what function was selected.
    selectFunction = request.getParameter("selectFunction");
  }

  /**
   * Get the search mode (user or curator), default to curator.
   * 
   * @param request the HTTP request containing the mode parameter
   */
  private void getSearchMode(HttpServletRequest request) {
    // Get the search mode, defaulting to curator search.
    if (request.getParameter("mode") != null) {
      mode = request.getParameter("mode");
    } else {
      mode = "curator";
    }
  }
}
