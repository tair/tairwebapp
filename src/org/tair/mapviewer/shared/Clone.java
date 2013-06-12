/*
 *
 * $Id: Clone.java,v 1.5 2005/12/06 00:28:39 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

/**
 * This is a type of PhysicalMap which is contained in
 * a Contig.
 */

public class Clone extends PhysicalMap {

    /**
     *  Clone sequencing status constants
     */
    public final static int INTENT_TO_SEQUENCE = 10;
    public final static int IN_PREPARATION = 20;
    public final static int SEQUENCING_BEGUN = 30;
    public final static int PRELIMINARY_SEQUENCE = 40;
    public final static int COMPLETE_SEQUENCE = 50;
    public final static int ANNOTATED_GB = 60;
  



    /**
     *  Constructor
     * @param ME the MappableEntity representing this Clone.
     * @param units the unit type used in this Map.
     * @param start the beginning position of the Clone.
     * @param end the end position of the Clone.
     * @param location array of objects in this Clone.
     * @param the chromosome this Clone is found on.
     */
    private int status;
    private Direction direction;

    public Clone( MappableEntity ME,
                  String units,
                  double start,
                  double end,
                  Location[] location,
                  String chromosome
                  ) { 
        // pass parameters to parent class constructor
        super(ME, units, start, end, location, chromosome);
    }

    // Clone interface methods
    public int getStatus() {
        return this.status;
    }

    public Direction getDirection() {
        return direction;
    }

    // Clone methods
    public void setStatus(int status) {
        this.status = status;
    }

    public void setDirection(int dir) {
        this.direction = Direction.fromInt(dir);
    }
  
    public void setDirection(Direction direction) {
        this.direction = direction;
    }
  
}





 
