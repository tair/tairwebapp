/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.payment;


import java.math.BigDecimal;
import java.sql.Timestamp;

import org.tair.search.AbstractSearchResult;


/**
 * A data transfer object (DTO) that represents the results of an invoice line
 * item search. This replaces the use of a database results table.
 * 
 * @author Robert J. Muller
 */
public class InvoiceLineItemSearchResult extends AbstractSearchResult<Long> {
  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;
  private final Long invoiceId;
  private final String stockNumber;
  private final Long orderNumber;
  private final String status;
  private final String type;
  private final Long paymentId;
  private final BigDecimal amount;
  private final Timestamp notificationDate;
  private final Long lineItemId;
  private final Long stockId;
  private final Long ordersId;

  /**
   * Create a InvoiceLineItemSearchResult object.
   * 
   * @param invoiceId unique identifier for the invoice
   * @param stockNumber text stock identifier
   * @param orderNumber unique displayable identifier for the order
   * @param status status of the line item (paid, unpaid)
   * @param type type of the line item (stock_charge, order_charge,
   *          express_shipping_charge)
   * @param paymentId unique identifier for the payment that paid the line item
   * @param amount monetary amount of the line item charge
   * @param notificationDate date on which the ordering community member was
   *          notified of the charge
   * @param lineItemId unique identifier for the line item
   * @param stockId unique numeric identifier for the stock
   * @param ordersId unique identifier for the order
   */
  public InvoiceLineItemSearchResult(Long invoiceId,
                                     String stockNumber,
                                     Long orderNumber,
                                     String status,
                                     String type,
                                     Long paymentId,
                                     BigDecimal amount,
                                     Timestamp notificationDate,
                                     Long lineItemId,
                                     Long stockId,
                                     Long ordersId) {
    this.invoiceId = invoiceId;
    this.stockNumber = stockNumber;
    this.orderNumber = orderNumber;
    this.status = status;
    this.type = type;
    this.paymentId = paymentId;
    this.amount = amount;
    this.notificationDate = notificationDate;
    this.lineItemId = lineItemId;
    this.stockId = stockId;
    this.ordersId = ordersId;
  }

  /**
   * Get the invoiceId.
   * 
   * @return a invoiceId
   */
  public Long getInvoiceId() {
    return invoiceId;
  }

  /**
   * Get the stockNumber.
   * 
   * @return a stockNumber
   */
  public String getStockNumber() {
    return stockNumber;
  }

  /**
   * Get the orderNumber.
   * 
   * @return a orderNumber
   */
  public Long getOrderNumber() {
    return orderNumber;
  }

  /**
   * Get the status.
   * 
   * @return a status
   */
  public String getStatus() {
    return status;
  }

  /**
   * Get the type.
   * 
   * @return a type
   */
  public String getType() {
    return type;
  }

  /**
   * Get the paymentId.
   * 
   * @return a paymentId
   */
  public Long getPaymentId() {
    return paymentId;
  }

  /**
   * Get the amount.
   * 
   * @return a amount
   */
  public BigDecimal getAmount() {
    return amount;
  }

  /**
   * Get the notificationDate.
   * 
   * @return a notificationDate
   */
  public Timestamp getNotificationDate() {
    return notificationDate;
  }

  /**
   * Get the lineItemId.
   * 
   * @return a lineItemId
   */
  public Long getLineItemId() {
    return lineItemId;
  }

  /**
   * Get the stockId.
   * 
   * @return a stockId
   */
  public Long getStockId() {
    return stockId;
  }

  /**
   * Get the ordersId.
   * 
   * @return a ordersId
   */
  public Long getOrdersId() {
    return ordersId;
  }

  @Override
  public StringBuilder getExportHeader(StringBuilder builder) {
    builder.append("Invoice Number");
    builder.append("\t");
    builder.append("Stock #");
    builder.append("\t");
    builder.append("Order #");
    builder.append("\t");
    builder.append("Status");
    builder.append("\t");
    builder.append("Type");
    builder.append("\t");
    builder.append("Payment Id");
    builder.append("\t");
    builder.append("Amount");
    builder.append("\t");
    builder.append("Notification date");
    builder.append("\t");
    builder.append("Line Item Id");
    builder.append("\t");
    builder.append("Stock Id");
    builder.append("\t");
    builder.append("Orders Id");
    builder.append("\n");
    return builder;
  }

  @Override
  public StringBuilder getExport(StringBuilder builder) {
    builder.append(invoiceId);
    builder.append("\t");
    builder.append(stockNumber);
    builder.append("\t");
    builder.append(getLongString(orderNumber));
    builder.append("\t");
    builder.append(status);
    builder.append("\t");
    builder.append(type);
    builder.append("\t");
    builder.append(getLongString(paymentId));
    builder.append("\t");
    builder.append(getBigDecimalString(amount));
    builder.append("\t");
    builder.append(getDateString(notificationDate));
    builder.append("\t");
    builder.append(getLongString(lineItemId));
    builder.append("\t");
    builder.append(getLongString(stockId));
    builder.append("\t");
    builder.append(getLongString(ordersId));
    builder.append("\n");
    return builder;
  }

  @Override
  public Long getId() {
    return lineItemId;
  }

  @Override
  public void setSortRowId(Integer id) {
    // Does nothing, no sort row id support for this result type    
  }
}
