/*
 *
 * $Id: Direction.java,v 1.4 2000/11/21 18:47:41 gc Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
 */

package org.tair.mapviewer.shared;

public class Direction
{
    private Direction()
    {
    }
    
    public static Direction LEFT = new Direction();
    public static Direction RIGHT = new Direction();
    public static Direction UNKNOWN = new Direction();
    
    public static Direction fromInt( int i )
    {
        switch( i )
        {
            case 0 : return UNKNOWN;
            case 1 : return RIGHT;
            case 2 : return LEFT;
        }
        return null;
    }
}
