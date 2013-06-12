/*
 * Created on Apr 21, 2008 by muller
 * 
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.faces.community;


import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.tair.community.LoginChecker;


/**
 * A Faces managed bean that represents the Community login status.
 * 
 * @author Bob Muller (bmuller@stanford.edu)
 */
public final class Login extends Object {

  /** Is the user logged in as a community member? */
  @SuppressWarnings("unused")
  private Boolean isLoggedIn;

  /**
   * Is the user logged in as a community member?
   * 
   * @return Returns the isLoggedIn.
   */
  public Boolean getIsLoggedIn() {
    FacesContext context = FacesContext.getCurrentInstance();
    HttpServletRequest request =
        (HttpServletRequest)context.getExternalContext().getRequest();
    return LoginChecker.isLoggedIn(request);
  }

  /**
   * Set the isLoggedIn.
   * 
   * @param isLoggedIn The isLoggedIn to set.
   */
  public void setIsLoggedIn(Boolean isLoggedIn) {
    // Ignore the input and get the login information from the Request.
    FacesContext context = FacesContext.getCurrentInstance();
    HttpServletRequest request =
        (HttpServletRequest)context.getExternalContext().getRequest();
    this.isLoggedIn = LoginChecker.isLoggedIn(request);
  }

}
