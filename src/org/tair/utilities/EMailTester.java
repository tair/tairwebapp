/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.jboss.logging.Logger;


/**
 * A simple application that tests the standard email setup by sending mail to a
 * known email address using the WebApp MAIL_HOST property as currently set.
 * Change the strings in main() to change the test parameters (or rewrite to
 * take command args :) .
 */
public final class EMailTester {
  /** The internal properties object */
  private static Properties values;
  private static final Logger logger = Logger.getLogger(EMailTester.class);

  /** the mail.host property */
  private static String emailHost = null;
  static {
    final Map<String, String> m = new HashMap<String, String>() {
      /** Serial version UID  */
      private static final long serialVersionUID = 1L;
      {
        put("MAIL_HOST", "localhost");
      }
    };
    /** The default properties object initialized with the static map */
    Properties defaultProps = new Properties() {
      /** Serial version UID  */
      private static final long serialVersionUID = 1L;

      {
        putAll(m);
      }
    };

    try {
      values =
        PropertiesLoader.loadProperties("org.tair.conf.webapp.properties",
                                        defaultProps);
      emailHost = values.getProperty("MAIL_HOST");
    } catch (Exception e) {
      logger.error("Error loading system properties file", e);
    }
  }

  /**
   * Main driver for email test.
   * 
   * @param args command line arguments (to email)
   */
  public static void main(final String[] args) {
    String to = null;
    
    if (args.length > 0) {
      to = args[0]; // use first argument as email
    } else {
      to = "bmuller@stanford.edu"; // default to bmuller
    }
    try {
      send(emailHost,
           "curator@arabidopsis.org",
           to,
           null,
           null,
           "EmailTest from TAIR server to " + emailHost,
           "Test message");
    } catch (MessagingException e) {
      logger.error("Could not send email to host " + emailHost + ": " + e.getMessage(), e);
    }
  }

  /**
   * Send an email message using the Java Mail API. This method is thread safe.
   * 
   * @param mail_server_host the SMTP server to use
   * @param addresses_from the originator email address
   * @param addresses_to the recipient email addresses
   * @param addresses_cc the carbon-copy email addresses
   * @param addresses_bcc the blind-carbon-copy email addresses
   * @param subject the subject header
   * @param message the content
   * @throws MessagingException when there is an API error sending the message
   */
  private static synchronized void send(String mail_server_host,
                                        String addresses_from,
                                        String addresses_to,
                                        String addresses_cc,
                                        String addresses_bcc, String subject,
                                        String message)
      throws MessagingException

  {
    Properties properties = new Properties();
    properties.put("mail.smtp.host", mail_server_host);

    // Regularize and validate all the addresses.
    InternetAddress[] from = canonicalizeAddresses(addresses_from);
    InternetAddress[] to = canonicalizeAddresses(addresses_to);
    InternetAddress[] cc = canonicalizeAddresses(addresses_cc);
    InternetAddress[] bcc = canonicalizeAddresses(addresses_bcc);

    // Use a null authenticator for the MIME message.
    MimeMessage msg =
      new MimeMessage(Session.getInstance(properties, (Authenticator)null));

    msg.addFrom(from);
    msg.setRecipients(Message.RecipientType.TO, to);
    msg.setRecipients(Message.RecipientType.CC, cc);
    msg.setRecipients(Message.RecipientType.BCC, bcc);
    msg.setSubject(subject);
    msg.setText(message);

    Transport.send(msg);
  }

  /**
   * Canonicalize an input string of addresses into an array of single
   * addresses. Each address in the input string should be separated by a comma.
   * 
   * @param addresses a comma-separated list of email addresses
   * @return an array of single email addresses
   * @throws AddressException when an email address is not valid
   */
  static private InternetAddress[] canonicalizeAddresses(String addresses)
      throws AddressException {
    InternetAddress[] tempArray = null;
    // Proceed only if there are addresses to canonicalize.
    if (addresses != null) {
      // Parse out the multiple addresses and add them to the list.
      tempArray = InternetAddress.parse(addresses);
      for (int i = 0; i < tempArray.length; i++) {
        tempArray[i].validate();
      }
    }
    return tempArray;
  }
}
