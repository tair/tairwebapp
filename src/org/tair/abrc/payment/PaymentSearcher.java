// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.18 $
// $Date: 2006/02/10 20:26:17 $
// ------------------------------------------------------------------------------
package org.tair.abrc.payment;


import java.sql.SQLException;
import java.util.Map;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.TextConverter;


/**
 * PaymentSearcher retrieves invoices according to submitted search parameters.
 * <p>
 * Search results are stored in a temp table <code>PaymentableInfo</code> which
 * is created for a particular user based on query id and search type ( payment
 * ). For temp table definition see <code>PaymentTableInfo</code>.
 * PaymentSearcher only inserts into temp table; creating, deleting and dropping
 * table is done by <code>SearchSession</code>. Selecting from temp table is
 * done by <code>ResultsFetcher</code> via the summary jsp for search results.
 * PaymentSearcher retrieves the relevant temp table name to use by querying
 * <code>MasterTableInfo</code>.
 */

public class PaymentSearcher {
  private final String searchType = "payment";
  private Map params;
  private DBWriteManager connectionPool;
  private String searchCriteria;
  private String queryID;
  private StringBuffer fromBuffer;
  private StringBuffer whereBuffer;
  private String groupBy;
  private String orderBy;

  // constructor for summary pages
  public PaymentSearcher() {
  }

  /**
   * Creates SQL query using submitted search parameters and stores payments
   * that match criteria in temp table. Each row in the temp table represents a
   * unique payment for display on the summary page. Each column is populated
   * with an payment attribute cooresponding to the the row's invoice_id (column
   * name = invoice_id).
   * 
   * @param searchParams Search criteria staired in Map submitted through the
   *          form
   * @param queryID User's session id. Used to access temp table for user's
   *          individual results.
   * @exception SQLException thrown if a database error occurs.
   */
  public void search(Map searchParams) throws SQLException {
    setParams(searchParams);
    String queryID = (String)searchParams.get("query_id");
    setQueryID(queryID);
    processSearch();
  }

  /**
   * get the unique identifier insert line of this search
   */
  public String generateInsertLine(DBconnection conn, Map searchParams,
                                   String type) throws SQLException {
    String insert_query = "";
    setParams(searchParams);
    if (type.equalsIgnoreCase("form")) {
      insert_query = createSearchSQL();
    } else {
      insert_query = createSearchSQL();
    }
    return insert_query;
  }

  // returns the search type
  private final String getSearchType() {
    return searchType;
  }

  private final String getTableColumns() {
    String columns =
      " PAYMENT_DATE, "
          + " PAYMENT_AMOUNT, "
          + " INVOICE_ID, "
          + " PAYMENT_TYPE, "
          + " VERIFICATION_CODE, "
          + " NAME_ON_CHECK, "
          + " CHECK_NUMBER, "
          + " CHECK_DATE, "
          + " PAYMENT_REF_ID, "
          + " ORDER_NUMBER, "
          + " PAYMENT_ID, "
          + " QUERY_ID, "
          + " DATE_LAST_QUERIED";
    return columns;
  }

  // returns the select clause used for invoice search
  private final String getSelectClause() {
    String queryID = getQueryID();
    String select =
      " SELECT DISTINCT TO_CHAR(Payment.payment_date, 'MM/DD/YYYY') as payment_date, "
          + " Payment.amount AS payment_amount, "
          + " LineItem.invoice_id as invoice_id, "
          + " Payment.payment_type as payment_type, "
          + " Payment.verification_code as verification_code, "
          + " Payment.name_on_check as name_on_check, "
          + " Payment.check_number as check_number, "
          + " TO_CHAR(Payment.check_date, 'MM/DD/YYYY') as check_date, "
          + " Payment.payment_ref_id as payment_ref_id, "
          + " Orders.order_number as order_number, "
          + " Payment.payment_id as payment_id ";
    if (queryID != null && queryID != "") {
      select = select + ", '" + queryID + "', CURRENT_DATE ";
    } else {
      select = select + ", '', '' ";
    }
    return select;
  }

  // sets the base from clause used for search
  private void setBaseFromClause() {
    fromBuffer = new StringBuffer(" FROM Payment");
    fromBuffer.append(", LineItem");
    fromBuffer.append(", Invoice");
    fromBuffer.append(", Orders");
  }

  // sets the base where clause used for search
  private void setBaseWhereClause() {
    whereBuffer =
      new StringBuffer(" WHERE Payment.payment_id = LineItem.payment_id");
    whereBuffer.append(" AND LineItem.invoice_id = Invoice.invoice_id");
    whereBuffer.append(" AND Invoice.orders_id = Orders.orders_id");
  }

  // returns the customized from clause for the search
  private String getFromClause() {
    return fromBuffer.toString();
  }

  // returns the customized where clause for the search
  private String getWhereClause() {
    return whereBuffer.toString();
  }

  // sets the orderBy clause used for search
  private void setOrderByClause() {
    if (getParams().get("order") != null) {
      if (((String)getParams().get("order")).equalsIgnoreCase("payment_date")) {
        orderBy = " ORDER BY Payment.payment_date ";
      } else if (((String)getParams().get("order")).equalsIgnoreCase("payment_amount")) {
        orderBy = " ORDER BY Payment.payment_amount ";
      } else if (((String)getParams().get("order")).equalsIgnoreCase("invoice_id")) {
        orderBy = " ORDER BY LineItem.invoice_id ";
      } else if (((String)getParams().get("order")).equalsIgnoreCase("payment_type")) {
        orderBy = " ORDER BY Payment.payment_type ";
      } else {
        orderBy = " ";
      }
    } else {
      orderBy = " ";
    }
  }

  // returns the orderBy clause used for search
  private String getOrderByClause() {
    return orderBy;
  }

  // returns the insert clause used to populate temp table with results
  private final String getInsertClause() {
    String insert = "INSERT /*+ APPEND */ INTO RESULT_PAYMENT ";
    return insert;
  }

  private final String getDelete() {
    String del =
      "DELETE FROM RESULT_PAYMENT WHERE QUERY_ID = '" + getQueryID() + "'";
    return del;
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBWriteManager.getInstance();
    return connectionPool.getSearchConnection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    connectionPool.return_connection(conn);
  }

  // sets the parameters that user specified on search form
  private void setParams(Map searchParams) {
    params = searchParams;
  }

  // returns the map object of search params the user entered
  private Map getParams() {
    return params;
  }

  // sets the query id
  private void setQueryID(String queryID) {
    this.queryID = queryID;
  }

  // returns the query id
  private String getQueryID() {
    return queryID;
  }

  // returns the textual description of the search params
  private String getSearchCriteria() {
    return searchCriteria;
  }

  // turns the search parameter entries into a sql search string that
  // will be used for the search
  private String createSearchSQL() throws SQLException {

    String type = (String)getParams().get("payment_type");
    java.util.Date paymentDateTo =
      (java.util.Date)getParams().get("payment_date_to");
    java.util.Date paymentDateFrom =
      (java.util.Date)getParams().get("payment_date_from");

    setBaseFromClause();
    setBaseWhereClause();
    // setGroupByClause();
    setOrderByClause();
    // check params, modify From/Where clause as needed
    // payments made date range
    if (paymentDateFrom != null && paymentDateTo == null) {
      whereBuffer.append(" AND payment_date = "
                         + TextConverter.dbQuote(paymentDateFrom, "mm/dd/yyyy"));
    }

    if (paymentDateFrom != null && paymentDateTo != null) {
      whereBuffer.append(" AND payment_date between "
                         + TextConverter.dbQuote(paymentDateFrom, "mm/dd/yyyy")
                         + " AND "
                         + TextConverter.dbQuote(paymentDateTo, "mm/dd/yyyy"));

    }

    if (type != null) {
      if (type.equalsIgnoreCase("online_credit_card")) {
        whereBuffer.append(" AND Payment.payment_type = 'online_credit_card' ");
      } else if (type.equalsIgnoreCase("check")) {
        whereBuffer.append(" AND Payment.payment_type = 'check' ");
      } else {
      }
    }

    // return (getSelectClause() + getFromClause() + getWhereClause() +
    // getOrderByClause() );
    return (getSelectClause() + getFromClause() + getWhereClause());

  }

  // invokes a method to write the results of the search sql to the temp table
  private void processSearch() throws SQLException {
    writeToTempTbl(createSearchSQL());
  }

  // writes search results to temp table
  private void writeToTempTbl(String stmt) throws SQLException {
    Debugger.println(Debugger.logMsg(this, "writeToTempTbl, SQL = " + stmt));
    DBconnection conn = null;
    try {
      conn = getConnection();

      // do preliminary table drops first, should never get here but just in
      // case
      String del_query = getDelete();
      conn.setQuery(del_query);
      conn.executeUpdate();
      conn.releaseResources();

      // populate table with results
      String insert_query =
        getInsertClause() + "(" + getTableColumns() + ") " + stmt;
      conn.setQuery(insert_query);
      conn.executeUpdate();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  /**
   * For unit testing
   */
  public static void main(String[] args) {

  }
}
