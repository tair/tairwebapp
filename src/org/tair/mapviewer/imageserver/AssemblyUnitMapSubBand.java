 /*
 * $Id: AssemblyUnitMapSubBand.java,v 1.4 2005/12/06 00:28:22 nam Exp $
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
public class AssemblyUnitMapSubBand extends MapSubBand 
{	
  ArrayList stubbedAssemblyUnits;
  
  public AssemblyUnitMapSubBand( ArrayList cloneLocs,
		       double mapLength , 
		       boolean reporting , Logger logger )
    
    {
      super( Color.green.darker(), Color.black , reporting , logger );
      stubbedAssemblyUnits = new java.util.ArrayList();
      
      for( int i = 0 ; i < cloneLocs.size() ; ++ i )
	{
	  IntervalLocation il = (IntervalLocation) cloneLocs.get( i ); 
	  AssemblyUnitStub cs = new AssemblyUnitStub( il );
	  stubbedAssemblyUnits.add( cs  );
	}
    } // constructor
  
  public ArrayList getMapFeatures()
  {
    return stubbedAssemblyUnits;
  }
  
  public String getBandLabel()
    {
      return "AnnotUnits";
    }
	    
  public Color getLabelTextColor()
    {
      return Color.black;
    }

  public Color getLabelBackColor()
    {
      return Color.green.darker();
    }
    

} // class AssemblyUnitMapSubBand
