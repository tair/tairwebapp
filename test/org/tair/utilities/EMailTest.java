package org.tair.utilities;


import static org.junit.Assert.assertTrue;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.junit.Test;


/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */

/**
 * Test the EMail utility class.
 * 
 * @author Robert J. Muller
 */
public class EMailTest {
  private static final String SEND_MAIL = "SEND_MAIL";
  private static final String HOST = WebApp.getProperty("MAIL_HOST");
  private static final String FROM = "bmuller@stanford.edu";
  private static final String CURATOR = "techteam@tairgroup.org";
  private static final String NON_CURATOR = "bmuller@stanford.edu";
  private static final String MULTI_NON_CURATOR =
      "bmuller@stanford.edu,bob@poesys.com,muller@computer.org";
  private static final String MULTI_MIXED = CURATOR + ",bmuller@stanford.edu";

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "any" option.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringAny()
      throws AddressException, MessagingException {
    // allow all mail to be sent
    WebApp.setTestProperty(SEND_MAIL, "any");
    EMail.send(HOST, FROM, NON_CURATOR, "1 - Any EMail test",
               "Testing EMail with the \"any\" property set.");
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "none" option.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringNone()
      throws AddressException, MessagingException {
    // allow no mail to be sent, so should not go out to specified email
    WebApp.setTestProperty(SEND_MAIL, "none");
    EMail.send(HOST, FROM, NON_CURATOR, "2 - FAIL No EMail test",
               "Testing EMail with the \"none\" property set.");
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "curator" option with a curator email address.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringCurator()
      throws AddressException, MessagingException {
    // allow mail to be sent only to registered curators, the email should be
    // such a curator email address
    WebApp.setTestProperty(SEND_MAIL, "curator");
    EMail.send(HOST, FROM, CURATOR, "3 - Curator EMail test",
               "Testing EMail with the \"curator\" property set.");
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "curator" option with a non-curator email address.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringCuratorFail()
      throws AddressException, MessagingException {
    // allow mail to be sent only to registered curators, the email should be
    // a non-curator email address and should result in no mail sent
    WebApp.setTestProperty(SEND_MAIL, "curator");
    EMail.send(HOST, FROM, NON_CURATOR, "4 - FAIL: Non-Curator EMail test",
               "Testing EMail with the \"curator\" property set.");
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "curator" option with multiple email addresses, one of which is a
   * curator.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringMultiCurator()
      throws AddressException, MessagingException {
    // allow mail to be sent only to registered curators, the email should be
    // multiple addresses with a single curator address
    WebApp.setTestProperty(SEND_MAIL, "curator");
    EMail
        .send(HOST, FROM, MULTI_MIXED,
              "5 - Multiple-Address Curator EMail test",
              "Testing EMail with the \"curator\" property set and multiple to-addresses.");
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "curator" option with multiple email addresses none of which are
   * curators.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringMultiNonCurator()
      throws AddressException, MessagingException {
    // allow mail to be sent only to registered curators, the email should be
    // multiple addresses with a single curator address
    WebApp.setTestProperty(SEND_MAIL, "curator");
    EMail
        .send(
              HOST,
              FROM,
              MULTI_NON_CURATOR,
              "6 - FAIL Multiple-Address Non-Curator EMail test",
              "Testing EMail with the \"curator\" property set and multiple to-addresses, none of which are curators.");
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "any" option with multiple email addresses including a curator.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringMultiMixed()
      throws AddressException, MessagingException {
    // allow mail to be sent to anyone with multiple email addresses in the
    // to-address
    WebApp.setTestProperty(SEND_MAIL, "any");
    EMail
        .send(
              HOST,
              FROM,
              MULTI_MIXED,
              "7 - Multiple-Address EMail test",
              "Testing EMail with the \"any\" property set and multiple to-addresses including a curator.");
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, boolean)}.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringBooleanTrue()
      throws AddressException, MessagingException {
    // allow all mail to be sent
    WebApp.setTestProperty(SEND_MAIL, "any");
    EMail
        .send(HOST, FROM, NON_CURATOR, "Any EMail test",
              "Testing EMail with the \"any\" property set and cc true.", true);
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, boolean)}.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringBooleanFalse()
      throws AddressException, MessagingException {
    // allow all mail to be sent
    WebApp.setTestProperty(SEND_MAIL, "any");
    EMail.send(HOST, FROM, NON_CURATOR, "Any EMail test",
               "Testing EMail with the \"any\" property set and cc false.",
               false);
    assertTrue(true);
  }

  /**
   * Test method for
   * {@link org.tair.utilities.EMail#send(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)}.
   * Uses the "curator" option with a curator email address that has multiple
   * entries in the database with one marked as a curator.
   * 
   * @throws MessagingException
   * @throws AddressException
   */
  @Test
  public void testSendStringStringStringStringStringMultiuserCurator()
      throws AddressException, MessagingException {
    // allow mail to be sent only to registered curators, the email should be
    // such a curator email address
    WebApp.setTestProperty(SEND_MAIL, "curator");
    EMail
        .send(
              HOST,
              FROM,
              "crist.30@osu.edu",
              "8 - Multiple-Entry Curator EMail test",
              "Testing EMail with the \"curator\" property set for an email address with multiple database entries, one of which is marked as 'is_curator'.");
    assertTrue(true);
  }

}
