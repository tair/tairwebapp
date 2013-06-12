/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**
  * UnactivatedUserException extends InvalidLoginException to represent the specific
  * condition when a user's login attempt fails because their status is "new", meaning
  * the account has not yet been activated by TAIR curators. This distinction is
  * useful for times when we want to show a specialized error page for this type of
  * login failure
  */

public class UnactivatedUserException extends InvalidLoginException {

  /**
   * Creates an instance of UnactivatedUserException with the supplied error message
   * 
   * @param errMsg Error message for this exception
   */
  public UnactivatedUserException( String errMsg ) {
    super( errMsg );
  }
  
  
  /**
   * Creates an empty instance of UnactivatedUserException
   */
  public UnactivatedUserException( ) {
    super();
  }
}
