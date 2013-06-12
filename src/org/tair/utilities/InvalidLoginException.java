/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**
  * InvalidLoginException is thrown if a user is expected to be logged in to access a certain action. 
  * In general, user's are considered to be logged in if they have a communityID in their 
  * <code>HttpSession</code>.  Community ID, name and curator status are placed in user's session 
  * when they login through <code>LoginChecker</code>.
  *
  * @see org.tair.community.LoginChecker
  * @see SessionHandler
  */

public class InvalidLoginException extends Exception {


  /**
   * Creates an instance of InvalidLoginException with the supplied error message
   * 
   * @param errMsg Error message for this exception
   */
  public InvalidLoginException( String errMsg ) {
    super( errMsg );
  }
  
  /**
   * Creates an instance of InvalidLoginException with the supplied error message
   * and a cause.
   * 
   * @param errMsg Error message for this exception
   * @param e the cause (another exception)
   */
  public InvalidLoginException( String errMsg, Exception e ) {
    super( errMsg, e );
  }
  
  /**
   * Creates an empty instance of InvalidLoginException
   */
  public InvalidLoginException( ) {
    super();
  }
}
