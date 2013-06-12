// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.31 $
// $Date: 2005/06/13 19:14:33 $
// ------------------------------------------------------------------------------

package org.tair.tfc;


import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.jboss.logging.Logger;


/**
 * DatabaseManager is an abstract class that handles database connection access
 * for the application. This class will get a connection via JNDI or creates a
 * plain old JDBC connection.
 */

public abstract class DatabaseManager {
  protected static final Logger logger = Logger.getLogger(DatabaseManager.class);
  protected String dataSourceName;
  private DataSource dataSource;

  // Connection info for making a direct connection to the database.
  private String driver;
  protected String url;
  protected String user;
  private String password;

  /**
   * Creates an instance of DatabaseManager that will allow access to database
   * connections with the submitted connection info.
   * 
   * @param driver JDBC driver class name to use when making manual db
   *          connections
   * @param url JDBC url to connect to when making manual db connections
   * @param user User name to connect with when making manual db connections
   * @param password Password to connect with when making manual db connections
   * @param dataSourceName Name to use when looking up DataSource object through
   *          JNDI when running in application server context.
   * @throws InstantiationException if an error occurs when manually creating db
   *           connections
   * @throws ClassNotFoundException if submitted driver class name is not found
   *           when manually creating db connections
   * @throws IllegalAccessException if a security error occurs when manually
   *           creating db connections
   * @throws SQLException if an error occurs while trying to get access to the
   *           configured DataSource, or another error occurs when manually
   *           connecting to the db.
   */
  public DatabaseManager(String driver,
                         String url,
                         String user,
                         String password,
                         String dataSourceName) throws InstantiationException,
      ClassNotFoundException, IllegalAccessException, SQLException {
    this.driver = driver;
    this.url = url;
    this.user = user;
    this.password = password;
    this.dataSourceName = dataSourceName;
  }

  /**
   * Retrieves a datasource via JNDI
   */
  private void getDataSource() {
    InitialContext ctx = null;
    try {
      ctx = new InitialContext();
      dataSource = (DataSource)ctx.lookup(dataSourceName);
      logger.debug("Using JNDI data source " + dataSourceName);
    } catch (Exception e) {
      logger.debug("Using JDBC data source instead of JNDI data source "
                  + dataSourceName);
    }
  }

  /**
   * Returns a database connection (retrieve via dataSource or create a new JDBC
   * connection).
   * 
   * @return a DBconnecton wrapper for a JDBC connection
   * @throws SQLException if there is a problem getting the connection using a
   *           direct JDBC connection
   */
  public DBconnection get_connection() throws SQLException {
    Connection connection = null;
    try {
      DBconnection wrapper = new DBconnection(true);
      try {
        if (dataSource == null) {
          getDataSource();
        }
        connection = dataSource.getConnection();
        wrapper.setJdbcConnection(connection);
      } catch (SQLException e) {
        // Try to get a connection from a fresh DataSource.
        getDataSource();
        connection = dataSource.getConnection();
        wrapper.setJdbcConnection(connection);
      }
      return wrapper;
    } catch (Exception e) {
      // Log and ignore exception.
      logger.debug("Error while getting TAIR connection", e);
    } finally {
      logger.debug("Acquired TAIR DatabaseManager connection " + connection);
    }

    return new DBconnection(driver, url, user, password);
  }

  /**
   * Returns connection to pool and frees any resources that have accumulated
   * with connection (statements and result sets).
   * 
   * @param conn Connection to return to pool
   */
  static public void return_connection(DBconnection conn) {
    if (conn != null) {
      try {
        Connection jdbcConn = conn.getJdbcConnection();
        if (jdbcConn != null) {
          logger.debug("Closing TAIR DatabaseManager connection " + jdbcConn);
          jdbcConn.close();
        }
      } catch (SQLException sqe) {
        logger.debug("Error while returning connection", sqe);
      }
      conn.releaseResources();
      conn.removeJdbcConnection();
    }
  }
}
