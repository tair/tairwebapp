// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.40 $
// $Date: 2006/03/08 17:32:45 $
// ------------------------------------------------------------------------------

package org.tair.community;


import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
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
import org.tair.utilities.HTMLFactory;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.bs.delegate.DelegateException;


/**
 * CommunityServlet is the main servlet for community record viewing and
 * editing. This servlet receives HTTP requests and distributes them off to one
 * of several objects that implement the <code>RequestHandler</code> interface
 * to handle the request.
 * 
 * <p>
 * CommunityServlet uses a parameter from the <code>HttpServletRequest</code>
 * called <code>action</code> as a key to determine which RequestHandler
 * should be used to process the request. Action param may be submitted as
 * "community_action" as a workaround to browser scripting conflicts with the
 * form.action attributed
 * 
 * <p>
 * RequestHandlers are created by <code>HandlerFactory</code>, which creates
 * instances of handler classes according to the action key it receives.
 * 
 * @see RequestHandler
 * @see HandlerFactory
 */

public class CommunityServlet extends HttpServlet {
  
  private static final Logger logger = Logger.getLogger(CommunityServlet.class);

  /** Generated serial version UID for Serializable object */
  private static final long serialVersionUID = 2681516302740247643L;
  private HandlerFactory factory;
  private HashMap<String, String> pages;

  /**
   * Populates handler factory with action keys and associated class names for
   * creating RequestHandler objects to service requests for specific actions.
   * This method also initializes both <code>DBWriteManager</code> and
   * <code>DBReadManager</code> connection pools to ensure they are available
   * when accessed directly by RequestHandler objects.
   * 
   * @param config An instance of ServletConfig that contains configuration
   *            information for this servlet
   * @throws ServletException If any errors encountered in initializing servlet
   */
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      DBWriteManager.init();
      DBReadManager.init();
    } catch (Exception e) {
      e.printStackTrace();
    }

    // populate factory with action keys & associated class names
    factory = new HandlerFactory();
    factory.addHandler("view", "org.tair.community.ViewHandler");
    factory.addHandler("edit", "org.tair.community.EditHandler");
    factory.addHandler("login", "org.tair.community.LoginHandler");
    factory.addHandler("update", "org.tair.community.UpdateHandler");
    factory.addHandler("affiliate", "org.tair.community.AffiliateHandler");
    factory.addHandler("search", "org.tair.community.SearchHandler");
    factory.addHandler("logout", "org.tair.community.LogoutHandler");
    factory.addHandler("address", "org.tair.community.AddressHandler");
    factory.addHandler("curator", "org.tair.community.CuratorHandler");
    factory.addHandler("remind", "org.tair.community.ReminderHandler");
    factory.addHandler("commit", "org.tair.community.CommitHandler");
    factory.addHandler("download", "org.tair.abrc.handler.DownloadHandler");
    factory.addHandler("publication", "org.tair.community.PublicationHandler");

    // store pages for common simple redirections
    pages = new HashMap<String, String>();
    pages.put("personProfile", "/jsp/community/person_profile.jsp");
    pages.put("orgProfile", "/jsp/community/org_profile.jsp");
    pages.put("editPerson", "/jsp/community/new_person.jsp");
    pages.put("editOrg", "/jsp/community/new_organization.jsp");
    pages.put("editLab", "/jsp/community/new_lab.jsp");
    pages.put("labAffiliate", "/jsp/community/update_lab_affiliations.jsp");
    pages.put("personAffiliate",
              "/jsp/community/update_person_affiliations.jsp");
    pages.put("memberAffiliate", "/jsp/community/update_org_members.jsp");
    pages.put("personAff", "/jsp/community/add_person_affiliations.jsp");
    pages.put("memberSearch", "/jsp/community/member_search.jsp");
    pages.put("curatorPerson", "/jsp/community/curator_person.jsp");
    pages.put("curatorOrg", "/jsp/community/curator_org.jsp");

  }

  /**
   * Handles all requests (GET & POST) for this servlet. Method passes request
   * off to one of several RequestHandler objects for processing and receives a
   * RequestHandlerResponse object containing a <code>String</code> for what
   * URL the request should be forwarded to, and any newly created objects to be
   * translated to the user's HttpServletRequest for display to the user. Except
   * for IOExceptions, all exceptions generated by processing are caught by this
   * method and the request is forwarded to one of several error pages to give
   * feedback to the user.
   * 
   * Service looks for an action parameter (as "action" or "community_action")
   * in the HttpServletRequest to decide which RequestHandler to use for
   * processing
   * 
   * @param request HttpServletRequest being serviced that contains all
   *            parameters submitted by user
   * @param response HttpServletResponse for this request
   * @see RequestHandler
   * @see RequestHandlerResponse
   * @see HandlerFactory
   */
  public void service(HttpServletRequest request, HttpServletResponse response)
      throws IOException {

    ServletLogger.start(getClass().getName(), request, response);

    try {

      // action might be in "action" or "community_action" - in some cases (as
      // on search summary pages) calling a param "action" conflicts with
      // form.action in javascript in Mac IE 4.5, so may be renamed
      // community_action for that case alone
      String action = request.getParameter("action");
      String type = request.getParameter("type");

      if (action == null) {
        action = request.getParameter("community_action");
      }

      if (action == null) action = "login";

      // if still null, not doing a simple redirect, and no handler defined
      // for action, throw exception
      if (!action.equals("redirect") && !factory.containsKey(action)) {
        throw new InvalidParameterException("Invalid action requested: "
                                            + action);

        // handle simple redirection here w/out creating handler
      } else if (action.equals("redirect")) {
        String nextPage = redirect(request, response);
        forward(request, response, nextPage);

        // redirect to the person detail page in Faces
      } else if (action.equals("view") && type.equals("person")) {
        response.sendRedirect("/entity/person_detail/"
                              + request.getParameter("communityID"));
        return;

        // use action as key to retrieve appropriate RequestHandler for
        // processing
      } else {
        RequestHandler handler = factory.getHandler(action);
        RequestHandlerResponse resp = handler.process(request);

        // transfer any attributes in RequestHandlerResponse to
        // HttpServletRequest
        if (resp.hasAttributes()) {
          Iterator<?> iter = resp.getAttributeKeys();
          while (iter.hasNext()) {
            String key = (String)iter.next();
            request.setAttribute(key, resp.getAttribute(key));
          }
        }

        /*
         * Handle login original page redirect after user logs in. The process
         * goes through this code twice. First, the user navigates to login,
         * which gets here after setting up the next pages as the login page in
         * the first run of the LoginHandler above (handler.process(request).
         * The else code below forwards to the login page, which when submitted
         * reenters this method and executes the handler again. The handler this
         * time logs in the user and sets the page to the original page. Thus,
         * when the process gets here the second time, the action will be
         * "login", the user will be logged in, and the originalPage attribute
         * will be set to something if a redirect is to happen. Otherwise, just
         * forward to the indicated page. The redirect is necessary to have the
         * REST URL pass through PrettyFaces and get transformed to the
         * appropriate Faces URL with appropriate managed bean data (like
         * breadcrumb site id) set by the PrettyFaces filter.
         */
        if (action.equals("login") && LoginChecker.isLoggedIn(request)
            && resp.getAttribute("originalPage") != null) {
          // Redirect instead of forwarding to pass through PrettyFaces filter.
          response.sendRedirect((String)resp.getAttribute("originalPage"));
        } else {
          // forward to JSP returned by RequestHandlerResponse
          forward(request, response, resp.getPage());
        }
      }

      // if somewhere user needs to be logged in
    } catch (InvalidLoginException ile) {
      logger.warn("Invalid login: " + ile.getMessage(), ile);

      // pass along original request so user can be returned there after logging
      // in
      String originalPage = (String)request.getParameter("originalPage");

      // if no originalPage yet, create it by parameters from GET or POST
      if (originalPage == null || originalPage.equals("")) {
        originalPage = HTMLFactory.getRequestURL(request);
      }

      request.setAttribute("originalPage", originalPage);
      request.setAttribute("exception", ile);
      forward(request, response, "/jsp/community/login.jsp");

      /* Specialized SQL Exceptions */

      // if database server offline as part of planned downtime
    } catch (DatabaseServerOfflineException dso) {
      logger.info("Database offline");
      request.setAttribute("exception", dso);
      forward(request, response, "/jsp/common/database_offline.jsp");

      // if any other database error
    } catch (SQLException se) {
      logger.error("SQL exception: " + se.getMessage(), se);
      request.setAttribute("error_source", "Community Servlet");
      request.setAttribute("message", "Database error");
      request.setAttribute("exception", se);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

      // if bad form data was passed in
    } catch (InvalidFormException ife) {
      if (ife.getFormErrors() != null && ife.getFormErrors().size() > 0) {
        logger.error("Invalid form: " + ife.getMessage(), ife);
      } else {
        // Don't dump exception if there are no actual errors; it's useless.
        logger.info("Invalid form: " + ife.getMessage());
      }
      request.setAttribute("exception", ife);
      forward(request, response, "/jsp/common/gen_form_error.jsp");

      // if trying to do something that violates business rules ( like deleting
      // an active account )
    } catch (InvalidActionException iae) {
      logger.error("Invalid action: " + iae.getMessage(), iae);
      request.setAttribute("exception", iae);
      forward(request, response, "/jsp/common/invalid_action_error.jsp");

      // if bad action or type was passed in, or invalid id
    } catch (InvalidParameterException ipe) {
      logger.error("Invalid parameter: " + ipe.getMessage(), ipe);
      request.setAttribute("error_source", "Community Servlet");
      request.setAttribute("message", "Invalid parameter");
      request.setAttribute("exception", ipe);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

      // if BsPerson/Org not in session when they should be
    } catch (InvalidSessionException ise) {
      logger.error("Invalid session: " + ise.getMessage(), ise);
      request.setAttribute("exception", ise);
      forward(request, response, "/jsp/common/session_error.jsp");

      // if requesting resource not authorized for
    } catch (UnauthorizedRequestException ure) {
      logger.error("Unauthorized request: " + ure.getMessage(), ure);
      request.setAttribute("exception", ure);
      forward(request, response, "/jsp/common/unauthorized_error.jsp");

      // should never happen in this servlet
    } catch (DelegateException de) {
      // Poesys/DB business delegate exception
      logger.error("Data access error: " + de.getMessage(), de);
      request.setAttribute("exception", de);
      request.setAttribute("error_source", "TAIR Business Delegate");
      request.setAttribute("message", "Data Access Error");
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");
    }  finally {
      ServletLogger.end(getClass().getName(), request, response);
    }

  }

  // convenience method to handle all forwarding to JSPs for display
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

  // retrieves requested JSP URL for redirection
  private String redirect(HttpServletRequest request,
                          HttpServletResponse response)
      throws InvalidParameterException {

    String requestedPage = request.getParameter("req_page");
    if (requestedPage == null || !pages.containsKey(requestedPage)) {
      throw new InvalidParameterException("Invalid page request: "
                                          + requestedPage);
    }
    return pages.get(requestedPage);
  }

}
