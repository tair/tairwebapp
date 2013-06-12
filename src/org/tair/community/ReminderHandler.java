// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.8 $
// $Date: 2003/12/03 17:56:02 $
// ------------------------------------------------------------------------------

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.DatabaseManager;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;


/**
 * ReminderHandler handles requests for automatic email reminders for user's
 * login information. ReminderHandler first allows user to search and find their
 * own community record, displays the current information including password
 * hint, and then sends automatic email to person's address on record, if user
 * desires.
 * 
 * @see RequestHandler
 */

public class ReminderHandler implements RequestHandler {
  private DatabaseManager connectionPool;
  private final String actionURL = "Community";

  /**
   * Retrieves parameters from <code>HttpServletRequest</code> and performs
   * actions necessary to find user's record, display information and send
   * reminder email. Action to take is determined by value of parameter
   * "remind_action" in request. Valid values are:
   * 
   * <ul>
   * <li>view</li>
   * <li>search</li>
   * <li>mail</li>
   * </ul>
   * 
   * If no remind_action specified, it is assumed user is beginning process, and
   * is redirected to initial search form. If remind_action = "view" or "mail",
   * the user's information will be retrieved from the database using the
   * "communityID" in the request.
   * 
   * @param request <code>HttpServletRequest</code> passed from calling servlet
   * @return <code>RequestHandlerResponse</code> containing URL of page to be
   *         redirected to, and any request attributes for display including the
   *         requested person's <code>BsPerson</code> object referenced by the
   *         key "person".
   * @exception SQLException thrown if an error occurs while retrieving
   *              information from the database
   * @exception InvalidParameterException thrown if an invalid community ID is
   *              received
   * @exception InvalidFormException thrown if no search parameters received
   *              when remind_action = search
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidParameterException, InvalidFormException {

    String remind_action = request.getParameter("remind_action");
    DBconnection conn = null;
    RequestHandlerResponse response = new RequestHandlerResponse();
    
    // Get the community id from the session if it's there.
    BigInteger communityId = null;
    if (!TextConverter.isEmpty(request.getParameter("communityID"))) {
      communityId = new BigInteger(request.getParameter("communityID"));
    }

    try {
      this.connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      // If the community id is present, use it to get the record.
      if (communityId != null) {
        PersonDelegate delegate =
          CommunityDelegateFactory.getPersonDelegate();
        BsPerson person = delegate.getPersonByCommunityId(communityId);

        // if no specific action requested, or view record requested,
        // show reminder profile page
        if (remind_action == null || remind_action.equals("view")) {
          response.setAttribute("person", person);
          response.setPage("/jsp/community/reminder_profile.jsp");

          // if requesting email reminder, get email address, compare
          // & send mail to user or curator
        } else if (remind_action.equals("mail")) {
          CommunityEmailHandler.sendPasswordReminder(person,
                                                     person.getCommunity().getEmail());
          response.setPage(CommunityPageHolder.getEmailSentPage());
        }

        // else if no action requested, & no communityID, show search
        // page to find record
      } else if (remind_action == null) {
        response.setPage("/jsp/community/login_search.jsp");

        // else, search for person with form params
      } else if (remind_action.equals("search")) {
        searchPersons(conn, request, response);

      } else {
        throw new InvalidParameterException("Invalid reminder action requested: "
                                            + remind_action);
      }

    } catch (NumberFormatException nfe) {
      throw new InvalidParameterException(nfe.getMessage());

    } finally {
      if (conn != null) {
        DBReadManager.return_connection(conn);
      }
    }
    return response;
  }

  // retrieve search parameters from request and retrieve
  // SearchResultsCollection
  // of matching persons
  @SuppressWarnings("unchecked")
  private void searchPersons(DBconnection conn, HttpServletRequest request,
                             RequestHandlerResponse response)
      throws InvalidFormException, SQLException, InvalidParameterException {

    // get params for scrolling through result set ( if multiple pages of
    // results )
    ScrollParams scrollParams = ScrollCalculator.getScrollParams(request);

    Map params = CommunityFormValidator.validateAffiliationSearchInfo(request);
    SearchResultsCollection searchCollection =
      CommunitySearcher.searchPersons(conn, params, scrollParams);

    // get links to scroll through multiple pages of results
    if (searchCollection != null && !searchCollection.isEmpty()) {
      String commParams = "action=remind&remind_action=search";
      String scrollLinks =
        ScrollCalculator.getScrollLinks(scrollParams.getSize(),
                                        scrollParams.getPage(),
                                        params,
                                        commParams,
                                        searchCollection,
                                        actionURL);
      if (scrollLinks != null) {
        searchCollection.setScrollLinks(scrollLinks);
      }
      response.setAttribute("searchCollection", searchCollection);
      response.setPage("/jsp/community/login_search_results.jsp");

      // if collection empty, go to no results page w/option to search again
    } else {
      response.setPage("/jsp/community/login_no_results.jsp");
    }
  }

}
