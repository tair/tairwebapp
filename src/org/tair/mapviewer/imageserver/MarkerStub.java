/*
 * $Id: MarkerStub.java,v 1.11 2005/12/06 00:28:24 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;
import java.awt.*;

import org.tair.mapviewer.shared.*;

public class MarkerStub extends MapFeature implements Colors {

    static final String MAP_LABEL = "Markers";
    private static final int MARK_LENGTH = 10;
    protected static final int LINK_MARKER_SPACING = 2;
    protected static final int LINK_HEIGHT = 20;

    private static final int MIN_MAP_HEIGHT = 
        MapFont.get().getVerticalFontTextWidth( MAP_LABEL ) + 20;
  
    private Color color;
        
    private MappableEntity me;


    public MarkerStub( CoordinateLocation loc, boolean is_on_classic ) {
        super( loc );
      
        me = loc.getMappableEntity();
        if ( !is_on_classic ) {
            if ( me instanceof RiMarker && ( (RiMarker) me ).isPCR() ) {
                color = SPECIAL_RI_MARKER_COLOR;

            } else if ( me instanceof ClassicMarker && ( (ClassicMarker) me ).isPosFromRI() ) {
                color = SPECIAL_CLASSIC_MARKER_COLOR;

            } else {
                color = MARKER_COLOR;
            } 
            
        } else {
            if ( ( me instanceof RiMarker ) ||
                 ( me instanceof ClassicMarker && ( (ClassicMarker) me ).isPosFromRI() ) ) {

                    color = SPECIAL_CLASSIC_MARKER_COLOR;
            } else {
                color = MARKER_COLOR;
            }
        }
    }

    //
    // implement abstract methods from superclass
    //

    public Color getFeatureColor() {
        return color;
    }

    public String getDisplayName() {
        if ( me instanceof RiMarker && ( (RiMarker) me ).isCloned() ) {
            return getName() + " +";
            
        } else if ( me instanceof ClassicMarker && ( (ClassicMarker) me ).isCloned() ) {
            return getName() + " +";

        } else {
            return getName() ;
        } 
    }


    public FeatureType getFeatureType() {
        return FeatureType.marker;
    }

    public int getThickness() {
        return 0;
    }

    public Color getLabelColor() {
        return Color.black;
    }



    //
    // class specific methods
    //

    public boolean draw( Graphics g , 
                         double start , double end , 
                         int xStart , int xEnd ,
                         double pixelsPerUnit , 
                         int zoomLevel ,
                         MapSubBand _mmb , 
                         FeatureDescriptorCallback callback , // MapBand
                         FeatureDescriptorCallback parentCallback, // BandDrawer
                         String highlightedFeatureName ,
                         int row )
    {
        MarkerMapSubBand mmb = (MarkerMapSubBand) _mmb;


        if ( getStart() < start )  {
            return true;

        } else if ( getStart() >= end ) {
            return false;
        }
        
        int x = (int) ( getStart() * pixelsPerUnit );

        boolean markerIsHighlighted 
            = getName().equalsIgnoreCase( highlightedFeatureName );
        
        boolean markerIsVisible = getPriority() <= zoomLevel ||
            markerIsHighlighted;

        // don't draw an unlabeled marker if it overwrites a previous,
        // labeled marker
        if ( !markerIsVisible && x == mmb.xLastLabeledFeature ) {
            return true;
        }
      
        // draw markers with insufficient rank in gray
        if ( !markerIsVisible ) {
            g.setColor( GhostlyMarker );

        } else {
            g.setColor( color );
        }
      
        // Here comes the marker line
        g.drawLine( x, 
                    LINK_MARKER_SPACING + LINK_HEIGHT + LINK_MARKER_SPACING, 
                    x, 
                    LINK_MARKER_SPACING + LINK_HEIGHT + LINK_MARKER_SPACING + 
                    MARK_LENGTH );
      
      
        // draw marker labels, but only for those markers w/sufficient rank
        if ( markerIsVisible ) {
            
            // ensure that marker label does not go off left-end of image
            // xLabelMin is the left-most position occupied by the label
            // ( the top of the ascent; leading is excluded )
            int xLabelStart = 
                Math.max( x - MapFont.get().getVerticalFontAscent() / 2,
                          xStart );
            // ensure that marker label does not overlap previous marker label
            xLabelStart =  Math.max( xLabelStart, 
                                     mmb.xLastLabelStart + MapFont.get().getVerticalFontHeight() );

            // xLabelCenter is the horizontal center of the label; this is 
            // used to draw the link line
            int xLabelCenter = xLabelStart + MapFont.get().getVerticalFontAscent() / 2;
            
            // xLabel is the horiz position that will be used to draw the 
            // label string such that the label appears horizontally centered
            // over the link line
            int xLabel = xLabelStart + MapFont.get().getVerticalFontAscent();
            
            // draw label and linkage line
            if ( x >= xStart && xLabelStart < xEnd ) {
                Graphics2D g2d = ( Graphics2D ) g;
                g2d.setFont( MapFont.get().getVerticalFont() );

                // draw highlighting background if feature is to be highlighted
                int lblWidth = MapFont.get().getVerticalFontTextWidth( getDisplayName() );

                if ( markerIsHighlighted ) {
                    g2d.setColor( HighlightedEntity );
                    g2d.fillRect( xLabelStart, -lblWidth,
                                  MapFont.get().getVerticalFontAscent(),
                                  lblWidth );
                }
                
                g2d.setColor( Color.black );
                g2d.drawString( getDisplayName() , 
                                xLabel,
                                0 );
                
                mmb.xLastLabelStart = xLabelStart;
            
                
                // draw line from marker to label
                g.setColor( color );
                g.drawLine( x,
                            LINK_MARKER_SPACING + LINK_HEIGHT, 
                            xLabelCenter,
                            LINK_MARKER_SPACING );
            } 
            
            // feature descriptor callback for label ( vertical line )
            // note: rect coord relative to ( 0,0 ), not translation offset
            mmb.reportFeature( ID(), 
                               FeatureType.marker , 
                               new Rectangle( xLabelStart - xStart ,
                                              0,
                                              MapFont.get().getVerticalFontHeight(),
                                              MarkerMapSubBand.maxLabelWidth ),
                               getName(),
                               callback,
                               parentCallback );
            
            mmb.xLastLabeledFeature = x;
        } 
        
        // feature descriptor callback for marker ( vertical line )
        // note: rect coord relative to ( 0,0 ), not translation offset
      
        mmb.reportFeature( ID() , 
                           FeatureType.marker , 
                           new Rectangle( x - xStart - 1 - mmb.getLabelWidth() ,
                                          MarkerMapSubBand.maxLabelWidth +
                                          LINK_MARKER_SPACING +
                                          LINK_HEIGHT +
                                          LINK_MARKER_SPACING,
                                          2, 
                                          MARK_LENGTH ),
                           getName(),
                           callback,
                           parentCallback );
        return true;
    }
    
    public static int getHeight() {
        return LINK_MARKER_SPACING + LINK_HEIGHT + LINK_MARKER_SPACING + 
            MARK_LENGTH;
    }

    public static int getY() {
        return LINK_MARKER_SPACING + LINK_HEIGHT + 
            LINK_MARKER_SPACING + MARK_LENGTH / 2;
    }
  
    public static int getMaxHeight() {
        return Math.max( MIN_MAP_HEIGHT, 
                         MarkerMapSubBand.maxLabelWidth + LINK_MARKER_SPACING + 
                         LINK_HEIGHT + LINK_MARKER_SPACING + MARK_LENGTH );
    }
    
}
