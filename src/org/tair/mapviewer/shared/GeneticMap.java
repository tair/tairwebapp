/*
 *
 * $Id: GeneticMap.java,v 1.4 2003/09/10 17:20:19 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;


public class GeneticMap extends Map {

  /**
   * The constructor
   */
  public GeneticMap( Map map ) {
    super( map );
  }

  public GeneticMap( MappableEntity ME,
                     String units,
                     double start,
                     double end,
                     Location[] location,
                     String chromosome ) {
      super(ME, units, start, end, location, chromosome);
  }
    
}
