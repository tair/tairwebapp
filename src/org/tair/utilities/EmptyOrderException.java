/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;
import org.tair.abrc.stock.*;

/** 
  * EmptyOrderException is thrown if a user takes an action that empties their
  * ABRC stock order entirely.  An example is if user opts to delete all stocks
  * from their order, or if user submits a list of stocks for ordering that are
  * all invalid or unavailable.  EmptyOrderException keeps a reference of any 
  * stocks submitted for ordering that were not ordered for any reason (bad stock #, 
  * unavailable etc.) in a private instance of <code>UnorderedStock</code> so that
  * any page showing the empty order exception message can show what stocks were
  * not ordered from the last submission. EmptyOrderException may also have a reference
  * to the order ID of the order that generated the exception - this can be useful
  * for creating hyperlinks back to a detail page, or forward to a cancel page for
  * this order.
  
  * @see CompositeOrder
  */

public class EmptyOrderException extends InvalidParameterException {
  private UnorderedStock unordered;
  private Long orderID;
  
  /**
    * Creates an instance of EmptyOrderException with the supplied error message
    *
    * @param errMsg Error message to show for this exception
    */
  public EmptyOrderException( String errMsg ) {
    super( errMsg );
  }


  /**
    * Creates an instance of EmptyOrderException with the supplied error message and 
    * list of stocks that were not ordered for any reason
    *
    * @param errMsg Error message to show for this exception
    * @param unordered List of stocks that were requested in submission that threw exception, 
    * but that were not ordered for an reason.
    */
  public EmptyOrderException( String errMsg, UnorderedStock unordered ) {
    super( errMsg );
    this.unordered = unordered;
  }


  /**
    * Creates an instance of EmptyOrderException with the supplied error message, list of stocks
    * that were not ordered for any reason, and order ID for order generating exception
    *
    * @param errMsg Error message to show for this exception
    * @param unordered List of stocks that were requested in submission that threw exception, 
    * but that were not ordered for an reason.
    * @param orderID Order ID of order generating exception
    */
  public EmptyOrderException( String errMsg, UnorderedStock unordered, Long orderID ) {
    super( errMsg );
    this.unordered = unordered;
    this.orderID = orderID;
  }



  /**
    * Creates an empty instance of EmptyOrderException
    */
  public EmptyOrderException() {
    super();
  }


  /**
    * Checks whether this exception has a list of unordered stocks
    *
    * @return <code>true</code> if inner collection has a list of unordered stocks, 
    * <code>false</code> if there are no unordered stocks in this exception
    */
  public boolean hasUnordered() {
    return ( unordered != null && !unordered.isEmpty() );
  }

 
  /**
    * Sets list of unordered stocks that were requested when exception was thrown
    *
    * @param unordered List of unordered stocks for this exception
    */
  public void setUnordered( UnorderedStock unordered ) {
    this.unordered = unordered;
  }

  /**
    * Retrieves list of unordered stocks that were requested when exception was thrown
    *
    * @return <code>UnorderedStock</code> object containing list of stocks that were not unordered
    */
  public UnorderedStock getUnordered() {
    return unordered;
  }


  /**
    * Sets order ID for order that generated exception
    *
    * @param orderID Order ID of order
    */
  public void setOrderID( Long orderID ) {
    this.orderID = orderID;
  }


  /**
    * Checks whether this exception has an order ID associated with it.
    *
    * @return <code>true</code> if exception contains an order ID, or <code>false</code>
    * if orderID member variable is null
    */
  public boolean hasOrderID() {
    return ( orderID != null && orderID.longValue() > 0 );
  }


  /**
    * Retrieves order ID of order that generated exception
    *
    * @return <code>Long</code> object of order ID
    */
  public Long getOrderID() {
    return orderID;
  }


}
