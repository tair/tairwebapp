/*
 *
 * $Id: PhysicalMap.java,v 1.4 2003/09/10 17:20:20 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

public class PhysicalMap extends Map {

    private int maxOrder;

  
    /**
     * The constructor
     */
    public PhysicalMap( Map map ) {
        super( map );
    }

    public PhysicalMap( MappableEntity ME,
                        String units,
                        double start,
                        double end,
                        Location[] location,
                        String chromosome ) {
        super( ME, units, start, end, location, chromosome );
    }
    
    /**
     * @return      The maximum ordinal value of Assignments
     */
    public int getMaxOrder() {
        return this.maxOrder;
    }
    
    /**
     * Set the maximum ordinal value of Assignments
     */
    public void setMaxOrder( int maxOrder ) {
        this.maxOrder = maxOrder;
    }

}
