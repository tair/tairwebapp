/*
 * $Id: ScaleMapSubBand.java,v 1.9 2003/09/30 18:38:08 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import java.awt.*;
import java.awt.image.*;
import java.text.*;
import java.util.*;

import org.tair.mapviewer.shared.FeatureDescriptorCallback;
import org.tair.servlet.BandDrawer;

import org.ncgr.util.*;

/**
 * ScaleMapSubBand is a concrete implementation of the abstract MapSubBand which
 * handles all drawing functions for the scale portion of each map's band image.  
 * The scale portion includes the start and end co-ordinates of the zone being 
 * displayed as well as left and right arrows for scrolling the view.
 */

public class ScaleMapSubBand extends MapSubBand {

    protected final int ARROW_WIDTH = MapArrow.getWidth();
    protected final int ARROW_HEIGHT = MapArrow.getHeight();
    protected final int SCALE_SPACING = 4;
    protected final int SCALE_HEIGHT = ARROW_HEIGHT + SCALE_SPACING;
    
    protected final String units;
    protected final NumberFormat numberFormat = NumberFormat.getInstance();
    
    /**
     * Creates an instance of ScaleMapSubBand 
     *
     * @param units Units of measurement for MapBand this ScaleMapSubBand instance will handle
     * @param decimalPlaces Number of decimal places to show in start/end positions
     * @param logger Logging object for exceptions
     */
    public ScaleMapSubBand( String units, int decimalPlaces , Logger logger ) {
        super( Color.black , Color.black , true , logger );
        this.units = units;
        numberFormat.setMaximumFractionDigits( decimalPlaces );
        numberFormat.setMinimumFractionDigits( decimalPlaces );
        hasLabel = false;
    }
    
    /**
     * Implements abstract method from parent class to return an empty
     * list, since ScaleMapSubBand will never have features to draw
     */
    public ArrayList getMapFeatures() {
        return new ArrayList();
    }


    /**
     * Draws the scale sub-band. This method overrides the superclass implementation,
     * which assumes that sub-band consists entirely of its map features.  This method
     * will be called polymorphically by the public draw method in superclass, which 
     * is called by the MapBand object
     */
    protected Dimension draw( Graphics g,
                              double start,
                              double end,
                              double pixelsPerUnit,
                              int zoomLevel,
                              Hashtable highlightedFeatures ,
                              int w , 
                              int xStart , 
                              int xEnd, 
                              FeatureDescriptorCallback callback , // MapBand
                              FeatureDescriptorCallback parentCallback) // BandDrawer)
    {
        int h = SCALE_HEIGHT;
        
        g.translate( -xStart + getLabelWidth() , 0 );
        
        // Draw units
        String s = null;
        g.setFont( MapFont.get().getUnitsFont() );
        
        
        ImageObserver drawImageObserver = new ImageObserver() {
            public boolean imageUpdate( Image img, int infoflags,
                                        int x, 
                                        int y,
                                        int width, 
                                        int height ) {
                return ( infoflags & ImageObserver.ALLBITS ) == 0;
            } };
        
        int y = 0;
        
        // draw left scrolling arrow on far left
        g.drawImage( MapArrow.getLeftArrow(),
                     xStart,
                     y,
                     drawImageObserver );

        // draw right scrolling arrow on far right
        g.drawImage( MapArrow.getRightArrow(),
                     xEnd - ARROW_WIDTH - 1,
                     y,
                     drawImageObserver );
        
        // draw start position immediately after left arrow
        g.setColor( getTextColor() );
        s = numberFormat.format( start ) + " " + units;
        g.drawString( s, 
                      xStart + ARROW_WIDTH + 1,
                      y + ARROW_HEIGHT / 2 +
                      MapFont.get().getUnitsFontAscent() / 2 );
        

        // draw end position immediately before right arrow
        s = numberFormat.format( end ) + " " + units;
        g.drawString( s,
                      xEnd - ARROW_WIDTH - 
                      MapFont.get().getUnitsFontMetrics().stringWidth(s) - 2,
                      y + ARROW_HEIGHT / 2 +
                      MapFont.get().getUnitsFontAscent() / 2 );

        
        callback.arrowExtents( BandDrawer.LEFT_ARROW,
                               new Rectangle( xStart - xStart + 
                                              getLabelWidth(), 
                                              y,
                                              ARROW_WIDTH, 
                                              ARROW_HEIGHT ), 
                               parentCallback);

        callback.arrowExtents( BandDrawer.RIGHT_ARROW,
                               new Rectangle( xEnd - ARROW_WIDTH - xStart + 
                                              getLabelWidth(), 
                                              y,
                                              ARROW_WIDTH, 
                                              ARROW_HEIGHT ),
                               parentCallback);
        
        g.translate( xStart - getLabelWidth() , 0 );
        
        h = 25; // hate to do this but it always returned 3, which 
        // made things quite broken
        
        return new Dimension( w, h );
    }     

    public String getBandLabel() {
        return "";
    }
    
    public Color getLabelTextColor() {
        return Color.black;
    }
    
    public Color getLabelBackColor() {
        return Color.yellow;
    }
    
}


