/*
 * $Id: MarkerMapSubBand.java,v 1.9 2005/12/06 00:28:24 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;

import org.ncgr.util.*;
import java.util.*;
import java.awt.*;
//import javax.swing.*; // for testing purposes

import java.util.ArrayList;
import java.text.*;
//import org.tair.servlet.BioServlet; // for ServletDebug class

public class MarkerMapSubBand extends MapSubBand
{
 
  // this min height necessary to accomodate the map label w/o truncating it
 

  static final int FONT_Y_ADJUST = 2;
 
  int xStart;
  static int maxLabelWidth;
  int xLastLabeledFeature;
  int xLastLabelStart;

  public static int height;
	
  protected final ArrayList markers;
	
  protected final NumberFormat numberFormat = NumberFormat.getInstance();
  
  public Color getLabelTextColor()
    {
      return Color.black;
    }

  public Color getLabelBackColor()
    {
       return getMapColor();
    }

  public String getBandLabel()
    {
      return MarkerStub.MAP_LABEL;
    }

  public MarkerMapSubBand( ArrayList markerLocs,
			int labelOrientation,
			boolean showLocation,
			int decimalPlaces,
			Color mapColor,
			Color textColor ,
			boolean reportingMarkers ,
			boolean isClassical ,
			Logger logger)
    {
      super( mapColor , textColor , reportingMarkers , logger );

      markers = new ArrayList();
      for ( int i = 0; i < markerLocs.size(); i++ ) 
	{
	  CoordinateLocation location = 
	    (CoordinateLocation) markerLocs.get(i);
	  if ( location.getMappableEntity().getName().equals( "" ) == false )
	    {
	      MarkerStub ms =
		new MarkerStub( location , isClassical );
	      markers.add( ms );
	      maxLabelWidth = 
		Math.max( maxLabelWidth,
			  MapFont.get().getVerticalFontTextWidth( ms.getDisplayName() ) );
	    }
	} // for
      
      numberFormat.setMaximumFractionDigits( decimalPlaces );
      numberFormat.setMinimumFractionDigits( decimalPlaces );
    } // constructor
  
    public ArrayList getMapFeatures()
    {
      return markers;
    }


    /** @param exents The width and height of the visible drawing area. Allows 
	drawing to be optimized by not drawing items outside the extents area. 
	Also allows us to verify that the drawn map will fit within the visible 
	drawing area. (Graphics objects provide no way of determining visible 
	drawing area, only "user" clip area, which may be null).
    */

    public Dimension draw( Graphics g,
			   double start,
			   double end,
			   double pixelsPerUnit,
			   int zoomLevel,
			   Hashtable highlightedFeatureName ,
			   int w , 
			   int xStart , 
			   int xEnd ,
			   FeatureDescriptorCallback callback ,
			   FeatureDescriptorCallback parentCallback)
    {
      
      height = MarkerStub.getMaxHeight();

      int h = height;
      
      drawLabel( h, g , callback, parentCallback);
      
      
      
	// "FONT_HEIGHT / 2" shifts markers to that marker links point to the 
      // middle of the marker label
      
      g.translate( -xStart + getLabelWidth() , maxLabelWidth );
      
      // Draw a through line the middle of the marker lines
      
      int y = MarkerStub.getY();
      System.err.println("Where is y? " + y);
      
      int x = xStart;
      int xx = xEnd;// - ( FONT_HEIGHT / 2 );
      g.setColor( getMapColor() );
      g.drawLine( x, y - 1, xx, y - 1 );
      g.drawLine( x, y, xx, y );
      g.drawLine( x, y + 1, xx, y + 1 );
      
      y = MarkerStub.getHeight();
      
      // Draw markers

      // used to make sure marker labels do not overlap
      xLastLabelStart = xStart - MapFont.get().getVerticalFontHeight() - 1; 
      // used to prevent an unlabeled (gray) marker from being
      // drawn over a labeled marker
      xLastLabeledFeature = -1; 
      for (int i = 0; i < markers.size(); i++) 
	{
	  MarkerStub marker = (MarkerStub) markers.get( i );
	  marker.draw( g , 
		       start , end , 
		       xStart , xEnd ,
		       pixelsPerUnit , 
		       zoomLevel ,
		       this ,
		       callback ,
		       parentCallback, 
		       highlightedFeatureName ,
		       height );
	  
	  
	} // for i
      
      g.translate( xStart - getLabelWidth() , -maxLabelWidth );
      
      return new Dimension( w, h );
    } // draw()
  
} // class MarkerMapSubBand
