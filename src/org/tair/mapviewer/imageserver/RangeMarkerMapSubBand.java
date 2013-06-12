/*
 * $Id: RangeMarkerMapSubBand.java,v 1.10 2005/12/06 00:28:25 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import java.awt.*;
//import javax.swing.*; // for testing purposes

import java.util.*;
import java.text.*;
import org.ncgr.util.*;


/**
 *
 */
public class RangeMarkerMapSubBand extends MapSubBand
{   
    private ArrayList markers;
    
    protected final NumberFormat numberFormat = NumberFormat.getInstance();
    
    public RangeMarkerMapSubBand( ArrayList markerLocs,
				  int labelOrientation,
				  boolean showLocation,
				  int decimalPlaces,
				  Color mapColor,
				  Color textColor ,
				  boolean reportingMarkers ,
				  boolean isClassical ,
				  Logger logger )
    {
	super( mapColor , textColor , reportingMarkers , logger );
	
	markers = new ArrayList();
	//AliasServer aliasServer = FileAliasServer.getInstance();
	int size = markerLocs.size();
	for ( int i = 0; i < size; i++ ) {
	    CoordinateLocation location = 
		(CoordinateLocation) markerLocs.get(i);
	    String markerName = location.getMappableEntity().getName();

	    if ( !markerName.equals( "" )){
		RangeMarkerStub ms =
		    new RangeMarkerStub( location , isClassical );

		//ArrayList aliasList = aliasServer.getAlias(markerName, AliasServer.MARKER);
		ArrayList aliasList = ((Marker)(location.getMappableEntity())).getAliases();

		if(aliasList != null && aliasList.size() > 0){
		    ms.setAliasList(aliasList);
		    //logger.logMessage(markerName+"\t"+aliasList);
		}
		markers.add( ms );
	    }
	} 
	
	numberFormat.setMaximumFractionDigits( decimalPlaces );
	numberFormat.setMinimumFractionDigits( decimalPlaces );
    } // constructor
    
    
    public ArrayList getMapFeatures()
    {
	return markers;
    }
    
  
    public String getBandLabel()
    {
	return MarkerStub.MAP_LABEL;
    }
    
    public Color getLabelTextColor()
    {
	return getTextColor();
    }
    
    public Color getLabelBackColor()
    {
	return getMapColor() ;
    }
    
} 
