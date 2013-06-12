package org.tair.community;


import java.sql.SQLException;
import java.util.Collection;

import org.jboss.logging.Logger;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.utilities.Debugger;
import org.tair.utilities.EMail;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.WebApp;


/**
 * CommunityEmailHandler sends all emails related to Community update functions
 * to recipients including TAIR curators and users. Environment specific values
 * such as MAIL_HOST name are found in WebApp object.
 */

public class CommunityEmailHandler {
  private static final Logger logger = Logger.getLogger(CommunityEmailHandler.class);

  /**
   * URL to include in emails as link directly to specific person's profile page
   */
  public static final String personURL =
    WebApp.getServerURL()
        + "/servlets/Community?type=person&action=edit&communityID=";

  /**
   * URL to include in emails as link directly to specific organization's
   * profile page
   */
  public static final String orgURL =
    WebApp.getServerURL()
        + "/servlets/Community?type=org&action=edit&communityID=";

  /**
   * convenience method to send mail w/given address, subject & message
   */
  private static void send(String toAddress, String subject, String msg)
      throws InvalidParameterException {

    try {
      if (toAddress != null) {
        EMail.send(WebApp.getProperty("MAIL_HOST"),
                   WebApp.getProperty("FROM_ADDRESS"),
                   toAddress,
                   subject,
                   msg);
      }
    } catch (Exception e) {
      throw new InvalidParameterException("Mail could not be sent to "
                                          + toAddress + " : " + e.getMessage());
    }
  }

  /**
   * Sends email to user when a new Community record has just been activated
   * 
   * @param person Person just activated
   */
  public static void sendPersonActivatedMessage(BsPerson person) {
    String subject = "New TAIR Account";

    try {
      send(person.getCommunity().getEmail(),
           subject,
           getUserMessage(person.getCommunity()));

      // disregard bad email from person
    } catch (InvalidParameterException ipe) {
      ipe.printStackTrace();
    }
  }

  /**
   * Sends email to affiliated persons of submitted organization when
   * organization has just been activated
   * 
   * @param person Person just activated
   * @throws InvalidParameterException thrown if mail is sent to an invalid
   *           email address
   */
  public static void sendOrganizationActivatedMessage(BsOrganization org)
      throws InvalidParameterException {

    Collection<BsCommunity> members = null;
    try {
      members = org.getMember();
    } catch (SQLException e) {
      throw new RuntimeException("Couldn't lazily load affiliated community members for organization "
                                 + org.getOrganizationId());
    }
    if (members != null) {
      for (BsCommunity member : members) {
        if (member.getEmail() != null) {
          try {
            send(member.getEmail(),
                 "New TAIR Account",
                 getAffiliateMessage(org.getName(), member.getName()));

            // if bad address, catch exception & continue
          } catch (InvalidParameterException e) {
            Debugger.println("Bad email address in sendOrganizationActivatedMessage");
            e.printStackTrace();
          }
        }
      }
    }
  }

  // return text telling user their login info.
  private static String getUserMessage(BsCommunity community) {
    String msg =
      "Dear "
          + community.getName()
          + "\n\n"
          + "You have an account in TAIR. \n"
          + "Please note your TAIR login and password.\n\n"
          + "User Name : "
          + community.getUserName()
          + "\n"
          + "Password  : "
          + community.getPassword()
          + "\n\n"
          + "You will not need your login and password for browsing in \n"
          + "the database, but only for placing stock orders or updating your \n"
          + "personal information. \n";

    return msg;
  }

  // return text to tell a person their organization has been activated
  private static String getAffiliateMessage(String orgName, String affiliateName) {
    String affiliateMessage =
      "Dear "
          + affiliateName
          + "\n\n"
          + "This is to notify you that your new affiliate organization, "
          + orgName
          + " has been activated. \n"
          + "If you have recently registered yourself, you will receive a "
          + "similar activation notice "
          + "when your account is activated.\n\n"
          + "Note that it is not necessary to be active for browsing in \n"
          + "the database, but only for placing stock orders or updating your \n"
          + "personal information. \n";
    return affiliateMessage;
  }

  /**
   * Sends email to person reminding them of their username and password
   * 
   * @param person <code>BsPerson</code> representing user who needs
   *          reminding
   * @param emailAddress Address to send reminder to - may be different from
   *          address stored in person
   * @throws InvalidParameterException thrown if mail is sent to an invalid
   *           email address
   */
  public static void sendPasswordReminder(BsPerson person,
                                          String emailAddress)
      throws InvalidParameterException {

    String subjText = "TAIR Login Reminder";
    String msg =
      "Dear Mr./Ms. "
          + person.getLastName()
          + "\n\n"
          + "We have provided your TAIR login and password below.\n\n"
          + "TAIR Login : "
          + person.getCommunity().getUserName()
          + "\n"
          + "Password   : "
          + person.getCommunity().getPassword()
          + "\n\n"
          + "You will not need your login and password for browsing in the "
          + "database, but only for placing ABRC stock orders or updating your "
          + "personal information.\n\n"
          + "Feel free to contact us if you have problems. "
          + "Thank you for using TAIR and ordering ABRC stocks.";

    logger.debug("Sending email to " + emailAddress);
    send(emailAddress, subjText, msg);
  }

}
