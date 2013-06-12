/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.about;


import org.tair.utilities.GuiComment;


/**
 * <p>
 * An abstract Faces managed bean that handles actions for about pages;
 * implementations provide a named flag managed bean that controls an individual
 * item in a Faces page. You use this flag to control rendering of the full item
 * display, turning it on and off by turning the flag on and off.
 * </p>
 * <p>
 * To implement a partially displayed item on an About page, you need to do the
 * following:
 * </p>
 * <ul>
 * <li>Create a concrete subclass of this class. This concrete class does not
 * need any additional code.</li>
 * <li>Add a managed bean to faces-config-about.xml that refers to the concrete
 * class. This bean should have session scope.</li>
 * <li>Add code to the about-related page that uses the rendered attribute with
 * the managed bean and the isDisplayed flag
 * (rendered="#{!bean-name.displayed}", for example) in two alternate display
 * representations.</li>
 * <li>Add a commandlink component that calls displayPanel as its action
 * (action="#{bean-name.displayPanel}")to set the flag
 * </ul>
 * 
 * @author Robert J. Muller
 */
abstract public class AbstractItemFlagGui extends GuiComment {
  /** Generated serial version UID for serializable interface */
  private static final long serialVersionUID = 9110533589542789500L;

  /**
   * Flag indicating whether to display a panel
   */
  private boolean displayed = false;

  /**
   * Display the full panel?
   * 
   * @return true if should display, false if not
   */
  public boolean isDisplayed() {
    return displayed;
  }

  /**
   * Set the flag for displaying the full panel
   * 
   * @param displayed true if to display, false if not
   */
  public void setDisplayed(boolean displayed) {
    this.displayed = displayed;
  }

  /**
   * Set the flag to display the panel.
   * 
   * @return null to redisplay page
   */
  public String displayPanel() {
    setDisplayed(true);
    return null;
  }
}
