// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.20 $
// $Date: 2006/08/01 23:38:25 $
// ------------------------------------------------------------------------------
package org.tair.abrc.payment;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;
import org.tair.utilities.Utils;


/**
 * InvoiceSearcher retrieves invoices according to submitted search parameters.
 * <p>
 * The invoice searcher generates the search results and stores them in the
 * Invoice_Results table in the database.
 */

public class InvoiceSearcher {
  private static final Logger logger = Logger.getLogger(InvoiceSearcher.class);
  private Map<String, Object> params;
  private StringBuilder whereBuilder;
  private StringBuilder fromBuilder;

  /**
   * Create an InvoiceSearcher object with the search parameters from the search
   * form request.
   * 
   * @param searchParams Search criteria stored in Map submitted through the
   *          form
   */
  public InvoiceSearcher(Map<String, Object> searchParams) {
    params = searchParams;
  }

  /**
   * Creates SQL query using the search parameters and stores invoices that
   * match criteria in temp table. Each row in the temp table represents a
   * unique invoice for display on the summary page. Each column is populated
   * with an invoice attribute corresponding to the the row's invoice_id (column
   * name = ID). Where compound information is associated with one invoice, a
   * unique id ( foreign key ) is stored and used for lookup into the
   * appropriate table at the time the complete row's data is requested for
   * display via <code>ResultsFetcher</code>.
   * 
   * @param query the query with which to search
   * 
   * @return a <code>Map</code> of <code>InvoiceSearchResult</code> objects
   *         keyed on <code>Long</code> invoice id
   * 
   * @exception SQLException thrown if a database error occurs.
   */
  public Map<Long, InvoiceSearchResult> search(String query)
      throws SQLException {
    DBconnection conn = null;
    Map<Long, InvoiceSearchResult> map = null;
    try {
      conn = getConnection();
      conn.setQuery(query);
      logger.debug("Searching for invoices with query: "
                   + Utils.compressBlanks(query));
      map = queryInvoiceResults(conn);
    } finally {
      if (conn != null)
        returnConnection(conn);
    }

    return map;
  }

  /**
   * Query the results, creating a results map keyed on integer id.
   * 
   * @param conn the JDBC connection
   * @return a <code>Map</code> of <code>InvoiceSearchResult</code> objects
   *         keyed on <code>Long</code> invoice id
   * @throws SQLException when there is a problem running the query
   */
  private Map<Long, InvoiceSearchResult> queryInvoiceResults(DBconnection conn)
      throws SQLException {
    Map<Long, InvoiceSearchResult> map =
      new HashMap<Long, InvoiceSearchResult>();
    ResultSet rs = conn.getResultSet();
    int rowId = 0;
    while (rs.next()) {
      InvoiceSearchResult result = getSearchResult(rs, rowId);
      map.put(result.getInvoiceId(), result);
      rowId++;
    }
    conn.releaseResources();
    return map;
  }

  /**
   * Get the search result from the row in the result set.
   * 
   * @param rs the JDBC result set pointing to a queried row of data
   * @param rowId the order identifier for this result
   * @return a search result object
   * @throws SQLException when there is a problem fetching the data
   */
  private InvoiceSearchResult getSearchResult(ResultSet rs, int rowId)
      throws SQLException {
    InvoiceSearchResult result = null;
    result =
      new InvoiceSearchResult(rs.getLong("id"),
                              rs.getString("person_name"),
                              rs.getString("lab_name"),
                              rs.getBigDecimal("organization_id").toBigInteger(),
                              rs.getTimestamp("invoice_date"),
                              rs.getString("invoice_status"),
                              rs.getLong("order_number"),
                              rs.getTimestamp("last_notified_date"),
                              rs.getTimestamp("last_shipped_date"),
                              rs.getBigDecimal("invoice_total"),
                              rs.getBigDecimal("balance_due"),
                              rs.getBigDecimal("eligible_amount"),
                              rs.getString("invoice_type"),
                              rs.getLong("orders_id"),
                              rs.getBigDecimal("auth_amount"),
                              rs.getString("payment_ref_id"),
                              rs.getString("verification_code"),
                              rs.getTimestamp("date_last_modified"),
                              rs.getTimestamp("date_invoice_created"),
                              rs.getString("query_id"),
                              rs.getTimestamp("current_date"),
                              rowId,
                              rowId);
    return result;
  }

  // returns the select clause used for invoice search
  private final String getSelectClause() {
    String queryID = (String)params.get("query_id");
    StringBuilder sb = new StringBuilder("");
    sb.append("SELECT i.invoice_id AS id, ");
    sb.append("       (SELECT LTRIM(first_name || ' ' || last_name) ");
    sb.append("          FROM Community c JOIN Person p ON c.community_id = p.community_id ");
    sb.append("         WHERE p.person_id = o.person_id) AS person_name, ");
    sb.append("       (SELECT name ");
    sb.append("          FROM Organization ");
    sb.append("         WHERE organization_id = o.organization_id) AS lab_name, ");
    sb.append("       o.organization_id AS organization_id, ");
    sb.append("       i.invoice_date, ");
    sb.append("       i.status AS invoice_status, ");
    sb.append("       o.order_number AS order_number, ");
    sb.append("       (SELECT MAX(notification_date) ");
    sb.append("          FROM LineItem ");
    sb.append("         WHERE invoice_id = i.invoice_id AND ");
    sb.append("               orders_id = i.orders_id) AS last_notified_date, ");
    sb.append("       (SELECT MAX(date_last_modified) ");
    sb.append("          FROM Orders_Stock ");
    sb.append("         WHERE status = 'shipped' AND ");
    sb.append("               orders_id = i.orders_id) AS last_shipped_date, ");
    sb.append("       i.invoice_total AS invoice_total, ");
    sb.append("       (SELECT COALESCE(SUM(amount), 0) ");
    sb.append("          FROM LineItem ");
    sb.append("         WHERE status = 'unpaid' AND ");
    sb.append("               invoice_id = i.invoice_id) AS balance_due, ");
    sb.append("       (SELECT COALESCE(SUM(li.amount), 0) AS amount ");
    sb.append("               FROM LineItem li LEFT JOIN ");
    sb.append("                    Orders_Stock os ON li.stock_id = os.stock_id AND li.orders_id = os.orders_id ");
    sb.append("              WHERE li.invoice_id = i.invoice_id AND ");
    sb.append("                    li.status = 'unpaid' AND  ");
    sb.append("                    ((li.lineitem_type <> 'stock_charge' AND i.status <> 'new') OR  ");
    sb.append("                    os.status = 'shipped')) AS eligible_amount, ");
    sb.append("       i.payment_method AS invoice_type, ");
    sb.append("       i.orders_id AS orders_id, ");
    sb.append("       i.auth_amount, ");
    sb.append("       i.payment_ref_id, ");
    sb.append("       i.verification_code, ");
    sb.append("       i.date_last_modified, ");
    sb.append("       i.date_invoice_created, ");
    if (queryID != null && queryID != "") {
      sb.append("       '");
      sb.append(queryID);
      sb.append("       ' AS query_id,");
      sb.append("       CURRENT_DATE ");
    } else {
      sb.append("       NULL AS query_id, NULL AS CURRENT_DATE ");
    }
    return sb.toString();
  }

  // sets the base from clause used for search
  private void setBaseFromClause() {
    fromBuilder = new StringBuilder(" FROM Invoice i ");
    fromBuilder.append("JOIN Orders o ");
    fromBuilder.append("ON i.orders_id = o.orders_id");
  }

  // sets the base where clause used for search
  private void setBaseWhereClause() {
    whereBuilder = new StringBuilder(" WHERE ");
  }

  // returns the customized from clause for the search
  private String getFromClause() {
    return fromBuilder.toString();
  }

  // returns the customized where clause for the search
  private String getWhereClause() {
    return whereBuilder.toString();
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    return DBWriteManager.getInstance().getSearchConnection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    DBWriteManager.return_connection(conn);
  }

  /**
   * Create the SQL SELECT statement that represents the invoice search based on
   * the current set of parameters. This method makes the query string public
   * for use in identifying the query.
   * 
   * @return the SELECT statement
   * @throws SQLException when there is a problem
   */
  public String createSearchSQL() {
    String status = (String)params.get("invoice_status");
    String user_status = (String)params.get("user_invoice_status");
    String type = (String)params.get("invoice_type");
    java.util.Date invoiceDateTo =
      (java.util.Date)params.get("date_invoice_created_to");
    java.util.Date invoiceDateFrom =
      (java.util.Date)params.get("date_invoice_created_from");
    Integer orderNumber = (Integer)params.get("order_number");
    Integer invoiceIDTo = (Integer)params.get("invoice_id_to");
    Integer invoiceIDFrom = (Integer)params.get("invoice_id_from");
    Integer invoiceId = (Integer)params.get("invoice_id");
    String lineItemType = (String)params.get("line_item_type");
    Integer labID = (Integer)params.get("lab_id");
    Integer personID = (Integer)params.get("person_id");
    java.util.Date shippedDateTo =
      (java.util.Date)params.get("shipped_date_to");
    java.util.Date shippedDateFrom =
      (java.util.Date)params.get("shipped_date_from");
    java.util.Date notifiedDateTo =
      (java.util.Date)params.get("notified_date_to");
    java.util.Date notifiedDateFrom =
      (java.util.Date)params.get("notified_date_from");
    String noNotifiedDate = (String)params.get("no_notified_date");
    java.util.Date updatedDateTo =
      (java.util.Date)params.get("updated_date_to");
    java.util.Date updatedDateFrom =
      (java.util.Date)params.get("updated_date_from");
    setBaseFromClause();
    setBaseWhereClause();
    // check params, modify From/Where clause as needed
    boolean first = true;
    if (type != null) {
      if (type.equalsIgnoreCase("credit card")) {
        whereBuilder.append("i.payment_method = 'credit_card' ");
        first = false;
      } else if (type.equalsIgnoreCase("purchase order")) {
        whereBuilder.append("i.payment_method = 'purchase_order' ");
        first = false;
      } else {
      }
    }
    if (labID != null) {
      if (first) {
        whereBuilder.append("organization_id = " + labID + " ");
        first = false;
      } else {
        whereBuilder.append(" AND organization_id = " + labID + " ");
      }
    }
    if (personID != null) {
      if (first) {
        whereBuilder.append("o.person_id = " + personID + " ");
        first = false;
      } else {
        whereBuilder.append(" AND o.person_id = " + personID + " ");
      }
    }

    // Exclude unwanted invoices based on payment status
    if (user_status != null && user_status.equalsIgnoreCase("paid")) {
      // status = paid AND amount due = 0
      if (first) {
        whereBuilder.append("i.status = 'paid_in_full'");
        first = false;
      } else {
        whereBuilder.append(" AND i.status = 'paid_in_full'");
      }
      whereBuilder.append(" AND (SELECT COALESCE(SUM(amount), 0) FROM LineItem li ");
      whereBuilder.append("WHERE li.invoice_id = i.invoice_id AND li.status = 'unpaid') = 0");
    } else if (user_status != null && user_status.equalsIgnoreCase("unpaid")) {
      // status = in_progress and amount due > 0 and all items notified
      if (first) {
        whereBuilder.append("i.status = 'in_progress' AND ");
        first = false;
      } else {
        whereBuilder.append(" AND i.status = 'in_progress' AND ");
      }
      whereBuilder.append("       EXISTS (SELECT li.notification_date ");
      whereBuilder.append("                 FROM LineItem li ");
      whereBuilder.append("                WHERE i.invoice_id = li.invoice_id AND ");
      whereBuilder.append("                      li.notification_date IS NOT NULL AND ");
      whereBuilder.append("                      li.lineitem_type = 'stock_charge') AND ");
      whereBuilder.append("       NOT EXISTS (SELECT li.notification_date ");
      whereBuilder.append("                     FROM LineItem li ");
      whereBuilder.append("                    WHERE i.invoice_id = li.invoice_id AND ");
      whereBuilder.append("                          li.notification_date = NULL AND ");
      whereBuilder.append("                          li.lineitem_type = 'stock_charge' AND ");
      whereBuilder.append("                          li.amount > 0) AND ");
      whereBuilder.append("       (SELECT sum(amount) ");
      whereBuilder.append("          FROM LineItem li ");
      whereBuilder.append("         WHERE li.invoice_id = i.invoice_id AND ");
      whereBuilder.append("               li.status = 'unpaid') > 0 ");
    } else if (user_status != null && user_status.equalsIgnoreCase("any")) {
      // any non-null status and amount due = 0 and all items notified
      if (first) {
        whereBuilder.append("   (i.status = 'paid_in_full' AND ");
        first = false;
      } else {
        whereBuilder.append("   AND ((i.status = 'paid_in_full' AND ");
      }
      whereBuilder.append("        (SELECT COALESCE(SUM(amount), 0) ");
      whereBuilder.append("           FROM LineItem li ");
      whereBuilder.append("          WHERE li.invoice_id = i.invoice_id AND ");
      whereBuilder.append("                li.status = 'unpaid') = 0) OR ");
      whereBuilder.append("       (i.status = 'in_progress' AND ");
      whereBuilder.append("        EXISTS (SELECT li.notification_date ");
      whereBuilder.append("                  FROM LineItem li ");
      whereBuilder.append("                 WHERE i.invoice_id = li.invoice_id AND ");
      whereBuilder.append("                       li.notification_date IS NOT NULL AND ");
      whereBuilder.append("                       li.lineitem_type = 'stock_charge') AND ");
      whereBuilder.append("        NOT EXISTS (SELECT li.notification_date ");
      whereBuilder.append("                      FROM LineItem li ");
      whereBuilder.append("                     WHERE i.invoice_id = li.invoice_id AND ");
      whereBuilder.append("                           li.notification_date IS NULL AND ");
      whereBuilder.append("                           li.lineitem_type = 'stock_charge' AND ");
      whereBuilder.append("                           li.amount > 0) AND ");
      whereBuilder.append("        (SELECT SUM(amount) ");
      whereBuilder.append("           FROM LineItem li ");
      whereBuilder.append("          WHERE li.invoice_id = i.invoice_id AND ");
      whereBuilder.append("                li.status = 'unpaid') > 0 )) ");
    }

    // specific status =
    if (status != null && !status.equalsIgnoreCase("any")) {
      if (first) {
        whereBuilder.append(" i.status = ");
        first = false;
      } else {
        whereBuilder.append(" AND i.status = ");
      }
      whereBuilder.append(TextConverter.dbQuote(status));
    }

    // invoices made date =
    if (invoiceDateFrom != null && invoiceDateTo == null) {
      if (first) {
        whereBuilder.append(" date_invoice_created = ");
        first = false;
      } else {
        whereBuilder.append(" AND date_invoice_created = ");
      }
      whereBuilder.append(TextConverter.dbQuote(invoiceDateFrom, "mm/dd/yyyy"));
    }

    // invoices made date between
    if (invoiceDateFrom != null && invoiceDateTo != null) {
      if (first) {
        whereBuilder.append(" date_invoice_created between ");
        first = false;
      } else {
        whereBuilder.append(" AND date_invoice_created between ");
      }
      whereBuilder.append(TextConverter.dbQuote(invoiceDateFrom, "mm/dd/yyyy"));
      whereBuilder.append(" AND ");
      whereBuilder.append(TextConverter.dbQuote(invoiceDateTo, "mm/dd/yyyy"));
    }

    // last shipped made date =
    if (shippedDateFrom != null && shippedDateTo == null) {
      if (first) {
        whereBuilder.append(" EXISTS ( select max(ors.date_last_modified) ");
        first = false;
      } else {
        whereBuilder.append(" AND EXISTS ( select max(ors.date_last_modified) ");
      }
      whereBuilder.append(" ");
      whereBuilder.append(" from LineItem li JOIN ");
      whereBuilder.append(" Orders_Stock ors ON li.stock_id = ors.stock_id AND ");
      whereBuilder.append(" li.orders_id = ors.orders_id WHERE li.invoice_id = ");
      whereBuilder.append(" i.invoice_id AND ors.status = 'shipped' ");
      whereBuilder.append(" GROUP BY ors.date_last_modified HAVING ");
      whereBuilder.append(" ors.date_last_modified = ");
      whereBuilder.append(TextConverter.dbQuote(shippedDateFrom, "mm/dd/yyyy"));
      whereBuilder.append(") ");
    }

    // last shipped date range between
    if (shippedDateFrom != null && shippedDateTo != null) {
      if (first) {
        whereBuilder.append(" EXISTS ( select max(ors.date_last_modified) ");
        first = false;
      } else {
        whereBuilder.append(" AND EXISTS ( select max(ors.date_last_modified) ");
      }
      whereBuilder.append(" from LineItem li JOIN ");
      whereBuilder.append(" Orders_Stock ors ON li.stock_id = ors.stock_id WHERE ");
      whereBuilder.append(" li.orders_id = ors.orders_id AND li.invoice_id = ");
      whereBuilder.append(" i.invoice_id AND ors.status = 'shipped' ");
      whereBuilder.append(" GROUP BY date_last_modified HAVING ");
      whereBuilder.append(" ors.date_last_modified between ");
      whereBuilder.append(TextConverter.dbQuote(shippedDateFrom, "mm/dd/yyyy"));
      whereBuilder.append(" AND ");
      whereBuilder.append(TextConverter.dbQuote(shippedDateTo, "mm/dd/yyyy"));
      whereBuilder.append(") ");
    }

    // notified date =
    if (notifiedDateFrom != null && notifiedDateTo == null) {
      if (first) {
        whereBuilder.append(" EXISTS ( select max(li.notification_date) ");
        first = false;
      } else {
        whereBuilder.append(" AND EXISTS ( select max(li.notification_date) ");
      }
      whereBuilder.append(" ");
      whereBuilder.append("from LineItem li ");
      whereBuilder.append(" where i.invoice_id = li.invoice_id ");
      whereBuilder.append("GROUP BY li.notification_date HAVING ");
      whereBuilder.append(" li.notification_date =");
      whereBuilder.append(TextConverter.dbQuote(notifiedDateFrom, "mm/dd/yyyy"));
      whereBuilder.append(" ) ");
    }

    // notified date between
    if (notifiedDateFrom != null && notifiedDateTo != null) {
      if (first) {
        whereBuilder.append(" EXISTS ( select max(li.notification_date) ");
        first = false;
      } else {
        whereBuilder.append(" AND EXISTS ( select max(li.notification_date) ");
      }
      whereBuilder.append(" ");
      whereBuilder.append("from LineItem li ");
      whereBuilder.append(" where i.invoice_id = li.invoice_id ");
      whereBuilder.append("GROUP BY li.notification_date HAVING ");
      whereBuilder.append(" li.notification_date between ");
      whereBuilder.append(TextConverter.dbQuote(notifiedDateFrom, "mm/dd/yyyy"));
      whereBuilder.append(" AND ");
      whereBuilder.append(TextConverter.dbQuote(notifiedDateTo, "mm/dd/yyyy"));
      whereBuilder.append(" ) ");
    }

    // No notified date
    if (noNotifiedDate != null && noNotifiedDate.equals("no")) {
      if (first) {
        whereBuilder.append(" EXISTS ( select li.notification_date ");
        first = false;
      } else {
        whereBuilder.append(" AND EXISTS ( select li.notification_date ");
      }
      whereBuilder.append("from LineItem li ");
      whereBuilder.append("where i.invoice_id = li.invoice_id ");
      whereBuilder.append("AND li.notification_date IS NULL AND li.lineitem_type = 'stock_charge')");
      whereBuilder.append(" AND NOT EXISTS ( select li.notification_date ");
      whereBuilder.append("from LineItem li ");
      whereBuilder.append("where i.invoice_id = li.invoice_id ");
      whereBuilder.append("AND li.notification_date is not NULL AND li.lineitem_type = 'stock_charge')");
    } else if (noNotifiedDate != null && noNotifiedDate.equals("yes")) {
      if (first) {
        whereBuilder.append(" EXISTS ( select li.notification_date ");
        first = false;
      } else {
        whereBuilder.append(" AND EXISTS ( select li.notification_date ");
      }
      whereBuilder.append("from LineItem li ");
      whereBuilder.append("where i.invoice_id = li.invoice_id ");
      whereBuilder.append("AND li.notification_date is not NULL AND li.lineitem_type = 'stock_charge')");
      whereBuilder.append(" AND NOT EXISTS ( select li.notification_date ");
      whereBuilder.append("from LineItem li ");
      whereBuilder.append("where i.invoice_id = li.invoice_id ");
      whereBuilder.append("AND li.notification_date IS NULL AND li.lineitem_type = 'stock_charge')");
    }
    // updated date =
    if (updatedDateFrom != null && updatedDateTo == null) {
      if (first) {
        whereBuilder.append(" date_last_modified = ");
        first = false;
      } else {
        whereBuilder.append(" AND date_last_modified = ");
      }
      whereBuilder.append(TextConverter.dbQuote(updatedDateFrom, "mm/dd/yyyy"));
    }

    // updated date between
    if (updatedDateFrom != null && updatedDateTo != null) {
      if (first) {
        whereBuilder.append(" date_last_modified between ");
        first = false;
      } else {
        whereBuilder.append(" AND date_last_modified between ");
      }
      whereBuilder.append(TextConverter.dbQuote(updatedDateFrom, "mm/dd/yyyy"));
      whereBuilder.append(" AND ");
      whereBuilder.append(TextConverter.dbQuote(updatedDateTo, "mm/dd/yyyy"));
    }

    // order number
    if (orderNumber != null) {
      if (first) {
        whereBuilder.append(" order_number = ");
        first = false;
      } else {
        whereBuilder.append(" AND order_number = ");
      }
      whereBuilder.append(orderNumber);
    }

    // invoice id range or single -- combine into one id, use "From" by preference
    invoiceIDFrom = invoiceIDFrom == null ? invoiceId : invoiceIDFrom;
    if (invoiceIDFrom != null && invoiceIDTo == null) {
      if (first) {
        whereBuilder.append(" i.invoice_id = ");
        first = false;
      } else {
        whereBuilder.append(" AND i.invoice_id = ");
      }
      whereBuilder.append(invoiceIDFrom);
    }

    if (invoiceIDFrom != null && invoiceIDTo != null) {
      if (first) {
        whereBuilder.append(" i.invoice_id between ");
        first = false;
      } else {
        whereBuilder.append(" AND i.invoice_id between ");
      }
      whereBuilder.append(invoiceIDFrom);
      whereBuilder.append(" AND ");
      whereBuilder.append(invoiceIDTo);
    }

    // unpaid line item type
    if (lineItemType != null && !lineItemType.equalsIgnoreCase("any")) {
      if (first) {
        whereBuilder.append(" i.status = 'in_progress' ");
        first = false;
      } else {
        whereBuilder.append(" AND i.status = 'in_progress' ");
      }
      whereBuilder.append(" AND EXISTS ( SELECT 'X' FROM ");
      whereBuilder.append(" LineItem li, Stock s ");
      whereBuilder.append(" WHERE s.stock_id = li.stock_id ");
      whereBuilder.append(" AND li.invoice_id = i.invoice_id ");
      whereBuilder.append(" AND li.status = 'unpaid' ");
      if (lineItemType.equalsIgnoreCase("seed")) {
        whereBuilder.append(" AND s.is_seed = 'T' ) ");
      } else if (lineItemType.equalsIgnoreCase("dna")) {
        whereBuilder.append(" AND s.is_seed = 'F' ) ");
      } else if (lineItemType.equalsIgnoreCase("seed and dna")) {
        whereBuilder.append(" AND s.is_seed = 'F' ) ");
        whereBuilder.append(" AND EXISTS ( SELECT 'X' FROM ");
        whereBuilder.append(" LineItem li, Stock s ");
        whereBuilder.append(" WHERE s.stock_id = li.stock_id ");
        whereBuilder.append(" AND li.invoice_id = i.invoice_id ");
        whereBuilder.append(" AND li.status = 'unpaid' ");
        whereBuilder.append(" AND s.is_seed = 'T' ) ");
      } else if (lineItemType.equalsIgnoreCase("seed or dna")) {
        whereBuilder.append(" AND s.is_seed IN ( 'T', 'F' ) ) ");
      } else {
        whereBuilder.append(" ) ");
      }
    }

    return (getSelectClause() + getFromClause() + getWhereClause());
  }
}
