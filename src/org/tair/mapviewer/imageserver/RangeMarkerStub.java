/*
 * $Id: RangeMarkerStub.java,v 1.8 2003/09/30 18:38:08 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import java.awt.*;

import org.tair.mapviewer.shared.*;


/**
 *
 */

public class RangeMarkerStub extends MapFeature 
    implements java.io.Serializable, Colors {

    private Color color;
    
    private MappableEntity me;
    

    public RangeMarkerStub( CoordinateLocation loc, boolean is_on_classic ) {
        super( loc );
        me = loc.getMappableEntity();

        if ( me instanceof Marker ) {
            setAliasList( ( (Marker)me ).getAliases() );
        }

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
    // implementations of abstract methods in MapFeature superclass
    //

    public Color getLabelColor() {
        return color;   
    }
    
    public Color getFeatureColor() {
        return color;
    }
    
    public int getThickness() {
        return 20;
    }
    
    public String getDisplayName() {
        if ( me instanceof RiMarker && ( (RiMarker) me ).isCloned() )  {
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

    
}
