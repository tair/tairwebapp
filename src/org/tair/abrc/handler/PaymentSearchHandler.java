// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.15 $
// $Date: 2006/02/10 20:44:59 $
// ------------------------------------------------------------------------------

package org.tair.abrc.handler;


import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.PaymentSearchResult;
import org.tair.abrc.payment.PaymentSearcher;
import org.tair.community.LoginChecker;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.SearchSession;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DateWebFormField;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ResultsFetcher;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.Utils;


/**
 * PaymentSearchHandler handles all requests to search and view payments and
 * payment details for a specific date. PaymentSearchHandler distributes request
 * to different methods based on parameters received. Searches for payments are
 * done by <code>PaymentSearcher</code>
 * 
 * @see PaymentSearcher
 */

public class PaymentSearchHandler implements RequestHandler {
  private String downloadJsp = "/jsp/abrc/abrc_download.jsp";
  private String formJsp = "/jsp/abrc/payment/curator_payment_form.jsp";
  private String summaryJsp = "/jsp/abrc/payment/curator_payment_summary.jsp";
  private String searchCriteria;
  private String resultsMsg;
  private String type;
  private String queryID;
  private String downloadText;
  private int updatedRows;
  private SearchSession searchSession;
  private Map params = new HashMap();
  private HttpServletRequest request;
  private RequestHandlerResponse response;
  SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

  /**
   * Retrieves payment data based on a "search_action" parameter found in
   * <code>HttpServletRequest</code>. Possible values for search action are:
   * 
   * <ul>
   * <li>search - Retrieves search parameters and passes off to
   * <code>PaymentSearcher</code> for actual searching. Returns a collection of
   * search results. Search results are stored in a temp table and accessed via
   * payment_results.jsp
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
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException {

    RequestHandlerResponse response = null;
    String action = null;
    type = request.getParameter("type");
    response = new RequestHandlerResponse();
    setRequest(request);
    // setSessionID();
    if (!LoginChecker.isLoggedIn(request)) {
      throw new InvalidLoginException("User not logged in");
    } else if (!LoginChecker.isTairCurator(request)) {
      throw new UnauthorizedRequestException("Not authorized to view "
                                             + "this resource");
    } else {
      action = request.getParameter("action");
      if (action == null) {
        action = request.getParameter("search_action");
      }
      System.out.println("action = " + action);
      if (action.equals("search")) {
        search();
        response.setAttribute("pageNum", new Integer(1));
        response.setAttribute("size", (getRequest().getParameter("size")));
        response.setAttribute("searchCriteria", getSearchCriteria());
        response.setAttribute("query_id", getQueryID());
        response.setPage(summaryJsp);
      } else if (action != null && action.equals("re_search")) {
        results();
        response.setAttribute("pageNum",
                              new Integer(getRequest().getParameter("pageNum")));
        response.setAttribute("size", (getRequest().getParameter("size")));
        response.setAttribute("searchCriteria", getSearchCriteria());
        response.setAttribute("query_id", getRequest().getParameter("query_id"));
        response.setAttribute("sortColumn",
                              new String(getRequest().getParameter("sortColumn")));
        response.setPage(summaryJsp);
      } else if (action.equals("new_payment")) {
        // mjr changed invoice_id to orders_id
        if (!TextConverter.isEmpty
        // ( getRequest().getParameter("invoice_id") ) &&
        (getRequest().getParameter("orders_id"))
            && !TextConverter.isEmpty(getRequest().getParameter("method"))) {
          String paymentType = (String)getRequest().getParameter("method");
          response.setAttribute(
          // "invoice_id",
          "orders_id",
                                // new Long( getRequest().getParameter(
                                // "invoice_id" ) ) );
                                new Long(getRequest().getParameter("orders_id")));
          Long id = new Long(
          // getRequest().getParameter("invoice_id") );
          getRequest().getParameter("orders_id"));
          String[] selectedIDs;
          ArrayList lineItemIDs = new ArrayList();
          if (!TextConverter.isEmpty(getRequest().getParameter("id"))) {
            selectedIDs = getRequest().getParameterValues("id");
            if (selectedIDs != null && selectedIDs.length > 0) {
              for (int i = 0; i < selectedIDs.length; i++) {
                lineItemIDs.add(new Long(selectedIDs[i]));
              }
            }
            response.setAttribute("ids", lineItemIDs);
          }

        }
      } else if (action.equals("process")) {
        StringBuffer textualMessage = new StringBuffer(" There were ");
        refresh();
        Integer rows = new Integer(getUpdatedRows());
        textualMessage.append("<font class=\"emphasis\">");
        textualMessage.append(rows.toString());
        textualMessage.append("</font> ");
        if (getUpdatedRows() > 0) {
          textualMessage.append(" items processed. <p>");
        } else {
          textualMessage.append(" items eligble for payment. <p>");
        }
        setSearchCriteria(textualMessage.toString());
        response.setAttribute("searchCriteria", getSearchCriteria());
        response.setPage(summaryJsp);
      } else if (action != null && action.equals("detail")) {
        Long id = null;
        if (!TextConverter.isEmpty(getRequest().getParameter("orders_id"))) {
          id = new Long(getRequest().getParameter("orders_id"));

        }

      } else if (action != null && action.equals("payment")) {
        // pay();
        response.setAttribute("searchCriteria", getSearchCriteria());
        ;
      } else if (action != null && action.equals("download")) {
        download();
        response.setAttribute("downloadText", getDownloadText());
        response.setAttribute("downloadName", "payment");
        response.setPage(downloadJsp);
      } else if (action != null && action.equals("re_sort")) {
        results();
        // response.setAttribute( "pageNum", new Integer(1) );
        response.setAttribute("pageNum",
                              new Integer(getRequest().getParameter("pageNum")));
        response.setAttribute("query_id", getRequest().getParameter("query_id"));
        response.setAttribute("size", (getRequest().getParameter("size")));
        response.setAttribute("searchCriteria", getSearchCriteria());
        response.setAttribute("sortColumn",
                              new String(getRequest().getParameter("sortColumn")));
        // this is the only difference between re-sort and re-search --
        // / needed so it won't always re-sort but will retain the sort
        // columns upon paging
        response.setAttribute("reSort", new String("T"));
        response.setPage(summaryJsp);

      } else {
        throw new InvalidParameterException("Invalid action "
                                            + "requested: "
                                            + action);
      }
    }
    return response;
  }

  /**
   * Retrieve params and search - populate temp table with search results
   */
  private void search() throws SQLException, InvalidFormException,
      InvalidParameterException {
    setParams();
    SearchSession searchSession =
      SessionHandler.getSearchSession(getRequest(), getType());
    PaymentSearcher PaymentSearcher = new PaymentSearcher();
    setSearchCriteria();

    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    boolean firstSearch = true;
    String query_id = "";

    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();
      // search criteria needs to be set by query_id. always assume first search
      // because
      // invoices change all the time.
      String insert_query =
        PaymentSearcher.generateInsertLine(conn, getParams(), "form");
      query_id = MasterTableInfo.getQueryID(insert_query, conn, getType());
      params.put("query_id", query_id);
      setQueryID(query_id);
      System.out.println(" made a query : " + query_id);
    } finally {
      connectionPool.return_connection(conn);
    }

    searchSession.setSearchCriteria(getType(), getParams());
    PaymentSearcher.search((Map)getParams());
  }

  // page through result set
  private void results() throws SQLException, SessionOutOfTimeException {
    SearchSession searchSession = SessionHandler.getSearchSession(getRequest());
    if (searchSession != null && searchSession.searchInProgress(getType())) {
      params = (Map)searchSession.getSearchCriteria(getType());
      setSearchCriteria();
    } else {
      throw new SessionOutOfTimeException("No "
                                          + getType()
                                          + " search in progress");
    }
  }

  /**
   * Create a tab-delimited export string for the ids selected in the payment
   * summary page.
   * 
   * @throws SessionOutOfTimeException when no search is in progress
   * @throws InvalidFormException when no rows are selected for download
   * @throws SQLException when there is a database problem querying the download
   *           results
   */
  private void download() throws SessionOutOfTimeException,
      InvalidFormException, SQLException {

    List<String> ids = getSelectedPaymentIds();

    StringBuilder export = new StringBuilder("");
    List<PaymentSearchResult> results = getPayments(ids);
    boolean first = true;
    for (PaymentSearchResult result : results) {
      if (first) {
        result.getExportHeader(export);
        first = false;
      }
      result.getExport(export);
    }
    downloadText = export.toString();
  }

  /**
   * Get the payment ids for the payments selected for download.
   * 
   * @return a Vector of payment ids
   * @throws SessionOutOfTimeException when there is no search in progress
   * @throws InvalidFormException when no ids were selected
   */
  private List<String> getSelectedPaymentIds()
      throws SessionOutOfTimeException, InvalidFormException {
    List<String> ids = new ArrayList<String>();
    searchSession = SessionHandler.getSearchSession(getRequest());
    String query_id = (String)request.getParameter("query_id");
    setQueryID(query_id);

    // get previous pages ids
    if (searchSession != null && query_id != null) {
      Vector<Long> searchIds = searchSession.getDownload(getQueryID());
      if (searchIds != null) {
        for (Long id : searchIds) {
          ids.add(id.toString());
        }
      }
    } else {
      throw new SessionOutOfTimeException("No "
                                          + getType()
                                          + " search in progress");
    }

    // combine previously selected with selections from current page
    if (!TextConverter.isEmpty(getRequest().getParameter("id"))) {
      String[] formIDs = getRequest().getParameterValues("id");
      if (formIDs != null && formIDs.length > 0) {
        for (int i = 0; i < formIDs.length; i++) {
          ids.add(formIDs[i]);
        }
      }
    }

    // Must have at least one id selected on the form.
    if (ids == null || ids.isEmpty()) {
      throw new InvalidFormException("No rows selected for download");
    }
    return ids;
  }

  /**
   * Get a list of payment search results corresponding to a vector of payment
   * ids.
   * 
   * @param ids the Vector of String payment ids
   * @return a list of payment search results
   * @throws SQLException when there is a database problem
   */
  private List<PaymentSearchResult> getPayments(List<String> ids)
      throws SQLException {
    // Select payments using ids in IN clause; use outer joins to get the
    // payments regardless of the existence of items and orders.
    StringBuilder sql =
      new StringBuilder("SELECT payment_id, "); 
    sql.append("       payment_date, "); 
    sql.append("       amount, "); 
    sql.append("       invoice_id, "); 
    sql.append("       payment_type, "); 
    sql.append("       verification_code, "); 
    sql.append("       name_on_check, "); 
    sql.append("       check_number, "); 
    sql.append("       check_date, "); 
    sql.append("       payment_ref_id, "); 
    sql.append("       order_number, "); 
    sql.append("       rownum "); 
    sql.append("  FROM (SELECT DISTINCT p.payment_id, "); 
    sql.append("               p.payment_date, "); 
    sql.append("               p.amount, "); 
    sql.append("               (SELECT MAX(invoice_id) "); 
    sql.append("                  FROM LineItem li2 "); 
    sql.append("                 WHERE li2.payment_id = p.payment_id) AS invoice_id, "); 
    sql.append("               p.payment_type, "); 
    sql.append("               p.verification_code, "); 
    sql.append("               p.name_on_check, "); 
    sql.append("               p.check_number, "); 
    sql.append("               p.check_date, "); 
    sql.append("               p.payment_ref_id, "); 
    sql.append("               (SELECT MAX(order_number) "); 
    sql.append("                  FROM Orders o2 JOIN "); 
    sql.append("                       LineItem li2 ON o2.orders_id = li2.orders_id "); 
    sql.append("                 WHERE li2.payment_id = p.payment_id) AS order_number "); 
    sql.append("          FROM Payment p LEFT JOIN "); 
    sql.append("               LineItem li ON p.payment_id = li.payment_id LEFT JOIN "); 
    sql.append("               Orders o ON li.orders_id = o.orders_id "); 
    sql.append("         WHERE p.payment_id IN (");

    // Add the ids to the IN clause, no more than 1000 in Oracle IN clause.
    if (ids.size() <= 1000) {
      String sep = "";
      for (String id : ids) {
        sql.append(sep);
        sql.append(id);
        sep = ", ";
      }
      sql.append(")) p");
    } else {
      throw new RuntimeException("Too many payments selected, can only download up to 1,000 payments");
    }

    // Query the payments.
    DBconnection connection = null;
    List<PaymentSearchResult> results = null;
    try {
      connection = DBWriteManager.getInstance().getSearchConnection();
      String query = Utils.compressBlanks(sql.toString());
      connection.setQuery(query);
      ResultSet rs = connection.getResultSet();

      Long paymentId = null;
      Timestamp paymentDate = null;
      BigDecimal amount = null;
      Long invoiceId = null;
      String paymentType = null;
      String verificationCode = null;
      String nameOnCheck = null;
      String checkNumber = null;
      Timestamp checkDate = null;
      String paymentRefId = null;
      Long orderNumber = null;
      Integer rowNum = null;

      while (rs.next()) {
        if (results == null) {
          results = new ArrayList<PaymentSearchResult>();
        }

        paymentId = rs.getLong("payment_id");
        paymentDate = rs.getTimestamp("payment_date");
        amount = rs.getBigDecimal("amount");
        invoiceId = rs.getLong("invoice_id");
        paymentType = rs.getString("payment_type");
        verificationCode = rs.getString("verification_code");
        nameOnCheck = rs.getString("name_on_check");
        checkNumber = rs.getString("check_number");
        checkDate = rs.getTimestamp("check_date");
        paymentRefId = rs.getString("payment_ref_id");
        orderNumber = rs.getLong("order_number");
        rowNum = rs.getInt("rownum");

        PaymentSearchResult result =
          new PaymentSearchResult(paymentId,
                                  invoiceId,
                                  paymentDate,
                                  amount,
                                  paymentType,
                                  verificationCode,
                                  paymentRefId,
                                  nameOnCheck,
                                  checkNumber,
                                  checkDate,
                                  orderNumber,
                                  null,
                                  null,
                                  rowNum,
                                  rowNum);
        results.add(result);
      }
    } finally {
      if (connection != null) {
        DBWriteManager.return_connection(connection);
      }
    }

    return results;
  }

  /**
   * Refreshes the temp table and re-runs the initial query
   */
  private void refresh() throws SQLException, InvalidFormException,
      InvalidParameterException, SessionOutOfTimeException {
    // make into separate method
    SearchSession searchSession = SessionHandler.getSearchSession(getRequest());
    if (searchSession != null && searchSession.searchInProgress(getType())) {
      params = (Map)searchSession.getSearchCriteria(getType());
      // to clear the contents of the temp table
      searchSession.registerSearch(getType(), getQueryID());
    } else {
      throw new SessionOutOfTimeException("No "
                                          + getType()
                                          + " search in progress");
    }
    PaymentSearcher PaymentSearcher = new PaymentSearcher();
    PaymentSearcher.search((Map)getParams());
  }

  // returns a textual description of the requested search for
  // display on the results page
  private String getSearchCriteria() {
    return searchCriteria;
  }

  // assembles a textual description of the requested search using
  // selected parameters stored in a hashmap
  private void setSearchCriteria() {
    StringBuffer criteria = new StringBuffer("Your query for payments where ");
    if ((String)getParams().get("payment_type") != null) {
      criteria.append(" payment type is ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append((String)getParams().get("payment_type"));
      criteria.append("</font>");
    }

    // handles if the user inputs the payment_date_from only
    if ((java.util.Date)getParams().get("payment_date_from") != null
        && (java.util.Date)getParams().get("payment_date_to") == null) {
      criteria.append(",");
      criteria.append(" payment date equal to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString((java.util.Date)getParams().get("payment_date_from")));
      criteria.append("</font>");
    }
    // handles if the user inputs both payment_date_from and payment_date_to
    if ((java.util.Date)getParams().get("payment_date_from") != null
        && (java.util.Date)getParams().get("payment_date_to") != null) {
      criteria.append(",");
      criteria.append(" payment date is from ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString((java.util.Date)getParams().get("payment_date_from")));
      criteria.append("</font>");
      criteria.append(" to ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(TextConverter.dateToString((java.util.Date)getParams().get("payment_date_to")));
      criteria.append("</font>");
    }

    criteria.append(" resulted in ");
    searchCriteria = criteria.toString();
  }

  // appends the textual message assembled from the form
  // parameters ( see above method ) with the provided string
  private void setSearchCriteria(String addOn) {
    StringBuffer criteriaPlus = new StringBuffer("");
    setSearchCriteria();
    if (addOn != null) {
      criteriaPlus.append(addOn);
    }
    criteriaPlus.append(searchCriteria);
    searchCriteria = criteriaPlus.toString();
  }

  // returns download data as a string -- requested from the goslim_form.jsp
  private String getDownloadText() {
    return downloadText;
  }

  // returns user specified parameters from the form jsp as hash map;
  // key = input name from form, value = selected value
  private Map getParams() {
    return params;
  }

  // stores the user specified parameters from the form jsp in a hash
  // map called params where:
  // key = input name from form, value = selected value from form
  private void setParams() throws InvalidFormException {
    // save any errors to notify user all at once
    HashMap errors = new HashMap();
    if (!TextConverter.isEmpty(getRequest().getParameter("payment_type"))) {
      params.put("payment_type", getRequest().getParameter("payment_type"));
    }

    try {

      // Translate payments made date from form in mm/dd/yyyy format
      // to java.util.Date value
      // suitable for searching - easily done using DateWebFormField.
      if (!TextConverter.isEmpty(getRequest().getParameter("payment_date_from"))) {
        DateWebFormField formField =
          new DateWebFormField("payment_date_from", false);
        java.util.Date fromDate =
          (java.util.Date)formField.validate(getRequest());
        params.put("payment_date_from", fromDate);
      }

      /*
       * If payments date to is not today's date, manually set time to last
       * second of the day (23:59:59) so that when searching // for items
       * altered before that date, items altered on that date will get caught. A
       * little awkward, but necessary because vanilla translation of string
       * value to simple date format will set time as midnight *beginning* the
       * day, when we need it for ending the day
       */
      if (!TextConverter.isEmpty(getRequest().getParameter("payment_date_to"))) {
        DateWebFormField formToDate =
          new DateWebFormField("payment_date_to", false);
        GregorianCalendar dateUpdater = new GregorianCalendar();
        java.util.Date toDate =
          (java.util.Date)formToDate.validate(getRequest());
        dateUpdater.setTime(toDate);
        dateUpdater.set(Calendar.HOUR_OF_DAY, 23);
        dateUpdater.set(Calendar.MINUTE, 59);
        dateUpdater.set(Calendar.SECOND, 59);
        toDate = dateUpdater.getTime();
        params.put("payment_date_to", toDate);
      }
    } catch (InvalidParameterException ipe) {
      errors.put("Payments made date", ipe.getMessage());
    }

    if (!TextConverter.isEmpty(getRequest().getParameter("order"))) {
      params.put("order", getRequest().getParameter("order"));
    }

    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }
  }

  // returns this search type
  private String getType() {
    return type;
  }

  // returns form jsp
  private String getFormJsp() {
    return formJsp;
  }

  // sets this session id
  private void setQueryID(String query_id) {
    this.queryID = query_id;
  }

  // returns this session id
  private String getQueryID() {
    return queryID;
  }

  // sets a handle to this request object
  private void setRequest(HttpServletRequest request) {
    this.request = request;
  }

  // returns a handle to this request object
  private HttpServletRequest getRequest() {
    return request;
  }

  // increments by one the number of updated rows
  private void incrementUpdatedRows() {
    this.updatedRows++;
  }

  // indicates how many rows where updated
  private int getUpdatedRows() {
    return updatedRows;
  }

  // converts row ids which are being stored in session
  // to invoice ids which are needed for "process" action
  private Vector convertRowIDsToInvoiceIDs(Vector ids) throws SQLException {
    Vector invoiceIDs = null;
    ResultsFetcher invoices = new ResultsFetcher(getQueryID(), getType());
    invoiceIDs = new Vector(invoices.getAllIDsInTempTable());
    System.out.println(" invoiceIDS size = " + invoiceIDs.size());
    return invoiceIDs;
  }

}
