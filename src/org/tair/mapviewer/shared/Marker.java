/*
 *
 * $Id: Marker.java,v 1.6 2003/09/29 15:36:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

import java.util.ArrayList;


public class Marker extends MappableEntity {

    private boolean isGeneticMarker;
    private double geneticPosition;
    private ArrayList aliases;
    
    /**
     *  Constructors
     */
    public Marker( MappableEntity ME ) {
        super( ME );
    }
    
    public Marker( long id,
                   int type,
                   String name,
                   String source
                   ) {
        super( id, type, name, source );
    }
    

    public boolean isGenetic() {
        return this.isGeneticMarker;
    }
    
    public void isGenetic( boolean is ) {
        this.isGeneticMarker = is;
    }
    
    public double getGeneticPosition() {
        return this.geneticPosition;
    }
    
    public void setGeneticPosition( double pos ) {
        this.geneticPosition = pos;
    }

    public ArrayList getAliases() {
        return aliases;
    }

    public void setAliases( ArrayList aliases ) {
        this.aliases = aliases;
    }


}

