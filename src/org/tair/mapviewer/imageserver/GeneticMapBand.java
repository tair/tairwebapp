/*
 * $Id: GeneticMapBand.java,v 1.10 2005/12/06 00:28:22 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import java.awt.*;
import java.util.ArrayList;
import org.ncgr.util.*;

public class GeneticMapBand extends MapBand 
    implements Colors 
{
  
  public GeneticMapBand( ArrayList markers , 
			 int chromosome , 
			 double length , 
			 boolean isClassical , 
			 Logger logger )
    {
      super( chromosome , length , logger );
      
      addSubBand( new ScaleMapSubBand( "cM", 2 , logger ) );
      addSubBand( new RulerMapSubBand( "cM", 2 , logger ) );  
      addSubBand( new RangeMarkerMapSubBand( markers, 0, true, 2, GENETIC_MAP_COLOR , 
				     Color.black , true , isClassical , 
				     logger ) );
    } 
    
    private int [] myLevels = { 1 , 2 , 4 , 8 , 20, 40, 80 };
    public int [] getLevels()
    { 
        return myLevels;
    }
}
