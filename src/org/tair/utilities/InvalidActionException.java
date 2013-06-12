/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**  
 * InvalidActionException is thrown if invalid action requested, for instance an
 * action that is allowed by API, but not business rules ( like trying to delete a person 
 * who isn't "new" )
*/

public class InvalidActionException extends InvalidParameterException {

  /**
    * Creates an empty instance of InvalidActionException
    */
  public InvalidActionException() {
    super();
  }

  /**
    * Creates an instance of InvalidActionException with the supplied error message
    * 
    * @message Error message for this exception
    */
  public InvalidActionException(String message) {
    super(message);
  }

  public InvalidActionException(String message, Throwable t) {
    super(message, t);
  }

}
