/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.community.community;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import org.tair.utilities.GuiPage;

/**
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="page")
@RequestScoped
public class GuiCommunityPage extends GuiPage implements Serializable {
  /**
   * Default serial version UID for serializable object
   */
  private static final long serialVersionUID = 1L;

  @Override
  public String load() {
    // Does nothing at this point, just redisplays page
    return null;
  }
}
