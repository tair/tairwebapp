/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.faces.utilities;


import java.util.Iterator;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;


/**
 * A utility class that contains standard methods for finding a component by
 * name given the current Faces context
 * <p>
 * Here is an example of looking up a combo box:
 * </p>
 * 
 * <pre>
 * public String getSelectedCode() {
 *   UIComponent comboBox = findComponentInRoot(&quot;evidenceCodeComboBox&quot;);
 *   return null;
 * }
 * </pre>
 * 
 * @author Robert J. Muller
 */
public class FacesComponentFinder {

  /**
   * Find a component in the current Faces view.
   * 
   * @param id the id to find
   * @return the component corresponding to the id or null if there is none
   */
  public static UIComponent findComponentInRoot(String id) {
    UIComponent component = null;

    FacesContext facesContext = FacesContext.getCurrentInstance();

    if (facesContext != null) {
      UIComponent root = facesContext.getViewRoot();
      component = findComponent(root, id);
    }

    return component;
  }

  /**
   * Find a component in the component tree starting at a base componentand
   * recursing down the tree.
   * 
   * @param base the current base component
   * @param id the id to find
   * @return the component corresponding to the id or null if there is none
   */
  private static UIComponent findComponent(UIComponent base, String id) {
    UIComponent result = null;
    if (id.equals(base.getId())) {
      result = base;
    } else {
      Iterator<UIComponent> children = base.getFacetsAndChildren();
      while (children.hasNext()) {
        UIComponent child = children.next();

        if (id.equals(child.getId())) {
          result = child;
        } else {
          result = findComponent(child, id);
        }

        if (result != null) {
          break;
        }
      }
    }
    return result;
  }

}
