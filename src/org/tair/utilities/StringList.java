/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.StringTokenizer;


/**
 * A class with utility methods for handling arrays and lists of strings.
 * 
 * @author muller
 * 
 */
public class StringList {
  /** Character (tab) that separates strings in a list expressed as a string */
  private static final String SEPARATOR = "\t";

  /** Characters (, ) that separate strings in a comma-separated list */
  private static final String COMMA = ", ";

  /**
   * Produce a single string out of an array of strings; the method concatenates
   * the strings and separates them with the separator character.
   * 
   * @param strings the input array of strings, which should not contain the
   *          separator character
   * @return a string containing all the input strings separated with the
   *         separator character
   */
  public static String arrayToString(String[] strings) {
    StringBuilder retString = new StringBuilder();
    String sep = "";

    for (int i = 0; i < strings.length; i++) {
      retString.append(sep); // separate from previous strings
      retString.append(strings[i]);
      sep = SEPARATOR; // separates after the first iteration
    }
    return retString.toString();
  }

  /**
   * Given a string containing a list of strings separated with the separator
   * character, return a list of the strings. Usually the input will be a string
   * built by another method of this class.
   * 
   * @param string a single string containing multiple strings separated with
   *          the separator character
   * @return a List of String containing all the separated strings
   */
  public static List<String> stringToList(String string) {
    List<String> list = new ArrayList<String>();
    StringTokenizer tok = new StringTokenizer(string, SEPARATOR, false);
    while (tok.hasMoreTokens()) {
      list.add(tok.nextToken());
    }
    return list;
  }

  /**
   * Given a string containing a list of strings separated with the separator
   * character, return a list of the strings converted into Long ids. Usually
   * the input will be a string built by another method of this class. If a
   * particular string is not a long integer, the method will not return that id
   * in the list and will print an error on standard error, but it will return
   * all the valid ids in the input string.
   * 
   * @param string a single string containing multiple ids separated with the
   *          separator character
   * @return a List of Long containing the Long ids from the string
   */
  public static List<Long> stringToIdList(String string) {
    List<Long> list = new ArrayList<Long>();
    StringTokenizer tok = new StringTokenizer(string, SEPARATOR, false);
    while (tok.hasMoreTokens()) {
      String token = tok.nextToken();
      try {
        list.add(new Long(token));
      } catch (NumberFormatException e) {
        // ignore the string, as it isn't an id, but print an error
        System.err.println("StringList: " + token + " is not a long id");
      }
    }
    return list;
  }

  /**
   * Given a string containing a list of strings separated with the separator
   * character, convert it to a comma-separated list of strings as a string.
   * Usually the input will be a string built by another method of this class.
   * 
   * @param string a single string containing multiple strings separated with
   *          the separator character
   * @return a List of String containing all the separated strings
   */
  public static String stringToCommaString(String string) {
    StringBuilder outString = new StringBuilder();
    StringTokenizer tok = new StringTokenizer(string, SEPARATOR, false);
    String sep = ""; // no separator the first time through
    while (tok.hasMoreTokens()) {
      outString.append(sep);
      outString.append(tok.nextToken());
      sep = COMMA;
    }
    return outString.toString();
  }

  /**
   * Given a collection of strings, convert it to a comma-separated list of
   * strings as a string in the same order as the list. The comma-separated list
   * follows the usual typographical convention of having a space follow the
   * comma before the next string.
   * 
   * @param strings the input collection of strings
   * @return the output string in comma-separated format
   */
  public static String listToCommaString(Collection<String> strings) {
    StringBuilder builder = new StringBuilder("");
    String delim = "";
    for (String string : strings) {
      builder.append(delim);
      builder.append(string);
      // Add a space after the comma.
      delim = COMMA + " ";
    }
    return builder.toString();
  }
}
