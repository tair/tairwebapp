/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;


/** 
  * EmptyPaymentException is thrown if a user deletes all invoices from 
  * a payment. EmptyPaymentException may also have a reference
  * to the payment ID of the payment that generated the exception - this can be useful
  * for creating hyperlinks back to a detail page, or forward to a cancel page for
  * this payment.
  
  * @see CompositePayment
  */

public class EmptyPaymentException extends InvalidParameterException {
  private Long paymentID;
  
  /**
    * Creates an instance of EmptyPaymentException with the supplied error message
    *
    * @param errMsg Error message to show for this exception
    */
  public EmptyPaymentException( String errMsg ) {
    super( errMsg );
  }


  /**
    * Creates an instance of EmptyPaymentException with the supplied error message and 
    * payment ID for payment generating exception
    *
    * @param errMsg Error message to show for this exception
    * @param paymentID Payment ID of payment generating exception
    */
  public EmptyPaymentException( String errMsg, Long paymentID ) {
    super( errMsg );
    this.paymentID = paymentID;
  }


  /**
    * Creates an empty instance of EmptyPaymentException
    */
  public EmptyPaymentException() {
    super();
  }




  /**
    * Sets payment ID for payment that generated exception
    *
    * @param paymentID Payment ID of payment
    */
  public void setPaymentID( Long paymentID ) {
    this.paymentID = paymentID;
  }


  /**
    * Checks whether this exception has an payment ID associated with it.
    *
    * @return <code>true</code> if exception contains an payment ID, or <code>false</code>
    * if paymentID member variable is null
    */
  public boolean hasPaymentID() {
    return ( paymentID != null && paymentID.longValue() > 0 );
  }


  /**
    * Retrieves payment ID of payment that generated exception
    *
    * @return <code>Long</code> object of payment ID
    */
  public Long getPaymentID() {
    return paymentID;
  }

}

