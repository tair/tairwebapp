/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.jboss.logging.Logger;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;


/**
 * Query user information from the TAIR registration database.
 * 
 * @author Robert J. Muller
 */
public class QueryUser {
  private static final Logger logger = Logger.getLogger(QueryUser.class);
  /** Get curator status using email */
  private static final String SQL =
      "SELECT p.is_tair_curator, p.is_external_curator "
          + "FROM Community c JOIN Person p ON c.community_id = p.community_id "
          + "WHERE c.is_obsolete = 'F' AND c.status = 'active' "
          + "AND c.email = ? AND p.send_mail = 'T'";

  /**
   * Is the user with the designated email a curator?
   * 
   * @param email the user's email
   */
  public synchronized static boolean isCuratorEmail(String email) {
    ResultSet results = null;
    DBconnection c = null;
    boolean isCurator = false;

    try {
      // WebApp should have appropriate non-JNDI defaults for testing
      c = DBReadManager.getInstance().get_connection();
      c.setQuery(SQL);
      c.setQueryVariable(1, email);
      results = c.getResultSet();

      // There could be multiple users with the same email, only one of which
      // is actually a curator.
      while (results.next()) {
        boolean tairCurator = toBoolean(results.getString("is_tair_curator"));
        boolean extCurator = toBoolean(results.getString("is_external_curator"));
        if (tairCurator || extCurator) {
          isCurator = true;
          logger.debug("Found that email " + email + " was curator");
          break; // done once a curator is found
        }
      }
    } catch (SQLException e) {
      logger.error("SQL error checking curator status of email " + email + ":" + e.getMessage(), e);
      throw new RuntimeException(e.getMessage(), e);
    } finally {
      if (c != null) {
        c.releaseResources();
      }
    }
    return isCurator;
  }

  /**
   * Convert a TAIR boolean string (T or F) into a Java boolean. If the string
   * is null, return false. If the string is T or t, return true. Otherwise,
   * return false.
   * 
   * @param tairBoolean the incoming single-character truth value representation
   * @return true or false
   */
  private static boolean toBoolean(String tairBoolean) {
    boolean retVal = false;
    if (tairBoolean != null) {
      if ("T".equalsIgnoreCase(tairBoolean)) {
        retVal = true;
      }
    }
    return retVal;
  }
}
