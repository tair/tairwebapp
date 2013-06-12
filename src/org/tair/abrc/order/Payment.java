// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;


import java.util.Map;


/**
 * The payment information for a CyberSource credit card payment
 * 
 * @author Tom Meyer and Bob Muller
 */
public class Payment {
  /** the CyberSource payment decision status */
  final public String decision;
  /** the CyberSource public signature for the decision */
  final public String decision_publicSignature;
  /** the amount paid */
  final public String orderAmount;
  /** the CyberSource public signature for the amount paid */
  final public String orderAmount_publicSignature;
  /** the currency in which the order was paid */
  final public String orderCurrency;
  /** the CyberSource public signature for the currency */
  final public String orderCurrency_publicSignature;
  /** the ABRC order number */
  final public String orderNumber;
  /** the CyberSource public signature for the ABRC order number */
  final public String orderNumber_publicSignature;
  /** the page token */
  final public String orderPage_requestToken;
  /** the transaction type */
  final public String orderPage_transactionType;
  /** the CyberSource request identifier */
  final public String requestID;
  /** the CyberSource pending payment token */
  final public String pending_payment_token;
  /** whether to check the public signatures */
  private boolean check_signatures = true;

  /**
   * Create a Payment object.
   * 
   * @param info a map of payment information
   */
  public Payment(Map<String, String> info) {
    decision = scrub(info, "decision");
    decision_publicSignature = scrub(info, "decision_publicSignature");
    orderAmount = scrub(info, "orderAmount");
    orderAmount_publicSignature = scrub(info, "orderAmount_publicSignature");
    orderCurrency = scrub(info, "orderCurrency");
    orderCurrency_publicSignature =
      scrub(info, "orderCurrency_publicSignature");
    orderNumber = scrub(info, "orderNumber");
    orderNumber_publicSignature = scrub(info, "orderNumber_publicSignature");
    orderPage_requestToken = scrub(info, "orderPage_requestToken");
    orderPage_transactionType = scrub(info, "orderPage_transactionType");
    requestID = scrub(info, "requestID");
    pending_payment_token = scrub(info, "pending_payment_token");
  }

  /**
   * Set a named value to "" if it is null.
   * 
   * @param info the information map
   * @param name the name of the value to scrub
   * @return the scrubbed value
   */
  private String scrub(Map<String, String> info, String name) {
    String value = info.get(name);
    return value == null ? "" : value;
  }

  /**
   * Whether to check the public signatures
   * 
   * @return true if set to check
   */
  public boolean checkSignatures() {
    return check_signatures;
  }

  /**
   * Set the public-signature-check flag.
   * 
   * @param b true or false
   */
  public void setCheckSignatures(boolean b) {
    check_signatures = b;
  }

  @Override
  public boolean equals(Object obj) {
    Payment other = (Payment)obj;
    
    // Compare all the strings in the payment information for equality.
    return (decision.equals(other.decision) &&
    decision_publicSignature.equals(other.decision_publicSignature) &&
    orderAmount.equals(other.orderAmount) &&
    orderAmount_publicSignature.equals(other.orderAmount_publicSignature) &&
    orderCurrency.equals(other.orderCurrency) &&
    orderCurrency_publicSignature.equals(other.orderCurrency_publicSignature) &&
    orderNumber.equals(other.orderNumber) &&
    orderNumber_publicSignature.equals(other.orderNumber_publicSignature) &&
    orderPage_requestToken.equals(other.orderPage_requestToken) &&
    orderPage_transactionType.equals(other.orderPage_transactionType) &&
    requestID.equals(other.requestID) &&
    pending_payment_token.equals(other.pending_payment_token)) ;
  }

  @Override
  public int hashCode() {
    // Generate a hash from all the strings in the information.
    String concatenation =
      decision
          + "|"
          + decision_publicSignature
          + "|"
          + orderAmount
          + "|"
          + orderAmount_publicSignature
          + "|"
          + orderCurrency
          + "|"
          + orderCurrency_publicSignature
          + "|"
          + orderNumber
          + "|"
          + orderNumber_publicSignature
          + "|"
          + orderPage_requestToken
          + "|"
          + orderPage_transactionType
          + "|"
          + requestID
          + "|"
          + pending_payment_token;
    return concatenation.hashCode();
  }
}
