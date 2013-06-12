/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.faces;


import java.util.List;


/**
 * An abstract class that serves as the superclass for detail page backing beans
 * and provides shared services for those beans.
 * 
 * @author Robert J. Muller
 */
public class AbstractDetailBean extends AbstractManagedBean {
  /** Serial version UID for serializable class */
  private static final long serialVersionUID = 1L;

  /**
   * Construct a string from a list of strings, separating the strings with a
   * specified separator and a space. If there are no elements in the list, the
   * method returns null.
   * 
   * @param aliases the list of aliases
   * @param sep separate character for separating the strings
   * @return a semicolon-separated list of aliases.
   */
  protected String getStringList(List<String> aliases, String sep) {
    StringBuilder builder = new StringBuilder("");
    String retString = null;
    String separator = "";
    for (String alias : aliases) {
      builder.append(separator);
      builder.append(alias);
      separator = sep + " ";
    }
    if (builder.length() > 0) {
      retString = builder.toString();
    }
    return retString;
  }
}
