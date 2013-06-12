/*
 *
 * $Id: RiMarker.java,v 1.5 2003/09/29 15:36:42 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

public class RiMarker extends Marker {

    private boolean isCloned_Marker;
    private boolean isPCR_Marker;

    /**
     *  Constructors
     */
    public RiMarker( MappableEntity ME ) {
        super( ME );
    }
  
    public RiMarker( long id,
                     int type,
                     String name,
                     String source ) {
        super( id, type, name, source );
    }

    public boolean isCloned() {
        return this.isCloned_Marker;
    }

    public void setCloned_Marker( boolean is ) {
        this.isCloned_Marker = is;
    }

    public boolean isPCR() {
        return this.isPCR_Marker;
    }

    public void setPCR_Marker( boolean is ) {
        this.isPCR_Marker = is;
    }
}

