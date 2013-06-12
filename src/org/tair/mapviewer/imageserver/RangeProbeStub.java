/*
 * $Id: RangeProbeStub.java,v 1.7 2005/12/06 00:28:25 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;

public class RangeProbeStub extends RangeMarkerStub 
    implements java.io.Serializable, Colors {

    private FeatureType featureType;

    /**
     *  Constructor
     */
    public RangeProbeStub( CoordinateLocation loc ) {
	super( loc , false );
	Probe probe = (Probe) loc.getMappableEntity( );
	featureType = probe.getFeatureType( );
    }
    

    /**
     * Overrides implementation of getFeatureType method
     * in RangeMarkerStub superclass to return the FeatureType
     * object associated with CoordinateLocation object received
     * in object constructor. This value is ultimately set in MapDBServer
     * population
     */
    public FeatureType getFeatureType( ) {
        return  featureType;
    }
} 
