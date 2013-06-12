/*
 * $Id: ImagePooler.java,v 1.10 2006/06/30 22:16:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
package org.tair.servlet;

import java.awt.Dimension;
import java.awt.Image;
import java.awt.image.BufferedImage;

/**
 * Utility class to get empty images for drawing and to crop images
 * down to minimum size needed for display.
 */

public class ImagePooler {


    /**
     * Given a size, return an image of at *least* that size, creating it if
     * necessary.
     */
    
    static public BufferedImage getImage( int w, int h ) {
        return getImage( new Dimension( w, h ) );
    }

    /**
     * make an image based on a dimension object
     */
    public static BufferedImage getImage( Dimension d ) {
            BufferedImage image = new BufferedImage( d.width, 
                                                     d.height, 
                                                     BufferedImage.TYPE_INT_RGB );
            
            return image;
    }

    /**
     * Crops submitted image to size specified by submitted subsection of
     * image.
     */
    public static BufferedImage cropImage( BufferedImage image,
                                           int x,
                                           int y,
                                           int width,
                                           int height ) 
    {
        BufferedImage crop = image.getSubimage( x, y, width, height );
        
        return crop;
    }
    
    /**
     * We're through with that image, dump it back into the pool.
     */
    
    public static void recycle( Image image ) {
        image.flush();
    }
}
