/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * A class supporting utility methods to log start and finish debugging
 * information to standard out for servlets.
 * 
 * @author muller
 * 
 */
public class ServletLogger {
  /**
   * Log the start of a servlet thread using the TAIR Debugger.
   * 
   * @param servlet the string identifying the servlet
   * @param request the HTTP request from the server
   * @param response the HTTP response to the server
   */
  public static void start(String servlet, HttpServletRequest request,
                           HttpServletResponse response) {
    Thread current = Thread.currentThread();
    Date date = new Date(System.currentTimeMillis());
    Debugger.println(date.toString() + ": Servlet " + servlet + " starting ("
                     + request.getRequestURL() + ":" + request.getQueryString()
                     + "), " + current.getName());
  }

  /**
   * Log the end of a servlet thread using the TAIR Debugger.
   * 
   * @param servlet the string identifying the servlet
   * @param request the HTTP request from the server
   * @param response the HTTP response to the server
   */
  public static void end(String servlet, HttpServletRequest request,
                         HttpServletResponse response) {
    Thread current = Thread.currentThread();
    Date date = new Date(System.currentTimeMillis());
    Debugger.println(date.toString() + ": Servlet " + servlet + " ending ("
                     + request.getRequestURL() + ":" + request.getQueryString()
                     + "), " + current.getName());
  }
}
