/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

package org.tair.utilities;

/**
 * This exception is thrown when a session is out of time
 * is encountered.
 */
public class SessionOutOfTimeException extends InvalidSessionException
{
	public SessionOutOfTimeException() 
		{
		super();
		}

	public SessionOutOfTimeException(String message) 
		{
		super(message);
		}
}
