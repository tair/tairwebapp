// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.payment.creditcard;


import java.util.HashMap;
import java.util.Map;


public class CreditCardReply {
  /**
   * Creates an instance of CreditCardResponse that contains the response data
   * returned from a credit card service request.
   * 
   * @param response A Map containing results of service request
   */
  public CreditCardReply(Map<String, String> response) {
    this.response.putAll(response);
  }

  /**
   * Determines whether remote credit card transaction had an error
   * 
   * @return <code>true</code> if a error occurred; <code>false</code> if no
   *         error occurred
   */
  public boolean errorOccurred() {
    return this.response.get("decision").equals("ERROR");
  }

  /**
   * Determines whether credit card authorization was approved or not
   * 
   * @return <code>true</code> if authorization was approved;
   *         <code>false</code> if authorization was not approved
   */
  public boolean approved() {
    return this.response.get("descision").equals("ACCEPT");
  }

  /**
   * @return Returns the request token received from CyberSource
   */
  public String getRequestToken() {
    return this.response.get("requestToken");
  }

  /**
   * @return Returns the request id received from CyberSource
   */
  public String getRequestID() {
    return this.response.get("requestID");
  }

  /**
   * @return Returns a string describing the disposition of the reply
   */
  public String getMessage() {
    String code = this.response.get("reasonCode");
    return this.errMsgs.containsKey(code) ? this.errMsgs.get(code)
        : "Unknown error";
  }

  private Map<String, String> response = new HashMap<String, String>() {
    /**
     * 
     */
    private static final long serialVersionUID = 4813427283158367464L;

    {
      put("decision", "");
      put("reasonCode", "");
    }
  };

  private Map<String, String> errMsgs = new HashMap<String, String>() {
    private static final long serialVersionUID = 2706230287179394722L;

    {
      put("100", "Successful transaction.");
      put("101", "The request is missing one or more required fields.");
      put("102", "One or more fields in the request contains invalid data.");
      put("150", "Error: General system failure.");
      put(
          "151",
          "Error: The request was received but there was a server timeout. This error does not include timeouts between the client and the server.");
      put(
          "152",
          "Error: The request was received, but a service did not finish running in time.");
      put(
          "200",
          "The authorization request was approved by the issuing bank but declined by CyberSource because it did not pass the Address Verification Service (AVS) check.");
      put(
          "201",
          "The issuing bank has questions about the request. You do not receive an authorization code programmatically, but you might receive one verbally by calling the processor.");
      put(
          "202",
          "Expired card. You might also receive this if the expiration date you provided does not match the date the issuing bank has on file.");
      put(
          "203",
          "General decline of the card. No other information provided by the issuing bank.");
      put("204", "Insufficient funds in the account.");
      put("205", "Stolen or lost card.");
      put("207", "Issuing bank unavailable.");
      put("208",
          "Inactive card or card not authorized for card-not-present transactions.");
      put("209",
          "American Express Card Identification Digits (CID) did not match.");
      put("210", "The card has reached the credit limit.");
      put("211", "Invalid card verification number.");
      put("221",
          "The consumer matched an entry on the processors negative file.");
      put(
          "230",
          "The authorization request was approved by the issuing bank but declined by CyberSource because it did not pass the card verification (CV) check.");
      put("231", "Invalid account number.");
      put("232", "The card type is not accepted by the payment processor.");
      put("233", "General decline by the processor.");
      put("234",
          "There is a problem with your CyberSource merchant configuration.");
      put(
          "235",
          "The requested amount exceeds the originally authorized amount. Occurs, for example, if you try to capture an amount larger than the original authorization amount.");
      put("236", "Processor failure.");
      put("237", "The authorization has already been reversed.");
      put("238", "The authorization has already been captured.");
      put("239",
          "The requested transaction amount must match the previous transaction amount.");
      put(
          "240",
          "The card type sent is invalid or does not correlate with the credit card number.");
      put("241", "The request ID is invalid.");
      put(
          "242",
          "You requested a capture, but there is no corresponding, unused authorization record. Occurs if there was not a previously successful authorization request or if the previously successful authorization has already been used by another capture request.");
      put("243", "The transaction has already been settled or reversed.");
      put(
          "246",
          "The capture or credit is not voidable because the capture or credit information has already been submitted to your processor. Or, you requested a void for a type of transaction that cannot be voided.");
      put("247",
          "You requested a credit for a capture that was previously voided.");
      put(
          "250",
          "Error: The request was received, but there was a timeout at the payment processor.");
    }
  };
}
