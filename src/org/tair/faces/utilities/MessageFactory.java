/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.faces.utilities;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.jboss.logging.Logger;

import com.poesys.db.Message;


/**
 * A collection of static factory methods for generating Faces error messages.
 * 
 * @author Robert J. Muller
 */
public class MessageFactory {
  /**
   * Create and enqueue a new Faces message for the UI to display based on an
   * exception and a detail message. Log the combined message to the Logger as
   * an error along with the exception. The method does not re-throw the
   * exception.
   * 
   * @param logger The log4j Logger to which to log the error
   * @param e the exception
   * @param detail the detail message
   */
  public static void createErrorFromException(Logger logger, Throwable e,
                                              String detail) {
    List<String> propertyList = new ArrayList<String>(1);
    propertyList.add("com.poesys.bs.PoesysBsBundle");
    Message.initializePropertiesFiles(propertyList);
    FacesContext context = FacesContext.getCurrentInstance();
    String message = e.getMessage();
    if (message == null || message.length() == 0) {
      message = e.getClass().getName();
    }

    // Look up any property-based message key.
    String translatedMessage = null;
    try {
      translatedMessage = Message.getMessage(message, null);
    } catch (Exception e1) {
      // Lookup of the message failed; leave the message as null.
    }
    if (translatedMessage != null) {
      message = translatedMessage;
    }

    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.error(detail + ": " + message, e);
    }
  }

  /**
   * Create a new Faces message for the UI to display based on a string message
   * and a detail message. Log the combined message to the Logger.
   * 
   * @param logger the log4j Logger to which to log the error
   * @param message the message
   * @param detail the detail message
   */
  public static void createError(Logger logger, String message, String detail) {
    FacesContext context = FacesContext.getCurrentInstance();
    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.error(detail + ": " + message);
    }
  }

  /**
   * Is a message already queued in the Faces message queue? The message is
   * tested only for summary text, not for level or detail.
   * 
   * @param summary the message for which to test
   * @return true if the message is queued, false otherwise
   */
  private static boolean isMessageQueued(String summary) {
    boolean queued = false;
    FacesContext context = FacesContext.getCurrentInstance();
    Iterator<FacesMessage> itr = context.getMessages();
    while (itr.hasNext()) {
      FacesMessage message = itr.next();
      if (message.getSummary().equalsIgnoreCase(summary)) {
        queued = true;
        break;
      }
    }
    return queued;
  }

  /**
   * Is there an ERROR or FATAL message queued up?
   * 
   * @return true if there is an error, false if not
   */
  public static boolean isErrorQueued() {
    boolean queued = false;
    FacesContext context = FacesContext.getCurrentInstance();
    Iterator<FacesMessage> itr = context.getMessages();
    while (itr.hasNext()) {
      FacesMessage message = itr.next();
      if (message.getSeverity().equals(FacesMessage.SEVERITY_ERROR)
          || message.getSeverity().equals(FacesMessage.SEVERITY_FATAL)) {
        queued = true;
        break;
      }
    }
    return queued;
  }

  /**
   * Create a new Faces message for the UI to display based on an exception and
   * a detail message. Log the combined message to the Logger as a warning along
   * with the exception. The method does not re-throw the exception.
   * 
   * @param logger The log4j Logger to which to log the warning
   * @param e the exception
   * @param detail the detail message
   */
  public static void createWarningFromException(Logger logger, Throwable e,
                                                String detail) {
    FacesContext context = FacesContext.getCurrentInstance();
    String message = e.getMessage();
    if (message == null || message.length() == 0) {
      message = e.getClass().getName();
    }
    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.warn(detail + ": " + message, e);
    }
  }

  /**
   * Create a new Faces message for the UI to display based on a string message
   * and a detail message. Log the combined message to the Logger as a warning.
   * 
   * @param logger the log4j Logger to which to log the warning
   * @param message the message
   * @param detail the detail message
   */
  public static void createWarning(Logger logger, String message, String detail) {
    FacesContext context = FacesContext.getCurrentInstance();
    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.warn(detail + ": " + message);
    }
  }

  /**
   * Create a new Faces message for the UI to display based on an exception and
   * a detail message. Log the combined message to the Logger as an
   * informational message along with the exception. The method does not
   * re-throw the exception.
   * 
   * @param logger The log4j Logger to which to log the message
   * @param e the exception
   * @param detail the detail message
   */
  public static void createInfoFromException(Logger logger, Throwable e,
                                             String detail) {
    FacesContext context = FacesContext.getCurrentInstance();
    String message = e.getMessage();
    if (message == null || message.length() == 0) {
      message = e.getClass().getName();
    }
    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.info(detail + ": " + message, e);
    }
  }

  /**
   * Create a new Faces message for the UI to display based on a string message
   * and a detail message. Log the combined message to the Logger as a warning.
   * 
   * @param logger the log4j Logger to which to log the message
   * @param message the message
   * @param detail the detail message
   */
  public static void createInfo(Logger logger, String message, String detail) {
    FacesContext context = FacesContext.getCurrentInstance();
    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.info(detail + ": " + message);
    }
  }

  /**
   * Create a new Faces message for the UI to display based on an exception and
   * a detail message. Log the combined message to the Logger as a debug message
   * along with the exception. The method does not re-throw the exception.
   * 
   * @param logger The log4j Logger to which to log the debug message
   * @param e the exception
   * @param detail the detail message
   */
  public static void createDebugFromException(Logger logger, Throwable e,
                                              String detail) {
    FacesContext context = FacesContext.getCurrentInstance();
    String message = e.getMessage();
    if (message == null || message.length() == 0) {
      message = e.getClass().getName();
    }
    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.debug(detail + ": " + message, e);
    }
  }

  /**
   * Create a new Faces message for the UI to display based on a string message
   * and a detail message. Log the combined message to the Logger as a debug
   * message.
   * 
   * @param logger the log4j Logger to which to log the debug message
   * @param message the message
   * @param detail the detail message
   */
  public static void createDebug(Logger logger, String message, String detail) {
    FacesContext context = FacesContext.getCurrentInstance();
    if (!isMessageQueued(message)) {
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                message,
                                                detail));
      logger.debug(detail + ": " + message);
    }
  }
}
