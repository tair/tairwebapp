/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.community;

/**
 * The basic exception wrapper for the TAIR Community subsystem. All
 * presentation layer methods that throw exceptions to the user interface must
 * use this exception, wrapping other exceptions as required.
 * 
 * @author Robert J. Muller
 */
public class CommunityException extends Throwable {

  /**
   * Generated Java serial version UID
   */
  private static final long serialVersionUID = -614215199746804284L;

  /**
   * Create a CommunityException object.
   */
  public CommunityException() {
    super();
  }

  /**
   * Create a CommunityException object with a message and a nested Throwable.
   * 
   * @param arg0 the message for the exception
   * @param arg1 the optional nested exception that caused the exception
   */
  public CommunityException(String arg0, Throwable arg1) {
    super(arg0, arg1);
  }

  /**
   * Create a CommunityException object with a message.
   * @param arg0 the message for the exception
   */
  public CommunityException(String arg0) {
    super(arg0);
  }

  /**
   * Create a CommunityException object with a nested Throwable.
   * @param arg0 the nested exception that caused the exception
   */
  public CommunityException(Throwable arg0) {
    super(arg0);
  }
}
