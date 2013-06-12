/*
 *
 * $Id: IntervalLocation.java,v 1.5 2003/09/29 15:36:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

/**
 * IntervalLocation extends Location to provide specific assignment data
 * for a mappable entity. In addition to data contained in super class, 
 * IntervalLocation contains the entity's start position, and assignment
 * length.
 */


public class IntervalLocation extends Location {

    private double leftStart;
    private double range;

    
    /**
     * Creates an instance of IntervalLocation to represent position of
     * submitted MappableEntity.
     *
     * @param isAbsolute  the boolean indicating whether position is absolute.
     * @param relativeTo  the Locaton object this is relative to IF isAbsolute
     *                     is false.
     * @param leftStart Start position of entity on chromosome
     * @param range Length of entity on chromosome (?)
     */
    public IntervalLocation( MappableEntity ME,
                             boolean isAbsolute,
                             Location relativeTo,
                             double leftStart, 
                             double range
                             ) {

        super( ME, isAbsolute, relativeTo );
        this.leftStart = leftStart;
        this.range = range;
    }


    /**
     * Creates an instance of IntervalLocation to represent position of
     * submitted MappableEntity using position location in submitted
     * IntervalLocation. This is useful for creating a copy of IntervalLocation
     * to represent a different type of MappableEntity than the one currently
     * represented by submitted IntervalLocation (for instance, when creating
     * copies of existing genes for use as mutant genes on SequenceMap)
     *
     * @param MappableEntity entity to represent location for
     * @param IntervalLocation location IntervalLocation to copy data from
     */
    public IntervalLocation( MappableEntity me, IntervalLocation location ) {
        super( me, location.isAbsolute(), location.getRelativeLocation() );
        this.leftStart = location.getLeftStart();
        this.range = location.getRange();
    }
     

  
    /**
     * @return     the left end of the interval
     */
    public double getLeftStart() {
        return this.leftStart;
    }
  

    /**
     * @return     the length of the interval
     */
    public double getRange() {
        return this.range;
    }

    /**
     * Sets start position of left end of the interval
     */
    public void setLeftStart( double leftStart ) {
        this.leftStart = leftStart;
    }

    /**
     * Sets length of interval
     */
    public void setRange( double range ) {
        this.range = range;
    }

}


