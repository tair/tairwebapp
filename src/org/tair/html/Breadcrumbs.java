/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.html;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.io.StringReader;
import java.io.StringWriter;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.tair.utilities.Debugger;
import org.tair.utilities.WebApp;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;


/**
 * <p>
 * A Faces managed bean that provides the TAIR site map to templates for
 * including breadcrumb displays in pages. The XSLT transformation accepts the
 * site map and the id of the current page and produces a breadcrumb HTML string
 * that represents the site path to the current page.
 * </p>
 * <p>
 * TODO Optimize the object to produce the site map only once; I tried using
 * Faces Application scope, but that apparently causes nasty problems when
 * mixing multiple request scoped managed beans accessing the map. Perhaps a
 * static implementation?
 * </p>
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="breadcrumbs")
@RequestScoped
public final class Breadcrumbs extends Object implements Serializable {

  /** Default serial version UID for Serializable object */
  private static final long serialVersionUID = 1L;
  /** The Web Root path */
  private static final String PATH = WebApp.getWebRoot();
  /** The file name of the TAIR site map file */
  private static final String SITEMAP_FILE = PATH + "/sitemap.xml";
  /** The file name of the TAIR site map XSLT breadcrumb transformation file */
  private static final String NAV_FILE = PATH + "/navigation.xsl";

  /**
   * The read-only XSLT transformation specification for the site map as
   * breadcrumbs
   */
  private final String xslnav;

  /** Faces outputText component with page id parameter */
  @ManagedProperty(value="#{output}")
  private HtmlOutputText output;
  
  /** Faces breadcrumb string, set on get */
  @ManagedProperty(value="#{breadcrumb}")
  private String breadcrumb;

  /** The internal transformer for the breadcrumb XSLT */
  private final Transformer transformer;
  
  /** The XML source for the breadcrumb */
  private final Source source;

  /**
   * Create a Breadcrumbs object. This is an application-scope managed bean that
   * initially reads the site map and XSLT navigation transformation files and
   * makes them available as a managed bean.
   * 
   * @throws TransformerConfigurationException
   */
  public Breadcrumbs() throws TransformerConfigurationException {
    source = readSiteMap();
    xslnav = readSiteNavigation();
    TransformerFactory factory = TransformerFactory.newInstance();
    Templates template =
      factory.newTemplates(new StreamSource(new StringReader(xslnav)));
    transformer = template.newTransformer();
  }

  /**
   * Read the site map file.
   * 
   * @return the site map file as an XML document source for XSL
   */
  private Source readSiteMap() {
    FileReader smf = null;
    Source input = null;
    try {
      smf = new FileReader(SITEMAP_FILE);
      BufferedReader sm = new BufferedReader(smf);
      InputSource source = new InputSource(sm);
      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      DocumentBuilder builder = factory.newDocumentBuilder();
      Document sitemap = builder.parse(source);
      input = new DOMSource(sitemap);
    } catch (FileNotFoundException e) {
      Debugger.println(e.getMessage() + ": " + SITEMAP_FILE);
    } catch (IOException e) {
      Debugger.println("IO: " + e.getMessage() + ": " + SITEMAP_FILE);
    } catch (ParserConfigurationException e) {
      Debugger.println("DOM Parser: " + e.getMessage() + ": " + SITEMAP_FILE);
    } catch (SAXException e) {
      Debugger.println("SAX: " + e.getMessage() + ": " + SITEMAP_FILE);
    } finally {
      if (smf != null) {
        try {
          smf.close();
        } catch (IOException e) {
          Debugger.println(e.getMessage());
        }
      }
    }

    return input;
  }

  /**
   * Read the site navigation file, the file that contains the XSLT
   * transformation specification for the site map's transformation into a
   * breadcrumb string.
   * 
   * @return the site map file as a string
   */
  private String readSiteNavigation() {
    StringBuilder sb = new StringBuilder();
    FileReader smf = null;
    try {
      smf = new FileReader(NAV_FILE);
      BufferedReader sm = new BufferedReader(smf);

      String s;
      while ((s = sm.readLine()) != null) {
        sb.append(s);
      }
    } catch (FileNotFoundException e) {
      Debugger.println(e.getMessage() + ": " + NAV_FILE);
    } catch (IOException e) {
      Debugger.println(e.getMessage());
    } finally {
      if (smf != null) {
        try {
          smf.close();
        } catch (IOException e) {
          Debugger.println(e.getMessage());
        }
      }
    }
    return sb.toString();
  }

  /**
   * Get the breadcrumb based on the current page id and the site map as
   * transformed by the navigation XSL transformation.
   * 
   * @return a breadcrumb for the current page
   */
  public String getBreadcrumb() {
    StringWriter writer = new StringWriter();
    StreamResult result = new StreamResult(writer);
    breadcrumb = null;
    String pageId = (String)output.getAttributes().get("pageId");
    transformer.setParameter("id", pageId);
    try {
      transformer.transform(source, result);
      breadcrumb = writer.toString();
    } catch (TransformerException e) {
      Debugger.println(e.getMessage());
    }
    return breadcrumb;
  }

  /**
   * Set the breadcrumb. This method does nothing and exists for Faces
   * compatibility.
   * 
   * @param breadcrumb the breadcrumb string
   */
  public void setBreadcrumb(String breadcrumb) {
    // Does nothing
  }

  /**
   * Get the output.
   * 
   * @return Returns the output.
   */
  public HtmlOutputText getOutput() {
    return output;
  }

  /**
   * Set the output.
   * 
   * @param output The output to set.
   */
  public void setOutput(HtmlOutputText output) {
    this.output = output;
  }

}
