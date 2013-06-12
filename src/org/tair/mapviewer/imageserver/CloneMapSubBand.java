 /*
 * $Id: CloneMapSubBand.java,v 1.7 2005/12/06 00:28:22 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;

import java.util.*;
import java.awt.*;
import org.ncgr.util.*;

/** Horizontal extents affected by scale; vertical extents unaffected by scale.
 */
public class CloneMapSubBand extends MapSubBand 

{	
  ArrayList stubbedClones;
  
  public CloneMapSubBand( ArrayList cloneLocs,
		       double mapLength , 
		       boolean reporting , Logger logger )
    
    {
      super( Color.green.darker(), Color.black , reporting , logger );
      stubbedClones = new java.util.ArrayList();
      
      for( int i = 0 ; i < cloneLocs.size() ; ++ i )
	{
	  IntervalLocation il = (IntervalLocation) cloneLocs.get( i ); 
	  CloneStub cs = new CloneStub( il );
	  stubbedClones.add( cs  );
	}
    } // constructor
  
  public ArrayList getMapFeatures()
  {
    return stubbedClones;
  }
  
  public String getBandLabel()
    {
      return "Clones";
    }
	    
  public Color getLabelTextColor()
    {
      return Color.black;
    }

  public Color getLabelBackColor()
    {
      return Color.green.darker();
    }
    

} // class CloneMapSubBand
