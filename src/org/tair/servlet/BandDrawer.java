/*
 * $Id: BandDrawer.java,v 1.30 2006/06/30 22:16:20 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
package org.tair.servlet;

import java.awt.*;
import java.awt.image.*;

import org.ncgr.util.*;
import org.tair.html.*;
import org.tair.mapviewer.imageserver.*;

import org.tair.mapviewer.shared.*;
import org.tair.utilities.WebApp;
import org.tair.utilities.GifFactory;
import org.tair.utilities.InvalidDisplayRangeException;

/**
 * This class is responsible for drawing a single band with a separate thread.
 * The idea is that if we are drawing several bands, we can utilize more than
 * one CPU. thereby greatly enhancing speed.
 */

public class BandDrawer implements FeatureDescriptorCallback {

    /**
     * Constant for defining left arrow as feature being drawn. Used by
     * ScaleMapSubBand and MapInfo to differentiate between left and right
     * arrows.
     */
    public final static int LEFT_ARROW = 0;

    /**
     * Constant for defining right arrow as feature being drawn. Used by
     * ScaleMapSubBand and MapInfo to differentiate between left and right
     * arrows.
     */
    public final static int RIGHT_ARROW = 1;

    /**
     * how wide the image band is
     */
    private int imageWidth;

    /**
     * the name of the GIF to generate
     */
    private String imageName;

    /**
     * the descriptor of the map we are drawing
     */
    private DescriptorWrapper descriptorWrapper;

    /**
     * this is the thing we call when we are finished drawing
     */
    private NotifiedByCompletion notifyee;

    /**
     * this controls zooming and contains info about the current scroll and zoom
     * state
     */
    private BandMaster bandMaster;

    /**
     * this is now used by the map html class to know what band to add the
     * datums to.
     */
    private int bandNumber;

    /**
     * this is very important! This says the client needs the rectangles EVEN IF
     * THE GIF IS CACHED, so we still need to call andrew's drawing code.
     */
    private boolean needRects;

    /**
     * if the image we're generating is already in the cache; in which case,
     * we're generating mainly for the rectangles, a documented side-effect.
     */
    private boolean inCache;

    private String mapType;

    /**
     * image mapping info for generated image to make hyperlinks to detail pages
     * of map features
     */
    private MapInfo mapInfo;

    /**
     * logging object for exceptions
     */
    private Logger logger;

    /**
     * constructor
     */

    public BandDrawer( BandMaster bm,
                      int imageWidth,
                      MapHtml htmlMaker,
                      int bandNumber,
                      NotifiedByCompletion nbc,
                      boolean needRects,
                      String id,
                      Logger logger ) {
        this.logger = logger;
        this.bandMaster = bm;
        this.needRects = needRects;
        this.imageWidth = imageWidth;
        this.bandNumber = bandNumber;
        this.descriptorWrapper = bandMaster.getDescriptorWrapper();
        this.mapType = this.descriptorWrapper.getTypeName();
        this.notifyee = nbc;
        imageName = genImageName();
        mapInfo = bm.getMapInfo();

    }

    /**
     * returns the name of the GIF
     */
    public String getImageName() {
        return imageName;
    }

    /**
     * Create the proper name to store this image under
     */
    private String genImageName() {
        return WebApp.getAbsDynImageDir()
               + bandMaster.getChromosome()
               + "_"
               + descriptorWrapper.getTypeNumber()
               + "screen"
               + bandMaster
               + bandMaster.getDisplayAllRows()
               + ".gif";
    }

    /**
     * called externally. Returns a cached image, or starts a thread to create
     * the image
     */
    public void makeBand()
        throws MapNotFoundException, InvalidDisplayRangeException {
        bandMaster.setImageName( imageName );
        inCache = ImageTracker.checkForMaybeBlock( imageName );

        if ( !inCache || needRects ) { // create new image form info in band
                                        // master
            run();
        } else { // else, using cached image so return
            notifyee.completionNotification();
        }
    }

    /**
     * in my own thread, draw the band. notify the servlet thread when this is
     * complete
     */
    public void run() throws MapNotFoundException, InvalidDisplayRangeException {
        int width = imageWidth + 30; // fudge for safety

        // default image height
        int height = 1024;

        // however, if display all the rows, increase the height of the image
        if ( bandMaster.getDisplayAllRows() ) {
            height = 4096;
        }

        Dimension imageSize = new Dimension( imageWidth, height );
        BufferedImage image = ImagePooler.getImage( width, height );

        Graphics graphics = image.getGraphics();
        Color bgc = bandMaster.getBackgroundColor();

        graphics.setColor( bgc );
        graphics.fillRect( 0, 0, width, height );
        bandMaster.setBackgroundColor( Color.white );

        Dimension d2 = draw( graphics, imageSize, logger );

        if ( d2 != null && ( inCache == false ) ) {
            BufferedImage crop = ImagePooler.cropImage( image,
                                                        0,
                                                        0,
                                                        d2.width,
                                                        d2.height );
            GifFactory.createGIF( crop, imageName, d2.width, d2.height );

            ImagePooler.recycle( crop );
        }

        ImagePooler.recycle( image );
        notifyee.completionNotification();
    }

    /**
     * Call ANT's code to draw the band.
     */
    private Dimension draw( Graphics g, Dimension d, Logger logger )
        throws MapNotFoundException, InvalidDisplayRangeException {
        double pStart = bandMaster.getLeft();
        double pEnd = bandMaster.getRight();

        try {
            int fl = bandMaster.getFilterLevel();
            double ppu = d.width / ( pEnd - pStart );
            return descriptorWrapper.generateMapImage( bandMaster.getHighlighted(),
                                                       pStart,
                                                       pEnd,
                                                       ppu,
                                                       fl,
                                                       g,
                                                       d,
                                                       this );
        } catch ( MapNotFoundException e ) {
            logger.logException( "BandDrawer: map not found ! " +
                                 "Image not drawn : ",
                                 e );

            throw e;
        } catch ( InvalidDisplayRangeException ie ) {
            throw ie;
        } finally {
            // very important! need to release the resources after drawing
            if ( g != null )
                g.dispose();
        }

        // return null;
    }

    /**
     * This function gets called by the map drawing code. This function's
     * signature is required by callback interface.
     */
    public void featureDescription( long id,
                                   FeatureType ft,
                                   Rectangle rect,
                                   String name,
                                   FeatureDescriptorCallback parent ) {
        // if the rectangle is off the left edge,
        // modify it so it starts at zero, and has
        // the right terminus in the same place
        if ( rect.x < 0 ) {
            rect.width += rect.x;
            rect.x = 0;
        }

        // hack to identify non-arrow features in mapInfo correctly - old code
        // used to blindly pass 1 for historic reasons, which conflicts w/new
        // constant values of RIGHT_ARROW & LEFT_ARROW
        //
        // FIX THIS NM 9.30.2003
        int dummyType = -1;

        mapInfo.addInfo( rect,
                         name,
                         id,
                         bandNumber,
                         dummyType,
                         imageName,
                         mapType,
                         ft );
    }

    public void arrowExtents( int type,
                             Rectangle rect,
                             FeatureDescriptorCallback parent ) {
        mapInfo.addInfo( rect, "", 0, // id ,
                         bandNumber, type, imageName, mapType, null );
    }

    // empty implementation to satisfy FeatureDescriptorCallback interface
    public void labelExtents( String s,
                             Rectangle r,
                             FeatureDescriptorCallback parent ) {
    }

}
