/*
 * $Id: ContigStub.java,v 1.5 2003/09/30 18:38:07 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import java.awt.*;

public class ContigStub extends MapFeature {

    public ContigStub( IntervalLocation loc ) {
        super( loc );
    }
 

    //
    // implement abstract methods from superclass
    //

    public String getDisplayName(){
        return getName();
    }

    public FeatureType getFeatureType() {
        return FeatureType.contig;
    }

    public int getThickness() {
        return 20;
    }

    public Color getFeatureColor() {
        return Color.green;
    }
    public Color getLabelColor() {
        return Color.black;
    }
    
}
