/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.util.ArrayList;
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
 * An Object Adaptor pattern class that wraps the Java mail API and simplifies
 * it for use at TAIR. All TAIR web application emails must use this class to
 * send mail. The class adds capabilities to restrict the sending of email based
 * on the server properties settings. The internal mail processing is thread
 * safe.
 * 
 * @see org.tair.community.CommunityEmailHandler
 * @see org.tair.abrc.OrderEmailHandler
 * @see org.tair.processor.genesymbol.SymbolMailer
 * @see org.tair.processor.definitions.DefinitionsEmailHandler
 */
public final class EMail {
  private static final Logger logger = Logger.getLogger(EMail.class);

  /** option to send no emails at all */
  public static final String SEND_MAIL_NONE = "none";
  /** option to send emails to any address */
  public static final String SEND_MAIL_ANY = "any";
  /** option to send emails only to curator email addresses */
  public static final String SEND_MAIL_CURATOR = "curator";
  /** property name for the send-email property */
  public static final String SEND_MAIL_PROPERTY = "SEND_MAIL";

  /**
   * Send a mail message specifying the commonly used elements.
   * 
   * @param mail_server_host the SMTP server name
   * @param email_from the list of from email addresses
   * @param email_to the list of to email addresses
   * @param subject the email subject header
   * @param message the content of the email
   * @throws AddressException when there is a bad email address
   * @throws MessagingException when there is a problem sending the email
   */
  public static void send(String mail_server_host, String email_from,
                          String email_to, String subject, String message)
      throws AddressException, MessagingException

  {
    send(mail_server_host, email_from, email_to, null, null, subject, message);
  }

  /**
   * Send a mail message specifying the commonly used elements, and include a
   * carbon-copy element based on the from list.
   * 
   * @param mail_server_host the SMTP server name
   * @param email_from the list of from email addresses
   * @param email_to the list of to email addresses
   * @param subject the email subject header
   * @param message the content of the email
   * @param cc true to include a cc based on the from list, false to not include
   *          one
   * @throws AddressException when there is a bad email address
   * @throws MessagingException when there is a problem sending the email
   */
  public static void send(String mail_server_host, String email_from,
                          String email_to, String subject, String message,
                          boolean cc) throws AddressException,
      MessagingException

  {
    send(mail_server_host,
         email_from,
         email_to,
         cc ? email_from : null,
         null,
         subject,
         message);
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

    // Filter the recipients based on the properties settings.
    logger.debug("Filtering email addresses for "
                 + subject
                 + ": "
                 + addresses_to);
    to = filterAddresses(to);
    StringBuilder builder = new StringBuilder();
    String sep = "";
    if (to != null) {
      for (int i = 0; i < to.length; i++) {
        builder.append(sep);
        builder.append(to[i]);
        sep = ",";
      }
    }
    String addresses = builder.length() > 0 ? builder.toString() : null;
    logger.debug("Filtered email addresses to "
                 + (addresses == null ? "none" : addresses));

    // Proceed only if there are recipients.
    if (to != null) {

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
  }

  /**
   * Filter a set of addresses based on the SEND_MAIL application propery. If
   * the property is set to "none", return null. If the property is set to
   * "curator", filter out all the non-curator addresses. If the property is set
   * to "any", filter out no addresses.
   * 
   * @param addresses the email addresses to filter in a canonical array of
   *          single email addresses
   * @return an array of filtered email addresses
   */
  static private InternetAddress[] filterAddresses(InternetAddress[] addresses) {
    String sendMailStatus = WebApp.getProperty(SEND_MAIL_PROPERTY);
    InternetAddress[] returnArray = null;
    // Proceed only if mail is to be sent.
    if (!sendMailStatus.equalsIgnoreCase(SEND_MAIL_NONE)) {
      // Allocate the minimal array for return.
      if (addresses.length > 0) {
        ArrayList<InternetAddress> list =
          new ArrayList<InternetAddress>(addresses.length);
        for (int i = 0; i < addresses.length; i++) {
          boolean sendCurator =
            sendMailStatus.equalsIgnoreCase(SEND_MAIL_CURATOR);
          boolean curator = isCurator(addresses[i]);
          if (sendCurator && curator) {
            // If sending only to curators, validate the address and add it.
            list.add(addresses[i]);
            logger.debug("Sending curator email to " + addresses[i]);
          } else if (sendCurator) {
            logger.debug("Not sending curator email to non-curator address "
                         + addresses[i]);
          } else if (sendMailStatus.equalsIgnoreCase(SEND_MAIL_ANY)) {
            // If sending to anyone, just add the address.
            list.add(addresses[i]);
            logger.debug("Sending email to " + addresses[i]);
          } else {
            logger.debug("Unknown value of SEND_MAIL: \""
                         + sendMailStatus
                         + "\"");
          }
        }
        // If there is any address, convert the list to an array, creating a
        // larger one if necessary.
        if (list.size() > 0) {
          returnArray = new InternetAddress[1];
          returnArray = list.toArray(returnArray);
        } else {
          logger.debug("Output address list is empty");
        }
      } else {
        logger.debug("No emails in list to filter");
      }
    } else {
      logger.debug("Email is completely disabled");
    }
    return returnArray;
  }

  /**
   * Query the TAIR database to determine whether an email address corresponds
   * to a TAIR or external curator.
   * 
   * @param address the email address
   * @return
   */
  static private boolean isCurator(InternetAddress address) {
    return QueryUser.isCuratorEmail(address.getAddress());
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
