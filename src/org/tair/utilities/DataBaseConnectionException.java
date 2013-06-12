/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

package org.tair.utilities;
import java.sql.*;

/**
 * This exception is thrown when the server is unable
 * .to obtain a JDBC connection to the database.
 */
public class DataBaseConnectionException extends SQLException
{
	public DataBaseConnectionException() 
		{
		super();
		}

	public DataBaseConnectionException(String message) 
		{
		super(message);
		}

	public DataBaseConnectionException(String reason, String SQLState) 
		{
		super(reason, SQLState);
		}

	public DataBaseConnectionException(String reason, String SQLState, int VecdorCode) 
		{
		super(reason,SQLState,VecdorCode);
		}
}
