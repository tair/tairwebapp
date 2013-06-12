/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.SQLException;

/**
 * DatabaseServerOfflineException is a custom exception to be thrown
 * if the database server is offline temporarily due to expected
 * maintenance.  This exception is thrown by <code>DBReadManager</code>
 * and <code>DBWriteManager</code> if a system error message is found
 * in <code>WebApp</code>. Throwing this specific exception allows
 * servlets to differentiate this error from other SQLExceptions and to
 * redirect user to a specific error page
 */


public class DatabaseServerOfflineException extends SQLException {

  public DatabaseServerOfflineException() {
    super();
  }
  
  public DatabaseServerOfflineException( String msg ) {
    super(msg);
  }
}
