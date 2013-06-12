/*
 *
 * $Id: AssemblyUnit.java,v 1.3 2005/12/06 00:28:39 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

/**
 * This is a type of PhysicalMap 
 */

public class AssemblyUnit extends PhysicalMap {

    private int status;
    private Direction direction;


    /**
     *  Constructor
     * @param ME the MappableEntity representing this AssemblyUnit.
     * @param units the unit type used in this Map.
     * @param start the beginning position of the AssemblyUnit.
     * @param end the end position of the AssemblyUnit.
     * @param location array of objects in this AssemblyUnit.
     * @param the chromosome this AssemblyUnit is found on.
     */
    public AssemblyUnit( MappableEntity ME,
                         String units,
                         double start,
                         double end,
                         Location[] location,
                         String chromosome
                         ) { 

        // pass parameters to parent class constructor
        super(ME, units, start, end, location, chromosome);
    }


    public int getStatus() {
        return this.status;
    }

    public Direction getDirection() {
        return direction;
    }

    public void setStatus(int status)  {
        this.status = status;
    }

    public void setDirection(int dir) {
        this.direction = Direction.fromInt(dir);
    }
  
    public void setDirection(Direction direction) {
        this.direction = direction;
    }
  
}





 
