/*
 * $Id: MapNotFoundException.java,v 1.3 2000/11/21 18:47:05 gc Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

/** 
    Thrown by MapDescriptor when a method is called that attempts to access a 
    map that does not exist, as specified by the MapDescriptor's map attributes.
*/
public class MapNotFoundException
    extends Exception
{
    public MapNotFoundException()
    {
    } // constructor 1

    public MapNotFoundException( String s )
    {
	super( s );
    } // constructor 2
} // class MapNotFoundException
