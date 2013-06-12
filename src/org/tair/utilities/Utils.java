/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.util.Collection;
import java.util.Iterator;


/**
 * A class with utility methods
 * 
 * 
 */
public class Utils {

  /**
   * Join a collection of objects into a single string string separated by a
   * delimiter
   * 
   * @note see http://snippets.dzone.com/posts/show/91
   */
  public static String join(Collection<String> s, String delimiter) {
    if (s.isEmpty())
      return "";

    Iterator<String> iter = s.iterator();
    StringBuffer buffer = new StringBuffer(iter.next());

    while (iter.hasNext())
      buffer.append(delimiter).append(iter.next());

    return buffer.toString();
  }

  /**
   * Trim leading and trailing blanks from a string and remove any multiple
   * blanks from the middle of the string. Ignore blanks in single-quoted
   * or double-quoted strings. Doesn't handle nested quotes yet.
   * 
   * @param string the string to compress
   * @return the compressed string
   */
  public static String compressBlanks(String string) {
    StringBuilder builder = new StringBuilder(string.trim());
    StringBuilder output = new StringBuilder("");

    char last = builder.charAt(0);
    output.append(builder.charAt(0));
    boolean inSingleQuotes = last == '\'' ? true : false;
    boolean inDoubleQuotes = last == '"' ? true : false;

    for (int i = 1; i < builder.length(); i++) {
      char current = builder.charAt(i);
      if (!(last == ' ' && current == ' ') || inSingleQuotes || inDoubleQuotes) {
        output.append(current);
      }
      last = current;
      if (inSingleQuotes && current == '\'') {
        inSingleQuotes = false;
      } else if (!inSingleQuotes && current == '\'') {
        inSingleQuotes = true;
      }
      if (inDoubleQuotes && current == '\'') {
        inDoubleQuotes = false;
      } else if (!inDoubleQuotes && current == '\'') {
        inDoubleQuotes = true;
      }
    }

    return output.toString();

  }
}
