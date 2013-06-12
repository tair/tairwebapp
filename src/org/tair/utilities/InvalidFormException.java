/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;

/**
  * InvalidFormException is thrown if an HTML form submission is missing required values, or
  * has invalid values for any parameters.  InvalidParameterException keeps a reference to a
  * Map of error messages so that multiple errors can be recorded for each submission
  */

public class InvalidFormException extends Exception {

  // form fields with errors and message for each field
  private Map formErrors;

  /**
    * Creates an instance of InvalidFormException with the supplied error message
    * 
    * @param errMsg Error message for this exception
    */
  public InvalidFormException( String errMsg ) {
    super( errMsg );
  }

  /**
    * Creates an instance of InvalidFormException with a Map of individual error messages 
    * and an overall error message for the exception
    * 
    * @param errors Map of individual error messages, using a <code>String</code> field name as a 
    * key referencing an error for that field.
    * @message Error message for this exception
    */
  public InvalidFormException( Map errors, String errMsg ) {
    super( errMsg );
    formErrors = errors;
  }


  /**
    * Creates an instance of InvalidFormException with a Map of individual error messages 
    * 
    * @param errors Map of individual error messages, using a <code>String</code> field name as a 
    * key referencing an error for that field.
    */
  public InvalidFormException( Map errors ) {
    super();
    formErrors = errors;
  }
						  
  /**
    * Retrieves Map of individual error messages
    *
    * @return Map of individual error messages, using a <code>String</code> field name as a 
    * key referencing an error for that field.
    */
  public Map getFormErrors() { return formErrors; }


}
