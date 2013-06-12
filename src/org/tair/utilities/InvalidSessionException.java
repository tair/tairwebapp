/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**
  * InvalidSessionException is thrown when an object is not found in a user's <code>HttpSession</code>
  * when it is expected to be there.  For example, if user makes a request for a page that is in the 
  * middle of the Community update functions, they must have a BsPerson in session.
  *
  * @see SessionHandler
  */
public class InvalidSessionException extends Exception {


  /**
    * Creates an empty instance of InvalidSessionException
    */
  public InvalidSessionException( String errMsg ) {
    super( errMsg );
  }

  /**
    * Creates an instance of InvalidSessionException with the supplied error message
    * 
    * @message Error message for this exception
    */
  public InvalidSessionException( ) {
    super();
  }
}
