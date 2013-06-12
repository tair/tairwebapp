/*
 *
 * $Id: Probe.java,v 1.3 2003/09/29 15:36:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

public class Probe extends MappableEntity {

    private FeatureType type;
  
    
    /**
     *  Constructors
     */
    public Probe( MappableEntity ME ) {
        super( ME );
    }
  
    public Probe( long id,
                  int type,
                  String name,
                  String source ) {
        super( id, type, name, source );
    }

    public FeatureType getFeatureType() {
        return type;
    }

    public void setFeatureType( FeatureType type ) {
        this.type = type;
    }

}

