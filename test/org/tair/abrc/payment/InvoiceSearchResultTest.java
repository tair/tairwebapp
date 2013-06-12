/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.payment;


import static org.junit.Assert.assertTrue;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;

import org.junit.Test;


/**
 * Test the InvoiceSearchResult class, a search result DTO for Invoice Search
 * 
 * @author Robert J. Muller
 */
public class InvoiceSearchResultTest {
  private static final Long invoiceId = new Long("1");
  private static final BigInteger organizationId = new BigInteger("2");
  private static final Timestamp dateInvoiceCreated =
    new Timestamp(System.currentTimeMillis());
  private static final Long ordersId = 3L;
  private static final Long orderNumber = 4L;
  private static final BigDecimal invoiceTotal = new BigDecimal("45.00");
  private static final String paymentMethod = "credit";
  private static final String queryId = "10";
  private static final Timestamp currentDate =
    new Timestamp(System.currentTimeMillis());
  private Timestamp lastNotifiedDate =
    new Timestamp(System.currentTimeMillis());
  private Timestamp lastShippedDate = new Timestamp(System.currentTimeMillis());
  private BigDecimal balanceDue = new BigDecimal("100.00");
  private BigDecimal authAmount = new BigDecimal("100.00");
  private BigDecimal eligibleAmount = new BigDecimal("50.00");
  private String paymentRefId = "ABRC23";
  private String verificationCode = "AAAABBBBCCCC";
  private Timestamp dateLastModified =
    new Timestamp(System.currentTimeMillis());
  private Timestamp invoiceDate = new Timestamp(System.currentTimeMillis());
  private String personName = "Test Person";
  private String labName = "Test Lab";
  private String invoiceStatus = "unpaid";

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#InvoiceSearchResult(java.math.BigInteger, java.math.BigInteger, java.sql.Timestamp, java.lang.Long, java.lang.Long, java.math.BigDecimal, java.lang.String, java.lang.String, java.sql.Timestamp)}
   * .
   */
  @Test
  public void testInvoiceSearchResult() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
  }

  /**
   * Create a test InvoiceSearchResult object.
   * 
   * @return an InvoiceSearchResult object
   */
  private InvoiceSearchResult createResult() {

    InvoiceSearchResult result =
      new InvoiceSearchResult(invoiceId,
                              personName,
                              labName,
                              organizationId,
                              invoiceDate,
                              invoiceStatus,
                              orderNumber,
                              lastNotifiedDate,
                              lastShippedDate,
                              invoiceTotal,
                              balanceDue,
                              eligibleAmount,
                              paymentMethod,
                              ordersId,
                              authAmount,
                              paymentRefId,
                              verificationCode,
                              dateLastModified,
                              dateInvoiceCreated,
                              queryId,
                              currentDate,
                              0,
                              0);
    return result;
  }

  /**
   * Test the Sort enum fromString method
   */
  @Test
  public void testEnumFromString() {
    InvoiceSearchResult.Sort sort = InvoiceSearchResult.Sort.ORDER;
    InvoiceSearchResult.Sort sort2 =
      InvoiceSearchResult.Sort.fromString("order");
    assertTrue("Could not create Sort enum from string", sort.equals(sort2));
  }

  /**
   * Test the Sort enum toString method
   */
  @Test
  public void testEnumToString() {
    InvoiceSearchResult.Sort sort = InvoiceSearchResult.Sort.ORDER;
    assertTrue("Could not create Sort enum from string",
               sort.toString().equalsIgnoreCase("order"));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getInvoiceId()}.
   */
  @Test
  public void testGetInvoiceId() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get invoice id",
               result.getInvoiceId().equals(invoiceId));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getOrganizationId()}.
   */
  @Test
  public void testGetOrganizationId() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get organization id",
               result.getOrganizationId().equals(organizationId));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getDateInvoiceCreated()}.
   */
  @Test
  public void testGetDateInvoiceCreated() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get invoice created date",
               result.getDateInvoiceCreated().equals(dateInvoiceCreated));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getOrdersId()}.
   */
  @Test
  public void testGetOrdersId() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get orders id", result.getOrdersId().equals(ordersId));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getOrderNumber()}.
   */
  @Test
  public void testGetOrderNumber() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get order number",
               result.getOrderNumber().equals(orderNumber));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getInvoiceTotal()}.
   */
  @Test
  public void testGetInvoiceTotal() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get invoice total",
               result.getInvoiceTotal().equals(invoiceTotal));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getPaymentMethod()}.
   */
  @Test
  public void testGetPaymentMethod() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get payment method",
               result.getPaymentMethod().equals(paymentMethod));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getQueryId()}.
   */
  @Test
  public void testGetQueryId() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get query id", result.getQueryId().equals(queryId));
  }

  /**
   * Test method for
   * {@link org.tair.abrc.payment.InvoiceSearchResult#getCurrentDate()}.
   */
  @Test
  public void testGetCurrentDate() {
    InvoiceSearchResult result = createResult();
    assertTrue("Could not create result", result != null);
    assertTrue("Could not get current date",
               result.getCurrentDate().equals(currentDate));
  }
}
