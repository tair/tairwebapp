/*
 * $Id: ImageTracker.java,v 1.6 2001/04/06 15:58:23 gc Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
package org.tair.servlet;

import java.util.Hashtable;

/**
 * ImageTracker is utility class to manage the Image cache
 */
public class ImageTracker
{
    private static Hashtable GeneratedObjects = new Hashtable();
    private static Hashtable PendingObjects = new Hashtable();
  
    private final static long Timeout = 3500;

    /**
     * check to see if a given object has already been generated
     * If it has, return true.
     * if it has not, return false, and put it into the "pending" pool
     * with a timestamp.  
     * If a request comes in for a object which is pending, and 
     * who's timestamp has not expired, the threads is blocked 
     * until it completes, and "already in the cache( true ) " is returned
     */
    public static boolean checkForMaybeBlock( String objectName )
    {
	synchronized( GeneratedObjects ) {

	    // When the objectName was put into the hashtable? Questioned by gc
	    if ( GeneratedObjects.get( objectName ) != null )
		{
		    return true;
		}
	    
	    Long l = (Long) PendingObjects.get( objectName );
	    
	    if ( l == null )
		{
		    PendingObjects.put( objectName , new Long( time() ) );
		    return false;
		}
	    
	    if ( ( time() - l.longValue() ) < Timeout )
		{
		    try
			{
			    l.wait( 100 );
			}
		    catch( Exception e )
			{
			}
		}
	    return false;
	}
    }
    
    /**
     * Where it is used? Questioned by gc
     */
    public static void objectCompleted( String objectName )
    {
	synchronized( GeneratedObjects )
	    {
		GeneratedObjects.put( objectName , objectName );
		PendingObjects.remove( objectName );
	    }
    }
    
    
    static long time()
    {
      return System.currentTimeMillis();
    }
    
    
}
