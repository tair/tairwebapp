// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.56 $
// $Date: 2006/03/20 18:04:20 $
// ------------------------------------------------------------------------------

package org.tair.tfc;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLRecoverableException;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;
import org.jboss.logging.Logger;
import org.tair.utilities.DataBaseConnectionException;
import org.tair.utilities.Debugger;
import org.tair.utilities.WebApp;


/**
 * DBconnection is the main class used for all database access in the TAIR
 * application. DBconnection contains a number of JDBC objects such as
 * Connection, ResultSet and PreparedStatement and provides a number wrapper
 * functions to execute SQL queries and retrieve results from them.
 * 
 * <p>
 * Because DBconnection contains ResultSet and PreparedStatement instances, it
 * is very important that all client code clean up those resources through a
 * call to releaseResources following every query submitted through
 * DBconnection. If this is not done, a memory leak could occur as these objects
 * accumulate.
 * 
 * <p>
 * The actual JDBC Connection instance contained by DBconnection will be created
 * in two different ways depending on the context in which application code is
 * being executed.
 * 
 * <p>
 * During normal execution within the application server as part of the TAIR
 * website, Connection objects are created and managed by DataSource objects
 * configured through the application server. DatabaseManager, the abstract
 * parent class of the DBReadManager and DBWriteManager connection pools, takes
 * care of retrieving these objects from the DataSource and manually setting the
 * reference to the Connection object on each DBconnection wrapper object for
 * every request it receives. When the DBconnection is returned to the manager
 * instance, the JDBC Connection reference is removed from this wrapper class
 * and returned to the DataSource's connection pool.
 * 
 * <p>
 * If application code is being executed outside of the application server
 * context (as part of unit testing or other maintenance code), the JDBC
 * Connection object will be created through DriverManager locally. The
 * connection info. used to create the connection will depend on which version
 * of the constructor is used - the default (no parameter) constructor will
 * create a read only instance using the connection info. specified in the
 * WebApp object. If connection info. is submitted to the constructor, the
 * Connection will be created using the submitted info.
 * 
 * <p>
 * To facilitate the creation of empty DBconnection objects that will have their
 * Connection references set through DatabaseManager, a third constructor is
 * offered that allows the optional creation of the JDBC connection.
 * 
 * <p>
 * To allow debugging of sequences of SQL statements being executed through a
 * connection, you can turn on debugging (setDebugging(true)) and the log will
 * show all queries, all string variables set, all executions of the queries,
 * and all closing of the statements--all identified by the query statement's
 * object id so you can follow a specific statement through its lifecycle. This
 * facility generates a LOT of messages, so use it locally and wisely.
 * 
 */

public class DBconnection {
  /** Logger for this class */
  private static final Logger logger = Logger.getLogger(DBconnection.class);

  /** Cached JDBC read-write data source */
  private static DataSource readWriteDataSource = new DataSource();

  /** Constant validation interval in milliseconds */
  private static final int VALIDATION_INTERVAL = 30000;

  /**
   * Constant minimum amount of time an object may sit idle in the pool before
   * it is eligible for eviction
   */
  private static final int IDLE_TIME = 60 * 1000;

  /** Constant time between idle-connection eviction runs in milliseconds */
  private static final int EVICTION_INTERVAL = 5 * 60 * 1000;

  /** Minimum number of connections in pool after eviction */
  private static final int MIN_POOL_SIZE = 5;

  /** Maximum number of connections in pool */
  private static final int MAX_POOL_SIZE = 100;

  /** Starting number of connections in pool */
  private static final int INITIAL_POOL_SIZE = 5;

  /** Constant maximum wait for an available connection in milliseconds */
  private static final int MAX_WAIT = 10000;
  
  /** Number of retries for connection if get recoverable error */
  private static final int RETRY_LIMIT = 5;

  /**
   * Constant time allowed for a connection to return a result; this is a
   * relatively long 60 minutes because the TFC classes query huge amounts of
   * data with a single connection, and doing several of them together in a list
   * can take a very long time in batch processing.
   */
  private static final int TIMEOUT = 60 * 60;

  /**
   * SQL query currently being executed by statement object. This is held as a
   * member variable so that query can be included in any error logging that may
   * occur after the execution of a statement.
   */
  private String query;

  /** Statement object that executes submitted SQL queries. */
  private PreparedStatement prepStmt;

  /**
   * Results of a statement that was just executed. A reference to this result
   * set will be returned to client code when getResultSet is called
   */
  private ResultSet results;

  /**
   * The actual connection to the database. This will be created locally if code
   * is running in stand alone mode outside of the application server, or will
   * be accessed by DatabaseManager through a DataSource and manually set here
   * when running within the application server context
   */
  private Connection conn;

  /** Turn debugger messages on or off */
  private boolean debugging = false;

  /**
   * Is the Debugger turned on for connection statements?
   * 
   * @return true if on, false if not on
   */
  public boolean isDebugging() {
    return debugging;
  }

  /**
   * Set SQL statement debugging on or off. This method lets you control the
   * output of debugging messages about queries to the log. You can use these
   * messages to find statements that aren't closed, for example.
   * 
   * @param debugging true to turn on debugging, false to turn it off
   */
  public void setDebugging(boolean debugging) {
    this.debugging = debugging;
  }

  /**
   * Creates an instance of DBconnection that opens a JDBC Connection to the
   * database using the default (readonly) connection info.
   * 
   * <p>
   * This constructor version should only be used for code such as unit testing
   * code that is meant to run outside of the application server context. All
   * regular website application code should only get access to DBconnection
   * objects through the DBReadManager or DBWriteManager connection pools.
   * 
   * @throws DataBaseConnectionException if an error occurs while creating a
   *           default JDBC connection
   */
  public DBconnection() throws DataBaseConnectionException {
    createDefaultConnection();
  }

  /**
   * Creates an instance of DBconnection, optionally creating a default
   * (readonly) JDBC connection through DriverManager. This version of the
   * constructor is supplied so that DatabaseManager can create empty versions
   * of DBconnection and manually set JDBC Connection references as needed.
   * 
   * @param createEmpty If <code>true</code>, no JDBC Connection is created
   *          during object initialization; if <code>false</code> a default
   *          (readonly) Connection will be created.
   * @throws DataBaseConnectionException if an error occurs while creating a
   *           default JDBC connection
   */
  public DBconnection(boolean createEmpty) throws DataBaseConnectionException {

    if (!createEmpty) {
      createDefaultConnection();
    }
  }

  /**
   * Creates an instance of DBconnection that opens a JDBC Connection to the
   * database using the submitted connection info.
   * 
   * <p>
   * This constructor version should only be used for code such as unit testing
   * or other maintenance code that is meant to run outside of the application
   * server context. All regular website application code should only get access
   * to DBconnection objects through the DBReadManager or DBWriteManager
   * connection pools.
   * 
   * <p>
   * This version is offered to allow for the case where a webwriter connection
   * is required for code running in stand-alone mode.
   * 
   * @param driver database driver class name
   * @param url database url
   * @param user database user name
   * @param password database user password
   * @throws DataBaseConnectionException if an error occurs while creating a
   *           JDBC connection
   * @throws SQLException when there is a JDBC driver problem
   */

  public DBconnection(String driver, String url, String user, String password)
      throws DataBaseConnectionException, SQLException {

    createJdbcConnection(driver, url, user, password);
    set_auto_commit_mode();
  }

  /**
   * Retrieves the default (readonly) connection info. from the WebApp file and
   * creates a JDBC Connection with it.
   * 
   * @throws DataBaseConnectionException if an error occurs while creating a
   *           default JDBC connection
   */
  private void createDefaultConnection() throws DataBaseConnectionException {
    createJdbcConnection(WebApp.getProperty("DRIVER_NAME"),
                         WebApp.getProperty("CONNECTION_URL"),
                         WebApp.getProperty("CONNECTION_NAME"),
                         WebApp.getProperty("CONNECTION_PASSWORD"));
  }

  /**
   * Creates a JDBC Connection through the DriverManager using the submitted
   * connection info.
   * 
   * @param driver database driver name
   * @param url database url
   * @param user database user name
   * @param password database user password
   * @throws DataBaseConnectionException when an error occurs while creating a
   *           JDBC connection
   */
  private void createJdbcConnection(String driver, String url, String user,
                                    String password)

  throws DataBaseConnectionException {
    int retries = 0;
    while (retries < RETRY_LIMIT) {

      try {
        // Initialize the singleton default data source, a read-write data
        // source.
        if (readWriteDataSource.getDriverClassName() == null) {
          PoolProperties p = new PoolProperties();
          logger.debug("Connecting with pooled JDBC URL: " + url);
          p.setUrl(url);
          p.setDriverClassName(driver);
          p.setUsername(user);
          p.setPassword(password);
          p.setJmxEnabled(false);
          p.setValidationQuery("SELECT 1 FROM DUAL");
          p.setMinEvictableIdleTimeMillis(IDLE_TIME);
          p.setTimeBetweenEvictionRunsMillis(EVICTION_INTERVAL);
          p.setMinIdle(MIN_POOL_SIZE);
          p.setMaxActive(MAX_POOL_SIZE);
          p.setInitialSize(INITIAL_POOL_SIZE);
          p.setMaxWait(MAX_WAIT);
          p.setRemoveAbandoned(false);
          readWriteDataSource.setPoolProperties(p);
        }

        logger.debug("Pool has "
                     + readWriteDataSource.getNumIdle()
                     + " idle connections.");
        logger.debug("Pool has "
                     + readWriteDataSource.getNumActive()
                     + " active connections.");

        conn = readWriteDataSource.getConnection();

        if (conn == null) {
          throw new DataBaseConnectionException("Could not get JDBC connection with pooled JDBC URL: "
                                                + url);
        }
        
        break; // stop retrying at this point, succeeded

      } catch (SQLRecoverableException ex) {
        // Probably a connection-reset error, try up to retry limit
        retries++;
      } catch (SQLException ex) {
        DataBaseConnectionException exception =
          new DataBaseConnectionException("Database connection failed: "
                                          + ex.getMessage());
        exception.fillInStackTrace();
        logger.error("SQL exception using JDBC driver "
                     + driver
                     + " with URL "
                     + url
                     + ": "
                     + ex.getMessage(), ex);
        throw exception;
      }
    }
  }

  /**
   * Sets local reference to JDBC Connection object. This should only be done by
   * DatabaseManager as client code requests a connection. This allows
   * DatabaseManager to get JDBC Connection from DataSource and manually set
   * reference here instead of relying on DriverManager to create connection.
   * 
   * @param conn JDBC connection to set local reference to.
   */
  protected void setJdbcConnection(Connection conn) {
    this.conn = conn;
  }

  /**
   * Sets local reference to JDBC Connection object to NULL. This should only be
   * done by DatabaseManager as client code returns a connection to the pool.
   * Since DBconnections are separately cached for reuse, setting the local
   * reference to null ensures that JDBC connection does not stay bound to this
   * wrapper instance. Setting reference to null does not set the connection
   * itself to NULL (that connection is returned to DataSource's pool of
   * connections), but it removes the local reference to it.
   */
  protected void removeJdbcConnection() {
    this.conn = null;
  }

  /**
   * Returns reference to local JDBC Connection object. This reference is
   * returned to DatabaseManager when client code returns the connection to the
   * pool. DatabaseManager separates the JDBC connection from this wrapper
   * instance and returns both objects to their respective pools
   * 
   * @return Local JDBC Connection
   */
  public Connection getJdbcConnection() {
    return conn;
  }

  /**
   * Creates a PreparedStatement object for sending parameterized SQL statements
   * to the database. A SQL statement with or without IN parameters can be
   * pre-compiled and stored in a PreparedStatement object. This object can then
   * be used to efficiently execute this statement multiple times. This function
   * will initialize the prepStmt in DBconnection and acts as a wrapper to the
   * prepareStatement method of the JDBC Connection.
   * 
   * @param query the standard query language statement
   * @param returnColumns the list of column names for returned id values
   * @throws SQLException in the case of invalid query statement
   */
  public void setInsertQuery(String query, String returnColumns)
      throws SQLException {

    try {
      this.query = query; // save locally for reference in case of error
      prepStmt = conn.prepareStatement(query, new String[] { returnColumns });

      // set timeout for all queries to ten minutes
      prepStmt.setQueryTimeout(600);
    } catch (SQLException ex) {
      java.util.Date now = new java.util.Date();
      logger.error("Error on query preparation: "
                   + now.toString()
                   + "\n"
                   + query);

      throw ex;
    }
  }

  /**
   * Set the query string into the connection object.
   * 
   * @param query the SQL query
   * @throws SQLException when a problem setting the JDBC connection object
   *           occurs
   */
  public void setQuery(String query) throws SQLException {

    try {
      this.query = query; // save locally for reference in case of error

      logger.debug("Preparing query \"" + query + "\"");
      prepStmt = conn.prepareStatement(query);

      // set timeout for all queries to ten minutes
      prepStmt.setQueryTimeout(600);
    } catch (SQLException ex) {
      logger.error("Error on query preparation for query  \""
                   + query
                   + "\" : "
                   + ex.getMessage());
      throw ex;
    }
  }

  /**
   * Manually sets query timeout to submitted value. This overrides the default
   * of 600 seconds (10 minutes) that is set automatically when setQuery() is
   * called. To override default value, this method must be called AFTER
   * setQuery() has been called, but BEFORE the query is executed.
   * 
   * <p>
   * In normal website operation, this default value should be more than
   * sufficient, however there are special cases (like in Map/Seq viewer data
   * population when a longer timeout is required to avoid timeouts during long,
   * but needed queries.
   * 
   * <p>
   * Wrapper to the JDBC Statement.setQueryTimeout method
   * 
   * @param seconds Number of seconds to set query timeout as
   * @throws SQLException when there is a problem setting the query timeout
   */
  public void setQueryTimeout(int seconds) throws SQLException {
    prepStmt.setQueryTimeout(seconds);
  }

  /**
   * Set a specified date variable in the SQL statement.
   * 
   * @param i the parameter index
   * @param d the date value to set
   * @throws SQLException when there is a problem setting the variable value
   */
  public void setQueryVariable(int i, Date d) throws SQLException {
    prepStmt.setTimestamp(i, new Timestamp(d.getTime()));
  }

  /**
   * Set a date value into the first parameter of the SQL statement.
   * 
   * @param d the date value
   * @throws SQLException when there is a problem setting the variable value
   */
  public void setQueryVariable(Date d) throws SQLException {
    prepStmt.setTimestamp(1, new Timestamp(d.getTime()));
  }

  /**
   * @param parameter
   * @throws SQLException
   */
  public void setQueryVariable(Float parameter) throws SQLException {
    prepStmt.setFloat(1, parameter.floatValue());
  }

  /**
   * Sets the first query parameter of a previously set statement to submitted
   * Java Long value. Method will convert Long to primitive long value.
   * 
   * <p>
   * Wrapper to the JDBC PreparedStatement.setLong method
   * 
   * @param parameter Parameter to set
   * @throws SQLException if an error occurs setting the variable
   */
  public void setQueryVariable(Long parameter) throws SQLException {
    long value = parameter.longValue();
    prepStmt.setLong(1, value);
  }

  /**
   * Sets the first query parameter of a previously set statement to a submitted
   * Java BigInteger value. Method converts BigInteger to BigDecimal for
   * compatibility with JDBC.
   * 
   * @param parameter a BigDecimal value
   * @throws SQLException when there is a JDBC problem setting the statement
   */
  public void setQueryVariable(BigInteger parameter) throws SQLException {
    BigDecimal decimal = new BigDecimal(parameter);
    prepStmt.setBigDecimal(1, decimal);
  }

  /**
   * Sets the first query parameter of a previously set statement to submitted
   * Java Integer value. Method will convert Integer to primitive int value.
   * 
   * <p>
   * Wrapper to the JDBC PreparedStatement.setInt method
   * 
   * @param parameter Parameter to set
   * @throws SQLException if an error occurs setting the variable
   */
  public void setQueryVariable(Integer parameter) throws SQLException {
    int convertedValue = parameter.intValue();
    prepStmt.setInt(1, convertedValue);
  }

  /**
   * Sets the first query parameter of a previously set statement to submitted
   * String value.
   * 
   * <p>
   * Wrapper to the JDBC PreparedStatement.setString method
   * 
   * @param value value to set
   * @throws SQLException if an error occurs setting the variable
   */
  public void setQueryVariable(String value) throws SQLException {
    prepStmt.setString(1, value);
  }

  /**
   * Set a binary object value in the SQL statement from an input stream.
   * 
   * @param index the variable index
   * @param in the input stream
   * @param length the length of the binary stream
   * @throws SQLException when there is a problem setting the variable
   */
  public void setQueryVariable(int index, InputStream in, int length)
      throws SQLException {
    prepStmt.setBinaryStream(index, in, length);
  }

  /**
   * Set a float value into a specified variable in the SQL statement.
   * 
   * @param index the index of the variable
   * @param value the float value to set
   * @throws SQLException when there is a problem setting the value
   */
  public void setQueryVariable(int index, Float value) throws SQLException {
    if (value == null) {
      throw new SQLException("No float value supplied for variable " + index);
    }
    prepStmt.setFloat(index, value.floatValue());
  }

  /**
   * Sets the designated parameter to a long value in the submitted index. This
   * version allows multiple variables to be set for same prepared statement
   * 
   * <p>
   * Wrapper to the JDBC PreparedStatement.setLong method
   * 
   * @param index The parameter index to put submitted value in
   * @param value Value to set in query
   * @throws SQLException if an error occurs, including if submitted position is
   *           not valid for current statement
   */
  public void setQueryVariable(int index, Long value) throws SQLException {
    if (value == null) {
      throw new SQLException("No long value supplied for variable " + index);
    }
    long converted = value.longValue();
    prepStmt.setLong(index, converted);
  }

  /**
   * Sets the designated parameter to a BigInteger value in the submitted index.
   * This version allows multiple variables to be set for same prepared
   * statement.
   * 
   * @param index the parameter index to put submitted value in
   * @param value the value to set in query
   * @throws SQLException when JDBC cannot set the value into the statement
   */
  public void setQueryVariable(int index, BigInteger value) throws SQLException {
    if (value == null) {
      throw new SQLException("No BigInteger value supplied for variable "
                             + index);
    }
    BigDecimal decimal = new BigDecimal(value);
    prepStmt.setBigDecimal(index, decimal);
  }

  /**
   * Set a specific long-typed variable in the SQL statement to null.
   * 
   * @param index the variable index
   * @throws SQLException when there is a problem setting the variable
   */
  public void setNullLongQueryVariable(int index) throws SQLException {
    prepStmt.setNull(index, java.sql.Types.NUMERIC);
  }

  /**
   * Set a specific int-typed variable in the SQL statement to null.
   * 
   * @param index the variable index
   * @throws SQLException when there is a problem setting the variable
   */
  public void setNullIntQueryVariable(int index) throws SQLException {
    prepStmt.setNull(index, java.sql.Types.INTEGER);
  }

  /**
   * @param index
   * @throws SQLException
   */
  public void setNullStringQueryVariable(int index) throws SQLException {
    prepStmt.setNull(index, java.sql.Types.VARCHAR);
  }

  /**
   * Sets the designated parameter to a int value in the submitted index. This
   * version allows multiple variables to be set for same prepared statement
   * 
   * <p>
   * Wrapper to the JDBC PreparedStatement.setInt method
   * 
   * @param index The parameter index to put submitted value in
   * @param value Value to set in query
   * @throws SQLException if an error occurs, including if submitted index is
   *           not valid for current statement
   */
  public void setQueryVariable(int index, Integer value) throws SQLException {
    if (value == null) {
      throw new SQLException("No integer value supplied for variable " + index);
    }
    int converted = value.intValue();
    prepStmt.setInt(index, converted);
  }

  /**
   * Sets the designated parameter to a string value in the submitted index.
   * This version allows multiple variables to be set for same prepared
   * statement
   * 
   * <p>
   * Wrapper to the JDBC PreparedStatement.setString method
   * 
   * @param index The parameter index to put submitted value in
   * @param value String value to set in query
   * @throws SQLException if an error occurs, including if submitted index is
   *           not valid for current statement
   */
  public void setQueryVariable(int index, String value) throws SQLException {

    prepStmt.setString(index, value);
    if (debugging)
      Debugger.println("Set variable for query (" + prepStmt + ") to " + value);
  }

  /**
   * Executes a SQL query previous set and returns a reference to the ResultSet
   * object containing the results of the query
   * 
   * @return an <code>ResultSet<code> specifying the query result
   * @throws SQLException if a db error occurs
   */

  public ResultSet getResultSet() throws SQLException {
    try {
      results = prepStmt.executeQuery();
    } catch (SQLException ex) {
      // Log error message only and re-throw exception.
      logger.error("Error on query \"" + query + "\", " + ex.getMessage());
      throw ex;
    }

    return results;
  }

  /**
   * Executes SQL statements that don't return result set, such as UPDATE,
   * INSERT, DELETE
   * 
   * @return an <code>int<code> specifying number of rows affected by command
   * @throws SQLException if an error occurs while executing statement
   */
  public int executeUpdate() throws SQLException {
    int result;
    try {
      logger.debug("Executing update \"" + query + "\"");
      result = prepStmt.executeUpdate();
    } catch (SQLException ex) {
      logger.error("Error on update \"" + query + "\", " + ex.getMessage());
      throw ex;
    }

    return result;

  }

  /**
   * Execute a SQL insert statement and return any generated key value as a
   * Long.
   * 
   * @return the Long generated key value
   * @throws SQLException when there is a problem executing the statement
   */
  public Long executeInsert() throws SQLException {
    Long orderId;

    try {
      prepStmt.executeUpdate();
      ResultSet rs = prepStmt.getGeneratedKeys();
      rs.next();
      // orderId = new Long( rs.getInt(1) );
      orderId = new Long(rs.getLong(1));
    } catch (SQLException ex) {
      System.err.println("** Error on sql update ** ");
      ex.printStackTrace();
      System.err.println("** Error on query: " + query);

      throw ex;
    }
    return orderId;
  }

  /**
   * Explicitly closes ResultSet and PreparedStatement objects that are created
   * while doing queries. This method should be called at the end of each
   * database action to avoid memory leaks.
   */
  public void releaseResources() {
    if (results != null) {
      try {
        results.close();

        // set to null to minimize memory usage by old result sets
        results = null;

      } catch (Exception x) {
        // swallow errors
        x.printStackTrace();
      }
    }

    if (prepStmt != null) {
      try {
        prepStmt.close();
        if (debugging)
          Debugger.println("Closing query(" + prepStmt + ")");

        // set to null to avoid closing statement multiple times -
        // JavaDocs claim that calling close() on a statement that's
        // already closed will have no effect, but in reality a
        // SQLException is thrown. Since releaseResources may get
        // called multiple times as a connection is used, set null
        // the first time to avoid problems. This means that statement
        // obj. will be null until setQuery is called again, causing
        // a null pointer if any methods are called that assume it's
        // there, but this is a good thing...
        prepStmt = null;

      } catch (Exception x) {
        // x.printStackTrace();
      }
    }
  }

  /**
   * Sets the auto commit mode of connection so that all transactions are
   * immediately committed.
   * 
   * @throws SQLException when there is a problem setting autocommit on
   */
  public void set_auto_commit_mode() throws SQLException {
    conn.setAutoCommit(true);
  }

  /**
   * Removes the auto commit mode of connection so that transactions are not
   * immediately committed.
   * 
   * @throws SQLException when there is a problem turning off autocommit
   */
  public void remove_auto_commit_mode() throws SQLException {
    conn.setAutoCommit(false);
  }

  /**
   * commit the transaction
   * 
   * @throws SQLException when there is a problem committing
   */
  public void commit() throws SQLException {
    conn.commit();
  }

  /**
   * Rolls back the current transaction
   * 
   * @throws SQLException when there is a problem rolling back
   */
  public void rollback() throws SQLException {
    conn.rollback();
  }

  /**
   * Set the autocommit feature of JDBC.
   * 
   * @param set true to set autocommit on, false off
   * @return true if set, false if there is an exception
   */
  public boolean autoCommit(boolean set) {
    try {
      if (set)
        this.set_auto_commit_mode();
      else
        this.remove_auto_commit_mode();
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  /**
   * Get a CLOB select item into a Java string. This method uses a reader and
   * allocates memory efficiently based on the actual length of the string
   * retrieved, working around the inefficient getString() method's approach. It
   * is limited to getting strings that are less than MAXINT long. For longer
   * strings, use getString or custom code. If the input result set has a null
   * value for the specified select name, the method returns null.
   * 
   * @param rs a result set containing CLOB data
   * @param selectName the name of the CLOB select item
   * @return a string containing the CLOB data value or null if the CLOB value
   *         is null
   */
  public static String getClob(ResultSet rs, String selectName) {
    String string = null;
    try {
      Clob clob = rs.getClob(selectName);
      if (clob != null && !rs.wasNull()) {
        BufferedReader reader = new BufferedReader(clob.getCharacterStream());
        // Use CLOB length to allocate buffer and read into it.
        char[] buffer = new char[(int)clob.length()];
        reader.read(buffer, 0, (int)clob.length());
        string = new String(buffer);
      }
    } catch (IOException e) {
      throw new RuntimeException("I/O error reading CLOB data for "
                                 + selectName, e);
    } catch (SQLException e) {
      throw new RuntimeException("SQL error reading CLOB data for "
                                 + selectName, e);
    }
    return string;
  }
}
