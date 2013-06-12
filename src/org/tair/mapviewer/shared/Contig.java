/*
 *
 * $Id: Contig.java,v 1.4 2003/09/10 17:20:18 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

public class Contig extends PhysicalMap {
    
    /**
     *  Constructor
     */
  public Contig( MappableEntity ME,
                 String units,
                 double start,
                 double end,
                 Location[] location,
                 String chromosome ) { 

      // pass parameters to parent class constructor
    super(ME, units, start, end, location, chromosome);
  }
}





 
