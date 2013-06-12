/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

package org.tair.utilities;

/**
 * This exception is thrown when an invalid parameter
 * is encountered.
 */
public class InvalidParameterException extends Exception
{
	public InvalidParameterException() 
		{
		super();
		}

	public InvalidParameterException(String message) 
		{
			super(message != null ? message.replaceAll("<","&lt;").replaceAll(">","&gt;") : null);
		}

	public InvalidParameterException(String message, Throwable t) 
		{
			super(message != null ? message.replaceAll("<","&lt;").replaceAll(">","&gt;") : null, t);
		}
}
