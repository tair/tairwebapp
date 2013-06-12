/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.querytools;


import org.tair.bs.locusdetail.BsLocusExternalLink;
import org.tair.utilities.HTMLFactory;


/**
 * A wrapper for BsLocusExternalLink that adds logic for building complete
 * anchor tags for external links on the locus detail page
 * 
 * @author Robert J. Muller
 */
public class LocusExternalLink {
  private static final String TARGET = "\" target=\"_blank";

  BsLocusExternalLink link;

  public LocusExternalLink(BsLocusExternalLink link) {
    this.link = link;
  }

  /**
   * Get the anchor tag that represents an external link on the locus detail
   * page.
   * 
   * @return the anchor tag for the external link
   */
  public String getExternalLink() {
    String url = assembleLink(link.getBaseUrl(), link.getUrlVariable());
    String externalLink = null;
    if (link.getName() != null) {
      externalLink =
        HTMLFactory.urlToHTML(url,
                              link.getWebSiteName() + " " + link.getName(),
                              HTMLFactory.urlToGoogleAppsAction(url));
    } else {
      externalLink =
        HTMLFactory.urlToHTML(url,
                              link.getWebSiteName(),
                              HTMLFactory.urlToGoogleAppsAction(url));
    }
    return externalLink;
  }

  /**
   * Assemble a complete link from a base URL and a variable string. Either or
   * both of the two inputs can be null.
   * 
   * @param base_url the base URL for the link (without variables)
   * @param url_variable the variable to append to the base URL
   * @return a complete URL string with arguments, taking nulls into account
   */
  private String assembleLink(String base_url, String url_variable) {
    if (base_url != null) {
      if (url_variable == null)
        url_variable = "   ";
    } else {
      base_url = "    ";
      url_variable = "    ";
    }
    return base_url + url_variable + TARGET;
  }

}
