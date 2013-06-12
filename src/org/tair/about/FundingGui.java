/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.about;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 * Concrete implementation of the AbstractItemFlagGui managed bean class
 * that implements flag control for the funding item on the About page. 
 * This class uses the GuiComment load method to load comments.
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="funding")
@SessionScoped
public class FundingGui extends AbstractItemFlagGui {
  /** Default serial version UID for serializable interface */
  private static final long serialVersionUID = -1L;
}
