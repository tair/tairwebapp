/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.abrc;


import java.io.IOException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.faces.FacesException;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.tair.community.LoginChecker;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.GuiPage;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;

import com.poesys.db.DbErrorException;
import com.poesys.db.InvalidParametersException;
import com.poesys.db.connection.ConnectionFactoryFactory;
import com.poesys.db.connection.IConnectionFactory.DBMS;


/**
 * A Faces managed bean that supports the simple survey on the new Protein Chip
 * that ABRC is selling.
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="news")
@SessionScoped
public class GuiProteinChipSurvey extends GuiPage {
  /**
   * Java serial version UID generated automatically for serialization.
   */
  private static final long serialVersionUID = 8829830747734142025L;
  /**
   * The TAIR community id for the logged-in user
   */
  private BigInteger communityId;
  /**
   * The name of the logged-in user
   */
  private String user;
  /**
   * The number of ABRC chips the user might want to order in the future
   */
  private Integer numberOfChips;
  /**
   * Whether the user is interested in future chips
   */
  private Boolean futureInterest;

  /**
   * Whether the survey has been submitted
   */
  private Boolean submitted;

  private static final String QUERY =
    "SELECT community_id, number_of_chips, future_order FROM ABRCProteinChipSurvey WHERE community_id = ?";
  private static final String INSERT =
    "INSERT INTO ABRCProteinChipSurvey (community_id, number_of_chips, future_order) VALUES (?, ?, ?)";

  /**
   * Create a ProteinChipSurvey object.
   */
  public GuiProteinChipSurvey() {
  }

  // This is a one-off special piece of code; don't bother to convert to Poesys/DB

  /**
   * Get a connection to the poesystest subsystem. This method calls a private
   * method, getPassword(), to get the database password. This is a temporary
   * method that supports connections directly instead of using Poesys/DB
   * delegates.
   * 
   * 
   * @param dbms the kind of DBMS from which to get the connection
   * @param subsystem the subsystem to test; corresponds to the actual test
   *            database
   * 
   * @return an open connection to the database
   * @throws SQLException when there is a database problem getting the
   *             connection
   * @throws IOException when there is a problem reading the database.properties
   *             file that initializes connections
   */
  protected Connection getConnection(DBMS dbms, String subsystem)
      throws SQLException, IOException {
    Connection connection = null;
    try {
      connection =
        ConnectionFactoryFactory.getInstance(subsystem, dbms).getConnection();
    } catch (SQLException e) {
      Debugger.logMsg(this, e.getMessage());
      throw e;
    } catch (IOException e) {
      Debugger.logMsg(this, e.getMessage());
      throw e;
    } catch (InvalidParametersException e) {
      Debugger.logMsg(this, e.getMessage());
      throw new DbErrorException("Couldn't get default connection", e);
    }
    return connection;
  }

  /**
   * Get the community id.
   * 
   * @return a community id
   */
  public BigInteger getCommunityId() {
    return communityId;
  }

  /**
   * Set the community id.
   * 
   * @param id a community id
   */
  public void setCommunityId(BigInteger id) {
    this.communityId = id;
  }

  /**
   * Get the user.
   * 
   * @return a user
   */
  public String getUser() {
    return user;
  }

  /**
   * Set the user.
   * 
   * @param user a user
   */
  public void setUser(String user) {
    this.user = user;
  }

  /**
   * Get the numberOfChips.
   * 
   * @return a numberOfChips
   */
  public Integer getNumberOfChips() {
    return numberOfChips;
  }

  /**
   * Set the numberOfChips.
   * 
   * @param numberOfChips a numberOfChips
   */
  public void setNumberOfChips(Integer numberOfChips) {
    this.numberOfChips = numberOfChips;
  }

  /**
   * Get the futureInterest.
   * 
   * @return a futureInterest
   */
  public Boolean getFutureInterest() {
    return futureInterest;
  }

  /**
   * Set the futureInterest.
   * 
   * @param futureInterest a futureInterest
   */
  public void setFutureInterest(Boolean futureInterest) {
    this.futureInterest = futureInterest;
  }

  @Override
  public String load() {

    // Load the user name from the session if the user is logged in.
    // Use the old LoginChecker to check the session-based login
    HttpServletRequest request =
      (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
    if (LoginChecker.isLoggedIn(request)) {
      try {
        communityId = SessionHandler.getCommunityID(request);
        user = SessionHandler.getPersonName(request);
        // Check whether user has already submitted survey
        loadPersistedData(communityId);
      } catch (InvalidLoginException e) {
        throw new RuntimeException("Not logged in for survey", e);
      } catch (InvalidSessionException e) {
        throw new RuntimeException("Your session has expired; log in again.", e);
      }
    }

    // Return null to redisplay the page.
    return null;
  }

  /**
   * Load the survey data for a user. The data consists of the number of chips
   * and the future-interest flag. If the user has submitted a survey, the
   * method sets the submitted flag. If the user has not submitted a survey,
   * the method sets the submitted flag to false and the number of chips and
   * the future-interest flag to null.
   * 
   * @param communityId the unique id for the user
   * @throws FacesException when the community id is null or when there is a
   *             problem looking up the id in the database
   */
  private void loadPersistedData(BigInteger communityId) throws FacesException {
    // Community id must not be null.
    if (communityId == null) {
      throw new FacesException("Not logged in but checking submitted survey");
    }

    // Look up the community id in the survey table to see if already submitted
    ResultSet results = null;
    DBReadManager mgr = null;
    DBconnection c = null;
    try {
      mgr = DBReadManager.getInstance();
      c = mgr.get_connection();
      c.setQuery(QUERY);
      c.setQueryVariable(communityId);
      results = c.getResultSet();

      // Get the result; if there is one, set submitted to true.
      if (results.next()) {
        submitted = true;
        numberOfChips = results.getInt("number_of_chips");
        futureInterest = results.getInt("future_order") == 1 ? true : false;
      }
    } catch (SQLException e) {
      Debugger.logMsg(e, e.getMessage());
      throw new FacesException(e.getMessage(), e);
    } finally {
      if (mgr != null) {
        // Close the connection and its resources.
        DBReadManager.return_connection(c);
      }
    }
  }

  /**
   * Submit the survey by storing the information in the database.
   * 
   * @return null to redisplay the page.
   */
  public String submitSurvey() {
    // Insert the id, number of chips, and interest flag.
    DBWriteManager mgr = null;
    DBconnection c = null;
    try {
      mgr = DBWriteManager.getInstance();
      c = mgr.getSearchConnection();

      c.setQuery(INSERT);
      c.setQueryVariable(1, communityId);
      c.setQueryVariable(2, numberOfChips);
      c.setQueryVariable(3, futureInterest ? 1 : 0);
      c.executeUpdate();

      submitted = true;
    } catch (SQLException e) {
      Debugger.logMsg(e, e.getMessage());
      throw new FacesException(e.getMessage(), e);
    } finally {
      if (mgr != null) {
        // Close the connection and its resources.
        DBWriteManager.return_connection(c);
      }
    }

    return null;
  }

  /**
   * Whether the survey has been submitted
   * 
   * @return true if submitted, false if not
   */
  public Boolean getSubmitted() {
    return submitted;
  }

  /**
   * Set the submitted.
   * 
   * @param submitted a submitted
   */
  public void setSubmitted(Boolean submitted) {
    this.submitted = submitted;
  }
}
