/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.DatabaseManager;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnactivatedUserException;


/**
 * LoginHandler handles requests to log a user in, passing off queries to
 * <code>LoginChecker</code>, and redirecting to login page or welcome page as
 * appropriate
 * 
 * @see LoginChecker
 * @see RequestHandler
 */

public class LoginHandler implements RequestHandler {

  /**
   * Retrieves login parameters from <code>HttpServletRequest</code> and checks
   * validity, or redirects to login page. If request type is a "POST" it's
   * assumed that request should contain username and password and not having
   * them will generate an <code>InvalidFormException</code>, otherwise if
   * request is a "GET", non-logged in user is redirected to login page to enter
   * login info. while logged in user is redirected to "Personal Home Page", or
   * "Welcome" page. If user was redirected to login page while requesting a
   * protected resource, the URL of the original request will be saved in
   * "originalPage", and user will be redirected there after logging in
   * successfully.
   * 
   * <p>
   * After logging in successfully, a collection of all affiliated organizations
   * for this user will be added to request for display on welcome page. If
   * logged in user is TAIR curator, a collection of all new registrations will
   * be added to the request for display on the curator welcome page.
   * 
   * <p>
   * User can log in either from main login page, or from "password reminder"
   * page. If user's login information is not valid, user is redirected to the
   * login page they came from by checking the value of "login_page" in the
   * user's request. If user came from reminder page, a <code>BsPerson</code>
   * object is created and added to the request for display on the page.
   * 
   * <p>
   * If a user's login fails because their account has not yet been activated by
   * curator (i.e. is status "new"), no exception will be thrown here, but the
   * user will be redirected to a specialized error page informing user that
   * they must wait to be activated by curator.
   * 
   * @param request <code>HttpServletRequest</code> passed from calling servlet
   * @return <code>RequestHandlerResponse</code> containing any objects to be
   *         added to user's request for display, and <code>String</code> of
   *         page to be forwarded to.
   * @throws SQLException thrown if an error occurs while retrieving data from
   *           the database
   * @throws InvalidFormException thrown if username & password are not in
   *           request to login user
   * @throws InvalidLoginException thrown if username/password combination is
   *           not valid
   * @throws InvalidParameterException thrown if invalid community ID is passed
   *           as id for this user
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      InvalidParameterException {

    RequestHandlerResponse response = new RequestHandlerResponse();
    String username = request.getParameter("user_name");
    String password = request.getParameter("password");
    String loginPage = request.getParameter("login_page");
    String originalPage = request.getParameter("originalPage");
    DatabaseManager connectionPool = null;
    DBconnection conn = null;
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();

    if (!TextConverter.isEmpty(originalPage)) {
      response.setPage(originalPage);
      response.setAttribute("originalPage", originalPage);
    }

    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.get_connection();

      if (!LoginChecker.isLoggedIn(request)) {

        // POST, do login, otherwise 1st request so forward to login page
        if (request.getMethod().equals("POST")) {
          CommunityFormValidator.validateLoginInfo(username, password);

          try {
            // throws exception if user/password combo not found
            LoginChecker.login(request, username, password, conn);

            // if user is found but has "new" status,
            // redirect to specialized error page
          } catch (UnactivatedUserException uue) {
            response.setPage("/jsp/community/not_yet_activated.jsp");
          }

        } else {
          response.setPage(CommunityPageHolder.getLoginPage());
        }
      }

      if (response.getPage() == null || response.getPage().equals("")) {
        if (LoginChecker.isTairCurator(request)) {
          // get new info. for curators
          Map<String, ListCommunity[]> newCommunities =
            CommunitySearcher.getNewCommunities();

          if (newCommunities != null && !newCommunities.isEmpty()) {
            response.setAttribute("newCommunities", newCommunities);
          }
        }
        // Get the login ID to set the person for the welcome page back to 
        // whoever is actually logged in.
        BigInteger loginId = SessionHandler.getLoginId(request);
        
        // Reset the session community id to the login id.
        SessionHandler.setCommunityID(request, loginId);
        
        response.setPage(CommunityPageHolder.getWelcomePage());

      }

    } catch (InvalidLoginException e) {
      if (!TextConverter.isEmpty(originalPage)) {
        response.setAttribute("originalPage", originalPage);
      }

      response.setAttribute("exception", e);
      try {
        // if logging in from "reminder" page & gave bad password,
        // add person to request for redisplay w/error message
        BigInteger communityId = null;
        if (!TextConverter.isEmpty(request.getParameter("communityID"))) {
          communityId = new BigInteger(request.getParameter("communityID"));
        }
        if (loginPage != null && loginPage.equals("remind") && communityId != null) {
          response.setAttribute("person",
                                delegate.getPersonByCommunityId(communityId));
          response.setPage("/jsp/community/reminder_profile.jsp");
        } else {
          response.setPage(CommunityPageHolder.getLoginPage());
        }
      } catch (NumberFormatException nfe) {
        throw new InvalidParameterException(nfe.getMessage());
      }
    } finally {
      if (conn != null) {
        DatabaseManager.return_connection(conn);
      }
    }
    return response;
  }
}
