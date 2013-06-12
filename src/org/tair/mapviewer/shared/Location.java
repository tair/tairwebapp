/*
 *
 * $Id: Location.java,v 1.5 2003/09/29 15:36:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;


/**
 * Location is a base class to represent entities on a map.  Each Location
 * object contains info. on the entity being represented in a MappableEntity
 * object.
 */

public class Location {

    private boolean isAbsolute;
    private Location relativeTo;
    private MappableEntity mappableEntity;
    private int priority;
  
    /**
     *  Constructor for Location
     *  @param ME the MappableEntity to be positioned.
     *  @param isAbsolute  the boolean indicating whether position is absolute.
     *  @param relativeTo  the Locaton object this is relative to IF isAbsolute
     *                     is false.
     */
    public Location( MappableEntity ME, boolean isAbsolute, Location relativeTo ) { 
        this.mappableEntity = ME;
        this.isAbsolute = isAbsolute;
        this.relativeTo = relativeTo;
    }

    /**
     *  Returns true/false for position being absolute.
     *  @ return the boolean
     */
    public boolean isAbsolute() {
        return this.isAbsolute;
    }
 
    /**
     *  Returns the Location object that this Location is positioned relative
     *  to.. IF isAbsolute is false.
     *  @return  the Location relativeTo.
     */
    public Location getRelativeLocation() {
        return relativeTo;
    }

    /**
     *  Returns the MappableEntity this Location is positioning on a Map.
     *  @return the MappableEntity
     */
    public MappableEntity getMappableEntity() {
        return this.mappableEntity;
    }
    
    /**
     * Returns zoom value to show this Location object at.  If current zoom
     * level is less than this value, Location object will not be
     * drawn (for example, genes are only drawn when zoom value is > 200x )
     */
    public int getPriority() {
        return this.priority;
    }

    /**
     * Sets minimum zoom value to show this Location object at.
     */
    public void setPriority( int priority ) {
        this.priority = priority;
    }
}
