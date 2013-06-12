/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**
  * UnauthorizedRequestException is thrown if a user makes a request that they are not authorized
  * for. For example, only curators can edit person records that are not their own; if a regular
  * user attempt to do so, UnauthorizedRequestException will be thrown
  */

public class UnauthorizedRequestException extends Exception {

  
  /**
    * Creates an instance of UnauthorizedRequestException with the supplied error message
    * 
    * @message Error message for this exception
    */
  public UnauthorizedRequestException( String msg ) {
    super( msg );
  }


  /**
    * Creates an empty instance of UnauthorizedRequestException
    */
  public UnauthorizedRequestException() {
    super();
  }


}
