/*
 * Created on Apr 28, 2008 by Bob Muller
 *
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.faces;

import java.io.Serializable;

/**
 * An abstract superclass for TAIR managed beans that contains shared
 * constants and utility methods shared by managed beans.
 * @author Bob Muller (bmuller@stanford.edu)
 */
public abstract class AbstractManagedBean implements Serializable {
  /** Serial version UID for serializable class */
  private static final long serialVersionUID = 1L;
  /** Faces transition string for success of a process */
  protected static final String SUCCESS = "success";
  /** Faces transition string for failure of a process */
  protected static final String FAILURE = "failure";
  /** Faces transition string to go to the Home page */
  protected static final String HOME = "home";
  /** Faces transition string to go to the MyHome page */
  protected static final String MY_HOME = "my_home";
}
