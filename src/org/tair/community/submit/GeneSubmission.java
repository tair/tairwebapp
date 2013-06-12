/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.community.submit;


import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.jboss.logging.Logger;
import org.tair.utilities.GuiPage;


/**
 * A Faces managed bean for the complete gene functional annotation submission,
 * which includes multiple genes and multiple annotations per gene. The class is
 * a subclass of GuiPage to support breadcrumbs. This version is here just to
 * support breadcrumbs through the parent GuiPage implementation.
 * 
 * @author Robert J. Muller
 */
@ManagedBean
@SessionScoped
public class GeneSubmission extends GuiPage {
  /** serial version UID for serializable object */
  private static final long serialVersionUID = 1L;

  /** logger for this class */
  static final Logger logger =
    Logger.getLogger(GeneSubmission.class);

  /**
   * Create a GeneFunctionalAnnotationSubmission object.
   */
  public GeneSubmission() {
  }

  /**
   * Load anything that needs loading when you inject the managed bean.
   * 
   * @return null to redisplay page
   */
  public String load() {
    // Return null to redisplay the page.
    return null;
  }
}
