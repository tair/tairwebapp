/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.payment;


import java.math.BigDecimal;
import java.sql.Timestamp;

import org.tair.search.AbstractSearchResult;


/**
 * A data transfer object (DTO) that represents the results of a payment search.
 * This replaces the use of a database results table. This class is just used
 * for the download function, it has not yet been integrated with the new search
 * code to handle payment searches and sorts.
 * 
 * @author Robert J. Muller
 */
public class PaymentSearchResult extends AbstractSearchResult<Long> {
  /** Serial version UID for serializable class */
  private static final long serialVersionUID = 1L;

  private final Long paymentId;
  private final Long invoiceId;
  private final Timestamp paymentDate;
  private final BigDecimal paymentAmount;
  private final String paymentType;
  private final String verificationCode;
  private final String paymentRefId;
  private final String nameOnCheck;
  private final String checkNumber;
  private final Timestamp checkDate;
  private final Long orderNumber;

  // query identification fields
  private final String queryId;
  private final Timestamp currentDate;

  // row identifiers
  private final Integer rowId;
  private Integer sortRowId;

  /**
   * Create a PaymentSearchResult object.
   * 
   * @param paymentId the unique identifier for the payment
   * @param invoiceId the unique identifier for the paid invoice
   * @param paymentDate the date on which the payment was made
   * @param paymentAmount the amount of the payment
   * @param paymentType the kind of payment (check or credit card)
   * @param verificationCode the CyberSource verification code for credit card
   * @param paymentRefId the CyberSource reference id
   * @param nameOnCheck the name on the check
   * @param checkNumber the number of the check
   * @param checkDate the date on the check
   * @param orderNumber the order number on the invoice
   * @param queryId the internal query id in the results table (not used)
   * @param currentDate the current date of the result (not used)
   * @param rowId the ordinal number of this result in the set of results in the
   *          original query
   * @param sortRowId the ordinal number of this result in the sorted set of
   *          results (not used)
   */
  public PaymentSearchResult(Long paymentId,
                             Long invoiceId,
                             Timestamp paymentDate,
                             BigDecimal paymentAmount,
                             String paymentType,
                             String verificationCode,
                             String paymentRefId,
                             String nameOnCheck,
                             String checkNumber,
                             Timestamp checkDate,
                             Long orderNumber,
                             String queryId,
                             Timestamp currentDate,
                             Integer rowId,
                             Integer sortRowId) {
    this.paymentId = paymentId;
    this.invoiceId = invoiceId;
    this.paymentDate = paymentDate;
    this.paymentAmount = paymentAmount;
    this.paymentType = paymentType;
    this.verificationCode = verificationCode;
    this.paymentRefId = paymentRefId;
    this.nameOnCheck = nameOnCheck;
    this.checkNumber = checkNumber;
    this.checkDate = checkDate;
    this.orderNumber = orderNumber;
    this.queryId = queryId;
    this.currentDate = currentDate;
    this.rowId = rowId;
    this.sortRowId = sortRowId;
  }

  @Override
  public StringBuilder getExportHeader(StringBuilder builder) {
    builder.append("payment_date");
    builder.append("\t");
    builder.append("payment_amount");
    builder.append("\t");
    builder.append("invoice_id");
    builder.append("\t");
    builder.append("payment_type");
    builder.append("\t");
    builder.append("verification_code");
    builder.append("\t");
    builder.append("name_on_check");
    builder.append("\t");
    builder.append("check_number");
    builder.append("\t");
    builder.append("check_date");
    builder.append("\t");
    builder.append("payment_ref_id");
    builder.append("\t");
    builder.append("order_number");
    builder.append("\t");
    builder.append("sort_row_id");
    builder.append("\t");
    builder.append("row_id");
    builder.append("\t");
    builder.append("payment_id");
    builder.append("\n");
    return builder;
  }

  @Override
  public StringBuilder getExport(StringBuilder builder) {
    builder.append(getDateString(paymentDate));
    builder.append("\t");
    builder.append(getBigDecimalString(paymentAmount));
    builder.append("\t");
    builder.append(getLongString(invoiceId));
    builder.append("\t");
    builder.append(paymentType);
    builder.append("\t");
    builder.append(verificationCode);
    builder.append("\t");
    builder.append(nameOnCheck);
    builder.append("\t");
    builder.append(checkNumber);
    builder.append("\t");
    builder.append(getDateString(checkDate));
    builder.append("\t");
    builder.append(paymentRefId);
    builder.append("\t");
    builder.append(getLongString(orderNumber));
    builder.append("\t");
    builder.append(sortRowId);
    builder.append("\t");
    builder.append(rowId);
    builder.append("\t");
    builder.append(paymentId);
    builder.append("\n");

    return builder;
  }

  @Override
  public Long getId() {
    return paymentId;
  }

  @Override
  public void setSortRowId(Integer id) {
    sortRowId = id;    
  }

  /**
   * Get the paymentId.
   * @return a paymentId
   */
  public Long getPaymentId() {
    return paymentId;
  }

  /**
   * Get the invoiceId.
   * @return a invoiceId
   */
  public Long getInvoiceId() {
    return invoiceId;
  }

  /**
   * Get the paymentDate.
   * @return a paymentDate
   */
  public Timestamp getPaymentDate() {
    return paymentDate;
  }

  /**
   * Get the paymentAmount.
   * @return a paymentAmount
   */
  public BigDecimal getPaymentAmount() {
    return paymentAmount;
  }

  /**
   * Get the paymentType.
   * @return a paymentType
   */
  public String getPaymentType() {
    return paymentType;
  }

  /**
   * Get the verificationCode.
   * @return a verificationCode
   */
  public String getVerificationCode() {
    return verificationCode;
  }

  /**
   * Get the paymentRefId.
   * @return a paymentRefId
   */
  public String getPaymentRefId() {
    return paymentRefId;
  }

  /**
   * Get the nameOnCheck.
   * @return a nameOnCheck
   */
  public String getNameOnCheck() {
    return nameOnCheck;
  }

  /**
   * Get the checkNumber.
   * @return a checkNumber
   */
  public String getCheckNumber() {
    return checkNumber;
  }

  /**
   * Get the checkDate.
   * @return a checkDate
   */
  public Timestamp getCheckDate() {
    return checkDate;
  }

  /**
   * Get the orderNumber.
   * @return a orderNumber
   */
  public Long getOrderNumber() {
    return orderNumber;
  }

  /**
   * Get the queryId.
   * @return a queryId
   */
  public String getQueryId() {
    return queryId;
  }

  /**
   * Get the currentDate.
   * @return a currentDate
   */
  public Timestamp getCurrentDate() {
    return currentDate;
  }

  /**
   * Get the rowId.
   * @return a rowId
   */
  public Integer getRowId() {
    return rowId;
  }

  /**
   * Get the sortRowId.
   * @return a sortRowId
   */
  public Integer getSortRowId() {
    return sortRowId;
  }
}
