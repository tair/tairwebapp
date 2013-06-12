// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.handler;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.jboss.logging.Logger;
import org.tair.abrc.order.Const;
import org.tair.abrc.order.Payment;


/**
 * Web application that handles CyberSource payments for ABRC stocks. The
 * application caches received payments in memory in a set for comparison to
 * avoid excessive querying of the database for repeated receipts of the same
 * payment information (potential for denial of service attack).
 * 
 * @author Tom Meyer and Bob Muller
 */
public class PaymentInfoHandler extends HttpServlet {
  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;

  /**
   * The list of payments received from CyberSource so far since the web app was
   * started; cache to avoid querying the database unless necessary.
   */
  private static Set<Payment> receivedPayments = new HashSet<Payment>(10);

  /** Logger for this class */
  private static final Logger logger =
    Logger.getLogger(PaymentInfoHandler.class);

  /** The JNDI name for the database initialized once */
  String jndiName;

  /**
   * Initialize the servlet with JNDI information.
   */
  public void init(ServletConfig config) throws ServletException {
    jndiName = config.getInitParameter("jndiName");
    logger.debug("Attempting to initialize parameterized JNDI name " + jndiName);
    if (jndiName == null) {
      jndiName = "java:jdbc/tair/Webwriter";
    }
    logger.info("Initialized " + jndiName);
  }

  /**
   * Service the servlet request.
   */
  public void service(HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {
    int tries = 10;
    while (!saveInfo(req) && tries-- > 0)
      try {
        Thread.sleep(6000);
      } catch (InterruptedException e) {
        // Ignore and exit
      }

    // Print "done" to the output page.
    PrintWriter out = res.getWriter();
    res.setContentType("text/plain");
    out.println("done");
  }

  /**
   * Save the payment information in the request.
   * 
   * @param req the HTTP request containing payment information
   * @return true if information successfully received, false otherwise
   */
  boolean saveInfo(HttpServletRequest req) {
    Map<?, ?> m = req.getParameterMap();
    Map<String, String> info = new HashMap<String, String>();
    for (Object k : m.keySet()) {
      Object v = m.get(k);
      if (k instanceof String
          && v instanceof String[]
          && ((String[])v).length > 0)
        info.put((String)k, ((String[])v)[0]);
    }
    info.put("pending_payment_token", req.getParameter("merchantDefinedData2"));
    logger.debug("Got pending payment token: "
                 + req.getParameter("merchantDefinedData2"));
    return saveInfo(new Payment(info));
  }

  /**
   * Save payment information to the database.
   * 
   * @param info the payment information to save
   * @return true if information successfully received, false if not
   */
  boolean saveInfo(Payment info) {
    Connection conn = null;
    // Exits with false if exception occurs
    boolean returnCode = false;

    try {
      InitialContext ctx = new InitialContext();
      DataSource ds = (DataSource)ctx.lookup(jndiName);
      conn = ds.getConnection();
      boolean exists = receivedPayments.contains(info);

      // Insert the payment if not already in the database
      if (conn != null && !exists && !queryPayment(info, conn)) {
        insertPayment(info, conn);
        conn.commit();
      }

      // Set the return to true to indicate successful completion.
      returnCode = true;
    } catch (Exception e) {
      // Log and ignore
      logger.error("Error while saving information: " + e.getMessage(), e);
    } finally {
      try {
        if (conn != null) {
          conn.close();
        }
      } catch (Exception e) {
        // Log and ignore
        logger.error("Error closing JDBC connection", e);
      }
    }
    return returnCode;
  }

  /**
   * Insert a payment into the database.
   * 
   * @param info the payment to insert
   * @param conn the SQL connection
   * @throws SQLException when there is a problem inserting the row
   */
  private void insertPayment(Payment info, Connection conn) throws SQLException {
    String query;
    PreparedStatement stmt;

    query =
      "INSERT INTO "
          + Const.PAYMENT_INFO_TABLE
          + " (decision,decision_publicSignature,orderAmount,orderAmount_publicSignature,orderCurrency,orderCurrency_publicSignature,orderNumber,orderNumber_publicSignature,orderPage_requestToken,orderPage_transactionType,requestID,pending_payment_token) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
    logger.debug("Inserting payment information to database");
    logger.debug(query);
    logger.info("Inserting payment decision: "
                + info.decision
                + ", order number: "
                + info.orderNumber
                + ", token: "
                + info.pending_payment_token);
    stmt = conn.prepareStatement(query);
    stmt.setString(1, info.decision);
    stmt.setString(2, info.decision_publicSignature);
    stmt.setString(3, info.orderAmount);
    stmt.setString(4, info.orderAmount_publicSignature);
    stmt.setString(5, info.orderCurrency);
    stmt.setString(6, info.orderCurrency_publicSignature);
    stmt.setString(7, info.orderNumber);
    stmt.setString(8, info.orderNumber_publicSignature);
    stmt.setString(9, info.orderPage_requestToken);
    stmt.setString(10, info.orderPage_transactionType);
    stmt.setString(11, info.requestID);
    stmt.setString(12, info.pending_payment_token);
    stmt.executeUpdate();
    stmt.close();
    conn.commit();
  }

  /**
   * Query a payment from payment information to see whether the payment is
   * already in the database.
   * 
   * @param info the payment information
   * @param conn the SQL connection
   * @return true if the payment exists, false if not
   * @throws SQLException when there is a problem querying the database
   */
  private boolean queryPayment(Payment info, Connection conn)
      throws SQLException {
    boolean exists = false;
    String query = null;
    PreparedStatement stmt = null;

    // Add the payment to the list of payments received.
    receivedPayments.add(info);
    // Query to see whether the payment is already saved.
    ResultSet rs;
    try {
      query =
        "SELECT * FROM "
            + Const.PAYMENT_INFO_TABLE
            + " WHERE decision = ? AND decision_publicSignature = ? AND "
            + "orderAmount = ? AND orderAmount_publicSignature = ? AND "
            + "orderCurrency = ? AND orderCurrency_publicSignature = ? AND "
            + "orderNumber = ? AND orderNumber_publicSignature = ? AND "
            + "orderPage_requestToken = ? AND orderPage_transactionType = ? AND "
            + "requestID = ? AND pending_payment_token = ?";
      stmt = conn.prepareStatement(query);
      stmt.setString(1, info.decision);
      stmt.setString(2, info.decision_publicSignature);
      stmt.setString(3, info.orderAmount);
      stmt.setString(4, info.orderAmount_publicSignature);
      stmt.setString(5, info.orderCurrency);
      stmt.setString(6, info.orderCurrency_publicSignature);
      stmt.setString(7, info.orderNumber);
      stmt.setString(8, info.orderNumber_publicSignature);
      stmt.setString(9, info.orderPage_requestToken);
      stmt.setString(10, info.orderPage_transactionType);
      stmt.setString(11, info.requestID);
      stmt.setString(12, info.pending_payment_token);
      rs = stmt.executeQuery();
      exists = rs.next();
    } finally {
      stmt.close(); // closes result set as well
    }
    return exists;
  }
}
