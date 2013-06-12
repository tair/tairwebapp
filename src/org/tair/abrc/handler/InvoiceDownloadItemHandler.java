/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.tair.abrc.payment.InvoiceLineItemSearchResult;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * Create a tab-delimited export string from line items selected from the detail
 * summary page. The class queries all the line items directly rather than
 * mediating it through a search or some other external mechanism.
 * 
 * @author Robert J. Muller
 */
public class InvoiceDownloadItemHandler extends InvoiceSearchHandler {
  private static final Logger logger =
    Logger.getLogger(InvoiceDownloadItemHandler.class);

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    extractParameters(request);

    if (ids == null || ids.isEmpty()) {
      throw new InvalidFormException("No rows selected for download");
    }

    // Query the line items for the selected invoices.
    List<InvoiceLineItemSearchResult> results = queryItems();

    // Build the export string.
    StringBuilder builder = new StringBuilder();
    boolean addedHeader = false;
    for (InvoiceLineItemSearchResult result : results) {
      if (!addedHeader) {
        result.getExportHeader(builder);
        addedHeader = true;
      }
      result.getExport(builder);
    }

    RequestHandlerResponse response = new RequestHandlerResponse();
    // Setting downloadText tells SearchServlet to download the text as a file
    // and then redisplay the current page.
    response.setAttribute("downloadText", builder.toString());
    // Tell the response handler to name the file "download", no extension
    response.setAttribute("downloadName", "invoice_item");

    return response;
  }

  /**
   * Query all the line items for all the invoices in the id list ordered by
   * invoice_id and line_item_id.
   * 
   * @return a list of line items.
   * @throws SQLException when there is a problem executing the query
   */
  private List<InvoiceLineItemSearchResult> queryItems() throws SQLException {
    DBconnection connection = null;
    List<InvoiceLineItemSearchResult> list =
      new ArrayList<InvoiceLineItemSearchResult>(ids.size());
    try {
      connection = DBWriteManager.getInstance().getSearchConnection();
      // The query outer joins the Orders and Stock table to get the non-stock
      // line items (charges such as stock and express charges).
      String query =
        "SELECT l.invoice_id, s.name as stock_number, CASE WHEN o.order_number IS NOT NULL THEN o.order_number ELSE (SELECT order_number FROM Invoice i JOIN Orders o ON i.orders_id = o.orders_id WHERE i.invoice_id = l.invoice_id) END AS order_number, l.status, l.lineitem_type, l.payment_id, l.amount, l.notification_date, l.line_item_id, l.stock_id, l.orders_id FROM LineItem l LEFT JOIN Stock s ON l.stock_id = s.stock_id LEFT JOIN Orders o ON l.orders_id = o.orders_id WHERE l.invoice_id = ? ORDER BY l.invoice_id, l.line_item_id";
      logger.debug("Queyring selected invoice line items: " + query);
      connection.setQuery(query);
      for (Long id : ids) {
        connection.setQueryVariable(1, id);
        ResultSet rs = connection.getResultSet();
        while (rs.next()) {
          InvoiceLineItemSearchResult result =
            new InvoiceLineItemSearchResult(rs.getLong("invoice_id"),
                                            rs.getString("stock_number"),
                                            rs.getLong("order_number"),
                                            rs.getString("status"),
                                            rs.getString("lineitem_type"),
                                            rs.getLong("payment_id"),
                                            rs.getBigDecimal("amount"),
                                            rs.getTimestamp("notification_date"),
                                            rs.getLong("line_item_id"),
                                            rs.getLong("stock_id"),
                                            rs.getLong("orders_id"));
          list.add(result);
        }
        rs.close();
      }
      connection.releaseResources();
    } finally {
      DBWriteManager.return_connection(connection);
    }
    return list;
  }
}
