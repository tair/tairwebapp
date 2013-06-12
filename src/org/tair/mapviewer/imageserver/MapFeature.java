/*
 * $Id: MapFeature.java,v 1.16 2005/12/06 00:28:24 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;

import java.awt.*;
import java.util.*;

/**
 * Template method pattern is used in this design. 
 */
public abstract class MapFeature {
    protected double pixelsPerUnit;

    private String name;
    private ArrayList aliasList; // added by gc 23/01/01
    private int minZoomLevel;
    private long id;
    private double start;
    private double extent = 0.0;
    private Location location;
    private Hashtable highlighted;

    
    public MapFeature( String name, 
                       double location, 
                       double extent, 
                       int minZoomLevel, 
                       long id ) {
        this.name = name;
        this.start = location;
        this.extent = extent;
        this.minZoomLevel = minZoomLevel;
        this.id = id;
    }


    public MapFeature( Location loc ) {
        this.location = loc;
        if ( loc instanceof CoordinateLocation ) {
            start = ( (CoordinateLocation) loc ).getPosition();

        } else if ( loc instanceof IntervalLocation ) {
                start = ( (IntervalLocation) loc ).getLeftStart();
                extent = ( (IntervalLocation) loc ).getRange();

        } else {
            throw new RuntimeException( "Feature exists but is " +
                                        "not a CoordinateLocation" +
                                        " or IntervalLocation" );
        }
        name = loc.getMappableEntity().getName();
        minZoomLevel = loc.getPriority();
        this.id = loc.getMappableEntity().getID();
    }


    //
    // Must be implemented by child classes for type specific display rules
    //
    public abstract Color getLabelColor();
    public abstract Color getFeatureColor();
    public abstract String getDisplayName();
    public abstract int getThickness();
    public abstract FeatureType getFeatureType();


    /**
     * Retrieves the id to use for linking to map feature's detail page.  This
     * method is implemented here to return the same value as the ID() method, but
     * can be overridden by sub-classes to return a different id if needed (MutantGeneStub
     * will return gene's locus id, for instance).  Implementing this method here
     * allows the lazy maintenance programmer to return locus id in this one case, while
     * not upsetting any other code that uses the value of ID().
     */
    public long getLinkID() {
        return ID();
    }

    
    public long ID() {
        return id;
    }
    
    public String getName() { 
        return name; 
    }    

    public ArrayList getAliasList() {
        return aliasList;
    }

    public void setAliasList( ArrayList list ) {
        aliasList = list;
    }

    public double getStart() { 
        return start; 
    }
    
    public double getRange() {
        return extent;
    }
    
    public double getEnd() {
        return start + extent;
    }
    
    public int getPriority() { 
        return minZoomLevel; 
    }
    
    public int getDisplayNameInPixels() {
        return MapFont.get().getLabelFontTextWidth( getDisplayName() );
    }
    
    public int getNameLengthInPixels() {
        int lp = MapFont.get().getLabelFontTextWidth( getDisplayName() );

        return (int) (lp * 1.2);
    }
    
    
    public void draw( Graphics g, 
                      double start, 
                      double end, 
                      int xStart, 
                      int xEnd,
                      int x, 
                      int featureW, 
                      int y, 
                      int zoomLevel,
                      MapSubBand msb, 
                      FeatureDescriptorCallback callback, // MapBand
                      FeatureDescriptorCallback parentCallback ) // BandDrawer                      
    { 
        
        int textHeight = MapFont.get().getLabelFontHeight();
        int featureY = y + 1;
        
        // draw feature
        drawFeature( g, x, featureY+textHeight, featureW, getThickness()-textHeight, zoomLevel );
        
        // draw feature name label
        drawLabel( g, 
                   x, 
                   xStart, 
                   y, 
                   textHeight,
                   msb,
                   callback,
                   parentCallback );
        
        // feature descriptor callback for feature
        // note: rect coord relative to ( 0,0 ), not translation offset
        int featureX1 = x - xStart;
        
        reportFeature( new Rectangle( featureX1,
                                      featureY,
                                      featureW, 
                                      getThickness() ),
                       msb,
                       callback,
                       parentCallback );
    }
    
    
    public void draw( Graphics g, 
                      double start, 
                      double end,
                      int xStart, 
                      int xEnd, 
                      double ppu, 
                      int zoomLevel, 
                      MapSubBand msb, 
                      FeatureDescriptorCallback callback, // MapBand
                      FeatureDescriptorCallback parentCallback, // BandDrawer
                      Hashtable highlighted,
                      int row ) {

        this.highlighted = highlighted;
       
        int x = (int) ( getStart() * ppu );
        int w = (int) ( getRange() * ppu ); 
        draw( g, start, end, xStart, xEnd, x, w, row, zoomLevel, msb, callback, parentCallback );
    }


    // subclass may overrite this method if they have different presentation
    public void drawFeature( Graphics g, int x, int featureY, int featureW, int featureH, int zoomLevel ) {
        g.setColor( getFeatureColor() );
        if ( location instanceof IntervalLocation ) {
            g.fillRect( x, featureY, featureW, featureH );
            // this code block the marker feature color.
            g.setColor( Color.black );
        }
        g.drawRect( x, featureY, featureW, featureH );  
    }
    
    public void drawLabel( Graphics g, 
                           int x, 
                           int xStart,
                           int y, 
                           int textHeight,
                           MapSubBand msb, 
                           FeatureDescriptorCallback callback, // MapBand
                           FeatureDescriptorCallback parentCallback ) {
        
        int visibleX = Math.max( x, xStart );
        int length = getNameLengthInPixels();
        
        if ( isHighlighted() == true ) {
            g.setColor( Color.yellow );
            g.fillRect( visibleX, y, length, textHeight );
        }
        
        g.setColor( getLabelColor() );
        g.drawString( getDisplayName(), visibleX, y + textHeight );
        
        Rectangle r = new Rectangle( visibleX - xStart, y, length, textHeight );
        reportFeature( r, msb, callback, parentCallback );
    }
    
    public void reportFeature( Rectangle r,
                               MapSubBand msb, 
                               FeatureDescriptorCallback callback, // MapBand
                               FeatureDescriptorCallback parentCallback ) // BandDrawer
    {
        reportFeature( getFeatureType(), r, msb, callback, parentCallback );
    }
    

    private void reportFeature( FeatureType type, 
                                Rectangle r,
                                MapSubBand msb, 
                                FeatureDescriptorCallback callback, // MapBand
                                FeatureDescriptorCallback parentCallback ) {
        msb.reportFeature( getLinkID(), type, r, getName(), callback, parentCallback );
    }   
    
    
    public boolean isHighlighted() {
        return highlighted.get( this ) != null;
    }
    
    public Color getLabelBackgroundColor() {
        return isHighlighted() ? Color.yellow : Color.white;
    }
    
    public boolean isVisible( int zoomLevel ) {
        return ( zoomLevel >= getPriority() )  || isHighlighted();
    }
    
    
    public int hashCode() {
        return (int) id;
    }
    
    
    public String toString() {
        return "Feature : " + getName () + "\n" +
            "ID      : " + ID() + "\n" +
            "start   : " + getStart() + "\n" +
            "end     : " + getEnd();
    }
} 
