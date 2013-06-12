/*
 *
 * $Id: CoordinateLocation.java,v 1.4 2003/09/10 17:20:18 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

public class CoordinateLocation extends PointLocation {

    private double position;
    private double confidence;

  
    public CoordinateLocation( MappableEntity ME,
                               boolean isAbsolute,
                               Location relativeTo,
                               double position, 
                               double confidence ) {
        super(ME, isAbsolute, relativeTo);
        this.position = position;
        this.confidence = confidence;
    }
  
    public double getPosition() {
        return this.position;
    }

    public double getConfidence() {
        return this.confidence;
    }

    public void setPosition(double position) {
        this.position = position;
    }

    public void setConfidence(double confidence) {
        this.confidence = confidence;
    }

}
