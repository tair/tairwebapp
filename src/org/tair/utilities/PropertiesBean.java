/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 * Faces managed bean that exposes the WebApp properties as Faces variables.
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="properties")
@RequestScoped
public class PropertiesBean {
  /**
   * Get the server name: the name of the web application server that comes
   * after http:// and before the path part of the URL. The web application sets
   * this at startup.
   * 
   * @return the server name
   */
  public String getServerName() {
    String name = WebApp.getServerName();
    return name;
  }

  /**
   * Get the server URL: http://&lt;server&gt;, where &lt;server&gt; is the
   * server name returned by getServerName(). You can concatenate this string
   * to a path to construct a site URL relative to the current server.
   * 
   * @return the server URL
   */
  public String getServerUrl() {
    return WebApp.getServerURL();
  }
}
