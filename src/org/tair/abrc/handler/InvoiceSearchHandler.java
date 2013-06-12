// Copyright 2011 Carnegie Institution for Science. All rights reserved.

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceSearchResult;
import org.tair.abrc.payment.InvoiceSearchResultsManager;
import org.tair.abrc.payment.InvoiceSearcher;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.community.LoginChecker;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.ISearchResultsManager;
import org.tair.search.SearchResultPageDecorator;
import org.tair.search.SearchResultsSortDecorator;
import org.tair.search.SearchSession;
import org.tair.utilities.DateWebFormField;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * A Command pattern class that sets up and executes any of the invoice-related
 * search actions. The <code>InvoiceSearcher</code> performs the search. This is
 * an abstract parent superclass that contains shared data members and code, the
 * InvoiceHandlerFactory instantiates the appropriate concrete subclass given
 * the HTTP request.
 * 
 * @see InvoiceSearcher
 * @see InvoiceHandlerFactory
 */

public abstract class InvoiceSearchHandler implements RequestHandler {
  // JSP URIs
  protected static final String SUMMARY =
    "/jsp/abrc/payment/curator_invoice_summary.jsp";
  protected static final String USER_SUMMARY =
    "/jsp/abrc/payment/user_invoice_summary.jsp";

  /** search criteria string to tell user what search did */
  protected String searchCriteria;

  /** a map of parameter values from the form post */
  protected Map<String, Object> params = new HashMap<String, Object>();

  // parameters from JSP that set up search; see params map for search
  // parameters

  /** the selected search function to perform, see the process method */
  private String selectFunction;
  /** the type of search */
  protected String type;
  /** curator mode or user mode */
  private String mode;
  /** the logged-in person making the request */
  protected BsPerson person;

  /** unique id for the order being invoiced */
  protected Long ordersId;
  /** whether the searcher is a pi */
  protected boolean pi = false;
  /** searcher is a curator */
  protected boolean curator = false;
  /** searcher is a contact person */
  protected boolean contact = false;

  /** unique id (hashcode) for the search query */
  protected String queryId;
  /** number of rows updated by user */
  protected int updatedRows;
  /** page number of results to display */
  protected Integer pageNum;
  /** page size */
  protected Integer size;
  /** page sort column */
  protected String sortColumn;
  /** id parameters from form table of invoices */
  protected Long[] formIds;
  List<Long> ids = new ArrayList<Long>();

  /**
   * <p>
   * Retrieves invoice data based on a "search_action" parameter found in
   * <code>HttpServletRequest</code>. Possible values for search action are:
   * </p>
   * <ul>
   * <li>search: user search or general search</li>
   * <li>choose_search: redirects PI or contact person to choice page to choose
   * personal or lab invoice search</li>
   * <li>do_search: user invoice search from Welcome page (unpaid invoices
   * link), PI search page (lab search), and user search page (person search)</li>
   * <li>labsearch: redirects to lab search page from search choice page</li>
   * <li>userdetail: user invoice detail</li>
   * <li>re_search: rerun the search</li>
   * <li>new_payment: process a new payment from selected items</li>
   * <li>detail: curator invoice detail</li>
   * <li>userdetail: user invoice detail by curator</li>
   * <li>userdetailform: redirects to user detail form</li>
   * <li>payment: process a payment</li>
   * <li>re_sort: sort result set</li>
   * <li>selectFunction: perform an action on selected invoices</li>
   * </ul>
   * <p>
   * Possible values for the select function are:
   * </p>
   * <ul>
   * <li>process: process selected invoices</li>
   * <li>download: download selected invoices</li>
   * <li>downloadlineitems: download line items for selected invoices</li>
   * <li>sendpastdue: send email for past-due invoices</li>
   * <li>set_paid_in_full: set selected invoices to paid-in-full status</li>
   * <li>set_in_progress: set selected invoices to in-progress status</li>
   * <li>set_cancelled: set selected invoices to canceled status</li>
   * <li></li>
   * <li></li>
   * <li></li>
   * <li></li>
   * <li></li>
   * </ul>
   * 
   * If search_action is null, user will be re-directed to search form to input
   * search parameters.
   * 
   * @param request HttpServletRequest forwarded from OrderServlet
   * @return RequestHandlerResponse containing URL of page to redirect to and
   *         any objects to add to request for viewing
   * @throws SQLException thrown if a database error occurs
   * @throws InvalidFormException thrown if incomplete or invalid form data is
   *           received
   * @throws InvalidLoginException thrown if user is not logged in
   * @throws UnauthorizedRequestException thrown if user is not curator
   * @throws InvalideParameterException thrown if an invalid id is received
   */
  abstract public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException;

  /**
   * Extract the HTTP request parameters into the corresponding data members.
   * 
   * @param request the HTTP servlet request containing the parameters
   * @throws InvalidLoginException when the user is not logged in properly
   * @throws SQLException when there is a problem querying login information
   * @throws InvalidParameterException when there is no action specified
   * @throws SessionOutOfTimeException when a download can't find previous page
   *           ids
   * @throws InvalidFormException when a form parameter has a validation issue
   */
  protected void extractParameters(HttpServletRequest request)
      throws SQLException, InvalidLoginException, InvalidParameterException,
      SessionOutOfTimeException, InvalidFormException {
    // Set up the parameter map. These are the search parameters.
    setParams(request);

    // Get the search mode, defaulting to curator search.
    if (request.getParameter("mode") != null) {
      mode = request.getParameter("mode");
    } else {
      mode = "curator";
    }

    // Set up the default search criteria string using the parameter map.
    setSearchCriteria();

    // Get the search mode, action, select function, and ids.
    getAuthorizationFlags(request);

    // Get the search results query id
    queryId = request.getParameter("query_id");

    // Get the various special settings for different functions.
    getResultsSettings(request);
    getSelectedInvoiceIds(request);
    getOrdersId(request);

    // Get the logged-in person object.
    person = getPersonFromSession(request);
  }

  /**
   * Get the orders id for the invoice.
   * 
   * @param request the HTTP request containing the orders id parameter
   */
  private void getOrdersId(HttpServletRequest request) {
    // Get the orders id.
    if (!TextConverter.isEmpty(request.getParameter("orders_id"))) {
      ordersId = new Long(request.getParameter("orders_id"));
    } else {
      ordersId = null;
    }
  }

  /**
   * Get the full set of invoice ids for a download, download-items, or
   * send-past-due search. This combines last-page and current-page ids.
   * 
   * @param request the HTTP request containing the parameters
   * @throws SessionOutOfTimeException when there is no search in progress for
   *           the appropriate select functions
   */
  private void getSelectedInvoiceIds(HttpServletRequest request)
      throws SessionOutOfTimeException {
    SearchSession searchSession = SessionHandler.getSearchSession(request);
    formIds = TextConverter.stringToLongArray(request.getParameterValues("id"));

    // For a download or past-due sending, get the ids from the previous page.
    if (selectFunction != null
        && (selectFunction.equals("download")
            || selectFunction.equals("downloadItems") || selectFunction.equals("sendpastdue"))) {
      // get previous pages ids
      if (searchSession != null && queryId != null) {
        ids = searchSession.getDownload(type);
        if (ids == null) {
          // need to reestablish the list.
          ids = new ArrayList<Long>();
        }
      } else {
        // There must be a search in progress for a download.
        throw new SessionOutOfTimeException("No search in progress for download: "
                                            + type);
      }
    }

    // Add current-page invoice ids to list.
    if (ids != null && formIds != null && formIds.length > 0) {
      for (int i = 0; i < formIds.length; i++) {
        ids.add(new Long(formIds[i]));
      }
    }
  }

  /**
   * Get the page number, page size, and sort column for the search results.
   * 
   * @param request the HTTP request containing the parameters
   */
  private void getResultsSettings(HttpServletRequest request) {
    // Get the results page number and size. Default to 1 and 50, respectively.
    String pageNumString = request.getParameter("pageNum");
    pageNum =
      pageNumString != null ? new Integer(pageNumString) : new Integer("1");
    String sizeString = request.getParameter("size");
    size = sizeString != null ? new Integer(sizeString) : new Integer("50");
    sortColumn = request.getParameter("sortColumn");
  }

  /**
   * Get the various community member ids and settings for the search. If there
   * is no community id in the request, this is a personal search that doesn't
   * require any flags set other than the TAIR curator flag.
   * <ul>
   * <li>organization community id</li>
   * <li>organization id</li>
   * <li>login community id</li>
   * <li>PI flag (is this a PI search?)</li>
   * <li>curator flag</li>
   * <li>contact person flag</li>
   * </ul>
   * 
   * @param request the HTTP request containing the parameters
   * @throws InvalidLoginException
   * @throws SQLException
   */
  private void getAuthorizationFlags(HttpServletRequest request)
      throws InvalidLoginException, SQLException {
    String id = request.getParameter("communityID");
    if (id != null && id.length() > 0) {
      BigInteger organizationCommunityId = new BigInteger(id);
      BigInteger loginCommunityId = SessionHandler.getCommunityID(request);

      // Get the authorization parameters.
      pi = LoginChecker.isPI(loginCommunityId, organizationCommunityId);
      contact =
        LoginChecker.isContactPerson(loginCommunityId, organizationCommunityId);
    } else {
      pi = false;
      contact = false;
    }
    curator = LoginChecker.isTairCurator(request);
  }

  /**
   * Get the person from the current user session by getting the community id
   * from the session and querying the person object using that id.
   * 
   * @param request the HTTP request containing the session
   * @return the person
   * @throws InvalidLoginException when the person is not available due to a
   *           login issue
   */
  private BsPerson getPersonFromSession(HttpServletRequest request)
      throws InvalidLoginException {
    // Get the login community id and the corresponding person.
    BigInteger loginCommunityId = SessionHandler.getCommunityID(request);
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    BsPerson person = delegate.getPersonByCommunityId(loginCommunityId);
    return person;
  }

  /**
   * Set search criteria, do an invoice search, then set up a standard response.
   * Call this shared method after setting up the parameters for a standard
   * invoice search, including the query id (hash of the SQL statement).
   * 
   * @param session the current search session
   * @param invoiceSearcher the invoice searcher with results
   * @param page the URI of the page to which to forward/redirect
   * @return the request handler response
   * @throws SQLException when there is a problem doing the search
   */
  protected RequestHandlerResponse search(SearchSession session,
                                          InvoiceSearcher invoiceSearcher,
                                          String page) throws SQLException {
    String query = invoiceSearcher.createSearchSQL();
    type = query;
    session.setSearchCriteria(type, params);
    Map<Long, InvoiceSearchResult> results = invoiceSearcher.search(query);
    session.setInvoiceResultsManager(queryId, getResultsManager(results));

    RequestHandlerResponse response = new RequestHandlerResponse();

    response.setAttribute("pageNum", new Integer(1));
    response.setAttribute("size", size);
    response.setAttribute("searchCriteria", searchCriteria);
    response.setAttribute("query_id", queryId);

    response.setPage(page);

    return response;
  }

  /**
   * Get a search results manager based on the response attributes (page/size,
   * sort column) and the map of search results.
   * 
   * @param results the map of search results
   * 
   * @return the manager suitably decorated
   */
  protected ISearchResultsManager<InvoiceSearchResult, Long> getResultsManager(Map<Long, InvoiceSearchResult> results) {
    ISearchResultsManager<InvoiceSearchResult, Long> manager = null;
    manager = new InvoiceSearchResultsManager(results);
    // Add sort by column before pagination.
    if (sortColumn != null) {
      InvoiceSearchResult.Sort sort =
        InvoiceSearchResult.Sort.fromString(sortColumn);
      manager =
        new SearchResultsSortDecorator<InvoiceSearchResult, Long>(manager,
                                                                  sort.getComparator());
    }
    // Add pagination if required.
    if (pageNum != null && size != null) {
      manager =
        new SearchResultPageDecorator<InvoiceSearchResult, Long>(manager,
                                                                 size,
                                                                 pageNum);
    }
    return manager;
  }

  /**
   * Set the parameter map from the search session search criteria for the
   * current type of search. This enables paging through the result set.
   * 
   * @param session the session from which to get parameters
   * 
   * @throws SessionOutOfTimeException when no search of the current type is in
   *           progress
   */
  protected void getParamsFromSearchSession(SearchSession session)
      throws SessionOutOfTimeException {
    if (session != null) {
      // If type not yet set, get it from the session using queryId.
      if (type == null && queryId != null) {
        type = session.getSearchTypeFromId(new Integer(queryId));
      }
      // Use the type/query to get the search parameters from the session.
      if (session.searchInProgress(type)) {
        params = session.getSearchCriteria(type);
      }
    } else {
      throw new SessionOutOfTimeException("No search in progress: " + type);
    }
  }

  /**
   * Creates a text string describing the search for display to the user from
   * the settings in the parameter map.
   */
  private void setSearchCriteria() {
    StringBuilder criteria;
    String sep = ""; // no comma initially

    // Extract parameters into variables for code clarity.
    String invoiceType = (String)params.get("invoice_type");
    String userInvoiceStatus = (String)params.get("user_invoice_status");
    String invoiceStatus = (String)params.get("invoice_status");
    Integer invoiceIdFrom = (Integer)params.get("invoice_id_from");
    Integer invoiceIdTo = (Integer)params.get("invoice_id_to");
    Date dateInvoiceCreatedFrom = (Date)params.get("date_invoice_created_from");
    Date dateInvoiceCreatedTo = (Date)params.get("date_invoice_created_to");
    Date dateNotifiedFrom = (Date)params.get("notified_date_from");
    Date dateNotifiedTo = (Date)params.get("notified_date_to");
    String noNotifiedDate = (String)params.get("no_notified_date");
    Date dateUpdatedFrom = (Date)params.get("updated_date_from");
    Date dateUpdatedTo = (Date)params.get("updated_date_to");
    Date dateShippedFrom = (Date)params.get("shipped_date_from");
    Date dateShippedTo = (Date)params.get("shipped_date_to");
    Integer orderNumber = (Integer)params.get("order_number");
    String lineItemType = (String)params.get("line_item_type");
    Integer labId = (Integer)params.get("lab_id");

    if (mode.equals("user")) {
      criteria =
        new StringBuilder("Your query for invoices placed by you where ");
    } else {
      // curator mode, queries any set of invoices
      criteria = new StringBuilder("Your query for invoices where ");
    }

    if (invoiceType != null) {
      criteria.append(sep);
      criteria.append(" invoice type is ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(invoiceType);
      criteria.append("</font>");
      sep = ",";
    }

    // user invoice status and invoice status are mutually exclusive.
    if (userInvoiceStatus != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" invoice status is ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.uscoreToSpace(userInvoiceStatus));
      criteria.append("</font>");
    } else if (invoiceStatus != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" invoice status is ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.uscoreToSpace(invoiceStatus));
      criteria.append("</font>");
    }

    // date invoice created from only
    if (dateInvoiceCreatedFrom != null && dateInvoiceCreatedTo == null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" invoice date equal to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateInvoiceCreatedFrom));
      criteria.append("</font>");
    }

    // both date invoice created from and to
    if (dateInvoiceCreatedFrom != null && dateInvoiceCreatedTo != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" invoice date is from ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateInvoiceCreatedFrom));
      criteria.append("</font>");
      criteria.append(" to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateInvoiceCreatedTo));
      criteria.append("</font>");
    }

    // order number
    if (orderNumber != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" order number is equal to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(orderNumber);
      criteria.append("</font>");
    }

    // invoice id from only
    if (invoiceIdFrom != null && invoiceIdTo == null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" invoice number is equal to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(invoiceIdFrom);
      criteria.append("</font>");
    }

    // both invoice id from and to
    if ((Integer)params.get("invoice_id_from") != null && invoiceIdTo != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" invoice number is from ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(invoiceIdFrom);
      criteria.append("</font>");
      criteria.append(" to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(invoiceIdTo);
      criteria.append("</font>");

    }

    // line item type
    if (lineItemType != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" unpaid line item type is ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(lineItemType);
      criteria.append("</font>");
    }

    // lab id
    if (labId != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" lab id is ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(labId);
      criteria.append("</font>");
    }

    // notified date from only
    if (dateNotifiedFrom != null && dateNotifiedTo == null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" last notified date equal to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateNotifiedFrom));
      criteria.append("</font>");
    }

    // both notified date from and to
    if (dateNotifiedFrom != null && dateNotifiedTo != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" last notified date is from ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateNotifiedFrom));
      criteria.append("</font>");
      criteria.append(" to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateNotifiedTo));
      criteria.append("</font>");
    }

    // handles if the user accepts the default value of 'no' for the 'Display
    // Last Notify Date'
    // check box
    if (noNotifiedDate != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" last notified date is ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(noNotifiedDate);
      criteria.append("</font>");
    }

    // updated date from only
    if (dateUpdatedFrom != null && dateUpdatedTo == null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" last updated date equal to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateUpdatedFrom));
      criteria.append("</font>");
    }

    // both updated date from and updated date to
    if (dateUpdatedFrom != null && dateUpdatedTo != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" last updated date is from ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateUpdatedFrom));
      criteria.append("</font>");
      criteria.append(" to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateUpdatedTo));
      criteria.append("</font>");
    }

    // shipped date from only
    if (dateShippedFrom != null && dateShippedTo == null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" last shipped date equal to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateShippedFrom));
      criteria.append("</font>");
    }

    // both shipped date from and to
    if (dateShippedFrom != null && dateShippedTo != null) {
      criteria.append(sep);
      sep = ",";
      criteria.append(" last shipped date is from ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateShippedFrom));
      criteria.append("</font>");
      criteria.append(" to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString(dateShippedTo));
      criteria.append("</font>");
    }

    criteria.append(" resulted in ");
    searchCriteria = criteria.toString();
  }

  /**
   * Adds a specified string onto the current search criteria string.
   * 
   * @param addOn the string to add
   */
  protected void setSearchCriteria(String addOn) {
    StringBuilder criteriaPlus = new StringBuilder("");
    setSearchCriteria();
    if (addOn != null) {
      criteriaPlus.append(addOn);
    }
    criteriaPlus.append(searchCriteria);
    searchCriteria = criteriaPlus.toString();
  }

  /**
   * Set the query id based on the SQL statement that a specified searcher
   * generates. Put the query id into the search parameters.
   * 
   * @param searcher the invoice searcher
   */
  protected void setQueryId(InvoiceSearcher searcher) {
    String sql = searcher.createSearchSQL();
    queryId = new Integer(sql.hashCode()).toString();
    params.put("query_id", queryId);
  }

  /**
   * Build an internal map of the parameters, extracting the known parameters
   * from the JSP HTTP request posted to the servlet. The map serves as a fast
   * data transfer object that gives access to the parameter values elsewhere in
   * the handler.
   * 
   * @param request the HTTP request containing the parameters
   * 
   * @throws InvalidFormException when there is a form field validation problem;
   *           contains a map of error messages keyed on an error name
   */
  private void setParams(HttpServletRequest request)
      throws InvalidFormException {
    // Create an error map for unified error reporting.
    HashMap<String, String> errors = new HashMap<String, String>();

    try {
      setStringParameter(request, "invoice_type");

      // User invoice status differs from invoice status because during a user
      // search, paid means both paid in full and amount-due $0, unpaid is both
      // "in progress" and all items notified and amount > $0.
      setStringParameter(request, "user_invoice_status");

      // Overall invoice status does not restrict status.
      setStringParameter(request, "invoice_status");

      setStringParameter(request, "no_notified_date");
      setStringParameter(request, "order_number");

      String error = "Invoice created date";
      setDateParameter(request, "date_invoice_created_from", errors, error);
      setToDateParameter(request, "date_invoice_created_to", errors, error);
      error = "Notified date";
      setDateParameter(request, "notified_date_from", errors, error);
      setToDateParameter(request, "notified_date_to", errors, error);
      error = "Updated date";
      setDateParameter(request, "updated_date_from", errors, error);
      setToDateParameter(request, "updated_date_to", errors, error);
      error = "Shipped date";
      setDateParameter(request, "shipped_date_from", errors, error);
      setToDateParameter(request, "shipped_date_to", errors, error);

      // transform to int
      setIntegerParameter(request, "order_number", errors);
      setIntegerParameter(request, "person_id", errors);
      setIntegerParameter(request, "invoice_id_from", errors);
      setIntegerParameter(request, "invoice_id", errors);
      setIntegerParameter(request, "invoice_id_to", errors);
      setIntegerParameter(request, "lab_id", errors);

      setStringParameter(request, "line_item_type");
      setStringParameter(request, "method");
      setStringParameter(request, "reference");
      setStringParameter(request, "id_list");
      setStringParameter(request, "name_on_check");
      setStringParameter(request, "check_number");
      setDateParameter(request, "check_date", errors, error);
    } finally {

      if (errors != null && !errors.isEmpty()) {
        throw new InvalidFormException(errors, "Errors on form submission");
      }
    }
  }

  /**
   * If a string parameter is present in the request, extract it and put it into
   * the parameter map.
   * 
   * @param request the HTTP request
   * @param name the parameter name
   */
  private void setStringParameter(HttpServletRequest request, String name) {
    if (!TextConverter.isEmpty(request.getParameter(name))) {
      params.put(name, request.getParameter(name));
    }
  }

  /**
   * Set an Integer parameter into the parameter map from a request parameter,
   * translating the text parameter to an Integer. Report any validation errors
   * in the error map.
   * 
   * @param request the HTTP request containing the parameter
   * @param parameterName the parameter name of the Integer parameter
   * @param errors the error map
   */
  private void setIntegerParameter(HttpServletRequest request,
                                   String parameterName,
                                   HashMap<String, String> errors) {
    try {
      if (!TextConverter.isEmpty(request.getParameter(parameterName))) {
        Integer value = new Integer(request.getParameter(parameterName));
        params.put(parameterName, value);
      }
    } catch (NumberFormatException nfe) {
      errors.put(parameterName, "Invalid " + parameterName + " value entered: "
                                + nfe.getMessage());
    }
  }

  /**
   * Set a parameter map parameter with a Java Date value translated from a
   * formatted string in an HTTP request list of parameters. The parameter is
   * the "to" part of a date range. Set the time of day for the date-to field to
   * the last second of the day, so that the search includes all the invoices
   * for that date. Put any errors into the error map.
   * 
   * @param request the HTTP request containing the to-date parameter value
   * @param parameterName the name of the parameter
   * @param errors the error map
   * @param error the error to put into the map
   */
  private void setToDateParameter(HttpServletRequest request,
                                  String parameterName,
                                  HashMap<String, String> errors, String error) {
    try {
      if (!TextConverter.isEmpty(request.getParameter(parameterName))) {
        DateWebFormField formToDate =
          new DateWebFormField(parameterName, false);
        GregorianCalendar dateUpdater = new GregorianCalendar();
        Date toDate = (Date)formToDate.validate(request);
        dateUpdater.setTime(toDate);
        dateUpdater.set(Calendar.HOUR_OF_DAY, 23);
        dateUpdater.set(Calendar.MINUTE, 59);
        dateUpdater.set(Calendar.SECOND, 59);
        toDate = dateUpdater.getTime();
        params.put(parameterName, toDate);
      } else {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.set(Calendar.HOUR_OF_DAY, 23);
        c.set(Calendar.MINUTE, 59);
        c.set(Calendar.SECOND, 59);
        params.put("parameterName", c.getTime());
      }
    } catch (InvalidParameterException ipe) {
      errors.put(error, ipe.getMessage());
    }
  }

  /**
   * Set a date parameter in the parameter map, validating the text date and
   * translating it into a Java date. Put any errors into the error map.
   * 
   * @param request the HTTP request containing the date parameter
   * @param parameterName the name of the parameter that contains the date
   * @param errors the error map
   * @param error the error to put into the map
   */
  private void setDateParameter(HttpServletRequest request,
                                String parameterName,
                                HashMap<String, String> errors, String error) {
    // Validate the date format and translate to a Java Date.
    try {
      if (!TextConverter.isEmpty(request.getParameter(parameterName))) {
        DateWebFormField formField = new DateWebFormField(parameterName, false);
        java.util.Date fromDate = (java.util.Date)formField.validate(request);
        params.put(parameterName, fromDate);
      }
    } catch (InvalidParameterException ipe) {
      errors.put(error, ipe.getMessage());
    }
  }
}
