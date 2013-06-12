/*
 *
 * $Id: ClassicMarker.java,v 1.5 2003/09/29 15:36:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

public class ClassicMarker extends Marker {
    
    private boolean isCloned_Marker;
    private boolean isRI_Marker;

    /**
     *  Constructors
     */
    public ClassicMarker( MappableEntity ME ) {
        super( ME );
    }
  
    public ClassicMarker( long id,
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

    public boolean isPosFromRI() {
        return this.isRI_Marker;
    }

    public void setPosFromRI_Marker( boolean is ) {
        this.isRI_Marker = is;
    }
}

