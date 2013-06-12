/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.payment;


import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

import org.tair.search.AbstractSearchResult;


/**
 * A data transfer object (DTO) that represents the results of an invoice
 * search. This replaces the use of a database results table. The class also
 * provides a Sort enum for supported sort columns that makes available the
 * appropriate comparator for the sort.
 * 
 * @author Robert J. Muller
 */
public class InvoiceSearchResult extends AbstractSearchResult<Long> {
  /** Serial version UID for serializable class */
  private static final long serialVersionUID = 1L;
  private final Long invoiceId;
  private final String personName;
  private final String labName;
  private final BigInteger organizationId;
  private final Timestamp invoiceDate;
  private String invoiceStatus;
  private final Long orderNumber;
  private final Timestamp lastNotifiedDate;
  private final Timestamp lastShippedDate;
  private final BigDecimal invoiceTotal;
  private final BigDecimal balanceDue;
  private final BigDecimal eligibleAmount;

  private final String paymentMethod;
  private final Long ordersId;
  private final BigDecimal authAmount;
  private final String paymentRefId;
  private final String verificationCode;
  private final Timestamp dateLastModified;
  private final Timestamp dateInvoiceCreated;

  // query identification fields
  private final String queryId;
  private final Timestamp currentDate;
  
  // row identifiers
  private final Integer rowId;
  private Integer sortRowId;

  /**
   * Enumerated constants for the supported sorts on Invoice Result collections
   * 
   * @author Robert J. Muller
   */
  public enum Sort {
    /** invoice type alphabetical ascending (credit, po) */
    TYPE,
    /** date invoice created ascending */
    CREATED,
    /** date invoice created descending */
    CREATED_DESC,
    /** invoice id ascending */
    ID,
    /** invoice id descending */
    ID_DESC,
    /** order number ascending */
    ORDER,
    /** order number descending */
    ORDER_DESC,
    /** invoice total ascending */
    TOTAL,
    /** invoice total descending */
    TOTAL_DESC;

    /** Comparator for payment method (type), ascending alphabetical order */
    private class TypeComparator implements Comparator<InvoiceSearchResult>,
        Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o1.paymentMethod.compareTo(o2.paymentMethod);
      }
    }

    /** Comparator for date invoice created ascending */
    private class CreatedComparator implements Comparator<InvoiceSearchResult>,
        Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o1.dateInvoiceCreated.compareTo(o2.dateInvoiceCreated);
      }
    }

    /** Comparator for date invoice created descending */
    private class CreatedDescComparator implements
        Comparator<InvoiceSearchResult>, Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o2.dateInvoiceCreated.compareTo(o1.dateInvoiceCreated);
      }
    }

    /** Comparator for invoice id ascending */
    private class IdComparator implements Comparator<InvoiceSearchResult>,
        Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o1.invoiceId.compareTo(o2.invoiceId);
      }
    }

    /** Comparator for invoice id descending */
    private class IdDescComparator implements Comparator<InvoiceSearchResult>,
        Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o2.invoiceId.compareTo(o1.invoiceId);
      }
    }

    /** Comparator for order number ascending */
    private class OrderNumberComparator implements
        Comparator<InvoiceSearchResult>, Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o1.orderNumber.compareTo(o2.orderNumber);
      }
    }

    /** Comparator for order number descending */
    private class OrderNumberDescComparator implements
        Comparator<InvoiceSearchResult>, Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o2.orderNumber.compareTo(o1.orderNumber);
      }
    }

    /** Comparator for total ascending */
    private class TotalComparator implements Comparator<InvoiceSearchResult>,
        Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o1.invoiceTotal.compareTo(o2.invoiceTotal);
      }
    }

    /** Comparator for total descending */
    private class TotalDescComparator implements
        Comparator<InvoiceSearchResult>, Serializable {
      /** Serial version UID for serializable class */
      private static final long serialVersionUID = 1L;

      @Override
      public int compare(InvoiceSearchResult o1, InvoiceSearchResult o2) {
        return o2.invoiceTotal.compareTo(o1.invoiceTotal);
      }
    }

    /** static map of strings corresponding to enum constants */
    private static final Map<String, Sort> stringToEnum =
      new HashMap<String, Sort>();

    static {
      for (Sort sort : values()) {
        stringToEnum.put(sort.toString(), sort);
      }
    }

    /**
     * Get the enum constant from the equivalent upper-cased symbol. For
     * example, fromString("id") will return ID.
     * 
     * @param symbol the string representation of the symbol in any case
     * @return the corresponding enum constant
     */
    public static Sort fromString(String symbol) {
      return stringToEnum.get(symbol.toUpperCase());
    }

    /**
     * Get a comparator that implements the sort order required by the current
     * enum object.
     * 
     * @return a comparator of search results
     */
    public Comparator<InvoiceSearchResult> getComparator() {
      Comparator<InvoiceSearchResult> comparator = null;
      switch (this) {
      case TYPE:
        comparator = new TypeComparator();
        break;
      case CREATED:
        comparator = new CreatedComparator();
        break;
      case CREATED_DESC:
        comparator = new CreatedDescComparator();
        break;
      case ID:
        comparator = new IdComparator();
        break;
      case ID_DESC:
        comparator = new IdDescComparator();
        break;
      case ORDER:
        comparator = new OrderNumberComparator();
        break;
      case ORDER_DESC:
        comparator = new OrderNumberDescComparator();
        break;
      case TOTAL:
        comparator = new TotalComparator();
        break;
      case TOTAL_DESC:
        comparator = new TotalDescComparator();
        break;
      default:
        throw new RuntimeException("Unsupported invoice sort type: "
                                   + this.toString());
      }
      return comparator;
    }
  }

  /**
   * Create a InvoiceSearchResult object.
   * 
   * @param invoiceId unique identifier for the invoice
   * @param personName the name of the person to whom the invoice is addressed
   * @param labName name of the organization/laboratory
   * @param organizationId unique identifier for the organization
   * @param invoiceDate date of the invoice
   * @param invoiceStatus status of the invoice (in_progress, paid_in_full,
   *          cancelled, new)
   * @param orderNumber the user-visible unique identifier for the order
   * @param lastNotifiedDate the latest date on which the user was notified
   *          about a line item
   * @param lastShippedDate the latest date on which the user was shipped a
   *          stock in this order
   * @param invoiceTotal the total amount on the invoice
   * @param balanceDue the balance due on unpaid line items for this invoice
   * @param eligibleAmount the amount eligible for payment
   * @param paymentMethod the method of payment (purchase_order or credit_card)
   * @param ordersId the unique identifier for this order
   * @param authAmount the credit-card authorized amount, if any
   * @param paymentRefId the credit-card reference id, if any
   * @param verificationCode the credit-card verification code, if any
   * @param dateLastModified the date on which the invoice was last changed
   * @param dateInvoiceCreated the date on which the invoice was created
   * @param queryId unique identifier for the SQL query (hashcode)
   * @param currentDate timestamp at which this object was queried
   * @param rowId the index of the result in the original sort order
   * @param sortRowId the index of the result in the current sort order
   */
  public InvoiceSearchResult(Long invoiceId,
                             String personName,
                             String labName,
                             BigInteger organizationId,
                             Timestamp invoiceDate,
                             String invoiceStatus,
                             Long orderNumber,
                             Timestamp lastNotifiedDate,
                             Timestamp lastShippedDate,
                             BigDecimal invoiceTotal,
                             BigDecimal balanceDue,
                             BigDecimal eligibleAmount,
                             String paymentMethod,
                             Long ordersId,
                             BigDecimal authAmount,
                             String paymentRefId,
                             String verificationCode,
                             Timestamp dateLastModified,
                             Timestamp dateInvoiceCreated,
                             String queryId,
                             Timestamp currentDate,
                             Integer rowId,
                             Integer sortRowId) {
    this.invoiceId = invoiceId;
    this.personName = personName;
    this.labName = labName;
    this.organizationId = organizationId;
    this.invoiceDate = invoiceDate;
    this.invoiceStatus = invoiceStatus;
    this.orderNumber = orderNumber;
    this.lastNotifiedDate = lastNotifiedDate;
    this.lastShippedDate = lastShippedDate;
    this.invoiceTotal = invoiceTotal;
    this.balanceDue = balanceDue;
    this.eligibleAmount = eligibleAmount;
    this.paymentMethod = paymentMethod;
    this.ordersId = ordersId;
    this.authAmount = authAmount;
    this.paymentRefId = paymentRefId;
    this.verificationCode = verificationCode;
    this.dateLastModified = dateLastModified;
    this.dateInvoiceCreated = dateInvoiceCreated;
    this.queryId = queryId;
    this.currentDate = currentDate;
    this.rowId = rowId;
    this.setSortRowId(sortRowId);
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
   * Get the personName.
   * 
   * @return a personName
   */
  public String getPersonName() {
    return personName;
  }

  /**
   * Get the labName.
   * 
   * @return a labName
   */
  public String getLabName() {
    return labName;
  }

  /**
   * Get the organizationId.
   * 
   * @return a organizationId
   */
  public BigInteger getOrganizationId() {
    return organizationId;
  }

  /**
   * Get the invoiceDate.
   * 
   * @return a invoiceDate
   */
  public Timestamp getInvoiceDate() {
    return invoiceDate;
  }

  /**
   * Get the invoiceStatus.
   * 
   * @return a invoiceStatus
   */
  public String getInvoiceStatus() {
    return invoiceStatus;
  }

  /**
   * Set the invoiceStatus.
   * 
   * @param invoiceStatus a invoiceStatus
   */
  public void setInvoiceStatus(String invoiceStatus) {
    this.invoiceStatus = invoiceStatus;
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
   * Get the lastNotifiedDate.
   * 
   * @return a lastNotifiedDate
   */
  public Timestamp getLastNotifiedDate() {
    return lastNotifiedDate;
  }

  /**
   * Get the lastShippedDate.
   * 
   * @return a lastShippedDate
   */
  public Timestamp getLastShippedDate() {
    return lastShippedDate;
  }

  /**
   * Get the invoiceTotal.
   * 
   * @return a invoiceTotal
   */
  public BigDecimal getInvoiceTotal() {
    return invoiceTotal;
  }

  /**
   * Get the balanceDue.
   * 
   * @return a balanceDue
   */
  public BigDecimal getBalanceDue() {
    return balanceDue;
  }

  /**
   * Get the eligibleAmount.
   * 
   * @return a eligibleAmount
   */
  public BigDecimal getEligibleAmount() {
    return eligibleAmount;
  }

  /**
   * Get the paymentMethod.
   * 
   * @return a paymentMethod
   */
  public String getPaymentMethod() {
    return paymentMethod;
  }

  /**
   * Get the ordersId.
   * 
   * @return a ordersId
   */
  public Long getOrdersId() {
    return ordersId;
  }

  /**
   * Get the authAmount.
   * 
   * @return a authAmount
   */
  public BigDecimal getAuthAmount() {
    return authAmount;
  }

  /**
   * Get the paymentRefId.
   * 
   * @return a paymentRefId
   */
  public String getPaymentRefId() {
    return paymentRefId;
  }

  /**
   * Get the verificationCode.
   * 
   * @return a verificationCode
   */
  public String getVerificationCode() {
    return verificationCode;
  }

  /**
   * Get the dateLastModified.
   * 
   * @return a dateLastModified
   */
  public Timestamp getDateLastModified() {
    return dateLastModified;
  }

  /**
   * Get the dateInvoiceCreated.
   * 
   * @return a dateInvoiceCreated
   */
  public Timestamp getDateInvoiceCreated() {
    return dateInvoiceCreated;
  }

  /**
   * Get the queryId.
   * 
   * @return a queryId
   */
  public String getQueryId() {
    return queryId;
  }

  /**
   * Get the currentDate.
   * 
   * @return a currentDate
   */
  public Timestamp getCurrentDate() {
    return currentDate;
  }

  @Override
  public StringBuilder getExportHeader(StringBuilder builder) {
    builder.append("id");
    builder.append("\t");
    builder.append("lab");
    builder.append("\t");
    builder.append("organization_id");
    builder.append("\t");
    builder.append("invoice_date");
    builder.append("\t");
    builder.append("invoice_status");
    builder.append("\t");
    builder.append("order_number");
    builder.append("\t");
    builder.append("last_notified_date");
    builder.append("\t");
    builder.append("last_shipped_date");
    builder.append("\t");
    builder.append("invoice_total");
    builder.append("\t");
    builder.append("balance_due");
    builder.append("\t");
    builder.append("eligible_amount");
    builder.append("\t");
    builder.append("invoice_type");
    builder.append("\t");
    builder.append("sort_row_id");
    builder.append("\t");
    builder.append("row_id");
    builder.append("\t");
    builder.append("orders_id");
    builder.append("\t");
    builder.append("auth_amount");
    builder.append("\t");
    builder.append("payment_ref_id");
    builder.append("\t");
    builder.append("verification_code");
    builder.append("\t");
    builder.append("date_last_modified");
    builder.append("\t");
    builder.append("date_invoice_created");
    builder.append("\n");
    return builder;
  }

  @Override
  public StringBuilder getExport(StringBuilder builder) {
    builder.append(invoiceId);
    builder.append("\t");
    builder.append(labName);
    builder.append("\t");
    builder.append(organizationId);
    builder.append("\t");
    builder.append(getDateString(invoiceDate));
    builder.append("\t");
    builder.append(invoiceStatus);
    builder.append("\t");
    builder.append(getLongString(orderNumber));
    builder.append("\t");
    builder.append(getDateString(lastNotifiedDate));
    builder.append("\t");
    builder.append(getDateString(lastShippedDate));
    builder.append("\t");
    builder.append(getBigDecimalString(invoiceTotal));
    builder.append("\t");
    builder.append(getBigDecimalString(balanceDue));
    builder.append("\t");
    builder.append(getBigDecimalString(eligibleAmount));
    builder.append("\t");
    builder.append(paymentMethod);
    builder.append("\t");
    builder.append(this.sortRowId);
    builder.append("\t");
    builder.append(rowId);
    builder.append("\t");
    builder.append(getLongString(ordersId));
    builder.append("\t");
    builder.append(getBigDecimalString(authAmount));
    builder.append("\t");
    builder.append(paymentRefId);
    builder.append("\t");
    builder.append(verificationCode != null ? verificationCode : "");
    builder.append("\t");
    builder.append(getDateString(dateLastModified));
    builder.append("\t");
    builder.append(getDateString(dateInvoiceCreated));
    builder.append("\n");
    return builder;
  }

  @Override
  public Long getId() {
    return invoiceId;
  }

  /**
   * Get the rowId.
   * @return a rowId
   */
  public Integer getRowId() {
    return rowId;
  }

  @Override
  public void setSortRowId(Integer sortRowId) {
    this.sortRowId = sortRowId;
  }

  /**
   * Get the sortRowId.
   * @return a sortRowId
   */
  public Integer getSortRowId() {
    return sortRowId;
  }
}
