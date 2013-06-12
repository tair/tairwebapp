/**
 * Copyright Carnegie Institution for Science 2008. All rights reserved.
 */
package org.tair.db;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import org.tair.utilities.Debugger;

import com.poesys.db.InvalidParametersException;
import com.poesys.db.Message;
import com.poesys.db.connection.ConnectionFactoryFactory;
import com.poesys.db.connection.IConnectionFactory;


/**
 * An abstract class you can use as the superclass for JUnit test cases; this
 * class provides database connections directly to the Sybase database either as
 * a reader or as a writer.
 * 
 * @author Robert J. Muller
 */
public class ConnectionTest {
  /** I18N message name for no connection */
  protected static final String NO_CONNECTION_ERROR =
    "com.poesys.db.msg.noConnection";
  /** Database subsystem for read only access */
  private static final String READONLY_SUBSYSTEM = "org.tair.readonly.test";
  /** Database subsystem for write access */
  private static final String WRITE_SUBSYSTEM = "org.tair.writer.test";
  /** Type of database */
  private static final IConnectionFactory.DBMS DBMS =
    IConnectionFactory.DBMS.SYBASE;

  /**
   * Get a connection to the TAIR readonly subsystem.
   * 
   * @param whether to return a read-only connection
   * @return an open connection to the database, readonly or writer as required
   * @throws SQLException when there is a database problem getting the
   *             connection
   * @throws IOException when there is a problem reading the database.properties
   *             file that initializes connections
   */
  public Connection getConnection(boolean readonly) throws SQLException,
      IOException {
    Connection connection = null;
    try {
      connection =
        ConnectionFactoryFactory.getInstance(
                                      readonly ? READONLY_SUBSYSTEM
                                          : WRITE_SUBSYSTEM, DBMS)
            .getConnection();
    } catch (SQLException e) {
      Debugger.logMsg(this, e.getMessage());
      throw e;
    } catch (IOException e) {
      Debugger.logMsg(this, e.getMessage());
      throw e;
    } catch (InvalidParametersException e) {
      Debugger.logMsg(this, e.getMessage());
      throw new SQLException(Message.getMessage(NO_CONNECTION_ERROR, null));
    }
    return connection;
  }
}
