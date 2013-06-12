//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.13 $
// $Date: 2005/03/01 22:16:17 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.SQLException;

import org.tair.utilities.DataBaseConnectionException;
import org.tair.utilities.DatabaseServerOfflineException;
import org.tair.utilities.WebApp;

/**
 * DBReadManager represents a <code>DatabaseManager</code> pool of read-only 
 * connections to the database.  DBReadManager is implemented as a singleton, 
 * with a private static reference to itself, so that the entire TAIR 
 * application can share the same pool of read only connections for maximum 
 * efficiency.
 *
 * @see DatabaseManager
 * @see DBWriteManager
 * @see WebApp
 */

public class DBReadManager extends DatabaseManager {
	// private self-referential instance
	private static DBReadManager manager;

	// Error message found in WebApp - used to deny connections when not null
	private static String errorMessage;

	/**
	 * Private constructor, called by init(), that passes connection info 
	 * retrieved from <code>WebApp</code> along to constructor of
	 * <code>DatabaseManager</code> superclass.
	 *
	 * @param driver JDBC driver class name to use when making manual db 
	 * connections
	 * @param url JDBC url to connect to when making manual db connections
	 * @param user User name to connect with when making manual db connections
	 * @param password Password to connect with when making manual db connections
	 * @param dataSourceName Name to use when looking up DataSource object 
	 * through JNDI when running in application server context
	 * @throws InstantiationException if an error occurs while trying to
	 * create JDBC driver instances
	 * @throws ClassNotFoundException if no class found for driver
	 * @throws IllegalAccessException if an error occurs while trying to
	 * create JDBC driver instances
	 * @throws SQLException if a database error occurs while initializing pool
	 */
	private DBReadManager( String driver, String url, String user, String password, String dataSourceName ) throws InstantiationException, ClassNotFoundException, IllegalAccessException, SQLException{ 
		super( driver, url, user, password, dataSourceName );
	}

	/**
	 * Retrieves a reference to the DBReadManager.
	 *
	 * @throws SQLException if any error occurs while initializing pool
	 */
	public static DBReadManager getInstance() throws SQLException { 
		if ( manager == null ) {
			try {
				init();
		        logger.debug("Using new read-only manager: " + manager.url);
			} catch ( Exception e ) {
				throw new SQLException( "Error initializing connection pool: " + e.getMessage() );
			}
		}
		logger.debug("Using existing read-only manager: " + manager.url);
		return manager; 
	}

	/**
	 * Initializes manager using connection info in <code>WebApp</code>.
	 * The following parameters are assumed to be in the WebApp.prop 
	 * config file and are retrieved from WebApp:
	 *
	 * <ul>
	 * <li>DRIVER_NAME - class name to use for JDBC driver when making manual
	 * connections</li>
	 * <li>CONNECTION_URL - JDBC url to use when connecting to the database
	 * manually</li>
	 * <li>CONNECTION_NAME - Database login to use for manual connections
	 * <li>CONNECTION_PASSWORD - Password for login for manual connections
	 * <li>MAX_CONNECTIONS - Used to specify the initial size of DBconnection
	 * wrapper object cache in superclass. NOT used to limit the size of the 
	 * connection pool in any way.</li>
	 * <li>READ_ONLY_DATA_SOURCE - Name of readonly DataSource configured
	 * through the application server</li>
	 * </ul>
	 *
	 * @throws DataBaseConnectionException if missing connection info from
	 *  WebApp
	 * @throws InstantiationException if an error occurs while trying to
	 * create JDBC driver instances
	 * @throws ClassNotFoundException if no class found for driver
	 * @throws IllegalAccessException if an error occurs while trying to
	 * create JDBC driver instances
	 * @throws SQLException if a database error occurs while initializing pool
	 */
	public static void init() throws InstantiationException, ClassNotFoundException, IllegalAccessException, SQLException {
		if ( manager == null ) {
			String connInfo[] = getConnectionInfo();
			if ( connInfo[ 0 ] == null )
				throw new DataBaseConnectionException( "No driver name found" );
			if ( connInfo[ 1 ] == null )
				throw new DataBaseConnectionException( "No connection URL found" );
			if ( connInfo[ 2 ] == null )
				throw new DataBaseConnectionException( "No connection name found" );
			if ( connInfo[ 3 ] == null )
				throw new DataBaseConnectionException( "No connection password found" );
			if ( connInfo[ 4] == null )
				throw new DataBaseConnectionException( "No value for data source name found" );
			manager = new DBReadManager(connInfo[0], connInfo[1], connInfo[2], connInfo[3], connInfo[4]);
		}
	}

	/**
	 * Retrieves connection info from WebApp and returns as an array
	 * of Strings. While accessing WebApp, check for connection error
	 * message and set denyConnections flag accordingly
	 */
	private static String[] getConnectionInfo() {
		String info[] = new String[ 5 ];
		info[ 0 ] = WebApp.getProperty( "DRIVER_NAME" );
		info[ 1 ] = WebApp.getProperty( "CONNECTION_URL" );
		info[ 2 ] = WebApp.getProperty( "CONNECTION_NAME" );
		info[ 3 ] = WebApp.getProperty( "CONNECTION_PASSWORD" );
		info[ 4 ] = WebApp.getProperty( "READ_ONLY_DATA_SOURCE" );
		errorMessage = WebApp.getProperty( "DB_READ_MSG" );
		return info;
	}

	/**
	 * Retrieves a readonly database connection from the connection pool or
	 * throws DatabaseServerOfflineException if configured to do so.
	 *
	 * @return An active readonly connection to the database
	 * @exception SQLException thrown if an error occurs while retrieving connection
	 */
	public DBconnection get_connection() throws SQLException {
		if ( errorMessage != null )
			throw new DatabaseServerOfflineException( errorMessage );
		return super.get_connection();
	}
}
