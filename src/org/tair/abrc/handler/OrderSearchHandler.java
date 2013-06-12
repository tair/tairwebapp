// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.18 $
// $Date: 2006/01/23 21:21:36 $
// ------------------------------------------------------------------------------

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.CompositeOrder;
import org.tair.abrc.OrderFormValidator;
import org.tair.abrc.OrderSearcher;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.community.ListCommunity;
import org.tair.community.LoginChecker;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.HTMLFactory;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * OrderSearchHandler handles requests to all stock orders. Curators may search
 * all orders based on many criteria. Users may search their own personal stock
 * orders by date. PIs may search all orders placed by members of their own lab.
 * All users may search for orders placed for a specific stock.
 * 
 * <p>
 * OrderSearchHandler distributes requests based on parameters received. Search
 * parameters are retrieved and validated by <code>OrderFormValidator</code> and
 * actual searching is done by <code>OrderSearcher</code>
 * 
 * @see OrderSearcher
 * @see OrderFormValidator
 */

public class OrderSearchHandler implements RequestHandler {

  /**
   * Determines what type of search is being requested by examining the "mode"
   * parameter in HttpServletRequest. Valid values for mode are:
   * 
   * <ul>
   * <li>curator - for curator searches</li>
   * <li>user - for searching a user's own stock orders</li>
   * <li>pi - for searching a lab's orders</li>
   * <li>stock - for searching a stock's order history from stock detail page</li>
   * <li>stock_number - for searching a stock's order history where stock number
   * itself is one of search params.</li>
   * </ul>
   * 
   * This method also looks for a "search_action" parameter. Valid values for
   * search_action are:
   * 
   * <ul>
   * <li>search - retrieve search parameters and pass off to
   * <code>OrderSearcher</code> for database searching</li>
   * <li>detail - create <code>CompositeOrder</code> objects for all requested
   * orderIDs for viewing full order details</li>
   * <li>if value is <code>null</code> user is forwarded to the appropriate
   * search page (based on mode) for entering parameters.</li>
   * </ul>
   * 
   * @param request HttpServletRequest passed from OrderServlet
   * @throws InvalidLoginException thrown if user not logged in and requesting
   *           resource that requires authentication
   * @throws UnauthorizedRequestException thrown if user requests curator
   *           resource
   * @throws SQLException thrown if a database error occurs while retrieving
   *           data
   * @throws InvalidFormException thrown if incomplete or invalid search
   *           parameters are entered.
   * @throws InvalidParameterException thrown if an invalid order id is received
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidLoginException, UnauthorizedRequestException, SQLException,
      InvalidFormException, InvalidParameterException {

    RequestHandlerResponse response = null;
    String search_action = request.getParameter("search_action");
    String mode = request.getParameter("mode");

    if (TextConverter.isEmpty(mode)) {
      throw new InvalidParameterException("Invalid action requested");
    }

    // make sure user is logged in appropriately for search requested
    checkLogin(request, mode);

    if (search_action != null && search_action.equals("search")) {
      response = searchOrders(request, mode);

    } else if (search_action != null && search_action.equals("detail")) {

      response = getDetail(request, mode);

      // if no search action requested, show search form depending on mode
    } else {
      response = getSearchForm(request, mode);
    }

    return response;
  }

  /**
   * Determine which search form to forward user to based on mode param.
   * Populate data objects as needed for display on different search pages
   * 
   * @param request HttpServletRequest from OrderServlet
   * @param mode Type of search to execute
   * @return RequestHandlerResponse containing JSP URL to forward user to along
   *         with any objects needed for display on page
   * @throws SQLException if a database error occurs
   * @throws UnauthorizedRequestException if user does not have permissions for
   *           requested search
   * @throws InvalidLoginException if user is not logged in when they need to
   *           be.
   * @throws InvalidFormException if missing or invalid form data is submitted
   * @throws InvalidParameterException if an invalid id or serach mode is
   *           received
   * @throws UnauthorizedRequestException if user does not have permissions for
   *           requested search
   */
  private RequestHandlerResponse getSearchForm(HttpServletRequest request,
                                               String mode)
      throws SQLException, InvalidLoginException, InvalidFormException,
      InvalidParameterException, UnauthorizedRequestException {

    RequestHandlerResponse response = new RequestHandlerResponse();

    // curator main search page
    if (mode.equals("curator")) {
      response.setPage("/jsp/abrc/curator_search_orders.jsp");

      // user requesting to search their own order history
    } else if (mode.equals("user")) {
      getUserSearchForm(request, response);

      // pi requesting to search through lab orders
    } else if (mode.equals("pi")) {
      getPISearchForm(request, response);

      // if searching stock history for known stock number
    } else if (mode.equals("stock")) {
      if (TextConverter.isEmpty(request.getParameter("stock_numbers"))) {

        throw new InvalidFormException("No stock selected");
      }
      response.setPage("/jsp/abrc/search_stock_history.jsp");

      // if searching stock history for unknown stock number
    } else if (mode.equals("stock_number")) {
      response.setPage("/jsp/abrc/search_stock_history_number.jsp");

      // if searching as stock donor
    } else if (mode.equals("donor")) {
      getDonorSearchForm(request, response);

      // if searching as PI/contact person of donor lab
    } else if (mode.equals("donor_lab")) {
      getDonorLabSearchForm(request, response);

    } else {
      throw new InvalidParameterException("Invalid search mode: " + mode);
    }

    return response;
  }

  /**
   * Populates response with JSP URL that allows user to search for their own
   * stock orders. Creates a person record using community id in user's session
   * and stores in response for displaying person details on user form.
   * 
   * <p>
   * If user is a PI, first redirect to a page that allows them to choose
   * whether they want to search their personal orders, or orders placed by
   * members of the lab they are PI for
   * 
   * @param request Servlet request from OrderServlet
   * @param response RequestHandlerResponse to contain JSP URL of user search
   *          form and person object for display of person details
   * @throws SQLException if a database error occurs
   * @throws InvalidLoginException if user is not logged in
   */
  private void getUserSearchForm(HttpServletRequest request,
                                 RequestHandlerResponse response)
      throws SQLException, InvalidLoginException {

    BigInteger communityId = SessionHandler.getCommunityID(request);
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(communityId);
    response.setAttribute("person", person);

    // if user is pi for labs, give them a page that allows them to
    // choose whether they want to search their personal orders
    // (mode=user) or search all orders for their lab (mode=pi)
    //
    // pi_user_confirm parameter in request flags if pi has already seen
    // this page & chosen to search their own orders. If flag isn't
    // present in request, no choice made yet
    if (person.isPi()
        && TextConverter.isEmpty(request.getParameter("pi_user_confirm"))) {
      response.setPage("/jsp/abrc/order_search_choice.jsp");
    } else {
      response.setPage("/jsp/abrc/user_search_orders.jsp");
    }
  }

  /**
   * Redirects PI to search form that allows them to search order history of
   * selected lab. Lab to search order history for is determined by looking for
   * communityID, or organization_id in request. Organization record is created
   * and put into response for displaying organization details on search form.
   * 
   * @param request Servlet request from OrderServlet
   * @param response RequestHandlerResponse to contain URL of JSP to redirect to
   *          along with BsOrganization object for displaying organization
   *          details
   * @throws SQLException if a database error occurs
   * @throws InvalidFormException if no organization/community id specified in
   *           request
   * @throws InvalidParameterException if community id is not valid
   * @throws InvalidLoginException if user not logged in
   * @throws UnauthorizedRequestException if user not PI of requested
   *           organization and not a TAIR curator
   */
  private void getPISearchForm(HttpServletRequest request,
                               RequestHandlerResponse response)
      throws SQLException, InvalidFormException, InvalidParameterException,
      InvalidLoginException, UnauthorizedRequestException {

    // determine which organization to search records for by
    // looking for communityID or organization id in request
    BigInteger communityId = null;
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    BsOrganization organization = null;

    try {
      if (!TextConverter.isEmpty(request.getParameter("communityID"))) {
        communityId = new BigInteger(request.getParameter("communityID"));
        organization = delegate.getOrganizationByCommunityId(communityId);
      } else if (!TextConverter.isEmpty(request.getParameter("organization_id"))) {
        IPrimaryKey key =
          CommunityFactory.getOrganizationPrimaryKey(new BigInteger(request.getParameter("organization_id")));
        organization = delegate.getObject((SequencePrimaryKey)key);
        communityId = organization.getCommunityId();
      } else {
        throw new InvalidFormException("No organization selected");
      }

      // make sure requesting user is pi of org, or curator
      if (!LoginChecker.isPI(SessionHandler.getCommunityID(request), communityId)
          && !LoginChecker.isTairCurator(request)) {

        throw new UnauthorizedRequestException("Not authorized for "
                                               + "this resource");
      }

      response.setAttribute("organization", organization);
      response.setPage("/jsp/abrc/pi_search_orders.jsp");
    } catch (NumberFormatException nfe) {
      throw new InvalidParameterException("Invalid community or "
                                          + "organization id: "
                                          + nfe.getMessage());
    }
  }

  /**
   * Populates response with JSP URL to allow stock donor persons to search
   * order history of stocks they have donated. ListCommunity object is created
   * and set in response for displaying person info. on search page
   * 
   * @param request Servlet request from OrderServlet
   * @param response RequestHandlerResponse to contain URL of donor search form
   *          and ListCommunity object for displaying person details
   * @throws InvalidLoginException if user is not logged in
   * @throws SQLException if a a database error occurs
   */
  private void getDonorSearchForm(HttpServletRequest request,
                                  RequestHandlerResponse response)
      throws SQLException, InvalidLoginException, UnauthorizedRequestException {

    DBReadManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      ListCommunity listPerson =
        new ListCommunity(SessionHandler.getCommunityID(request));

      response.setAttribute("person", listPerson);
      response.setPage("/jsp/abrc/search_donor_history.jsp");

    } finally {
      DBReadManager.return_connection(conn);
    }
  }

  /**
   * Populates response with URL of search form that allows PI or contact person
   * of donor labs to search order history of donated stocks. ListCommunity
   * objects are created for each lab user is PI/contact person for and set in
   * response to allow user to select which lab's stock collection to search
   * 
   * @param request Servlet request from OrderServlet
   * @param response RequestHandlerResponse to contain URL of search form along
   *          with ListCommunity objects for donor labs user is PI or contact
   *          person for
   * @throws SQLException if a database error occurs
   */
  private void getDonorLabSearchForm(HttpServletRequest request,
                                     RequestHandlerResponse response)
      throws SQLException, UnauthorizedRequestException {

    DBReadManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      // retrieve donor lab community ids from session and create objects
      // for displaying each donor lab's info. on search page
      Long[] donorIDs = SessionHandler.getDonorLabIDs(request);
      ListCommunity[] donorLabs = new ListCommunity[donorIDs.length];
      for (int i = 0; i < donorLabs.length; i++) {
        BigInteger id = new BigInteger(donorIDs[i].toString());
        donorLabs[i] = new ListCommunity(id, false);
      }

      response.setAttribute("donorLabs", donorLabs);
      response.setPage("/jsp/abrc/search_donor_lab_history.jsp");

    } finally {
      DBReadManager.return_connection(conn);
    }
  }

  /**
   * Retrieves validated search parameters from OrderFormValidator and passes
   * off to OrderSearcher for searching. If results are found, redirect user to
   * appropriate results page based on mode
   */
  @SuppressWarnings("unchecked")
  private RequestHandlerResponse searchOrders(HttpServletRequest request,
                                              String mode) throws SQLException,
      InvalidFormException, InvalidParameterException {

    DBconnection conn = null;
    DBReadManager connectionPool = null;
    SearchResultsCollection searchCollection = null;

    // retrieve search parameters from request
    Map searchParams =
      OrderFormValidator.validateOrderSearchInfo(request, mode);

    // get params for scrolling through result set ( if multiple pages of
    // results )
    ScrollParams scrollParams = ScrollCalculator.getScrollParams(request);

    //
    // OrderSearcher can return results as a list of orders only, a list
    // of orders that each contain lists of all stocks in order, or
    // as statistics that show how many distinct orders and stocks
    // are in search subset. Use combination of search mode and
    // "results_format" request parameter to determine resultsType value
    // to pass to OrderSearcher
    // 
    String resultsType = null;
    if (mode.equals("stock") || mode.equals("stock_number")) {
      resultsType = "order";

    } else {
      String resultsFormat = request.getParameter("results_format");
      if (resultsFormat != null && resultsFormat.equals("statistics")) {

        resultsType = "statistics";
      } else {
        resultsType = "stock";
      }
    }

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      searchCollection =
        OrderSearcher.search(conn, searchParams, scrollParams, resultsType);
    } finally {
      DBReadManager.return_connection(conn);
    }

    // populate response w/results page to forward to based on
    // mode and resultsType; create scrolling links for scrolling
    // through multiple pages of results if needed
    return createSearchResponse(searchCollection,
                                searchParams,
                                scrollParams,
                                mode,
                                resultsType);
  }

  /**
   * Utility method to create and populate RequestHandlerResponse with JSP URL
   * to redirect user to. If search had no results, user will see no results
   * page with mode specific link back to search form to continue searching. If
   * search produced results, response will contain URL of mode specific JSP to
   * redirect to along with scroll links for scrolling through multiple pages of
   * results
   * 
   * <p>
   * Since some searches can be done to return statistics only, use resultsType
   * param to determine whether results page should be the statistics page for
   * that search mode, or the detailed search results page
   * 
   * @param searchCollection Results of search
   * @param searchParams Submitted search params
   * @param scrollParams Scrolling params
   * @param mode Search type executed
   * @param resultsType Defines format of results (orders, stocks or statistics)
   * @return RequestHandlerResponse with JSP to redirect user to and any other
   *         elements needed for display
   */
  @SuppressWarnings("unchecked")
  private RequestHandlerResponse createSearchResponse(
                                                      SearchResultsCollection searchCollection,
                                                      Map searchParams,
                                                      ScrollParams scrollParams,
                                                      String mode,
                                                      String resultsType)
      throws InvalidParameterException {

    RequestHandlerResponse response = new RequestHandlerResponse();

    // Set searchPage attribute for returning user back to correct
    // search form. Include extra "modeParam" to include mode specific
    // params as needed

    String searchPage =
      "Order?state=search&mode=" + mode + getModeParam(mode, searchParams);

    response.setAttribute("searchPage", searchPage);

    // if no results found, forward to no results page.
    if (searchCollection == null || searchCollection.isEmpty()) {
      response.setPage("/jsp/common/no_results.jsp");

      // else, if results found, get links to scroll through multiple
      // pages of results and set page for displaying mode specific
      // search results
    } else {

      // add to search params for inclusion in scroll links
      searchParams.put("search_action", "search");
      searchParams.put("state", "search");
      searchCollection.setScrollLinks(ScrollCalculator.getScrollLinks(scrollParams.getSize(),
                                                                      scrollParams.getPage(),
                                                                      searchParams,
                                                                      searchCollection,
                                                                      "Order"));

      response.setAttribute("searchCollection", searchCollection);

      if (mode.equals("curator")) {

        // add search scrolling params to search string for
        // passing forward to "updated" page and easy return to results
        searchParams.put("size", String.valueOf(scrollParams.getSize()));

        searchParams.put("pageNum", String.valueOf(scrollParams.getPage()));

        String search_string =
          HTMLFactory.mapToString(searchParams, "&", "=", true);

        response.setAttribute("search_string", search_string);
      }

      // set results page to redirect to based on mode and resultsType
      response.setPage(getResultsPage(mode, resultsType));
    }

    return response;
  }

  /**
   * Utility method to get URL of JSP for displaying results of an order search
   * according to submitted search mode and format results were returned in.
   * 
   * @param mode Search type being executed
   * @param resultsType Format results of search were returned in (orders,
   *          stocks or statistics)
   * @return JSP URL to redirect user to for displaying search results
   * @throws InvalidParameterException if invalid value of mode received
   */
  private String getResultsPage(String mode, String resultsType)
      throws InvalidParameterException {

    String resultsPage = null;

    // for now, all statistics pages use the same JSP -- keep
    // logic w/in this method for easy changing if necessary
    if (resultsType.equals("statistics")) {
      resultsPage = "/jsp/abrc/order_statistics_results.jsp";

      // else determine results page for search mode
    } else {

      if (mode.equals("curator")) {
        resultsPage = "/jsp/abrc/curator_order_results.jsp";

      } else if (mode.equals("user")) {
        resultsPage = "/jsp/abrc/user_order_results.jsp";

      } else if (mode.equals("pi")) {
        resultsPage = "/jsp/abrc/pi_order_results.jsp";

      } else if (mode.equals("stock")) {
        resultsPage = "/jsp/abrc/stock_history_results.jsp";

      } else if (mode.equals("stock_number")) {
        resultsPage = "/jsp/abrc/stock_history_number_results.jsp";

      } else if (mode.equals("donor")) {
        resultsPage = "/jsp/abrc/donor_history_results.jsp";

      } else if (mode.equals("donor_lab")) {
        resultsPage = "/jsp/abrc/donor_lab_history_results.jsp";

      } else {
        throw new InvalidParameterException("Invalid search mode: " + mode);
      }
    }

    return resultsPage;
  }

  /**
   * Utility method to determine mode specific querystring parameters that
   * should be included in scroll links and other links used on display page to
   * continue seamlessly with search progression. If submitted mode does not
   * require any mode specific parameters, an empty string will be returned.
   * 
   * @param mode Search type being executed
   * @param searchParams Validated search params submitted for search. Depending
   *          on value of mode, some search params will be included in returned
   *          modeParam
   */
  @SuppressWarnings("unchecked")
  private String getModeParam(String mode, Map searchParams) {
    String modeParam = null;

    // for user searches, include person id of user
    if (mode.equals("user")) {
      modeParam = "&person_id=" + searchParams.get("person_id");

      // for pi searches, include organization id of selected lab
    } else if (mode.equals("pi")) {
      modeParam = "&organization_id=" + searchParams.get("organization_id");

      // stock_numbers array will only have one element -
      // stock number we just searched for
    } else if (mode.equals("stock")) {
      modeParam =
        "&stock_numbers=" + ((String[])searchParams.get("stock_numbers"))[0];

    } else {
      modeParam = "";
    }

    return modeParam;
  }

  /**
   * Retrieve one or more detail objects for display
   */
  @SuppressWarnings("unchecked")
  private RequestHandlerResponse getDetail(HttpServletRequest request,
                                           String mode)
      throws InvalidParameterException, SQLException, InvalidFormException,
      InvalidLoginException, UnauthorizedRequestException {

    if (TextConverter.isEmpty(request.getParameter("orders_id"))) {
      throw new InvalidFormException("No orders selected");
    }

    Long[] orderIDs = null;
    try {
      orderIDs =
        TextConverter.stringToLongArray(request.getParameterValues("orders_id"));

    } catch (NumberFormatException nfe) {
      throw new InvalidParameterException("Invalid order number: "
                                          + nfe.getMessage());
    }

    Vector orderVector = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;
    try {
      if (orderIDs != null && orderIDs.length > 0) {
        orderVector = new Vector();
        BigInteger communityID = SessionHandler.getCommunityID(request);

        connectionPool = DBReadManager.getInstance();
        conn = connectionPool.get_connection();

        CompositeOrder order = null;

        for (int i = 0; i < orderIDs.length; i++) {
          order = new CompositeOrder(conn, orderIDs[i]);

          // make sure user has permission to see detail of this order
          if (LoginChecker.isTairCurator(request)
              || LoginChecker.hasOrderPermissions(communityID, order)) {

            orderVector.addElement(order);
          } else {
            throw new UnauthorizedRequestException("Not authorized "
                                                   + "to view "
                                                   + "this resource");
          }
        }
      }

    } finally {
      DBReadManager.return_connection(conn);
    }

    RequestHandlerResponse response = new RequestHandlerResponse();
    if (orderVector != null && !orderVector.isEmpty()) {
      response.setAttribute("orderVector", orderVector);
    }

    if (mode.equals("curator")) {
      response.setPage("/jsp/abrc/curator_order_detail.jsp");
    } else if (mode.equals("user") || mode.equals("pi")) {
      response.setPage("/jsp/abrc/user_order_detail.jsp");
    }

    return response;
  }

  /**
   * Utility method to ensure user is logged in and has permission level
   * necessary to perform requested search. Some authorization checks are
   * duplicated, but isolate as many here as possible.
   */
  private void checkLogin(HttpServletRequest request, String mode)
      throws InvalidLoginException, UnauthorizedRequestException {

    // check login first for all searches that require it
    if ((mode.equals("curator") || mode.equals("user") || mode.equals("pi")
         || mode.equals("donor") || mode.equals("donor_lab"))
        && !LoginChecker.isLoggedIn(request)) {
      throw new InvalidLoginException("User not logged in");
    }

    // make sure user has permission levels for curator,
    // donor and donor lab searches
    if (mode.equals("curator") && !LoginChecker.isTairCurator(request)) {
      throw new UnauthorizedRequestException("Not authorized for "
                                             + "this resource");

    } else if (mode.equals("donor") && !LoginChecker.isDonor(request)) {
      throw new UnauthorizedRequestException("Not authorized for "
                                             + "this resource");

    } else if (mode.equals("donor_lab") && !LoginChecker.hasDonorLab(request)) {
      throw new UnauthorizedRequestException("Not authorized for "
                                             + "this resource");
    }

  }

}
