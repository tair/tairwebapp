/*
 *
 * $Id: PointLocation.java,v 1.4 2003/09/10 17:20:20 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;


public class PointLocation extends Location {

    public PointLocation( MappableEntity ME,
                          boolean isAbsolute,
                          Location relativeTo ) { 
        super(ME, isAbsolute, relativeTo);
    }

}


