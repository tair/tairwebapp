/*
 * $Id: MapArrow.java,v 1.4 2005/12/06 00:28:22 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import java.awt.*;
import org.tair.utilities.WebApp;

public class MapArrow
{
    public static final String LEFT_ARROW_FILE = "left.gif";
    public static final String RIGHT_ARROW_FILE = "right.gif";
    private static boolean initialized;
    private static Image leftArrow;
    private static Image rightArrow;
    private static int arrowHeight;
    private static int arrowWidth;

    public static Image getLeftArrow()
    {
	if ( !initialized ) {
	    loadArrows();
	}
	return leftArrow;
    }

    public static Image getRightArrow()
    {
	if ( !initialized ) {
	    loadArrows();
	}
	return rightArrow;
    }

    public static int getHeight()
    {
	if ( !initialized ) {
	    loadArrows();
	}
	return arrowHeight;
    }

    public static int getWidth()
    {
	if ( !initialized ) {
	    loadArrows();
	}
	return arrowWidth;
    }

    private static void loadArrows()
    {
	Component dummyCmpnt = new Canvas();
	MediaTracker tracker = new MediaTracker( dummyCmpnt );

	String path = WebApp.getWebRoot() + WebApp.getImageDir();

	String leftName = path + LEFT_ARROW_FILE;
	String rightName = path + RIGHT_ARROW_FILE;


	//ps.println( "Arrows = " + leftName + " , " + rightName );
	leftArrow = Toolkit.getDefaultToolkit().getImage( leftName );
	tracker.addImage( leftArrow, 0 );
	rightArrow = Toolkit.getDefaultToolkit().getImage( rightName );
	tracker.addImage( rightArrow, 1 );

	try { 
	    tracker.waitForAll();
	} // try
	catch ( InterruptedException e ) {}

 	int leftArrowHeight = leftArrow.getHeight( dummyCmpnt );
 	int rightArrowHeight = rightArrow.getHeight( dummyCmpnt );
 	arrowHeight = Math.max( leftArrowHeight, rightArrowHeight );

	int leftArrowWidth = leftArrow.getWidth( dummyCmpnt );
 	int rightArrowWidth = rightArrow.getWidth( dummyCmpnt );
 	arrowWidth = Math.max( leftArrowWidth, rightArrowWidth );

	initialized = true;
    }

} // class MapArrow

