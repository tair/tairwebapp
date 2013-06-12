/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.io.Serializable;


/**
 * <p>
 * A Faces managed bean that accesses various standard elements of a TAIR web
 * page such as the page id from the site map. PrettyFaces sets the page id
 * using an EL expression (see prettyfaces.xml in WebRoot/WEB-INF), then calls
 * the load() method that processes initial elements of the page as required.
 * </p>
 * <p>
 * You can get the site map id from the site map file, which is in WebRoot as
 * <code>sitemap.xml.</code> This becomes part of the PrettyFaces URL, as in
 * </p>
 * 
 * <pre>
 * /doc/portals/masc/discussions/1158
 * </pre>
 * 
 * <p>
 * where 1158 is the site map id for the MASC discussions page. There must be a
 * Faces managed bean in a Faces configuration file that implements the concrete
 * subclass of this class, and you put that bean into the PrettyFaces
 * configuration element for the URL. For example, news sidebars set their
 * default selection using the EL expression
 * <code>#{news.page}</code>, where news is the
 * Faces managed bean in faces-config-news.xml that refers to a class that
 * is a concrete subclass of this (Page) class.
 * </p>
 * <p>
 * To set up a breadcrumb enabled faces page:
 * <ol>
 * <li>In the faces page (an XHTML file), include a breadcrumbs define:
 * <pre>&lt;ui:define name="breadcrumbs"&gt;
 *     &lt;h:outputText
 *         value="#{breadcrumbs.breadcrumb}"
 *         binding="#{breadcrumbs.output}"
 *         escape="false"&gt;
 *         &lt;f:attribute
 *              name="pageId"
 *              value="#{[managed-bean-name].pageId}" /&gt;
 *     &lt;/h:outputText&gt;
 * &lt;/ui:define&gt;</pre>
 * where [managed-bean-name] is the name of the managed bean, such as "comment"
 * or "funding"
 * </li>
 * <li>Create a managed bean extending org.tair.utilities.GuiPage, adding a
 * generated serialization UID and a load() method.</li>
 * <li>Add the managed bean to the appropriate faces-config file:
 * <pre> &lt;managed-bean&gt;
 *     &lt;managed-bean-name&gt;[managed-bean-name]&lt;/managed-bean-name&gt;
 *     &lt;managed-bean-class&gt;[class-name]&lt;/managed-bean-class&gt;
 *     &lt;managed-bean-scope&gt;session&lt;/managed-bean-scope&gt;
 * &lt;/managed-bean></pre>where [class-name] is the fully qualified class
 * name for the managed bean class you created earlier. This managed bean will
 * usually have session scope, but you should use request scope if the backing
 * bean doesn't store any state that has to persist between actions.
 *   </li>
 *   <li>Add a url-mapping element to the pretty-config.xml file in WEB-INF
 * that maps the incoming URL to the managed bean:
 * <pre> &lt;url-mapping id="[id-value]"&gt;
 *   &lt;pattern&gt;[url]#{[managed-bean-name].pageId}&lt;/pattern&gt;
 *   &lt;view-id&gt;[faces-page-url]&lt;/view-id&gt;
 *   &lt;action&gt;#{[managed-bean-name].load}&lt;/action&gt;
 * &lt;/url-mapping></pre> where [id-value] is a unique name in the file for the mapping, such
 * as "org.tair.about.tair_funding" (note this is just a string, not any kind
 * of class identifier); [url] is the first part of the URL, such as
 * "/doc/about/tair_funding/", [faces-page-url] is the URL into which to
 * transform the incoming URL, such as "/about/tair_funding.faces" (note the
 * faces extension versus the xhtml extension on the file).
 *   </li>
 * </ol>
 * <p>
 * TODO Use the page id as the key into an array of page names that are used as
 * the names for PanelMenuItem elements within a PanelMenu; the selectedChild
 * attribute uses the pageId to look up the name of the current page and set the
 * menu to highlight that page.
 * </p>
 * 
 * @author Robert J. Muller
 */

@SuppressWarnings("serial")
public abstract class GuiPage implements Serializable {

  /** The site page identifier */
  protected String pageId;

  /**
   * Get the site map page id.
   * 
   * @return a page id
   */
  public String getPageId() {
    return pageId;
  }

  /**
   * Set the site map page id.
   * 
   * @param id a page id
   */
  public void setPageId(String id) {
    this.pageId = id;
  }

  /**
   * Load the components of the object. The concrete subclass must implement
   * this method to load all data required by the page on startup. This method
   * is called by PrettyFaces; see the
   * 
   * @return the Faces transition string or null to redisplay the page
   */
  abstract public String load();

}