/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcOrders;


/**
 * InvoiceSearcherServlet searches for an invoice and redirects to the invoice
 * detail page.
 */
public class InvoiceSearcherServlet extends HttpServlet {
  /** Serial version UID for Serializable object */
  private static final long serialVersionUID = 1L;
  private static final Logger logger =
    Logger.getLogger(InvoiceSearcherServlet.class);
  private static final String SEARCH =
    "/servlets/Search?type=invoice&orders_id=%d&search_action=userdetail";
  private static final String NOT_FOUND = "/jsp/abrc/invoice_not_found.jsp";

  public void service(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    String orderNumber = req.getParameter("order_number");
    String invoiceID = req.getParameter("invoice_id");
    res.sendRedirect(getInvoiceDetailPage(orderNumber, invoiceID));
  }

  /**
   * Construct a URL for either the invoice detail page for the requested
   * invoice or for the invoice-not-found page.
   * 
   * @param orderNumber the order number for the invoice
   * @param invoiceID the invoice id for which to search
   * @return the URL for the appropriate invoice search
   */
  private String getInvoiceDetailPage(String orderNumber, String invoiceID) {
    Long id = null;
    DBconnection conn = null;
    orderNumber = orderNumber == null ? "" : orderNumber.trim();
    invoiceID = invoiceID == null ? "" : invoiceID.trim();

    try {
      conn = DBReadManager.getInstance().get_connection();
      if (orderNumber.matches("\\d+")) {
        id = TfcOrders.translateOrderNumber(conn, new Long(orderNumber));
      }
      if (invoiceID.matches("\\d+")) {
        id = TfcInvoice.translateInvoiceID(conn, new Long(invoiceID));
      }
    } catch (Exception e) {
      // Log and ignore exception.
      logger.error("Invoice Searcher Servlet: " + e.getMessage(), e);
    } finally {
      if (conn != null)
        DBReadManager.return_connection(conn);
    }

    // For non-null ids, embed the id in the search URL using format.
    return id == null ? NOT_FOUND : String.format(SEARCH, id);
  }
}
