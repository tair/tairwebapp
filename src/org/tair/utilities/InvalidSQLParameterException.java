/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

package org.tair.utilities;

import java.sql.*;
/**
 * This exception is thrown when an invalid parameter
 * is encountered.
 */
public class InvalidSQLParameterException extends SQLException
{
	public InvalidSQLParameterException() 
		{
		super();
		}
	public InvalidSQLParameterException(String message) 
		{
		super(message);
		}
	public InvalidSQLParameterException(String reason, String SQLState) 
		{
		super(reason, SQLState);
		}
}
