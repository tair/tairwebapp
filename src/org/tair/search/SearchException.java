/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;


import java.util.List;


/**
 * A generic subsystem exception for the TAIR Search subsystem that supports a list
 * of arguments for error message processing, allowing an error processing
 * client to construct an error message from a resource bundle by supplying any
 * number of string arguments. This exception is a subclass of the
 * RuntimeException class to permit use in implementations of library methods
 * with fixed exception signatures.
 * 
 * @author bmuller
 */
public class SearchException extends RuntimeException {
  /** The unique UID for this serializable object */
  private static final long serialVersionUID = -3468520863174047608L;
  
  /** List of String parameters for the message */
  private List<String> parameters = null;

  /**
   * Constructor with message
   * 
   * @param arg0 the message
   */
  public SearchException(String arg0) {
    super(arg0);
  }

  /**
   * Constructor with message and causing exception
   * 
   * @param arg0 the message
   * @param arg1 the cause
   */
  public SearchException(String arg0, Throwable arg1) {
    super(arg0, arg1);
  }

  /**
   * Constructor with just the causing exception
   * 
   * @param arg0 the cause
   */
  public SearchException(Throwable arg0) {
    super(arg0);
  }

  /**
   * Get the parameters.
   * 
   * @return Returns the parameters.
   */
  public List<String> getParameters() {
    return parameters;
  }

  /**
   * Set the parameters.
   * 
   * @param parameters The parameters to set.
   */
  public void setParameters(List<String> parameters) {
    this.parameters = parameters;
  }
}
