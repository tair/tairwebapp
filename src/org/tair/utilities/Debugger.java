/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.*;

/**
  * Debugger handles printing of debug statements.  It relies on the WebApp object to hold
  * a system wide True/False value for debugging status in the property DEBUG.  If this property is set to 
  * the string "true" then any calls to Debugger.println will print the supplied message to STDOUT. 
  * If this property is null, or not set to "true", no information will be printed.
  *
  * @see WebApp
  *
  */


public class Debugger {

  /**
    * Prints supplied <code>String</code> message to STDOUT if system property DEBUG is "true"
    *
    * @param msg <code>String</code> Message to be printed
    */
  public static void println( String msg ) {
    String debug = WebApp.getProperty( "DEBUG" );
    if ( debug != null && debug.equalsIgnoreCase( "true" ) ) {
      System.out.println( msg );
    }
    if ( debug != null && debug.equalsIgnoreCase( "app" ) ) {
      System.out.println( msg );
    }
  }


  /**
    * Prints supplied <code>Object</code> value as returned by Object.toString() to 
    * STDOUT if system property DEBUG is "true"
    *
    *
    * @param msg <code>Object</code> value to be printed
    */
  public static void println( Object msg ) {
    String debug = WebApp.getProperty( "DEBUG" );
    if ( debug != null && debug.equalsIgnoreCase( "true" ) ) {
      System.out.println( msg );
    }
    if ( debug != null && debug.equalsIgnoreCase( "app" ) ) {
      System.out.println( msg );
    }
  }    

  /**
    * passes back a msg which includes the objects classname and timestamp
    * @param obj <code>Object</code> object whose classname will be returned 
    * @param msg <code>String</code> msg to be printed
    */
  public static String logMsg( Object obj, String msg ) {
    java.util.Date today = new java.util.Date();
    Timestamp now = new Timestamp( today.getTime() );
    StringBuffer buffer = new StringBuffer();
    //buffer.append( "ts: " );
    buffer.append( now );
    buffer.append( "\t" );
    //buffer.append( "class: " );
    buffer.append( obj.getClass().getName() );
    buffer.append( "\n" );
    //buffer.append( "msg: " );
    buffer.append( msg );
    return buffer.toString();
  }    

}
