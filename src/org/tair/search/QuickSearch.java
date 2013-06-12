/*
 * Created on Apr 29, 2008 by muller
 * 
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search;


import java.io.IOException;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletResponse;

import org.tair.faces.AbstractManagedBean;
import org.tair.utilities.DataConstants;
import org.tair.utilities.WebApp;


/**
 * A Faces Managed Bean that implements the form data and handling for the TAIR
 * QuickSearch feature (the small search box in the TAIR header). The current
 * implementation redirects using the current search URLs.
 * 
 * @author Bob Muller (bmuller@stanford.edu)
 */
@ManagedBean(name="quick_search")
@RequestScoped
public final class QuickSearch extends AbstractManagedBean {
  /** Default serial version UID */
  private static final long serialVersionUID = 1L;
  /** The Textpresso type string */
  private static final String TEXTPRESSO_TYPE = "textpresso";
  /** The Textpresso URL */
  private static final String TEXTPRESSO_URL = "http://www.textpresso.org/cgi-bin/arabidopsis/query?textstring=";
  /** The Google type string */
  private static final String GOOGLE_TYPE = "google";
  /** The Google URL */
  private static final String GOOGLE_URL = "http://www.google.com/custom?q=";
  /** The parameters for the Google search */
  private static final String GOOGLE_PARAM =
      "&cof=L:http:// www.arabidopsis.org/images/logosmall.gif;AH:left;GL:0;S:http://www.arabidopsis.org;AWFID:56b9e4624af96ab2;&domains=www.arabidopsis.org";
  /** The Aracyc type string */
  private static final String ARACYC_TYPE = "aracyc";
  /** The Aracyc URL with fixed parameters */
  private static final String ARACYC_URL =
      "http://www.arabidopsis.org:1555/ARA/substring-search?type=NIL&object=";
  /** The TAIR URL with fixed parameters */
  private static final String TAIR_URL =
      "/servlets/Search?type=general&show_obsolete=F&search_action=";
  private static final String TAIR_METHOD = "&method=";
  /** The TAIR subtype parameter */
  private static final String TAIR_SUB_TYPE = "&sub_type=";
  /** The TAIR search string parameter */
  private static final String TAIR_SEARCH_STRING = "&name=";
  /** The TAIR type for general search */
  private static final String TAIR_EXACT_SEARCH_TYPE = "any";
  /** The TAIR search action for a multiple-object-type search */
  private static final String TAIR_SEARCH_ACTION_SEARCH = "search";
  /** The TAIR search action for a single-object-type search */
  private static final String TAIR_SEARCH_ACTION_DETAIL = "detail";
  /** Error message for I/O or other exception */
  private static final String ERROR_MSG = "Error while attempting quick search";

  /**
   * The kind of search desired
   */
  @ManagedProperty(value="#{subType}")
  private String subType;
  /**
   * The search string
   */
  @ManagedProperty(value="#{name}")
  private String name;

  /**
   * Get the subType.
   * 
   * @return Returns the subType.
   */
  public String getSubType() {
    return subType;
  }

  /**
   * Set the subType.
   * 
   * @param subType The subType to set.
   */
  public void setSubType(String subType) {
    this.subType = subType;
  }

  /**
   * Get the name.
   * 
   * @return Returns the name.
   */
  public String getName() {
    return name;
  }

  /**
   * Set the name.
   * 
   * @param name The name to set.
   */
  public void setName(String name) {
    this.name = name;
  }

  /**
   * Do the search and get the string response for the bean.
   * 
   * @return the string response
   */
  public String search() {
    // Get the servlet response from the context.
    HttpServletResponse response =
        (HttpServletResponse)FacesContext.getCurrentInstance()
            .getExternalContext().getResponse();
    try {
      if (GOOGLE_TYPE.equalsIgnoreCase(subType)) {
        // Send a response redirect using the Google URL.
        response.sendRedirect(GOOGLE_URL + name + GOOGLE_PARAM);
      } else if (TEXTPRESSO_TYPE.equalsIgnoreCase(subType)) {
        //Send a response redirect using the Textpresso URL.
        response.sendRedirect(TEXTPRESSO_URL + name);
      } else if (ARACYC_TYPE.equalsIgnoreCase(subType)) {
        // Send a response redirect using the Aracyc URL.
        response.sendRedirect(ARACYC_URL + name);
      } else if (TAIR_EXACT_SEARCH_TYPE.equalsIgnoreCase(subType)) {
        // Send a response redirect using the TAIR Search URL for an exact
        // search.
        String serverUrl = WebApp.getServerURL();
        response.sendRedirect(serverUrl + TAIR_URL + TAIR_SEARCH_ACTION_SEARCH
                              + TAIR_METHOD + DataConstants.SEARCH_EXACT
                              + TAIR_SUB_TYPE + subType + TAIR_SEARCH_STRING
                              + name);
      } else {
        // Send a response redirect using the TAIR Search URL for an exact
        // search.
        String serverUrl = WebApp.getServerURL();
        response.sendRedirect(serverUrl + TAIR_URL + TAIR_SEARCH_ACTION_DETAIL
                              + TAIR_METHOD + DataConstants.SEARCH_CONTAINS
                              + TAIR_SUB_TYPE + subType + TAIR_SEARCH_STRING
                              + name);
      }
    } catch (IOException e) {
      throw new SearchException(ERROR_MSG, e);
    }
    return SUCCESS;
  }
}
