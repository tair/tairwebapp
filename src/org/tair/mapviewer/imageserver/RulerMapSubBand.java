/*
 * $Id: RulerMapSubBand.java,v 1.12 2005/12/06 00:28:26 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import java.awt.*;
import java.text.*;
import org.tair.mapviewer.shared.FeatureDescriptorCallback;
import java.util.*;
import org.ncgr.util.*;

/**
 * RulerMapSubBand is a concrete implementation of the abstract MapSubBand which 
 * handles all drawing functions for the position ruler that display on each
 * map's band image.  The position ruler shows rounded incremental positions
 * between the start and end positions of the zone being displayed
 */

public class RulerMapSubBand extends MapSubBand implements Colors {

    protected final int ARROW_WIDTH = MapArrow.getWidth();
    protected final int ARROW_HEIGHT = MapArrow.getHeight();
    protected final int SCALE_SPACING = 4;
    protected final int SCALE_HEIGHT = ARROW_HEIGHT + SCALE_SPACING;
        

    // Minimum pixels per tick, chosen to allow enough space for the bp label.
    protected final int MIN_PIXELS_PER_TICK = 6;
    
    /**
     * A constant to control the factor of the numbers that appear as labels
     * at each major tick. 
     * Determine the value of unitsPerTick as 100.0, 10.0, 1.0, 0.1 or 0.01 etc.
     */
    protected final int RATE = 10;
    
    /**
     * The number of minor ticks per major tick on the rulerHeader.
     */
    protected final int NUM_MINOR_TICKS = 10;
    
    double unitsPerTick = 1.0;
    
    protected final String units;
    protected final NumberFormat numberFormat = NumberFormat.getInstance();

    /**
     * Creates an instance of RulerMapSubBand 
     *
     * @param units Units of measurement for MapBand this RulerMapSubBand instance will handle
     * @param decimalPlaces Number of decimal places to show in positions
     * @param logger Logging object for exceptions
     */
    public RulerMapSubBand( String units, int decimalPlaces , Logger logger ) {
        super( Color.black , RULER_BAND_COLOR , true , logger );
        this.units = units;
        numberFormat.setMaximumFractionDigits( decimalPlaces );
        numberFormat.setMinimumFractionDigits( decimalPlaces );
        hasLabel = false;
    }
    
    /**
     * Implements abstract method from parent class to return an empty
     * list, since RulerMapSubBand will never have features to draw
     */
    public ArrayList getMapFeatures() {
        return new ArrayList();
    }


    /**
     * Draws the ruler sub-band. This method overrides the superclass implementation,
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
                              int xEnd ,
                              FeatureDescriptorCallback callback ,
                              FeatureDescriptorCallback parentCallback )
    {
        int h = SCALE_HEIGHT;
        
        g.translate( -xStart + getLabelWidth(), 0 ); 
 
        g.setColor(super.getTextColor()); // that is the RULER_BAND_COLOR

        g.setFont( MapFont.get().getUnitsFont() );
        // preparing the parameters for drawing ticks

        // Y-coordinate of the bottom of each tick.      
        int tickBase = SCALE_HEIGHT - 6;
        
        // Y-coordinate of the top of each major tick.   
        int majorTickHeight = SCALE_HEIGHT / 3;
        
        // Y-coordinate of the top of each middle tick.
        int middleTickHeight = majorTickHeight * 2 / 3;
        
        // Y-coordinate of the top of each minor tick.   
        int minorTickHeight = majorTickHeight / 3;

        double unitsPerPixel = 1.0 / pixelsPerUnit;


        // Adjust the unitsPerTick to be 100.0, 10.0, 1.0, 0.1, or 0.01 etc.
        while ((int) (unitsPerTick / unitsPerPixel) < MIN_PIXELS_PER_TICK){ //6
            unitsPerTick *= RATE;
        }
        
        while ((int) (unitsPerTick / unitsPerPixel) >= MIN_PIXELS_PER_TICK * RATE){ //60
            unitsPerTick /= RATE;
        }
        
        double pixelsPerTick = unitsPerTick / unitsPerPixel;;

        //Number of ticks skipped (ticks)
        int numTicks = (int)(start / unitsPerTick);

        //Starting point (pixels)
        double x = start * pixelsPerUnit;
        
        //Ending point (pixels)
        int endPoint = (int)(((end - start + 1) / (unitsPerTick * NUM_MINOR_TICKS) + 2) *
                             NUM_MINOR_TICKS * pixelsPerTick + x );


        // The methods to draw the ruler;
        // 1. increment the x by pixelsPerTick; increment numTicks by 1
        // 2. if the tick number happen to be 10x, draw a major tick and the lable
        // 3. if the tick number happen to be 5x, draw a middle tick
        // 4. otherwise, draw a minor tick

        // this value is used to correct the misposition of the tick when using decimal number (cM)
        double xDecimal = x - numTicks * unitsPerTick * pixelsPerUnit;

        while (x < endPoint){
            if (numTicks % NUM_MINOR_TICKS == 0){ // 10x
                // Drawing major ticks
                g.drawLine((int)(x - xDecimal), tickBase ,
                           (int)(x - xDecimal), tickBase - majorTickHeight );
                        
                // Drawing labels on top of major ticks
                String tickLabel = numberFormat.format( unitsPerTick * numTicks );
                int tickLabelLength = MapFont.get().getUnitsFontMetrics().stringWidth(tickLabel);

                // To avoid the overlap of tick label if the label length is greater than 
                // 10 * pixelsPerTick (distance between two major ticks) - 6, only display
                // when label is 20x of unitsPerTick (100.0 or 1.0 etc.), 
                // basically, every other major ticks.
                if (tickLabelLength <= 10 * pixelsPerTick - 6
                            
                    || (tickLabelLength > 10 * pixelsPerTick - 6
                        && (int)( unitsPerTick * numTicks ) % (int)(10 * unitsPerTick * 2)  == 0)){
                    g.drawString(tickLabel,
                                 (int)(x - xDecimal) - tickLabelLength/2,
                                 MapFont.get().getUnitsFontMetrics().getHeight() - 8 );
                }

            }

            // Drawing middle tick
            else if (numTicks % (NUM_MINOR_TICKS / 2) == 0) {// 5x
                g.drawLine((int)(x - xDecimal), tickBase ,
                           (int)(x - xDecimal), tickBase - middleTickHeight );
                                
                // Drawing labels on top of middle ticks if the distance between the 
                // two major ticks is larger than 300 pixels
                String tickLabel = numberFormat.format( unitsPerTick * numTicks );
                int tickLabelLength = MapFont.get().getUnitsFontMetrics().stringWidth(tickLabel);

                if (300 < 10 * pixelsPerTick){
                    g.drawString(tickLabel,
                                 (int)(x - xDecimal) - tickLabelLength/2,
                                 MapFont.get().getUnitsFontMetrics().getHeight() - 8 );
                }               

            }
            // Drawing minor ticks
            else
                g.drawLine((int)(x - xDecimal), tickBase ,
                           (int)(x - xDecimal), tickBase - minorTickHeight);
            x += pixelsPerTick;

            if (unitsPerTick * ++numTicks > endPoint* unitsPerPixel +10)    {
                break; //Fail-safe, has to finish.
            }

        }
        
       g.translate( xStart - getLabelWidth() , 0 );
    
        h = 25; //hard coded value to replace the broken one. :) 
    
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


