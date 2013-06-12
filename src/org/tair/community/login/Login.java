/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.community.login;


import java.io.Serializable;
import java.math.BigInteger;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.tair.community.LoginChecker;
import org.tair.faces.AbstractManagedBean;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.SessionHandler;


/**
 * A Faces managed-bean class that provides an interface to the authentication
 * facilities of the container
 * 
 * @author Robert J. Muller
 * 
 */
@ManagedBean(name="login")
@SessionScoped
public final class Login extends AbstractManagedBean implements Serializable {
  /**
   * Generated serial version UID for Serializable interface
   */
  private static final long serialVersionUID = -1862721985248327598L;

  /** Error message prefix for login errors */
  @SuppressWarnings("unused")
  private static final String ERROR_PREFIX = "Login Error";

  /** Public attribute name for JAAS subject object in session */
  public static final String LOGIN_CONTEXT_ATTR = "loginContext";

  /** PolicyContext key for the JAAS subject */
  @SuppressWarnings("unused")
  private static final String SUBJECT_KEY =
    "javax.security.auth.Subject.container";
  
  @ManagedProperty(value="#{loggedIn}")
  private boolean loggedIn;

  /**
   * Log the user out if he or she is logged in by invalidating the session.
   * 
   * @return SUCCESS if the user logs out, FAILURE otherwise
   */
  public String logout() {
    FacesContext context = FacesContext.getCurrentInstance();
    HttpServletRequest request =
      (HttpServletRequest)context.getExternalContext().getRequest();
    HttpSession session = request.getSession();
    session.invalidate();
    return HOME;
  }

  /**
   * Is the user in the current session logged in?
   * 
   * @return true if the user is logged in, false if not
   */
  public boolean isLoggedIn() {
    loggedIn = false;
    /*
     * TODO Use the following code when JEE login is complete. try { // Get the
     * subject from the container. If the PolicyContext returns that // subject,
     * the user is currently logged in. if
     * (PolicyContext.getContext(SUBJECT_KEY) != null) { loggedIn = true; } }
     * catch (PolicyContextException e) { FacesContext context =
     * FacesContext.getCurrentInstance(); context.addMessage(null, new
     * FacesMessage(ERROR_PREFIX, e.getMessage())); }
     */
    // Use the old LoginChecker to check the session-based login
    HttpServletRequest request =
      (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
    loggedIn = LoginChecker.isLoggedIn(request);

    return loggedIn;
  }

  /**
   * Set the loggedIn attribute (does nothing, loggedIn is dynamic/read-only).
   * This method is here only to satisfy Faces attempts at calling it.
   * 
   * @param loggedIn "true" or "false"
   */
  public void setLoggedIn(boolean loggedIn) {
    // do nothing, loggedIn is dynamically read only
  }

  /**
   * Is the logged in user in the TAIR curator role?
   * 
   * @return true if the user is a TAIR curator, false if not
   */
  public boolean isTairCurator() {
    HttpServletRequest request =
      (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
    return LoginChecker.isTairCurator(request);
  }

  /**
   * Get the TAIR community id for the logged in user from the session.
   * 
   * @return a TAIR community id or null if the user isn't logged in
   */
  public BigInteger getCommunityId() {
    BigInteger id = null;
    HttpServletRequest request =
      (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
    try {
      id = SessionHandler.getCommunityID(request);
    } catch (InvalidLoginException e) {
      // Ignore exception, not logged in; return null community id
    }
    return id;
  }
}
