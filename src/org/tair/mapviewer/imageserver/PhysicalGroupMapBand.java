/*
 * $Id: PhysicalGroupMapBand.java,v 1.11 2005/12/06 00:28:24 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import java.util.ArrayList;
import org.ncgr.util.*;

public class PhysicalGroupMapBand extends MapBand
    implements Colors
{  
    public PhysicalGroupMapBand( ArrayList probes , ArrayList contigs , ArrayList clones ,
				 int chromosome , double length  , 
				 Logger logger )
    {
      super( chromosome , length , logger );
      
      addSubBand( new ScaleMapSubBand( "kb", 0 , logger ) );
      addSubBand( new RulerMapSubBand( "kb", 0 , logger ) );
    
      addSubBand( new ContigProbeMapSubBand( contigs, probes, 
					  PHYSICAL_MAP_COLOR , true , logger));
      //logger.logMessage("contigs in ContigProbeMapSubBand "+contigs.size());	
				  
      addSubBand( new CloneMapSubBand( clones, length , true , logger ) );
    } 

  private static int [] levels =
  { 1 , 2 , 4 , 8 , 20 , 40 , 80 , 200 };

  public int [] getLevels()
    {
      return levels;
    }
} 
