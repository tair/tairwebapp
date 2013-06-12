/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**  
 * InvalidAccessionException is thrown an invalid TAIR accession number
 * is received by TairServlet
 */

public class InvalidAccessionException extends Exception {

  /**
    * Creates an empty instance of InvalidAccessionException
    */
  public InvalidAccessionException() {
    super();
  }

  /**
    * Creates an instance of InvalidAccessionException with the supplied error message
    * 
    * @message Error message for this exception
    */
  public InvalidAccessionException(String message) {
    super(message);
  }

}
