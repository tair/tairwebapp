/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;
import java.io.*;
import java.util.*;

class PropertiesLoader
{
   /** Switch for loading as a resource bundle, set to false to load as a stream. */
   private static final boolean LOAD_AS_RESOURCE_BUNDLE = false;
   /** Suffix to use for the properties files. */
   private static final String SUFFIX = ".properties";

  /**
   * Creates a Properties object from a file resource using a specified class
   * loader. If the LOAD_AS_RESOURCE_BUNDLE constant is true, the method opens
   * the name as specified, stripping off a suffix specified by the SUFFIX
   * constant. If the constant is false, the method requires that the file have
   * a suffix specified by the SUFFIX constant, and it will add that suffix if
   * it is not present in the input name argument.
   * 
   * @param name the class name of the properties file
   * @param loader the class loader to use to load the file
   * 
   * @return a Properties object containing the loaded properties
   * @throws IllegalArgumentException if no resource was found
   */
  public static Properties loadProperties(String name, ClassLoader loader, Properties defaults) {
    Properties result = (defaults==null) ? new Properties() : new Properties(defaults);

    name = checkAndSetUpName(name);

    try {
      if (loader == null)
        loader = ClassLoader.getSystemClassLoader();

      if (LOAD_AS_RESOURCE_BUNDLE) {
        name = loadPropertiesAsResourceBundle(name, loader, result);
      } else {
        name = loadPropertiesAsStream(name, loader, result);
      }
    } catch (MissingResourceException e) {
      System.out.println("No properties file found: " + name);
      result = null;
    } catch (Exception e) {
      System.out.println("Exception: " + e.getMessage());
      result = null;
    }

    return result;
  }

  /**
   * Load a properties file as a resource bundle.
   * 
   * @param name a resource bundle name on the classpath
   * @param loader a loader with which to load the bundle
   * @param result a Properties object to fill in
   * @return the name modified with any transformations
   */
  private static String loadPropertiesAsResourceBundle(String name,
                                                       ClassLoader loader,
                                                       Properties result) {
    name = name.replace('/', '.');
    final ResourceBundle rb =
        ResourceBundle.getBundle(name, Locale.getDefault(), loader);

    for (Enumeration keys = rb.getKeys(); keys.hasMoreElements();) {
      final String key = (String)keys.nextElement();
      final String value = rb.getString(key);

      result.put(key, value);
    }
    return name;
  }

  /**
   * Load a properties file as an input stream.
   * 
   * @param name the name of the properties file on the class path; the file
   *          must end with the SUFFIX constant.
   * @param loader the class loader with which to load the file
   * @param result the Properties object to load
   * @return the name as transformed by the method
   * @throws IOException when there is a problem opening the file
   */
  private static String loadPropertiesAsStream(String name, ClassLoader loader,
                                               Properties result)
      throws IOException {
    InputStream in = null;
    name = name.replace('.', '/');

    if (!name.endsWith(SUFFIX)) {
      name = name.concat(SUFFIX);
    }

    try {
      in = loader.getResourceAsStream(name);
      if (in != null) {
        result.load(in); // Can throw IOException
      }
    } finally {
      if (in != null) {
        try {
          in.close();
        } catch (RuntimeException e) {
          // ignore any exceptions
        }
      }
    }

    return name;
  }

  /**
   * @param name
   * @return
   * @throws IllegalArgumentException
   */
  private static String checkAndSetUpName(String name)
      throws IllegalArgumentException {
    if (name == null)
      throw new IllegalArgumentException("no system properties file name");

    if (name.startsWith("/")) {
      name = name.substring(1);
    }

    if (name.endsWith(SUFFIX)) {
      name = name.substring(0, name.length() - SUFFIX.length());
    }
    return name;
  }

  /**
   * Load a properties file with the current thread's class loader.
   * {@link #loadProperties(String, ClassLoader)}
   * 
   * @param name the class name of the properties file
   */
  public static Properties loadProperties(final String name) {
    return loadProperties(name, Thread.currentThread().getContextClassLoader(),null);
  }

  /**
   * Load a properties file with the current thread's class loader.
   * {@link #loadProperties(String, ClassLoader)}
   * 
   * @param name the class name of the properties file
   */
  public static Properties loadProperties(final String name, final Properties defaults) {
    return loadProperties(name, Thread.currentThread().getContextClassLoader(),defaults);
  }
}
